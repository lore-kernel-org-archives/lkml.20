Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401575;
	b=D19z/cDiEv2MAUT8geE9GTQnxCHNI2JEYfWhzpiH8yOmRePQwvXsHBkE6OGKxAkjLHWF
	 q696eRzQgNi0dfTcdCCBZz/AdasIsrjvT8MoVcWr4fiaY7IRgrmCmyy/cfN0iJx6WNQkQ
	 AQtiNuyAX4un6AwurK9uYVtfDTln/jhLXwTnpaDgG6/w1FJx+cemnnrvD5CxGuz24GXaW
	 D6jqtgA1jXGeY3HnHEd8axzxqv3/iMKyH4i6bLAFyLM8y6qv3orCg1CsXIKrv/0MMN6gT
	 MNE2NkWXjiS+LKvM8yBOerdzVgGdQkeoBmeci5qG9XVUa/R5MWq/I8j1jXPl2Q3DLpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mjSax9Scw9JbRi4irnRJ6sjYTX5W3TTH23xySR7QQ9s=;
	b=3Tl8/cOutbtUHSHLTLt1j3m6W2P7czicH3Rc/oJ2IMr68ZULxyPwHAR41dAnV7iNRjLi
	 3ccALQmW3rNlIBZVh66iihA1EbpKm9z6StGFqsUZvpGSfe+WvhOFvo379VNUbwd6kvszF
	 NiOz6sUZDJjz+RajniSVUjre7xPagbucVROIfQQdpJ4+OpXJ1FA8OnrCJJ9HLBWytMI9q
	 TrlVZHGN3fSoi0MjbhEqv/Poazj1BbrWW8esPiWdDEK2qgX/b+MzEfeC0YWKUWMvzXSM5
	 26ks/d6VgO7LAnnGA25NBHKH7+JzDdtaWAHqOyH8iCck70WVOqlYPZxMn+BFTqzgiuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=JnpLYkVb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C16606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C16606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=JnpLYkVb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25736505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794401573; x=1795006373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjSax9Scw9JbRi4irnRJ6sjYTX5W3TTH23xySR7QQ9s=;
        b=JnpLYkVbBbP2dGJd7xU9CvXyRDYjxTTdbqcuqotKrJ8wS0+//Z8mjkAbVRVn/yTCO0
         wkeVYIMS9c9bp84vC8ZjfYaSB0WyJbV0s/b+t56oEuxbAayNC3Hn3MatfvkORJZdvwEH
         jObnWLoQOEiPY5q1HG7T/RfgEmUFfPXP0jjfiSZXSqY+/demYdCAjTkGWwrJG84HJzGJ
         FB64uzVhLgwkbh3kgulV2XKufwrvK1DErARc/ebmeZXsIsxiWWMphk9JY1E1Xkqpt8Z3
         PVkF3Lxkks7ehaMrahq4GxxJhcm+yZ8kk/DruI7LC3ImXeNGJCs0efLJY7VlIROS9/Ix
         /i8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401573; x=1795006373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjSax9Scw9JbRi4irnRJ6sjYTX5W3TTH23xySR7QQ9s=;
        b=fS0kiP/EvLIslRG7ujsrGHObxrMra6HSQ+26xLwP5I+WLX7ZiTGKk/WdClRhpKxMYT
         4+Ukhp7vX/iVDjFnU4gR/6xO4ZQV7CLVKVKgZLCOkIHjxCeN16TASKT7Ami6xnarblYb
         9ALUcoclJ0n1Dig3jm/khq1rC3oVEguAPR+b2Pn93niTLr5Ejo5piS8l/efmZEhYg14c
         0TRkQMKj/hLmXeb+4u+yxy1A6Fd+lNiSUcE05ek/aCCf61g/F3zKvXJWofNyQ3AaIbtg
         mgmddc4rQIsYb1OLPcQ3VC+5TDI9+2zX/RzMmSFudpbtUf5dHyhTjpsYSBwW8JxcusvC
         UVQA==
X-Forwarded-Encrypted: i=1; AL+hErHvlb3pElOa9sZ0kyWsnXlBGYyS10XQyGmgc2q2gmHsSt4Xm1X5A4MyAJ5m1o8VclO0KykCeQq+FaSGaIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s7pM0v78hgJUuSMXN5CGwYDNT8HTSb1EZXtOqwKd3n6mq0xrn
	tPfivpje0wR4UCMKf04R/xRUeTGPFVUDUwpJ0F5Ie9VepBArtagn+v4YEx5/9VyMrdY=
