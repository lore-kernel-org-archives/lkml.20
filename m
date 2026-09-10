Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBDE577E24
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064302; cv=none; b=ZH/wUj+ghRNU5OjqZtn3gMqpqNLXRkmZtfTCRYt0v4Qy5HqzCnPW12J07pi15fy1eXhjcUh1zVojPQO6aVYI9na6uQRgBcANS4Ol5ce/x7Yq7Y8B4mJMBQffrXVymOI+cIChY989VCLRdLEo+O4+/KT3oOPGr4M79sirTXiWTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064302; c=relaxed/simple;
	bh=eDS9k0Z7DXDAETJ5/yPSzUbbzVgsPSZZLaN4q1i66E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMVHspe0OB1Gbfk6y7qA04Rig6ggGpXmzwn40E7UAF5El561CPNiQyb0ZTZIiosrthgzNZwACaYafJnFpANWeZ9G7l81EATxmpo+1EKP7Jn8Y4umdp/bZgfS3ERiuA5WOHg4337NcXqf7JLRHayKcrNyeKWn7igqrZv91dNxEho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zt5B15ui; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zt5B15ui"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2540eso1216039b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789064299; x=1789669099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMuTEYKkyyrLqeX97xIC/Z56ogCyVEt8VnZlLfJ3DOI=;
        b=Zt5B15uiLA9D9RsQMMtWEAvjguI34fZIzSxGP5ohuQsLkbtJRiGekWpySvDT0BLEkd
         g79PlxknEW9kTNPvj/Sm+WeRhuIYVYbFgCg/IEb4+1WX7PlCxVi3pGv94dWyqK/qZAg6
         LiJNcKfw4+Og4DbAN6CKs9jl0I3/I65EkFQhvnIwrUMIRQxlosaFT8lIVKqG7JIVRF9/
         RMInyOBOcT9sW7YAGwsNmvLqQlHpWMbA6Hqs1q+rHiWAzw0lQO2F8FAa51fcawlU2rrt
         DUSo27xqQ4yRry//ofTBuFZ2QlROOPtM69VUiGh4fCMtd4HwV8BhTWeXj7hafvmk8gTH
         oZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064299; x=1789669099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMuTEYKkyyrLqeX97xIC/Z56ogCyVEt8VnZlLfJ3DOI=;
        b=AXw+tZW2SBFY0lT0+k64poqenTc7rXxprGrw1H/CCwVI2HjET7V5V6yIjlclimNFsS
         eonXypQBkKO0SDY0eNBmk5tI4FKvv0VCuyAjSYZZkNTc4u1kZatS56ihwxPNx0gyApob
         W96uyRgbxG4SgVIRAQSklbIlh5IkOHb+Pw97R/6GcQVUJu3hZf0EIwIX/YatXJ2kGehZ
         IOw+B4gJ5F0A1i+8Rl8q7gO6gokobdnkeAhZtY9l3IiUjbrsvOZnnfnz3gNqdfQLvRUz
         c8oZRh5wCnaH+YtZgLH5fnXeV5A8oSW8CA8uXlG5ZpDHaEMrNYdkZKp5GwAYHoT7ibdi
         RU+Q==
X-Gm-Message-State: AFuF++k7gJ+qPNDom7yF9oxHcB870C5TymEDmGguqSIfdm9yjFxCcYts
	0vDE2B/irIPeZj5d4q6RsbeNLa827AFh1UikScoFpRSaX/QT2HNKQNKTdmHU2u5N
X-Gm-Gg: AYBFou1VHOLkUHSrcOUBc7V6kmNWPnFljd078ufxpn8/A41vNEYMlCyyyBr5CZGGJ5w
	48J5N9G30DJTc1Re/9lQR8Xz1oI7e2AjAfMX307dUdcfM0sYdiwPoH7pmt/cgqtY41nI1RCArB+
	zavOlPV+usW3qBR/Py4OfubZtLET+/oQn5LWp5BEkkjKfW06dvdfinszthBoBY5S026WGUiFrBs
	xCtZKVFQkvmtqIL3xyFt/OGbF5l6itMMEbKtRPgXIS9zUhZ/HHCNl9jS7u+97OaBQJwGRMnlAnJ
	5FDvvvHkbxTiwaAy/LolikQWnVKaW//wnQCQbBrfMVSOzMGUeVahPNBPTHtUT2O2HM12m73yGz9
	RGi7iv9zj1qpK7tt00CARkY9S+H9YbwFBB2Bn8ZgLpicZT6Hsfuwr3IryHIWcmkv4TEVe+ike7/
	xj2W4Rr74lOdOhXgl3StYUNs7U39oVqBv1N4LXTWzQLYJH2UvUXLA2M72TZXS6bClO4QltS5WuU
	sTJ63gbiqxzDp3S8p6Z3s8KTy4tchdkIxGKdVSgmT+S7upYsxUjxDdtY8NX2D0esA3C/NnJfGt4
	vISAIpSH3jDcFQeK/lxLAA==
