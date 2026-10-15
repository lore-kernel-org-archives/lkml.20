Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919333A71A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028065; cv=none; b=jz2WCpoybMJ2qY9uHKvcjyhQhy5sroPYWqZdCANbRdOtlf6NKHteXjaZpEebALo77b1uV2390zqkcvdZN23hD7yleiq5Qw7k/syR3pEnsvT6BPv+5Rujrp2Gg3AH4A68z7v4jNwQfb2N06mPsu84/QsGr7AWupZ0NY6Wj+Bl37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028065; c=relaxed/simple;
	bh=pp2SixJcCNbM9ouP1cQ4wZ06wECMdT8iJOt4pVovses=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlDLsWsjQSYaxbdxdgVTOFxrO+aNAwm6eVxU5ZDXoVMuCLV/C4jjthN5m802YasrgGJ6C8lmQHgMHMWzW4xK8eAUbfcTF4PNBofEAiyCscooXMjLPG1xFdOp1P0df6Qb8Gdi8oRJwDHQBVkvk9fJY0AMDuiZLfh8s8Qe0xf8/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcUu9KLx; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcUu9KLx"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1afdf5196so1612849eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028062; x=1792632862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=XcUu9KLxCjU4p+NWZR8aVHuvo7wr11XN9O36/uMlIYhNWkkedQ7Il7q6kwGrOaxmgK
         5ODrASbmjQCiKIu+PBuVDVXEhulAGV/PdUqUUDesVDEHdrhN4Y4qRXnNg7EZ8OBGIjZc
         yApHALPrJUPW1RSrrN5WUhH/tWFBlpTTOX2/GhVHbngYEQ+hpmGzlVyQ//ENlXJ2NJlY
         7CwpGho3iHkW3Ys1jVSro2ygf15o5SREjwiY/ZbO6chIJK7PT5qetqGDaqmdDKKJmATi
         vocVptOI0e23jV3Av68cnpZG8c0QNOb/jbNn1XnN0pg31Wpg9dtnHyag5NVggW9+n5Dr
         8xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028062; x=1792632862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=tFYGONlXWWvWmrFpHQajNUAs6J+pcJweN/ghj+T6L8jTiTNLPNP43rFNLzCiH67o53
         GklnUDCBtM3AIW8cqCGnCKp06JOgimkv065raMeTeRyYLRqS7WcEx9L1Kdoaz4fowBM1
         +pkmpvglk8S3PceHbgSQiubNg8S7TIXDP7OOwbX7WycAwDObh1bxyZrh22fnR/roJS+W
         iS15ZFE0qvyRMYC3paLUrQQDkuRhfEb3aieL1R73zCoG4KxTymVcMqhPfKYrZWNDP7Iq
         1O25Tovpyj4B24vJSzZV1ZzLQKgYdwWK1wyZay8mvPKU4rEYUYUU/TZX1LSC3tFobzU+
         z79w==
X-Forwarded-Encrypted: i=1; AKwUvBxGf/97Xh5G99QtkIqyxU2Do4OXN6CSAvrS/RGjmqTrHO0XTFvoMvkL5/x78mwK3ohbxzyzk8PkmOyeRug=@vger.kernel.org
X-Gm-Message-State: AFq9FYImQGky7BLcWbleMiF+rcgvpokeocqE1+zDlQBq7Lm/90JL8bo/
	//J8hi6rinX83AP/fdqFgnZBWeDjl4onDeHGedlW5NgO1mdJ5uF7wPOdBmuedtxH
X-Gm-Gg: AYBFou3SPEk92djbkWvZpCOVkmGHiuYXHREAcrbkVDliLzcu558V3LQsY7RBZlKwW58
	RIKYoTb+e7NHrSslJ9spVgI9TIpOhXfp/rfvY+V90cIrlGLk05ak5VscngrVnpc7eCNQAvcWMuH
	GLbiEJmPVJupTRMSLz7r9aN27CGWixji0EFk3zA5l9fOTgqy5LWKMeWYh1N9q9dNqpMS+wMMQ9F
	NFm98kfxsdIq5jclj7z1MiIPbzUlLkgtA9CM9QDUGjex2BlGvHwTIQj3+gc1jFJYAZ5nRFFnaa/
	eDTI9t4mIr+uj8JW8CerqkbzBwqhVIZDS98QlgUfh3G49Expmd2FzFue2JGyrAHTkHxQxujGbgr
	ri6pXyroL8S48Jowi0NgfNoMuq5ywF4T3qPMtsLLi7n7fUdngiV8LFjQL0WGGOMOMAMOzRrYPWr
	yrpYQJIGGydVMFAw+ycFXy4MZMBkcfCrMrUBVdzK+d7FH8A/+yxbx/GozsJKC01dk2c5NqxumP+
	7s8eDHc/DMKHFQJ2+Qd2h0cmWbjWsMd6nhFKrVW2fZ3dXbv1bpcIG3J6+FATaLYEAUr1YC9cUJ0
	qXX+P/IqpSI5Oj+jjROugq1P51hZYceP/N8+Ao2XuolBYMLPPPctG7UGTbjIyzDOlPburH/iyW+
	yqcGHHRbGz2Zwygi8IgfP
X-Received: by 2002:a05:6820:1517:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-6ef1144ff66mr12723501eaf.83.1792028061915;
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:53 -0600
Subject: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 57df88099206..8256982d1d56 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1101,7 +1101,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

