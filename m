Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEC3451B3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137364; cv=none; b=fK3EXFhH5pMmuBaJXvEmfuTSOu3Enk05YuU+CyedIj9KdtdGPIEIVSd3hWXWpF1dOD5vQoC8D8OTe63CUvlAlBCP6xFuA8Wd9R30L+y4iOrTHKXHJmPU1EmRa+NoB6R07BKhKKtXKtOGuK22T0ELwTV/FH/gJDIyX8LtPCFHnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137364; c=relaxed/simple;
	bh=lWBYiLAYiyBsMM0WWy6i30OOB/a8PQEv7x19DfVRJYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNVhxUDFq210Rs+jfdgQ5ea6Ds/CbwH6JL2Pf1Sj6uMwX3JNwnSD+IjONZM2bIQ87MNaR8lpp7Kt94O3lV+JCcUXdn/SVZNo+bfIdvFG6ZyY0Wk4qaBWMuj9aNEz7XCFbruHXmJRSAyfyHcmnad8tI+zgpFSBG/DJD3utZkrmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKmFmX/A; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKmFmX/A"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so999620a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137359; x=1789742159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nmlV1RetPQeAutS6jDocxh3htEhmcFudZu/wAAqidc=;
        b=LKmFmX/ADrwP9acJc3NYX3ePeXYpeo/WoBNO4mLTs8MQwoyMGjWIfTRWvn92Vvouda
         At5DlGsw/X3NN3qiK4drPXZJKB5iluVaKcg3orwxjMQwKFwSdYtEIR5A1fZWo18hngNW
         6d01DW3lMTQLzxjzTK+IJ9ZVDXZ2JKhNgLffE3Bk85wfICE0o6U4MT4+fRDZBR5OB3id
         ZxhrUXlS2diEyGy6Z36XcpYAlQpOyYPVsFYXzcbGNX3uaC4lwQ/qBQArPZW+NSltHq6p
         s0bRBt0GRzqeXhWOJFenjLrpZHWIhyhIEmgA8dstE+kGLGkBdrghk6jry59JABfpUIVf
         TroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137359; x=1789742159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nmlV1RetPQeAutS6jDocxh3htEhmcFudZu/wAAqidc=;
        b=PmmEh/RcDEMNjVzuyPXHn7SYCYPXDM24lqBr1O77MgM1ZGgYyqUYXSnwUr05C+WFKx
         +d3q8zSod7lI0GZfczsGLQQTXNlI177nNb9tYycxd9ATj84iihlmzbYWpSd9s5G11+Ji
         HG2IWTqip8s37lc/HedDClnLEODJiFczHtoEOksuotFJEhmixP2M4LVHgHiZ5iwfKM4+
         ImH2IRw6JO/4t/BX4EaAzI8qA9K+yiJv0DgojWcsLWa1qlKYiVInPRcU0p+4wC2vMp9q
         oBQtTf6hdW4YVVBl3zknsJmW0KO8HN2l2cMoKH4xOjAopPZ9//b8YpF89gxWCmeBPQzj
         TN0A==
X-Gm-Message-State: AFuF++kupTwDSXTkHIz4KCvIqyOLiios05Dsjj2IQ/IGSa8Y4o0Pep0+
	Hu5agCUqpl7/Pagp71Op6WJPXsAMuyAs7uoZA/DqBvXMXD5kFyardiFivLKU8g==
X-Gm-Gg: AYBFou3RHn6TIKgZVecAbWkAsKiyZtB09CVjRSS4vO4zk/xeN//Nzj0oSYbR4FSLPN/
	Micfob+8KIy4iEfriOUAfmRGzqwCqfROXHs7dwKNFaXtsVq4Odbnn7SOK6gqdAYUpBeUCEV+yBq
	OEWsgbwy/VIAgS5p/M5ItEUscSDiGXx1ta9E1RRyiMCvPLfqz2F0gFZg6Jie+RpounX5WEmOOwk
	nHau1How0SzP4IEdr76qMXBOl6nVnKbO2BrMbpqG68FXjiatLobo61inyk9daeYWVwByFTiX7JY
	rqXW8nHVq+6kRKX8TlKQmqadzSzzRiDuamqSNZduyqGLEFBkimCmAGIkQTULd6BgLt08dxYVA6f
	WWIYERZ2gbuZxeWcuEWpnsuw4bE8tEihik8TwRXyXfFX3590ffebZtcbdbVtIC2z+HL6CScGz03
	4oPPq+N22E47kVx7IcqlCxGrjyzxSUYMhk81gpRZDCEOuIG2SQq4AEmezKHQoPU+0rZH0Zd0tyG
	N7ZfwENOxzmc0UGZgTUIs293/qlYbU0ur3xytY3yu+89ZDH2ch1cOUH6mr37PX0NFoOT2T4/JSW
	Ftc/Dr7uca6j0/RWlQ9pUQ==
X-Received: by 2002:a17:90b:2588:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39d9bd99cc7mr8452274a91.10.1789137358064;
        Fri, 11 Sep 2026 07:35:58 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:4a5b:802b:c0b:d1d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm7156371eec.25.2026.09.11.07.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:35:57 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 2/2] f2fs: introduce reserve_shrink mount option for filesystem shrinkage
Date: Fri, 11 Sep 2026 07:35:49 -0700
Message-ID: <20260911143549.909867-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
In-Reply-To: <20260911143549.909867-1-daeho43@gmail.com>
References: <20260911143549.909867-1-daeho43@gmail.com>
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
v2:
 - Split out mount option bitmask expansion (BIT_ULL) into a separate
   prerequisite patch (Patch 1/2).
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
index 4aaf29de3f6f..48a91771be95 100644
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
index a5e109bdcebc..58f33750b2a8 100644
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
@@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
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
@@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
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
@@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
 		F2FS_OPTION(sbi).root_reserved_nodes =
 					F2FS_CTX_INFO(ctx).root_reserved_nodes;
+	if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
+		F2FS_OPTION(sbi).reserve_shrink_blocks =
+					F2FS_CTX_INFO(ctx).reserve_shrink_blocks;
 	if (ctx->spec_mask & F2FS_SPEC_resgid)
 		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
 	if (ctx->spec_mask & F2FS_SPEC_resuid)
@@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
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
@@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resgid));
+	if (test_opt(sbi, RESERVE_SHRINK))
+		seq_printf(seq, ",reserve_shrink=%u",
+				F2FS_OPTION(sbi).reserve_shrink_blocks);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
 		seq_printf(seq, ",fault_injection=%u",
@@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 
 	adjust_pinned_area_boundary(sbi);
 	limit_reserve_root(sbi);
+	limit_reserve_shrink(sbi);
 	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 
 	sbi->umount_lock_holder = NULL;
@@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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

