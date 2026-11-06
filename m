Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972240;
	b=1wh012Ynh6lX2DJkw0m41pWNjiJQ47FbOxgMadWftCdM853Ca2G9eS11njiYTA0csjBL
	 0fJUbbyybPSC/EyVMeimzl5iq1IUWF8ACgnPzvEas02InGjfFZf0MEKVYVorgYLx5To3I
	 95uNiHdT7XkUfRW2Il1B90pjkYk+thzB3cTyVmqWdQv8HRMyRI2mAqXGaAD1AP0LTLls6
	 I7le7Oy8Ha5yfey+rB22ZGindQN3G3mlfz/WrHNuZerNbZmyYfkOQ0/0VSblk8T6LKtEu
	 xesLCqpXmRZub55WXbo3y7jMAj+WagvchQxVEZMZsI2w2VhXFnfwdykNqczuHwgmH6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T+TZK3doCaBYXj2sLfttSL9vgjeHuDd0u+6ujH6XdcQ=;
	b=3kD7E7623tRRKeig9T/UKOVdQUeY5YrLhhZZwD6hQaGL7f6CA5L2P9IxIg/88BBSbxKu
	 mzaIAzTZgte7vAy9NZYVeA8lKQLI9iZGJgjtiQxMwH6R+PtiNXADESzQDA0E0A+x5uhmJ
	 T6vwipAASLHRXXw3esg7cZK5bcybLYn+43+QItZ6AZPjHb4Wl1I8elsW04WmWDCzE5bU9
	 rIRCdFS1/yAEOl5ZzfogkOGru7t73IofvwCAnFhbwYndGU76bjuuBjt2K5dzQYr3GhW9S
	 V0eXcLP0gLyL2T99ulDsL9/1PUCdIeXEpjg+/BY9Yaqv2fs/HspkK8jlaGDASTnIPKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=LhrIStQp;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AAE606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AAE606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=LhrIStQp
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7fc8265aso8886286d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793972231; x=1794577031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+TZK3doCaBYXj2sLfttSL9vgjeHuDd0u+6ujH6XdcQ=;
        b=LhrIStQpI81jKPXexsLbiQf+Fr/HRsjNvPzSdsjgHmiI1jWS4jQ8b9XVUXQkZ4w6iz
         wrFtW+RZpZQ4PH3EYehTLvYkFnXpu6QbPkg9VADz1lpeDqwEdvsDK6AXV7Brrd1NUOOB
         v+vP7hcIhxU9K5TSfIaGT3mZlBjFi/njyMoxYPcG7z66si5fkifXK7ghMWkmT367J5yp
         NIsJ1d71lhlk092qEd2XV4OCYmoeY7Kpln9wriX0M7ROjCmLs94P+5vCG9jzCwmDqqXc
         i34nAV3OPcyiUyyOtNSQaQnoo1ymghTnAU3Oh1mVESXWhDChtRKWB3Irxv/QxiqTUY6m
         qklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972231; x=1794577031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+TZK3doCaBYXj2sLfttSL9vgjeHuDd0u+6ujH6XdcQ=;
        b=wcP/vpjeXKgYEt3pkETpEzt3ngfeVk5xUqSFGbmvAgMP3S6icfbQSAVm2Zb0MheNPx
         ME3kNWXcwuSspizRGcWG0x1eP3PbqxOTNZSMxcQFktSb1ChscoNT+j+OKHGDKUURNa1e
         QeIAN/lNkU49q5XGgXFyXkuFLTtKFasdo51jw+zF5a+wch0ieJvIFBNXaRQuzx9gYnNt
         wz4UQRJbVQn7gR0KT2WruZX/s7Aqgb0RLGC7PmgEaXDHqeLIazqM1diDXIQWLwYAwUgD
         Ae1RD9hr3jM1IrO5WuUqMpU5UP1InGRkCk8LL8tBwnh7dOT1lc30jjjfC38o9nRYpT6l
         ENVw==
