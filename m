Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F32E7384
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137357; cv=none; b=bLP5Sly0pbsc+FvffAbv/ReGV1lpYFuAeRO7g5Vawe7/yR1XxVW8wJ9gW+0i9xIa8Ef/HfE4XTdyKy41SxliWC3Lq4bmhINkYk1+z6bB2vx0xAxVdbIgbqeGd7UDlhdF9vefydKN9SBmIwL8hgq86ssGNLmxylfJrqgkAhrAWT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137357; c=relaxed/simple;
	bh=WoMrKkn7rdYr5Imx1iey6XtaU2Nnwdr0JBIqWfcWzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZywcyfOzUpeqzkYgLf4eleET6DeNodA1bGN31rNdPaAnes2rlCX9qHqRmOW+Lu/Ta/jjxlbhoYoSppNe9ohi/dCBCJSKYN8JGb/Jqnj4rj1VP3RjASpmM4n2Posb/aTpuLnG/ihRCDTHUX3xLKfWo7ZPG8HY+nlFLL17kwaSAok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiy78G5y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiy78G5y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3c37877so928343a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137356; x=1789742156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CAF1AyJzEXRi17wzAYu3TkYA3d413Tq6GeGUnMS210s=;
        b=eiy78G5y+e/4i7ENAL+ylKJLE1m6AoGPFaojjPdU5kVA6PlOGE4Ph/b/pZ/jyUwIGk
         pzwLv5wxck3lFHTOngE+Qy2c/UHmpkDa1ZiV/1yYZtsbu2zcNr29oMMdnE1FJA1nu4lc
         V+JI7g3Wni/gv2iYTi2yYfaL/DQqVioUT5B6AXYBJ0MHDwAvetlKHQ0TnsVXerJAbbgU
         n/JpRe3/P6VIT6u45lJBi4DnpeBJeNGA7HjB6IcEQM/j8z8YRfqNIVu2KqTcrH1J1Bsp
         r0+muQE5c0xsLkFwd4grGd/N4YK65K9REJnZUDA0TUwFbbQ+kqbR9YOM8Ua0FI+kWqoJ
         VVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137356; x=1789742156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAF1AyJzEXRi17wzAYu3TkYA3d413Tq6GeGUnMS210s=;
        b=VRYYurCTm9Y+5jTr08ouxaSBYb5wpee4R+RF1uUyLcelqJPG/RY9oEIzoSWK8pFQyw
         jUMli60O4SpVG05tipfJvGomfDb0M13VVHBD8b8pnpX0Sf17X77spuKZ+IHjz6hCT2PR
         59L2V8LUTL7X4ktpXC2tI96Zu1H6gEs1NZgTzqTKlpv21rVqkHvhS+GQcvBdovQ3qyBv
         JrQv4wk1SEkWEfUeEj/mqYrduQa3SzD10Ltg1aXkIlkWJ7vDna6KV0fbFE1L0EnowlkY
         +fh4KwNjoolb4viDePhbHJgVGzSeBKOCC0ZzjMmXSGgpvrq46DkDb0VpvjPcgnGy6rwj
         /L5A==
X-Gm-Message-State: AFuF++kVHH3rNjj7UYv/D5rBX3jSlV6/q4V/yOk1jbFfgXNOD1zkLYKm
	XIjEzTVIcbe5bFcdprIK3plZkuU6Zdq5xquEtMKD0ZIq+XOf5QDtKH7Q9rXy3A==
X-Gm-Gg: AYBFou1oQ7lt5JzJ6hry6UIsbiMOvQpcJE6DXSrXmiRUrNBQBKnagx7btapZwE8FYgx
	mVEykmPlqskNAJvEivztRyOsZeaX+UfIQpMCrBYkQG0ms6LXIM3cea2XoNrbPzb7PHm4M1GQqXs
	benUscQUOqjVC+sNl5zeFkNwuzJApf3a1hY61/BwJ+KU1WvQtcszo9pwQ0Jan0qeCgcg7rpjwBv
	fi7xQISZx/cp14fsZ/OpvDRqNIjX91SLlZgUxl644+vBHxyuQlKGabZ1+soORE6x5ND4bcBn1zy
	rue9vi32jqQVoWH8GtpBVAEP7ae2FYZEDbSGNAyQEOVcya2a2n5swVYrNWqtmgT1dm3t7MVVDiK
	4nH0HPv4TmTg96jj9v5CCd6CgSmlYBA6A/MCZjHheYaYhGDRgAXMmDPT6umx336+dc5kqQ0MVX4
	CHWVKnWOJkspaSL5HCLHW2piiXMHJlS8dlqLqt/1IpckLyqLG5HE8RFvB+7NgjsKk6ib9liOE9T
	ojcoDkIBz6I0UT7bsLGYuyE45//ckTkCZ0axBBQNhyhjs9dZWCekdKkvUa98CpGWejwhUVJxu9z
	Agt+JpRuF2vuKAambAWcDQ==
X-Received: by 2002:a17:90b:4a8c:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39d9c3891d8mr7572423a91.25.1789137355496;
        Fri, 11 Sep 2026 07:35:55 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:4a5b:802b:c0b:d1d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm7156371eec.25.2026.09.11.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:35:54 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] f2fs: use BIT_ULL for mount option bitmasks
Date: Fri, 11 Sep 2026 07:35:48 -0700
Message-ID: <20260911143549.909867-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Although f2fs_mount_info.opt and f2fs_fs_context.opt_mask are declared as
unsigned long long (64 bits), the option bit manipulation macros
(clear_opt, set_opt, test_opt) and context helpers (ctx_set_opt,
ctx_clear_opt, ctx_test_opt) use BIT(), which expands to (UL(1) << nr).

