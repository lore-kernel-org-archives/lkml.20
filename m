Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172055;
	b=JUv081xYVuwzeNbCe8ca89c1iXv9atbuW+k5VjAsPDcjO7QVKpkbXWSghldTDQuSv19p
	 JOAosFup7fpey4CIhhHS3SPzkDuk+tWySG6vnoXSWSiOup9dO7JBDddwBX5cRXGK/yIg9
	 UOzxbZPooRnISjF7rq82R9/veVwsNkt/o0wCWmXKULJybDYZEixJ4MNAxF+v4Z2hTgjq5
	 7Tl9pCOzu+BDf2MV5qA+UsL4ungYQ3+wRipZctkcHWxkXmO1FqoRp0Q0ElFuAwE1VVXkr
	 XddTsffCtqOFjX1WFJiOgPVmccmbioUlYt3/2xdRmJwdCRaYIRaqARJaFeOWmn9PjOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
	b=PuYTxmjWPDYeMuDcqvBPnDJVX9sJHnWHhma44TJJhCZa8b7oPvuemoYfmLIi2aV7qPkt
	 h7rcG+eKeJ1uXF/CGBLUm069mxI1p4Qt2BqMsChYHJETippwilmg0sFMyBWpj5wfeOx6H
	 ZNo9PsdNXLb17hLwht1kJGZ0KfNyLzG3IqoqnjyYpnw1msTHbv5I8fam8UQXNwjsW1yCo
	 p/WKZSa9FfM7WWSs7ElCx6jUxV5jJmNtQpEeBw7x7QEUOzn5RwIusbzmS4LdGyXntU4/5
	 iuuya5936yRkzu0Ukkgi92hfMX4ZsbyeadEPDOlruX7idg2qhc4mAFmQVAmaMAOzyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUlW3VUY;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D3606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUlW3VUY
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-846566246e8so254685a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172054; x=1794776854; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=nUlW3VUYxv/20AOy5He78UCiODQk+rJyY8JBf+kdnoHP1JRRcvrwXc+HhkmVg2gx9A
         B8jM0YaNJW7we1B6F6cXugT6AiupWGZYIkBtZubLUXVgyUHO58fwg5dt3V8pMXJjvis0
         rHuJQ7f0sQdIuuvnKxbHKv2Mlnln8sLDqtT2FmeXT2Xb8dsYASJ5BRLQb68HTgCOyUwO
         o89857EcWhaTI5IdVEF9zreguiEEoJm1RjuKAac2Xjh6vJHYb5i0FSXVXGqpNbcWyzeW
         YyzZlPwebAkL50Ak86re4I+mKVLiezfULIjFlkO5w4HuUMmNzl7oH+EBp7TCZbI1DRw1
         DurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172054; x=1794776854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=u2EEdAR2Nv/QgNH0bCVTB7JF/V9SRx8OWFQBD3+CmX8k0IYz3aW89KlWlLW0iXGL2l
         1sz/p8y8Zf35ISNAw1E9zcRMlLRSlSUnLTidOYNOQqwdYDa7BAqKIeqxMa8qF9Li/WUt
         DAFu4vPxMg28KoHu9UUetnJZe5V/m8AOKXIICIs/8knCFVq9daLUWL707fNkboVsJYSQ
         4z5bKoDN5oRFFMiUvsLFo7szlLzr/LCHhe4bfhTPm2RgNXjfUGaoSXhX1hQMMbksRqkl
         7GRGXRWgGD2k8RBkM1lciPMzqvXBRHVX+3I4f5cIRD8GFoG9OeSltix0OZFpKKeO3ETD
         HwxA==
X-Forwarded-Encrypted: i=1; AL+hErEanA6mqfl4Dhrn4+rztvRMWGZ8pwRzy74flBxk+OCs7s+BhxK/s6o25pRYSIuKAD2mIXlY1RU+ICSbqJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lEjOu0a+0/ajoSpfQaJuDMjD4Asf/utPJFQtKx16Q3jABuiBv
	ZVWOZUBfkldkcfmSOa9h1t48eu8al+BBaRSmLyNq2qvLdrYhC1ey9ULE
