Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296713;
	b=mHoH+II89BhoiXiz0jOG/jWFwqemqB4+Yu4oWcHiRsce6X+nsxdBZsSkwaqfVOegcLV3
	 F2ImhUiAotx+v4wQF8jexyZhC5SGyEQN1ZPJY0wW/R+j2J5VJB6oXEv9INIsAMrj2epv4
	 Mxi5drDxmdVXZj7LiCzy6+N8EdpvlNm5jW8BxXsbjNpShhRdOBQEVhU0RRl+v7Xo50x81
	 DQa7yT+xaHSZzN0uTbUoR8SBILLy32vS33mUUVjvmbrwCAKdvh3fPHq2RyhO8jl2FC7Vg
	 UeL/SS9hTyMEoyE/0nlXxDGqMrdm3kpNnLm42Hu3ClT4E8XFeqjPyFb1GKCIkwFX5MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=;
	b=R0eyZ/7FwNuAjE9AAh6vISA0CH6tZkg5ToREbCERZQ4KfAhV37FPC1rI+3EAPkWg4Bte
	 Mc+wQer1VIKe0Rv+PdBaxCENV9rceKx5YO72hTuXHXa5cF0uzW+/KKMeFBGb2mBTW/cs3
	 3WaFpZVJxZfXf77APSuCPfW9IYMSOxboXvgr94lmF11lagiv6jrLVSIto/yuKPkfzpVFy
	 56tLso5h8DIu5sWNRNFW9QOYKRMT5eBlCheEY/gAFYMzos7/dM5xWI3R+8kuA+91R5fSX
	 jn7LbTR8cQ3X265rDBKaaQDsbDHvQ7jA9lRbAvkfeQCj8rq+aH7OeuJpbxsw9DMMD+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIurOWNJ;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571BD60725AE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571BD60725AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIurOWNJ
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4e4a4d77e5bso997382b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296712; x=1794901512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=;
        b=eIurOWNJTe7rS1rNHI2+tyAPlz0o5gQKlTh55ZCkZpCdToW9cosAbhY799JL9tZFG1
         lROrtIywBYm/Accc6NYN49oB3EeF3RSgbW86J39PujF8Gs9NTpn8UO/6Xpt8b8Rjl9Ha
         9xxpGZ/LpyMQY/XnAfdIokr9oboBB5aBbx+kvTRfFqJiziPR8PduNb8PuNU9nPCjVW7P
         81B4eeICwdLLIQve4myiLyOy2i0FeZWvykIBRjupk/9wCkRLsuzQFAWYY7BJPrjhxmKw
         RKXwOel5zu0EaedMnGlxxjFyLdIpnunCFcYBSZ6uizC0HqcZ3+eedzoU+dA0PcR71g0k
         Ehmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296712; x=1794901512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLnGLzTCg3KFo3iPJRR+p8d3VN6v2zJ6pgf1CAq58N8=;
        b=zgzkk8dcAlK4AA0PP2BLj18CmgZ2ugjObGrzWA+18o5pivqvWEhnuLZZWLF/gW+tAa
         /MPyeWmm4cjtswPTp4Za2aLVP3jIzVY2941TNIJgHXVR0AtigRdPkbC6nfyo/hDprnTi
         H+zfYwpQEB68Rp4Hr6w5yMGu2XxNrrwM4L97bVfKhnJ/q7Ub/zAWrYlecbJuEEI0oLCx
         1vEb23lMVOvfUuho1nV3DdjbpCF++JbUHYG0DVPuGRXdB5i8qw/nfWPvioTonBcapvXn
         vGjYrmqik068cyxatIq3Y9GGmnm+aS3gMGs6hE3Ahmrcet1ZpSI+SGULfP5craoZnkfm
         tULw==
X-Forwarded-Encrypted: i=1; AL+hErFfJEygLYJ1rHJJRb8t6AxYT5Ya8McGOG7wjr+rRGB2J9QMctk5shHsCGRxGB0cgeQEQLnPSo9Mm43K5ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RHSdY29PUbv2eOyPzl0G+FWcJltQd0PJqACkfmdk4MvcybE4o
	0Xny9CethYQvShmJIPo1QDr34cI9vfEymdZ/BlrnDE6nWOWClqpFm7nbOa3teqxR
X-Gm-Gg: AYBFou0pKANfKxOCDPU7ZyLKyaTP1nVHvqxc4LpboJYkUzhiu/qnLHf7AE+/eIDWwph
	Aw9VympWW9EXnmRWBSfs9O2zw+RK9eDSkHy3puKqultLJtN5BX675kLUFJ9AOR13HStC/Iw7zNE
	5rGuDZ+WrvJWxM5BYVguYlE6fSnEE8SssqOyIZVKx0GiCdPnCkpj17WSXpJ2F11SLug7S2PEeXH
	uqnG2hsOVogEQAAP/CPKsLUDUeHwCPBPQl3xac1AJb5z6LvctoWvYWOeg0fET4W7wfoDF3Yto4z
	ky+Izke682m5SYByOhqaFF9uty2sHqT2vU/UJirJ2mmB7uuQJ2jugJYVHT+gotEP1BDm7eI23nr
	6NZXCTtZQAezqKWNFtqV96beH4IKfNexfrysjP9ErMZeDbkrH6RCx8Eqt8QyQ4qb0mVmsg3wrZj
	ZDqwrlw8iBT5k9+Hmae2B8BqUylMcP5A86SOrBnXOkSZMpKysuvcn12rg1BtLq+s2CpHDburUUK
	Brkodt1htn0AdpVXnyQb1+y3WhdGm7k7puZQe8HUlYTR+NZdEFF+wCqaQbaOTC6dFBpmFZ4VPuY
	oxZfGG0MQFfoKnPG7SlDAby8IIjXkR0hHE/AG2fvpAkIOa5FqWMeMoISEVRYouvW8yfHWl2L6HA
	gswaDzbHWXv2un2Iu6a9pbMakohAgs834cn/Ti8Ha2lPfb1tYoBeoYjPdcZhBP+qWptj1MPfH4T
	uBl5UCpk3PPQtA2u7wDmSQBm6RTlUl6v0akqO83Js7ANhY+QZwFRE=
X-Received: by 2002:a05:6808:3097:b0:4d6:9133:cff6 with SMTP id 5614622812f47-568764d22b6mr889637b6e.29.1794296712310;
        Mon, 09 Nov 2026 23:45:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:49 -0700
Subject: [PATCH v2 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-46-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

