-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 01, 2024 lúc 05:00 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommercel9`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(21, NULL, '', '/storage/photos/6/BannerImage/banner1.png', NULL, 'active', '2023-12-14 23:36:27', '2023-12-14 23:59:30'),
(22, NULL, '-2312150222-902', '/storage/photos/6/BannerImage/banner2.png', NULL, 'active', '2023-12-15 00:02:22', '2023-12-15 00:17:14'),
(23, NULL, '-2312152052-902', '/storage/photos/6/BannerImage/banner3.png', NULL, 'active', '2023-12-15 00:20:52', '2023-12-15 00:20:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeBill` varchar(191) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(10, 'NEWBALANCE', 'newbalance', 'active', '2023-12-14 06:01:30', '2023-12-14 06:01:30'),
(8, 'NIKE', 'nike', 'active', '2023-12-14 06:00:59', '2023-12-14 06:00:59'),
(9, 'ADIDAS', 'adidas', 'active', '2023-12-14 06:01:17', '2023-12-14 06:01:17'),
(11, 'REEBOK', 'reebok', 'active', '2023-12-14 06:01:51', '2023-12-14 06:01:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 237500.00, 'new', 1, 237500.00, '2022-08-10 19:45:35', '2022-08-10 19:50:26'),
(4, 1, 2, 1, 300000.00, 'new', 2, 600000.00, '2022-08-10 19:52:22', '2022-08-10 21:25:53'),
(5, 5, 2, 1, 552000.00, 'new', 3, 1656000.00, '2022-08-10 19:53:03', '2022-08-10 21:25:53'),
(10, 6, 3, 1, 540000.00, 'new', 1, 540000.00, '2022-08-12 02:58:13', '2022-08-12 03:40:15'),
(11, 11, 3, 1, 395000.00, 'new', 1, 395000.00, '2022-08-12 03:39:32', '2022-08-12 03:40:15'),
(12, 10, 4, 1, 500000.00, 'new', 2, 1000000.00, '2022-08-12 03:44:32', '2022-08-12 03:45:08'),
(13, 1, 5, 1, 300000.00, 'new', 1, 300000.00, '2022-08-12 04:25:30', '2022-08-12 04:40:20'),
(14, 13, 5, 1, 850000.00, 'new', 1, 850000.00, '2022-08-12 04:25:48', '2022-08-12 04:40:20'),
(15, 13, 6, 1, 850000.00, 'new', 1, 850000.00, '2022-08-12 04:40:48', '2022-08-12 04:41:24'),
(16, 12, 6, 1, 350000.00, 'new', 1, 350000.00, '2022-08-12 04:40:53', '2022-08-12 04:41:24'),
(17, 15, NULL, 3, 540000.00, 'new', 2, 1080000.00, '2022-08-12 13:59:42', '2022-08-12 14:02:29'),
(18, 13, NULL, 4, 850000.00, 'new', 1, 850000.00, '2022-08-12 14:09:03', '2022-08-12 14:09:03'),
(19, 16, 7, 5, 500000.00, 'new', 3, 1500000.00, '2022-08-12 14:29:12', '2022-08-12 14:31:52'),
(21, 17, 8, 8, 200.00, 'new', 1, 200.00, '2023-12-14 12:12:45', '2023-12-14 12:21:29'),
(22, 17, NULL, 8, 200.00, 'new', 1, 200.00, '2023-12-15 09:12:50', '2023-12-15 09:12:50'),
(23, 22, NULL, 8, 115.00, 'new', 1, 115.00, '2023-12-15 09:12:59', '2023-12-15 09:12:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Skateboarding', 'newbalance', '<p>Skateboarding</p>', NULL, 1, NULL, NULL, 'active', '2023-12-14 05:37:36', '2023-12-15 07:36:28'),
(13, 'Basketball', 'basketball', '<p>Basketball<br></p>', NULL, 1, NULL, NULL, 'active', '2023-12-15 07:36:58', '2023-12-15 07:36:58'),
(10, 'Running', 'reebok', '<p>Running</p>', NULL, 1, NULL, NULL, 'active', '2023-12-14 05:36:47', '2023-12-15 07:36:09'),
(8, 'Classics', 'nike', '<p>Classics</p>', NULL, 1, NULL, NULL, 'active', '2023-12-14 05:32:56', '2023-12-15 07:35:16'),
(9, 'Gym & Training', 'adidas', '<p>Gym &amp; Training</p>', NULL, 1, NULL, NULL, 'active', '2023-12-14 05:34:17', '2023-12-15 07:35:49'),
(14, 'Football', 'football', '<p>Football<br></p>', NULL, 1, NULL, NULL, 'active', '2023-12-15 07:37:35', '2023-12-15 07:37:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'laravelshop', 'percent', 10.00, 'active', '2022-08-10 18:32:13', '2023-12-15 09:30:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Quốc Khánh', 'Nguyễn Khánh TV', 'admin@gmail.com', NULL, '1234567890', 'Adddddddddddddddđ', '2023-12-14 12:04:50', '2022-08-10 22:08:13', '2023-12-14 12:04:50'),
(2, 'Nguyễn Quốc Khánh', 'Giầy Nam', 'admin@gmail.com', NULL, '1234567890', 'Shop cần nhập thêm nhiều mẫu sản phẩm nữa thấy ít mẫu quá', '2023-12-14 12:04:43', '2022-08-12 14:34:46', '2023-12-14 12:04:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2022_08_06_140946_create_table_bill', 1),
(23, '2022_08_06_141010_create_table_billdetail', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fd0c6e84-6f01-4826-b0f8-6efce7b011e7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-du-lic-nam\",\"fas\":\"fa-star\"}', NULL, '2022-08-10 18:39:10', '2022-08-10 18:39:10'),
('9435998a-9c3c-43ba-a69b-97dae71c7584', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-10 19:50:26', '2022-08-10 19:50:26'),
('1da047ef-9f22-47d5-9324-c03936bbc1b1', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-10 21:25:53', '2022-08-10 21:25:53'),
('607302d8-9c76-459e-aa33-efa25a2cbc55', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-nam-jshsjhagagg\",\"fas\":\"fa-star\"}', NULL, '2022-08-10 22:06:17', '2022-08-10 22:06:17'),
('95c3d78c-4bd1-49b6-91a7-1e083dd4ab37', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/san-pham-nao-nen-mua\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-10 22:07:52', '2022-08-10 22:07:52'),
('2fa1db00-29fb-4ce5-b085-8a6bf478bf9f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-da-bong-san-co-nhan-tao-adidas-x-speedflow3\",\"fas\":\"fa-star\"}', NULL, '2022-08-12 03:33:16', '2022-08-12 03:33:16'),
('d8f2a6bb-5f34-4ef6-b5de-8fb6e3a2075a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 03:40:15', '2022-08-12 03:40:15'),
('a702ff71-b9e8-4f49-9b36-aaec3a398f9b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 03:45:08', '2022-08-12 03:45:08'),
('627921b8-2ae2-49bc-a9be-d15a891a81a9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 04:40:20', '2022-08-12 04:40:20'),
('704565a2-e290-48f7-a448-590df2627de8', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 04:41:24', '2022-08-12 04:41:24'),
('91a82990-9e61-4d64-83dc-a063acf68ff7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 14:31:52', '2022-08-12 14:31:52'),
('a7f4eacb-e3eb-471b-b2ac-682c45c0ffaf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-choi-bong-ro-protect-120\",\"fas\":\"fa-star\"}', NULL, '2022-08-12 14:33:04', '2022-08-12 14:33:04'),
('c7e7f38c-7569-46ed-87b5-76f650da5202', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/cac-mat-hang-dang-giam-gia-manh\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-12 14:33:53', '2022-08-12 14:33:53'),
('099f35bc-252c-441d-9b18-bc1d8faed588', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2023-12-14 12:21:29', '2023-12-14 12:21:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` decimal(18,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(8, 'ORD-B8NX3ODGGV', 8, 200.00, 1, NULL, 202.00, 1, 'cod', 'unpaid', 'new', 'Nguyễn', 'Phong', 'phongnq.22git@vku.udn.vn', '0123456789', 'Da Nang', '55555', 'Da Nang', '166 Ha Bong', '2023-12-14 12:21:28', '2023-12-14 12:21:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Never Done Making History', 'never-done-making-history', '<p>On a Saturday night in 19978, the Tigerbelles set a world record in the 880-yard relay - a historic moment for theteam and the first world record for Nike.<br></p>', '<p>On a Saturday night in 19978, the Tigerbelles set a world record in the 880-yard relay - a historic moment for theteam and the first world record for Nike.<br></p>', '<p>On a Saturday night in 19978, the Tigerbelles set a world record in the 880-yard relay - a historic moment for theteam and the first world record for Nike.</p>', '/storage/photos/6/BlogImage/blog2.jpg', 'NIKE', 1, NULL, 8, 'active', '2023-12-15 08:36:57', '2023-12-15 08:36:57'),
(5, 'The Definitive Adidas Forum Size Guide', 'the-definitive-adidas-forum-size-guide', '<p>Curious about where to start with adidas Forum sizin? Look no further to learn about how the iconic sneakers fit before even trying them on.<br></p>', '<p>Curious about where to start with adidas Forum sizin? Look no further to learn about how the iconic sneakers fit before even trying them on.<br></p>', '<p>Curious about where to start with adidas Forum sizin? Look no further to learn about how the iconic sneakers fit before even trying them on.</p>', '/storage/photos/6/BlogImage/blog3.jpg', 'ADIDAS', 1, NULL, 7, 'active', '2023-12-15 08:42:40', '2023-12-15 08:42:40'),
(6, 'Never Done Skateboarding', 'never-done-skateboarding', '<p>Rewind to 2002 and get a glimpse of Nike SB\'s journey from skateboarding outsider to cultural staple.<br></p>', '<p>Rewind to 2002 and get a glimpse of Nike SB\'s journey from skateboarding outsider to cultural staple.<br></p>', '<p>Rewind to 2002 and get a glimpse of Nike SB\'s journey from skateboarding outsider to cultural staple.</p>', '/storage/photos/6/BlogImage/blog1.jpg', 'NIKE', 1, NULL, 6, 'active', '2023-12-15 08:44:44', '2023-12-15 08:44:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bài viết mới', 'bai-viet-moi', 'active', '2022-08-10 21:48:14', '2022-08-10 21:48:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'KHSHSGSG', 'active', NULL, NULL, '2022-08-10 22:07:52', '2022-08-10 22:07:52'),
(2, 1, NULL, 'OK', 'active', NULL, NULL, '2022-08-12 14:33:53', '2022-08-12 14:33:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NIKE', 'apoahsh', 'active', '2022-08-10 21:48:26', '2023-12-15 08:26:00'),
(2, 'ADIDAS', 'sjystsg', 'active', '2022-08-10 21:48:34', '2023-12-15 08:26:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(17, 'Adidas Forum 84 Low', 'adidas-forum-84-low', '<p>Adidas Forum 84 Low White-Brown</p>', '<h3 style=\"text-align: center; \"><span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; white-space-collapse: preserve;\"><b>Fashionable Everyday Trainers with Bold Colorways</b></span></h3><h3 style=\"text-align: center;\"><span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; text-align: start; white-space-collapse: preserve;\">Sleek, stylish, and iconic are just a few words to describe the adidas Forum sneaker. Since its debut in the 1980s, the shoe has become a staple of street fashion. The signature X detail and iconic ankle strap cement the shoe\'s status as a classic. No matter your daily schedule, let your personality shine through with every step.</span></h3><h2 style=\"text-align: center; \"></h2><h1 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\"></h1><h3 style=\"text-align: center;\"><span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; white-space-collapse: preserve;\"><span style=\"font-weight: bolder;\">Detailed Information</span></span></h3><h3 style=\"text-align: center; margin: 24px 0px; word-break: break-word;\"><span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; white-space-collapse: preserve;\">- Fit:&nbsp;Regular fit</span><br></h3><h2 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">- Lacing:&nbsp;Lace-up and ankle strap</h2><h2 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">- Upper:&nbsp;Synthetic with polyurethane leather overlays</h2><h2 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\"> - Lining:&nbsp;Terry cloth</h2><h2 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">- Outsole:&nbsp;Rubber cupsole</h2><h2 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">- Color:&nbsp;Cloud White / Grey Two / Cloud White</h2><ul data-sourcepos=\"5:1-12:0\" style=\"margin: 4px 0px; padding-inline-start: 36px; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; text-align: start;\"></ul>', '/storage/photos/6/ProductImage/add1.jpg', 12, '35, 36, 37, 38, 39, 40, 41, 42', 'new', 'active', 200.00, 0.00, 0, 8, NULL, 9, '2023-12-14 11:16:43', '2023-12-15 07:39:42'),
(18, 'Adidas Samba Decon', 'adidas-samba-decon', '<p>Adidas Samba Decon</p><div><span style=\"font-family: var(--gl-body-font-set-family-functional-4),var(--gl-font-family-fallback); font-size: var(--gl-body-font-set-size-functional-4); font-style: var(--gl-body-font-set-style-functional-4); font-weight: var(--gl-body-font-set-weight-functional-4); letter-spacing: var(--gl-body-font-set-letterspacing-functional-4); text-transform: var(--gl-body-font-set-case-functional-4);\"><br></span></div><section data-testid=\"buy-section\" class=\"buy-section___ZPaYL gl-vspace-bpall-medium\" style=\"margin-top: var(--gl-spacing-0400); font-family: &quot;Noto Sans&quot;, AdihausDIN, Helvetica, Arial, sans-serif;\"></section>', '<h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><b>Classic sports trainer continues to make an impact in the modern fashion world.</b></h3><h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><span style=\"font-size: 16px; text-align: start;\">The adidas Samba is a stylish and innovative design. This version pays tribute to its heritage through classic design. From the feet of footballers to the high-fashion runway, the adidas Samba is a symbol of self-expression and simple yet cool style. Iconic details such as the 3-Stripes logo and T-toe shape speak for themselves. Add this versatile item to your wardrobe to add a touch of energy to your style.</span><div class=\"attachment-container search-images\" style=\"display: grid; gap: 8px; grid-template-columns: repeat(4, minmax(0px, 1fr)); margin: 16px 0px; font-size: 16px; text-align: start;\"><single-image _nghost-ng-c2844952263=\"\" ng-version=\"0.0.0-PLACEHOLDER\"><div _ngcontent-ng-c2844952263=\"\" hide-from-message-actions=\"\" class=\"image-container hide-from-message-actions ng-star-inserted\"><div _ngcontent-ng-c2844952263=\"\" class=\"overlay-container ng-star-inserted\" style=\"position: relative;\"><a _ngcontent-ng-c2844952263=\"\" target=\"_blank\" rel=\"noopener noreferrer\" externallink=\"\" aria-live=\"polite\" class=\"image-source-link ng-star-inserted\" _nghost-ng-c2425500107=\"\" jslog=\"181501;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_5e0b9cf71f5dab1b&quot;,&quot;c_f723a93c5442f680&quot;,null,&quot;rc_e1cac8d47e2b4021&quot;,null,null,&quot;vi&quot;,null,0,null,null,1]];mutable:true\" href=\"https://citishop.vn/giay-adidas-samba-og-white-black-gum-b75806\" style=\"color: var(--bard-color-primary);\"><span _ngcontent-ng-c2425500107=\"\" data-test-id=\"content\" class=\"ng-star-inserted\"></span></a></div></div></single-image></div></h3><div><h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><b>Specifications</b></h3><h3 style=\"text-align: center;\"><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Fit:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Regular fit<br></span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Laces:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Yes<br></span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Upper:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Leather<br></span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Lning:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Leather<br></span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Outsole:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Rubber<br></span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">- Color:</span><span style=\"font-size: 16px; text-align: left; white-space-collapse: collapse;\">&nbsp;Cloud White / Core Black / Grey One</span></h3><ul data-sourcepos=\"5:1-13:0\" style=\"margin: 4px 0px; padding-inline-start: 36px; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"></ul></div>', '/storage/photos/6/ProductImage/add2.jpg', 20, '35, 36, 37, 38, 39, 40, 41, 42', 'hot', 'active', 250.00, 0.00, 1, 11, NULL, 9, '2023-12-14 23:25:07', '2023-12-15 07:39:28'),
(21, 'Nike Full Force Low', 'nike-full-force-low', '<p>Nike Full Force Low</p>', '<p style=\"text-align: center; \"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\">A new shoe with old-school appeal—your retro dreams just came true. This pared-back design references the classic AF-1, then leans into \'80s style with throwback stitching and varsity-inspired colours. Not everything has to be a throwback, though—modern comfort and durability make them easy to wear any time, anywhere. Time to throw them on and go full force.</span></p><p style=\"text-align: center; \"></p><h3 style=\"text-align: center; \"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75); color: rgb(17, 17, 17); text-align: start;\"><b>Benefits</b></span></h3><p></p><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"></ul><p style=\"text-align: center; \"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\">- L</span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-size: 1rem; text-align: left;\">eather upper ages to soft perfection</span></p><p style=\"text-align: center; \"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-size: 1rem; text-align: left;\">- C</span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">hoose from a variety of varsity-inspired colourways to match every mood and look</span></p><p style=\"text-align: center; \"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">- E</span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">xposed foam lets you feel the softness running fully underfoot</span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\"><br></span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-size: 1rem; text-align: left;\"><br></span></p><h3 style=\"text-align: center;\"><b>Product details</b></h3><h3 style=\"text-align: center;\"><p style=\"font-size: 16px;\"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif;\">- F</span><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">oam midsole</span></p><p style=\"font-size: 16px;\"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">- Rubber outsole</span></p><p style=\"font-size: 16px;\"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">- Colour Shown: White/Pewter/Sail/Black</span></p><p style=\"font-size: 16px;\"><span style=\"color: rgb(17, 17, 17); font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; text-align: left;\">- Country/Region of Origin: Vietnam</span></p></h3>', '/storage/photos/6/ProductImage/add5.png', 17, '35, 36, 37, 38, 39, 40, 41, 42', 'hot', 'active', 95.00, 0.00, 0, 8, NULL, 8, '2023-12-15 01:17:12', '2023-12-15 01:17:12'),
(19, 'Adidas NMD R1', 'adidas-nmd-r1', '<p>Adidas NMD R1<br></p>', '<h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><b>Advanced NMD trainer made with Parley Ocean Plastic</b></h3><h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><span style=\"font-size: 16px; text-align: start;\">Urban explorers, get ready to set off. This adidas NMD_R1 is for you. It delivers superior comfort, so you can keep moving and follow the call of curiosity. All thanks to the adaptive Primeknit upper and responsive BOOST cushioning. A breakthrough take on the \'80s running shoe, this sleek and speedy look is perfect for any outfit and destination.</span></h3><h3 style=\"text-align: center; margin: 24px 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><div class=\"attachment-container search-images\" style=\"display: grid; gap: 8px; grid-template-columns: 1fr; margin: 16px 0px; font-size: 16px; text-align: start;\"><single-image _nghost-ng-c2844952263=\"\" ng-version=\"0.0.0-PLACEHOLDER\"><div _ngcontent-ng-c2844952263=\"\" hide-from-message-actions=\"\" class=\"image-container hide-from-message-actions ng-star-inserted\"><div _ngcontent-ng-c2844952263=\"\" class=\"overlay-container ng-star-inserted\" style=\"position: relative;\"><a _ngcontent-ng-c2844952263=\"\" target=\"_blank\" rel=\"noopener noreferrer\" externallink=\"\" aria-live=\"polite\" class=\"image-source-link ng-star-inserted\" _nghost-ng-c2425500107=\"\" jslog=\"181501;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_e9a0e75ba1ee5565&quot;,&quot;c_f723a93c5442f680&quot;,null,&quot;rc_5b2c1256541720e0&quot;,null,null,&quot;vi&quot;,null,0,null,null,1]];mutable:true\" href=\"https://giayadidas.com.vn/gz7924\" style=\"color: var(--bard-color-primary);\"><span _ngcontent-ng-c2425500107=\"\" data-test-id=\"content\" class=\"ng-star-inserted\"></span></a></div></div></single-image></div></h3><h3 style=\"margin: 24px 0px; white-space-collapse: preserve; text-align: center; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><b>Specifications</b></h3><div style=\"text-align: center; \">- Fit: Regular fit</div><div style=\"text-align: center; \">- Laces: Yes</div><div style=\"text-align: center; \">- Upper: Primeknit</div><div style=\"text-align: center; \">- Lining: Primeknit</div><div style=\"text-align: center; \">- Midsole: BOOST</div><div style=\"text-align: center; \">- Outsole: Rubber</div><div style=\"text-align: center; \">- Upper fabric contains 50% Parley Ocean Plastic</div><div style=\"text-align: center; \">- Product contains a total of at least 70% recycled material</div><div style=\"text-align: center; \">- Color:&nbsp;<span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 1rem;\">White Tint / Glory Red / Semi Lucid Blue</span></div>', '/storage/photos/6/ProductImage/add3.png', 30, '35, 36, 37, 38, 39, 40, 41, 42', 'new', 'active', 250.00, 0.00, 0, 9, NULL, 9, '2023-12-15 00:39:46', '2023-12-15 00:44:31'),
(20, 'Nike Air Force 1 \'07', 'nike-air-force-1-07', '<p>Nike Air Force 1 \'07</p>', '<h3 style=\"text-align: center; box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span class=\"headline-5\" style=\"box-sizing: inherit; line-height: calc(1.75);\"><b>LEGENDARY STYLE REFINED</b></span></h3><ul style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; list-style: none; color: rgb(17, 17, 17);\"></ul><p style=\"text-align: center; box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">The radiance lives on in the Nike Air Force 1 \'07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.</p><p style=\"text-align: center; box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><br></p><p style=\"text-align: center; box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><b style=\"font-size: 1.75rem;\">Benefits</b></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">- T<span style=\"font-size: 1rem; text-align: left;\">he stitched overlays on the upper add heritage style, durability and support.</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- O</span><span style=\"font-size: 1rem; text-align: left;\">riginally designed for performance hoops, the Nike Air cushioning adds lightweight, all-day comfort.</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- T</span><span style=\"font-size: 1rem; text-align: left;\">he low-cut silhouette adds a clean, streamlined look.</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- T</span><span style=\"font-size: 1rem; text-align: left;\">he padded collar feels soft and comfortable.</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\"><br></span></p><div><h3 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: inherit; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><b>Product Details</b></h3></div><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\">- F<span style=\"font-size: 1rem; text-align: left;\">oam midsole</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- P</span><span style=\"font-size: 1rem; text-align: left;\">erforations on the toe</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- R</span><span style=\"font-size: 1rem; text-align: left;\">ubber sole</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\">- C</span><span style=\"font-size: 1rem; text-align: left;\">olour Shown: White/White</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"text-align: left;\">- Country/Region of Origin: Vietnam,India</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><span style=\"font-size: 1rem; text-align: left;\"><br></span></p><div><h3 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: inherit; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><b>Air Force 1 Origins</b></h3><h3 style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: inherit; text-align: center; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-family: &quot;Helvetica Now Text&quot;, Helvetica, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(17, 17, 17);\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 16px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline;\"><span style=\"text-align: start;\">Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.</span><br></p></h3></div>', '/storage/photos/6/ProductImage/add4.jpeg', 10, '35, 36, 37, 38, 39, 40, 41, 42', 'hot', 'active', 115.00, 0.00, 0, 8, NULL, 8, '2023-12-15 00:48:43', '2023-12-15 00:57:23'),
(22, 'Air Jordan 1 Low', 'air-jordan-1-low', '<p>Air Jordan 1 Low</p>', '<h3 style=\"text-align: center; \"><br></h3>', '/storage/photos/6/ProductImage/add6.jpg', 30, '35, 36, 37, 38, 39, 40, 41, 42', 'new', 'active', 115.00, 0.00, 0, 8, NULL, 8, '2023-12-15 07:12:45', '2023-12-15 07:12:45'),
(23, 'ALD x New Balance 550', 'ald-x-new-balance-550', '<p>ALD x New Balance 550<br></p>', NULL, '/storage/photos/6/ProductImage/add7.jpg', 30, '35, 36, 37, 38, 39, 40, 41, 42', 'new', 'active', 130.00, 0.00, 0, 8, NULL, 10, '2023-12-15 07:21:50', '2023-12-15 07:38:42'),
(24, 'NB Numeric 480 High', 'nb-numeric-480-high', '<p>NB Numeric 480 High<br></p>', NULL, '/storage/photos/6/ProductImage/add8.png', 16, '35, 36, 37, 38, 39, 40, 41, 42', 'default', 'active', 110.00, 0.00, 0, 11, NULL, 10, '2023-12-15 07:28:32', '2023-12-15 07:30:26'),
(25, 'Reebok BB4000 Mid', 'reebok-bb4000-mid', '<p>Reebok BB4000 Mid<br></p>', NULL, '/storage/photos/6/ProductImage/add9.png', 5, '35, 36, 37, 38, 39, 40, 41, 42, 43', 'default', 'active', 90.00, 0.00, 0, 13, NULL, 11, '2023-12-15 08:01:55', '2023-12-15 08:04:32'),
(26, 'Nike Metcon 9 AMP', 'nike-metcon-9-amp', '<p>Nike Metcon 9 AMP<br></p>', NULL, '/storage/photos/6/ProductImage/add10.png', 8, '35, 36, 37, 38, 39, 40, 41, 42, 43', 'default', 'active', 200.00, 0.00, 0, 9, NULL, 8, '2023-12-15 08:07:56', '2023-12-15 08:07:56'),
(27, 'Predator Egde 1', 'predator-egde-1', '<p>Predator Egde 1<br></p>', NULL, '/storage/photos/6/ProductImage/add11.png', 21, '35, 36, 37, 38, 39, 40, 41, 42, 43', 'hot', 'active', 250.00, 0.00, 0, 14, NULL, 9, '2023-12-15 08:12:07', '2023-12-15 08:12:07'),
(28, 'Fresh Foam X 860v13', 'fresh-foam-x-860v13', '<p>Fresh Foam X 860v13<br></p>', NULL, '/storage/photos/6/ProductImage/add12.jpg', 3, '35, 36, 37, 38, 39, 40, 41, 42, 43', 'default', 'active', 140.00, 0.00, 0, 10, NULL, 10, '2023-12-15 08:17:44', '2023-12-15 08:17:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'LaravelShop', 'Kick It Up a Notch', '/storage/photos/1/Settings/logo.png', '/storage/photos/1/Settings/footer-logo.png', 'Da Nang', '0123456789', 'laravelshop@gmail.com', NULL, '2023-12-14 06:15:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giao Hàng Tiết Kiệm', 2.00, 'active', '2022-08-10 18:31:15', '2023-12-14 12:18:55'),
(2, 'Giao Hàng Nhanh', 3.00, 'active', '2022-08-10 18:31:36', '2023-12-14 12:19:27'),
(3, 'Giao hàng hỏa tốc', 8.00, 'active', '2022-08-10 18:31:53', '2023-12-14 12:20:25'),
(4, 'VN EXPRESS', 5.00, 'active', '2022-08-12 13:56:51', '2023-12-14 12:19:55'),
(5, 'Việt Nam POST', 7.00, 'active', '2022-08-12 14:24:43', '2023-12-14 12:20:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Nguyễn Quang Phong', 'user@gmail.com', NULL, '$2y$10$ZhmX6MxNf4iIQb6uUKyoUuFeyNR6/kLjIpSUSyupSjsaEABhxrC8a', NULL, 'user', NULL, NULL, 'active', NULL, '2023-12-14 12:05:57', '2023-12-14 12:05:57'),
(7, 'Trần Nhật Lam', 'admin2@gmail.com', NULL, '$2y$10$IakHNG/CYT8X7xSKDfkg2O2UIVzL.d2RIUWC9wVXMM6o.nw/fYmym', '/storage/photos/6/The Neon Shallows.png', 'admin', NULL, NULL, 'active', NULL, '2023-12-14 05:29:33', '2023-12-14 05:29:33'),
(6, 'Nguyễn Đinh Duy Thái', 'admin@gmail.com', NULL, '$2y$10$yHTlI/b2PBU8HLvjLg0P9.zxvauMnoQQFxvxoFZB6cmtzV.lyxCcS', '/storage/photos/1/Users/IMG_E6878.JPG', 'admin', NULL, NULL, 'active', 'clNDxhorMchgupdyKdvoNsXkE99ZKYu8lPrhyB3K1z6oNmlMoOZU9o5RlE7I', '2023-12-14 05:26:37', '2023-12-14 05:27:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 6, 7, 2, 540000.00, 1, 540000.00, '2022-08-10 22:06:24', '2022-08-10 22:07:21'),
(4, 13, 14, 1, 850000.00, 1, 850000.00, '2022-08-12 04:25:45', '2022-08-12 04:25:48'),
(6, 16, 19, 5, 500000.00, 1, 500000.00, '2022-08-12 14:29:06', '2022-08-12 14:29:12'),
(8, 17, 20, 8, 200.00, 1, 200.00, '2023-12-14 12:06:15', '2023-12-14 12:11:34'),
(9, 23, 22, 8, 130.00, 1, 130.00, '2023-12-15 09:09:15', '2023-12-15 09:12:50'),
(10, 22, 22, 8, 115.00, 1, 115.00, '2023-12-15 09:09:22', '2023-12-15 09:12:50');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billdetail_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
