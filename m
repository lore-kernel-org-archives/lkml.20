Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825129;
	b=4LwCT4kr71nP6zA+56DWz3MeEz1SyvUDdu+k9JDDj0YA1O/C5MG92p4UUUBzLhxJt5LX
	 9IK1v5vwypTj0Xu8yhp+hI+NvLV4cvLMmMa0LbGQi24YESopEyOjWatgGZRkayi/cMl5A
	 W1B41fqRP5B0ic5cohlDU5Zb5m6ZaCvcUiHXjSekyMNR5dSMsvQ8eKoEZzkMMs2vHFCgi
	 IF+61Fr5tP6Gmt7UnCHiPfG2Q49w8bhjPrNWJjnX8XLAnITeS4lV7+HZNadN8ZSR5oU+2
	 0Htw4/KlrQtuhopMS0pJrJEm0MN/pzgwE0XSTboEdpD4jWgC5SHOkdZxrmAHUYoIQ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IQCqC3TLeL02VDFjH3mD9dON8rmBDZRabQkbx5KrQXU=;
	b=KNv7TIKl1K10sfEIUvv3A7wNXhpXKjk/Z/OqszwdEEMZfE/xkda9BWwUZry1DliK/caH
	 W89DY+RWaM2W3LHnCYQiM83b36MTemA26mguSic1J8FwsOFDCT/f+PUS8c8gcVKrxMwRV
	 S8/v+WjNfyxbrzP9VREQRIHNOi2s4OQokVELfl1RyXd1ZymbJnqyN53sI2zi675BqFvpF
	 1iBrX2410JAJIPx1HQWG2SuD0+hbtQtV1iy6b7yoq0FnWjOZneWZuIVoRx7aS4Ljrfull
	 HG4peaqdJ7o2oC2qEnCqnxVNmm2noV+MvkQYYizILV/9vIuQqdQH2u4UoDGuqGMRbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qDPpCZaI;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BA608F136
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0BA608F136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qDPpCZaI
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e7c847aceso10436386d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793825127; x=1794429927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQCqC3TLeL02VDFjH3mD9dON8rmBDZRabQkbx5KrQXU=;
        b=qDPpCZaIbabkpd4vbUKZ4St0U/NNp3Tfr0JIs2VXPLZALAoFRPeyHEjzKnpzRW0Jcm
         Q6aiIOMF5R1mR66meWgdGUidmIriNA/GbKiVhPnq/DuI2LVRLGtOudamBXHcJ6HS02hx
         drRCXws/lwu/eZo7GcrB3GUZoFgSqN0eVYjneIkhFXE+vXNEvy/IsFQ0kpZgFKLhZxGW
         vUxrIhAn/agNe58t+NYeL6xEUTp7Na10xLXT4r+X/PRHMzcnTFbARUTJZSHkeyYX0b7/
         Uao8v2qoJpCTgwL9D3H/Aq3Dvk88xXa4R+4xXT5WuiI6wu5Bp+JNcGz0eBXwGplx1rX1
         IMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825127; x=1794429927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQCqC3TLeL02VDFjH3mD9dON8rmBDZRabQkbx5KrQXU=;
        b=JSx+EkSGkAU2lSFQa9hkMWnVXeOYGOwPBqtI4TEvaOJGIbgWFd9GcnSYcbgLuW3m+V
         1z+eawEYCAt4tN34ChrqPWBj4fU+bgvaXxrV2O/leD0+BeFI8ds9NmO7kHdmtIy8mHUn
         wW0MK20lxT2FSYsPETqdKP8nD2UahiWHHNBGOfTfGj3TMxsXj7/ICXrosX1VbiZBntZT
         XP7frJgZyUicaTT2NMlp+BBFSANG1T9JguvA5f6U9hIxZ3rT0MPTr60DrZtBbency3jg
         ZHh2oyXJBDCehFk4OW1gV2pGpPRjjdV/qEPY4ZUjWb45gNmmqskHuzVJ9lByiHmPW9sf
         G2vQ==
X-Forwarded-Encrypted: i=1; AKwUvBykWR7TlW7ILSrWI5eMqdMPyZ6JTcmHWTin9+wfK1hgrTYyRuhWPFdNFRLJacjxiUQY3SMrfJkJGpH+RXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YU/C8oQgWu/fUYsIQLD7wftX7eG8GkxDJTsWxwIiM0Aaduneg
	qyZ+l2loEcxX9yCXEg/g7Ff1i462ECXVdYxJyB5YqADEyTQzDwKS011m5IBy14kJHU0=
X-Gm-Gg: AYBFou03M2OymeKQqa99bh0H1PAW8I0TNpIVoXFGo/sKlAhLDhDY9VfDvHlFjy9zrCC
	1prTKC3DV++m688yNdIlcdyUpLJTNj9EvhAMBDMEgifpnEESnD0Z9liNQ2sDb2UST9Nh1zcwddq
	pwxnJp+VhFoo437AlgrvyN/jV0rYx8oKehEpMZSWIro8OvHuKceg92cmKO/eBbeTpvOeWq1xXNl
	uEDx2LlMnNaw9/1Gq3UQqA1CwRF2MF/HJj7jNUcz6At5fUdDWD1LqlZ9Y3XlXnzYKCsnkeNJe+a
	fMEMRtY3GXfrAuQTdPremlkgStJzMxY7fW8iwvhcd7dygIvrDqo6B1fxj1e88WQ+4pOemndqzsW
	hZO5kExrHsf+RC1dNBxqCtGUfA3Eoh+rTNU61xtkpc2i+zVcIiCHwRQSWIeR8XUg+k2sHARuqxy
	yw9BVSLMGnWtY3FVwikeH/KUwQfkzErzoeqQvExrseM7FA4SiVlbV3UENQpGesa0g8OYolw6cdU
	uyYfPH2davLvMVvMu4h5I8gNCHOJbhETczSijByhMrekWZ4pvIPvA84kLfvpm8+nEdpbKoK4uQt
	Dzhi4DQKJPb9c39nFQHYEGxzI/Sf3buonuoDOiQNfzgS0Q==
X-Received: by 2002:a05:6214:5713:b0:91e:9664:4e2b with SMTP id 6a1803df08f44-91e96644e5emr5054396d6.7.1793825127263;
        Wed, 04 Nov 2026 12:45:27 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7007b8sm28468956d6.31.2026.11.04.12.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:45:26 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:45:05 +0000
Subject: [PATCH v3 8/8] ovl: implement containerized syncfs for overlayfs
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
Message-Id: <20261104-b4-ovl-containerized-sync-v3-8-8daa20144f53@toxicpanda.com>
References: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
In-Reply-To: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825112; l=4901;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=MKPmKkGGnOmeHx5YNfIfpl3k0pTt4XfySqQ9xSBxDBY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEyIzVjiSk3MJ4NnRKejvYouvYgMx9tjZnawlJuMt59RJY3L/LFPsdUWc8qUUK4dtCWk5m9KQQw
 lAgjiJC0BBwo=
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
index 092806c620b6..9a7d9aab30e7 100644
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
index 9ff266c38cd5..7293bf4004f7 100644
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
index 420cd166748a..21d70d5ab282 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/exportfs.h>
+#include <linux/blkdev.h>
 #include <linux/pagemap.h>
 #include <linux/writeback.h>
 #include <linux/file.h>
@@ -269,18 +270,42 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
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

