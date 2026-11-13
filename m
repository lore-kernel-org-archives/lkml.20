Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593735;
	b=GU8Bk5O0K4unmAtcnlRuE9w/iWJIa1i0X6wMpfAeZlwWvpb2a3tkohv22fVV8g4r0dzz
	 k4NQ6xn1p7w7baaOeJcFPOUACoRS6P78zIRG/ne5Q7uR4KujwdkZ+2leQb5xysij5XjiK
	 xyMS+5C0IrHy8BYMwgfCPLeT0LZKCLag4LOfn3ihD43OQG6se3e1oBJ7By2dttgN6XBxR
	 tjmwPfHE/iFFNTYModV4kpLBLcys0+7/GHpOM1MNXIc+AEVNthg71NZQu0d43YYtocHAY
	 jhSenG0PWGzh6cXWbnb5hKEIqK9v4X4XX9tSeDhfcPmjyYN6sp7wvCmCuecfTkEqaJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
	b=reKeXKaN0vF3sT1h8aCaj0mxnKFLTc+Ok42sgXR3FcEsUh2o0b7QfbhsPvLb9DLNtVez
	 Z4hODs8gXSdbbvroPcWR1IK7R/+Et6sB31BXyauKkygks66d1yfZ74x8SP3OYQTs9XMcn
	 0vlkIq8ZfHKnnphAhvCS9t7BzwJBAubZry2kDY4QEnDLXr9t/7Is0AeZ7+yt3iwZGUgBw
	 Me0k/ls7jlcrJ1bm5wDtg33qo+OxpRuTRGoVcYQzVw9gLUEncquoDTR/A3p813V67TJ2P
	 eFBduDkler2YEA/ELlimtME7dJzqyACjK5astZmmZs8b2wYcK5Lbr7SvBLagPK2HpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL8JNU8c;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6E60A5BCD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C6E60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vL8JNU8c
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de2f213b7aso493645eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593734; x=1795198534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=vL8JNU8capIlGUkmK/0rBjqquGRvUq5D0FCaQC1AV3AS3bgjkpC3Q4F7FGncJlSqOj
         N3FqIRoNlGllXvWmVhpICLCRAW9fkwdrDbexFEjbPzACz/vCfx5DcAf7/Q3pcZz9aPwc
         aFXSyY0lshBASiy1HVR1hbAmENGfny9GFhhrBEx53y6L0DDjWTZhAqKzcVG7rlsY90FI
         I8oPYrx995Ral9qjcnVtBOddJEhJGD0Kt4uEckShiPkYoFJ1I/jsbKbrBbvLsEMAEMZv
         FX13JWaC3ScHfS51f6p/YVHraGkANOpaKzp5VesYnuwjdfLx7PBgt0buyEpztmztEZCv
         l1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593734; x=1795198534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=dhtcBoaB9sCHQ6Z1IiucDLddZBqdhmjeAdY6ITrG11L6ivnK6ndQNvF8AULOLV8HSP
         Q7Jz3HwG7qD65rQEKIlzbp92uq8zGb8lK96bISbOZ4JyoXCAxxXZc/A+/wdMmsbzeKj3
         DN0a/T2qYzM6x1uPppKxy8ZxGqeahF2FJwhBFRVl4WghlUPbRM6uZ2QiW1kaQlJyk1k2
         /CbrYj5S/iWseFqJFPweElyYzB6Y/Y6Yj7Q1wBvxCi7up8Vf9hGN9LYo55+McMpbcKUA
         FgnGuz60WD2nz5ld1gEFOjfayk+3Bj0c/j8HC63U49URo1Lu9eek3z22S5CeXa8e7QkW
         LJYA==
