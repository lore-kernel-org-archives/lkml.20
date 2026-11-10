Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320712;
	b=otHmDXMiDt0XylE+gchp3uNgnwcUjX4qJPUB7A94ZiuaLQVebULF/MNLfsKXMHHHY3ZI
	 ES5266WYpuWEmUJ+Yc92n/pjmD8X4K/RIV/f77ie+/XyjIyvb96zQvXEAM/NgAJvPN7e+
	 p4gOmK7yDiSSFpFLXPUb7F48brZpxxu0CaYvtxT9F0CswW3NDhusXaV2m85axham9yKDZ
	 FU/m1DJKhpAeccjM21r4wKYE8c/8ZKmtPGGppuD2QmUFKUG4mTFaV3bHqescaATU/PuKy
	 5a5rVrY6/YqaKD06jdQ8MqVZwxMBgJ/D0l1+ncV5pxz1Wmbh1YQOLZ1w3uEiWdxVr9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PnSFXHaGUn2yIPfXv3C/P2JPWkITSQ8aFixM4hBP1M8=;
	b=QGHA07qfiuMiw7dpsk3QKJjRGFfMOvPMDL9LAYC/TbWFUBjEby0p4fK/Z5Lks944VF8R
	 f6zbFUQ0u4ohWBUZYgyPaznS0CLNLqZwHdHGFNhQurPZ1BRZIgvp0a9vHGh7ilRibAmPR
	 pwg7x3Q6GKQigOcK0fJCajEieWOZo2Ip7KBZu/VFd9wNps08uKTTo4H5amy9JW//cLcCV
	 WzhFDnr6tNufxmEyiSkQGHqIJLdxrRJKsqels+kAF8VS87h6R3F6WdaIO3HHwwra3CWnu
	 hQ/w9l8gyxb5kZ7zUaCMZdtgHSHIviYePo0u7h2adVQx9vs4jJdmgtx03fEuoY09qOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=M42pjxXs;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C660727C4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595C660727C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=M42pjxXs
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e7ad9f78dso256444185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320711; x=1794925511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnSFXHaGUn2yIPfXv3C/P2JPWkITSQ8aFixM4hBP1M8=;
        b=M42pjxXsCNla9wZH4Bfr6Rx0U1n/wSCDmWlTJH7YWlDzQBsCFxKzw71g8V5ulXqVZ3
         5BEIHRU+4s8FJxCTg+l8WjgRfh+zLkq0llIMSUn0uae6fw+HuadJBGBPJdPMB/w/WTuR
         R83WQak/SMBisyHwQKseg+wSyl/7fpG9SsZdlhjSntHDP8KY41olLhRDCy/gmUdVhqdu
         b9YQRooho8n2F93dD/77VXGZJnswGceDjOkJ+SusWCFaXvC5pvWGpwx0HhPr2+VldUtf
         y0o4YqTO3lqB39XSFfyJ7r7UGgl8XfCkzAWtVlgyQCb9cHdx3nntPfHGltIZz5c/Uwp9
         g9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320711; x=1794925511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnSFXHaGUn2yIPfXv3C/P2JPWkITSQ8aFixM4hBP1M8=;
        b=HtPKFyItcxukMpUsICAJk8ddoYAupIXH0dNTyjkQOeNxTRwgiFuLblCh1fnObmvTCL
         wQ2Xsy7I4wfPaN+m+13XcvGygoUVp5g4SgNh65IBuFP1wWHWaVokHoPQ/VfdiH+n9lej
         XfDQHzx+WfJs9s6v6FFRyznv+6GNCYgsh5DmHX4THBo/LcOH0fVsMi/2mkQ+2b8abKRW
         ELWsEFALhllF22t2Zb2W6KvNvdjdVaFhwBxilyTGt7HL61RrZQy4AaMErp2NdxoasVSY
         KVB8oFLYwXq3E0aH6BYV/6IEg+pSghKRCnprcadkVkv/JJIeI8w3Cvzb6H4Z3tPwoqi0
         szCg==
X-Forwarded-Encrypted: i=1; AL+hErF8jdfmadcWIGVux/I16M5TtwM4Qu9ksC2uOro+cbzlATx3jFxwk5EihNvrABwnwrvUqaKaOoNKykDZR0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lAID5VLE1ZySe/Lnx2DKYGX3YB8OcSRZT3XmlSTbnr9zYOmRh
	HMuEHcj/6wpixFvSG+7dVTPdJU8GDRR99TcC9Gb4pVij9qduxLH8tpd1QBo/udigXsA=
X-Gm-Gg: AYBFou3WYwsyn7obTe/kHo7es75vFjOXhvHuXVfW4FmbRZoyT0H23BDdr23pD5IQjgZ
	hps8dX0a0qWoDbNNBls/ejZWCkpvKaRtjEUnc8jWQK5ZRrbcdlTWlMBNmsDUwAil+FkKC/xr6ib
	gnCvq8V0OPanSXerV/x30ZOWXebN6Kib0FvL/CfVkNLmyygdkHs+sdlhBkMMe0+V69yBrX/LAMr
	uihhBTWcAN0EDexXbwRArgS9a83BasNfLG7I9QBdjhCqtxK+tn7AJppBAO5HxFSj9FkcfMrqUCj
	OtcAfpmWdkfYUg9ugelpEFQoorsq4Iycbk14i3VVfGP5G+J6TJ8dW2+bhJktIXwm5z6h11ynnz2
	7dFWjFRIs7U3y050SPnbw9PqZiUu08pLWk9RM6LKI/1db0mED8c3Clms8mzPsQ6ZGQn8jskeyje
	oVN5kmoHSTSE2d0l/aP3/qi+padwVMUXlbdRtvXTfnNtUBc1aQY1wNzLvVooqJ4aYnOabgRX8vN
	blOhao1/M0uQCAQhxIXSQFNEKq86dlmxI5lhj5L1wCeCMw3CeseLYR/ERjUyy9JrN2D6kLEaeXV
	EfDNh5zzoz6YlkH+WxXGKA2fIrNLZ/oQ7VTaVAGpLPajsw==
X-Received: by 2002:a05:620a:4116:b0:93e:c12c:f13e with SMTP id af79cd13be357-9479f413983mr450270685a.72.1794320711279;
        Tue, 10 Nov 2026 06:25:11 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c3ddsm235667085a.15.2026.11.10.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:10 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:55 +0000
Subject: [PATCH v6 7/9] ovl: write the timestamps that lazytime defers
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
Message-Id: <20261110-b4-ovl-containerized-sync-v6-7-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=5839;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Nv1r5C0/Y5oVgtY4/ksHbWZkZMzqkK9iJ3SOAzP4iyI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCT0VPvZQchV3+xu84q1AQG1+wzCS6JflCSJPQztBERsJjORgtPlnGGItO6NxRi6hFOkTeP06Y5
 VsRx8zje0cgM=
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

If the timestamps could not be handed over, writing the upper inode
without waiting moves it to the tail of b_dirty_time.  The sync of a freeze
or of a read-only remount that has just looked at the clock skips it there.
The timestamps are written after the thaw.  After a read-only remount they
stay in memory.

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

