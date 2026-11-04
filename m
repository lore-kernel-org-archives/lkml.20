Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771580;
	b=FVHbrgxskOZbpMdQvqIWVwHmxN7sfiL3jD2Iks5JlaxTIzRvyDcxHF32vs4DJOEZU9Vs
	 nDxzra2OSkMfH1pBSwQ8weY4vu4lFnJAVRDUQru7mQ7SNtoG65Q9Ya0bfYtgcJ7xhKgSb
	 sEA8IenCbKjmMsz00Oqcx+5XXM5FE0KK0HLAu7eg7m5cuSldfRZekVSQA0LsvK2w45V8D
	 rtSRhV0bFt0Bn8cY42YvtfdOAQgbTAXJr07/OF7CqW9uN6wl2l4Yb9S/ZdPPdzumVu0fW
	 rUVvuf/ISmXovFQAVIHZ82HeC7zl0jVVnf18e+gF45LPLNKlJmrYt1jh5XroYqRysOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PWNzAEUlqUhQhzj1FRIC30hWMwZHJiTM9XF80PR/FEc=;
	b=o4zoepT2JyVpABbX7OWqRbTIybLrN8RrhaVHrEVZ1z2N6/Ng4F2WBhweESR0iDhDp2dY
	 oPz4MwlTzFcJHqxqZrifbhdrKANRrV2HX72nqFdN38bGc9LfN/6FQ8f8S13Zkk+kbJfU5
	 no/jEB4Fnpo+I4oi5y4yk/PYxE7v7SoNOctk9VvgdO8ctX8dtiBRmItiA0UV0EEWPbCUI
	 L4aF31BDYZki9RjD57gYZABiTz47zXf1nKUBg4WwT+ApIhNtB/l3YkzrGvmrFqeXPvImY
	 bn7jCvSTdxQRdOriLLq1Pa47OAR8Wf9Z8wxezdrflo6xBgqVDSA3+sjGtmnluub74kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxbuhfQU;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BED606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxbuhfQU
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4932b13c4ccso209495fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771579; x=1794376379; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PWNzAEUlqUhQhzj1FRIC30hWMwZHJiTM9XF80PR/FEc=;
        b=xxbuhfQUoV1S+8Jxi9AkRnY/b3415uK7J3qnOL4ZjVIs+g10pb792ugwXBkR48R/rG
         hm1gevKl+Lly0RT6D8OcHFI/AsgGJeJ18YR3IHqjHalmUkUcuwQA5QwQ6kxLKskhBOpL
         VxDHK6y6PgoqFu+QQsheSd6SOAXWKE5GI+oabp/UsX3YZ9nUFrTN93oIqjlA/JbNiMLD
         g7Kgs9Zq1Lu+2glDWO42yDqMPRGvenZ3ktE1OBLNv4txMyHEUosDZkmkMd96QHNQTdsn
         6sQTam1Ybj9Rq3INus9MffV0Zxyzev8jlqxChdw/SIYLwVtLg9xjoY9RQFmOQN9aXfWy
         nELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771579; x=1794376379;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PWNzAEUlqUhQhzj1FRIC30hWMwZHJiTM9XF80PR/FEc=;
        b=NrtSzfAI/Yrggxihur6W1YXlEmZACgOJ62uZmUWuHaT/BaO3RhUJGGQnZ4cxbWYlZH
         bms3Ey22nGb5z7jCJyDcUkv1xjHObvM386pKECxKiBl9WfezcdIQw/eQ6TSdsY9OlY6x
         utwu7fdDtMQNwoIPltfGwdb7XroAw40W24WoK+Gzd2oZnaTWK+9QqjzkXrmOURVG1gAJ
         6dw0YSDFlgn5RNDdLo5ZNeHB1CszaR70obzln/PJM/KLqLTb4uyJrtVbWFtKX/peYlmg
         1p+25zTEyulpBnpNzz/AE0xS9rTwxFdn1SCNDincVASKa+iluZeweKhJ97Q6DE24rhkV
         PZZA==