X-Forwarded-Encrypted: i=1; AL+hErHxpHMjhGU8hDl/yyIRqM+zLOTQ6QgixgZ/5OoZUAU+ZU+X46jEuy27hG0q3bvmo5J9ZO5nWwptQlbzjJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o5ukBhaiP9ktvdSWqMhTWerv0Ztanjan/yV9LpknS4MXzhHal
	VaKbFvrlieo4+kdlbIKwMklSWmnC9DNrWIIC79T5+hdr6egpUfamc/9PexKY5DVp1Lc=
X-Gm-Gg: AYBFou1YkLOM3N35IdiBNUsLIVn8ooyMA1wD+yZrVWl8+F8GecHoGCYUmdpcv567GHb
	3yNjwZ4ZoTxI6aRabsLA2Sa66DLsI9W+y4H2jJddzcUaUI84Jd1HU3YcBeqs1Ht8VwWuri3WIDu
	H4yoyaA7SRvilJQbl+SDVc1dKJZnsEc7e/4F7Roz8a1d0mQSMAoJMsUO5H2H5+0LMdUjzqNCj4/
	k8m5owR4RyPhJfr7nA0WTrr+vWBJzAhPi6Bm8q/aXPTVp+CCvoERg+91OkVz8fxFFNymk23qfQR
	X10qyOMXhvUzkQ/xhPrD+d8Ywf5lI7cE5I2Inpv/flSPlxv6hd1yRtq8tcT2dJatZCUgzXPCUTg
	oF+aPeIKl545eCl7UkZXfZ+HMdVvVX4Joi4x5mRh9o0UoGChqd/qKNt/rcYQ7M8Fvi31Qc56eGb
	14r0NQnf1CQznondnHS87lWGaD4Jia87qDADRzj8mL9yWH5mObq6mT7gvH4PuvzaQmnEd0SH3ML
	FQKuPg1EZ481K7XRkiy3YIYtia6Oe94/QCDa2hh6m6mhXE4rSDfZBtueu5Asc9jeVhnTJJZ9QVB
	72MiGHZ7Rhemqb35GUYwgT99mrmjiHVSAEHWNNGmBLoyEYQ6bt3QaPcr3FAaXIyH3Xs=
X-Received: by 2002:ad4:5747:0:b0:91e:9a4e:8d5 with SMTP id 6a1803df08f44-91ea9656c55mr33820846d6.22.1793972230897;
        Fri, 06 Nov 2026 05:37:10 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acebb0sm20331706d6.45.2026.11.06.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:37:10 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 06 Nov 2026 13:36:50 +0000
Subject: [PATCH v4 8/8] ovl: implement containerized syncfs for overlayfs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-b4-ovl-containerized-sync-v4-8-6ddde0b7dd8a@toxicpanda.com>
References: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
In-Reply-To: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793972217; l=4908;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ShoZ3R3MxC3sYDTcalzCqLuyMKorjbXwVRDmd2jMSfw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG+ioD038uFbqNV0Ub+6sxgimiEGwuYUmqPKac/lR0IRMeRxTFfv88GCxVFZSsDKyWWPDaUrche
 jEyWcDfxuSQc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Now overlayfs can only sync own dirty inodes during syncfs,
so remove unnecessary sync_filesystem() on upper file system.

Do that with fsync=relaxed only.  Call ->sync_fs() and write the block
device of the upper filesystem instead, which is what sync_filesystem()
does after it has written the inodes.  Do the same for a read-only
remount.

Upper inodes that have no overlay inode, like whiteouts and the work
directories, are not tracked.  It is up to ->sync_fs() and the block device
to get them to disk.  ext4, xfs and btrfs log all metadata, and ext4
without a journal keeps it in the buffers of the block device.

