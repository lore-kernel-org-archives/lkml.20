Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655669;
	b=Ono8736vC8HDUufE+eVUfWJnTBGRB4/TXOkVxGi4QLxtwaUG5jNmUNCGK5PpniydYAwL
	 66QETLHniJ13nJLLOWhxtFucaJhvl1rR2fyeXN6WmX+OVSwl8XmMOwW75H7jlISV3TEWb
	 fKHWQL8x2nYxe/XYhEon9v2cTaxP9H/J1pF7aNb4wW1bB3YWqelGd3Gw+ttdM2eLcOunY
	 pxH9KtHKhq2VBmXSbShsA2X++E4FJAhaZBlaY1om1BIkMIyooKlfppDRkMkWbuTF9IWeV
	 F8jpJ5eRMIU3iP1cdPTVeDlFyXG8HJlCRjhHIubpdgFy4eFgmiZLpeucqAbPyPeg6fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tc/c8341kdGrljrmpl+zI2/ClvSJfK/p7gQKezk4jH4=;
	b=w5oyLeFGQfqlQ7WNaDss0PprJL1mL1zavM5r/lDtE73hWMQ29lG7gGdrxx1Z/OQJgKNi
	 IZoYkJdcccZEliRfZ5wUP62Rx8omemalenNhKB+OrWxo3bVIPCQnkrG9xnuo0MUF7XVKs
	 fk4tXPtLFiqRGO5HEnlXU5HbqmGch+xyBgIyK2AR0FeRCkJ+lInQRPGV+tK/C8KFFva3B
	 uV9RlUdLWlyqWSEvQwo76ayc2+XjWSaQMu19fbXzvzSHXmz6xH+x3u01U1VQk0zfrDQAJ
	 kVJsd42DD99DK1Cpr4xRAoOTSECk2jmF+s4cqVHmdq6rZZfB50pKHygJ3mJzCIPPfpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JnO3AJDz;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A46606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A46606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JnO3AJDz
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso914742a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655668; x=1793260468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc/c8341kdGrljrmpl+zI2/ClvSJfK/p7gQKezk4jH4=;
        b=JnO3AJDzi+VVg1gEjysMYKpdvWK2xf+2FPjHcsoH/J2IgWbHiuLqbzMtflFDVafRmi
         5W6GSTA/zEuYxSJvs6wSQTKDjqQBjAQvQ2TaMgfhyqItWYQqKKong6VlUduFtQopi3xb
         LokVDYp5PEHbJ+AFOv2xM2AvyU1+hXxqczcmA44wzf7yGLeMDvxrtfTFLQWeDN422lv0
         /CNeoWrp57GA+jBJrraGKGKx4UX3EmE6CZDgPBi00z2YEoJ3+QieW4I55wbEXg6yVmTo
         N8Bul5yrZ+OzP0pyCkUV3HLwwd+lDIqpYzzQXAn8aCLFtc5o/1ITtuBq79xkStc7B0FB
         Jd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655668; x=1793260468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc/c8341kdGrljrmpl+zI2/ClvSJfK/p7gQKezk4jH4=;
        b=SWPR/2+dvK3gBhfGu/7cOm3R/Ylf/Z6mjpYHIt23rErwymOzvlsEXDo4aXVwFSOvZs
         JMGswY7UuLRRiad2PeT4nGMjO0dZYBjOtdoGNm1jpnLl3Fw6VHl3+hg05V3dOgMGlVwi
         /An9oLVAhrQL67KN2HRegXux9e+pQ2ySQ8m5cWKoyYqX+jWQfgcThiCh6HHrdo0pqwo4
         5iUcObkqhVY8cRIrx/Odcaj8qb7QmihwxyGuVX6NdA3kh2dOo8NVT9yx++wEEYMmuHKi
         08My02kips8kKWbCJbn5EaCdKNy7ClcQEK5k3aWKpAvUJLOBQVGTeel7uMhkb2GhlKLz
         8FSw==
X-Forwarded-Encrypted: i=1; AKwUvBzLHCi35R/0jIGqtHln2K6t7DEW1SDndmOrBBBIP/eLoyMRnURCXGpR5DFCHTpvXrTGLsRzoh8vGtvAVys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4A/2CWIr/7qe0KyFVwmlDiRngxrdWi9loAm9ezTX4UAgyLmAP
	qVHuVe6VFIDMPp+3JqJGVNh9mmYTXsQkygC3NenNKoOM1mFkIWUyjNtO
