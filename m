Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135401;
	b=zB4CO47sgjKg/2NIAWu8Pu2Bo6vZtekP7ZeWcplUeBzQieRmYIna1tQAzvcYQB+nhR44
	 DeQGT3an12xQBywyhXdk79Iec7haD/Z6AYCuew13a/so5pPiO6VPTNx3xtj2EyNAzvzkq
	 QXfb67kDvUC2yWNNWo+Tx5rLSGTfXqjVFSN1T2EgpUziqkWgGlzmYxh/s28fomGVEidED
	 yn35pG/x4dYmwjDhn5W+F125D55suHoAXWhbbZlDuQuYgtr6AyWe8gwMmJuvN0EVjH+lS
	 OymR+pVewBEbPb2EzM7/yaW+v3Xg3J1lnnClbzORswV7P+IDn9FItmy5wlgd62xqQkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1JXKqGgtIMnvjajZ/W91C0JXO85yrC5CihZUyJL+s6w=;
	b=jQtlujrbcjFXSBtH+w/2WloDkCw+wdOGTmSLaVNgDarTKaqo8X3VihO4MD30G1HR4nA0
	 0lVwYBa8mRi4fQ8m4KEMwmSS0K1ui5ypHCJ839k+Ho87DiQ5XT7grseeRxucHPZ/9CUc6
	 AszTafKUFI/3PgQQa4tc4rT2CsAwU3z9FLN0QU7DH4LmCJROZDoLuY6ytGwqBPh7/Fd0T
	 xMicqSfPdg6V/nNCj8jGW9j2FpTAlHfFptWGoW9gFtPUtal8hF2Jz7U9CpHfZNQatxmyr
	 AudU9s2EFlmp5zJP+K3j/eWl8Ps14E7x0A04cz+Uh6qVHYl3HFJlhdvmlgyAazy8YsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=du+UUeH1;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BB560A262B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BB560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=du+UUeH1
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53639b8903bso4089011cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793135400; x=1793740200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JXKqGgtIMnvjajZ/W91C0JXO85yrC5CihZUyJL+s6w=;
        b=du+UUeH1FevE4UhfTYKkUg0pxrrockf3MVtYmlIBRQv8RLTKiar5c1xXKZIQdHiT7S
         0J4m5Mn8QaNZSi1vZK/Z7AdoFTZcxF0399iSabNzoUSwWeBLziFraoh3PaUBxkszg45C
         vZUi4VaNpA3EQ/13dfzenEw/SWkt7Vx3ilhAoonBKlrU2XSRGh/nBVFDEw6hX+cDW+sW
         geRQCk8PVxVZYBJiKQa72ggVa7czD4R9JfcXLcDogDHVGQL76jg+L/Hahc1TXhhccPDC
         MQB4PYfR/ITTM3grhPDp9KWmCO8NYlVJ1OBnURnnEl6/ta5hiDwlwh5iaVfUNkz8yxo6
         zKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135400; x=1793740200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JXKqGgtIMnvjajZ/W91C0JXO85yrC5CihZUyJL+s6w=;
        b=GaLbtwJX2EWtAgORE6lknaYKmFydovM88ttOdkcXXdazuC3xmvZyvNyXJ30uxoOWyv
         EbztWDP0BGRxyVEY3uNILm6V9XV/3SsJOscp7IhDZurq4V0fCuUppsYX9z5busXXf9PB
         Ec00K/h6gHJ1boJ4SI8kP40KhiRr9gPWaOaNusNZOEjBTNr55gKBSXx2ONmVLPDcC81k
         PMlFadXGthga6dpwOaHeiS/jY1iL/SKoZTMCb62XueOc6jNxbi8w3M3avma102PP8dXn
         6erliY6+DmeML1JHyT6yfOoJE/z9Exiylz7mRb0WmwQe+QkJrUw7v0agwREb/xHNmzH4
         AFww==
X-Forwarded-Encrypted: i=1; AKwUvBwFjUOzjoQjaNlO7leqjjZgEjEhbFMM21BfRp1GFHkItn1/+9f9NDuIWbG59w2uLk3UZLE32BDknt5Ftao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaN/8IOn1lDwyg5/idVksVx7b1a1bg4E5eJY4LMmOAi+McxY5L
	pKGeJmWtmRxZZ11kEUcVTMWdpjXXAE0tjNfuxmd/gg0QwfIJks+gkR1JyxKCH/cjl3k=
