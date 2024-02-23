/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : restful_crud

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 23/02/2024 14:01:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comments_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comments_post_id_foreign`(`post_id` ASC) USING BTREE,
  INDEX `comments_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 3, 2, 'Keren Ka Makasih Ilmunya, Tetap Semangat', '2024-02-22 04:19:55', '2024-02-22 04:19:55', NULL);
INSERT INTO `comments` VALUES (5, 3, 2, 'Komentar Ini Saya Update', '2024-02-22 04:42:36', '2024-02-22 06:03:20', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_02_20_021534_create_posts_table', 2);
INSERT INTO `migrations` VALUES (6, '2024_02_20_022307_create_comments_table', 3);
INSERT INTO `migrations` VALUES (7, '2024_02_23_062119_add_image_column_to_posts_table', 4);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'user login', '5e4577c4cbac0f8b3a184c1aada1d6a227f6f932648bc6644aec6db4aeb86047', '[\"*\"]', '2024-02-22 02:32:19', NULL, '2024-02-21 07:38:02', '2024-02-22 02:32:19');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 3, 'user login', '3eda1758710c646e7456646f26bfc6efc5253c46f424cb7050042531ffdd46ca', '[\"*\"]', '2024-02-22 02:32:00', NULL, '2024-02-22 02:24:07', '2024-02-22 02:32:00');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 3, 'user login', '0367fda2d5adb81695340c30533796afb774c9ae6dda81210cabc87d56aa0208', '[\"*\"]', '2024-02-23 06:57:16', NULL, '2024-02-22 02:32:28', '2024-02-23 06:57:16');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 3, 'user login', 'bcf258a7a7836ef2accf4b85dad54bff7cc0acf3be2ce70089471d8dee904624', '[\"*\"]', '2024-02-22 05:04:31', NULL, '2024-02-22 05:02:06', '2024-02-22 05:04:31');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 2, 'user login', '6680e12cb9ee881888fd13cdaa03c7d49792387f29e859fc6f046c8d9fc84a88', '[\"*\"]', '2024-02-22 05:14:24', NULL, '2024-02-22 05:05:06', '2024-02-22 05:14:24');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 2, 'user login', '3f9ea6691f192fd14212f144372ff55402262a3e187c14a9fe7b2af2504536a9', '[\"*\"]', '2024-02-22 06:03:20', NULL, '2024-02-22 06:02:57', '2024-02-22 06:03:20');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `news_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `posts_author_foreign`(`author` ASC) USING BTREE,
  CONSTRAINT `posts_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'Welcome To POrtal Berita', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae alias delectus obcaecati, a magnam natus sed nemo, quidem placeat accusamus vel enim ratione eum repellendus molestias voluptatem fugiat. Ad, eaque quam fuga doloribus provident animi mollitia necessitatibus sapiente commodi, laborum sunt fugit voluptate omnis magnam, minus pariatur veniam adipisci impedit voluptatum. Possimus dolore, delectus necessitatibus autem dolorum rem minima excepturi quibusdam tenetur? Aliquid consequuntur velit alias quisquam explicabo libero earum recusandae obcaecati minima iusto cum laudantium officia perspiciatis ex excepturi accusantium quam, nisi ducimus iure. Modi quis hic maiores quo id totam, deserunt debitis nihil necessitatibus velit, explicabo voluptatem est quos magni ut! Est sed quibusdam voluptatibus optio maiores ipsum nulla similique sit omnis iusto minus ad rerum, temporibus vel mollitia itaque velit suscipit nam amet veritatis dolorem porro asperiores eaque unde? Repellendus illum quasi qui et at recusandae rerum? Delectus harum facere sequi distinctio expedita inventore iure hic, illum eos vitae provident blanditiis maiores saepe odio a consequuntur eum, vel ratione nam non et repellat. Eius, dolorum maiores. Fugit repellendus pariatur velit neque quos fugiat voluptas itaque, suscipit vel magni eius earum accusantium odio nulla corrupti omnis incidunt perspiciatis rem commodi? Sapiente ipsa velit nisi perspiciatis porro eaque voluptatem aut molestiae, iusto numquam, inventore aspernatur. Quibusdam expedita vitae, dolore, quasi libero corrupti possimus incidunt maiores distinctio laboriosam quos impedit sint non provident recusandae velit minus accusamus asperiores architecto perferendis beatae animi? Ex, cumque saepe officiis reprehenderit reiciendis, recusandae doloribus nobis deserunt, veritatis in vero commodi distinctio. Natus minima rem, voluptate adipisci facere, sapiente excepturi saepe commodi nam, similique at obcaecati quos illo eligendi. Quis ipsa nobis dignissimos impedit minus at deserunt odit nostrum sed, corrupti aliquid perspiciatis quasi enim incidunt ducimus, aspernatur illum cumque blanditiis sint. Expedita, molestias quas! Non sint nesciunt laborum odit possimus neque illum corrupti voluptas.', 1, '2024-02-20 09:36:24', NULL, NULL);
