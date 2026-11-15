Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749260;
	b=ylyPRwDDAMdRFDfuqCjqHyaTogVy/D2chByacfBxY72NSJMFeETDD0n25C/VJE6HGO8f
	 7gZkRWFEVmAao67q+BF9+VnqiN4duWPKk0RRGfyl7KlDCcCPOiZilfZ3aZFDSqkQMLGpP
	 MbbWxX+1MrYRr+F1IRx9w7h0C91+gRUBTEl8QgvPugPqReBkIYlMwbhu6QcenugBp2fi8
	 FVIyqLW1Pt3ZU3V7lrngV6Edjk+YysRBP7syo5tPLEz9/VsHeB9wiTlx9cI/yKn4A47zt
	 gGZ9DRHgGvJ6z85hepg0zbnU4KR/1HL3b/2mFQfAz/IsOV4/67Td9yo3kyYchnDwZUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749260;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=dOjv39u+QdaOW4a8RXiHMwV10o0QoRCOlOEkLTo3G54=;
	b=DEQDF/05eotk/Jh0mdT3G3CwLmdwmhCtk1t3HHDEs8Gk0BIKa+CkGOBProOIpSo3DmGI
	 foStX+oyQUiVUX5uqDzmUMSkCRmPYrvebgX+LHSAIdoWQMKy/JZd0UPpZysHfRSQcvxdE
	 29OEAkIt7djazue8CoUu7pnleiLepue01o5KF75lNw5V2FkpJTeMSe5g9Nb9YEqpZkkZp
	 PKekU2m4JZ+sl0xGxHGR3erRdNvHpQ4oxgiHBjMn8zKa282FdtYR8i9cFLonmr1RYDgjq
	 v/5uZHQB2WL5bQd9tdcPe9BxCVFSuflMlsBsFD2E2SUNzGQNpm+ORRZHS9sIzbFhWuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IvNxdYLK;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB90606A8BF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB90606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IvNxdYLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dO
	jv39u+QdaOW4a8RXiHMwV10o0QoRCOlOEkLTo3G54=; b=IvNxdYLKEcvIzKAX94
	UNggLy1P+sqB9J67hd3y1SXFePlIwbwD51zy8IyinePi3zsynvbJaDbgY6IPfGf7
	vCV4s51SmGajY4JBp3fEtWCe2P3lgPpBhL3MNeyj1T1ktcXIQJvl6zMhcLxZrxnE
	l+7bmbYG0XVjYJCn7yRMUA7xM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S5;
	Sun, 15 Nov 2026 21:27:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 11/12] ntfs: flush internal attributes before unlinking a file
Date: Sun, 15 Nov 2026 21:26:08 +0800
Message-ID: <20261115132609.209957-12-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF45tFW3ZFWxXw4kuF4UArb_yoW7KF4DpF
	ZxKry3tw42qr9Fgrs3ta1UZ34Sva1I9ay7WrZxJ3WfAw1DXw12gFW0kryxWF1rtrWfXrWq
	qF4Uu3y7u3yUXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jd_-PUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hgU3mr5szgKYQAA3L

From: Baolin Liu <liubaolin@kylinos.cn>

Removing a file's last name clears internal attribute link counts and
can discard dirty folios while the file is still open. A later
fgetxattr() can return stale data; rename-overwrite has the same
problem.

Flush cached internal attributes before removing names. Release MFT
locks for writeback, then reacquire and rescan to catch concurrent
conversions. Return writeback errors before namespace changes. Preserve
named-stream lifetime handling.

Also make internal attribute writes and conversions synchronous once the
base inode has no links, covering the interval before cleanup clears the
attribute inode's own link count.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
New in v4. Fixes the preexisting dirty-attribute loss on ordinary unlink
also identified in the review.

Reproduced stale EA reads after unlink and rename-overwrite before the
fix. Tested EA preservation with 512-byte/4 KiB/8 KiB clusters, rmdir,
directory replacement, hard links, post-unlink EA updates and reclamation.
Injected EA block-write EIO returned before names or link counts changed;
rewrite/retry passed. Concurrent EA reads/writes, fsync and unlink/rename
passed with four CPUs, NTFS debug and lockdep.

 fs/ntfs/attrib.c |  2 +-
 fs/ntfs/inode.c  |  6 +++--
 fs/ntfs/namei.c  | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index af044ea895fc..29eae1eb3d02 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2064,7 +2064,7 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
 		base_ni = ni;
 	else
 		base_ni = ni->ext.base_ntfs_ino;
