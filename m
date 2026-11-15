Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757227;
	b=qz/496q/054zekT+nABfYh5adevlDkOoI9fINYeIH4PGJ+kUTIDCAGQ4dPTXRl4d30gY
	 TBvBAd2M1YD/t+jMkcTFebuTroutk6jQYDmDTI7zn9SnxwiJHBIeaJm6Xkv2LPOffTkqn
	 fSLX+hbzeGAcnERa+8agoVGKt+frtd/XeW9XBTp4sh3saisiQxeYcWoViqv3q3xRtleW2
	 4u2iFubenRQoaHyfkLfpYeQRN7ov/H0fcppM4kwyiAYVqoi0CiTdJTtR+uvwP15mItih9
	 C5YiQarFgtGHCyWbwjnplIdnjKASZxHiVASDQquYIVOyZJJNaIOYuCP/qIahbnG3HrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMcQeXCC5dK/90RDGmPK+cz1RN8S/CIlOueNakUR0SQ=;
	b=oZnDSLUif3tUw1RpCdGQKfMUvovTOE6unJeJEJy/ZctMZ5fL6I6Fv/s+ktyJCeQrhWQt
	 JTmD7anxzSaJwxUC32fNNaSJ75xaI0mo/urjnNzzAkRk/W3rdiWeXGnqE8cGZfbmFpV6o
	 aOmd1IB8B+J9fgcSeBhw2PJm2rviOoykxl7NfbHHIK4JODEBNYINCEL3BPnXlg3i//wQQ
	 razMW4ECk07pp03GLPUGSte3dXVxgnaxzOTDyWJU3Mqo9AcRARHwvRafF4onAwCLp/k7b
	 +YVhWWHo4M4z8R6+3aVIlBOv3pIpk8RBBXdbiBkqr9FRZMRc9Us5dR93+QdpbZ+c6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dXypSt5V;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11C606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E11C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dXypSt5V
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49d611f6938so99851f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794757224; x=1795362024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMcQeXCC5dK/90RDGmPK+cz1RN8S/CIlOueNakUR0SQ=;
        b=dXypSt5VzDfFQ8a9inRV3PI8UGwUeHYHDKVrlI1o0wxBN6jWhY+Tyu33UEz1TM8uu2
         wHQWqpBLylybVCkbbwLZM2gZ9l0FU0vlH5UDpWGoaUSdIoLSXyEOVY80U+vLqBZ/kDp/
         l+A4MPN1/ftzLPtqW99I1xdkJrGO/BIxO8+NzGp+EQMSfs0tbyxw9Sga+EICKfXWWmCs
         eM2XXP9IIbtMkYK/YJTR9bTHJGXGB3h9QbhXNmoUB5eaIR3A0SGBvNoC01SXC4R0ugQz
         ymckS+FpJIjrvXmMhr6iflOx4CcE/Obdy5y3RGO/04R4Fnf0ATloykVN6tIDm2ChdqwI
         7zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757224; x=1795362024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMcQeXCC5dK/90RDGmPK+cz1RN8S/CIlOueNakUR0SQ=;
        b=bqQ9MuNVkauoH0UvK36jmQusXn6pOiBjRJnWhhrdFkuOS6xZh54x6f8xc0YPxtRvsq
         aZ67kNeHbjvfiu+S1468ydIwO/tgU/Ag0qDwAidkVOlUIMwvnL9kzrep2CEOGEkr2BD3
         IcyDYUXiQ3K3Dy4TvsX7RGtsn1caV07T6MgZLhy45lObWzG2sOnlbq1bdYug0Xewydpz
         j9uzMcNryFQw7P9LEaODPf5mwRfNwl55mUIIsql0WDp6RbtIrBo3K58+9J7KjZsqspIc
         2KWCKMMbXsE7+gNS0ctqRtmM/PUfa9aAdZb/US4WsUQPEqQGB4PQVjqUoXRhsMsTZ/Uc
         UDrw==
X-Forwarded-Encrypted: i=1; AL+hErHd0k32Qoc6mgQMAXyXw6gCzLrrlTiQhZL+2BEfNQDR36o1b4nVMqnOHUW9cEdex9OzrmlqW1+lJbKZI0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QBMI1gAverVX5K3Bz//+HRzAVoSzigFee6uxGWT+3TLYomvby
	aT0dWhJGkYZEf/6EIfW2xVKpd06XInkZvHqKSYmdXbOnlNc8WP2Cr0fD1VD8B1p+IIM=
X-Gm-Gg: AYBFou2T7vgu3Bc/L0qtgbsqwSKhkH+lZoM1wS71cd+HgrbXqfvhT20f3/z7tnKW044
	5bN7wSQ+uc9s/oQ1EhwHWEtTF/PAUgWY4KDldYNkLXiBICZc+1uUQXE1A3p7JaOR7UyW7tpaBRU
	JNR7t8/pTegwNXvQ+nYECid+3lTatlIYZwLlUBc9uVahIdHeXp6SUMalogIw3txkf2RZl2UVJaM
	j1P1hqCydIKpD6yThBxaO7XhHYG8biNokGB8gaIliWRlr82MQNWThgTBV7b72o4XkCXK9NYrHWm
	XkUXPhvWG08M7yWkIg2TD/lEU5yRF/wU4m/h5jWcs3FodMa/hd7WyAVwBlPc44dojzkR2C8Ov9g
	FcxxlvkLM5Hp91woZx+DEyyVWDhM9j+BJrvxy0LF27pwi4i7aWY/rJ8x34ChrRSf1tV5KTZLNiN
	uCy/Uc9q3U1djG0ux9OBFwpMH2jk0U51UjDuLKbukV2ybAz1EqHmMu259BuEjfqp5WPvdPx7LfF
	MdG3XAdB8SNmP2k9fMgMTXMEVLBh+Hm9WRDVKh7nhPtilEXCrR+gZKlwCvVxF/SSw1hdHV0IVuf
	1J1F6B+WU8umk3B9z0uhAHdwiQGteqcnazI9xLjmvg0=
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr16864805e9.0.1794757224374;
        Sun, 15 Nov 2026 07:40:24 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25648733eec.12.2026.11.15.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:40:23 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Sun, 15 Nov 2026 23:40:09 +0800
Message-ID: <20261115154013.9379-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115154013.9379-1-heming.zhao@suse.com>
References: <20261115154013.9379-1-heming.zhao@suse.com>
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
 fs/ocfs2/aops.c  | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h  |  2 ++
 fs/ocfs2/ocfs2.h | 25 ++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..28a13246e9fa 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,78 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+/* ocfs2 never allocates in this function */
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
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. We treat this as a hole
+	 * and skip setting the iomap flags. The caller will set
+	 * iomap->type to IOMAP_HOLE.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
+		goto bail;
+
+	/* Treat the unwritten extent as a hole for zeroing purposes. */
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		} else {
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
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index e3bb3cc0b25a..b4583b3170e2 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,30 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
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
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN)
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

