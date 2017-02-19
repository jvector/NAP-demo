package MyWardrobe::Controller::Uploader;
use Moose;
use Text::CSV;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

MyWardrobe::Controller::Uploader Upload Controller for MyWardrobe

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 upload

Processes a single file data upload

=cut

sub upload : Global {
        my ($self, $c) = @_;
	my $target;
        if ( $c->request->parameters->{form_submit} eq 'yes' ) {

            if ( my $upload = $c->request->upload('upload_file') ) {

                my $filename = $upload->filename;
                $target   = "/tmp/$filename";

                unless ( $upload->link_to($target) || $upload->copy_to($target) ) {
		    warn ( "Failed to copy '$filename' to '$target': $!" );
		    $c->stash(error_msg => $!);
		    $c->forward('error');
                }
            }
	    warn "file uploaded to $target";
	    # process the upload...
	    my $csv = Text::CSV->new ({ binary => 1 });
	    open my $io, "<", $target or die "$target: $!";
	    while (my $row = $csv->getline ($io)) {
		my ($item_name, $item_cat) = @$row;
		my $this_cat = $c->model('DB::Category')->find_or_create({name=>$item_cat});
		$c->model('DB::Clothe')->update_or_create({name=>$item_name, categoryid=>$this_cat->id});
	    }	    
        }
	$c->forward('list');
}

sub error : Local {
    my ($self, $c) = @_;
        $c->stash(template=>'oops.tt');
}
    
=head1 AUTHOR

Victor Churchill,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
