<?php
/**
 * File name: DashboardController.php
 * Last modified: 19/07/21, 12:55 AM
 * Author: NearCraft - https://codecanyon.net/user/nearcraft
 * Copyright (c) 2021
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PracticeSet;
use App\Models\Question;
use App\Models\Quiz;
use App\Models\User;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:admin']);
    }

    /**
     * Admin dashboard statistics
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $stats = [
            [
                'key' => 'total_users',
                'title' => 'Нийт хэрэглэгч',
                'count' => User::active()->count()
            ],
            [
                'key' => 'total_questions',
                'title' => 'Нийт шалгалт',
                'count' => Question::active()->count()
            ],
            [
                'key' => 'total_quizzes',
                'title' => 'Нийт асуулт',
                'count' => Quiz::published()->count()
            ],
            [
                'key' => 'total_practice_sets',
                'title' => 'Нийт дасгал ажил',
                'count' => PracticeSet::published()->count()
            ]
        ];
        return Inertia::render('Admin/Dashboard', [
            'stats' => $stats
        ]);
    }
}
