Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171713;
	b=Xdej7oXXiiNzlL11y0m7EAIQ0IX+3aFe5vS+zk5jBYx8sFgw5F33zKzg2QQNw44vY8hP
	 HmWE75tDL0BoKbFcCVEw28pSAjz+GoFbTaM/J6ZtndhujCpKfnSIo+NqN1muiqgOM84bn
	 ffXfg9giiblzOw/t8DAbk9kG3rEoGhnYQmOzBIjlu02yvOuaAJxwqHkXQ3dup7rwu/Tov
	 S6JzR/Y7U0LTjOnHWAdCB4eAEfNfzsEiLxnh7lgJ0GcgbmggNT5ZGM7gFVM2GU+tCIzjC
	 dze+ZZSJ7zKYL4ucqYjEfEjf5ePcfF8nKN2n4rvEuaBJ6rxbY44gYXXxBdgFQykchrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xzZ92AGYO1/PLurTCQdhrPzW6aHFVPEii/Y+wkIOdWo=;
	b=BrKo8SqbRDD2ZWm0D8uOF08yqsJkufGwmmvAODgeT3xqStSe2JJWP48H5DpT24fy7hp3
	 kMxg55S7OC3ZvvNFLbU8GkqnTqErP5AgZLkmo6iB7HdXtUm3UOx0ISrp917GQbpaMMtsy
	 13dDdj6mglxb1dBQ6G2cvnL0A7ZFvRwOGqYVzw5SP40SsxqZ2tgUfX87ZWsMYsTipqkV3
	 VNIoZITvY+b2UXgNWa3q0sfsT7uocdwW1Rbi+7xQcHqpBaTA/r3Cc4ODuuFjPuet34u97
	 bV9q9TIGkjEMSJpkvF6JsqDOIR38BGgybcyyF7bt4y3ZLsOEv7bRjE8VgNg1Bqoo+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAI8YDyV;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57017606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57017606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAI8YDyV
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-486f013db83so70984fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171712; x=1794776512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xzZ92AGYO1/PLurTCQdhrPzW6aHFVPEii/Y+wkIOdWo=;
        b=GAI8YDyV/GYaVX0jyn1/XXjuYWTKmzesrnE9NA4oVePo8YEAA4DkCleel3M5fLz5He
         8PGzIZqdATBFS1N4uWQOusndBRUPaYJazzenma64Bow2XBPtNOguq9zH1CFrqRGXRjLF
         nijkWkoIRuzyhg3u2OO+sYB7twgKGeob2gjq/yddfU+nU0vxrjn/TgB8qhbtOPeGYxCQ
         7hTWTKa8I+DYQWwKC0COzJ7cBYy+TPYTWYMNQPZNrqmfmhbH9KXIPnk0DnhZ77xAxFVn
         MbNvQm3Ds1bBzhbuq1MBYu30mZbL4IuFwDsGXOrmQiz4OttoYtoVsBbFO36L/ZdPGd70
         vnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171712; x=1794776512;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xzZ92AGYO1/PLurTCQdhrPzW6aHFVPEii/Y+wkIOdWo=;
        b=BvST+SljJzCTIRuxkrUTETH3Pec3EVqhj9Auw64iKOLCOFT5RZpvyVPsaalunq+1c1
         /9YrE7vmG1Kb6bhPBlw2KYoTZ24Hb8GV0JIwetGSzRg6ir708naG9IfNykKUFG8IyMDm
         oFJG+Upiido8GOfgE/FDIgRitg6U1c/Iz9114LuJ0KTz36FAzfat9j09FHfpGo+g4UIe
         oMrs2ZqcIJQXtULlA+8aylzojlpZZCzfE/MS5+BI2bcM3GMsOkWiIP+ndvjdGthZDshE
         wt498GRCHlrvtH3Vw73ci2Wv40fIxt4JdLfFj/Z9LEVXSD63IgAQNty0UFr6M3CI/HL2
         cyiA==
X-Forwarded-Encrypted: i=1; AL+hErGo+XJlrF977dqixCELP4MvD3zFeHshk9sDt9KHKfvGqPSdCx6XHdF0kHYyf3V1T2Q10WBcLwAtJtmk7Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0oiaktekFK4fkqzY/V0NgMcqW3QDSKi3Fy/3SSsiitHVK+4ux
	rm4Y6S1xfIHO23HCnPfrzyG956XZjnz5koYsE4W1Js0QHz1jhzUeHqbe
