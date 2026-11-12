Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446931;
	b=YIv/Dt4Gp2OI2yrhjFyMcPIj5YRHKLGJWZemMdLc/fbSnANqQVIdLUEfPBeCpiE3D4aa
	 uWR5lCtFMERzM/mKTvvpTU/uf4QUuiv31v7L3/HM6QBfEQapxTCXmiXRfvRhdwsOk4u6w
	 PwSVliDsWCLgpPVlTfZfaezCyNqYjghBeanjo3TzgxKR2smaNP8tBuOc4K3OqM+S6xN58
	 /rP0fkKmtCbptGP/Ma/ciydP0KfEHWCjpMbQ2fzZBa0Fi2ES714cYfZgI++1rKWh8WNdU
	 KvqP56nBau4NWW32HSZwGhhEDWiO2JJFVPcWRVdUqjoy0EnURgzP9IZSQwJiM6D5DwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
	b=1RhM7JvRJcwojbCVJbMK1u0SM5+WKq7jyn5hXpWg7yayJeJmB+OuBMCiigCo/F/xRxQ+
	 RhaVYwrsUr3T/lc6NdlgyRH6YAB8maTVdEoydLzhFsGutzttVf4ERl56VTSsjVTbmsXkf
	 qTO5AcDGNlV5IxeuhqXYfUUzlKFuqcZ7jfb6WZfDscTEsQx8pVW46bg+pT78C7cYH2pCw
	 /tIcuHekNH1pcmTt2UfQ6y56BazlDfTfUa+CQs3RnkZ7QnFz+RqrF5zhdTxkKPswt/2IS
	 /yNXIe/clI/fngrYWV42Wf35n9XaWjj/8nJeeGgd70OXzPyrz/+R07O05JDkIBpJ4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmLsFEHg;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403F606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D403F606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmLsFEHg
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1575033fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446930; x=1795051730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=RmLsFEHgd6mtiB/ehqaSpkNYvhKoRBV2CzqioT9fFIH0rph86XyW0s3mAWZFO3qLtq
         0INJ4ExvZa4ztNgkU+0Rrd2epqrePkmaxpcWgqDNDv6JBJz3wIOMxDWdOLb7czdEoLAV
         MTf9gtcSbbolPqtyIAQaZYrufW6N4dac9hTRRwBOFAkpNCvCnAMjWOIktTTE1K5ssxv6
         c1uGXduS8vEe9/cMbr5h1ckGPIbH+EBRLBbxa6DGKHv8q85Vs33SxYcS7n27fCLnyiej
         rb2MRwaBLB7AB9Rm2Bf2nhDHvg3QJiid/7jMs3pHcwDcsvTy3xmX8J5eV/t9qiQdqMp1
         I7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446930; x=1795051730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkGAF3rvqZpMpEv+A0EsfbrHuzz+MIXvk9S9duAZxjo=;
        b=xEOXXIhaLyZLMHz4jEp42d5QFPhTEbNd4Jo5TjcFvSc/2H9BIv3kQjeHollIMKZDvA
         fhxl6exihP5Wc9/TOJbveAF5+62BAzcDTBAnUW44/Ub9jEp2XfHekRMv8gvYleh5mL2C
         ggb/jPFPI5xDx3NKTDa8CKnXYTmeUxX6wznM/7upLh83obx2gfYpDTIzZ6ZhtKrU1DIQ
         MxBKY7tOeTwJwwr3UEP3GDHrHIPa8SHkaPC6if4F0GkgDQGW3dRJcAPUlKQwLko+SuIQ
         mfyJFEmqDkxcC6BJ9wUcKAj3zmLb+bx2R57IJy/4INhqNUKHLWJl6bm7v1ozJiKQPq1o
         Xz+w==
X-Forwarded-Encrypted: i=1; AL+hErE2qFtxtr8sHyrw2We+Sl2vmUDa7T00hXcgtlsfhXEqxBr0/w2L5fl83vwY2EbyEFyjQcM2Q+7nQ2MLoFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RLiydaGBaM+nyUbR9hmYK6gINDb6sIdBhOAh4SNcF304nZRvv
	rpt1KAXWH6XECGnk6HE6utl+zav8/Rhy5qjWpM/8jJrEJbH5ZClB1mSz
X-Gm-Gg: AYBFou07xaHbAFw0G53l/OyddGITTp5Gyd75ykYOi6lwHjYq/rgNIip23VtUvIJwDMP
	swkxTUH1yrn2rUrrGCAYCI46ROiNSvmJtCiL21pZfF2REytEs6UELebC7oUDRaJRqewS4sjrz3Q
	vvNAqdMeyKAW1p4QlQLAArX4iqmAvnOcG5xjitGXHJ5ZVUEGQ+xW9oTG1KA05SblHsMB5BWpgNi
	2gy5iOYsmR2aMVWuWwyG7CYEMPksAj98wg70ooIOrXLWqBYtMk5l8XR2JahNzB1ugl5nLSweIok
	AAXrY7WaofbFWnEYmzxEz07g7oud5ZUeX5NEX0gaNAT1400NUXenEf/ql1wfvaHzjIhxSKvxMpb
	4u3WXUju6Ytackq1VR3KXLn4/vBTvK+aucGSjkjmltdUcJ+VKJh0WwuHM0Qq2c6T+WgAMZ7n+I/
	x71mlpnziI6Ud/2a3j8RV2V3v3qMoLM3QJKSMk++Uv8jbRkl1FA8ePdr9KIPf9/wwlhq6Zwo1Jd
	f2v/7CjppYFShjnlGVdUHDa1ErlVn5UlVapiWN6muZWtjXBg74uKuM1CZjTOVLJY2vcHuMYAoll
	Zwe7Kc9X0XETtmD3q2i6EgW0HhsdY+CbpwtW2QNmKWCaD5TJjd7M/Bx3P65u6jxuFnn1ulSZmNv
	gDlUCQaTOmMFSfQa+3zhcvkyfRNznlMnEzCJtxY7Sko5AYL7UahKUbZyDblXKfoWfw82K0bbCRf
	zvo4nc+InCBM/D/lhw4PKi+zD8DkBolpILPYYFDvq8g0/Mo5xB4T1a
X-Received: by 2002:a05:6808:6d8c:b0:4fb:6402:a8ca with SMTP id 5614622812f47-56b961927aamr4201294b6e.21.1794446925119;
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:54 -0700
Subject: [PATCH v3 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-15-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

