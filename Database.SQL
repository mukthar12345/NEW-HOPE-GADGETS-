<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Database Schema - New Hope Gadgets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Roboto+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #3a86ff;
            --secondary: #ff006e;
            --accent: #8338ec;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #38b000;
            --warning: #ffbe0b;
            --gray: #6c757d;
            --light-gray: #e9ecef;
            --code-bg: #2d2d2d;
            --code-text: #f8f8f2;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            line-height: 1.6;
            color: var(--dark);
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            overflow-x: hidden;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        header {
            background: var(--dark);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo i {
            margin-right: 0.5rem;
            color: var(--primary);
        }

        h1 {
            text-align: center;
            margin: 2rem 0;
            color: var(--dark);
            font-size: 2.5rem;
        }

        h2 {
            margin: 2rem 0 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--primary);
            color: var(--dark);
        }

        h3 {
            margin: 1.5rem 0 0.8rem;
            color: var(--primary);
        }

        .intro {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.2rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .schema-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .code-block {
            background: var(--code-bg);
            color: var(--code-text);
            padding: 1.5rem;
            border-radius: 8px;
            overflow-x: auto;
            margin: 1.5rem 0;
            font-family: 'Roboto Mono', monospace;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .sql-keyword {
            color: #f92672;
        }

        .sql-table {
            color: #a6e22e;
        }

        .sql-comment {
            color: #75715e;
        }

        .sql-string {
            color: #e6db74;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 1.5rem 0;
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .table th {
            background: var(--primary);
            color: white;
            text-align: left;
            padding: 1rem;
        }

        .table td {
            padding: 0.8rem 1rem;
            border-bottom: 1px solid var(--light-gray);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        .table tr:nth-child(even) {
            background: var(--light);
        }

        .note {
            background: #fff9e6;
            border-left: 4px solid var(--warning);
            padding: 1rem;
            margin: 1.5rem 0;
            border-radius: 4px;
        }

        footer {
            text-align: center;
            margin-top: 3rem;
            padding: 2rem 0;
            color: var(--gray);
            border-top: 1px solid var(--light-gray);
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .code-block {
                padding: 1rem;
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <i class="fas fa-database"></i>
                New Hope Gadgets - Complete Database Schema
            </div>
        </div>
    </header>

    <div class="container">
        <h1>Complete Database Schema for New Hope Gadgets</h1>
        
        <div class="intro">
            This document provides the complete SQL database structure for your website. It includes tables for products, customers, orders, services, content, and everything else needed for your business.
        </div>

        <div class="schema-container">
            <h2>Core Tables</h2>
            
            <h3>Users Table</h3>
            <p>Stores all user information including customers and administrators.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">users</span> (
    user_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    username <span class="sql-keyword">VARCHAR</span>(50) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    email <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    password_hash <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    first_name <span class="sql-keyword">VARCHAR</span>(100),
    last_name <span class="sql-keyword">VARCHAR</span>(100),
    phone <span class="sql-keyword">VARCHAR</span>(20),
    address <span class="sql-keyword">TEXT</span>,
    city <span class="sql-keyword">VARCHAR</span>(100),
    state <span class="sql-keyword">VARCHAR</span>(100),
    postcode <span class="sql-keyword">VARCHAR</span>(20),
    country <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'Nigeria'</span>,
    role <span class="sql-keyword">ENUM</span>(<span class="sql-string">'admin'</span>, <span class="sql-string">'customer'</span>, <span class="sql-string">'staff'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'customer'</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    last_login <span class="sql-keyword">TIMESTAMP NULL</span>,
    is_active <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>
);
            </div>

            <h3>Categories Table</h3>
            <p>Stores product categories for organization.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">categories</span> (
    category_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    name <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    description <span class="sql-keyword">TEXT</span>,
    parent_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NULL</span>,
    image_url <span class="sql-keyword">VARCHAR</span>(500),
    sort_order <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    is_active <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (parent_id) <span class="sql-keyword">REFERENCES</span> categories(category_id) <span class="sql-keyword">ON DELETE SET NULL</span>
);
            </div>

            <h3>Products Table</h3>
            <p>Stores all product information including details, pricing, and inventory.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">products</span> (
    product_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    name <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    description <span class="sql-keyword">TEXT</span>,
    short_description <span class="sql-keyword">VARCHAR</span>(500),
    category_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    brand <span class="sql-keyword">VARCHAR</span>(100),
    model <span class="sql-keyword">VARCHAR</span>(100),
    condition <span class="sql-keyword">ENUM</span>(<span class="sql-string">'new'</span>, <span class="sql-string">'used'</span>, <span class="sql-string">'refurbished'</span>) <span class="sql-keyword">NOT NULL</span>,
    sku <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">UNIQUE</span>,
    price <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">NOT NULL</span>,
    compare_price <span class="sql-keyword">DECIMAL</span>(12, 2),
    cost <span class="sql-keyword">DECIMAL</span>(12, 2),
    quantity <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    reserve_quantity <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0, <span class="sql-comment">-- For items that are ordered but not yet shipped</span>
    weight <span class="sql-keyword">DECIMAL</span>(8, 2),
    dimensions <span class="sql-keyword">VARCHAR</span>(100),
    specs <span class="sql-keyword">JSON</span>,
    features <span class="sql-keyword">TEXT</span>,
    tags <span class="sql-keyword">VARCHAR</span>(500),
    is_featured <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">FALSE</span>,
    is_published <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>,
    views <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    created_by <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (category_id) <span class="sql-keyword">REFERENCES</span> categories(category_id),
    <span class="sql-keyword">FOREIGN KEY</span> (created_by) <span class="sql-keyword">REFERENCES</span> users(user_id)
);
            </div>

            <h3>Product Images Table</h3>
            <p>Stores multiple images for each product.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">product_images</span> (
    image_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    product_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    image_url <span class="sql-keyword">VARCHAR</span>(500) <span class="sql-keyword">NOT NULL</span>,
    alt_text <span class="sql-keyword">VARCHAR</span>(255),
    sort_order <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    is_primary <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">FALSE</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (product_id) <span class="sql-keyword">REFERENCES</span> products(product_id) <span class="sql-keyword">ON DELETE CASCADE</span>
);
            </div>

            <h3>Orders Table</h3>
            <p>Stores customer order information.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">orders</span> (
    order_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    user_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    order_number <span class="sql-keyword">VARCHAR</span>(50) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    total_amount <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">NOT NULL</span>,
    subtotal <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">NOT NULL</span>,
    tax_amount <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">DEFAULT</span> 0,
    shipping_amount <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">DEFAULT</span> 0,
    discount_amount <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">DEFAULT</span> 0,
    status <span class="sql-keyword">ENUM</span>(<span class="sql-string">'pending'</span>, <span class="sql-string">'confirmed'</span>, <span class="sql-string">'processing'</span>, <span class="sql-string">'shipped'</span>, <span class="sql-string">'delivered'</span>, <span class="sql-string">'cancelled'</span>, <span class="sql-string">'refunded'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'pending'</span>,
    payment_method <span class="sql-keyword">VARCHAR</span>(50),
    payment_status <span class="sql-keyword">ENUM</span>(<span class="sql-string">'pending'</span>, <span class="sql-string">'paid'</span>, <span class="sql-string">'failed'</span>, <span class="sql-string">'refunded'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'pending'</span>,
    shipping_address <span class="sql-keyword">TEXT</span>,
    billing_address <span class="sql-keyword">TEXT</span>,
    customer_note <span class="sql-keyword">TEXT</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (user_id) <span class="sql-keyword">REFERENCES</span> users(user_id)
);
            </div>

            <h3>Order Items Table</h3>
            <p>Stores individual items within each order.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">order_items</span> (
    order_item_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    order_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    product_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    quantity <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    unit_price <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">NOT NULL</span>,
    total_price <span class="sql-keyword">DECIMAL</span>(12, 2) <span class="sql-keyword">NOT NULL</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (order_id) <span class="sql-keyword">REFERENCES</span> orders(order_id) <span class="sql-keyword">ON DELETE CASCADE</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (product_id) <span class="sql-keyword">REFERENCES</span> products(product_id)
);
            </div>

            <h2>Services & Business Tables</h2>
            
            <h3>Services Table</h3>
            <p>Stores information about repair and other services offered.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">services</span> (
    service_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    name <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    description <span class="sql-keyword">TEXT</span>,
    category <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    base_price <span class="sql-keyword">DECIMAL</span>(10, 2) <span class="sql-keyword">NOT NULL</span>,
    estimated_time <span class="sql-keyword">VARCHAR</span>(50),
    is_active <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>
);
            </div>

            <h3>Service Requests Table</h3>
            <p>Stores customer service requests, mainly for repairs.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">service_requests</span> (
    request_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    user_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    service_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    device_type <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    brand <span class="sql-keyword">VARCHAR</span>(100),
    model <span class="sql-keyword">VARCHAR</span>(100),
    issue_description <span class="sql-keyword">TEXT</span> <span class="sql-keyword">NOT NULL</span>,
    status <span class="sql-keyword">ENUM</span>(<span class="sql-string">'submitted'</span>, <span class="sql-string">'diagnosing'</span>, <span class="sql-string">'waiting_approval'</span>, <span class="sql-string">'in_progress'</span>, <span class="sql-string">'completed'</span>, <span class="sql-string">'cancelled'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'submitted'</span>,
    quote <span class="sql-keyword">DECIMAL</span>(10, 2),
    final_cost <span class="sql-keyword">DECIMAL</span>(10, 2),
    technician_notes <span class="sql-keyword">TEXT</span>,
    customer_notes <span class="sql-keyword">TEXT</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (user_id) <span class="sql-keyword">REFERENCES</span> users(user_id),
    <span class="sql-keyword">FOREIGN KEY</span> (service_id) <span class="sql-keyword">REFERENCES</span> services(service_id)
);
            </div>

            <h3>Sell/Swap Submissions Table</h3>
            <p>Stores device information from customers who want to sell or swap.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">sell_swap_submissions</span> (
    submission_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    customer_name <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    customer_phone <span class="sql-keyword">VARCHAR</span>(20) <span class="sql-keyword">NOT NULL</span>,
    customer_email <span class="sql-keyword">VARCHAR</span>(255),
    device_type <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    brand <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    model <span class="sql-keyword">VARCHAR</span>(100) <span class="sql-keyword">NOT NULL</span>,
    condition <span class="sql-keyword">ENUM</span>(<span class="sql-string">'new'</span>, <span class="sql-string">'excellent'</span>, <span class="sql-string">'good'</span>, <span class="sql-string">'fair'</span>, <span class="sql-string">'broken'</span>) <span class="sql-keyword">NOT NULL</span>,
    storage <span class="sql-keyword">VARCHAR</span>(50),
    color <span class="sql-keyword">VARCHAR</span>(50),
    age <span class="sql-keyword">VARCHAR</span>(50),
    accessories <span class="sql-keyword">TEXT</span>,
    additional_details <span class="sql-keyword">TEXT</span>,
    images <span class="sql-keyword">JSON</span>, <span class="sql-comment">-- Stores URLs or paths to uploaded images</span>
    status <span class="sql-keyword">ENUM</span>(<span class="sql-string">'submitted'</span>, <span class="sql-string">'reviewed'</span>, <span class="sql-string">'accepted'</span>, <span class="sql-string">'rejected'</span>, <span class="sql-string">'completed'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'submitted'</span>,
    estimated_value <span class="sql-keyword">DECIMAL</span>(12, 2),
    final_offer <span class="sql-keyword">DECIMAL</span>(12, 2),
    staff_notes <span class="sql-keyword">TEXT</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>
);
            </div>

            <h2>Content Management Tables</h2>
            
            <h3>Pages Table</h3>
            <p>Stores website page content.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">pages</span> (
    page_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    title <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    slug <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    content <span class="sql-keyword">TEXT</span>,
    meta_title <span class="sql-keyword">VARCHAR</span>(255),
    meta_description <span class="sql-keyword">VARCHAR</span>(500),
    is_published <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>,
    created_by <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (created_by) <span class="sql-keyword">REFERENCES</span> users(user_id)
);
            </div>

            <h3>Blog Posts Table</h3>
            <p>Stores blog articles and news.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">blog_posts</span> (
    post_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    title <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    slug <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    excerpt <span class="sql-keyword">VARCHAR</span>(500),
    content <span class="sql-keyword">TEXT</span>,
    featured_image <span class="sql-keyword">VARCHAR</span>(500),
    author_id <span class="sql-keyword">INT</span> <span class="sql-keyword">NOT NULL</span>,
    is_published <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">FALSE</span>,
    published_at <span class="sql-keyword">TIMESTAMP NULL</span>,
    meta_title <span class="sql-keyword">VARCHAR</span>(255),
    meta_description <span class="sql-keyword">VARCHAR</span>(500),
    views <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>,
    <span class="sql-keyword">FOREIGN KEY</span> (author_id) <span class="sql-keyword">REFERENCES</span> users(user_id)
);
            </div>

            <h3>Testimonials Table</h3>
            <p>Stores customer testimonials for display on the website.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">testimonials</span> (
    testimonial_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    customer_name <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    customer_title <span class="sql-keyword">VARCHAR</span>(255),
    content <span class="sql-keyword">TEXT</span> <span class="sql-keyword">NOT NULL</span>,
    rating <span class="sql-keyword">INT</span> <span class="sql-keyword">CHECK</span> (rating >= 1 <span class="sql-keyword">AND</span> rating <= 5),
    image_url <span class="sql-keyword">VARCHAR</span>(500),
    is_approved <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">FALSE</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>
);
            </div>

            <h3>Contacts Table</h3>
            <p>Stores contact form submissions and inquiries.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">contacts</span> (
    contact_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    name <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    email <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    phone <span class="sql-keyword">VARCHAR</span>(20),
    subject <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">NOT NULL</span>,
    message <span class="sql-keyword">TEXT</span> <span class="sql-keyword">NOT NULL</span>,
    status <span class="sql-keyword">ENUM</span>(<span class="sql-string">'new'</span>, <span class="sql-string">'read'</span>, <span class="sql-string">'replied'</span>, <span class="sql-string">'closed'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'new'</span>,
    replied_at <span class="sql-keyword">TIMESTAMP NULL</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>
);
            </div>

            <h2>Additional Tables</h2>
            
            <h3>Coupons Table</h3>
            <p>Stores discount coupons and promotions.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">coupons</span> (
    coupon_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    code <span class="sql-keyword">VARCHAR</span>(50) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    description <span class="sql-keyword">TEXT</span>,
    discount_type <span class="sql-keyword">ENUM</span>(<span class="sql-string">'percentage'</span>, <span class="sql-string">'fixed'</span>) <span class="sql-keyword">DEFAULT</span> <span class="sql-string">'percentage'</span>,
    discount_value <span class="sql-keyword">DECIMAL</span>(10, 2) <span class="sql-keyword">NOT NULL</span>,
    min_order_amount <span class="sql-keyword">DECIMAL</span>(10, 2) <span class="sql-keyword">DEFAULT</span> 0,
    max_discount_amount <span class="sql-keyword">DECIMAL</span>(10, 2),
    start_date <span class="sql-keyword">DATE</span>,
    end_date <span class="sql-keyword">DATE</span>,
    usage_limit <span class="sql-keyword">INT</span>,
    used_count <span class="sql-keyword">INT</span> <span class="sql-keyword">DEFAULT</span> 0,
    is_active <span class="sql-keyword">BOOLEAN</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">TRUE</span>,
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>
);
            </div>

            <h3>Settings Table</h3>
            <p>Stores website configuration settings.</p>
            
            <div class="code-block">
