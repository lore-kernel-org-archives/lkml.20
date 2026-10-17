Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30B37A846
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232694; cv=none; b=A/OsxeBZffDeQmqSqB9IfbTd64JUw9CPxy5SW0+T0Z+QXWpLCttqOTE1jgzcplBZldQLZhEIplVou0CzUdvnnqtPXTtWg73sLKA+lfh3I/mnx0j0yPoDihS7edayPXzjZC//Guyyz92GXGG9/j/TdkW554nthZWoKuMVdInbE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232694; c=relaxed/simple;
	bh=vOM2H/NJnL+CAv+nlktLBiaHPd2kPCFe+NS5aEZzER0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+Iwt2RveHu0TSdH5VKp6uq3fJGKZEmrCDGfbSgOseHpuHFoWaT3Kux82nlvYcdTTpSXBvSUCKeUzxLS8z8q8d5K0AUJ1tazgFQZ1YVjpRMRCNy4nw4cmOQSssPwSTmNrYYGtwSOvxuzRBMOK4Pe+L8+Z5lpNIKd7TYVLxHibyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOb2Y57b; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOb2Y57b"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0ca86a515so1155127b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792232692; x=1792837492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ba1/mAuwmoq/Sld7kzJYFTfzWs9IZjyycVOMZuRwppk=;
        b=HOb2Y57bQDhnRGhWyYRziCKcDTEXeJbB7/bCpsI+/Zty/MV29a8QaPgl6epauOZDz8
         r2Bnn7BOv9fuI4YlxvcoU2Wr3Zn0408JvKOTPfkODi4e7Jy65I7V0NJUbg1A29gLclyB
         F5hmCG5DSaHRCVLBKc+eq7xNNA7wTe72lLB02ANmf57ulbpsm3gazuG5D8Z407rsHYI1
         plm1TB5qGp5zmaSzlbHbycA5FM94KJFWg5Aqm6HBRbUCdCxeXvuXc5BTAALyLyNRr1hq
         QnoNZgf8zTJfls6V+vDHjsOi/G0CHj25Sn+s7LrN3sFVtDV2CjYYCDVfpl91tgl5G69N
         THPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792232692; x=1792837492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba1/mAuwmoq/Sld7kzJYFTfzWs9IZjyycVOMZuRwppk=;
        b=cxGyKlm6eV6MAjqguhR+BlwrHs8MV9lp0cMRm1Mua1EhGqWpQgDqKq+NYZwMLy3RFL
         mQbco4NVziBoyASI1DHKJfKegeJ6jAPYRDe9d/VrgqGnN1CH1ZyYmdRWN75x/hQiVf8g
         s+2Duq5w0jFZazjBlhL6/yJKJv/dYASyy+X6UaoVLoa751niRRm621eMTzr2vVLMCAng
         Xk8/kuWN0HKUR1MNVRx6tVXPpVjpBrzXAZwfEqAueuJThHDFgBlXPzz5cv11rJkphH6s
         HB6Bib4QR2jrWJSjnFX63mfbC49lI/LYEAoFRYHYvBPqPTLRvdRRSjO9x/HF9X0FrVxf
         9OqA==
X-Gm-Message-State: AFq9FYLGB0DEfu7CTP6S6QU+4Ebn+YG6zuhdxCf8AALVgGUN5BGP3Hwp
	C+Q1MPnM2BUY77Dc1S0G/TNLnFwcI9/EjCSvuQvxDvhEHJnJ4xuDMDnJ
X-Gm-Gg: AYBFou3GzgLPn4jHiraM+9LZHDq2AN821PnJqw4ETEf/LPYLUoSSuQ/MKDCo9GQsNgU
	KOOYvuCao2B6NsamCsslsDQDPEuhN9oo9SULufczoQxg8Ntn4D/zd0w3OAoJ5EmSBfiM8tLNeZ9
	8VA8Th27ImEP9Iy8M8s431heUpksiyYvImgwyJ9hn6cn68B8NyTQRheOPxTOTUZLj11hk1DDOX6
	nzrhXT9nLruZvl07ecXLzTFmEM0zMCjsawAf1eY9hP5yWb5/78Lw9gl7CyGyklhdwb78jF4udUb
	KFdm8pjvmX8qa0qeaXz7fpVpLhclq4B0KHNB1A8L4LEMZ6VyCsNWnFWIskHTl/rjr+IyLaL9pAH
	AtHJh38PnhF04JNO3pJwkVIIAXk3b0ogaLtUO1N1CJwcKzCyVMImY9lgftiBzwEYx54kUiBXppS
	ApyTxZglUfl80eIFLOi+NY8ybfuvC87TgCvnC9bAiC5x4b+OgE2dNQr3yChcR1LZkUfgz2xfoec
	hNJ9qcTUlVfvkJGxtaEyhKM7gRHlP8DVYluiq4RuAyysNNYrA==
