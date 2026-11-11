Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401574;
	b=37gK/2o1Rr0RBxkcx8ZnmgtZBK25tUbKZYmI5QlSQMYtsEBchVlJxOSRuTCBGf4Gtj7g
	 IkOGONJPD3GUJSq0f9QoGG0PUx2UJM7Fii9SAW4xC9eS0fbCFYYvqUhzGMMKjeRYGE0wD
	 wstHyNAG4UQ8cwcbByC6ymvLNI2nMzz6rckqej0ug7LMCm3PAIksREfD8HeBmqUyS3RaQ
	 ccIhoeyTo48pxIL5NQI57gEZznr1Vnb3xeUkK42QaYWmKiVTrDCY0RD1gLNJEtgkiqIod
	 n3R4LPAXw92iysfLSUszx7m2Jd8gTVjHFscGlAkawR+fUFUrxJUfUn7EmBhZay0wOsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ueFetpltForRH8jVMnKuF2dT171bhRh05oWcrvXHWkc=;
	b=CLeQG9y1XIQCymb0tK6s9dTlFEb1Ofk7lSTGMOd20Tv0tTX/EfBjKCnz2rPR3Ju59jvo
	 PQMD/nESROfxTw5JVrNpbVAb3PO1Clx9ni15LtePQ5fso+Ee1zmTFNU18YAj6W8Uvymqc
	 wxYtSUu866IKahczismW6ui4GXp/VetMozoMPC3Bnl359/Sta0Tk26oVJ5w4oMq54qIPI
	 RuuYafU2PM0T84F8/rp0cttV6gs8q78HkwuwbxzYPpyg0Ikq+RNKW/5hddf9wkGlKL4zx
	 9cuBq9dPdKC+6a2XCyipqEnp4fvaVk+vgfWy79Tt8lhCE546VJdtJV4itkZE9+iDaaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MKUhQhyl;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MKUhQhyl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so39576165e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794401572; x=1795006372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFetpltForRH8jVMnKuF2dT171bhRh05oWcrvXHWkc=;
        b=MKUhQhylXe2bWrupqZ1tJpwpFFhmSeBkvRQDK8arHdNn9K5ZsAg4QE8+mx9MM0Msqu
         dHoWC/Pu5MhYGdtKE4yK98GibifRNL8vtlK/llNBV/QB9h5g2w2yTQ7/6g4NWyBp3h5U
         dzjKfKxxpp1sZEBLZd2oBQR+0/sKPMlh6EF+e2J6DZKoBwS2YOLTIi5aEE2u/oNIKcqf
         LNElDsICZHsAAE2gVRZ9ZgNZanBNU42RSgbCZ+ptR6Pco67hgJ+043OG6khCAVnYVFNd
         qIrn6kAS8o3iXAie9Ta8MDySnZs6vPGmQGuU1aME3SpvlrqoRE+lWdKQWlt1bMNi6tHC
         oHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401572; x=1795006372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFetpltForRH8jVMnKuF2dT171bhRh05oWcrvXHWkc=;
        b=e5dcJIF6g+3pZsVEngI/mOyBA9lBfsBrvrXXCXgPpI6WQ/gfUVYbkkewIDc5SMsAOE
         vIfrPNql0lEBLR5CQXLigoncRbpQ43Cdf7oWrRG+CkyBBggg1zrkAAnBmtgHfRLi5uq2
         QtsoYRD7xLMraeiKUOI2zObvpFG9BmGXTuN7cSlwmStAjRLf6dPzToDywwgPHImW/j7q
         yi69npOgsO41zVSthJUqlsGwtwGVFJGO+9DQj49PJhP2JvlTehdyFHo0ucs/ghbNWZVd
         5YDINuGySZEkZ2JAS9pqdvA47GvqVh+G5BBVfvoQzK26s+VYtxcyudonhSJJaLx3i2ay
         fLBQ==
X-Forwarded-Encrypted: i=1; AL+hErFrZ0C9x1AbEfhEbsSpoXGyuREqj6k5cLh9KJktsVlSgfVF06VGVRqKJviv6pVJk/J8AtSlaoMum7r2bto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AssyJmfQxdP64Q2Nb2Mc78XUZW8EEyFbmPGpKLQXp5PSzQLec
	hwxwwpM676govcrrxdzZx919IAxXabtyyfofr6tshcwchmk/74jUIRbNAk4fAS27mY4=
