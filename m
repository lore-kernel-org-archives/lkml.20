Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296708;
	b=jxffokeV9VSdT437xjU2Ckl5UsUep1PTdX8tdYEW7OY1dxaAvT2X24GQhZxY1ICECGan
	 Sh336470UyB8y+UlMx6VD2Zqo6JyTmpZA9LaaXHCBSx4oPWey08voxXtiet5FlZ9DhVyT
	 RSEjcFMyCuieYl/L66B4RncxdKiKJJt8myvTmllmroNxNZuyhEWLQ03OvN5DQt4NjH0CP
	 LwRbMPQ8Ht7rMv6BIz9S0/t01iFukcYPV71kxosueBuyb8F4k1tb6eq8UAflrx8gNcJZ1
	 VqKzlL9h2FElVii9eSa8RxS8qmgwADmnoHvWP0vgCneI+RLPahgDsql/lWHUNqhXNlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4ITdIqmG61dvK6QGLJbwRg5cuGN+2DrNLshk7y6XhhY=;
	b=ZG7XsuFlczZgXSm+7ah7aoHHPRCN6XPrBZ5f+YcSjBaY7FbEJ5HGQZNgFU0v2xy/CFl2
	 rRoGZIcLf2b2iPBt+9JnvnsTD8VbVWwyQg2MrCdEwFdoSfXw/xY3vytEETsEMG70se8pW
	 J+gPWUFLteJvBnwvvXNxNdw0ENZtux91VuFlPg0SLZcI3S3BKNz+3SYpTcZ/kY+QJYd27
	 j9HE5SXhryCF2qMKMiFWs37pX8KL0URhbJdUf9xUAiQU+cBCjFlC72r6JkOehReRRaBWi
	 38q31MbZGFYvOsL2gO2YZiyR+/dsNlhEc3DcRJj157EitNvQyrnb4dlAicSy5+yhwyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPYUPFaQ;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF460719B4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEF460719B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPYUPFaQ
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-539a57a0b1fso637463b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296707; x=1794901507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ITdIqmG61dvK6QGLJbwRg5cuGN+2DrNLshk7y6XhhY=;
        b=rPYUPFaQT4ZpY0PMiZ4bLow6Jg/tlF0As76f16ZJCBE9n5WgZadYTdp0yIzcHs/T87
         Hzxnp1IKzjNBTmfjtsI24SyAiGWTN24pWfinEPL6Uzx3xU2qJ+LUcKcfDICdHK2XOzwJ
         MedZ5/MP//RjBxKL6G8TnlYCMzeuyw9v7uuJuH9Na2+nXlV2mO3O+frkOyelzKj7hWj1
         m7nuw0pBBzfLeeGxZiDKXvvxrF9XJU8XSbfiRqbu4Tl5EJRcz1NK7yAw4dwgshtco8w0
         OIXuUvYjUV2gJuuK/I7PTnY3w7IY4vCqIFEIwp39B0qpjxniTb6NvyocANulDRbiWBaJ
         hgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296707; x=1794901507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ITdIqmG61dvK6QGLJbwRg5cuGN+2DrNLshk7y6XhhY=;
        b=M96L1se8USp8PaI1bV0Q2vd4a78YF0LKGdk4R/JOdA9noa7FXkKWc/3EyMOwqxUBML
         5f73JvDbmcaKbtXzJPaf/QTIQpXTFJmijJdP/HF32TtN8k7llo8Sl+KJyoyat27n0pxt
         E7EQkG/T+rBNLRqbjBAiEbZ3zLfgSQtjGDNh0IwEIWo5tT8nq9Y9mtDjuD4p6dPPc3LC
         1qoFDF5/PcBRkA71bHbkCWllpmQIEM6zJBZVvFdiLX6jsA9DDZVS77/16wXm8V6GEC3O
         Aj+jXOpUm5nG6xt/HyGZAGH9axSCySCLUuy0ZNocSH7/3ecSMI+d+EcfC6kEO2OzPBF4
         HU1Q==
X-Forwarded-Encrypted: i=1; AL+hErHjJy6NwT5aHq1AJr0CpKGMn/IpRJQaPDm+/Li1Tfg/mhlyC1+hCIHQxhV/0wQeVOt8M4K3s5VhDEgP3bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z97CoDxyu03hZ9qPYWXPWREQed9NYOk9nw/8FyQZbJSRxDYzCDV
	N2UVX8O7EbVIFW6BxADM5E8A3RXlgoNFseSfgNBw4VI4zyj2euKefA3d
X-Gm-Gg: AYBFou16mQA+gqB8PEL8k8LbN7hhNBLCsB4noaQOXSbb12D3/z73EVLCws5at/zTkIn
	XO1Ox7vXCB+PfcMbpFXvZEI0SjqmMgn6beFT4Se7eu+znZUeAN1PXcp9cwQgXAtVnftIGmoA0Hq
	CjlYuR23U8Ge4BQhtEClT4zKGvLZvJpNbUlR3zU/7JDGdKJMfKc9xBBKekTaPRGIBZZ2ShlfEH0
	2dEsKNvILochPtcgEqUZxP4FpBWjeNDFuu+XY882f8v0m5MziSGngoCpplC9I3z2rXDRdVBtL7H
	NLJr8jZXt+/KVrbVfDPnH/bmje/Xu9uRhWx7KbOT9PZssdvBAanfsg0ToNn+fAGpYWxuRDeK5eD
	CTUVNM1GrpL86tKajfOcYh+isNQmNVl1E7qQD3Ul0xsY9u82cOJpHhh0E6cbf4Eb6ePIQpyLWEt
	AKsOvKd6S82PkNW0pSVop7w9sHCHgUrg6/BaSh3hTm3vb8M33siT0HAda9vWInjoSoNK6LEVeI9
	pCC4qhSTgX8gMldmSiSSxeOVX2A00QQ9n7krhrefEW0fEW7oWe3m44MUJ68haZh90PLe7e8HiET
	+SAYZ5fbs/rwjewkzTmoLvnGTVLAisbr5pR9DWjzToqtl5FbwUy35xaLfzmDDsFLTsjYFWVoYUL
	RuSw121MQS9hhbWQTnu0FYqwiD0Y+CdEoFOoj1hYNfJNfIHnqJlgCCTX3UhmPWx2rRGxIn9CSm1
	AHi/VejxK3kj0H1OQanqM0KaAdk4in96AQQkuFn23szwnn7OmWADFVwN2Ugip7OIc0Oil/HFvW
X-Received: by 2002:a05:6808:168c:b0:4b2:8e1c:5920 with SMTP id 5614622812f47-5683c7b6ce2mr1421039b6e.9.1794296706536;
        Mon, 09 Nov 2026 23:45:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:44 -0700
Subject: [PATCH v2 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-41-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind previously registered chip-selects on probe failure.

Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 72 +++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 4a1f5e736a1c..eaf0279518ca 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3077,6 +3077,11 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.exec_op = brcmnand_exec_op,
 };
 
+static void brcmnand_host_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct brcmnand_host, chip));
+}
+
 static int brcmnand_init_cs(struct brcmnand_host *host,
 			    const char * const *part_probe_types)
 {
@@ -3093,8 +3098,10 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -3123,12 +3130,23 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_release(chip, brcmnand_host_release);
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
+
+	return ret;
 
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -3294,6 +3312,26 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
+static void brcmnand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct brcmnand_controller, controller));
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3345,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, brcmnand_release);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3365,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3540,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3551,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3567,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3593,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3603,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0