<span class="sql-keyword">CREATE TABLE</span> <span class="sql-table">settings</span> (
    setting_id <span class="sql-keyword">INT</span> <span class="sql-keyword">AUTO_INCREMENT PRIMARY KEY</span>,
    setting_key <span class="sql-keyword">VARCHAR</span>(255) <span class="sql-keyword">UNIQUE NOT NULL</span>,
    setting_value <span class="sql-keyword">TEXT</span>,
    setting_group <span class="sql-keyword">VARCHAR</span>(100),
    created_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP</span>,
    updated_at <span class="sql-keyword">TIMESTAMP</span> <span class="sql-keyword">DEFAULT</span> <span class="sql-keyword">CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP</span>
);
            </div>

            <div class="note">
                <strong>Implementation Notes:</strong>
                <p>1. Run these SQL commands in your MySQL or PostgreSQL database.</p>
                <p>2. Make sure to create indexes on frequently queried columns for better performance.</p>
                <p>3. Always hash passwords before storing them in the users table.</p>
                <p>4. Regularly backup your database to prevent data loss.</p>
                <p>5. Consider adding soft delete functionality (is_deleted flag) to important tables.</p>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>New Hope Gadgets Complete Database Schema | Designed for your technology business</p>
            <p>© 2025 New Hope Gadgets. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