X-Gm-Gg: AYBFou1nQOpGJcvZQzCU2VffhmGUuwT3hjAUVJJhAOVKh3kZ78LNG/f4V5c6c083Sh5
	jaHZ+CwQF85kLOWe1fMnuxEDJc4mm3ZxTBe2sIbzrJXfh06jNqxJ6Dlf4EZqXNqAzYjzBw2XfQ9
	BsuzYiUVQjArDYiyAElW7KMVekE3zjIki0V1Alz22uPk/MeGdDaEBGK737NzQ/sPsFDcaUJnoGR
	qoINiDH1Gfg9gyFFR7l+pX4ELaAjoQC+QM1h3481BnDEZyL3TwkekzRXcQei+1jyXG09PZ/ZLSN
	oM0UtBGc3/gf3uY+Joq3PIqGjx5Yf/pdA7HeRRJ9KfasRrbGMqOWLd3Lvu0wcWNZDpIXKV3Cut0
	xdqDMoyu01RRlGHN/2F1u303PNGKZcckAoosx4FZKr89+HrN+/ImMUFXGPy2x5Kv2+fQ9M1SpIo
	leff9LNJ95jnwqCf7mJmMj0GUZlC7yNJ00zAvb0BaVfo95nMv3T8MePxukUSglg5Pbu/6nZEAWy
	sVJ5QjIbXsU4okO/TSGB+4E1OQoM0PcADob87iqOqiCnFdyMO/66HLlJaFbmxzVdo+nQYYQCBne
	eCq/UXr2fRXVLzEZ0Jg10TdB9O2VrDEaj6AU6+buTUXY5hMDCqQwoaX1ecMRnw8n1GPDkP8QKWx
	ehbujf0UzVr90dzsFvfnx8Rl8W2pz9w==
X-Received: by 2002:a05:600c:4e11:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4ba0937797dmr39276705e9.5.1794401572270;
        Wed, 11 Nov 2026 04:52:52 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm132712185e9.7.2026.11.11.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:52:52 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 1/3] ext4: make fast commit support optional
Date: Wed, 11 Nov 2026 13:52:40 +0100
Message-ID: <20261111125242.1078620-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111125242.1078620-1-max.kellermann@ionos.com>
References: <20261111125242.1078620-1-max.kellermann@ionos.com>
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

Add CONFIG_EXT4_FS_FAST_COMMIT, enabled by default, to allow builds
without fast commit support.  Disabling it saves 48 bytes per inode.

Fall back to ordinary journal commits and reject journals requiring
fast commit recovery.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/filesystems/ext4/journal.rst |  7 +++
 fs/ext4/Kconfig                            | 16 ++++++
 fs/ext4/Makefile                           |  3 +-
 fs/ext4/ext4.h                             | 63 ++++++++++++++++++++++
 fs/ext4/inode.c                            |  4 +-
 fs/ext4/super.c                            | 30 ++++++++---
 fs/ext4/sysfs.c                            |  6 +++
 include/trace/events/ext4.h                |  3 ++
 8 files changed, 121 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/ext4/journal.rst b/Documentation/filesystems/ext4/journal.rst
index 6e8fb2d4b46f..2eae34487322 100644
--- a/Documentation/filesystems/ext4/journal.rst
+++ b/Documentation/filesystems/ext4/journal.rst
@@ -39,6 +39,13 @@ A full commit invalidates all the fast commits that happened before
 it and thus it makes the fast commit area empty for further fast
 commits. This feature needs to be enabled at mkfs time.
 
+Fast commit support can be omitted with ``CONFIG_EXT4_FS_FAST_COMMIT=n``
+to reduce the memory used by each in-memory inode. Such kernels use
+ordinary journal commits and can mount clean filesystems with the
+``fast_commit`` feature. If the journal advertises fast commit records,
+mounting with journal loading is refused; recover the filesystem first
+using a kernel or e2fsck with fast commit support.
+
 The journal inode is typically inode 8. The first 68 bytes of the
 journal inode are replicated in the ext4 superblock. The journal itself
 is normal (but hidden) file within the filesystem. The file usually
diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index 01873c2a34ad..0f3e702cd5e1 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -43,6 +43,22 @@ config EXT4_USE_FOR_EXT2
 	  compiled kernel size by using one file system driver for
 	  ext2, ext3, and ext4 file systems.
 
+config EXT4_FS_FAST_COMMIT
+	bool "Ext4 fast commit support"
+	depends on EXT4_FS
+	default y
+	help
+	  Fast commits reduce journal commit latency by logging metadata
+	  changes instead of complete metadata blocks. They are used on
+	  filesystems with the fast_commit feature enabled.
+
+	  Say N to reduce memory usage per inode and omit fast commit code.
+	  Clean filesystems with the fast_commit feature can still be mounted
+	  using ordinary journaling, but journals containing fast commits must
+	  first be recovered by a kernel or e2fsck with fast commit support.
+
+	  If unsure, say Y.
+
 config EXT4_FS_POSIX_ACL
 	bool "Ext4 POSIX Access Control Lists"
 	depends on EXT4_FS
diff --git a/fs/ext4/Makefile b/fs/ext4/Makefile
index 3f9fc0eb8eca..e6a2d84211ec 100644
--- a/fs/ext4/Makefile
+++ b/fs/ext4/Makefile
@@ -10,8 +10,9 @@ ext4-y	:= balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o \
 		indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o \
 		mmp.o move_extent.o namei.o page-io.o readpage.o resize.o \
 		super.o symlink.o sysfs.o xattr.o xattr_hurd.o xattr_trusted.o \
-		xattr_user.o fast_commit.o orphan.o
+		xattr_user.o orphan.o
 
+ext4-$(CONFIG_EXT4_FS_FAST_COMMIT)	+= fast_commit.o
 ext4-$(CONFIG_EXT4_FS_POSIX_ACL)	+= acl.o
 ext4-$(CONFIG_EXT4_FS_SECURITY)		+= xattr_security.o
 ext4-test-objs				+= inode-test.o mballoc-test.o \
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bf0325ecbec7..1aedbfbcb101 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1089,6 +1089,7 @@ struct ext4_inode_info {
 		unsigned int i_orphan_idx;	/* Index in orphan file */
 	};
 
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	/* Fast commit related info */
 
 	/* For tracking dentry create updates */
@@ -1119,14 +1120,17 @@ struct ext4_inode_info {
 	 * - data range records for EXT4_FC_TAG_{ADD,DEL}_RANGE
 	 */
 	struct ext4_fc_inode_snap *i_fc_snap;
+#endif
 
 	spinlock_t i_raw_lock;	/* protects updates to the raw inode */
 
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	/*
 	 * Protect concurrent accesses on i_fc_lblk_start, i_fc_lblk_len
 	 * and inode's EXT4_FC_STATE_COMMITTING state bit.
 	 */
 	spinlock_t i_fc_lock;
+#endif
 
 	/*
 	 * i_disksize keeps track of what the inode size is ON DISK, not
@@ -1845,6 +1849,7 @@ struct ext4_sb_info {
 	unsigned int s_awu_min;
 	unsigned int s_awu_max;
 
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	/* Ext4 fast commit sub transaction ID */
 	atomic_t s_fc_subtid;
 
@@ -1877,6 +1882,7 @@ struct ext4_sb_info {
 	int s_fc_debug_max_replay;
 #endif
 	struct ext4_fc_replay_state s_fc_replay_state;
+#endif
 };
 
 static inline struct ext4_sb_info *EXT4_SB(struct super_block *sb)
@@ -1912,6 +1918,7 @@ static inline void ext4_writepages_up_write(struct super_block *sb, int ctx)
 	percpu_up_write(&EXT4_SB(sb)->s_writepages_rwsem);
 }
 
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 static inline int ext4_fc_lock(struct super_block *sb)
 {
 	mutex_lock(&EXT4_SB(sb)->s_fc_lock);
@@ -1923,6 +1930,7 @@ static inline void ext4_fc_unlock(struct super_block *sb, int ctx)
 	memalloc_nofs_restore(ctx);
 	mutex_unlock(&EXT4_SB(sb)->s_fc_lock);
 }