X-Received: by 2002:a05:6a20:be8f:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3daed4a71damr233450637.23.1789064298963;
        Thu, 10 Sep 2026 11:18:18 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:4a5b:802b:c0b:d1d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm32309407eec.25.2026.09.10.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:18:17 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: introduce reserve_shrink mount option for filesystem shrinkage
Date: Thu, 10 Sep 2026 11:10:56 -0700
Message-ID: <20260910181057.640203-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

When preparing for subsequent online filesystem shrinkage (e.g., during
partition resizing or FOTA updates), sufficient free space must be
preserved so that valid data blocks can be evacuated and the filesystem
can safely shrink.

Existing reserve_root cannot prevent space exhaustion by privileged root
processes (such as OTA updaters, package managers, and system daemons
running with CAP_SYS_RESOURCE), which can allocate blocks from the root
reserve and lead to resize failures due to lack of space. Moreover,
runtime configurable reserved_blocks represents permanent GC and metadata
headroom that must persist after resize, which would cause double-counting
if inflated for shrinkage.

To resolve this, introduce a dedicated reserve_shrink=<blocks>
mount option:
1. Symmetrically mirrors reserve_root=<blocks> in block units to
   pre-reserve space specifically for subsequent filesystem shrinkage.
2. In get_available_block_count(), unconditionally deducts
   reserve_shrink_blocks for all callers, strictly rejecting all
   allocations (including root / CAP_SYS_RESOURCE) once available blocks
   are exhausted.
3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (and
   f_bavail) so that filesystem statistics accurately reflect usable space.
4. In f2fs_resize_fs(), automatically resets reserve_shrink_blocks to 0
   and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink completion,
   releasing any remaining reservation.
5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks when
   validating the upper limit of configurable reserved blocks.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/filesystems/f2fs.rst |  7 +++++
 fs/f2fs/f2fs.h                     |  9 ++++++
 fs/f2fs/gc.c                       |  5 ++++
 fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++++++
 fs/f2fs/sysfs.c                    | 13 +++++++--
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 771216f45207..dbdc5d5a83ad 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -191,6 +191,13 @@ reserve_node=%d		 Support configuring reserved nodes which are used for
 			 gid, the default limit is 12.5% of all nodes.
 resuid=%d		 The user ID which may use the reserved blocks and nodes.
 resgid=%d		 The group ID which may use the reserved blocks and nodes.
+reserve_shrink=%d	 Support pre-reserving space for subsequent filesystem
+			 shrinkage (e.g. during partition resizing or FOTA),
+			 unit: blocks. Unlike reserve_root, allocations from
+			 this reserved space strictly reject all callers
+			 (including root / CAP_SYS_RESOURCE). Once the
+			 filesystem is successfully shrunk via resize, this
+			 value is automatically reset to 0.
 fault_injection=%d	 Enable fault injection in all supported types with
 			 specified injection rate.
 fault_type=%d		 Support configuring fault injection type, should be
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 62efc25cd107..c21ed3eacc6f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -145,6 +145,7 @@ enum f2fs_mount_opt {
 	 */
 	F2FS_MOUNT_LAZYTIME,
 	F2FS_MOUNT_RESERVE_NODE,
+	F2FS_MOUNT_RESERVE_SHRINK,
 };
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
@@ -226,6 +227,7 @@ struct f2fs_mount_info {
 	unsigned long long opt;
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	block_t root_reserved_nodes;	/* root reserved nodes */
+	block_t reserve_shrink_blocks;	/* reserve blocks for shrink */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
 	int active_logs;		/* # of active logs */
@@ -2658,6 +2660,13 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
+	if (test_opt(sbi, RESERVE_SHRINK)) {
+		if (avail_user_block_count > F2FS_OPTION(sbi).reserve_shrink_blocks)
+			avail_user_block_count -= F2FS_OPTION(sbi).reserve_shrink_blocks;
+		else
+			avail_user_block_count = 0;
+	}
+
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
 		if (avail_user_block_count > sbi->unusable_block_count)
 			avail_user_block_count -= sbi->unusable_block_count;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index bc22dde1cb30..556c4793478d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 		spin_lock(&sbi->stat_lock);
 		sbi->user_block_count += shrunk_blocks;
 		spin_unlock(&sbi->stat_lock);
+	} else if (test_opt(sbi, RESERVE_SHRINK)) {
+		spin_lock(&sbi->stat_lock);
+		F2FS_OPTION(sbi).reserve_shrink_blocks = 0;
+		clear_opt(sbi, RESERVE_SHRINK);
+		spin_unlock(&sbi->stat_lock);
 	}
 out_err:
 	f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f96abecb3c55..f7f82a32f99f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -196,6 +196,7 @@ enum {
 	Opt_data_flush,
 	Opt_reserve_root,
 	Opt_reserve_node,
+	Opt_reserve_shrink,
 	Opt_resgid,
 	Opt_resuid,
 	Opt_mode,
@@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag("data_flush", Opt_data_flush),
 	fsparam_u32("reserve_root", Opt_reserve_root),
 	fsparam_u32("reserve_node", Opt_reserve_node),
+	fsparam_u32("reserve_shrink", Opt_reserve_shrink),
 	fsparam_gid("resgid", Opt_resgid),
 	fsparam_uid("resuid", Opt_resuid),
 	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
@@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 #define F2FS_SPEC_lookup_mode			(1 << 24)
 #define F2FS_SPEC_reserve_node			(1 << 25)
 #define F2FS_SPEC_resizable_tail_secno		(1 << 26)
+#define F2FS_SPEC_reserve_shrink		(1 << 27)
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
@@ -538,6 +541,27 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 					   F2FS_OPTION(sbi).s_resgid));
 }
 