On 32-bit architectures, sizeof(unsigned long) is 32 bits, causing shift
count overflow warnings and functional truncation if mount option indices
reach or exceed 32.

Replace BIT() with BIT_ULL() for mount option bitmasks and helpers.
Additionally, introduce ctx_clear_opt_mask() and ctx_test_opt_mask()
helpers to avoid open-coded bitwise manipulations on ctx->opt_mask.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609111633.uyRbsEUB-lkp@intel.com/
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2:
 - Newly added in v2 to fix 32-bit shift count overflow reported by
   the kernel test robot, and introduce ctx_{test,clear}_opt_mask() helpers.
---
 fs/f2fs/f2fs.h  |  6 +++---
 fs/f2fs/super.c | 40 ++++++++++++++++++++++++++--------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 62efc25cd107..4aaf29de3f6f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -149,11 +149,11 @@ enum f2fs_mount_opt {
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt &= ~BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt &= ~BIT_ULL(F2FS_MOUNT_##option))
 #define set_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt |= BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt |= BIT_ULL(F2FS_MOUNT_##option))
 #define test_opt(sbi, option)		\
-	(F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
+	(F2FS_OPTION(sbi).opt & BIT_ULL(F2FS_MOUNT_##option))
 
 #define ver_after(a, b)	(typecheck(unsigned long long, a) &&		\
 		typecheck(unsigned long long, b) &&			\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f96abecb3c55..a5e109bdcebc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -420,21 +420,33 @@ struct f2fs_fs_context {
 static inline void ctx_set_opt(struct f2fs_fs_context *ctx,
 			       enum f2fs_mount_opt flag)
 {
-	ctx->info.opt |= BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt |= BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline void ctx_clear_opt(struct f2fs_fs_context *ctx,
 				 enum f2fs_mount_opt flag)
 {
-	ctx->info.opt &= ~BIT(flag);
-	ctx->opt_mask |= BIT(flag);
+	ctx->info.opt &= ~BIT_ULL(flag);
+	ctx->opt_mask |= BIT_ULL(flag);
 }
 
 static inline bool ctx_test_opt(struct f2fs_fs_context *ctx,
 				enum f2fs_mount_opt flag)
 {
-	return ctx->info.opt & BIT(flag);
+	return ctx->info.opt & BIT_ULL(flag);
+}
+
+static inline void ctx_clear_opt_mask(struct f2fs_fs_context *ctx,
+				      enum f2fs_mount_opt flag)
+{
+	ctx->opt_mask &= ~BIT_ULL(flag);
+}
+
+static inline bool ctx_test_opt_mask(struct f2fs_fs_context *ctx,
+				     enum f2fs_mount_opt flag)
+{
+	return ctx->opt_mask & BIT_ULL(flag);
 }
 
 void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate,
@@ -1443,7 +1455,7 @@ static int f2fs_check_compression(struct fs_context *fc,
 			ctx_test_opt(ctx, F2FS_MOUNT_COMPRESS_CACHE))
 			f2fs_info(sbi, "Image doesn't support compression");
 		clear_compression_spec(ctx);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_COMPRESS_CACHE);
+		ctx_clear_opt_mask(ctx, F2FS_MOUNT_COMPRESS_CACHE);
 		return 0;
 	}
 	if (ctx->spec_mask & F2FS_SPEC_compress_extension) {
@@ -1511,43 +1523,43 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 
 	if (f2fs_hw_should_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			ctx_test_opt_mask(ctx, F2FS_MOUNT_DISCARD) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "discard is required for zoned block devices");
 		return -EINVAL;
 	}
 
 	if (!f2fs_hw_support_discard(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_DISCARD)) &&
+			ctx_test_opt_mask(ctx, F2FS_MOUNT_DISCARD) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
 		f2fs_warn(sbi, "device does not support discard");
 		ctx_clear_opt(ctx, F2FS_MOUNT_DISCARD);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_DISCARD);
+		ctx_clear_opt_mask(ctx, F2FS_MOUNT_DISCARD);
 	}
 
 	if (f2fs_sb_has_device_alias(sbi) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_READ_EXTENT_CACHE)) &&
+			ctx_test_opt_mask(ctx, F2FS_MOUNT_READ_EXTENT_CACHE) &&
 			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
 		f2fs_err(sbi, "device aliasing requires extent cache");
 		return -EINVAL;
 	}
 
 	if (test_opt(sbi, RESERVE_ROOT) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_ROOT)) &&
+			ctx_test_opt_mask(ctx, F2FS_MOUNT_RESERVE_ROOT) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_ROOT)) {
 		f2fs_info(sbi, "Preserve previous reserve_root=%u",
 			F2FS_OPTION(sbi).root_reserved_blocks);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_ROOT);
+		ctx_clear_opt_mask(ctx, F2FS_MOUNT_RESERVE_ROOT);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_root;
 	}
 	if (test_opt(sbi, RESERVE_NODE) &&
-			(ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
+			ctx_test_opt_mask(ctx, F2FS_MOUNT_RESERVE_NODE) &&
 			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
 		f2fs_info(sbi, "Preserve previous reserve_node=%u",
 			F2FS_OPTION(sbi).root_reserved_nodes);
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
-		ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
+		ctx_clear_opt_mask(ctx, F2FS_MOUNT_RESERVE_NODE);
 		ctx->spec_mask &= ~F2FS_SPEC_reserve_node;
 	}
 
-- 
2.55.0.1007.g17ff1f9808-goog

