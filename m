Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EA4CC28A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334018; cv=none; b=RX4B+5xfMRBx2ilowQkE1QG82w36D/b0+UTgSddlw0mCX3psTCUqriZrAAMc6Xzo9we2Z1YLAV+UYlU6ADe1GlfQIqVGWi0eM6AysRunqi0CLts+nHGEoFsCJcEW+Ol2utXNWQ8WI8Zj4XcJIMPyuI3Owufa1LkbjmdPap+soY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334018; c=relaxed/simple;
	bh=nNTWK1m03d93431VswcV/gDk6CP93EQh2sEFpcZfCSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOK28C/Lez3cKmxZey1yxF7RE2oI+WnPf1OQVFoC/msNZTkyfgkLeZrLfmjDNRudE3Jl8X0s8tsBpePrO57Q6tKr9XO3jPu7+K2xxSDvayfl6lCRShrc1hzRc/kPYYafdDldhaJrI4ipbUUaIedq1yauMQOyj+hXXqSvH8jB10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sw0X0v24; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sw0X0v24"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d86294fdso625845e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792334014; x=1792938814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ikl81Ku0XQccsYW4khrRKD7VuHKvFe1sUFcKN0eCSLA=;
        b=Sw0X0v240rBIFQsZ+bHedYCMw6Sdy0L54ZL4m0ly8QmfoPMFgT+wU6ET0RSjNvjS3v
         sg/voAg2QbkiuMaG3Ov43TZD1Lz/1GpcZ44MjnMDDiLPmrk1MnpvVV0EUO9LES/I0d+K
         SnROotlrHrfrpbreO0npHa6iAMSpJMupqZO0p0Y7iAR6Su9NSMKca3DXz/ASW+DsEiFY
         Uatwul2Y2qqFIxd1H+tyYmkT65NMhu2vdbfaWATN1IeVaL7ZAC6jot4XMDkTlCt7fVFK
         TD6a7z4msCZNJhWx21zDbc7RQurLhTa8zWyinVxoGRP+O15J97VRzv3AN/yAfpTw623h
         LljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334014; x=1792938814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ikl81Ku0XQccsYW4khrRKD7VuHKvFe1sUFcKN0eCSLA=;
        b=B+7id5ENeG2klV7pKpEBH5u8XHjhG7SnhcTL57zLQiXMfo0f+WpYH4QED8xQZuXDnF
         Rlucq9tCTjA2DsliUGvKywvTuhB/RvVhVZjnpQUnrOsNNmd3f84GrsHMgHpJ2spTthyM
         daR93Z2ioxFlrONA6kpUws+F5sJJfuTRajN+6Tth21ROS2blzHkFlXWH6jT0XRq/fMJ3
         mdB27Y4CCWXbDXMpcjo8rb5PEdLLWLj734XTluuU28qO+ofGcaAldrkxjzEDZkNodIuF
         s4J7QcYsGCqGh2mH8IKk6YTXsyxHE/urLdamrzjVdoUglVcHy9Vps1Hs8ENeyeO1KcE/
         564A==
X-Forwarded-Encrypted: i=1; AKwUvByp3vVvIKSgYeJHXajEbLlu/a2o3CC3iy7RrcZSKlZs6DhTe0AvK5y6gY9VwtBXAGN0uukfCJ2FH4Cq8IQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI53isdqgEkWGVs1nZIPaYSZMHfpaik3wcPKhdroKJJIXIrlxnF
	nNH5MEaHu+v9pM9U/22U5hKPTmhBtOOC4HzrHay3jCparmJWrJOjEmzXM2Zcf60ryko=
X-Gm-Gg: AYBFou1jcCf2kSRLK6yyIzOcTuIgCApq8XbLqOggnItoCW1AMyA6CACsFTipwBAp+zu
	W21fW1c36ZtVTT/htvkAG8K4NKSxtRjb3mxLFZ21PORioTAHjKjPa+lXQQ1y1Lfkt1YsTSGTyiA
	c2DWE0i5fd8PSGeiisMAnKfSVU1yo+N+zMC7s0UtLywkGz/xS287KKSzMavoKH3DUKdkRtDU1s4
	YN3mQCrrM25ry0Sn77GfR8MTwkHArHkC4D4mMtqe09+ZRYY7rgtf58YFTzuld3TMbUVT9Wis/g4
	+nSyg4PU1PKtz+skIJUI/gW3GRgEhFAsqHY0WD5P40rwFOtk/vE4iAWIzgzUrpTqX3PPQyfR9vN
	8d2r0e34eZ5Yi2LoTpI01BR4+Tgp+Sg8FPyiBWsI6Gu6dCIREicaOBV1ScCpvI1b1EjWgaJPTpu
	QB/fsKoRW4xcEwiaYf+6bGPJHNArCEWd15fyQc/wZcErmf5sB1qdawdzJRMdUVJ8GLMMc7Qo8kM
	KV8XGNi27921g==
X-Received: by 2002:a05:600c:3e85:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a1d74669e9mr89091515e9.0.1792334014475;
        Sun, 18 Oct 2026 07:33:34 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm16339501a91.11.2026.10.18.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:33:33 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Sun, 18 Oct 2026 22:33:13 +0800
Message-ID: <20261018143319.22329-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018143319.22329-1-heming.zhao@suse.com>
References: <20261018143319.22329-1-heming.zhao@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 fs/ocfs2/aops.c           | 83 +++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h           |  2 +
 fs/ocfs2/buffer_head_io.c | 12 ------
 fs/ocfs2/ocfs2.h          | 45 ++++++++++++++++++++-
 4 files changed, 129 insertions(+), 13 deletions(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..3215e2dda2be 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,89 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
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
+		} else if (!(ext_flags & OCFS2_EXT_UNWRITTEN)) {
+			/* Treat the unwritten extent as a hole for zeroing purposes. */
+			map->flags |= OCFS2_MAP_MAPPED;
+		} else {
+			/* TODO: handling other OCFS2_MAP_XX in the future */
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
+	if (err < 0)
+		return err;
+	else
+		return map->len;
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
index 62cad6522c7a..095f7ae5dded 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -509,7 +509,50 @@ struct ocfs2_super
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
+ * This structure is used to pass requests into ocfs2_map_blocks() as
+ * well as to store the information returned by ocfs2_map_blocks().  It
+ * takes less room on the stack than a struct buffer_head.
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

