Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802163;
	b=gw/G46xeGLF8ZmjC5d+l0EpQUD5vzZfXdSyzr2lbUa6lGV7PphsiRPqJnR+5SjbnYVFl
	 bbcHm0vL5nDwHsTx/3HMYi0grDB5hdR9AD3oUifv0cJlzNx4OmsRXZcBkVUkfBiPSOIIE
	 a8yZtNsc17dUz7IW+T1igqE6Cfk5qL5wuCixkbD+raSwYMy1Heh59MnnpI2oiaIGbzyiE
	 M8qu7Gdk1sZhkRevOnlSQ+DW4dt3OkD2qYMSHGLcuo+klwS+si8tTDqBc0GsstBBFqCEg
	 07RNqLsnKONq0U9YJmgSZjghWquiyg2j5/NOMFHkXytn2KTs4O1AgPfTSz4TvG3xZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=itS1+HEShLEFlben7inBoCVV+t3onLIzDTpOeg1Xvu0=;
	b=21+ZsUuSSoJvGwbbY8VBzY51XAWiP1qjfaXDyinC7duYXY1YIH1YwP8guU5kCN1ZQdft
	 knnQgBFNxgJOnP/FcmZD2SxWi3cslU1pWSzxkiU48WMofL9nchR2KNFfqGBTnoABmdLY1
	 sWuKrai7dRHoV33jL66m+089cp/MV0LPuRHKRgrgpfeAMt7xDGlSXVtxQaXRNqfrhK9xi
	 rxDoIn0ocD/XA7GDK8FnqGnfjD6C1HrAL2cUE3p3ctnJm35FcCGr1rdY5fvMBO2Rlxqzs
	 JTHE2XHdeMa3RsPkJR5Y9PBz4ruSqwgi7vPgRkhaXlCRYzPuQMdPKzFv57rdSMtOBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bguVAsU+;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E7606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E6E7606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bguVAsU+
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed0890476fso25789535ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802162; x=1795406962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itS1+HEShLEFlben7inBoCVV+t3onLIzDTpOeg1Xvu0=;
        b=bguVAsU+2B+sL76LGVz7W9woUBO8yKew7wCcoEB2vZs5YuoYDPcbPMyFR0cmQckBre
         Iz1pFT5Bq29Ptc+LgeY97rECTD7wmETJTDiOA+WrXacwKjLO0kQc+AwA7zQWaE9wW7jW
         Oxd2QcGn0fOfTHIO7xOp0/TcUDNxH9EA7DThICahtnjDGpblNR0Y0yQlAldueFG/hu8l
         zR+FJ5op1vdFtR7yx1GNfaZahfyPf/mygOW28+f9yzyRhbC12UJr/GqK/ug94dXtnw6J
         i8f2KngQfbC3j5bSvksnVkOCajGDQKoOgXkt5KyJHclhRKD1mpER/9SF2x72l6cEYY9w
         Y8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802162; x=1795406962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itS1+HEShLEFlben7inBoCVV+t3onLIzDTpOeg1Xvu0=;
        b=ELl5DfomDXhF3EfSvtPkbCWvlYoOU7cUCQ6eAmRQunNLBezd8+085lagDAd3PXYm3O
         kPdpDNwFn/irynlQ7SOcSkXj5SYvMJhSAsCIQNKYAMYNuRiNlrmFTcomwePVNTd+dd3G
         YsYQZGvbx9BSM4q+XZ5lGGIVOgCyNzjstlcXts+aUcWnDk6nSC9MlNGb3nf+TpNa0PTp
         MjeXwxDYuo02amvU8k09GgkNgXvIO7gtjHPQSMtgdJ5CX4ql8hvTQCXleByI+UOMdt3a
         68L/dtCbA/x5nnzmhWNt1MrDDz/JHbOOfJiMNZpBvMQjAIJDFEhI2AwLqH6R+D5J8APP
         5PbA==
X-Gm-Message-State: APuU4Z+YkDV74e8yrhdf8QlgGmnRjumoZp0T2SQF0dVGBgXsvapTvLYI
	YfnzeESx8cEO9VNUGv8Azat//kQm4ybF0ZkNwVEV2zwekUmlJPklJ7DbI1KXyQ==