+static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi)
+{
+	block_t block_limit;
+
+	if (!test_opt(sbi, RESERVE_SHRINK))
+		return;
+
+	block_limit = sbi->user_block_count - sbi->reserved_blocks;
+	if (test_opt(sbi, RESERVE_ROOT)) {
+		if (block_limit > F2FS_OPTION(sbi).root_reserved_blocks)
+			block_limit -= F2FS_OPTION(sbi).root_reserved_blocks;
+		else
+			block_limit = 0;
+	}
+	if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
+		F2FS_OPTION(sbi).reserve_shrink_blocks = block_limit;
+		f2fs_info(sbi, "Reduce reserved blocks for shrink = %u",
+			  F2FS_OPTION(sbi).reserve_shrink_blocks);
+	}
+}
+
 static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 {
 	if (!F2FS_OPTION(sbi).unusable_cap_perc)
@@ -941,6 +965,14 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_reserve_node;
 		break;
+	case Opt_reserve_shrink:
+		if (result.uint_32)
+			ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
+		else
+			ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
+		F2FS_CTX_INFO(ctx).reserve_shrink_blocks = result.uint_32;
+		ctx->spec_mask |= F2FS_SPEC_reserve_shrink;
+		break;
 	case Opt_resuid:
 		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
 		ctx->spec_mask |= F2FS_SPEC_resuid;
@@ -1763,6 +1795,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
 		F2FS_OPTION(sbi).root_reserved_nodes =
 					F2FS_CTX_INFO(ctx).root_reserved_nodes;
+	if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
+		F2FS_OPTION(sbi).reserve_shrink_blocks =
+					F2FS_CTX_INFO(ctx).reserve_shrink_blocks;
 	if (ctx->spec_mask & F2FS_SPEC_resgid)
 		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
 	if (ctx->spec_mask & F2FS_SPEC_resuid)
@@ -2288,6 +2323,13 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
 						sbi->current_reserved_blocks;
 
+	if (test_opt(sbi, RESERVE_SHRINK)) {
+		if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_blocks)
+			buf->f_bfree -= F2FS_OPTION(sbi).reserve_shrink_blocks;
+		else
+			buf->f_bfree = 0;
+	}
+
 	if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
 		buf->f_bfree = 0;
 	else
@@ -2512,6 +2554,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resgid));
+	if (test_opt(sbi, RESERVE_SHRINK))
+		seq_printf(seq, ",reserve_shrink=%u",
+				F2FS_OPTION(sbi).reserve_shrink_blocks);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
 		seq_printf(seq, ",fault_injection=%u",
@@ -3093,6 +3138,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 
 	adjust_pinned_area_boundary(sbi);
 	limit_reserve_root(sbi);
+	limit_reserve_shrink(sbi);
 	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 
 	sbi->umount_lock_holder = NULL;
@@ -5310,6 +5356,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->current_reserved_blocks = 0;
 	sbi->alias_reserved_blocks = 0;
 	limit_reserve_root(sbi);
+	limit_reserve_shrink(sbi);
 	adjust_unusable_cap_perc(sbi);
 
 	f2fs_init_extent_cache_info(sbi);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index aaca9ed9b169..d61940d095b4 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 #endif
 	if (a->struct_type == RESERVED_BLOCKS) {
+		unsigned long limit;
+
 		spin_lock(&sbi->stat_lock);
-		if (t > (unsigned long)(sbi->user_block_count -
-				F2FS_OPTION(sbi).root_reserved_blocks)) {
+		limit = sbi->user_block_count -
+				F2FS_OPTION(sbi).root_reserved_blocks;
+		if (test_opt(sbi, RESERVE_SHRINK)) {
+			if (limit > F2FS_OPTION(sbi).reserve_shrink_blocks)
+				limit -= F2FS_OPTION(sbi).reserve_shrink_blocks;
+			else
+				limit = 0;
+		}
+		if (t > limit) {
 			spin_unlock(&sbi->stat_lock);
 			return -EINVAL;
 		}
-- 
2.55.0.1007.g17ff1f9808-goog

