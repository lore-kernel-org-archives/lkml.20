Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67624AA01F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440419; cv=none; b=fwjDZY+teGBwtTZuhSKyO33d4NgeWqSY2c2wXD7KcUh8Szg3DL8cBDAoIVdSMhzLBC5+H9iUSKIeX6MLQPkvNXiIBG5sw3b5Vg+8b+Fv7Jx7O/P6Yjb9kR30fzZng5k+yB5XLe7ypPggE2/HfixSeUJo4Tpgib+tbO/EDdsV4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440419; c=relaxed/simple;
	bh=06+qffQcwEwALMxBLy9dFemvnbiaogYHvKparT5EmWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et2st3Zrm7pez4yQAittXuu6eTtsZV2jlKocCBLIbCXbOFCELUHjZO+8JFAcIER8SOwFK59rwboKXirNg94ihHhldnKrRe4bZPut+sFGpwP+SEaHvxEHmx3jTCqPOU4N1pPJQInsJ7GrrQJNPg+527HHGNP4YxgULxpLOhKCumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbSt71qi; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbSt71qi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1980685b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788440411; x=1789045211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNUKKLqZvrANPeHHYmjPL7ok/64poHS/mGT0EIbK468=;
        b=VbSt71qib43/2Tbef1LbeD/M8nDsImuyJRUhYtQTC6SWYMDYP0LR0xOxPnmuhhWgZv
         XU7P+gBE93KxjOsk0RT9majmDglzcbbPIDvaGkyvKCrIcOATUivGlMJVI3k85JRIB9ek
         yj9oNQgxUQxCw+zefldFKJSlD01AyBmlLsxa2czGCBipDZoqThrwPYZc+odDQdPScw89
         YyjaBDgpSiDybbByDYhNCL5a0OEEC7cYKSL5xPiaCxK+/R8STC/qpXpl4Zisi7+/V2zW
         caJOBEM6KIpsZr/8WvvI3rpnQt1GLfoE+JCKpUr7s6oAuZdDpidH4eMuTh0TJY59KpYb
         CTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440411; x=1789045211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNUKKLqZvrANPeHHYmjPL7ok/64poHS/mGT0EIbK468=;
        b=X21ca0VZPzwMz/MLF2BXC2JoOGOoYEZsFjFAmmoWL9e4KP/0X4vj12RTVVo7a04uFm
         07hbsk4NSlYheugWe+EVwoIaxDOqBJNmaHqVsCY5VqtmjlF4KEIWqKpXw8KjTV0WuLQT
         KhYvQFQVPCML/x+NtYbMqrdRBSrwUk3dVFtAca12PtH7BAYj4ZbFgt6DE0WMjqy8hQAz
         F50kGXRjfnFL7lOsJROOzGdF/WZJNanYcvPdsCGHnTtIeg0X+0EeES1R03WStETAp3ij
         L81b0GqNQOpmffO46J05eqbOv2cJfGhuWtLBtHcH/EPm4M8xfLBdcv6nuUg63tDI2kes
         5b9g==
X-Forwarded-Encrypted: i=1; AKwUvByFdcYSrQ+EsERgrj+WPxezDonkJlyxLrXDzkcXA3F8ocHEwXhmCFuDnTMXaUoFTM3ndvmn9Xsy9un3LFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kWSrQA8wJWogaP9Zl4YPZyZwNRQ/PsWkWaJ2lKXxwr6fiR0F4R
	I2CCIuJcfSamtE3WKMl3PCbHi77hK8qjc5SFmV8iL6G1twWqtxdfD3PR
X-Gm-Gg: AYBFou232V1quDcflmkpIlfOK//E6s5Vre+QlWPxi95qJZGgNRV+z92cH09kYMT0dRm
	Y7vqLI0iC+SHe2wAKWcYJIPoQBsUAueDmU93EslKW/uA820xjOx6es7uqePr9tNdBCZYGxGNwtD
	vPTKesNxCsNy9fHQ9iVJl1FtdOffwzriPqbw6zAZtfA8yzJFhO3EGRUdJl1ia15diImbR4+DE+T
	99EN3wS0hEx74E9sd3k7Syw2WnNkuHISy0dJacjVzPW8rOIaOk3dbGiaEOLUnFgGnws6PEgl3l2
	RjQjqIiWfjKk2mIcjW4gaIynX+HvNA3V7OD78SZalBzJ68nIaJ7AShyAu7UVFTPYYOM/q7cckIJ
	1xV+CL+B2jSRw0d77Rc6jTOEHq/KVg99B5LnkQvPh4eEGnwZjJUZWeEUg42tYJ2jl8oAph2sSqs
	qlv2PZkwh/+p1t2SrrzGFvkdHPCAGYz/bsoYyVxvO/PvZpbGDRxZ6I0SsZAE9FH8KRjl5xqbjie
	oqhKUVVjsqi3itiBfSlFJpm
X-Received: by 2002:a05:6a00:1408:b0:852:3726:dfde with SMTP id d2e1a72fcca58-85ed25e2492mr15794500b3a.9.1788440410410;
        Thu, 03 Sep 2026 06:00:10 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7bccsm2980946b3a.10.2026.09.03.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:00:09 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4 1/2] f2fs: complete dropbehind write bios in task context
Date: Thu,  3 Sep 2026 20:59:52 +0800
Message-ID: <c4e69fb1ffd6c6fd968683c690ba29f2b98c9fa8.1788438786.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788438786.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Buffered RWF_DONTCACHE writes invalidate dropbehind folios at writeback
completion. Mark these bios BIO_COMPLETE_IN_TASK so the block layer runs
F2FS completion in task context when needed.

Use the same flag to keep normal and dropbehind folios from merging in the
IPU and OPU paths. Classify the original page-cache folio rather than an
encrypted or compressed replacement folio.

Keep the existing large-ATC completion path unchanged.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 21f396ebe22..b0fedacfd12 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -503,6 +503,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	bio = bio_alloc_bioset(bdev, npages,
 				fio->op | fio->op_flags | f2fs_io_flags(fio),
 				GFP_NOIO, &f2fs_bioset);
+	if (!is_read_io(fio->op) && folio_test_dropbehind(fio->folio))
+		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
 	bio->bi_iter.bi_sector = sector;
 	if (is_read_io(fio->op)) {
 		bio->bi_end_io = f2fs_read_end_io;
@@ -793,6 +795,13 @@ static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 	return bio->bi_bdev == f2fs_target_device(sbi, cur_blkaddr, NULL);
 }
 
+static bool f2fs_bio_dropbehind_mergeable(struct bio *bio,
+					  struct f2fs_io_info *fio)
+{
+	return bio_flagged(bio, BIO_COMPLETE_IN_TASK) ==
+		folio_test_dropbehind(fio->folio);
+}
+
 static bool io_type_is_mergeable(struct f2fs_bio_info *io,
 						struct f2fs_io_info *fio)
 {
@@ -985,8 +994,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 	trace_f2fs_submit_folio_bio(data_folio, fio);
 
-	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
-						fio->new_blkaddr))
+	if (bio &&
+	    (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
+				fio->new_blkaddr) ||
+	     !f2fs_bio_dropbehind_mergeable(bio, fio)))
 		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
 alloc_new:
 	if (!bio) {
@@ -1086,7 +1097,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
 			      fio->new_blkaddr) ||
 	     !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
-				bio_folio->index, fio)))
+				bio_folio->index, fio) ||
+	     !f2fs_bio_dropbehind_mergeable(io->bio, fio)))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
-- 
2.43.0

