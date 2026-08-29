Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D126ED4F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787975988; cv=none; b=E5PkPMddlPgtK69osKIhJFRp5qVMp+KS4oeKZObuJCGhxhnwOzAsFHwHmYdbCJwWtHguAAQebJ34k+Ztghst5d8ga1yniujZXm83zHEGUojp27soMxvtiCIOCd0wBAP5z0IoiGTf2tTQCSJA9TGRcH5z4NQeLowjQ2IhJg1CVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787975988; c=relaxed/simple;
	bh=rzJtIdLT8UA8L588NMG94kUUnaCb9UBM2MX+0o46NKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V1iJaq8qZdMA+l1tO3jJyF2YTCIsNYV/ez/S3i4Gqus6TkXzLVZdx1b3gT1SFFkJsISyue6imkH11ZXIyjVCDY5zvz4hJjafC0ppkLanZOKd8bupOvdp3R9ua8zy3p6zBqiBSfofHzQYsKQTaUAD54c5GSy24Og25+sk3NYoIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHV+VNBG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHV+VNBG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so15723475e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787975984; x=1788580784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUlNGUgQY5khe/spcmDkrmv1B33pEeDXrJ5iK2i5+wc=;
        b=eHV+VNBG3Zs9Eng7apvvCq2tCRnC5t0Xp/UY89sAn5Jdllbu9JWkhQK8CGIJca4Dtw
         mBPBzp4DgunQhS3JL2W5g8KBtzPk3M++NmTRQcLud7AdHtQ7ebLjRBJ/E1lB7fQRFJWO
         Aj+umnyB6EWc9uVObEGHVEZqZseAlcNZx6Jft7NDQetLStI6o9ptDD+I6106aeo3V5xZ
         FPDMizYiYKeWAzwJoRoOY5HRsET9E/zbaVxhyWtjBhOzfZ4CICzEC9R+KOiDBuE4S9xE
         YA9/ClqQ0MAT+Uliw3vjgYrBP+LA7ImIS1039+/SF6mDIW+FkOazB7XS+0otTY/x3CtD
         IzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787975984; x=1788580784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUlNGUgQY5khe/spcmDkrmv1B33pEeDXrJ5iK2i5+wc=;
        b=k4JTuTICzO54BDm+OMGY658TIdgqJ2/0XJcGrFH3sHxpAq2ey3WgaEqAjF65Zus0gr
         SYP6ey9DPp9JXruv25JylLffB7s6ZGrxiTjpbw/H8iCvZKhTv5XmUlFY5z+defSimZAu
         zC7w46+ouF09tdUEJPx2aJ8p5B2z3NP4cPd1WOvhUQwV7qXLmmZMGWeAeJ61Rt091I/4
         5G9yrBYRcOkZOsXZjRsD/aN+/+Ryucfr/ByNfOxn0SigrzEr7Z3qnh8fYUXodPnIBKyj
         9yAkHjAQZl2E61rMO47FZhf1vjUxtaSD2U0myFs56IwEbW/nfYE6yhRG11LP/uFAZXMn
         DO3A==
X-Forwarded-Encrypted: i=1; AHgh+RpT90asvjvqzc8xjoxsAerrtvzvLduEJcVVUfVX8iF5AgcBJS87Pmm/yhmkYtHpB2oIE5oIKtoCO1g5rVM=@vger.kernel.org
X-Gm-Message-State: AFuF++mscBzyqEpZCm0w9IyBlfSiUipcTUawJQ7Z8hpbVH+E3OmImdjs
	D1SJK2Q5cd+vf4BVrdl3aWTt1YEjie685EII7/13mYbsnBLoyqjyrdLC
X-Gm-Gg: AR+sD12BULIr3p3ea3p4xTds7TH4P4z8Z7wOLYzKUKQ1qcq8U2cMToTpyQMsU2cp8E+
	6TkaOROG8k4qoU5iD+52gXQb264JyVG0neYAB9HMvi6pQ/wWCJqyLvJEslx2oLDkF1ScCInbp1J
	HhFfYdYQinjLSuIs8iUxSnD1rH74Yov/1pcbigtDtbhe70S8QarQSe87GekBej1apV5GngThH3c
	UhyzBlNT2f/+ukiSIGfxGFo5TlCF7EtGsEmR4LvkBcBJKetJLd8mBNdxIVa5yN54v+enH/r59WE
	AB6XjXA1bTtLIoXf7PKfzqfehK+ugJ97r9OMK154Sm2bTltNmi3nyYIqNmUzuoB+SzJddpQzkbn
	5f0NlkEq1avo+RTLrfy/7YZivlO3hwDtKggLBHY+5kj6o13lr1gKH6FpRfAkRpAFY2uhxIGTyig
	srk8D8hTtnf/mb3kfG9c3DYrL3MOlYQpUSNQcWWhbPsEd6NoySFxHuXnPb5Rw0q9W+iyy6FMK61
	r2uGKZHowIldN+Y3OYLaFOc/No8+qvoB+XF6ETeoqOdpFX0W2mj1W55pDdPlH+8BmcU4ihrrPQK
	Sobpe0bNiqCXZJvP18bX
X-Received: by 2002:a05:600c:1c0a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49b91c1dd3fmr176903705e9.1.1787975983850;
        Fri, 28 Aug 2026 20:59:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm100738355e9.7.2026.08.28.20.59.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 20:59:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pramod Gurav <pramod.gurav@smartplayin.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-tdes - zero-initialize device state
Date: Sat, 29 Aug 2026 05:58:21 +0200
Message-Id: <20260829035821.67220-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of
kzalloc") accidentally replaced kzalloc() with devm_kmalloc(), so the
device state is no longer zeroed.

atmel_tdes_hw_init() tests dd->flags during probe: a stale TDES_FLAGS_INIT
skips the hardware reset, and a stale TDES_FLAGS_BUSY makes
atmel_tdes_handle_queue() treat the engine as permanently busy, leaving
every request queued and never dispatched.

Seen on a SAM9X75 Curiosity: the first TDES request after boot never
completes and the TDES interrupt count stays at zero, while the AES and
SHA engines on the same SoC work normally.

Switch to devm_kzalloc(), matching the Atmel AES and SHA drivers.

Fixes: c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of kzalloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/crypto/atmel-tdes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index ffea1db74651..2756dab3f4c7 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -933,7 +933,7 @@ static int atmel_tdes_probe(struct platform_device *pdev)
 	struct resource *tdes_res;
 	int err;
 
-	tdes_dd = devm_kmalloc(&pdev->dev, sizeof(*tdes_dd), GFP_KERNEL);
+	tdes_dd = devm_kzalloc(&pdev->dev, sizeof(*tdes_dd), GFP_KERNEL);
 	if (!tdes_dd)
 		return -ENOMEM;
 
-- 
2.39.5 (Apple Git-154)