X-Forwarded-Encrypted: i=1; AL+hErH9TfetrDIlvtxXDLEWoCgmqRenOPYn5QEeXpMC9wCS8fqtKsgkh4gTxrauDngTB3SFd5wTJEg7evi0ZAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z94IgImtO42Z0zir07XT7KNm0lGyfgB6KqzhVpujsbwP4Hq7Ts/
	Mf0I51WwSS+LhvWLQXkRQGkEKkwUNkXoMffYmV//6RbjRn++D+ImRZl9R2cbssF3
X-Gm-Gg: AYBFou07S2Yq8Hpk88LbKZz2eRzQCaCJUgP62UuEUqz72UY/zjCani1H8S6VS2BghJ1
	JsLlSBz6X6WYhiwmwmZriE5mRrg9qWYfiHhHQkWFrFINwmQEBU+G9rkV5qok8V/H51Ofj+eKFWK
	uQmrCDDNx/OzzP0jDsjIkq1DVvBVnnkaFSjWEpxHn6ktVXB2vFdBtiwu4+vksEHweNzMGAg4pim
	pILspStIiCvdf8flK7R32bFme+vAKlkbU3nsNwoDsV697L8XyPx8PvfhB5+h3pnDoHvdx7gzgkW
	ifm7VABPqEY7w3xgbMzXUXEaJKCEwrnnOqYj8oXDi1oeAs4kQRWAJYcvtyRP2hzgXZvTZwSiD21
	hJlFwIgwAQdp2lsq8hmho9xKtAAht1xkwALL0id657tpO0fMzWzFFFidgZ6/N4z3hYxWBkefknA
	aEqy/5SdvBHd6n/3mHdt2Vr1b9EnzLJ2r9a0ifQEMA9T/T/21Cac94OvulcF9nBHquHGMYdmNBi
	6Atee8QiBeIECSi15LOdgIqCEJEjwhj7UsIdmESbJU5PrQjeC4C1kSR/x818ctUdIj1cu2e8WUv
	LRUurfoE0IMP1SK144oiyumqvSa+hCJTY2e0kYAcjuiSswAoavINGlUqHKuTXczlour11wdGM68
	00V4rUmtHJFmqkvBkJvfmMrsYDEtLf4FEq9fvOLsF7xQZX1NymXMYBjdrkmQrFAIdfKanCId97G
	uHiBprdUJmEO9fn5cGYMJvkLCVVLt4uxKRxdEh7QxZpsqBWiKl990=
X-Received: by 2002:a05:6820:f012:b0:71a:cee1:caa6 with SMTP id 006d021491bc7-71acee1ce75mr26036eaf.59.1794593734058;
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:31 -0700
Subject: [PATCH v4 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-15-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Lucas Stach <dev@lynxeye.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, Stefan Agner <stefan@agner.ch>, 
 Thierry Reding <thierry.reding@kernel.org>
X-Mailer: b4 0.15.2

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
allocation release to the final core-owned put, including
registration-failure unwinding.

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
 drivers/mtd/nand/raw/tegra_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index ef765fa21e72..4b9416ecbe43 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1068,9 +1068,7 @@ static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *np_nand;
 	int nsels, nchips = of_get_child_count(np);
-	struct tegra_nand_chip *nand;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
 	int ret;
@@ -1081,7 +1079,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	np_nand = of_get_next_child(np, NULL);
+	struct device_node *np_nand __free(device_node) = of_get_next_child(np, NULL);
 
 	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
 	if (nsels != 1) {
@@ -1096,7 +1094,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	struct tegra_nand_chip *nand __free(kfree) = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1116,7 +1114,6 @@ static int tegra_nand_chips_init(struct device *dev,
 	mtd = nand_to_mtd(chip);
 
 	mtd->parent_dev = dev;
-	mtd->owner = THIS_MODULE;
 
 	nand_set_flash_node(chip, np_nand);
 
@@ -1130,11 +1127,18 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_lifetime(chip, container_of(chip, struct tegra_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
+	retain_and_null_ptr(nand);
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -1149,13 +1153,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, ctrl);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1235,13 +1241,14 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
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

