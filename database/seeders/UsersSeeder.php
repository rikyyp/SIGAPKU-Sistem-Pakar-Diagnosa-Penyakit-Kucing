<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name' => 'Riky Yoga Perkasa',
            'username' => 'rikyyp',
            'email' => 'reyzzzazz@gmail.com',
            'password' => bcrypt('12345678'),
        ]);
    }
}
