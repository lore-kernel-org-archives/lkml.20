Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708473DB62F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416019; cv=none; b=l2bh58DmTsH5DORSrq83sKxr+YjFDW5aFdsMyWVvl8WISMtWhU+FM/BtRW2ANACNZAxXI3DqwiaLLBowSKgVoEQx3nbsRUc0xeqDjOTeFZQgwgxqFSMcZOn7qttO0DX74BVldPhHW7oRkbZ/kwRaqP/2EgDCYLCgykBgJsAelsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416019; c=relaxed/simple;
	bh=8dPj5rxcLsKwidSNh9Klq1Eieuz3KZOlbDjp27Lust8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=twBFu3tjih2n1yw19OIdfze/abL9j9WAf0lYCrxfATSdQRAgwt4iiMFtCzp+7IkTGXH7aW+WFRU8+eLqz5GboBu/CwlG6l2Hy2ndSSyTzrRJVkdw04sBDn+3lc7oOYtfMraaTcIwbNMNF/m3Vlf57mEvoUBacY9q+d9I5LS+szo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M84tqygd; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M84tqygd"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7a15ba46fso58710a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416017; x=1791020817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkkBSW8zyrhYaiSfn9iaShOaguO3DdlMUvXnosyb8cc=;
        b=M84tqygdeEtaOoJ4/bMsoQnPQLE7+SdHZ9e3LtXCYiG8TDPjCN5qv3b3d/q98aH7n3
         zviZ3nj1yI29g7SblgoIvZJUO2J9RWKJ61sW2A1tCveqWAUP9aRldz1HLhFpubL1z8V4
         ofYUGRRDGrMk0fNY9FEK9nlCXdOrAFXpDBrBZjaafeJY7518a7ZHH4LY15ihQ0kn+Y7C
         hhJmoFF7vV8i0EDYqDQklaLd9lO/BDvW2MAINj6icimMkQ3yJ4YvNUPG/OPoGaiX+Wc7
         BRtdw2ub7CyexTGl0GnVut8o2RTwNlLli83k2hXbSfJZHDBhP6KqEaVRNAgwUy076DHU
         DTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416017; x=1791020817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkkBSW8zyrhYaiSfn9iaShOaguO3DdlMUvXnosyb8cc=;
        b=qzjbR6S2wqCwP109SbUIExrQmTD2Z2qaHiq52Qskf8puIJhqqJ+Er6isTXCNAhoVS0
         aGurD2Z1VqmvHZ2v3JWu+dYUJlLTmjPHcvL+Gx3NMEOZzdYs2QIdvRrf9PaAbxdZOnwk
         EiOdLs2Y4gHD4iIcxJmvQfyiGJQeFsufcM8vzqD6HR8Q38DlxLhh/p5Qumnv9H4xefvY
         6+mYpf3gNAwS0chrnSfMjE7YClxhnKUGz7aFG0UyB6ytP3LVsNOifvROFQ0t3m2w9xjP
         5x0Z2MIKKtGWWOvj0MmD9n5rKis239Lb1dcy4U3RXsIFYJypFRF+sTDslJujSHLa40EL
         peiw==
X-Forwarded-Encrypted: i=1; AKwUvBzgMdQomsF5mEj0choUDH1RpN2Ow5QhwZRoDkGeQs09d0/8HHiSGXrphV70742TnPlN5HGnIDrQKDWYG6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBmZV56B+7gq9JvohYwNXu1+PkiS/SmER7ObRDO+xDe5Ioo2pu
	qkjuGVhfwee8vILbs8ppNoEKR+EqAkZ2FJ3o+wGBcWrjvK6js4QHLDdm
X-Gm-Gg: AYBFou0KdRSXIPLAxmVemwOq+PPmDkIu6/RovqDHg8+ArEBDNL6p2OcbO9CJO0YzYTS
	iMfpy6wd/ybWH0cgvPgaHSCNFpu+S/F+9U9pIeNJ+g+Yp/FxxjQhvvBr3FwsX9Js/Iy5UoeW0lp
	wObu5Ogt3WKej44cBx3xPMqhyLISZSAzhbUqCkyhJm+h3PTyhL0okvSQR1P3f8buDo9WNv2YEKt
	ZU11fF6K2w4hOJMOWRDrA6x3aYLnZETJBYCHOdCzc9Y0kRyesKgbGSPUcUdPGl2Lvc0cFmaymV8
	y94ZKa2Qwhc60IOTKmd9i/GTP0X7KUSEeWmE97uChlqjAb2zxBy6n85keil1Y/02Yx4boNNEsD6
	6dXItO45hHxnQO/QaOXBjlr7n+7egl4B1iKSg21FBi4Ivx2GImNIvqs17xKQLjC9vhLZTMHHxC9
	mc8rskC+XWFIdL53NHS0zkV8sATrEmnKuxV/ciL72vzfdcYZ3h+ypjOZhOIuAW9ppYy8YWXAxrl
	oQNcYdjSUrhLyBOkYTrdnmN15ciym4DNd9cy6qvuq2sG+LZJX0VQb/ArV5Zbl2nO68nqacbxSNd
	s7m2zys=
X-Received: by 2002:a17:90b:48d0:b0:3a0:f432:2684 with SMTP id 98e67ed59e1d1-3a0f4322bffmr34471a91.9.1790416017472;
        Sat, 26 Sep 2026 02:46:57 -0700 (PDT)
Received: from codespaces-2362ac.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm10180912a91.10.2026.09.26.02.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:46:55 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: batch block invalidation in f2fs_do_zero_range()
Date: Sat, 26 Sep 2026 09:46:48 +0000
Message-ID: <20260926094648.12124-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f2fs_do_zero_range() calls f2fs_invalidate_blocks() for each mapped
data block. Each call acquires the SIT sentry write lock and updates
segment information.

Batch contiguous physical block addresses into a single invalidation
call. A NEW_ADDR slot does not end a run if the subsequent physical
addresses are contiguous.

In a microbenchmark on an F2FS loop device, a fresh 64 MiB file was
written and fsynced before timing fallocate with FALLOC_FL_ZERO_RANGE
flag over the whole file. Across 20 runs, mean syscall time
decreased from 16.436 ms to 10.011 ms (39%).

Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/file.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b0bdc7a977b9..c227b7603731 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1713,6 +1713,8 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 	unsigned int ofs_in_node = dn->ofs_in_node;
 	blkcnt_t count = 0;
 	int ret;
+	block_t blkstart = 0;
+	unsigned int blklen = 0;
 
 	for (; index < end; index++, dn->ofs_in_node++) {
 		if (f2fs_data_blkaddr(dn) == NULL_ADDR)
@@ -1739,16 +1741,30 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		if (dn->data_blkaddr == NEW_ADDR)
 			continue;
 
+		/*
+		 * Flush before validation so a repeated block address
+		 * can be detected through the SIT bitmap.
+		 */
+		if (blklen && blkstart + blklen != dn->data_blkaddr) {
+			f2fs_invalidate_blocks(sbi, blkstart, blklen);
+			blklen = 0;
+		}
+
 		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			ret = -EFSCORRUPTED;
 			break;
 		}
 
-		f2fs_invalidate_blocks(sbi, dn->data_blkaddr, 1);
+		if (!blklen)
+			blkstart = dn->data_blkaddr;
+		blklen++;
 		f2fs_set_data_blkaddr(dn, NEW_ADDR);
 	}
 
+	if (blklen)
+		f2fs_invalidate_blocks(sbi, blkstart, blklen);
+
 	if (index > start) {
 		f2fs_update_read_extent_cache_range(dn, start, 0,
 							index - start);
-- 
2.53.0

