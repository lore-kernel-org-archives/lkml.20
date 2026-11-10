Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320715;
	b=jeBe1ROKpYdEVCU7rJa1/EXzfsPIw7q/BJXxyLBChRN8QT00Ci8RPHBG8ldFaZK1jOLt
	 oFfd9qdlprcuoH0zFPIDGdoSezj55PzRRODSTJ/CqHyEboxD8d/ntsfbqJIMmfiI0SYzX
	 UGFJBX4dYvtkFRRiGGriQ2dDFHbTldBaSorO2oLzZeHT/sz2s3YenQkz5DAuBhYBDEMXj
	 YH1wXjwixSMbgffoMnEUvaaMvXCRVmYl4RO4XPMPONW23W8219VA8FtlSLf0l+v22RXOs
	 S73LwqgbtNx6kT1oNmJj4D8jzTwj9dLW35huvjHpdcA0NSeGUfvcQIOjseBEkikh4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pcyTIIwBPjmyAElj9Plr/S42lIJXiadAytcA81h3A/U=;
	b=mgn8CmlD8kvhrxVFKyNoViGrajXS7r4Gv/XsqsIuAuwG3AzJtvxXJC9r0xDjwGgOsgDN
	 70wfAY2nEQKwTm/G8Hsi8PSh/fhxWpgOSdFyUp8QG33RqOCq4L83BkS6y4bL6ghs+Lp2u
	 oLBBR4FsHln0ekvyqGGAVI1F+tlZs7uz//xVRZ7Tum0S3lQjKtvvZCo7e/+B0yrz/REcG
	 fAzdCtaZ7PIYdf/G0DtnepmK3EqeR0w7hXo0lz5bvIcQvRv71Yl0yWCyzviXCikkb05Sq
	 2BsPalvpqUOyJ0v0CcIEYUaPkNqGywgdX+FT/db8ZpuRX8ydTkHDWG1IXvAC0AeaZcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fJd+3mar;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE75960A6F6B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE75960A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fJd+3mar
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535179e995bso22137251cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320714; x=1794925514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcyTIIwBPjmyAElj9Plr/S42lIJXiadAytcA81h3A/U=;
        b=fJd+3marC+EMsRC/1xy8JJMSfX+zrYIEaqvT9qehJSqaYPV/tTmzr6PktTBIwPY6PF
         j2Z6auoTPzI4XNNqWS5IQp89CwMJvQ/2HY/PljtkoyzIw76HV3mme4JvPLmYXUltAkp6
         2e2pfjg6riBRJ7M3gVw+z8mnT939ypCmngLPYNXxxhoDlQgF9CqRhOLEozNvnCEu1P6p
         1iPXTiqHNGzBtudNJ6rNODrsnIhaN5i8/ALhjMWFf275ZMrcw1IBqPkYcxjgcYRwknrj
         elYn4H7d4XZBGrm/eH+eBrOKjmugEegPE6VZDFNToBPj3RPikmOO3bIy7QrELZPhVbwU
         /qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320714; x=1794925514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcyTIIwBPjmyAElj9Plr/S42lIJXiadAytcA81h3A/U=;
        b=iH5pid7MEr4oj57KxzQARNzAazM/opmCP2mKHNnA9aurTEpX3YsYyvuCzRyuXu1ltp
         xmCQQ5due/qt13hAwB5q5iDJsmUx223pdwAZSv2E3E67+x6ebLTV6t2akqhM1vQPnlwx
         G0oq33NnY6ZaG/A+j1sOlq3GsyszCQEl7HrLeHt7q/UMK/tvKCtBToKKLav8XKr4tuUD
         NHMb27t0sTuxxdj/kLWuzEyW0IjV8mscEl3S0hvs7Fq2dCg8u/I0T9N+w68eS7ZRN2WH
         UCcnBvlixgW4iBUj70AQrt9G/IiZDe4RYew178H15H1DqtFehmvfEGjvQZTsWkE0aGFi
         LwRQ==
