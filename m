Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079198;
	b=TA5NT6njlxPLqn0pRW6Ebph6I+WSKNEr5+Nz65TG3R31hnFaJVNvX5KZirnStpraTY5p
	 FMKkpEpbJE67k0sFnRjv2c00KqIr/BMKX7QWsyLDLk2fBKMzh50MqBB4ZnW45aWfkNgeG
	 F06NK4a4080ebScvaGBJL7JLY4rIrh00OGzAFFYpveGR9LH6sIuyUy+jBIpmViBrEQNjZ
	 X6GQLZ3dQQ2GkJk3AXBCiXj1QOijBshfG19hCHE4l0OH9uoX/b8mh+MTJJcLRvdSaotTv
	 SE0o/bLEFax8nGV77+DvmyyRi+GtHeNnJmujsOFtSEMJlYmtQYVTCC12J0SzAZE5oug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tSgquXwr/HzowPSw0CcNwelS2rBBKKasUYdOd6dLaGM=;
	b=FNgNIx5hye2SS3URBZnc436UwHVYXRkTSTAQfIq12W2w13Y8uCY4IcfAopne3AdwfYyS
	 +e2GH/EbA+zUwlPveKLpCC1x5h9lhxY2q3RoT5Xhf4ax5krAM/4ew+Hmy5nD87k4Lsv//
	 6EDBeWN2TzqXEQwVCLXfL41UOhRnciQxH/VbMdNzEvlVQ2yvHXaL22GhTiCLu/aZuaSGp
	 R9IkDk11FJfEZJO3TuJ0p1iDkr++Dqb2Hwlbt74dkxEaBBEr7KGfFjpHS3ewCfziuXUt8
	 y/kFcyHTiE7OC7IViB2XW97hMWd171YTWq7YnUZyfPxqJzSx/VWihKRZqgyLGktgwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PCta5vgI;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5C606EE81
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE5C606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PCta5vgI
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363316fa0cso32971cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794079197; x=1794683997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSgquXwr/HzowPSw0CcNwelS2rBBKKasUYdOd6dLaGM=;
        b=PCta5vgIP4YfnO3iqVfYY9551bxqkklLPfWEZAy8L/8OsQQL+viixu32N+w5MRyBw+
         CApjJtmaQcOblafdC0DZk8FKbQiooA9Oj9Oic6KS1K7MHdDJ0p1+EdzvqbN8mPbWJPJ/
         mbRJTuONsMtM27cbMlHKA+rEG9oIg/f8Ak+mOamcPAUdpPjXHks0DP5oAKKOZWj/qXdF
         ScVKqR7XqEegn3HZVmUN7V/cNm/w9evgeUl35GJu/bJ6ptH4CeT3b45AqC71Rt9eIwKe
         R7IuqAEX3X7A4KyExNie0a4r+ShQKz8ViaU58cOR1r/KTYFTcvgnNn8BF/SjnMiVV6Ec
         rCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079197; x=1794683997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSgquXwr/HzowPSw0CcNwelS2rBBKKasUYdOd6dLaGM=;
        b=Np38DDA1h7Vo9g/rLOlmi019h2hJDH8Y7XQ9kmJLL1p4F/0C/FxErv+VZAOa7u+UCl
         myi+M39d5GryhIShJo/03oFJoLgBQApunMxBZ+yJce+kJRyHgXSP2oCmZmImWrWxW7NM
         f+ETkIolIKkqEBwvk9tOr3I1gr6rUgTh6iEklY5yUKwRtbLgIm1KLE7lM7JM2uBJdTbU
         DpfXHld+M3PNY+UbhQsr8WUAg8bk8UXMX6Qudki0tdIVQyAwjA5aftRWS6tup21pjkDp
         z/PI4BLvAvVIcpxxhHQVurYV3bF21qgR7fMtYJzSyPG8ZHqbxygJoT+HknzNl2ZiinOH
         gvBQ==
