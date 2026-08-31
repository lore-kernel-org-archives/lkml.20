Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46FB3AF66E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195737; cv=pass; b=HkHyzHszJ1+VqdOsgI6NZWb+2xgzY+qlrMq81J13Gc/x0PbGegLuGU1tTdcMhdh216IUO6B9WXQRnSdzyPbPtznEwhmdCg25ORWt+Fq1Iwa5j1liDT4fZEQgP4CLNlC6oH/vcBPYd4hA+fnCzxo2cmGGtE2zluDZwKzKaWTtRD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195737; c=relaxed/simple;
	bh=MXFqWr7Uky0TUxYJJ7ciGR+LjTO2h6aLcYNxNAXrW0o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOnwtha0vN3DKN46zVUXqvl3tzl+D8PVL4n+RYCiV1ur6+1ZW9wlK03DR163wb5pqgUa6TEuTKkV7fRH02P6kk113noVaP0Xk9UPBkrqulUkRvraT7VUSdeUOeTKwlBFX1B04n47XcAKZFnoihUEZxOWuTCx2TvB2B2YAticbZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJwU6SwL; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJwU6SwL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a6165b4402so4951597a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195734; cv=none;
        d=google.com; s=arc-20260327;
        b=fu9xUm4L4zN/i0dpXyeaoXnVpue7x1OfzMcTI1o+nEe1WDkBBLBQ8ccwKeDPLvG0Hr
         ZgiQpXL9gNTXUc2fnlVIV6O9tT0b6Z95/ptyY7aNYnuEVCdS5cOoDq7r1barAWcsl4eH
         Z/O2vUt9u89Mg6WAKPL6cjKbTZ+kuVU2IkzuEHl8SJA1rj0vb70EYGY8m30ad847S0z6
         4GHUGMFqO7RaNxGY8lD9Pte8iLlvI0hbPZuLo5S7G8WlBWrxIEEJmmqs8Dzjm0Rn9BUX
         5zdjyPee26NxzPhoxrjqiMQuyEb2Tr4IduqgOOFxBzGKVfSPeK2tCQJUUXgGXOHdfTFg
         8wIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        fh=WmxGCwwc1UxjwjhsNeViMugX3mmK6DIxQvkCXxvVusQ=;
        b=q9/MfwTTb8y/qy4dRKxAyOZS21MktscrN40qKh1TNNfd1galfn4zCQJEIYOQ9DnifP
         oywWwREnJ612ESs/edQcN4VKPq9ZLoCoHVo3lLWlrXX6e8D7Cfuakm/hYpJ4HsISBJ8q
         Z12HgFe/4Ns/bEHan94G9uR5GAs/k+RvJcpCiRaau6ptgV7C4YrFXpJPAj8cSaTgcrCb
         UXnNp8uFrwrSiqy/t44Tdsh2bM9tDCmHevE8FSyL5YvGj+iw1XLr1p4VHSpiCwFVoy9X
         ClHgnE8N9NAg2CIL9HZIf8x5XLxpsiMsr16ajey6NrxGlcralIudaCjR2GvwK/VCTR3p
         baGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195734; x=1788800534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=KJwU6SwLWh01cM0Mo5hp2zQAqOCAL9YLke1M0RSWeV1U+fW5xDgYhBF3LF2RH1RD5c
         uMTCj8VLJy3onTryZVYCcJqARpFoZB2X9QuP/uCvj1SozaifjUNLExk7cWEy5LbQguRC
         c0vOjKdC3a+sk78FaBaDnfjcDh/J2Nn9bt7AZInA9cVEaM6FjGiZJbdTcf4TX3mx1zpv
         FMeUTiNUeqc5bDnU+HM+a7wIyAiAxg7YFrcORn90tR9sqwJQiQBYJwa6ynTBYpjln4xF
         E1TmUWsvWyBKmfl5IqpGUcrIIpzby/rual9psIsXZ+dHCsWWAcjfoyD5MoS8ji0Scu0v
         AuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195734; x=1788800534;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=OEByZpWcmkIq8K0yGEZ75JxvYaYlfR6AeMc2lVxiim3PPK/RfywZbnFT+kVRs5ENVA
         /0BzdkNLj5faCdUbZKA4PHTqwNv+Df1Q3/gW1mYqOM2PrXhbjwcuu9t67EAWFrcMBT6a
         KCh8WkvL1WwPAOZAHrRzmzbW36dI+3Pwa8xwBChvov+vn8ekfoZnHOtXpLa21ZdRuRR8
         HroJEddaec1I2bTJUM4T/BmhbTPj/f+AHWXiSFOPVJGiBvHsCco9IhMMiSulVXRcMPf2
         EDQQy27YNyxlcENAEKEphbke/Zk/wlS71GQqg79/UvodVTraeU/yumYCsSoBTMTZ6lBV
         0SCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlMdQviG6kzHRuwQr9FWF4Dh1VbaVYQy5VRYEL4sIle0vdS2kTTePsF1sYZ5Wwo+LCxQUo468LIU787KQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mMSGXSAObOzhIg6uCprE8r0O/INphbw3OE46U3noVc/4cr0cs9
	b9WLuPlMXKFTWKINBkrVgp1RGIX/H3nSoW26q8utyd4Ayoq2KXyJaOoJBb5P7/j7WFUX45hqJnS
	PqIX6pdT2jn8LD4k8BDSK6tHTl6wqvMk=
X-Gm-Gg: AYBFou33jWP6ipSi9VilH69mjax0SDUpl/f8Y6sb0K3f2FzMf1qfLDYhwYZ/+RR7OXu
	HJ8Wg1fWsxywAKeWirWKCMXCUlS1wcO5iNa0xApJmptAYh5XA/QvutiNheHHwLge7O2lVM2Zo4C
	Ex32d7X7z4wo3QjIWDmCN4MUkadI0BTKarfluUIZNY5m8E1vyN0uTWMMQW+/907U/oNEl+jSv7s
	f5pG2M9cN50cA6usHdLsIbSAN2XZOh3+3Rq16ONjAF1Tt6Zy/OPtKwWy88DvclnaNnNwUCpt+td
	tuEUUwISvgjYMKfrxDcjQ0Q+I0FuurUN0K9wAoRHQCbG3F68xkX0azVPVikFXwCc1gI00oCVf9D
	wNA==
X-Received: by 2002:a05:6402:4250:20b0:6a6:306c:cceb with SMTP id
 4fb4d7f45d1cf-6a6306ccdc1mr7105653a12.12.1788195733806; Mon, 31 Aug 2026
 10:02:13 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:02:13 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:02:13 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
References: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:02:13 +0200
X-Gm-Features: AcwNN1X8t1JEq-gZM1vhFRWNWq1n-hqHETCF6GLSN__SLPSb1BiXeydxC8Mk9Yo
Message-ID: <CAH=xXfH+7+D9gkVnYyxxJOscCuE2BqKvptqJwsCmUi-AwACw6A@mail.gmail.com>
Subject: [PATCH v4 01/11] f2fs: initialize sb_info early in f2fs_fill_super
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
