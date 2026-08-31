Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDF2E62A9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196731; cv=pass; b=gbm1zBnzSXPgC5YTSEpSTfPfj2VA3G/vQr9QgJbH/RvhroUiSgVSRaxNFIVmJjFpGl8ftTpzPKZE6R98nmrWwjXgmjK7qgc2JApEtU4ng1+Abvp6I2IVfIYM7+qZvPfqG9FJfX5JLnEVSe6ZirLjNujPw68l56xR8QLUnCvc2YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196731; c=relaxed/simple;
	bh=MXFqWr7Uky0TUxYJJ7ciGR+LjTO2h6aLcYNxNAXrW0o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzjYZML1SUNSSutoSR7qMivhLcYbGi+hXPYftNF295IwgZOoiGuo8lFGeUcVaqBGQYRRaIz0TVm+FnuSSPjJsbKYJmPdj9KDGjb3XRMzA9KydADVt0KT2oweKuN3gLvILaLagoLzq6TDBrpa3QbfRDqBm5kknSHrm71P3oAsWnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oT/s+vSb; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oT/s+vSb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so5872077a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788196727; cv=none;
        d=google.com; s=arc-20260327;
        b=lk8JB+sYp926elhZmc0UY1lz6hEd5scflq9ZTT1Ys29Qv9jZvzTWzpBL1c0s09QsTX
         WOG5SHZGnECAIjc60jgWoPyXtSNW4Wj+88Y0qiDNF9fUqZgc3ny2eJm5RZ0jbRS7Tc2O
         oZ7IwCGOHHpOhwElLVxQ9yIaWN33BUvBkmcl5DOaEs4s7+6us0xx8EWBOwU8rIhxUFBE
         EhbVmNB6HDNAxJXXxoJIIfwRzEnFux+KittN2u0ADIgKB02A5bNFQkUwH3F8UQtU3/GV
         NBFnNJ3zkLBkNJulECzPCMq9Q1sNAwAWHIDczAP0aZO3TgFX4qupgOD2qgkAq143tlli
         TtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        fh=EVI2Edo20QQpAQNWnwqSxLNHN0yBsdAq4y4eusD6s9k=;
        b=FTK3F/aONqqFgh/Mvpx25PwGE8aST70RrxmMtqoLCxoFr7DcEukLSj1YZlZIa0SpQX
         ExrU+wcMcJ231Al+dfwzExg/qhcm0Ez2V74hFsm1L77Zv1icvIuJCC/qe3pye1bwfrgr
         MXOto10gJPaQGXYAG2elggxKQdc6vRgXsizaVyXYFvOC5DokMnuzDFZScs/XAkVimp+v
         8vuAvjBlGAVeK/qpwSgDfdKNkCd0WAgINc3qNbIx/47hEwmKWpNwUqfT9yk2mfDUEFHN
         /F59rg6d1FYMLLDU2E+pAVybcbfw6hnRbw95P7vVh8poLfKguhJVhMyhuOnNN7PVEnB4
         f0jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196727; x=1788801527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=oT/s+vSbYUZFV9wsMCYWtZ8n3t/mpC/3PkTJL+ANIPHurj9vPpCvuFytNXDs/fvk79
         +DpnhA8zIBSNbVmsNsF6T/zZgSsMRcEo9OYrqdTIK/NXlpx+YCTkYQHuAPPfw/9lNy63
         8aif5dO6WiAXrionMfWddBxSDzsX5lxnFbj9cyhan/6AUO3KUgL1x2+RAM43Bsn9WBnR
         fmHTsw+sM7rtKjpsj+jmC2Ljk4T65VjMXd6tp0tnmlLHvJvmhhpqjIHgifxyv2oITRlI
         teUA5JJO3KE3H7O+fYpsVd6zIUzx10/6IDAY2davKkR6llvxB06sOlO4qwAD8KmJLkk1
         TLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196727; x=1788801527;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=KSdrUP5K2rK2Wpp8YL/joFzT+Sggp+FJwpCHqR5hcB6Kj8lNCdlVGO3vBx+c6GP9Ed
         L0ZdjVlC5dM6sHCG7ioMBro4W0O0SBaADXqTqRrFE7PvcSOkitvbXEoD3tEjvdPQbRjl
         plLSUAA9ImW32YDAjH0fVIme+8YBZK3rB2LHI9tw6BaKh02jWcNXQFnRTdsl3XKP0xzK
         R4KTLX7Cmjv8Z5EEQwG/YnOrq4o+8usyHFJoVtxe+FpMeBjFSXCtacvuRULIbhj2ep0H
         b5k6xl6xQHG5VcUOaF0rhigGy+PtxbZewUixLFZWKgJNVAjClHgg4SniK5Oilmx8vGhs
         f/7w==
