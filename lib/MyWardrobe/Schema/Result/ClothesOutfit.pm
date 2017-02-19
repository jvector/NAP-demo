use utf8;
package MyWardrobe::Schema::Result::ClothesOutfit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyWardrobe::Schema::Result::ClothesOutfit

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<clothes_outfits>

=cut

__PACKAGE__->table("clothes_outfits");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 clothesid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 outfitid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "clothesid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "outfitid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 clothesid

Type: belongs_to

Related object: L<MyWardrobe::Schema::Result::Clothe>

=cut

__PACKAGE__->belongs_to(
  "clothesid",
  "MyWardrobe::Schema::Result::Clothe",
  { id => "clothesid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 outfitid

Type: belongs_to

Related object: L<MyWardrobe::Schema::Result::Outfit>

=cut

__PACKAGE__->belongs_to(
  "outfitid",
  "MyWardrobe::Schema::Result::Outfit",
  { id => "outfitid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-02-19 16:09:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4+raXM0XFeUTP9RGd4FA5A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
