Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810626;
	b=Or40INPp9xOGLaW58YJVHWq0Kn2KuSuffzci7sCmA6bCLHqTFCLXLfeofkCasrvqihI+
	 SjYnSQwNOGm/KI0iBKqqGC5PgwfV2XKn5e3pRSBhEcazcpK4Lj3C2pofU+VbkO5WZotXN
	 bj61rhpef5dCVTLGMuwOvqc7fsIb1W8zE7jkGmIy6bIPWvHvwgJy6Cji1Gf4uuPduLyVt
	 qNmOSEs9WPStxlBRn6aQr037zUTlPOM+S57wtFjFIvQvBsIyS/l/EsmXEztA/55vO8qHH
	 G8pI6NoLDmod/QEKl1t2blJ8ad0rOlANM8nwx6zSX4gwgtgDhOaoJ+21z7PjLpkmJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
	b=fp7qZkmoMpCdFqQs61/EfJyEcgn3fWOeWDy0kLCQ2bJH/KcxD6b+rh3RtTktHricdd0H
	 d9rHVwrhJ7M6Krx5oDyNcCSNTHTgEOhR0Q4xA29ae7vjm0XMnt/E+RfYk+Ev7qsUzpgwv
	 5jMdqQcJB+SwjJLTPXn3Zltpl42sZC1FCXj1/N21DankJZspTS0p59JyP98P0/D3iWwEc
	 QFJNPoOyWEzOJvX5z9Jm40u9OEFgvKrl5nC2n4gUKRjqyHwTlmUR8f5c39IHoUmYtNUUo
	 gnDh3L5/6HzXR6D6eEnYggKEIdfn9S9t3ufDoeC9CZb+1Lds4K39hqbtTdp0GB2QtbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2bQRdBF;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79460A6F65
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F79460A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2bQRdBF
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ac798b8bbso1416082eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810625; x=1795415425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=S2bQRdBFHydw+nWU5ujG7+Iqd5w2i4QwUG+XXgAQFugrINOAplUY77/vHNQDX+6ju7
         SL+m+Ch02TxDZGaeYYbJFvZwPsZE+UhWdkZA7RAd6cmJBw8VhzUvEPDMnin7JNJ1hctE
         l3vv9vKDUfL/fXOh1cILJiCTSYsLb9rtMZJFZ4crvOQcdq7HfmZzkI/NyOLVUS2G0W5u
         B1JP+00MtDoPmBqJD8pw50+XIaPSGR3KlMS9ki1YzhV/ZD+PMVgQz4docs5hcFT0get2
         qXG0XEJgtNlg7aAGIn5zGD3RSkLG1hnlF/CgBRzB1455IFJovh5mNXgo26rnMyY5JWPC
         C3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810625; x=1795415425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=RNSfqHbdKWk/CL9Z3Fvd5ou+BwZXFlYfqTNr4lXhVz9ZhhIUnVVrebo8V5dGZMsnAq
         IRKzjCM2wYQq2tODePxa9gTbxBj2wKetbsqDtLUnePdCujhJwvBZ/3FDDKQ09y/m0w3e
         1OU9nBcCx4QAkIqXUPmT9xtb6vRrAVIP364acdpKrHJDzu/brLIhZNhPGVac2KtJ3JJd
         FYFw/hX/aEu6BtWTPBVgUPN4fs4rI+QV9ZqPYca0/YpCNUeHhaIBPnH/aDiZs6ziFk7S
         3x8zkMA3Hr9v18Tw3MypwnyzYR6VrdnbN8GCMxJlYdoKWcLzZlAp6QjRD+Giy4+z1rxR
         zf+Q==
X-Forwarded-Encrypted: i=1; AL+hErF6iu0UEKTevmVG9r4Bo8xVHQ4deQqVf+qwqNQ/9myfLNCYG317ltUpJX0/1molFEvXDI8v85c1zAV/mAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZyoFQVOPizywbegZg/waf7PaJfWdIQhVngKvfHZOM1m/rB64s
	ZR89735PD/yDbUZ/E5ehP81Urpw2AS9bw4WlzuXDbkiYsUhgTntIrt4b
X-Gm-Gg: AYBFou2tnjxAXa9rd4sTckHLWaPWoacMPhtuyk3Ulet/gpjd2b4s8p98FbCp+4RtHMc
	ekwOoJQp09RUY5/bzjUAHv77gxqkiPSnG4iHoNjRkZsaLzo2MhwJPACtV3J1aoeLqa3UIdmlOL8
	h5GjzldUPFNl8XeXodQuhGQeyGSOEX39R/N8B+CV2WQ9iV7uIRcrkoTFF5iUmN7T8gqHzrPusfP
	LXSWumBnELK4vVSPxyJMXwOqiuMOhQNJcLaNNftn8dap7jt7x27AgE4Epjdd9aWrIeHGRdakqET
	sLRY7nBXpi09X06bU2X7TGND7D0mSRvfvVbZBHSOExpETZIi8vcHn6pccKat5LXTOSSdKkzfs7g
	T5nvGwisXRF3aBQ+gau3yfx1FBp6+gZgfvman4dBmGLCtbZYTYmkJldJKKrOZCk32V/PO8CfjhB
	zkQ2fHw95cq7/qbYnE5cvxyiphNFDl3uD2FkhR+xVJ/0pgwf3IoTPpK5OUGx81pR6hOqtXTqz0b
	XBOweKVlZPZEY9jkpjl8JwMZ/nyBumodEpY5NBTVRh/jIZTB1zzBPhHeK+/ouWsY4ex3mvmdzl/
	y9UIbOzsNKuEnW+G8PodA+pwUcrUqn6k3mzaHQkHE/sRCy96jpYs02Y7znHZgxGDbTBlfg6qt8u
	15cgETUnCpdkj6c3dTx8bikpBET49LAtAVm+JhD6sl5oLEzM19P5925H+NS9nAu0CeL8P0/biYH
	1cJPVkdMmFP/Mvdf6PThPl/CBaOPTA1Hp7rPAPQyAiJO7acw7j3sQ=
X-Received: by 2002:a05:6820:f02a:b0:702:31a1:9049 with SMTP id 006d021491bc7-71ab50136camr6205367eaf.36.1794810625042;
        Sun, 15 Nov 2026 22:30:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:47 -0700
Subject: [PATCH v5 32/58] mtd: rawnand: fsmc: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-32-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect before controller disable and DMA channel release.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3cd25395d791..264a2570f40c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1037,9 +1037,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, host);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1131,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1142,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1184,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0