X-Forwarded-Encrypted: i=1; AL+hErGkT1uE76AWhp6PM0jtt8LnC6AAvYIN57fuXpzVzMZjz6xA7Ppt+34IPo8gEC9unDcDEu9zEQfXOBYY4sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UK7RG6PNkSVK+zRfEguQPewRmrZOF82D344ChB4AuCLwhvSSb
	nljc/mljXVEKH2Mqf69kpjhFduDiEQwxnvs8bBRnScT9bRoRMcE95vS/fJWFukGVPJU=
X-Gm-Gg: AYBFou3479NdknHtKIJpG4LBHFWHYBKnnXFvVR1QnrAcJQEFVA05nRsYq5KTVdF67Fv
	4aN2pkkOMSwi0VzUAPGSmA7WpuxuVYrPaifKorb49erD2DEbYLdVramy+YLRJUWz5ueHPDeX0Xc
	DywrgfcWLt7LUCPYcc/unFPJ9z9qeTSQ//EvfVl0l1AXzC+sObuSTIyiFb61Q/IePl9UKMTCmKp
	rvQl7IFkBBLiibk4/pr1LQYMKOkkmaii8Pq/IZwJbwu/zqzKmoMx+GS/X5tMS2VwDZAdam+3deI
	3Ji4SiOtOitnspjDckN5mYLxFeoNl1nBJzqAW9JNbOnIqQHjxrVNzXYVDAUgY/2HgRUX1iOzL80
	zcJa93SWN58bfHQPeA/MXFM5MnRkTWBmVxwkjWSQUBjkLteDHPHZFrALIAp9OhClLivy/kDjHHf
	3SgKdJjuhOW9cRQk7HHFpjGjR4kslifUc+nD8Ohmx7tXBC9lwGMVXk8x34IUCcWX4RQv6VQbiBl
	GH18i5/5/O2wPMOE2AG9vKTSzCmOtMP9Qt9Pjhj2voM0sccl4Yvb8xbEdy2T0irW9/yAaxoE1Ko
	4NQNlX4eCzNj1ZeVI2jVRJC5fzONvpaqC7idv4BWMZ6rLQGIoAi8RExEsWTJ7h8UwX4=
X-Received: by 2002:a05:622a:53cc:b0:535:a20:8277 with SMTP id d75a77b69052e-5552609b27fmr38562291cf.10.1794320713629;
        Tue, 10 Nov 2026 06:25:13 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0543c8esm22168616d6.40.2026.11.10.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:13 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:57 +0000
Subject: [PATCH v6 9/9] ovl: implement containerized syncfs for overlayfs
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
Message-Id: <20261110-b4-ovl-containerized-sync-v6-9-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=4798;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Xo2M5cHMBoiidKt8p5NTtHZ9BfQZnZy1FRZYhPiv9Fw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHLN7kEC1SQEmeJVgeJNARdJzVGyGiG5xdAwugZHdHFZRG/vffQgzIfpxxH0BSODqWKaSmXur4L
 +1nj/jncZDg8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Now overlayfs can only sync own dirty inodes during syncfs,
so remove unnecessary sync_filesystem() on upper file system.

Do that with fsync=relaxed only.  Call sync_fs_and_bdev() on the upper
filesystem instead, which is what sync_filesystem() does after it has
written the inodes.  Do the same for a read-only remount.

The root inode of an overlay is not hashed and cannot be on a dirty list,
so write its upper inode every time.

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
 fs/overlayfs/params.c                   | 14 +++----------
 fs/overlayfs/super.c                    | 36 +++++++++++++++++++++++++--------
 3 files changed, 32 insertions(+), 20 deletions(-)

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
index a0fb85405f68..570e2ea6af93 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -270,18 +270,38 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
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
+	 *
+	 * The root inode is not hashed, so it is never on the dirty list.
+	 * Write its upper inode every time.  sb->s_root is gone during an
+	 * unmount.  An error ends up in s_wb_err, like for any other inode.
+	 */
+	ovl_write_upper_inode(sb, d_inode(ovl_upper_mnt(ofs)->mnt_root),
+			      wait ? OVL_WRITE_WAIT : OVL_WRITE_START);
+
 	down_read(&upper_sb->s_umount);
-	ret = sync_filesystem(upper_sb);
+	ret = sync_fs_and_bdev(upper_sb, wait);
 	up_read(&upper_sb->s_umount);
 
 	return ret;

-- 
2.55.0