X-Gm-Gg: AYBFou0hhFhp3Qqo4zQkz5mZSD51bTiuh3FurXYvnWL2ytuCQSBvXJYgbk0RfF9xBHz
	vgAYcwDvsVBCTS0NAFV4wMbADHuttQjOCQmz9QT7FTcf49uOYEYhm3M9iTZmyhoBEa8hoLQ8Fb6
	SWA//9jVvunz5GNTdvrmc6nVvXB4UjsTr1oi5VlRRJ/7nWIU4h7VYkVoH0fCbXduyE984Thc4/3
	KnFZkOrVuKi86dIlY7yp1ckrKDhIs/ImNxzjUZ7zUSa+lB+6VraCS3yKjsU77N2tXovFg7BHLYY
	fM13dEbolmyL23vDU+xBPRXPUwYlLbrEPSNpT0gX6OEAldsXTJBHbbP6HJDl85rDlTyg/qLiBTL
	TqlxjivILL/oSsyLFPPdwJqY9JBO0MgPSUt7TEY3X92Vns4jyaR4iKzaRtyuv9qMxXE1dRACH1g
	MVs3jhEv21053++oirCuFvM5zYgCEdV7cPmAlzw/Du8SzDDD8PlBBTzop9vWVALCbxRlWoSLa3x
	6n4PXOyC3/lE7sB+VLGLIsEPvNaqqzw+jypXmcA2xIZyUsN3MIcI51roQAdVnI5cPQhFr1GgXkf
	TpqCUDH85U5d54+3wo2MwXhOf+6PvEcNlKYSk/xNYR00T+9urniKKyY1f6BKWKqAKKvijuK5DKp
	3tcEmh24kaBDnstMTmvxb48jDCCvoxw==
X-Received: by 2002:a05:600c:8708:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ba0931c364mr38104595e9.1.1794401573077;
        Wed, 11 Nov 2026 04:52:53 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm132712185e9.7.2026.11.11.04.52.52
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
Subject: [PATCH 2/3] ext4: make bigalloc support optional
Date: Wed, 11 Nov 2026 13:52:41 +0100
Message-ID: <20261111125242.1078620-3-max.kellermann@ionos.com>
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

Add CONFIG_EXT4_FS_BIGALLOC, enabled by default.  Disabling it omits
pending cluster reservation tracking and saves 8 bytes per inode.

Reject bigalloc filesystems before journal recovery, including on
read-only mounts.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/filesystems/ext4/bigalloc.rst |  6 +++
 fs/ext4/Kconfig                             | 15 +++++++
 fs/ext4/ext4.h                              |  2 +
 fs/ext4/extents_status.c                    | 44 +++++++++++++++++++--
 fs/ext4/extents_status.h                    | 15 +++++++
 fs/ext4/super.c                             | 10 +++++
 6 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/ext4/bigalloc.rst b/Documentation/filesystems/ext4/bigalloc.rst
index 976a180b209c..51aee018ec6d 100644
--- a/Documentation/filesystems/ext4/bigalloc.rst
+++ b/Documentation/filesystems/ext4/bigalloc.rst
@@ -3,6 +3,12 @@
 Bigalloc
 --------
 
+Bigalloc support is enabled by default with ``CONFIG_EXT4_FS_BIGALLOC``.
+Disabling this option removes the per-inode pending cluster reservation
+tree and its tracking code. Such kernels reject filesystems with the
+``bigalloc`` feature, including read-only mounts, before journal recovery.
+Filesystems without this feature remain supported.
+
 At the moment, the default size of a block is 4KiB, which is a commonly
 supported page size on most MMU-capable hardware. This is fortunate, as
 ext4 code is not prepared to handle the case where the block size
diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index 0f3e702cd5e1..518bd68ed167 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -43,6 +43,21 @@ config EXT4_USE_FOR_EXT2
 	  compiled kernel size by using one file system driver for
 	  ext2, ext3, and ext4 file systems.
 
