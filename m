Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202278;
	b=reZrSybn7vKYyajSSgcHgUJGXNqjN0+8J6EDfugU+b95j9TDRApERAFAB2DfR5iidTcg
	 8n4t6+6JWkPWVUagkWRMOGiyr9MP6NO6mrza+kSjnPnnbcYd1GQwOxzbvd5dXliSqPTDo
	 86m2KuuWR5Dv0xycchIgDvHCefm8yeJwIByzh3OzPHDjjbF+InU7qiTz4k25m6IoWr6CH
	 wdHn7lFavQ/4hJmRTHVUCw9K6VoOGWSvmej+J25r5fGLM+ViGu/NgkI+V7qC/UXt26SpX
	 Fwutxdc4NzAv3YwWYOMlY1tA5zsygRB4xF60VJP+sdWf6PkzAGOivj5Q0B31mE5j30Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OYuHZZGI+jjpXj2nBM4OnsPACZYpWz4vAyql0O4VDks=;
	b=4NhMmJk8IZiAMpVTzck2PVlWkeQP4QX8k7xTKiHHV3CBDI4Zc1UH8ER/KgpfnYdc6R/8
	 +1PxnRXo4ks63bmLaa6QFjRVXPV0MjK4Q2BIcp1/a1vo2jSJJDcP4qxzSp6dJc2RorRdj
	 N+BoPQu3a44oS+0XDgRa6UIpkB3JLw/5tcj/dKfvUgi9E6tyK7uKYYJ3rWtZ+LrjGngAd
	 rM8t+X+Bf7XhK3b5ExQFGdj+47n7ZHI6pgnbO6qUup80Jm8tH6y8yYMsyQ1KF6vLIy4Pb
	 VjZYF5xrWpHh9FskO1FWZ1qvSPDLss69xSTMteZsnWIkze3q5moArADu8dO9sX7gvPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1+jWP94;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479C60A263C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3479C60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1+jWP94
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so8735575ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202277; x=1793807077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYuHZZGI+jjpXj2nBM4OnsPACZYpWz4vAyql0O4VDks=;
        b=n1+jWP94OHRttvUXzf4gIjD/Djq5Mi4InGdKDEKpQfWsHRmXbNDJYJ65eUn7SmDjE8
         qL/9/pweYnTNWdsehIDU0QMs8VbNwkhPRBzPYZtu0WU0G8kt4/bHfJ/NVHbcKeDXI09o
         L5yufk90DvGY8hahVEbJeXyxon0QlFiRTYpD5L8NuZiatBP+EjKqqfrc8e6KMNj6oGKY
         esYjjC//CZBeScKTMAh05w2BovG+Ivw83axz3DO9nSFaOo/K/5cCQGAsdvMZJoXQaDYt
         9cHGjRq+uOl4Gq7i7aPIEV2px/uke7u9Gbbjw2vdkihAkbFu2FU2NBasiA7Nu+sGvin2
         YjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202277; x=1793807077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYuHZZGI+jjpXj2nBM4OnsPACZYpWz4vAyql0O4VDks=;
        b=t8PtZC5+iR3OyhBW89J+JXKWqDUFxV1bKgf/SERdyNbZ7a8vbDD3Y3xMH/8vyeLrHq
         rlz4niLEeib4YVCq7y76gtal/uyInSaWli6v2kHxIiWfDQn27bJsvMm22k9R2uMYoMfV
         rbPY4caHPh9+x3nB3gB7vWZLjAKqHAUMvz4hmnpbuO82L/7OigEMKPVizC9CYVNeBb6d
         jWavn5tykBe1i0jXJMw7b76AvfU2cNiLz5wMYuIJwVlnq/eytmb+u7OvDXXEwarmQO04
         zcpxDV0futw3GFM2Z5lDe2i1KYf6IT8SHd7YMMi1/7XV2XD1oALBvmPwpbGxVUSPcGec
         zzHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpRzBj+/mke+7ukmL+zXGZew2w6/3OrzvRYOCYt6R5BIITk4KxpbOVmKJsT/w42/ZbGstejrFH7gl+Drc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiHBk/5/Uw9NbEmIcntpNwpoFbI30jD8VR5d7pLkUiN88Ymii7
	tbNWX8ykWVnbmxVBqhUqXrecgf8nhvfNWzbL6aXFmKvj4UAd4QaB7VY7