X-Forwarded-Encrypted: i=1; AKwUvBy0IiogwCUxMI6g8pdSXRaOkY6xDTb0xW1759ViDqg7gYnRpyrtV6M23niHK5az47Unm/w9GLpGDjxX60o=@vger.kernel.org
X-Gm-Message-State: APuU4Z83qZmtdQUs1i4ps1ug3i++Nt7UGvldaHqRVPNFDO5YjkuRHd2h
	MG4xFaRMrBAynRADSKzDChJjIRfCnXIgCfGW+/YdQ1AzSmtVk9MNxlhU
X-Gm-Gg: AYBFou1v4yxPgn+nkBPAis2eeV7ec9Zx9QIuw41XwlHZVLZhK64P4NEJ41WSIofY3fz
	UeDJ6f2lPI/2hpV0/sj8K+MN/1BdFwSr/P45HHsUBNM93aEDVQ5041nokbhfqx4ysfEa4RaIIf/
	qLy2I72tWeB333TfsDdcBjhWCrXunuwmkAoVW032W19JNo/BzdaD3XI3tmHuHXocifqDza/ZkJ5
	jLVrT/Jwr+9Vu2I0qGeYj+usJv3+QdupfW77lrNSNh6+mBebw8Vp+BJkpAMo1ADtN9LFaW73azl
	Y2IwUlutnA1gNALMYEi1AYLHBy3ZhBpAWi/3/Q4X9IBq/TbE4Vpztv6KK8RF5n35NaV34HhkCEx
	5FJgh0UwyyuHXbuhTRIWxvHKq11YoOSW73DhTALbq3FsXKS3lbMKswxpoxGrgWATcaiVFZac8n+
	hlF7LlDd9qyUifBkiFG5NnAyQxn+8nQ0MyJTIt6oBIeHYipENju45U6rjHa39EgaH2ahbZrvNNa
	g2Z+Zabi8pcawB4owWe2c8jJncfFoQPchF8FtMRDx+ijV1v3jNvgiIW3pWhoabLw3SVhc6IC4zP
	3J1ovMnQQ2PoFL6hzJfSowL0Qdonh1yXtD+qIeSHEtZ7OwA+DTrXrbAw5lE6rIOYe00ycLato+2
	UPv4C5Ysd6uKhN7uK4mJWqa1iWfp5D7dc4Wzi2TZBonffAUozv8GojkCNLAbCoV1ye/ZtqtDIhV
	Ckna1YaNMNX+isnh1JhKFDDPkGx+wwKNsfpT4qaNQXbqAHG5gf+3hf4lRbJhggomHZzu+a+hGS
X-Received: by 2002:a05:6871:3a13:b0:48f:e25f:1dcd with SMTP id 586e51a60fabf-4a9077eed93mr9988226fac.61.1793771578554;
        Tue, 03 Nov 2026 21:52:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd52a6ffcsm1069814fac.1.2026.11.03.21.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:52:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 22:52:39 -0700
Subject: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQrCQAxA4auUrA00UyqDVxEX8xM1glNJplUov
 XtHXb7N91YwVmGDU7eC8iImU2lBhw7SPZQbo+TW4Hp3JOoHtDk+paKGdwklY4wVLYWCrDopLoR
 EfsjeE4/RQWNeylf5/Bbny7+b8eBUvy5s2w4KwM/WhAAAAA==
X-Change-ID: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

create_bbt() returns an error if reading a bad-block marker fails, but
check_create() ignores that result. It can assign version 1 to the
incomplete RAM table and write it to the primary and mirror locations.
Unscanned factory-bad blocks then appear good in the persisted tables.

Propagate the scan failure before changing table versions or writing
either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unchanged.

Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block scan")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..db9d6458af51 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1005,8 +1005,11 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(this, buf, bd, chipsel);
+			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY)) {
+				res = create_bbt(this, buf, bd, chipsel);
+				if (res)
+					return res;
+			}
 
 			td->version[i] = 1;
 			if (md)

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