X-Gm-Gg: AYBFou1wGhqdWGIIPKNqqC3BAsqPH60THmyxLN76Y2uLBJWgx3Msnb/5V/p29mh118u
	wl7s+VD/bSVmf2vr3ZISt88EECVjskiqzq91SrZ/gpDsL/UcyB00gq/3DQexDRE4LUXwBCvbmvC
	AhGYIsaIeulxTqpDSsPcsWK1W/2QqAmw0Ip7DDODYQXhTajbDuA1EfoM0G9rOim2BxVaKhtVHnq
	OLKJpiODDh47jgaf4vqTtVbDh2bq8HSYCJ7gpGm9NdY4OHAtaF5xnPqz4iQeybACnpmEKTg8W13
	KaqEuUOboQJgK/Q0cARnXhHkiPaaRrc61T+PPDtSWfbqbzuT1fvUyEN2TyL1Jzik97ZcOQRLkE/
	Xv55cZN7ynfnEFFwPNsWcaI+I7TxBJu6ktGkKAiZ99CvvkikGWMWmbj+Gzvfl3Vqy2Ye8+RMpOq
	Mv0Bkd5goYKjZWkqPp2hDDnN1G0zjdGn+7C4IDVCDIp+FIbIaOVIyliM00iDn6INGuNhStBaMd3
	4E0OEHNgioTuw30Yfw/IfEFVvCsKN6GEBK7xpHJF3dbYj9umkQvcd0SP6nQpgwVTS7v3KqTCzPF
	S6ybNx2EMf5Dl1H31Ua16m+/u3nOfjN25XLWSNh3zEEg/s+gyDTT6NnTkFXiGbA/E6zLjCsx38P
	FaRd0WhYJtUSiQ6Zeg/xLz67FWG5zRRikWtNsUprZdGelt+9umsA2QD3fnSIWHWs/YqqJPQ3ZsD
	A57TZj16cZ4dqJ6b7E9/r89K+MZxKifGECEnuofmcPAHfKQV7kq66G
X-Received: by 2002:a05:6871:201:b0:4a7:1685:49f0 with SMTP id 586e51a60fabf-4adebfe9930mr1320398fac.11.1794171712263;
        Sun, 08 Nov 2026 13:01:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a0c000sm3239010fac.14.2026.11.08.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:01:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:01:38 -0700
Subject: [PATCH] mtd: rawnand: nandsim: validate overridesize before
 shifting
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
Message-Id: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw6CQBBEr0J6bQcGDaJXMS7m00qb0JjpgRAJd
 3dGl69S9WoDpcikcK02iLSw8iQZzKECP1h5EnLIDG3TdsY0Z9TZjZxQrATlEaeFYuRAyh9CN80
 ScDFofH/0jvrm1F0gq96RHrz+bm73P2fPi3wq7tJwVvM+WvFDicYU6nJRC60J9v0L2yG+VqgAA
 AA=
X-Change-ID: 20261107-submit-nandsim-overridesize-bound-v1-1c83cbe80469
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wang wei <a929244872@163.com>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The size overflow check shifts by overridesize before validating it, so
values at least 64 already cause an invalid shift. Smaller values can
pass that check but exceed the width of the later eraseblock-count shift.

Use check_shl_overflow() to calculate the unsigned eraseblock count and
reject values that cannot be represented. Derive the byte size by
multiplying the two 32-bit quantities in 64-bit arithmetic.

Fixes: a5ac8aeb2900 ("[MTD] nandsim: enhance nandsim to allow arbitrary NAND size")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..6716eafb4b00 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/vmalloc.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
@@ -2341,21 +2342,21 @@ static int __init ns_init_module(void)
 	}
 
 	if (overridesize) {
-		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
 		struct nand_memory_organization *memorg;
+		unsigned int eraseblocks;
 		u64 targetsize;
 
 		memorg = nanddev_get_memorg(&chip->base);
 
-		if (new_size >> overridesize != nsmtd->erasesize) {
+		if (check_shl_overflow(1U, overridesize, &eraseblocks)) {
 			NS_ERR("overridesize is too big\n");
 			ret = -EINVAL;
 			goto cleanup_nand;
 		}
 
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
-		nsmtd->size = new_size;
-		memorg->eraseblocks_per_lun = 1 << overridesize;
+		nsmtd->size = (u64)nsmtd->erasesize * eraseblocks;
+		memorg->eraseblocks_per_lun = eraseblocks;
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-nandsim-overridesize-bound-v1-1c83cbe80469

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