X-Received: by 2002:a05:690c:88d:b0:863:29e8:a9bc with SMTP id 00721157ae682-8b0f20efd36mr14201667b3.2.1792232692102;
        Sat, 17 Oct 2026 03:24:52 -0700 (PDT)
Received: from tacolabs ([2601:6c1:600:2d04:9a67:b878:84a5:77e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590b586sm18917237b3.31.2026.10.17.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:24:50 -0700 (PDT)
From: "Reid Downing (b1nv0id)" <skibletz@gmail.com>
To: krzk@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Reid Downing <skibletz@gmail.com>
Subject: [PATCH] memory: fsl_ifc: fix stale global pointer on probe failure/remove
Date: Sat, 17 Oct 2026 06:24:23 -0400
Message-ID: <20261017102423.1840590-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_ifc_ctrl_dev is a global pointer. It was set at the start of
fsl_ifc_ctrl_probe(), before anything could fail. If probe failed
partway through, or the device was later removed, the global was
never cleared. fsl_ifc_find() only checks it for non-NULL, so it
could end up dereferencing freed memory or an unmapped register
region.

Use a local variable while setting up the controller struct in
probe, and only publish it to the global once probe has fully
succeeded. Clear the global as the first step of remove, before
any teardown runs. Also guard the free_irq() of the optional
nand_irq, which may be zero.

Signed-off-by: Reid Downing (b1nv0id) <skibletz@gmail.com>
---
diff --git a/fsl_ifc.c b/fsl_ifc.c
index e89e0c6..ff52cae 100644
--- a/fsl_ifc.c
+++ b/fsl_ifc.c
@@ -88,8 +88,11 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
 {
 	struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);
 
+	fsl_ifc_ctrl_dev = NULL;
+
 	of_platform_depopulate(&dev->dev);
-	free_irq(ctrl->nand_irq, ctrl);
+	if (ctrl->nand_irq)
+		free_irq(ctrl->nand_irq, ctrl);
 	free_irq(ctrl->irq, ctrl);
 
 	irq_dispose_mapping(ctrl->nand_irq);
@@ -201,85 +204,82 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
  */
 static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 {
+	struct fsl_ifc_ctrl *ctrl;
 	int ret = 0;
 	int version, banks;
 	void __iomem *addr;
 
 	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
 
-	fsl_ifc_ctrl_dev = devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl_dev),
-					GFP_KERNEL);
-	if (!fsl_ifc_ctrl_dev)
+	ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
 		return -ENOMEM;
 
-	dev_set_drvdata(&dev->dev, fsl_ifc_ctrl_dev);
+	dev_set_drvdata(&dev->dev, ctrl);
 
 	/* IOMAP the entire IFC region */
-	fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);
-	if (!fsl_ifc_ctrl_dev->gregs) {
+	ctrl->gregs = of_iomap(dev->dev.of_node, 0);
+	if (!ctrl->gregs) {
 		dev_err(&dev->dev, "failed to get memory region\n");
 		return -ENODEV;
 	}
 
 	if (of_property_read_bool(dev->dev.of_node, "little-endian")) {
-		fsl_ifc_ctrl_dev->little_endian = true;
+		ctrl->little_endian = true;
 		dev_dbg(&dev->dev, "IFC REGISTERS are LITTLE endian\n");
 	} else {
-		fsl_ifc_ctrl_dev->little_endian = false;
+		ctrl->little_endian = false;
 		dev_dbg(&dev->dev, "IFC REGISTERS are BIG endian\n");
 	}
 
-	version = ifc_in32(&fsl_ifc_ctrl_dev->gregs->ifc_rev) &
-			FSL_IFC_VERSION_MASK;
+	version = ifc_in32(&ctrl->gregs->ifc_rev) & FSL_IFC_VERSION_MASK;
 
 	banks = (version == FSL_IFC_VERSION_1_0_0) ? 4 : 8;
 	dev_info(&dev->dev, "IFC version %d.%d, %d banks\n",
 		version >> 24, (version >> 16) & 0xf, banks);
 
-	fsl_ifc_ctrl_dev->version = version;
-	fsl_ifc_ctrl_dev->banks = banks;
+	ctrl->version = version;
+	ctrl->banks = banks;
 
-	addr = fsl_ifc_ctrl_dev->gregs;
+	addr = ctrl->gregs;
 	if (version >= FSL_IFC_VERSION_2_0_0)
 		addr += PGOFFSET_64K;
 	else
 		addr += PGOFFSET_4K;
-	fsl_ifc_ctrl_dev->rregs = addr;
+	ctrl->rregs = addr;
 
 	/* get the Controller level irq */
-	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-	if (fsl_ifc_ctrl_dev->irq == 0) {
+	ctrl->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
+	if (ctrl->irq == 0) {
 		dev_err(&dev->dev, "failed to get irq resource for IFC\n");
 		ret = -ENODEV;
 		goto err;
 	}
 
 	/* get the nand machine irq */
-	fsl_ifc_ctrl_dev->nand_irq =
-			irq_of_parse_and_map(dev->dev.of_node, 1);
+	ctrl->nand_irq = irq_of_parse_and_map(dev->dev.of_node, 1);
 
-	fsl_ifc_ctrl_dev->dev = &dev->dev;
+	ctrl->dev = &dev->dev;
 
-	ret = fsl_ifc_ctrl_init(fsl_ifc_ctrl_dev);
+	ret = fsl_ifc_ctrl_init(ctrl);
 	if (ret < 0)
 		goto err_unmap_nandirq;
 
-	init_waitqueue_head(&fsl_ifc_ctrl_dev->nand_wait);
+	init_waitqueue_head(&ctrl->nand_wait);
 
-	ret = request_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
-			  "fsl-ifc", fsl_ifc_ctrl_dev);
+	ret = request_irq(ctrl->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
+			  "fsl-ifc", ctrl);
 	if (ret != 0) {
-		dev_err(&dev->dev, "failed to install irq (%d)\n",
-			fsl_ifc_ctrl_dev->irq);
+		dev_err(&dev->dev, "failed to install irq (%d)\n", ctrl->irq);
 		goto err_unmap_nandirq;
 	}
 
-	if (fsl_ifc_ctrl_dev->nand_irq) {
-		ret = request_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_nand_irq,
-				0, "fsl-ifc-nand", fsl_ifc_ctrl_dev);
+	if (ctrl->nand_irq) {
+		ret = request_irq(ctrl->nand_irq, fsl_ifc_nand_irq,
+				0, "fsl-ifc-nand", ctrl);
 		if (ret != 0) {
 			dev_err(&dev->dev, "failed to install irq (%d)\n",
-				fsl_ifc_ctrl_dev->nand_irq);
+				ctrl->nand_irq);
 			goto err_free_irq;
 		}
 	}
@@ -289,17 +289,21 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	if (ret)
 		goto err_free_nandirq;
 
+	/* Only publish the global once probe has fully succeeded. */
+	fsl_ifc_ctrl_dev = ctrl;
+
 	return 0;
 
 err_free_nandirq:
-	free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
+	if (ctrl->nand_irq)
+		free_irq(ctrl->nand_irq, ctrl);
 err_free_irq:
-	free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
+	free_irq(ctrl->irq, ctrl);
 err_unmap_nandirq:
-	irq_dispose_mapping(fsl_ifc_ctrl_dev->nand_irq);
-	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
+	irq_dispose_mapping(ctrl->nand_irq);
+	irq_dispose_mapping(ctrl->irq);
 err:
-	iounmap(fsl_ifc_ctrl_dev->gregs);
+	iounmap(ctrl->gregs);
 	return ret;
 }
 
-- 
2.43.0