+#endif
 
 static inline int ext4_valid_inum(struct super_block *sb, unsigned long ino)
 {
@@ -3086,6 +3094,12 @@ extern int ext4_init_inode_table(struct super_block *sb,
 void ext4_end_bitmap_read(struct bio *bio);
 
 /* fast_commit.c */
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
+static inline bool ext4_fc_inode_tracked(struct inode *inode)
+{
+	return !list_empty(&EXT4_I(inode)->i_fc_list);
+}
+
 int ext4_fc_info_show(struct seq_file *seq, void *v);
 void ext4_fc_init(struct super_block *sb, journal_t *journal);
 void ext4_fc_init_inode(struct inode *inode);
@@ -3112,6 +3126,55 @@ void ext4_fc_destroy_dentry_cache(void);
 int ext4_fc_record_regions(struct super_block *sb, int ino,
 			   ext4_lblk_t lblk, ext4_fsblk_t pblk,
 			   int len, int replay);
+#else
+static inline bool ext4_fc_inode_tracked(struct inode *inode)
+{
+	return false;
+}
+
+static inline void ext4_fc_init(struct super_block *sb, journal_t *journal) {}
+static inline void ext4_fc_init_inode(struct inode *inode) {}
+static inline void ext4_fc_track_range(handle_t *handle, struct inode *inode,
+				       ext4_lblk_t start, ext4_lblk_t end) {}
+static inline void __ext4_fc_track_unlink(handle_t *handle, struct inode *inode,
+					  struct dentry *dentry) {}
+static inline void __ext4_fc_track_link(handle_t *handle, struct inode *inode,
+					struct dentry *dentry) {}
+static inline void ext4_fc_track_unlink(handle_t *handle, struct dentry *dentry) {}
+static inline void ext4_fc_track_link(handle_t *handle, struct inode *inode,
+				      struct dentry *dentry) {}
+static inline void __ext4_fc_track_create(handle_t *handle, struct inode *inode,
+					  struct dentry *dentry) {}
+static inline void ext4_fc_track_create(handle_t *handle, struct dentry *dentry) {}
+static inline void ext4_fc_track_inode(handle_t *handle, struct inode *inode) {}
+static inline void ext4_fc_mark_ineligible(struct super_block *sb, int reason,
+					   handle_t *handle) {}
+static inline void ext4_fc_del(struct inode *inode) {}
+static inline bool ext4_fc_replay_check_excluded(struct super_block *sb,
+						 ext4_fsblk_t block)
+{
+	return false;
+}
+
+static inline void ext4_fc_replay_cleanup(struct super_block *sb) {}
+static inline int ext4_fc_commit(journal_t *journal, tid_t commit_tid)
+{
+	return jbd2_complete_transaction(journal, commit_tid);
+}
+
+static inline int ext4_fc_init_dentry_cache(void)
+{
+	return 0;
+}
+
+static inline void ext4_fc_destroy_dentry_cache(void) {}
+static inline int ext4_fc_record_regions(struct super_block *sb, int ino,
+					 ext4_lblk_t lblk, ext4_fsblk_t pblk,
+					 int len, int replay)
+{
+	return 0;
+}
+#endif
 
 /* mballoc.c */
 extern const struct seq_operations ext4_mb_seq_groups_ops;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 134e6d8538dd..829095aedbe6 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -395,7 +395,7 @@ void ext4_evict_inode(struct inode *inode)
 	 */
 	WARN_ON_ONCE(!list_empty_careful(&inode->i_io_list));
 
-	if (!list_empty(&EXT4_I(inode)->i_fc_list))
+	if (ext4_fc_inode_tracked(inode))
 		ext4_fc_mark_ineligible(inode->i_sb, EXT4_FC_REASON_NOMEM, NULL);
 	ext4_clear_inode(inode);	/* We must guarantee clearing of inode... */
 }
@@ -3587,7 +3587,7 @@ static bool ext4_inode_datasync_dirty(struct inode *inode)
 			EXT4_I(inode)->i_datasync_tid))
 			return false;
 		if (test_opt2(inode->i_sb, JOURNAL_FAST_COMMIT))
