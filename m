Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714184;
	b=yocQdG6bu1p4hbbXoJCOVi4an1j29zwCj9KjP3XHPoFtEItzk9SZ3mwW7QNrGlIMxygZ
	 s/NGJ+tkT/kljTUCY73pPzfr+UEkM97QxzvcOj3k5i04Ozp/5pS/FnGyn884tLj3s5qrP
	 h0UHwD9EatrRGxKTpf+JGUhTuZT+NEMYRI+Cr9khJZeHRgERPCYVELia73sm2dF+32R5s
	 4ca5b7R3B34eVgRcCqdewt/O8wO14Ri0loz134MnRQXFjc9OllpEaYDscI9Xye0VWHDzi
	 wQJDu+Hmue6grWtFK0B+mQM0rOFcpX1oZpewp8VsORPxml2axkiqh7Zt+vLNNV5YakA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiPvFH8SVoF37ApvoIXLuqpxHr1PY9KAcpyY1hM4Tws=;
	b=ZSLRQM8rxuNudhBqxyeQgKWO4eCgloVSUWe+3aQUuyaWN/0o190mXbLiOjvrkX81ssAk
	 nDNMfSAQ65gFoLhVgeVfkeODelp0A6hB3YBAxeiz8jora8lZDx3qwkvvePdyve9FKGsjE
	 u2PrfEAmPFW81JWup9ui/lTCsZkIXuL54FqvLIapnK2c9iR8f9bAph5CtGDzMSrTNbixm
	 TE5y2Laef1QdbrOIOzA0NFn4YhdjypRfRyyyG/E1I2toCZvZNWcXrRA+SCasceq0mjNtT
	 +y1ds4cidWrE4hHKPcEyNd394aSA9n3GiyXh2mvB4N3we/93EDgzIgFWp/MHZu3EcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EXIHumkK;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C8606D80B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6C8606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EXIHumkK
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40aa03a96fso80034366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793714183; x=1794318983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiPvFH8SVoF37ApvoIXLuqpxHr1PY9KAcpyY1hM4Tws=;
        b=EXIHumkK7iWTz/kYcJwHfNAIkPuhibXFk4QPYdk/crHt6WUn+6O5sRD+OAZc0kgYw/
         Cx1Ry/egYAWLQalXQ2mR6HM2hfHfSQk3izgf95UTJ/Mk5SEvE31T1MJZ5YVgyaMIsrl1
         LacaBsJuMLFm5Pv/uVyAqwkLmOMVZ5jMUlMdytucj82Cr0vbZ7unyJkUTuxzlmDOMIsa
         Sd+S1ebqCuL3dPNtJq5WblLT2NUU1CyIlnLct9VWLVjy17EQ0mQpGXxJGP8JSi5GdgeD
         Ns8dlXM4HW1+mlqbopNJNZaZWa1BKY4I4bJgNwMnL2YY4jT1HwQuP8sPfW9np3UPUrVJ
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714183; x=1794318983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiPvFH8SVoF37ApvoIXLuqpxHr1PY9KAcpyY1hM4Tws=;
        b=k+KltX730Y4RkQkYwnBsBr6roDSXC+jZeG3fRDfBpNJ3F5mr/wzg7TQz94Weze0/nT
         JDQdDmAaz/8QpvBUp3MiHxBqHhX61IWlGJZ/iIrlomkOCzUpjVbu2FdGFmjrFNdwnvHL
         ThCHvGAnT1RJyrfda3guUeXmYNn/WwE00y8YpzWZuAy/4PDblYKkr6lT5i8r+1edkyNu
         pQ7LZsZdvZDFJMyChGD1m5h+3MQGwBq5W0IMxMaOLtQGdT5eahvB/ANswe60c19GC6nH
         EeQfaVBAwD67KZVbIvIQmVmXBGBHn2nocxOB6kOFFG2jDVVMhv+pTBEZ3m2RU4At2isH
         EHiA==
X-Forwarded-Encrypted: i=1; AKwUvBwCnCZF5IJxAqTqzRyN5yH5v2QB0h4k6rv/L+th74wyzZ6Jj7XF3sQL4JscQh370cdmR/z/aRMRFQEuw4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hMiMtwl5CTCI0/xEF9J3dyAYANhO+JXchVWwi5FopQvLzGa6a
	WWghtrJENVdplMa4t252NJ0G5cUQadFJLc3uQPounlBh+7npXucktvvvBWHbJEBVrQY=
X-Gm-Gg: AYBFou04ch3J6NExV1vsTSvDNxJMvPw9/MPxRtYdoGnIn5FL4F5UvEaT6izRLKM5eD9
	Mdk5OnvEzquZmmrSgTNaminZ07waxhfmX5/FvBRUE5ZXFnY/jv6RZI6aGje6USMgi30ejkuX5bU
	OH2Yk/nnbPE77l9XshuPt7gRawF2yZ3CNv9Tn3bC/hT7ldThNruFynh/T234HIjX/WZxAT45qT1
	OCGWgHsGHqJckdcSLdeRehXAZzsM4bekglQ+FkVoYjufro4TM0mZm92M3r1grZrT2OmG95aZthO
	eOewcNFFdP0q9mp4TjGS7slbnyml5odMonuFKAfmJyK9qDsXIpf5Rxrly2U09dRTynGI8WITtcH
	lRY+OkFkH2ILnzjWS4ffzYaZbtEKW3xVx3UAm1E30pt7JP2jLRLKhzAlpImaNygu+hNoeLownhM
	AifOpwPIqbrHO+ABlunIgE3oDS/Sn/WRgEdfOcqNEk8fDNUKcypnertmAd7yUkaNcTHvCmIvWGb
	LIKJNJSAIqGpqnF8P5hBWk/MNeIlftI3jc0A7p/7aoMosFFpX4XH9AqJVZlMmAf+HOIv8qwZxAk
	gsjQC1Kkyep6XeDle5aCOYz+oC7wr5UUhz34typI97k=
X-Received: by 2002:a17:906:f15:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c4ca7970666mr1074813466b.1.1793714182680;
        Tue, 03 Nov 2026 05:56:22 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1a16sm39629747c88.1.2026.11.03.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:56:21 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Tue,  3 Nov 2026 21:56:00 +0800
Message-ID: <20261103135605.22943-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103135605.22943-1-heming.zhao@suse.com>
References: <20261103135605.22943-1-heming.zhao@suse.com>
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
index 733ceda79ca1..1e2e4fe90abc 100644
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
index e3bb3cc0b25a..7c75def1ef4c 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,51 @@ struct ocfs2_super
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

