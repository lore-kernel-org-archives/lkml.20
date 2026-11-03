Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709812;
	b=ZupMdAkkrOTUngDO1TMNDbs+XuUKs4GOThjjs1UvKU1G7m0cif3Wlr8B3MNxfc8cvB8B
	 3ibR4aKXFtaES+5N5cAMdQwlI1Mgn7Wto7XIz88hXH4rvyV29DLWp5Q/z4Q05BKPUjA+p
	 qaS+LBnArwMZwNG0huykHpsAdRyfCJOvQTcwEBkJUil22dTNRKs30iZQjPnzfYaHFTfF/
	 O84q4aW3WsJcuZm+4kSxBTTjx/oaUZU7OfBkEh899HWFdxx1b65acIxA8L8N1x4OK97mW
	 3CNjWpKPC+po/RCCKXkk2lv+fH8qWPQbFA5DguiiEXwVP8K/khAy27Fd/Gsd3yn56oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DCLd7TRXzCn3mL5Wl/Pe+4SxUHjku1pitRL5m10Az5A=;
	b=GDV2iBlAx5oAwqRqWLmo/lXK8EWo3Mz/WUpbpzfqPEKWuzXXoyEiwicpv8/Nt/lRkDo7
	 zGFx50YOxjKADc7D+Ff4v7ulbRMseRRx1SOXNZ9Z6ffAawifXsAcR+Z6F1dz1g+eyo7zR
	 MlJYPfwkbTAGAUWusSmJSmsp3kKehl7hixMJVWGXiO7J9InckAGZiuAQhvuAYNwemjLOw
	 wD29WrTEi03FDPzwAe5RsF/61SfzMECrmBq3GV5gkNHT7n+L4KbmqDiOaAzakggfX3hTc
	 UOz6WTXtguVJuQKxMFgDWvzSz93XciVnYGqNB5PUpFJ9Spxwv6nkV8Q/6hcVRnRKbdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DxOiqg9b;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC61606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC61606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DxOiqg9b
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c499e0e43a9so79005766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793709810; x=1794314610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCLd7TRXzCn3mL5Wl/Pe+4SxUHjku1pitRL5m10Az5A=;
        b=DxOiqg9bK6sIgjDjwmCE4QCThhag0coaI7whbz5o24uwO6jLcaUJH7Lg4BWSxf+EcI
         V0u8Ee3AGCe1nQYo/VMSpjKSAlo1SDiquD03Cc1Cy5Kg96hotW4EnlkoVM0Ktr5zowrK
         I4y1rmLgFbLHr8EbXqojgIvskF7Z1YXhlxEwOnHT1/xz8L7MZz55pgebY5R2e3cgfSoE
         fKrQdsspckquCkDmcM0ddoPyLqvHazpSYvGRoysDATQ8dB8M87gOMXXjoFlJOEj7RNCm
         wd/ODmEeXFbut38rpw9fVaw4e3d/VEBM/HsTB/BtFYChRGXCbJ6Y+/F7wrBkU0PSP2pa
         EdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709810; x=1794314610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCLd7TRXzCn3mL5Wl/Pe+4SxUHjku1pitRL5m10Az5A=;
        b=ieMuMiRgGrU+oJ+cqeCHEVn19JRlcKEdleGoQwZ1eh3ooaowEpNoQm64T+sXFHBG7m
         Y/FE4TBSAO4h1hUN+XannRb60Z5ynTjZfCYM92W2Es4LUFNsiVaCOwatSoLBuv1w4Ks7
         82Du8pjY+mfIK3PsWW1IKQNry36KHwLQaEMuoMjeDFxvVvQHvXyQ3yWBZ32lbianhtAW
         XL9+Y9VOrs/daXmBzYvkRO9YNh2tnEyWBjD0fgbx3YKHVHgxNngaKtkTAhE5fZBVSDaf
         FurT0/arj06iWAwlXLAiu7Tkhl5z0cvUk9/01a10cnKqH3eUeBWp8RQ7sciAnVLmMP/f
         HrUg==
X-Forwarded-Encrypted: i=1; AKwUvBy3f5VM2Areo/opoq2H0IaLarpHT3rpHRtPVKE/iVj4pnMvtFKnp/cgaPJNvcLG+wpPjy7RG27Xds4Ll08=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RolNe58Z71xgaAlHrVsVNTQPjH2+1iV8g1Oz5vYXgqbUpgPeX
	ywFpbHw/1/AalbaJDrGL6laN2GA3wGyozcdFEkd+rYzfESRSCPpXxD3ZKypRzGouUGg=
