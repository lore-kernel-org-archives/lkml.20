Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296679;
	b=Ni4AFe/9fxCyMjm3cw72SXtDOPMs/t/QiX2FRCW9YghJu+we8HX/TmZ6qcxmlYn9KsdB
	 EJKetGYV44VAwNsH+DB8jA5ySn8MVCCG8xSRjrvIfLRQ93D+pTFKjDPY7igQvb/lWylyS
	 JfVYzdAtnfKMnIVHyMoUYDHSE6TSzXyZWJNiD0LbjHU39+1BpTmtJhqWdx2AxBAa9K7o4
	 Cw7Y38VaeEf+IRD9bd8PTJNpYIbHa8Bej0xx8GNCxuNojFvliZBUr6hh5Lo82WZpA4J+T
	 1NNK41o40ztARrY+lqkJRSPODtezwn2c8OqUSFZnHY7M546uSlUt+opAMtYicpY5qAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
	b=FioJLPluw/zs6BGu/hr4NBwXZrVvSK6fwsaKYaE2V8tP7vM7RkGrEP7HbEqe3vQWREoI
	 +44b8V0EpXgE8X3ypkNnu13BqG2iwsrgu8ds1yLygR7Nxt+hZw5ZqWP6qvNU5pk01Hn8f
	 ww89JanVqBo7gX/3AuzEClV/alHLUReED4ARD+6FsaZEYIhbHQKJM5HkESwP+fFACTHjc
	 b8MwCFuwcaOEbuwfYyqH/iBzMpk6fM/TNysl/W2sg3j596dKTo5WHPtp5FolvH/bp/1fG
	 7CTQk0N+mbcH4ojw++4OMLYIpdopgCL8slyNbD48X0jRKvSI0d13e7WSvFswEfqZ9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ENZD2/ft";
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856160A5BFE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9856160A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENZD2/ft
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8470d7d430fso924828a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296677; x=1794901477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=ENZD2/ft9SIAOm54oePCmpux15dfOVGIhPUuuGrSX9jDtt50WedR2UjhfneRCZDS8T
         uvFh1+wT3YODSOpwrkaXAxth1s/ps8QFOp9CjIXSh43L1cVTqQ0NYn9MWBU4WUoVG6pv
         t4cfp86H1AIafk5OiI1/NJ7o0Cm1ylZTErpWzms2NrVg7rikfV/5FR3A2sT/e7X6EimJ
         tQqfEF6LkvewNxpVgl+hfDJmlRTQRs6kiRS/U/3xTKuCDpuUUUVs8yh7xYYR9DkBtt2S
         E65XTmmt0DX+b8uCmuG/8EOFUIjnjkWW/l/sd6LbnLNevfl05pgzgLe+Fqd+yxHxw1Gf
         QJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296677; x=1794901477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWLOvNebXGBlVQ7Zi8BeorzFtiggtoriqZHb9Vv2KlY=;
        b=tjcHLqj0vY8uiM4z7fCj5ei0wPX3OhWHIRnRh4OatEOfpA2P1/mu2wA0R2NI7DfpQx
         ll6gcfjCiTDfLfIGnv+WjQAEJ1Yk4GRGI64got4hLa+fzlLCQNlkQqMSrwTzkgyhXy51
         6qXBFIhriqgotkL1TGix2+U8HeLmHv/6/Fb3Qgqo93yPRYKXfUXpX7KtvKLVYiB6DvMO
         nzgTNwz7rcwGk8oeEnAjn3fXcoRRTsarmrqOyxKe2c93DcX5kzAUFY6BYmh+mQhjGwPH
         G5M/GSQaagmdLBuIYVE3JNou9UL8sY4xrp1OYY6mx82MzcqLKN6LG5o7URkY2vfaO+ZP
         gTwA==
X-Forwarded-Encrypted: i=1; AL+hErF9xvht70jstngmqNqMhbX4brmM6pw6ChXKPE7S11LWvI1LrgGojFP8FGEVb81VU++sFicUBGG+GtzoB5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ho0EwyBkzGIC9gMoAerePyzsAHHWmjKnvYtkTEwaJ5+UeqWu/
	AlztknXhnlywJovNH8sb4otq3zi3ELibSZYQZ9SXLfglJQT23HzwcAwP
X-Gm-Gg: AYBFou1Ydd9Evv4LPA8A0e4SILcY1vy12Pkij3A2LaYsFgQ4JBq8B+1MmPi7sGhVFdD
	be5QcBaYtEtCC8X793wpJdHnELaNLP3dudy/358AZIPX6qKlAs99GNLnJTvYfnXjIuD7GB3BOmj
	vyV+W+0G4ibrChU7UUoN1qGwTSHUutlCDqrOvn8yKQNTs31H740XPLoURBP1bBcPpoWz61y7TSZ
	RZlLt0vL6TMLaPMi5j70/gRYppOUyXD22lNdInqY5grAi8fPVNlMIZkBlrQ4oMDqkXx92OFxwr8
	LY7qX9Psm7075N6hBLKRjF8FDPLYSsz/VCEcVKXR22pDR3K7TQVxDrVVvNgiWTCqO4yEEcIoVBh
	u24ZRj+b0f7GGn26TmCNW9z46XdZ0wuNK9GRX2vuZuoT9fe36Q52vRac70EQkDK4Gd5WlKmoQ3p
	gKPk6Eg2Jp7GXxQ29D5Gm/k0M5giRBIJm/xqXD6AW/o18vxBkEodlP6xV4/aYogohRX2HnvZpec
	zFvevBpQH7mKzNQoYWdMZV+zk5LcHx92mjVOnHHXdhLBtaJu/bMx6mkiF1HJuAf7nL3ePK9//NR
	SbRavL+wFvdnW9VS/A1/S9L+H22KPZYoa09HOvOEqEN+65zoOvrX70hyhkVd+gLE/jvxFVnGUKP
	C+EowCNN04MqoRcm7f5KefZwBVigGG3zKikiqiriFUyZV8V5UoeQHGjlAHYvn4recjdjsG239+L
	1fW8rZNx/ANSHP3orQQssXj0kmHgSBQvufVZFtP0RtmIElMCdXgJQ=
X-Received: by 2002:a05:6808:4441:b0:4f4:73a9:f838 with SMTP id 5614622812f47-5683c9bbba4mr1481876b6e.22.1794296677454;
        Mon, 09 Nov 2026 23:44:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:18 -0700
Subject: [PATCH v2 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-15-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

Release the probe-time child-node reference on every exit. Lifetime
ownership takes its own reference before publication.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Lucas Stach <dev@lynxeye.de>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 1104d75b6cbe..5130bee46d60 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,11 +1064,16 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
+	struct device_node *np_nand __free(device_node) = NULL;
 	int nsels, nchips = of_get_child_count(np);
 	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1257,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	writel_relaxed(0, ctrl->regs + IER);
 	devm_free_irq(ctrl->dev, ctrl->irq, ctrl);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0

