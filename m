Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985920;
	b=lUmHQuO5dFrMLX1rGByep4vudDW91k2h0xLfVQxYnEugH9LtdFPwN3PZ1eqaD38Y0Weh
	 3TiiAzLkebn5cJP7YfWmEvbk/N6YE134uvQJ5H1DHVI/5M7aDzW282SGwPYGxndzZOR8l
	 uUEhe48lBblh84f9KPPyig5cD6KObEpEd3q8XlLsgWkqVYVE3R+eiITP5cXtPdgfbnZyX
	 uC8KzfMWGe31kTMjyNWms6X0YkE/jW9SovWptROFBXIVYCiQ/w51dZzYyJVrsfdYqjbcm
	 xGLSDwbVqg8sef+eTz8Iy6xnMLyFT9RGm6UaeslXjelbG+vDHG2hRYAFG/1yblMal9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=diDzf0qPFinEe80dBTEZm6MKAA9079p+WnYDEu9PBSI=;
	b=o3HQSAoJs3VtOJLhxOQwtl1Co3DDBOyx4hxR1FezbSQSNbfzaSQMhfXWMrgq0w5IHq9i
	 lXr8rypiDhBvZmdqQdVavivPYHoPFuPWw9xfWO59sLv6mhF0+NHL052cOSqDSc7Nkgf1U
	 fhNHBQotfI1n067vEiEhQxLuqnUYm+dcOIttqH458snnDhBK0oUtH/ttHKDvaw2L53TRq
	 lbbE9Jt+emT5SnCangtxOvZiAqXNuiczmYJmyylC9WcnBDu9kMFzBthECAn1x2LmpwXBI
	 MEuwHv5fUGNAoRSo0gkAbHp9RBUJe0AwgZ9yjR9RFD6pw+q8OErZdPZwzj7lT6arOOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHhr19e7;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C42A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHhr19e7
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3564so456500a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985919; x=1793590719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diDzf0qPFinEe80dBTEZm6MKAA9079p+WnYDEu9PBSI=;
        b=BHhr19e7UjMl3FoRDXRMuoII+fIH3Jp70IfPat9ZgdN5vNt/LBL4jq51EdFqjWEBId
         WnnXYM5t2MxNveaftVP4AobxDdY85cl4TyRnziW7RQONSdipad2V4flb5ZzAt/4myVDB
         kvcFfwScMXrfqTklvbJRe1Ai3CChD4VCFTYFjlzsFemH0/OAv4aMLiorLiAki6OUEgqB
         bMLgVuXlAhYB0okPRy2VUXgnQZl4hkgkAjyEZTYRN0QIG26IJy1Czxc6eEt8TKfbi9cB
         qn5/u4OhSpMUE49SMMrEEbkdj2hTSmaeba8L4amUGMifiv6d7wk5QMZfxvGdlbCE3a5Q
         yGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985919; x=1793590719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=diDzf0qPFinEe80dBTEZm6MKAA9079p+WnYDEu9PBSI=;
        b=XypRWWWWFCCdjdIXrcJE0GGjXV9jwTZTq6mkK4toWTum5RW/1Af26H6VnO8FOylYy+
         f+jAvl336gD8ctfWxy++zl/juLJSjKqvEFG9YtNDSmRQ7XfmXNq5LjK5R2ULxLEyILoK
         InOPQjhDjVJ7gXo3DD/J8dYr7+ttO5EPRxQ7s57rAjKYLAl/ILX7GlWE1d2TubrKZkmJ
         BrunXFmmq5zeOcrK83AUpi2fvLTc9ZWmxZ47r15clGbrjFoh6IYq7EEK2ZZuhuSCCEz7
         BHHMoswGTG1HIp5ym7PwWKoZsxKnKIOEi9Nf8ekT/QYIh/HCLZjjh2a1WjJcB0/lXCnf
         Cs4A==
X-Forwarded-Encrypted: i=1; AKwUvBysirukV6ipqD1Im2e8Dfft6m0DUYe20x/r+QpfXJH6R6uc3aNn22l74h4cdJgKk9WIfWLCZ0Av/ShDsAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2X59Pt3G5388ndI2oG6+itkCMB+A8aXHJ6qF65ecK46Vztko3
	apnR282z5YQoc8iI6g5HQJk6DRgBVyqVenvccwMTHUFqDWQChCVt1juN