X-Forwarded-Encrypted: i=1; AL+hErH3DgYzKeK83fyWnscdg8gqSTofhKquSaf261MqTVfEPzpduo6tj9OCHAF6Ped7+QTL/ws+DeUXPNBWffo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MTKId+GFbmklq3IvQzU4fvMu6eSkMyY7PrGlrvI+dJA1OQkrJ
	FDrOzrLnLXQCb18Tj2VWdz41CyhzK0UecWi4W/ShpK0QTMei6O1q1i77hwvZjpEJBF8=
X-Gm-Gg: AYBFou3z0WBsk4x0tdEZGWaNgqt6oaoyluHgxQ4SHj8TG/bD5ybepTHZjDL8W29XAxv
	iIGEZh9ChMGr1nUTqxhmI3kCBzVw8VrTuR1NxbAydwEWm8Rfmunm+e0WhwZskAbnQmdrbPFn57x
	khXq8vZyxwWpvhPUaLOkS+BJq2/w0Nmvbp7jOMFyLGD/dO9IiawSuh1deUDMJ8rrlMbSNWEYEr9
	lQsctc11Sn2SArVzN+Axan6ThJZzk8iz0ZJaKTvP+FqgSIIn6U9ly5CXF/j5nfOBoIrQQtkgAxN
	5qJmlN+7s0k0oXlq7Tim6OWKeGXJaDKluPj2Sdi6cO5tpWd8X96aHNtlFu10ssXR7FvOq5v9/FC
	IK6X5bM2vutszHYqZiUg8spZKN8CboI07JXNxpPzw+8EmCsczVWO2yJ4bER9pvmQyLk91tHksv8
	/tOdMvqKhIoQ/QLRey4YFPUzeXwN8/t1Jj0uLeqWM51E8Wy5zsw+T2IB9OdzfzSFl8MFspdmLxb
	/syyik3NpeKn1Xg5y3Fa072mcPSBucVBqn5oyD42pLixdXjRedfdc+YO4XPCdNgwruA73G197fz
	yAkkFjQR4WZj1cVsf+TbDGXOmu9v7Fa7gTOKM2p1Gf3b/g==
X-Received: by 2002:a05:622a:8842:b0:536:91bf:b540 with SMTP id d75a77b69052e-54e1329addamr93105611cf.23.1794079196644;
        Sat, 07 Nov 2026 11:19:56 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecedbefb2sm496736d6.17.2026.11.07.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:19:55 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 07 Nov 2026 19:19:36 +0000
Subject: [PATCH v5 7/8] ovl: write the timestamps that lazytime defers
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
Message-Id: <20261107-b4-ovl-containerized-sync-v5-7-d34b4ae57fdf@toxicpanda.com>
References: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
In-Reply-To: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794079181; l=5521;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9AHm45iPL9xMQ/MU/5eyp57lFw+X1sZFu/GzN0eYJ54=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO6oQ6I4bXteBk+CKlPdvgdMOZ7FgA4dT/6hslZezUe6rhV+QwaC6fv/81Mq+wiyJBZC+MFJW8H
 NI9xZHZeHEwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With lazytime on the upper filesystem new timestamps stay in memory for up
to 12 hours, and syncfs() has to write them.  So the overlay inode must not
become clean during that time, or syncfs() on the overlay would miss them.
It should not stay dirty for that long either, because the flusher would
visit it on every pass and it could not be reclaimed.

When overlayfs writes an upper inode, or looks at it in ->write_inode(),
and it has deferred timestamps, hand them to the upper filesystem.  They
go out with that write, or with the next pass of the flusher of the upper
filesystem, and the overlay inode becomes clean after that.

This takes the benefit of lazytime away from inodes that are modified or
read through an overlay with fsync=relaxed.  The flusher looks at the inode
of a file that is open for writing up to every 5 seconds.

A syncfs() that meets a freeze of the upper filesystem leaves the
timestamps to the freeze.  One that meets a read-only remount of it that
fails leaves them to the next pass.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/overlayfs.h |  1 +
 fs/overlayfs/super.c     | 10 +++++++---
 fs/overlayfs/util.c      | 29 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 1d7b102a1127..676520ff026f 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -523,6 +523,7 @@ enum ovl_write_mode {
 	OVL_WRITE_COMMIT,
 };
 
