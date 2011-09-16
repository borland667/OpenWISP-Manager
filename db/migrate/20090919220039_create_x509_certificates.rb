# This file is part of the OpenWISP Manager
#
# Copyright (C) 2010 CASPUR (wifi@caspur.it)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class CreateX509Certificates < ActiveRecord::Migration
  def self.up
    create_table :x509_certificates do |t|
      t.string :dn, :null => false
      t.text :certificate, :null => false
      t.text :key, :null => false

      t.boolean :revoked, :default => false

      t.belongs_to :ca

      t.references :certificable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :x509_certificates
  end
end