X-Gm-Gg: AYBFou2Adtu+Mn2/hlElRNwBW3KG53PZRr+PraKUbLMzvs9YqoeZj+gSmMW5lQtms8f
	8WtHEPw3PDs2cpF7wW/hakhjfwrUjNtVgDVDK5bfrYJp3VHr25Vw2ajPysPdoJvohhUBLMmNjKw
	a/Dpf/ftVc15pRsPKYu8/Xd4OTSd8dw/H9v+XaTeamuqlRX2WTMV/bBSGu0Aha78tP7e+eG0uE5
	eB7JuO+oieUQ9TcFSs5ZwV1BrPbwuOSosHfCdy1fjFQ1nyW7T7uEcZ45WS9VUa31uceQmSFJ0JI
	iJ/eUypSHMDPdy+9+p973CE2/V5CdJdtKmwxNHDdfS3YFIfsZt7HXQ1QZB4T50EITtEKlYWM3TS
	acqd0l3jH1J5oglsPqdR4NC0t5eBlX5U1tro3P/QdwmzU2fcZ7EYDX6U1pN4LSkqjpdsgRxjhnm
	CCaRA+qGZumhqI2gbC8ewduQBfptc1dbHvYc3VkMRcyYRR9sMMvsNdzCKW55Tk6yjQb3YnqvNMg
	+qmokQWcbvVCaPLa9jkwfhpgRPzBtiX9YI5GlHzPZAfK6nGT86PZg/eOPTJD7p9eee0hOfqJExg
	cloAD8jEX3uxULbX43Q+EmtYWiDzEQeD/go/jCmZa8c=
X-Received: by 2002:a05:6402:a585:10b0:6b3:9a81:dd24 with SMTP id 4fb4d7f45d1cf-6b4d337beefmr10190624a12.1.1793709810165;
        Tue, 03 Nov 2026 04:43:30 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4365014a91.7.2026.11.03.04.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:43:29 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Tue,  3 Nov 2026 20:43:05 +0800
Message-ID: <20261103124310.21143-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103124310.21143-1-heming.zhao@suse.com>
References: <20261103124310.21143-1-heming.zhao@suse.com>
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

As part of migrating OCFS2 DIO read/write code paths towards the modern
and performant iomap framework, here introduces ocfs2_map_blocks() to
replace the legacy, high-overhead buffer_head based block mapping
routines.

In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/aops.c           | 79 +++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h           |  2 +
 fs/ocfs2/buffer_head_io.c | 12 ------
 fs/ocfs2/ocfs2.h          | 46 ++++++++++++++++++++++-
 4 files changed, 126 insertions(+), 13 deletions(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..c612244690a1 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,85 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags)
+{
+	int err = 0;
+	unsigned int ext_flags;
+	u64 max_blocks = map->len;
+	u64 p_blkno, count, past_eof;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+	int create = flags & OCFS2_GET_BLOCKS_CREATE;
+
+	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
+		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
+		     inode, inode->i_ino);
+
+	map->flags = 0;
+	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
+					  &ext_flags);
+	if (err) {
+		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
+		     "block: %llu\n", inode, map->lblk);
+		goto bail;
+	}
+
+	if (max_blocks < count)
+		count = max_blocks;
+
+	map->pblk = p_blkno;
+	map->len = count;
+
+	/*
+	 * ocfs2 never allocates in this function - the only time we
+	 * need to use MAP_NEW is when we're extending i_size on a file
+	 * system which doesn't support holes, in which case MAP_NEW
+	 * allows __block_write_begin() to zero.
+	 *
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. In this case, we clear
+	 * the buffers dirty and uptodate bits and let the buffer code
+	 * ignore it as a hole.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb)) {
+		map->flags &= ~(OCFS2_MAP_DIRTY | OCFS2_MAP_UPTODATE);
+		goto bail;
+	}
+
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		} else {
+			/* Treat the unwritten extent as a hole for zeroing purposes. */
+			map->flags |= OCFS2_MAP_MAPPED;
+		}
+	}
+
+	if (!ocfs2_sparse_alloc(osb)) {
+		if (map->pblk == 0) {
+			err = -EIO;
+			mlog(ML_ERROR,
+			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
+			     (unsigned long long)map->lblk,
+			     (unsigned long long)map->pblk,
+			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			mlog(ML_ERROR, "Size %llu, clusters %u\n",
+			     (unsigned long long)i_size_read(inode),
+			     OCFS2_I(inode)->ip_clusters);
+			dump_stack();
+			goto bail;
+		}
+	}
+
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
+	if (create && (map->lblk >= past_eof))
+		map->flags |= OCFS2_MAP_NEW;
+
+bail:
+	return err;
+}
+
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create)
 {
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 114efc9111e4..8dd6edd7c1a1 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -42,6 +42,8 @@ int ocfs2_size_fits_inline_data(struct buffer_head *di_bh, u64 new_size);
 
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create);
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags);
 /* all ocfs2_dio_end_io()'s fault */
 #define ocfs2_iocb_is_rw_locked(iocb) \
 	test_bit(0, (unsigned long *)&iocb->private)