-			return !list_empty(&EXT4_I(inode)->i_fc_list);
+			return ext4_fc_inode_tracked(inode);
 		return true;
 	}
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9cae52471dee..aced1a67a554 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1457,7 +1457,9 @@ static struct inode *ext4_alloc_inode(struct super_block *sb)
 	ei->i_datasync_tid = 0;
 	INIT_WORK(&ei->i_rsv_conversion_work, ext4_end_io_rsv_work);
 	ext4_fc_init_inode(&ei->vfs_inode);
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	spin_lock_init(&ei->i_fc_lock);
+#endif
 	ei->i_metadata_bhs = NULL;
 #ifdef CONFIG_LOCKDEP
 	lockdep_set_subclass(&ei->i_data_sem, I_DATA_SEM_NORMAL);
@@ -1480,7 +1482,7 @@ static void ext4_free_in_core_inode(struct inode *inode)
 {
 	fscrypt_free_inode(inode);
 	kfree(ext4_i_metadata_bhs(inode));
-	if (!list_empty(&(EXT4_I(inode)->i_fc_list))) {
+	if (ext4_fc_inode_tracked(inode)) {
 		pr_warn("%s: inode %llu still in fc list",
 			__func__, inode->i_ino);
 	}
@@ -1757,7 +1759,7 @@ enum {
 	Opt_no_prefetch_block_bitmaps, Opt_mb_optimize_scan,
 	Opt_buffered_iomap, Opt_nobuffered_iomap,
 	Opt_errors, Opt_data, Opt_data_err, Opt_jqfmt, Opt_dax_type,
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	Opt_fc_debug_max_replay, Opt_fc_debug_force
 #endif
 };
@@ -1877,7 +1879,7 @@ static const struct fs_parameter_spec ext4_param_specs[] = {
 	fsparam_u32	("init_itable",		Opt_init_itable),
 	fsparam_flag	("init_itable",		Opt_init_itable),
 	fsparam_flag	("noinit_itable",	Opt_noinit_itable),
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	fsparam_flag	("fc_debug_force",	Opt_fc_debug_force),
 	fsparam_u32	("fc_debug_max_replay",	Opt_fc_debug_max_replay),
 #endif
@@ -1993,7 +1995,7 @@ static const struct mount_opts {
 	 MOPT_SET | MOPT_2 | MOPT_EXT4_ONLY},
 	{Opt_nobuffered_iomap, EXT4_MOUNT2_BUFFERED_IOMAP,
 	 MOPT_CLEAR | MOPT_2 | MOPT_EXT4_ONLY},
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	{Opt_fc_debug_force, EXT4_MOUNT2_JOURNAL_FAST_COMMIT,
 	 MOPT_SET | MOPT_2 | MOPT_EXT4_ONLY},
 #endif
@@ -2048,7 +2050,7 @@ struct ext4_fs_context {
 	char		*s_qf_names[EXT4_MAXQUOTAS];
 	struct fscrypt_dummy_policy dummy_enc_policy;
 	int		s_jquota_fmt;	/* Format of quota to use */
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	int s_fc_debug_max_replay;
 #endif
 	unsigned short	qname_spec;
@@ -2354,7 +2356,7 @@ static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->s_max_dir_size_kb = result.uint_32;
 		ctx->spec |= EXT4_SPEC_s_max_dir_size_kb;
 		return 0;
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	case Opt_fc_debug_max_replay:
 		ctx->s_fc_debug_max_replay = result.uint_32;
 		ctx->spec |= EXT4_SPEC_s_fc_debug_max_replay;
@@ -2934,7 +2936,7 @@ static void ext4_apply_options(struct fs_context *fc, struct super_block *sb)
 	APPLY(s_resgid);
 	APPLY(s_resuid);
 
-#ifdef CONFIG_EXT4_DEBUG
+#if defined(CONFIG_EXT4_DEBUG) && defined(CONFIG_EXT4_FS_FAST_COMMIT)
 	APPLY(s_fc_debug_max_replay);
 #endif
 
@@ -4462,7 +4464,8 @@ static void ext4_set_def_opts(struct super_block *sb,
 #ifdef CONFIG_EXT4_FS_POSIX_ACL
 	set_opt(sb, POSIX_ACL);
 #endif
-	if (ext4_has_feature_fast_commit(sb))
+	if (IS_ENABLED(CONFIG_EXT4_FS_FAST_COMMIT) &&
+	    ext4_has_feature_fast_commit(sb))
 		set_opt2(sb, JOURNAL_FAST_COMMIT);
 	/* don't forget to enable journal_csum when metadata_csum is enabled. */
 	if (ext4_has_feature_metadata_csum(sb))
@@ -4590,6 +4593,7 @@ static void ext4_atomic_write_init(struct super_block *sb)
 
 static void ext4_fast_commit_init(struct super_block *sb)
 {
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	struct ext4_sb_info *sbi = EXT4_SB(sb);
 
 	/* Initialize fast commit stuff */
@@ -4611,6 +4615,7 @@ static void ext4_fast_commit_init(struct super_block *sb)
 	sbi->s_fc_replay_state.fc_modified_inodes = NULL;
 	sbi->s_fc_replay_state.fc_modified_inodes_size = 0;
 	sbi->s_fc_replay_state.fc_modified_inodes_used = 0;
+#endif
 }
 
 static int ext4_inode_info_init(struct super_block *sb,
@@ -6196,6 +6201,15 @@ static int ext4_load_journal(struct super_block *sb,
 			return PTR_ERR(journal);
 	}
 
+	/* Never let JBD2 skip fast commit recovery without a replay callback. */
+	if (!IS_ENABLED(CONFIG_EXT4_FS_FAST_COMMIT) &&
+	    jbd2_has_feature_fast_commit(journal)) {
+		ext4_msg(sb, KERN_ERR,
+			 "journal requires CONFIG_EXT4_FS_FAST_COMMIT recovery support");
+		err = -EOPNOTSUPP;
+		goto err_out;
+	}
+
 	journal_dev_ro = bdev_read_only(journal->j_dev);
 	really_read_only = bdev_read_only(sb->s_bdev) | journal_dev_ro;
 
diff --git a/fs/ext4/sysfs.c b/fs/ext4/sysfs.c
index 923b375e017f..c0231706330c 100644
--- a/fs/ext4/sysfs.c
+++ b/fs/ext4/sysfs.c
@@ -361,7 +361,9 @@ EXT4_ATTR_FEATURE(casefold);
 EXT4_ATTR_FEATURE(verity);
 #endif
 EXT4_ATTR_FEATURE(metadata_csum_seed);
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 EXT4_ATTR_FEATURE(fast_commit);
+#endif
 #if IS_ENABLED(CONFIG_UNICODE) && defined(CONFIG_FS_ENCRYPTION)
 EXT4_ATTR_FEATURE(encrypted_casefold);
 #endif
@@ -384,7 +386,9 @@ static struct attribute *ext4_feat_attrs[] = {
 	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(metadata_csum_seed),
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	ATTR_LIST(fast_commit),
+#endif
 #if IS_ENABLED(CONFIG_UNICODE) && defined(CONFIG_FS_ENCRYPTION)
 	ATTR_LIST(encrypted_casefold),
 #endif
@@ -631,8 +635,10 @@ int ext4_register_sysfs(struct super_block *sb)
 		proc_create_single_data("es_shrinker_info", S_IRUGO,
 				sbi->s_proc, ext4_seq_es_shrinker_info_show,
 				sb);
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 		proc_create_single_data("fc_info", 0444, sbi->s_proc,
 					ext4_fc_info_show, sb);
+#endif
 		proc_create_seq_data("mb_groups", S_IRUGO, sbi->s_proc,
 				&ext4_mb_seq_groups_ops, sb);
 		proc_create_single_data("mb_stats", 0444, sbi->s_proc,
diff --git a/include/trace/events/ext4.h b/include/trace/events/ext4.h
index 92048da9dae4..4049567cc4a0 100644
--- a/include/trace/events/ext4.h
+++ b/include/trace/events/ext4.h
@@ -2738,6 +2738,7 @@ TRACE_EVENT(ext4_lazy_itable_init,
 		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->group)
 );
 
+#ifdef CONFIG_EXT4_FS_FAST_COMMIT
 TRACE_EVENT(ext4_fc_replay_scan,
 	TP_PROTO(struct super_block *sb, int error, int off),
 
@@ -3060,6 +3061,8 @@ TRACE_EVENT(ext4_fc_cleanup,
 		  __entry->j_fc_off, __entry->full, __entry->tid)
 	);
 
+#endif /* CONFIG_EXT4_FS_FAST_COMMIT */
+
 TRACE_EVENT(ext4_update_sb,
 	TP_PROTO(struct super_block *sb, ext4_fsblk_t fsblk,
 		 unsigned int flags),
-- 
2.53.0