X-Gm-Gg: AYBFou23NLcl0LEKwZBf+lOgnYC9VUJjahqf4MRt/yOtIqIr9Y/48Qb7aMVNcKi4O1t
	CZZfdA3Uw4+Q1pHZf/B29hX2X5oTgfnjPPZ+K1Ea8xgrPlCr8OV3C1ks+snZ9+0yHpVYT0Fs6Zj
	d3R5BFu2u/PzrUYd11ABN28JH2kiKuTbdpixJ7BhhuSUf/+MG+KSpFvEmVYYuSe2fyN4+XEGYzV
	Xq4gzjaAvnePonaVSt1W2gjjQSXtlV1YEjlIYl3Vf0hhEjnTkYEqbq02PkIpmUSF+JVQLmGYDVT
	GCwQEISQspwTm7h1xxWPiZ0i0+GmqmqiG2/CZw1IvaRo7gKDD3N/SsVEO0H3EmPbVoUdO7paeQ0
	AVPtHaF3ClU56PC+sAiaVi8Ll3YnR/lZTxO1RGn2fbK4HDjzkTSU+lQyDtjOPzEZkW9cEAQpW8o
	Bh+TO38tEPpR4oEAdq1/kM+P7Tu0xS1LKBRUD4i++Rqsoa11EkIYOOgYzmytSknAmFS5RkxXKwa
	9H/IkAfnO+NmCAY0LHBTO5WtdyuTWa3VpUIB0tSWvZCpWa2iz4tHWfNYNMwHMp8gKjEY0EOSNEi
	x6zBF0vmf/2VFKQ4MXUXvbK9RamPEPMfpHCKEyJ13EIEk8HiDNkOLrOH65s+J2b/jO0=
X-Received: by 2002:a17:903:120f:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eb004888b6mr26028085ad.14.1793202277470;
        Wed, 28 Oct 2026 08:44:37 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:36 -0700 (PDT)
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
Subject: [PATCH v8 04/15] f2fs: support atomic file large folios buffered write
Date: Wed, 28 Oct 2026 23:43:55 +0800
Message-ID: <20261028154407.1601430-5-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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

ioctl can convert an inode with large folio support into an atomic
file. Support large folio buffered writes for atomic files as well.

Add a large folio atomic write_begin helper that reserves COW mappings
for the write range. For partial head and tail subpages, read the
existing data from either the COW inode or the original inode before
marking the subpage uptodate.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 86 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e991adcff6be..fbffe4c56090 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4311,18 +4311,22 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct folio *folio, loff_t pos, unsigned int len,
-			block_t *blk_addr, bool *node_changed)
+			struct inode *inode, pgoff_t index,
+			block_t *blk_addr, bool *node_changed,
+			bool check_reserved)
 {
-	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 	bool cow_has_reserved_block = false;
+	bool append = ((loff_t)index << PAGE_SHIFT) >= i_size_read(inode);
 
-	/* If pos is beyond the end of file, reserve a new block in COW inode */
-	if ((pos & PAGE_MASK) >= i_size_read(inode))
+	/*
+	 * On the first attempt, an append write can skip the COW lookup and
+	 * reserve directly.  On retry, check the COW block first so the same
+	 * block is not reserved and accounted twice.
+	 */
+	if (append && !check_reserved)
 		goto reserve_block;
 
 	/* Look for the block in COW inode first */
@@ -4336,7 +4340,7 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	if (*blk_addr == NEW_ADDR)
 		cow_has_reserved_block = true;
 
-	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+	if (append || is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
 		goto reserve_block;
 
 	/* Look for the block in the original inode */
@@ -4504,6 +4508,62 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	return 0;
 }
 
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len, bool retried)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	size_t ori_off = offset_in_folio(folio, pos);
+	pgoff_t start, end, index;
+	int err = 0;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+
+	if (!f2fs_ffs_find_or_alloc(folio))
+		return -ENOMEM;
+
+	/* Inline data must have been converted before reaching here. */
+	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
+
+	start = folio->index + (ori_off >> PAGE_SHIFT);
+	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+
+	for (index = start; index <= end; index++) {
+		block_t blkaddr = NULL_ADDR;
+		bool node_changed = false;
+		size_t off = (index - folio->index) << PAGE_SHIFT;
+
+		err = prepare_atomic_write_begin(sbi, inode, index,
+						&blkaddr, &node_changed,
+						retried);
+		if (err)
+			return err;
+
+		if (f2fs_ffs_test_blk_uptodate(folio, index))
+			goto balance;
+
+		if (blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			goto balance;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+					   DATA_GENERIC_ENHANCE_READ))
+			return -EFSCORRUPTED;
+
+		err = f2fs_submit_page_read_sync(inode, folio, index,
+						blkaddr);
+		if (err)
+			return err;
+balance:
+		if (f2fs_balance_fs_folio_locked(folio, mapping, node_changed))
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -4514,6 +4574,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	struct folio *folio;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
+	bool retried = false;
 	block_t blkaddr = NULL_ADDR;
 	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	unsigned int blen;
@@ -4593,16 +4654,20 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 */
 	f2fs_folio_wait_writeback(folio, false, true);
 
-	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len,
-					&blkaddr, &need_balance);
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
+		err = prepare_atomic_write_begin(sbi, inode, folio->index,
+					&blkaddr, &need_balance, retried);
 	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, blen,
 					&blkaddr, &need_balance);
+	else if (f2fs_is_atomic_file(inode))
+		err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len, retried);
 	else
 		err = prepare_large_folio_write_begin(inode, folio, pos, blen);
 	if (err) {
 		if (err == -EAGAIN) {
+			retried = true;
 			f2fs_folio_put(folio, true);
 			goto repeat;
 		}
@@ -4610,6 +4675,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 	if (f2fs_balance_fs_folio_locked(folio, mapping, need_balance)) {
+		retried = true;
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
-- 
2.43.0