X-Forwarded-Encrypted: i=1; AKwUvBzA9f5b/He5Oqv4IHuj8PRgYWF34/IcPrwNYjQc2GMKRa0pGHUhFH+198OYWp+uwuyBXWycWKUouRrgqFs=@vger.kernel.org
X-Gm-Message-State: AFuF++nXO2+47dPWwRbGb9wUpC1nAL31CpW9D+dA4YefXj9rtLAK8rpA
	NarDqDPj5DC8fUvuBiFAi5q2PIXFk4hB2C2zRgu0u8nIhCOBLRr2YLcvbsiyuBBRtd/6H64JnwP
	sXBAGcEyBrm2zHxIi810k3Syx9L7jJyY=
X-Gm-Gg: AYBFou0SdaZqkSpK9j8oZDt2r1lr6UA9BTQbd1HaQBxNzZkqSXyNkIMToQf1EEhYs8p
	/MTOFP9w4Hh9Cg2Mfkfk67WLfSGgaIeKhA34ULxTayCD8iBrcvQjtGKbUvrZcJG2ePF1Kdy7yc8
	vMHvwx2o6siFs47ZNKH9ICHehX98Jm22IyCPlEV4jj8IFTYfYjERfX947vm7doRxI4rVn8Ns6LW
	ztjZOo76NEB8w3ghmnci/LTmj4NepKNSZfowenSOApBhc8q6jT0jyaKlaW20z1llAXmF0B3EN0U
	HuPAU+jiTiMvABSw8hcCc6hFddW06SpVwZAGM0s/ZNTNPDlBUorgK2F7vzPN8nE2VapAhXsL9Zc
	4H5G7HmBnNnjB
X-Received: by 2002:a05:6402:2483:b0:6a3:8652:a373 with SMTP id
 4fb4d7f45d1cf-6a663a61f85mr2069275a12.3.1788196727393; Mon, 31 Aug 2026
 10:18:47 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 12:18:46 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 12:18:46 -0500
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfH7TPGt-zKXvJRNTgGDZKa1Xoq_sF3-WGs5kdsQLuYn4g@mail.gmail.com>
References: <CAH=xXfH7TPGt-zKXvJRNTgGDZKa1Xoq_sF3-WGs5kdsQLuYn4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 12:18:46 -0500
X-Gm-Features: AcwNN1XECKmKu1GxTPVkn99OW4KkbkvHxEsTNP08mCZaiXBBRgOrQ9k6FodzJbI
Message-ID: <CAH=xXfHU6McbWkYRreT_1=Fh9g+ONkSd8J7TYvqMQtQLboncLQ@mail.gmail.com>
Subject: [PATCH v5 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org, 
	Kelvin Zhang <zhangxp1998@gmail.com>
Content-Type: text/plain; charset="UTF-8"

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
index 253a579e9d5b..2d9f5b77f815 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)
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
@@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)

 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	init_sb_info(sbi);
+
+	/* set a block size */
+	if (!sb_set_blocksize(sb, sbi->blocksize)) {
+		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
+		err = -EINVAL;
+		goto free_sb_buf;
+	}
 	sbi->max_atc_write_bio_size = UINT_MAX;

 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
@@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)
 	if (err)
 		goto free_bio_info;

-	init_sb_info(sbi);
-
 	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
-- 
2.53.0
