package MyWardrobe::Controller::Wardrobe;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

MyWardrobe::Controller::Wardrobe -- Main Controller for MyWardrobe

=head1 DESCRIPTION


=head1 METHODS



=cut

sub list : Global {
    my ($self, $c) = @_;
    $c->stash(clothes => [$c->model('DB::Clothe')->all]);
    $c->stash(template=>'list.tt');
}

sub search : Global {
    my ($self, $c) = @_;
    my $search = $c->req->param('item');
    $c->stash(clothes => [$c->model('DB::Clothe')->search(name=>{'like', "%$search%"})]);
    $c->stash(template =>'list.tt');

}

    
=head1 AUTHOR

Victor Churchill,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