X-Gm-Gg: AYBFou08N2KvexYqDrIbppRF1rEDjo8T38qhY0zvO12g0kLbDFP3pFmTd/Pwpi5aDeW
	tz7ydTsR+Zt6urHMQD10lA+HBSYWBYgFOOS429v5RDI5bSc6rhUOTlWiBDqzEP46b0Q8jz6AMMd
	7wjsakvOIfj5qcrdPLFDRRDkIKo3gYOHZVJU96m89brNvf7R/OtTbdeMG0vu6WJl5ThJcxe9aCz
	piaoHS8BVK8H8CsjOJ77Od/1a6kfdOaKY3o0UmFTHhSJ0aYcILfa3XX5cgwN8k7JJ+KiCJxXwm3
	v2ORYUo53RS7SXLmx1NotlX8uEksWg8MTy2pelFC9XtLCStriRu4F8aLxzCEKS1ztXN528l3Ddm
	XEDHnGy6gyevM4IRPeAlBdIIOvfqBUcyzrssv3oWXvkRCljthc8YPgF//uD+ihy8iI4Y+sZoK/B
	LB058tdymhcYE/AosA1fybWGmSyWL+h5cG+y07U2UzadzN1H7qzmOpRBRVmTTUIe6LCvIiIvqfq
	Sls9oMP6QIBoYeqT35kKRJdLRiYy5kfAJKKD+8dyGW853W+LedAb5VoTAyeueBB4tL0JZ1wklYE
	8ipGRqaqFfagO0JnaW538NDRzovhR8dYZT3CZOLhcNfUTA9LYZD5Vz4P3JTHDG3UlEm8TddSFvo
	RyPKUNPAJhkocSnOmfCGX0tZQF9BK14DWG7K+ZDbUrHoTQbM=
X-Received: by 2002:a17:90b:2247:b0:3ae:2969:9031 with SMTP id 98e67ed59e1d1-3b1b0d08f2cmr9878273a91.54.1794802162415;
        Sun, 15 Nov 2026 20:09:22 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:21 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 12/20] f2fs: support subpage blocks in defragmentation
Date: Sun, 15 Nov 2026 20:08:43 -0800
Message-ID: <20261116040851.2849696-13-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Mark only the target block, not its whole page, dirty when redirtying
data for defragmentation. Remove the -EOPNOTSUPP check.

Read a multi-block folio once through ->read_folio() instead of each
block synchronously, and redirty the folio that was read after locking
it. This also applies to large folios when the block size equals
PAGE_SIZE.

Read compressed files through ->read_folio() as well, with any block
size. f2fs_get_lock_data_folio() reads the mapped block as it is, so a
block of a compressed cluster that was not in the page cache was read
without decompression, and defragmentation wrote the compressed data
back as file data.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4499a461be86..26dd06961389 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3202,6 +3202,41 @@ static int f2fs_ioc_write_checkpoint(struct file *filp)
 	return ret;
 }
 
+/*
+ * Return the locked folio of a block to redirty it for defragmentation.
+ *
+ * A compressed file is read through ->read_folio(), which decompresses the
+ * cluster: f2fs_get_lock_data_folio() would read the mapped block as it is
+ * and leave compressed data in the page cache. A multi-block folio is read
+ * the same way, in one I/O instead of one synchronous read per block.
+ */
+static struct folio *f2fs_get_defrag_folio(struct file *filp, pgoff_t bidx)
+{
+	struct inode *inode = file_inode(filp);
+	struct address_space *mapping = inode->i_mapping;
+	pgoff_t index = f2fs_lblk_to_folio_index(F2FS_I_SB(inode), bidx);
+	struct folio *folio;
+
+	if (!f2fs_compressed_file(inode) && !f2fs_has_multiblock_folios(inode))
+		return f2fs_get_lock_data_folio(inode, bidx, true);
+
+repeat:
+	folio = read_mapping_folio(mapping, index, filp);
+	if (IS_ERR(folio))
+		return folio;
+
+	folio_lock(folio);
+	if (unlikely(folio->mapping != mapping)) {
+		f2fs_folio_put(folio, true);
+		goto repeat;
+	}
+	if (unlikely(!folio_test_uptodate(folio))) {
+		f2fs_folio_put(folio, true);
+		return ERR_PTR(-EIO);
+	}
+	return folio;
+}
+
 static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 					struct file *filp,
 					struct f2fs_defragment *range)
@@ -3327,7 +3362,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 						cnt < BLKS_PER_SEG(sbi)) {
 			struct folio *folio;
 
-			folio = f2fs_get_lock_data_folio(inode, idx, true);
+			folio = f2fs_get_defrag_folio(filp, idx);
 			if (IS_ERR(folio)) {
 				err = PTR_ERR(folio);
 				goto clear_out;
@@ -3336,8 +3371,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 			f2fs_folio_wait_writeback(folio, true, true);
 
 			f2fs_ffs_mark_subrange_dirty(folio,
-				offset_in_folio(folio, (loff_t)idx << PAGE_SHIFT),
-				PAGE_SIZE);
+				f2fs_folio_byte_offset(sbi, folio, idx),
+				F2FS_BLKSIZE(sbi));
 			f2fs_folio_mark_dirty(folio);
 			folio_set_f2fs_gcing(folio);
 			f2fs_folio_put(folio, true);
@@ -3378,9 +3413,6 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	struct f2fs_defragment range;
 	int err;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-- 
2.56.0.611.g1030f0b940-goog