+config EXT4_FS_BIGALLOC
+	bool "Ext4 bigalloc support"
+	depends on EXT4_FS
+	default y
+	help
+	  Support filesystems with the bigalloc feature, which allocate space
+	  in clusters of multiple blocks to reduce allocation overhead for
+	  large files.
+
+	  Say N to omit pending cluster reservation tracking and reduce memory
+	  usage per inode. Filesystems with the bigalloc feature cannot be
+	  mounted, including read-only mounts, when this option is disabled.
+
+	  If unsure, say Y.
+
 config EXT4_FS_FAST_COMMIT
 	bool "Ext4 fast commit support"
 	depends on EXT4_FS
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 1aedbfbcb101..c2c242f60700 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1194,8 +1194,10 @@ struct ext4_inode_info {
 	/* ialloc */
 	ext4_group_t	i_last_alloc_group;
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 	/* pending cluster reservations for bigalloc file systems */
 	struct ext4_pending_tree i_pending_tree;
+#endif
 
 	/* on-disk additional length */
 	__u16 i_extra_isize;
diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 018b6146b9d8..68630b32720c 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -174,7 +174,9 @@
  */
 
 static struct kmem_cache *ext4_es_cachep;
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 static struct kmem_cache *ext4_pending_cachep;
+#endif
 
 static int __es_insert_extent(struct inode *inode, struct extent_status *newes,
 			      struct extent_status *prealloc);
@@ -185,9 +187,18 @@ static int __es_remove_extent(struct inode *inode, ext4_lblk_t lblk,
 static int es_reclaim_extents(struct ext4_inode_info *ei, int *nr_to_scan);
 static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 		       struct ext4_inode_info *locked_ei);
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 static int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
 			    ext4_lblk_t len,
 			    struct pending_reservation **prealloc);