With many containers on one upper filesystem, stopping one of them no
longer writes out the dirty data of all the others.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: everything after the first paragraph, no wait_sb_inodes() on the
 upper filesystem]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/filesystems/overlayfs.rst |  2 +-
 fs/overlayfs/params.c                   | 14 +++--------
 fs/overlayfs/super.c                    | 41 ++++++++++++++++++++++++++-------
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index 1a59500834a1..34fc4e6f8a84 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -830,7 +830,7 @@ Traditionally, syncfs(2) and unmount of an overlay sync the entire upper
 filesystem, including the dirty data of other overlays that share it.
 Overlayfs can be told to only write back the files that were modified
 through the overlay, and then ask the upper filesystem to commit its
-metadata.
+metadata and write its block device.
 
 On traditional local filesystems with a single journal (e.g. ext4, xfs),
 fsync on a file also persists the parent directory changes, because they
diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 549fc1e83ac9..6de99e79eb6b 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -774,22 +774,14 @@ static int ovl_reconfigure(struct fs_context *fc)
 {
 	struct super_block *sb = fc->root->d_sb;
 	struct ovl_fs *ofs = OVL_FS(sb);
-	struct super_block *upper_sb;
-	int ret = 0;
 
 	if (!(fc->sb_flags & SB_RDONLY) && ovl_force_readonly(ofs))
 		return -EROFS;
 
-	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb)) {
-		upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
-		if (ovl_should_sync(ofs)) {
-			down_read(&upper_sb->s_umount);
-			ret = sync_filesystem(upper_sb);
-			up_read(&upper_sb->s_umount);
-		}
-	}
+	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb) && ovl_should_sync(ofs))
+		return sync_filesystem(sb);
 
-	return ret;
+	return 0;
 }
 
 static const struct fs_context_operations ovl_context_ops = {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 27e30d0ace80..7e1703814a56 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/exportfs.h>
+#include <linux/blkdev.h>
 #include <linux/pagemap.h>
 #include <linux/writeback.h>
 #include <linux/backing-dev.h>
@@ -270,18 +271,42 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
 	/*
 	 * Not called for sync(2) call or an emergency sync (SB_I_SKIP_SYNC).
 	 * All the super blocks will be iterated, including upper_sb.
-	 *
-	 * If this is a syncfs(2) call, then we do need to call
-	 * sync_filesystem() on upper_sb, but enough if we do it when being
-	 * called with wait == 1.
 	 */
-	if (!wait)
-		return 0;
-
 	upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
 
+	if (ovl_should_sync_upper_fs(ofs)) {
+		/* Enough if we do it when being called with wait == 1 */
+		if (!wait)
+			return 0;
+
+		down_read(&upper_sb->s_umount);
+		ret = sync_filesystem(upper_sb);
+		up_read(&upper_sb->s_umount);
+
+		return ret;
+	}
+
+	/*
+	 * sync_filesystem() has already written the dirty inodes of this
+	 * overlay through ovl_write_inode().  What is left are the last two
+	 * steps of sync_filesystem() on the upper filesystem.  They have to
+	 * take care of the upper inodes that have no overlay inode, like
+	 * whiteouts and the work directories.  Do not write the inodes that
+	 * others have dirtied on the upper filesystem.
+	 */
 	down_read(&upper_sb->s_umount);
-	ret = sync_filesystem(upper_sb);
+	/* Like sync_filesystem(), do not call ->sync_fs() on a read-only sb */
+	ret = 0;
+	if (sb_rdonly(upper_sb))
+		goto out;
+
+	if (upper_sb->s_op->sync_fs)
+		ret = upper_sb->s_op->sync_fs(upper_sb, wait);
+	if (!ret && wait)
+		ret = sync_blockdev(upper_sb->s_bdev);
+	else if (!ret)
+		ret = sync_blockdev_nowait(upper_sb->s_bdev);
+out:
 	up_read(&upper_sb->s_umount);
 
 	return ret;

-- 
2.55.0