INSERT INTO `posts` VALUES (2, 'Pengumuman', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae alias delectus obcaecati, a magnam natus sed nemo, quidem placeat accusamus vel enim ratione eum repellendus molestias voluptatem fugiat. Ad, eaque quam fuga doloribus provident animi mollitia necessitatibus sapiente commodi, laborum sunt fugit voluptate omnis magnam, minus pariatur veniam adipisci impedit voluptatum. Possimus dolore, delectus necessitatibus autem dolorum rem minima excepturi quibusdam tenetur? Aliquid consequuntur velit alias quisquam explicabo libero earum recusandae obcaecati minima iusto cum laudantium officia perspiciatis ex excepturi accusantium quam, nisi ducimus iure. Modi quis hic maiores quo id totam, deserunt debitis nihil necessitatibus velit, explicabo voluptatem est quos magni ut! Est sed quibusdam voluptatibus optio maiores ipsum nulla similique sit omnis iusto minus ad rerum, temporibus vel mollitia itaque velit suscipit nam amet veritatis dolorem porro asperiores eaque unde? Repellendus illum quasi qui et at recusandae rerum? Delectus harum facere sequi distinctio expedita inventore iure hic, illum eos vitae provident blanditiis maiores saepe odio a consequuntur eum, vel ratione nam non et repellat. Eius, dolorum maiores. Fugit repellendus pariatur velit neque quos fugiat voluptas itaque, suscipit vel magni eius earum accusantium odio nulla corrupti omnis incidunt perspiciatis rem commodi? Sapiente ipsa velit nisi perspiciatis porro eaque voluptatem aut molestiae, iusto numquam, inventore aspernatur. Quibusdam expedita vitae, dolore, quasi libero corrupti possimus incidunt maiores distinctio laboriosam quos impedit sint non provident recusandae velit minus accusamus asperiores architecto perferendis beatae animi? Ex, cumque saepe officiis reprehenderit reiciendis, recusandae doloribus nobis deserunt, veritatis in vero commodi distinctio. Natus minima rem, voluptate adipisci facere, sapiente excepturi saepe commodi nam, similique at obcaecati quos illo eligendi. Quis ipsa nobis dignissimos impedit minus at deserunt odit nostrum sed, corrupti aliquid perspiciatis quasi enim incidunt ducimus, aspernatur illum cumque blanditiis sint. Expedita, molestias quas! Non sint nesciunt laborum odit possimus neque illum corrupti voluptas.', 1, '2024-02-20 09:36:27', NULL, NULL);
INSERT INTO `posts` VALUES (3, 'Tutorial Html Untuk Pemula', NULL, 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facere esse inventore voluptatem eaque culpa provident repellat voluptate, alias itaque hic cupiditate dicta expedita laudantium necessitatibus animi nihil sit beatae debitis molestias ad nostrum! Debitis quod aut recusandae, beatae itaque sapiente iure quibusdam alias voluptate deleniti perspiciatis tempora ipsa neque nemo obcaecati. Aut in velit error dolore illo dicta? Culpa repudiandae voluptate dolores deleniti omnis dolor quaerat ipsum sit soluta laboriosam quam earum doloremque aspernatur provident, est, suscipit eum excepturi, dignissimos nihil pariatur perspiciatis sed explicabo sint qui? Quod commodi nisi repellendus debitis tempora necessitatibus rerum, iusto ab. Harum suscipit distinctio est illum dicta voluptatum eveniet quia magnam doloribus! Excepturi nisi ducimus eaque quasi amet sapiente corporis fugit adipisci cupiditate asperiores incidunt tenetur maxime, et deleniti placeat provident, itaque nulla eos ipsam officia earum non? Repudiandae, reiciendis dolores dignissimos dolorum sit voluptates assumenda sequi. Id eaque accusamus cupiditate expedita impedit eius consequatur veniam omnis consequuntur ducimus adipisci sint iure nulla dicta voluptate, aliquam molestiae ea et aut atque voluptatum ad, provident sunt nesciunt! Rem eius voluptates exercitationem adipisci modi quae porro explicabo earum praesentium libero velit, tenetur molestias. Porro nisi nulla quae quam sed exercitationem, fuga, magnam illum dolorum adipisci dolorem commodi atque autem repudiandae cupiditate dignissimos aut aliquid. Vitae, ex. Doloremque delectus necessitatibus minima unde enim impedit molestias a, ipsam quia eos iste, ut quas consectetur eius quo cupiditate dolor officia. Voluptatem eveniet laborum totam amet corporis illum velit eligendi? Natus vero, ab quos aut nihil nemo animi veniam aspernatur fugit, eligendi autem incidunt quia illo, similique laudantium doloribus reiciendis molestiae voluptatum placeat. Recusandae, nulla similique dolore illum, accusantium neque commodi, voluptatibus distinctio voluptatum maiores excepturi eius. In sit libero maxime reprehenderit? Harum excepturi, rerum saepe nesciunt animi tempora. Cupiditate pariatur vero obcaecati voluptates nihil harum doloribus voluptas explicabo ullam.', 1, '2024-02-22 02:09:12', '2024-02-22 02:09:12', NULL);
INSERT INTO `posts` VALUES (4, 'Tutorial Html Untuk Pemula', NULL, 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facere esse inventore voluptatem eaque culpa provident repellat voluptate, alias itaque hic cupiditate dicta expedita laudantium necessitatibus animi nihil sit beatae debitis molestias ad nostrum! Debitis quod aut recusandae, beatae itaque sapiente iure quibusdam alias voluptate deleniti perspiciatis tempora ipsa neque nemo obcaecati. Aut in velit error dolore illo dicta? Culpa repudiandae voluptate dolores deleniti omnis dolor quaerat ipsum sit soluta laboriosam quam earum doloremque aspernatur provident, est, suscipit eum excepturi, dignissimos nihil pariatur perspiciatis sed explicabo sint qui? Quod commodi nisi repellendus debitis tempora necessitatibus rerum, iusto ab. Harum suscipit distinctio est illum dicta voluptatum eveniet quia magnam doloribus! Excepturi nisi ducimus eaque quasi amet sapiente corporis fugit adipisci cupiditate asperiores incidunt tenetur maxime, et deleniti placeat provident, itaque nulla eos ipsam officia earum non? Repudiandae, reiciendis dolores dignissimos dolorum sit voluptates assumenda sequi. Id eaque accusamus cupiditate expedita impedit eius consequatur veniam omnis consequuntur ducimus adipisci sint iure nulla dicta voluptate, aliquam molestiae ea et aut atque voluptatum ad, provident sunt nesciunt! Rem eius voluptates exercitationem adipisci modi quae porro explicabo earum praesentium libero velit, tenetur molestias. Porro nisi nulla quae quam sed exercitationem, fuga, magnam illum dolorum adipisci dolorem commodi atque autem repudiandae cupiditate dignissimos aut aliquid. Vitae, ex. Doloremque delectus necessitatibus minima unde enim impedit molestias a, ipsam quia eos iste, ut quas consectetur eius quo cupiditate dolor officia. Voluptatem eveniet laborum totam amet corporis illum velit eligendi? Natus vero, ab quos aut nihil nemo animi veniam aspernatur fugit, eligendi autem incidunt quia illo, similique laudantium doloribus reiciendis molestiae voluptatum placeat. Recusandae, nulla similique dolore illum, accusantium neque commodi, voluptatibus distinctio voluptatum maiores excepturi eius. In sit libero maxime reprehenderit? Harum excepturi, rerum saepe nesciunt animi tempora. Cupiditate pariatur vero obcaecati voluptates nihil harum doloribus voluptas explicabo ullam.', 2, '2024-02-22 02:21:47', '2024-02-22 02:21:47', NULL);
INSERT INTO `posts` VALUES (5, 'Totorial Css Untuk Pemula', NULL, 'Isi Content Udah Diupdate', 3, '2024-02-22 03:10:13', '2024-02-22 03:14:24', '2024-02-22 03:14:24');
INSERT INTO `posts` VALUES (7, 'Tutorial Upload Image Dengan Api Laravel', 'BY06FqmodNOPmJasu91xOxF9fOvR3D.jpg', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facere esse inventore voluptatem eaque culpa provident repellat voluptate, alias itaque hic cupiditate dicta expedita laudantium necessitatibus animi nihil sit beatae debitis molestias ad nostrum! Debitis quod aut recusandae, beatae itaque sapiente iure quibusdam alias voluptate deleniti perspiciatis tempora ipsa neque nemo obcaecati. Aut in velit error dolore illo dicta? Culpa repudiandae voluptate dolores deleniti omnis dolor quaerat ipsum sit soluta laboriosam quam earum doloremque aspernatur provident, est, suscipit eum excepturi, dignissimos nihil pariatur perspiciatis sed explicabo sint qui? Quod commodi nisi repellendus debitis tempora necessitatibus rerum, iusto ab. Harum suscipit distinctio est illum dicta voluptatum eveniet quia magnam doloribus! Excepturi nisi ducimus eaque quasi amet sapiente corporis fugit adipisci cupiditate asperiores incidunt tenetur maxime, et deleniti placeat provident, itaque nulla eos ipsam officia earum non? Repudiandae, reiciendis dolores dignissimos dolorum sit voluptates assumenda sequi. Id eaque accusamus cupiditate expedita impedit eius consequatur veniam omnis consequuntur ducimus adipisci sint iure nulla dicta voluptate, aliquam molestiae ea et aut atque voluptatum ad, provident sunt nesciunt! Rem eius voluptates exercitationem adipisci modi quae porro explicabo earum praesentium libero velit, tenetur molestias. Porro nisi nulla quae quam sed exercitationem, fuga, magnam illum dolorum adipisci dolorem commodi atque autem repudiandae cupiditate dignissimos aut aliquid. Vitae, ex. Doloremque delectus necessitatibus minima unde enim impedit molestias a, ipsam quia eos iste, ut quas consectetur eius quo cupiditate dolor officia. Voluptatem eveniet laborum totam amet corporis illum velit eligendi? Natus vero, ab quos aut nihil nemo animi veniam aspernatur fugit, eligendi autem incidunt quia illo, similique laudantium doloribus reiciendis molestiae voluptatum placeat. Recusandae, nulla similique dolore illum, accusantium neque commodi, voluptatibus distinctio voluptatum maiores excepturi eius. In sit libero maxime reprehenderit? Harum excepturi, rerum saepe nesciunt animi tempora. Cupiditate pariatur vero obcaecati voluptates nihil harum doloribus voluptas explicabo ullam.', 3, '2024-02-23 06:50:22', '2024-02-23 06:50:22', NULL);
INSERT INTO `posts` VALUES (9, 'Tutorial Jquery Untuk Pemula', NULL, 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facere esse inventore voluptatem eaque culpa provident repellat voluptate, alias itaque hic cupiditate dicta expedita laudantium necessitatibus animi nihil sit beatae debitis molestias ad nostrum! Debitis quod aut recusandae, beatae itaque sapiente iure quibusdam alias voluptate deleniti perspiciatis tempora ipsa neque nemo obcaecati. Aut in velit error dolore illo dicta? Culpa repudiandae voluptate dolores deleniti omnis dolor quaerat ipsum sit soluta laboriosam quam earum doloremque aspernatur provident, est, suscipit eum excepturi, dignissimos nihil pariatur perspiciatis sed explicabo sint qui? Quod commodi nisi repellendus debitis tempora necessitatibus rerum, iusto ab. Harum suscipit distinctio est illum dicta voluptatum eveniet quia magnam doloribus! Excepturi nisi ducimus eaque quasi amet sapiente corporis fugit adipisci cupiditate asperiores incidunt tenetur maxime, et deleniti placeat provident, itaque nulla eos ipsam officia earum non? Repudiandae, reiciendis dolores dignissimos dolorum sit voluptates assumenda sequi. Id eaque accusamus cupiditate expedita impedit eius consequatur veniam omnis consequuntur ducimus adipisci sint iure nulla dicta voluptate, aliquam molestiae ea et aut atque voluptatum ad, provident sunt nesciunt! Rem eius voluptates exercitationem adipisci modi quae porro explicabo earum praesentium libero velit, tenetur molestias. Porro nisi nulla quae quam sed exercitationem, fuga, magnam illum dolorum adipisci dolorem commodi atque autem repudiandae cupiditate dignissimos aut aliquid. Vitae, ex. Doloremque delectus necessitatibus minima unde enim impedit molestias a, ipsam quia eos iste, ut quas consectetur eius quo cupiditate dolor officia. Voluptatem eveniet laborum totam amet corporis illum velit eligendi? Natus vero, ab quos aut nihil nemo animi veniam aspernatur fugit, eligendi autem incidunt quia illo, similique laudantium doloribus reiciendis molestiae voluptatum placeat. Recusandae, nulla similique dolore illum, accusantium neque commodi, voluptatibus distinctio voluptatum maiores excepturi eius. In sit libero maxime reprehenderit? Harum excepturi, rerum saepe nesciunt animi tempora. Cupiditate pariatur vero obcaecati voluptates nihil harum doloribus voluptas explicabo ullam.', 3, '2024-02-23 06:57:16', '2024-02-23 06:57:16', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin@email.com', 'admin', '$2y$10$MZ9ARBdZladMdMbfEK7uoOGR0fBVbxkccjh1mb6W1rCbXybCoB8ja', 'admin', 'admin', NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'jamil@email.com', 'Jamil', '$2y$10$MZ9ARBdZladMdMbfEK7uoOGR0fBVbxkccjh1mb6W1rCbXybCoB8ja', 'Firdaus', 'daus', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'karin@email.com', 'Karin', '$2y$10$MZ9ARBdZladMdMbfEK7uoOGR0fBVbxkccjh1mb6W1rCbXybCoB8ja', 'Aprilia', 'Aprilia', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