X-Gm-Gg: AYBFou35ZNC1b3rBMJK/lNWTAqb3BKTKO9cC9euyy6wwj73PGaGKl2yFZgBxQLeehlH
	0b6jJbx6fWkKgpVwOK/dzT6Uah6QwLOaKKdda1DKzoCHTar0tv6EPe/jC27lm1GwX7OhvOCwSSo
	7nNvggLUjUWjCFzTLD/Ksy/ef9+nJhW2/D8+A66VbjTgiO769AZJWZ7jVSEefMHsNwWQI65mLhl
	luEJyfOIMxZroA4R0ZxjVUDhXIY12CuLF9FhjkWmzyaEK2c1Qo5RK0CJViaUZuLwsiFd7tMBtUV
	btiHaL/Qt3UvEqdUKJRzoQDo19xd4G6H54Why7MKwOTLzGwZX0CKWP4mFkkvy3NW0WAzhFAV0Ie
	PfGN1s/CrzblN/YAK+CXVR1GitC6Ih+eZNHpUSLO6ozWt+P/F+KfoBo6GdWMeLTSfYXETs/K00G
	SJhPVUXX/5wJiRD5d/UD/5JkhwDsUXUpB+KP8rq3itshWFhjAiYGroifiISZ8D16VzGe1ZpZvsQ
	IW74OZ0blr7RPWX4SxjhCYRyNp+6iY0RAQ6mAU1YZ8aGyXQCLGbl3PNfPiz3hx0Nevh4KSukj2M
	MkD0iCbOWFdCIb4PMcxuQx+UYaORfzWpQMB2dulx12U+mvRizS6NqQJcz+u/2yzKLKvN
X-Received: by 2002:a17:90b:2f4c:b0:3a8:6045:5a24 with SMTP id 98e67ed59e1d1-3adeb0fa979mr5362979a91.38.1792985919082;
        Sun, 25 Oct 2026 20:38:39 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:38 -0700 (PDT)
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
Subject: [PATCH v7 10/15] f2fs: support partial uptodate large folio read
Date: Mon, 26 Oct 2026 11:37:40 +0800
Message-ID: <20261026033745.784107-11-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 102 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b805dbe2c187..2dacc9211cc2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		struct folio *folio = fi.folio;
 		unsigned nr_pages = fi.length >> PAGE_SHIFT;
 		bool finished = true;
+		bool uptodate = bio->bi_status == BLK_STS_OK;
 
 		if (!folio_test_large(folio) &&
 		    f2fs_is_compressed_page(folio)) {
@@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
+			if (uptodate)
+				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
+						fi.offset, fi.length);
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
@@ -172,7 +176,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
 
 		if (finished)
-			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
+			folio_end_read(folio, uptodate);
 	}
 
 	if (ctx)
@@ -3157,6 +3161,70 @@ static bool find_next_valid_block(const struct folio *folio,
 	return false;
 }
 
+static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_bit(ffs->state, end + 1, start);
+}
+
+static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_zero_bit(ffs->state, end + 1, start);
+}
+
+static void f2fs_skip_fully_uptodate_front(struct folio *folio,
+			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
+			unsigned int *max_nr_pages)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, skipped;
+
+	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	next = ffs_next_nonuptodate_subpage(ffs, *offset,
+					    *offset + *nrpages - 1);
+	skipped = next - *offset;
+	if (!skipped)
+		return;
+
+	*index += skipped;
+	*offset += skipped;
+	*nrpages -= skipped;
+	*max_nr_pages -= skipped;
+}
+
+static void f2fs_truncate_read_extent(struct inode *inode, struct folio *folio,
+				      pgoff_t offset, block_t block_nr,
+				      unsigned int *len_blks)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	unsigned int next, end;
+
+	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
+		return;
+
+	if (f2fs_is_multi_device(sbi)) {
+		int bidx = f2fs_target_device_index(sbi, block_nr);
+
+		*len_blks = min_t(unsigned int, *len_blks,
+				  FDEV(bidx).end_blk + 1 - block_nr);
+	}
+	*len_blks = min_t(unsigned int, *len_blks,
+			  (unsigned int)fscrypt_limit_io_blocks(inode,
+							folio->index + offset,
+							*len_blks));
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	end = offset + *len_blks - 1;
+	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
+	if (next <= end)
+		*len_blks = next - offset;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3189,6 +3257,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
 
 	folio_in_bio = false;
+	ffs = NULL;
+	if (folio_test_large(folio)) {
+		/*
+		 * Allocate the folio state before doing anything with the
+		 * folio, so that the block mapping helpers below can rely on
+		 * it, and fail early if memory is not available.
+		 */
+		ffs = f2fs_ffs_find_or_alloc(folio);
+		if (!ffs) {
+			ret = -ENOMEM;
+			goto err_out;
+		}
+	}
 	index = folio->index;
 	offset = 0;
 	nrpages = folio_nr_pages(folio);
@@ -3201,6 +3282,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3233,6 +3319,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(inode, folio, offset,
+						  block_nr, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3251,6 +3339,12 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
@@ -3258,12 +3352,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * to prevent from premature folio_end_read() call on folio
 		 */
 		if (folio_test_large(folio)) {
-			ffs = f2fs_ffs_find_or_alloc(folio);
-			if (!ffs) {
-				ret = -ENOMEM;
-				goto err_out;
-			}
-
 			/* set the bitmap to wait */
 			f2fs_update_read_folio_pending(folio, len_blks);
 		}
-- 
2.43.0