+#else
+static inline int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
+				   ext4_lblk_t len,
+				   struct pending_reservation **prealloc)
+{
+	return 0;
+}
+#endif
 
 int __init ext4_init_es(void)
 {
@@ -506,6 +517,7 @@ static void ext4_es_list_del(struct inode *inode)
 	spin_unlock(&sbi->s_es_lock);
 }
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 static inline struct pending_reservation *__alloc_pending(bool nofail)
 {
 	if (!nofail)
@@ -518,6 +530,14 @@ static inline void __free_pending(struct pending_reservation *pr)
 {
 	kmem_cache_free(ext4_pending_cachep, pr);
 }
+#else
+static inline struct pending_reservation *__alloc_pending(bool nofail)
+{
+	return NULL;
+}
+
+static inline void __free_pending(struct pending_reservation *pr) {}
+#endif
 
 /*
  * Returns true if we cannot fail to allocate memory for this extent_status
@@ -934,7 +954,8 @@ void ext4_es_insert_extent(struct inode *inode, ext4_lblk_t lblk,
 
 	ext4_es_insert_extent_check(inode, &newes);
 
-	revise_pending = sbi->s_cluster_ratio > 1 &&
+	revise_pending = IS_ENABLED(CONFIG_EXT4_FS_BIGALLOC) &&
+			 sbi->s_cluster_ratio > 1 &&
 			 test_opt(inode->i_sb, DELALLOC) &&
 			 (status & (EXTENT_STATUS_WRITTEN |
 				    EXTENT_STATUS_UNWRITTEN));
@@ -1197,7 +1218,7 @@ static void init_rsvd(struct inode *inode, ext4_lblk_t lblk,
 	 * the region to be removed, if any, and note that there's no partial
 	 * cluster to track
 	 */
-	if (sbi->s_cluster_ratio > 1) {
+	if (IS_ENABLED(CONFIG_EXT4_FS_BIGALLOC) && sbi->s_cluster_ratio > 1) {
 		rc->first_do_lblk_found = false;
 		if (lblk > es->es_lblk) {
 			rc->left_es = es;
@@ -1235,7 +1256,7 @@ static void count_rsvd(struct inode *inode, ext4_lblk_t lblk, long len,
 
 	WARN_ON(len <= 0);
 
-	if (sbi->s_cluster_ratio == 1) {
+	if (!IS_ENABLED(CONFIG_EXT4_FS_BIGALLOC) || sbi->s_cluster_ratio == 1) {
 		rc->ndelayed += (int) len;
 		return;
 	}
@@ -1296,6 +1317,7 @@ static void count_rsvd(struct inode *inode, ext4_lblk_t lblk, long len,
 	}
 }
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 /*
  * __pr_tree_search - search for a pending cluster reservation
  *
@@ -1330,6 +1352,7 @@ static struct pending_reservation *__pr_tree_search(struct rb_root *root,
 	}
 	return NULL;
 }
+#endif
 
 /*
  * get_rsvd - calculates and returns the number of cluster reservations to be
@@ -1350,6 +1373,7 @@ static unsigned int get_rsvd(struct inode *inode, ext4_lblk_t end,
 			     struct extent_status *right_es,
 			     struct rsvd_count *rc)
 {
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 	struct ext4_sb_info *sbi = EXT4_SB(inode->i_sb);
 	struct pending_reservation *pr;
 	struct ext4_pending_tree *tree = &EXT4_I(inode)->i_pending_tree;
@@ -1457,6 +1481,7 @@ static unsigned int get_rsvd(struct inode *inode, ext4_lblk_t end,
 			}
 		}
 	}
+#endif
 	return rc->ndelayed;
 }
 
@@ -1996,6 +2021,7 @@ void ext4_clear_inode_es(struct inode *inode)
 	write_unlock(&ei->i_es_lock);
 }
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 #ifdef ES_DEBUG__
 static void ext4_print_pending_tree(struct inode *inode)
 {
@@ -2188,6 +2214,16 @@ bool ext4_is_pending(struct inode *inode, ext4_lblk_t lblk)
 	return ret;
 }
 
+#else
+#define ext4_print_pending_tree(inode)
+
+static inline int __insert_pending(struct inode *inode, ext4_lblk_t lblk,
+				   struct pending_reservation **prealloc)
+{
+	return 0;
+}
+#endif
+
 /*
  * ext4_es_insert_delayed_extent - adds some delayed blocks to the extents
  *                                 status tree, adding a pending reservation
@@ -2297,6 +2333,7 @@ void ext4_es_insert_delayed_extent(struct inode *inode, ext4_lblk_t lblk,
 	return;
 }
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 /*
  * __revise_pending - makes, cancels, or leaves unchanged pending cluster
  *                    reservations for a specified block range depending
@@ -2395,3 +2432,4 @@ static int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
 out:
 	return (ret < 0) ? ret : pendings;
 }
+#endif /* CONFIG_EXT4_FS_BIGALLOC */
diff --git a/fs/ext4/extents_status.h b/fs/ext4/extents_status.h
index 01cddcaaa68e..67d5059061a4 100644
--- a/fs/ext4/extents_status.h
+++ b/fs/ext4/extents_status.h
@@ -242,11 +242,26 @@ extern void ext4_es_destroy_stats(struct ext4_sb_info *sbi);
 
 extern int ext4_seq_es_shrinker_info_show(struct seq_file *seq, void *v);
 
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 extern int __init ext4_init_pending(void);
 extern void ext4_exit_pending(void);
 extern void ext4_init_pending_tree(struct ext4_pending_tree *tree);
 extern void ext4_remove_pending(struct inode *inode, ext4_lblk_t lblk);
 extern bool ext4_is_pending(struct inode *inode, ext4_lblk_t lblk);
+#else
+static inline int ext4_init_pending(void)
+{
+	return 0;
+}
+
+static inline void ext4_exit_pending(void) {}
+static inline void ext4_remove_pending(struct inode *inode, ext4_lblk_t lblk) {}
+static inline bool ext4_is_pending(struct inode *inode, ext4_lblk_t lblk)
+{
+	return false;
+}
+#endif
+
 extern void ext4_es_insert_delayed_extent(struct inode *inode, ext4_lblk_t lblk,
 					  ext4_lblk_t len, bool lclu_allocated,
 					  bool end_allocated);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index aced1a67a554..a319077fb3ec 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1438,7 +1438,9 @@ static struct inode *ext4_alloc_inode(struct super_block *sb)
 	ei->i_es_seq = 0;
 	ei->i_reserved_data_blocks = 0;
 	spin_lock_init(&(ei->i_block_reservation_lock));
+#ifdef CONFIG_EXT4_FS_BIGALLOC
 	ext4_init_pending_tree(&ei->i_pending_tree);
+#endif
 #ifdef CONFIG_QUOTA
 	ei->i_reserved_quota = 0;
 	memset(&ei->i_dquot, 0, sizeof(ei->i_dquot));
@@ -3698,6 +3700,14 @@ int ext4_feature_set_ok(struct super_block *sb, int readonly)
 		return 0;
 	}
 
+	/* Read-only mounts can still replay the journal. */
+	if (!IS_ENABLED(CONFIG_EXT4_FS_BIGALLOC) &&
+	    ext4_has_feature_bigalloc(sb)) {
+		ext4_msg(sb, KERN_ERR,
+			 "Filesystem with bigalloc feature cannot be mounted without CONFIG_EXT4_FS_BIGALLOC");
+		return 0;
+	}
+
 	if (readonly)
 		return 1;
 
-- 
2.53.0