X-Gm-Gg: AYBFou2hA5P6yGPVKa13NtvS//h/tbdoMZZYl8RC7NmlIzbWADbplAzPYwH4atGPjvj
	tbFsE7p27Fyb7E5WD/qssehzbgP43RPVb1tCxSrBSjm7SZMTXd36P2E8pgEACSVH8LL8rEZ/VMA
	tCIZ1X13zsM/DzHi+7B/eOQtBvGQgyTx/uyFF4j562haFXwjW7GMMs4TayCHcDlpSBALSq/ZbAp
	Mo9IhyTTYeIo4k/xwt7RrP+jpl4h+gLkW70DcWMxyZkHv+vbGgAMFgutEpayC765JFTDlt2wTm4
	+sUjyV5c3sAMjP0RD60d88BVkjyfvCh8Q3EM1WNhLpu/be4JZ3bwNCUVUEBeaJaYvWSR704noVy
	41ByX9969ubCOv03pZsIZCGy1kjKWgBuTn/J1sPyrcIUfSlg9fZ0WwXM1bhqi5/AnwH5Wg7UdpC
	aPNle62zhDLrJdwzOIRxmRt9uVEF4gAzdOjIMfq9KfH528/D1OYLhtZ79fhud0/3Pa4fF8atVy9
	YXQ+Ee5imeRmScBJaJkYNvbNWY0o7avTTnI+KKqd9CXumfwEFjWGgVT9uXiZvAev9wCSGrDgB6u
	LQTdnKnIvZ+h5qvKQg==
X-Received: by 2002:a17:90b:28c5:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3ad86f4b49fmr3660454a91.48.1792655668108;
        Thu, 22 Oct 2026 00:54:28 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:27 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 09/15] f2fs: optimize small block size large folio read
Date: Thu, 22 Oct 2026 15:53:36 +0800
Message-ID: <20261022075343.3043003-10-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

The original f2fs_read_data_large_folio() implementation has limited
benefit with a 4KB block size, mainly because updating
read_pages_pending greatly increases the number of spinlock
operations.

Use len_blks to batch read_pages_pending and iostat updates for
contiguous mapped blocks.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5671395130b2..bc1bffbb15ca 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
+		if (f2fs_folio_has_ffs(folio)) {
 			struct f2fs_folio_state *ffs =
 				(struct f2fs_folio_state *)folio->private;
 
@@ -3151,7 +3151,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned nrpages;
+	unsigned nrpages, len_blks;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
 	bool folio_in_bio = false;
@@ -3175,11 +3175,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
-	ffs = NULL;
 	nrpages = folio_nr_pages(folio);
 
-	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
+	for (; nrpages;
+	     nrpages -= len_blks, max_nr_pages -= len_blks,
+	     index += len_blks, offset += len_blks) {
 		sector_t block_nr;
+		unsigned int i;
+
+		len_blks = 1;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3208,13 +3213,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 got_it:
 		if ((map.m_flags & F2FS_MAP_MAPPED)) {
 			block_nr = map.m_pblk + index - map.m_lblk;
-			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
+
+			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
+			len_blks = min_t(unsigned int, len_blks,
+					(unsigned int)(map.m_lblk + map.m_len - index));
+
+			for (i = 0; i < len_blks; i++) {
+				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
+						block_nr + i,
 						DATA_GENERIC_ENHANCE_READ)) {
-				ret = -EFSCORRUPTED;
-				goto err_out;
+					ret = -EFSCORRUPTED;
+					goto err_out;
+				}
 			}
+
 		} else {
 			size_t page_offset = offset << PAGE_SHIFT;
+
 			folio_zero_range(folio, page_offset, PAGE_SIZE);
 			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
 				ret = -EIO;
@@ -3234,9 +3249,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			}
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -3260,17 +3273,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * If the page is under writeback, we need to wait for
 		 * its completion to see the correct decrypted data.
 		 */
-		f2fs_wait_on_block_writeback(inode, block_nr);
+		for (i = 0; i < len_blks; i++)
+			f2fs_wait_on_block_writeback(inode, block_nr + i);
 
-		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
+		if (!bio_add_folio(bio, folio,
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
 				offset << PAGE_SHIFT))
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
-		inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
+		for (i = 0; i < len_blks; i++)
+			inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-				F2FS_BLKSIZE(F2FS_I_SB(inode)));
-		last_block_in_bio = block_nr;
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
+		last_block_in_bio = block_nr + len_blks - 1;
 	}
 	trace_f2fs_read_folio(folio, DATA);
 err_out:
-- 
2.43.0

