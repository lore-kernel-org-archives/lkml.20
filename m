Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8436896D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479662; cv=none; b=G9JPE+BRcgom+JTjY0E7F82jMeutDxKsdtMxKoZjU0DZFMg72wX+1qg3BhQixWgnv3DPMuHTSdM1aEQHrvEIcnpsVq1oYFhZESiEj3kw1NbvQjgJEel+MvxPZqwCoBioTJ4BEP8O9hAnMa+OyXyYVMIzol+2jDSAluYuiUY8wSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479662; c=relaxed/simple;
	bh=ZADxnoT0j0p10TKrdx9DXbb6iuHuK7Yn9OIArtJq6RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfcbFVfL+qHbSGFJpFnoTg6SOVDjDM18VAOjgkh50AggMEPccya8WtM+4eSA24Lg0I9/QFRGtIoyzhS4bxnm8VV7Fd8CVmdp+iSiSIivGlMPdsPAsFeSVl19W0zvVNeqBnjp1mmayWHYGnKyp2E6c6vdT5RccElCHJmWYorng3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1pR1F6g; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1pR1F6g"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so476928a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479660; x=1789084460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEnmAlX/LH/SeLgbqUjIwUEnaiBZCUaJcuwBR8UE3MI=;
        b=c1pR1F6geQeTzVBBbDWhrY31n7MXZX1nCcmfOsGeZzlPHrRLFzWzuh54KND1Y5WnED
         kCB1H3l2qinrf1ZM/Jm2ys1SQyAbezjJSw8ZnGGS5yTM53hGAl7hiKIsAqL0olm2hxPC
         KReXZsrLjJz4uXowxmDMKyRvU6eRgQ5tCxCo0oavk78Ggs9/jql2I14ZwlsDs9p6dAI/
         k5Hc8S6zK4jHDC2nmEA+KoUC9VmTu9U0FD6UEPcUKPwnqH7t2/HlPISWuiYySQUJrbai
         IFyEc4Yf6Loc0/qzR2UEiN3YW1f8sDMMGcxtUx+wgu8UgtI32rCie2pIcZPFfzm087h8
         54RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479660; x=1789084460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEnmAlX/LH/SeLgbqUjIwUEnaiBZCUaJcuwBR8UE3MI=;
        b=mWOxDSwWJC5lLUWrmLJ8iz4Tuk6CA9RzaMcXVVm27NYfO0meY/TXLZFM40T/9KyLNb
         IdY1+mU8r6Rh0bXJsxwtgE2UBEGWVs3hK1qpA3lhfYPglWU/pTomcdtyiDAi5ORuTZpw
         hjBx12F6IgOdbjTDGxi9Dw6egscH8SjlR0tJba0yDtQfbqWtnVoCBfRfBNEs0eASbGvF
         8scoazAtP7vGEtZABIUfuSI/iRIzoajq15rLVD0kHLa11bXnKSNfCBYPvu8Z8E+O3N+j
         ffpPiJhw9pQTCTWbCQJAtDOs2IY5iEo1uQBBYYCWuZzXroc2LhN2GqEHRD/bAGCLHPAB
         69kA==
X-Forwarded-Encrypted: i=1; AKwUvBytxNnV0Ar57l042yRufQRUkDuUxsamqQkLvq3kph/X/6gkGHLJk111XZ9l4UHoA4G6Ub2tMX717H4PJ/c=@vger.kernel.org
X-Gm-Message-State: AFuF++l//+z9byi4OlviGEoh5zqP2QB7HGVLQ2NW+gmZ2pfMGzp0/Ri6
	m0GKi0pWPSbLjSzyZrUjalKHWqLMaPEQaIjDdNY3khxDmmPNFEBX+krU
X-Gm-Gg: AYBFou0CvcEO2Z243JHNvzmt4AfkJ0ZXxklb25q7Ot4+cLS84LyQ+AIWy2UAS9uow5P
	Kw9Pc54sNhX98my98j4q+43o72FC3oSGa+b5MDBbpDeY9QC+vDH4KJkD4ehWH6OiJ5ULwlV4zMG
	QzYi2wbbnzk6WFD2p8POs5/bTgfp+Nc6dmcScZK9FFmbOFaH2CjTddQDDg2zE+fw+zutJUCKqMU
	3rV5QjffXv7Zn5nAO6l36oqxQDS+tIoH6SPCyd2b0moE/gMj/PMNVCCbJpuj46YPX8Qq8NytgUV
	o+kVJPDm9mNlzdPMITftv+3ESEFaUo6O1OHKLh/EuJWJMeQ7Am/sHfUwnI+90V4GS0wYCpTooR3
	JsDSDIs1qcdSv0idkFo606HT/oiXlZrmIUoWdtYykC4h06OtRMCYDpFEXxDz2XmqpjzKMqiJdT5
	UL7XngYMkIlTAn0pufcoaPesmwBfkDeyjUf4GcilMn2GwSODFQnZv2/QW8tEZNYydmCXqac7+KF
	K3q
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39b2623abfemr2881705a91.21.1788479660384;
        Thu, 03 Sep 2026 16:54:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm3699926c88.2.2026.09.03.16.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:54:20 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/11] f2fs: initialize sb_info early in f2fs_fill_super
Date: Thu,  3 Sep 2026 16:54:17 -0700
Message-ID: <41898b6a3cc76d464d6d1d8774daae6c185e88b3.1788479509.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
References: <cover.1788479509.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
processing superblock error tracking, mount options, and sb->s_maxbytes.

However, read_raw_super_block() reads the superblock folio directly
from the block device mapping using folio page offsets. This makes the
initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.

Move init_sb_info() to execute immediately after sbi->raw_super is
attached, allowing the block device block size to be set dynamically via
sb_set_blocksize(sb, sbi->blocksize).

This early initialization also prepares for upcoming patches that add
dynamically computed filesystem geometry fields, such as
sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
fields are required by earlier initialization steps, including mount option
consistency checks and sb->s_maxbytes computation.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/super.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1314b6ccced9..eda8dd8f4eb0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* set a block size */
-	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
-		f2fs_err(sbi, "unable to set blocksize");
-		goto free_sbi;
-	}
-
 	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
 								&recovery);
 	if (err)
@@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	init_sb_info(sbi);
+
+	/* set a block size */
+	if (unlikely(!sb_set_blocksize(sb, sbi->blocksize))) {
+		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
+		err = -EINVAL;
+		goto free_sb_buf;
+	}
 	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
@@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_bio_info;
 
-	init_sb_info(sbi);
-
 	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
-- 
2.53.0

