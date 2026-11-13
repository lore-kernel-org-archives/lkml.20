Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593739;
	b=aNmSFDLkPgbnZYgwypqkZV4dv6MTJXMUNYxlwtIPtyBM4UO9iKjc7Ka3OdESQibv8uCL
	 hhEueZwj9eQfygF/nrVG/JaKmT34HsZP5i7sWZbrReD/EA6S/hRrq4RB/RoC8TE4DKUm1
	 eTuhHW8c/RLzvYGbeta0P1ZoLyusMRJ6ChV0Ei5WkwAdfT4XqRfxN4PaSp5cdZYYy0oQP
	 f0vnjWRrfzY11PDKGd97JHwzLI0O6ZHzR+Jt0se3jEwA1HCQVjfuIhaT23Cdao4psW4jg
	 T+S2waZNitcK0F2wp32AfQt5zVcSn9Lpj98pii64i+F0/qjrb9mz4r8JZMPAW6KIKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
	b=W2Zmkwg6mBfwP2cfoW4tE/L8nuPycwTa0mQmFO/n4qjeASmIjBNut81PGh/hDLnw5EKw
	 bAQDbKTqtmodSngCFXFLmI06vXGLoyMU2eOo8PxO16DmH6fLpXe05jnN/jAfR6fZSgcGX
	 wWQoWeMjizeN9awK7hgHGBFNEROAEY2p+0RqLYg003Vas/hUqvzbnKQt7B6Pof8Ls4qYy
	 b+TpPDJ0FM6EpTAfd7MaDNjlpTdPmwsr4HSavOdER0E89nm//La373wfu8gWyPPGeMIjt
	 JG/vA3cqDSP0Nfhs36vxxuioRv7EEZOa4S6aDghM+F38sLFEzPmhOUAwXWin2vEL8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+9Jf0Q6;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005C607E844
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4005C607E844
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+9Jf0Q6
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8241a56cd70so1486519a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593738; x=1795198538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=Z+9Jf0Q64U2uVQ70ngQ9bStJVkjyCQ16upOInBpI3E/eOMWwU2HGt5Zzjy7sywJb5A
         K8rYte5NOSSabKBMY+FDqzZXRq3Lsz/pmYEXVrhWrKEmeDM1K6thr/r8rzirb3kOZ9R0
         czgwKgSxLGsr/zJCVIsUH6d8Ud1aD7XGcHixGjkk6PEUbjmh0SNTf/YoT/IOwus7BJKU
         jnGPWIgsjSU16XzT9FE6N4u09MEluiQKoxyEzhC+zuL66xPPWJFoJpjhbIXt+pNWN3Yp
         5sZW/xNq7Y3QN7sUBSqlTqYC+1uK2umPiNIHnjagazzfok+OYnBxfo7C3vq3Bpv4yJUv
         10Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593738; x=1795198538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=axFJCFdbaeKa9oZtSFgWxiUJzpbP7I6rE3shQRj3rcuR0H8/EnK3kQDRvxJV01kkCw
         iNUI7EmBfdFU0uFEPceCWDeZOgSGd7bPvtCpy8zt3VOafjrU0/i9yY4YUSyTjinzOBLN
         QiF+XYbXCRw5konh4jY3u0YCtxx3Ib/c6MmVYqpiFr7Pgqzo9mgkNFn6Yy8UgTTxtnkc
         JzFifHOHL0aQbvbOH9pvMMU44bYE2FD1s5iyiFuIDHKvCxhuJM2oC14M4x5LDDqPuckA
         1ueqyv0T0ytLwLu59Tn9aOOur+JDt/dGjnSplbP+NK/BFXMT6XqJE5fV6xkuN9q5Ixr6
         5liQ==
X-Forwarded-Encrypted: i=1; AL+hErHeWEqVF/M/UlcsrGbsgPek+1vsvsycUNAXYlAqCh1gwYVpweQOqHkJL8OkDyLe0rydjD8ZjJdqbZwy1VE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TMX/W0sBfQD0LolCUkm+6RWONUx4JbsEgAaL0dx2L2fdp5IdA
	u0Y1Cmhkdow5RHo2IxKTb7be9CTD9k907WR0BWsSIxoI6V530hd92AnuvcAETpjo
X-Gm-Gg: AYBFou1LiwDkB7Ix7pE8P9CktWPHQaAyBFQLAIKFYvsBQwG8brb7/rcN+bnlT7d6s6D
	XbxWEiv72Md8eWb1eOI4/4H5n/DsiSZA+1ebQCRUtzMD9oJ7/QzVAEKy6pzPbsZy0WSpM166E0M
	tRytlAZPENXetlPnE0og8Mv78c966EP5FkW2M5H8bGIxAZN1bWTgYAjHoRQjDOiET+Fb6fOIh4u
	hFn55qqXalmeVzl5NTsuyMlMhnQ09aw3O5XbuhnYWP8Kxe8mHZkIPsleCIBcQN+3GPDlIf8XzPE
	OMzZ5dZVtM9qL1fSJxX9yB5tjMFDlBUc6fr06jtC65G4aOztGzk6RWUc9GOzRTOprZwQg3riInR
	folZU9izaUH7bBuoUo83P1WHG/Bqs/N2CQgcvFtrXLg9tz0x3J/pmNZaffoP/pA9FvWSRxcAnVl
	CGWubTxi/QejzjtI7txUbLp+miIkVs29WiAUOba+E6PK36zSOk2dfMoszApAuRE4LofZmAVOI/6
	xedqQvM0D+0+odWong4yVfp0CSK30zT+cWSaDWEbR5a3qYXaILrfi+Rt8E9f2HcETvnyGQg04+m
	Ko/kHigFuzUzaukCibLLELHED9hZZ0L4iemr5bEIxQyYUXFB0jN8CaynZ3C+oWiM4za6fbbpG0X
	7BIgP1rMUO3lBhlHWx4NhBfXvuI31/a1BPxgfgeShsAwAw1N/azGlqqCL6Bv/oj7fWfsXrLSJWZ
	Nt9XcFWw+Q+EUJxxvDVYyuglj951dRyMulw+czcRLjMmvAoqovj9vBBta4mc2BJfsafCqhTCmP
X-Received: by 2002:a05:6830:6815:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-86289779881mr3048117a34.4.1794593738254;
        Fri, 13 Nov 2026 10:15:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:35 -0700
Subject: [PATCH v4 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-19-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