-	sync = NInoAttr(ni) && !vi->i_nlink &&
+	sync = NInoAttr(ni) && (!vi->i_nlink || !VFS_I(base_ni)->i_nlink) &&
 		!ntfs_inode_is_named_stream(ni);
 	m = map_mft_record(base_ni);
 	if (IS_ERR(m)) {
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4a4d7d36ad34..fb2f08265cc1 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4093,9 +4093,11 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 	/*
 	 * A zero-link attribute inode is evicted at the final iput(), even
 	 * if its base file has since been linked. Write its data before
-	 * eviction can discard the dirty pages.
+	 * eviction can discard the dirty pages. Also cover the interval after
+	 * unlink clears the base inode's link count but before attribute cleanup.
 	 */
-	if (!vi->i_nlink && !ntfs_inode_is_named_stream(ni))
+	if ((!vi->i_nlink || !VFS_I(base_ni)->i_nlink) &&
+	    !ntfs_inode_is_named_stream(ni))
 		sync = true;
 
 	if (ntfs_inode_is_named_stream(ni)) {
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 3eb2d57bef1b..1b4d1e02e183 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -911,6 +911,58 @@ static int ntfs_test_inode_attr(struct inode *vi, void *data)
 	return 0;
 }
 
+static int ntfs_match_dirty_attr(struct inode *vi, u64 mft_no, void *data)
+{
+	struct ntfs_inode *ni = NTFS_I(vi);
+	int found = 0;
+
+	if (ni->mft_no != mft_no || !NInoAttr(ni) ||
+	    ntfs_inode_is_named_stream(ni))
+		return 0;
+
+	spin_lock(&vi->i_lock);
+	if (!(inode_state_read(vi) & (I_NEW | I_CREATING | I_FREEING | I_WILL_FREE)) &&
+	    (mapping_tagged(vi->i_mapping, PAGECACHE_TAG_DIRTY) ||
+	     mapping_tagged(vi->i_mapping, PAGECACHE_TAG_WRITEBACK))) {
+		__iget(vi);
+		found = 1;
+	}
+	spin_unlock(&vi->i_lock);
+	return found;
+}
+
+/*
+ * Return with the target's mrec_lock held and its internal attributes clean.
+ * Rename also needs the source locked first. Drop both locks for writeback,
+ * then rescan under the locks to catch concurrent attribute conversions.
+ * Directory mrec_locks must not be held by the caller.
+ */
+static int ntfs_lock_unlink_inodes(struct ntfs_inode *ni,
+				   struct ntfs_inode *source_ni)
+{
+	struct inode *attr_vi;
+	int err;
+
+	for (;;) {
+		if (source_ni)
+			mutex_lock_nested(&source_ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+		mutex_lock_nested(&ni->mrec_lock, source_ni ?
+				  NTFS_INODE_MUTEX_NORMAL_2 : NTFS_INODE_MUTEX_NORMAL);
+		attr_vi = find_inode_nowait(VFS_I(ni)->i_sb, ni->mft_no,
+					    ntfs_match_dirty_attr, NULL);
+		if (!attr_vi)
+			return 0;
+		mutex_unlock(&ni->mrec_lock);
+		if (source_ni)
+			mutex_unlock(&source_ni->mrec_lock);
+
+		err = filemap_write_and_wait(attr_vi->i_mapping);
+		iput(attr_vi);
+		if (err)
+			return err;
+	}
+}
+
 static void ntfs_cleanup_deleted_inode(struct ntfs_inode *ni)
 {
 	struct inode *attr_vi;
@@ -961,7 +1013,9 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	ntfs_debug("Entering.\n");
 
 	if (need_lock == true) {
-		mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+		err = ntfs_lock_unlink_inodes(ni, NULL);
+		if (err)
+			return err;
 		mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
 	}
 
@@ -1454,9 +1508,13 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 
 	ntfs_set_volume_flags(vol, VOLUME_IS_DIRTY);
 
-	mutex_lock_nested(&old_ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
-	if (new_ni)
-		mutex_lock_nested(&new_ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL_2);
+	if (new_ni) {
+		err = ntfs_lock_unlink_inodes(new_ni, old_ni);
+		if (err)
+			goto out_names;
+	} else {
+		mutex_lock_nested(&old_ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+	}
 
 	if (old_dir == new_dir) {
 		mutex_lock_nested(&old_dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
@@ -1540,6 +1598,7 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 	mutex_unlock(&old_ni->mrec_lock);
 	if (new_ni)
 		ntfs_cleanup_deleted_inode(new_ni);
+out_names:
 	if (uname_new)
 		kmem_cache_free(ntfs_name_cache, uname_new);
 	if (uname_old)

