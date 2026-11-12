Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446945;
	b=I+seaQXUciHr/nXA1x9UHj6gkXmfosKUHdaGB1oxL7YEUFgP+HlBashRcaqnRUnADNJZ
	 MQJN2kv8r3GnrRHjYP9PFwrPR1AZDrAqpL2SApUAcIkVzVlZT7CB97ETXlM2QmquWuW0L
	 fTWvrbOr5hO+F1ki7QIRaY9a6XgTBsqb8c/HyvBraz/7BjuoDWQ3H1e0ELBP09AUOwCpi
	 CZMPdg4xLVC9JepwgFJZFCRvqK8Zp1bfmfYvP/v+Kvy+Dtf2QePVFrPDMkdRrsVoyvtxG
	 I/BEegkDomZb6Gfd8BC7Rx3mGWngysnxolfnTjw5kfLnwaKU6YWwIt6wgfn9ZAVhUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
	b=Ko8DUUEo+Q53cGD5/0TTDrqxU1k2SzGhXFmiSXx00DYMXC/AQqPO2NH+NCdn4iykFrWc
	 zeyNsJ2mbEJ8Qj8eZJi0szPiABEx64qeIaIkOMbomnuszR+XMl/d7xD7/BDpLZfw4aec+
	 sQ4UugtABY83tOzjgFPtSYiHeE/8CP18Kz7bHSV/ZJ5S5t0YnQEq0Z8O7/WR5mFaiZRoY
	 fXlWCNT3F2KZv/CnaHFi7A04WVhgv3jRw1MLvZSJoII6fbZgUs3/5Yn621AHe/sqo6SWD
	 7YldMKehyzkH4IWU3K5c+EQuzlTVS2O2z98/2dXtG4STB+Kw0Jh0qV7EAGMTKik1w3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZQP1CCr;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4A606D15C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B4A606D15C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZQP1CCr
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53a448f86e0so2102471b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446944; x=1795051744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=DZQP1CCrE6j2mle8jghvPfVIRrPSi0tik4gbfOkkHHJazZ6cdeBEhPD88H9Wzs5t3e
         c+iUFw/MEtGE6bY2NGEsegC83ZzZ+7SKoRV1ghy0A30HxtyQ24b3w0x61PQI9F3WYvox
         egHY9iKfxUAcXIs3L6GCblSEovu3T+1wEBGzbgZeQVWyGhmhxTBnSod5F2cVwYSsdX1s
         8z0d+5w8DLIIHHw4BRwnFJYBXW0IYgE5/Tx8cCANuXUyk3y5H7R9kAsEDQmNdJ5N02B7
         ++KoBg4Ybe3fSjVPr+bPB3pfYSyhDScIXanElz+0VuIbbaRqwdthPZl4mtsQumjKWTbM
         fSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446944; x=1795051744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=LJllNgYsLWUw89W1NTnGS1/afFGojptpEE7ySfMv5xShz/ujIAihvpYNnZLZ4+pHHQ
         BCX0WdtDZlmZujthxOeNv7EeozHEZoKZNtyPEcbDz/kMp3nLXJpWJjIgHxnjcOUFSpO6
         yUJ5vQM3hKdw6tLqDkLQ+i/5WWvv+OCHcXV9OOsRQxk9wRnNGo+lsBjFlCVx5S/kuUda
         2ARBDPyOtx0hI5aVzad6vIDChbf+GLQmDwXbnEQJWcfWAgeNoFqwtoSxg6i3QcmOvap2
         MB8MLGiZnxFYtj6lu2m6dPnPyD3Hp7k2VmAC8ayEVc4Lzn3r4peaStEtGUiRSaDeTnzU
         xhbw==
X-Forwarded-Encrypted: i=1; AL+hErGkttNS5oEvQFVyR137Uby6PW9jBgmuuDsIbWjbzt7ucFYbqYCEGLnPjIvhVJeO70ztSQun3/GykdjzgkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YPPFeLMTAylo/hHmcb1b+zu9xb/a0DyH09sqOOlYIAJF6THtj
	tDyPUZ4978RrOhPMkn549TNSDwle4cFpoNPRXf4JH54OEiPz/ds/muUQ64xczhce
X-Gm-Gg: AYBFou0jvrP1q+pUGj0aRmss7fHl5yry3YgKC3/iqXwxFQXXfRq2qKHlDF8pJG9k4l3
	ZQS+hUZXbEBf1eOIQKpUu2fk+YidRtYJL41MnMzzFdgOs15FeoEPpsiTuWbs6n7nyYRcPVKJcL9
	yijuR3K7PvAG2y12Tqy5IeQ5qx4svfEvBwIa8GoBow+8Fq8zKg9+v1Pr4s3dBSXMC2vdyTrKet2
	Znzjb+r4vUBADwJZesPU0VZVo9pnuAgASCFTvRo10rJG9w0eZufT5b4q+f7CZl69Zr7vuyOeISO
	uvDAnbV+6Xi9mI1NAHJw/bApsskYzWaC5R7k3jC5firOAQdrr7g1jYHklSb8Arrpg3vIaGLlTVH
	cGgYxkgYJ17wWn69BDu5bBArdTq5gS4mYCkegsrZJbD7zk1lnlelskxDy6/h6iIvCMIwyU10wv7
	62uddAXy2xnuGa2f5KXfjbb24Fq71vrC9VHsYtnSZKHD7+8qx+eNLt4D2BrKyIjovOfD/dRARW3
	yCGS/9avms4Mw2l56nlCqKeGo3Z636AHPQnfaEw/zIkHg2ja5QGkHNN4q4ZiQDZlxpwYcJwBsoJ
	jb+0s67BhCgKR54udpcWDbivgKhOsMk7dSZtNfGK9rMcMJRdRNSANKdGHGjCAY2je28xYDgSiB3
	jyPQdMORHCuKioKNcUKdSDfpG4+80VxERXH8FAG8fDm5mcO0CAarhH/41NwoXGiF6Mvm+NQU6NJ
	NMvwOI8KAdK42U/ydRp4cILYV5r6LqBUdxRCCy7ouNyYHuj6QIR4Y9
X-Received: by 2002:a05:6808:1825:b0:567:bfc4:c94f with SMTP id 5614622812f47-56d4f031276mr174230b6e.67.1794446944265;
        Wed, 11 Nov 2026 17:29:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:11 -0700
Subject: [PATCH v3 32/58] mtd: rawnand: fsmc: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-32-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

