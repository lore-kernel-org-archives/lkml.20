Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CD37C112
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525453; cv=none; b=ZKyT5VW5bAa6Rb/UYDD5dKVNnrZGnHAeEUVZfNS5JdNeb5OTf2OezD2MpDCKIcPrHARJs9hHPiExzNgnhGuGQagqrLG5I/LX0BO0w8V23ju3bUjfVHMB6j/2oKJF3ZRmdn7aY/qIIx/SldEorGjpUX1iAW1pk7IGucuq5rvDku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525453; c=relaxed/simple;
	bh=1pq+jBO6Dp1A8O/meEM7LBdcx1VTsWePkUpzLOPE8HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZDxLl30a9ER6FQDq36/9azBC7XgGpyplnq+U2TO6+6e3fa4J6jjoUik5nou3iW2WE0fJH3yjYOZTkyInRCgwYb0hTRjrD1/e32kx6H37CYAuS26gTyVIbgqyGZUmDqyBxpUj58Nk6LeBY5e+9NuLnD1RxW6a0oUFqsUuWHUQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PeXPHFlJ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PeXPHFlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eW
	IwSlaYHCxquBMYqYFpMo6jyTyzxF2kh5MhwtVDnUg=; b=PeXPHFlJLXMz0SZTTC
	bOI2Ih4IBgq2TEeIciEcwjAy4onM/3N7Y9VTT1iYqWatNJY/KanrHU+jCmIfrlNh
	P4VnzGQREsfQmlSNStIRiRUrIGFWX+L8f+vouFi0fFqimI+QeHrLZrtBvAoppzWG
	01EypueToC37CHK2XoUQ/vKYU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S3;
	Wed, 16 Sep 2026 10:23:52 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 1/5] ntfs: report allocation metadata errors to fsnotify
Date: Wed, 16 Sep 2026 10:23:41 +0800
Message-ID: <20260916022345.1151836-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260916022345.1151836-1-liubaolin12138@163.com>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1rAF43Aw4DGr4kJw1rCrg_yoW5JF4UpF
	97ArnakrWkt3WjqwsFk3ySyw4S9a4kGw4Utry5Xw1fXrn3Kr1kXF4kKF1F9F1F9FWUZw1U
	Xw1jg3y3urWDZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j75r7UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RiyfWqp-biyjwAA3F

From: Baolin Liu <liubaolin@kylinos.cn>

Add a volume-level helper that records metadata failures and notifies
FAN_FS_ERROR listeners after mount activation. Use it for cluster
allocation and free rollbacks that leave volume metadata inconsistent.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/lcnalloc.c | 4 ++--
 fs/ntfs/super.c    | 8 ++++++++
 fs/ntfs/volume.h   | 2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e7..347f9e152588 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -763,7 +763,7 @@ switch_to_data1_zone:		search_zone = 2;
 			ntfs_error(vol->sb,
 				"Failed to rollback (error %i). Leaving inconsistent metadata! Unmount and run chkdsk.",
 				err2);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err2);
 		}
 		/* Free the runlist. */
 		kvfree(rl);
@@ -1044,7 +1044,7 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 		ntfs_error(vol->sb,
 			"Failed to rollback (error %i).  Leaving inconsistent metadata!  Unmount and run chkdsk.",
 			(int)delta);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, delta);
 	} else {
 		ntfs_dec_free_clusters(vol, delta);
 	}
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index b8bb2268e609..340aad497b88 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -14,6 +14,7 @@
 #include <linux/sched/mm.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fserror.h>
 
 #include "sysctl.h"
 #include "logfile.h"
@@ -337,6 +338,13 @@ const struct option_t on_errors_arr[] = {
 	{ 0,			NULL }
 };
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
+{
+	NVolSetErrors(vol);
+	if (vol->sb->s_flags & SB_ACTIVE)
+		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 8c17a66b4f22..55d08319820e 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -250,6 +250,8 @@ DEFINE_NVOL_BIT_OPS(DisableSparse)
 DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
 	if (!NVolFreeClusterKnown(vol))
-- 
2.51.0