diff --git a/fs/ocfs2/buffer_head_io.c b/fs/ocfs2/buffer_head_io.c
index 7bfe377af2df..493f2209cca5 100644
--- a/fs/ocfs2/buffer_head_io.c
+++ b/fs/ocfs2/buffer_head_io.c
@@ -23,18 +23,6 @@
 #include "buffer_head_io.h"
 #include "ocfs2_trace.h"
 
-/*
- * Bits on bh->b_state used by ocfs2.
- *
- * These MUST be after the JBD2 bits.  Hence, we use BH_JBDPrivateStart.
- */
-enum ocfs2_state_bits {
-	BH_NeedsValidate = BH_JBDPrivateStart,
-};
-
-/* Expand the magic b_state functions */
-BUFFER_FNS(NeedsValidate, needs_validate);
-
 int ocfs2_write_block(struct ocfs2_super *osb, struct buffer_head *bh,
 		      struct ocfs2_caching_info *ci)
 {
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index 62cad6522c7a..88fe985e87c9 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -509,7 +509,51 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
+/*
+ * Bits on bh->b_state used by ocfs2.
+ *
+ * These MUST be after the JBD2 bits.  Hence, we use BH_JBDPrivateStart.
+ */
+enum ocfs2_state_bits {
+	BH_NeedsValidate = BH_JBDPrivateStart,
+};
+
+/* Expand the magic b_state functions */
+BUFFER_FNS(NeedsValidate, needs_validate);
+
+/*
+ * Logical to physical block mapping, used by ocfs2_map_blocks()
+ *
+ * This structure is used to pass requests into ocfs2_map_blocks()
+ * as well as to store the information returned by ocfs2_map_blocks().
+ * It takes less room on the stack than a struct buffer_head.
+ */
+#define OCFS2_MAP_NEW			BIT(BH_New)
+#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
+#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
+/* useless? #define OCFS2_MAP_BOUNDARY		BIT(BH_Boundary) */
+/* useless? #define OCFS2_MAP_DELAYED		BIT(BH_Delay) */
+#define OCFS2_MAP_DIRTY			BIT(BH_Dirty)
+#define OCFS2_MAP_UPTODATE		BIT(BH_Uptodate)
+#define OCFS2_MAP_NEEDS_VALIDATE	BIT(BH_NeedsValidate)
+#define OCFS2_MAP_DEFER_COMPLETION	BIT(BH_Defer_Completion)
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN |\
+				 OCFS2_MAP_DIRTY | OCFS2_MAP_UPTODATE |\
+				 OCFS2_MAP_NEEDS_VALIDATE |\
+				 OCFS2_MAP_DEFER_COMPLETION)
+
+struct ocfs2_map_block {
+	u64 pblk; /* physical block# */
+	u64 lblk; /* logical block# */
+	u64 len;  /* number of block */
+	unsigned int flags;
+};
+
+/* Flags used by ocfs2_map_blocks() */
+#define OCFS2_GET_BLOCKS_CREATE	(0x0001)
+
+#define OCFS2_SB(sb)	((struct ocfs2_super *)(sb)->s_fs_info)
 
 /* Useful typedef for passing around journal access functions */
 typedef int (*ocfs2_journal_access_func)(handle_t *handle,
-- 
2.55.0