X-Gm-Gg: AYBFou1WedEv7rwD6GpzFEg+C49KBaAZpj1HNp6iiYdew1++WCJfGE+OO8A31ie8Suf
	M1OyCvnUbOlc0OaIY/P8IVGe0LQPyjNGRRP5tPCZEq+Kou8Qs4IpkCvMQ/h/+2XIsn6vYOKYJLC
	qZpR+IpTGeEwVOTTuErSQTgQ7X5y+G+cBSwTh4w9Y8kcljn8wkU3rO6sDDPOQ9SI7zViOj/A3OQ
	qQAHSk/kmtmM1ScByjz0IIux/Esr4PvGWUQZVlQeRaiRCXvlndJLEHNPytei0Zn6VPmfv7rJYDA
	qVgXZrmhDDVIl4092V/Y6W2UroBMXQrItFbEWkrUDiErfkgAxAAOFR11aXvvQ364BUjbDB7oxLh
	ccOzETBwyWZ3mlqaXS08UZ4MnYs0kFly0DMM+mxH8o8DJJmalp+89hOGEsBkERCa7YauoaJa56Q
	UD8+H+82I2xd5TRkU3HrNjGdGlcqaXIRIchIukgUWoE4XxkqkMhMro7RyIvbF5xnc+9tSyfb9r/
	d0X+ty/KH0S8D1wYPgVl148OC39t/xYfRXnzf1M3j2PkN+26bnaQZyWVOOM0OX++srxHbeY
X-Received: by 2002:ac8:5dd3:0:b0:536:5880:18d4 with SMTP id d75a77b69052e-53fcb405265mr9279481cf.11.1793135399767;
        Tue, 27 Oct 2026 14:09:59 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm88408511cf.9.2026.10.27.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:09:59 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 21:09:35 +0000
Subject: [PATCH 09/10] ovl: handle lazytime on the upper filesystem
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
Message-Id: <20261027-b4-ovl-containerized-sync-v1-9-802e512379a6@toxicpanda.com>
References: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
In-Reply-To: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Theodore Ts'o <tytso@mit.edu>, Carlos Maiolino <cem@kernel.org>, 
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793135381; l=5850;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WffpsAXKwTQqf83nJP119j1Jd4hzsWKOXiJG8yAZsIk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDBOAB3vsD4IIEsENxm4Cbj+yNyi7T+iuxb5c/jdPaBOmChKrtvufcHhVBDJ9B8FjWGLvLR0Lgt
 DHwCl2GL0xAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With lazytime the timestamps of the upper inode stay in memory.  A pass of
the flusher writes the data and leaves them alone, for up to 12 hours, so
the overlay inode can't be clean after it: a syncfs() which only looks at
dirty overlay inodes would miss the timestamps.

Keeping it dirty for that long isn't an option either.  The flusher would
walk it every time, and a dirty inode can't be reclaimed.  The upper inode
doesn't have that problem.  It sits on a list of its own, and its
timestamps are written when its last reference goes away, which is what
happens under memory pressure.  But the overlay inode holds a reference to
it.

Do the same one level up.  When the timestamps are all that is left, give
the overlay inode I_DIRTY_TIME.  That takes it off the list which the
flusher walks, while syncfs() still gets to it.  Implement
->sync_lazytime() to pass on to the upper inode what the VFS tells the
overlay inode: on syncfs() and fsync(), when the 12 hours are over, and
when the last reference to the overlay inode goes away.

A change through the overlay to an inode which is parked like this also
writes the timestamps, because marking it dirty ends in ->sync_lazytime().

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/dir.c       |  1 +
 fs/overlayfs/inode.c     | 17 +++++++++++++++++
 fs/overlayfs/overlayfs.h |  1 +
 fs/overlayfs/super.c     | 24 ++++++++++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 1194ccf981c3..fc47beffa67e 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -1489,6 +1489,7 @@ const struct inode_operations ovl_dir_inode_operations = {
 	.get_acl	= ovl_get_acl,
 	.set_acl	= ovl_set_acl,
 	.update_time	= ovl_update_time,
+	.sync_lazytime	= ovl_sync_lazytime,
 	.fileattr_get	= ovl_fileattr_get,
 	.fileattr_set	= ovl_fileattr_set,
 	.tmpfile	= ovl_tmpfile,
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 9a4bf7c2502b..858802969017 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -743,6 +743,20 @@ int ovl_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	return err;
 }
 