X-Gm-Gg: AYBFou3JlU2r3v9SpIsdnZT5zfS2cD+PHcdE0vYV+7U733vZzGrUmuO7Fi70QgrgI/C
	m/pTjik4STNgLJ17RUG9ke152QVT9bDQOpytfdSqDFH37He82Gd5A7rLipBhIE7bocD764T8BF5
	apAPLw7tvpXJeVRlhD00eNFu+/dyKbAg7qk/D4PqSWLElNve7RgCnM04Hxrg/6lYH2Z2+fiff3F
	imutP3P9sQEw6ycFmKVo229SQ8pTopc5O+02OIDdPz7disSQiuCSrQ7cHwo2Lso6JrRSRcKT+Na
	B/omb6DalD/rC9dIhPddrolbIXtkTbRPrkdaBCfVkZQxSBLrQaU9TqP5/7kFiF9WtmU4CnfJuKo
	6mdZCBc3DjDR+O5KryyWpyG/PrdTuIiaV6hXW7pLuqMV0EPWwh6SregGKOyRGydi0YN76/sARow
	u0xGc/nBCJYYNxAGS1UzdRIOg85JB8Rv9xLvt9cnLbuXqE1d2wYBGfJf/JxT9b6/jdEOOqF6wIF
	eiSaYD1plDm03rlqVQ3/La3xED5BdigCys+mSljV9oYP4K688ir1mZ/iHUrj+aV72k/KffUHtdZ
	s9pKvMzTmZqWgkyUUr+h9IE7thMQTIHwosLJzIHYEfQWzSYGb8G4eSxk0ShgkxcqNHWc2CS4ZTK
	KHdpvGBhqGOf1/vbo+zuXIKZZHgR3QgWT/93SCAPdfgurtydbK3jbdVV8N5I/nZ4rygWhY0tZYw
	ytiQfOP9HydwJk73JM0Skz0gUBCfRAcZL3C1RDY6G7oBBYrEbSOM62
X-Received: by 2002:a05:6830:82f4:b0:85c:e511:ee04 with SMTP id 46e09a7af769-85f34abf688mr2547935a34.16.1794172053785;
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2b331sm2147379a34.10.2026.11.08.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:07:31 -0700
Subject: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before controller
 cleanup
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
Message-Id: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhm4mot2I82E+RGim6TSQh3
 LubHr5fmqcrJIpMCc7NCpFmTjxJCb1rwA9WboQcSoNR5qC16jC93cgZbR7pgWIlIMcXZrIxTB/
 BWWN/UmavOq+PwUFxnpF6Xn4/Ltd/F+ROPle4XjibCF204oc6jTm0VW6Flgzb9gWEzj8YpQAAA
 A==
X-Change-ID: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The NFC interrupt is shared and devm-managed. Controller removal disables
the clock used by the legacy binding before devres releases the handler.
An interrupt from another device on the shared line can therefore make
atmel_nfc_interrupt() read the NFC status with its clock disabled.

Release and drain the handler before freeing the controller resources.
Track successful IRQ registration because probe also uses this cleanup
path when requesting the IRQ itself fails.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..9a724de67624 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -263,6 +263,7 @@ struct atmel_hsmc_nand_controller {
 	struct completion complete;
 	u32 cfg;
 	int irq;
+	bool irq_requested;
 
 	/* Only used when instantiating from legacy DT bindings. */
 	struct clk *clk;
@@ -2334,6 +2335,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
 		     ATMEL_HSMC_NFC_CTRL_DIS);
 
+	if (hsmc_nc->irq_requested)
+		devm_free_irq(nc->dev, hsmc_nc->irq, hsmc_nc);
+
 	if (hsmc_nc->sram.pool)
 		gen_pool_free(hsmc_nc->sram.pool,
 			      (unsigned long)hsmc_nc->sram.virt,
@@ -2383,6 +2387,8 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 		goto err;
 	}
 
+	nc->irq_requested = true;
+
 	/* Initial NFC configuration. */
 	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CFG,
 		     ATMEL_HSMC_NFC_CFG_DTO_MAX);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