+void ovl_flush_lazytime(struct super_block *sb, struct inode *upper);
 int ovl_write_upper_inode(struct super_block *sb, struct inode *upper,
 			  enum ovl_write_mode mode);
 struct inode *ovl_inode_lower(struct inode *inode);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index ccfbaf9d8797..f38c6dd2ae47 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -331,6 +331,7 @@ static int ovl_statfs(struct dentry *dentry, struct kstatfs *buf)
  * all, see ovl_write_inode().  And a write_inode_now() that does not wait does
  * nothing if the flusher of the upper filesystem is writing @upper.  A
  * modification that was made during that pass is only recorded in the flags.
+ * I_DIRTY_TIME is only left if ovl_flush_lazytime() could not get rid of it.
  *
  * i_writecount has to be read first.  If it is seen at zero, the tag of a page
  * that was dirtied through a mapping must be seen as well.  The tag is set when
@@ -344,7 +345,7 @@ static bool ovl_upper_unfinished(struct inode *upper)
 	return atomic_read_acquire(&upper->i_writecount) > 0 ||
 	       mapping_tagged(mapping, PAGECACHE_TAG_DIRTY) ||
 	       mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK) ||
-	       (inode_state_read_once(upper) & (I_DIRTY | I_SYNC));
+	       (inode_state_read_once(upper) & (I_DIRTY_ALL | I_SYNC));
 }
 
 static enum ovl_write_mode ovl_write_mode(struct inode *inode,
@@ -375,12 +376,15 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	/*
 	 * Leave periodic and background writeback to the flusher of the upper
 	 * filesystem.  @upper is on its dirty list, and it knows when the data
-	 * is old enough to be written.  All there is to do here is to find out
-	 * whether the overlay inode can be clean again.
+	 * is old enough to be written.  All there is to do here is to hand over
+	 * deferred timestamps, and to find out whether the overlay inode can be
+	 * clean again.
 	 */
 	if (!wbc->for_kupdate && !wbc->for_background)
 		ret = ovl_write_upper_inode(inode->i_sb, upper,
 					    ovl_write_mode(inode, wbc));
+	else
+		ovl_flush_lazytime(inode->i_sb, upper);
 
 	if (ovl_upper_unfinished(upper))
 		ovl_mark_inode_dirty(inode);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index d7b08a46cb76..16ca33e2b794 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -1528,6 +1528,33 @@ void ovl_copyattr(struct inode *inode)
 	ovl_mark_inode_dirty(inode);
 }
 
+/*
+ * With lazytime the upper filesystem keeps new timestamps in memory for up to
+ * 12 hours.  syncfs() has to write them, so the overlay inode could not become
+ * clean for that long.  It would be pinned, and the flusher would visit it on
+ * every pass.  Do not wait.  Hand the timestamps to the upper filesystem, which
+ * then writes the inode like after any other change.
+ *
+ * Like touch_atime(), leave a filesystem alone that is being frozen or
+ * remounted read-only.  Both write the timestamps, and the overlay inode stays
+ * dirty until then, see ovl_upper_unfinished().
+ */
+void ovl_flush_lazytime(struct super_block *sb, struct inode *upper)
+{
+	struct vfsmount *mnt = ovl_upper_mnt(OVL_FS(sb));
+
+	if (!(inode_state_read_once(upper) & I_DIRTY_TIME))
+		return;
+
+	if (!sb_start_write_trylock(upper->i_sb))
+		return;
+	if (!mnt_get_write_access(mnt)) {
+		mark_inode_dirty_sync(upper);
+		mnt_put_write_access(mnt);
+	}
+	sb_end_write(upper->i_sb);
+}
+
 /*
  * Do what sync_inodes_sb() does to an inode: wait for the data, hand the inode
  * to the filesystem, and leave it to ->sync_fs() to commit it.  It gets there
@@ -1565,6 +1592,8 @@ int ovl_write_upper_inode(struct super_block *sb, struct inode *upper,
 {
 	int err;
 
+	ovl_flush_lazytime(sb, upper);
+
 	/* sync_inodes_sb() does not wait for such a filesystem either */
 	if (upper->i_sb->s_iflags & SB_I_NO_DATA_INTEGRITY)
 		mode = OVL_WRITE_START;

-- 
2.55.0