+/*
+ * The overlay inode has I_DIRTY_TIME because the upper inode has, see
+ * ovl_park_inode().  Pass it on, and keep track of the upper inode until that
+ * has been written.
+ */
+void ovl_sync_lazytime(struct inode *inode)
+{
+	struct inode *upper = ovl_inode_upper(inode);
+
+	if (upper && (inode_state_read_once(upper) & I_DIRTY_TIME))
+		mark_inode_dirty_sync(upper);
+	ovl_mark_inode_dirty(inode);
+}
+
 static const struct inode_operations ovl_file_inode_operations = {
 	.setattr	= ovl_setattr,
 	.permission	= ovl_permission,
@@ -752,6 +766,7 @@ static const struct inode_operations ovl_file_inode_operations = {
 	.get_acl	= ovl_get_acl,
 	.set_acl	= ovl_set_acl,
 	.update_time	= ovl_update_time,
+	.sync_lazytime	= ovl_sync_lazytime,
 	.fiemap		= ovl_fiemap,
 	.fileattr_get	= ovl_fileattr_get,
 	.fileattr_set	= ovl_fileattr_set,
@@ -763,6 +778,7 @@ static const struct inode_operations ovl_symlink_inode_operations = {
 	.getattr	= ovl_getattr,
 	.listxattr	= ovl_listxattr,
 	.update_time	= ovl_update_time,
+	.sync_lazytime	= ovl_sync_lazytime,
 };
 
 static const struct inode_operations ovl_special_inode_operations = {
@@ -774,6 +790,7 @@ static const struct inode_operations ovl_special_inode_operations = {
 	.get_acl	= ovl_get_acl,
 	.set_acl	= ovl_set_acl,
 	.update_time	= ovl_update_time,
+	.sync_lazytime	= ovl_sync_lazytime,
 };
 
 static const struct address_space_operations ovl_aops = {
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index f5a17bc258b6..ad1084be6191 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -867,6 +867,7 @@ static inline struct posix_acl *ovl_get_acl_path(const struct path *path,
 
 int ovl_update_time(struct inode *inode, enum fs_update_time type,
 		unsigned int flags);
+void ovl_sync_lazytime(struct inode *inode);
 bool ovl_is_private_xattr(struct super_block *sb, const char *name);
 
 struct ovl_inode_params {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 954648d41700..631f68a97980 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -344,6 +344,28 @@ static bool ovl_upper_unfinished(struct inode *upper)
 	       (inode_state_read_once(upper) & I_SYNC);
 }
 
+/*
+ * All that is left of @inode are timestamps which lazytime holds back on the
+ * upper filesystem.  A pass which does not wait leaves them alone, for up to 12
+ * hours.  Do to the overlay inode what was done to the upper inode: with
+ * I_DIRTY_TIME it is off the list which the flusher walks, syncfs() still gets
+ * to it, and ovl_sync_lazytime() is told when the time has come.
+ *
+ * One such time is when the last reference goes away, which it never does for
+ * the upper inode as long as the overlay inode is there.  It may have gone away
+ * already.  iput() looks for I_DIRTY_TIME under i_lock before it drops the last
+ * reference, so either it sees the flag or the count is zero here.
+ */
+static void ovl_park_inode(struct inode *inode)
+{
+	if (!ovl_tracks_dirty(OVL_FS(inode->i_sb)))
+		return;
+
+	__mark_inode_dirty(inode, I_DIRTY_TIME);
+	if (!icount_read_once(inode))
+		mark_inode_dirty_sync(inode);
+}
+
 static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 {
 	struct inode *upper = ovl_inode_upper(inode);
@@ -360,6 +382,8 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 
 	if (ovl_upper_unfinished(upper))
 		ovl_mark_inode_dirty(inode);
+	else if (inode_state_read_once(upper) & I_DIRTY_TIME)
+		ovl_park_inode(inode);
 
 	return ret;
 }

-- 
2.55.0

