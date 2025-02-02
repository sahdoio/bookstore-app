<?php

use App\Http\Auth\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/login', [AuthController::class, 'login'])->name('api-login');

Route::get('/user', function (Request $request) {
    return $request->user();
});
