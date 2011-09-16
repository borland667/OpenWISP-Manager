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

class CreateVlans < ActiveRecord::Migration
  def self.up
    create_table :vlans do |t|
      t.text :notes
      t.integer :output_band_percent
      t.integer :tag

      t.references :interface, :polymorphic => true

      t.belongs_to :bridge

      t.belongs_to :vlan_template

      t.timestamps
    end
  end

  def self.down
    drop_table :vlans
  end
end
