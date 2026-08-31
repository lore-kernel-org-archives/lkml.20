Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B73282F06
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154378; cv=pass; b=KY1kutGUGfFF1rfFQJnNnzWLBCJpMXlvsMGn0EJxfLfujISzGsLUx6Cd6bBST4ASoHur8ZOF+pUO+XN2QeEPb+/GYG0cp/Z2FB4V7R6AUou4d0rb1/EkrY4qyPyFQT+Ivp0Wx/Yz8cIXy9ADZVdFYzv796o2ZtAScg+XmnE8RMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154378; c=relaxed/simple;
	bh=MXFqWr7Uky0TUxYJJ7ciGR+LjTO2h6aLcYNxNAXrW0o=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbGiAB3V/wTggasbPJhetv9O6+gWNyFjThJnCjQ05q84vyGsgcGWMIFyw8Kvc0EB0SMwikvQDtHZZ6mzhxEFngbNHNY6KkD4ZlcfjsF3nqLY/5ELnTp89uKjRqpN5/SjztFAjvNfyZe+fcn3R+hLnbR1D2UZNPLuTQ/nx2c6v8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzAvsw/7; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzAvsw/7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so6640814a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788154375; cv=none;
        d=google.com; s=arc-20260327;
        b=VJ0t5hk3Hb7j7gAUzV6sZBJiEqkeFYoy+9BPNPYnClAYTGp+w+aCPqVlEAGPHoS2m8
         CtYs+gggWT/duCusJGWvfiE/s1dUixRieWtss/l/tdpfzH423YnZCIpMyCKJKlnZdIJP
         +q36cDZYeQiHGmDOGrAwUSPjsXToQPmFF2jyqqGRyoBUagkVaqYiCdhvoiv/GajoP/bg
         NwNxqK1oR1U/8spaKLKa5+0S/3VE8/6ApPhAQx88Z2njcwhqCTcUbDUirEDdO2zdXKAr
         +snjZ61CImtS3LrhV5U4ENSM6Z8lVff8E9m1ukuX3Gcq/pFbNTWjehwhQWFGzuOvFlEW
         v5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        fh=POU6SzYe5CWeIgr8em/2wmPwP8Zmg3EF8OLaDPR1u70=;
        b=W0x/dr6x23YMkc9ShGKBUrUcI2Svn+UqPvVcZc9RiIq+VcmMc5FCbc4RKZ8nloqOjl
         xV+jDqiCAhD58cTu+hFp+ZOHtCF1R5OyUYl/obbmhlD3Im62S/noZoOwxRvHiAwQximT
         ckzSWMCLins1pj+Wu1DgYNaVMit9I/ti2b7TT8pcYSqSaFhYHjIvYOIg8NLZh0xaMXtt
         MlWNvC6ufA3RG9ovtSvQbpJGuTh+5EaQrTEB3U4OSdklteLwXDDkMrxRaYzO6qVxCdHH
         OxH6glpNqf4xJFymckjqV5XH/DspuPc3KPfH5xEU9mTy+3iurlpzsWdmlJZS7OoH7A9v
         AEPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154375; x=1788759175; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=qzAvsw/7T6rauOmg/zDJBs8WNQpn5vFlV4s+PciRyKYyKuLpja6SvBphhYNt0eOt4O
         GmR8AmzGkcuaW8ztvMyrt6DXfD+e13PLCrmRVRDaw9iwuAcL5GWQPd+/2fkcmayHWw/u
         Qa8yftm1mpcuHeBiBNalXDpYOJwYWk+O0JM1uYxvvWIgq1cksraeRcJdWq31qGVljh7d
         X4Qa+TiVamOO8CYKIgFEuCyqs0Mk+W85WAP612mkKpqRenGXxYvfHgcFQrhZ1FE/7+dp
         H7ly7yM1lIXzmk0aT7jXcnNZQTcdnsGFSqzSoHKJTikyFl8M/T4TFx9XhIQBGmHLGohN
         Dnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154375; x=1788759175;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=PV0zwDQl7EdBPX3xJBf2o0akjJgjvFeuqi6Cq1P2HIxZ2EBFBDBr2uoFsWwPqdt976
         Y7grlJLWHAhHN6XgfExOevrVtg0Ax9H2YAnus+z+KxH2R5dbSvMRfAyTMKv/1Ya8tj7W
         otmWuHJ2YXzyr2T1ecr+310/Kw/UzsCIibEVU5yNFXyxRE8eWfyDFj+99/R+jDG4S9ku
         ATrwHxTN8ZfLqCsZKAmjFq40BrqnsYdQjEDshRZVIj5eb/EXar0Zy8xV+6/3I4gsYlKA
         F/q7ZQI7lriPSzK42FV7aB9TTRx9u+L/JMkdfw3RQRf1FpOAOiH3xlcGx+BH6kGwG2di
         rEzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2E9rFignaVlYna75bsJCXGn8rgmmNR1aHTjhh481sakCcvRkDpTJUGaI0kum7E170zV/WEuqRDtMrCwI=@vger.kernel.org
X-Gm-Message-State: AFuF++kUlXSQWjjuMuPPkNP35tRAbSjd7EgZuoAcomLkFRPtHQ9bmdd0
	JY7x6+oaUMuBbkqihZLy0a9Av87qC5inGH3rDDRn2tYlCHQU9qbqyj2VY8+/Bn6nl1kMBgy9bZ1
	hKYoaWTKryaR2nfDjIVlFLYHk81WK/3A=
X-Gm-Gg: AYBFou3cVw16LWFKY55pjJtf8jWMg5bwovds2NT7RkYzbxj3OHuG2mPqqJaVOx5FhiL
	Lfz6K+RUYhd/qlXuvOd32YXXm4BjuLeNW0K7BaD7wg0jrEH6E9Ch8Dg/VHA+/W817ufbITbToZS
	p/V8/pyHTMusTXr5ybpj9HeicYnI04g3pldFKks7WjBm0Ye8BWySobj2AvZfh8SouASacIL/fwL
	cY/fSUQvbC7G2A54zUHpCo8FE4PZpFRy+ih8y0JMPICfw1plbv/BzuCDKDGlBvuw20WoqGGdGvk
	zOfFyvb4wuynngLL+RqyepMQYQYARnM1bEnSTlthONVXt7WatxCN3KY9BqNCtYQJmsIQHSscGYU
	llg==
X-Received: by 2002:a05:6402:20cd:b0:6a0:a46b:ad3c with SMTP id
 4fb4d7f45d1cf-6a647693f75mr3043988a12.1.1788154375170; Sun, 30 Aug 2026
 22:32:55 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:32:54 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:32:54 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
Date: Mon, 31 Aug 2026 07:32:54 +0200
X-Gm-Features: AcwNN1W8uweP2JBSMGV-7BI3xN00j4I-usGHDHDv_RvI16_JsR6crt1gVAKyW-I
Message-ID: <CAH=xXfHL4bWFMVa=-a8sRuR_bn9VcaFRo+X3eeZfedSa0C7dww@mail.gmail.com>
Subject: [PATCH v3 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
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
