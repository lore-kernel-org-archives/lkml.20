Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18928852E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231808; cv=pass; b=bO7G6cmmAFKHqDirHUb/3zDmNkjYOacv0+jltMsvII9joUjJlkdERI19bVD+GFAUoMYFjN01GPySHAVa7qsgDRVjc4YOPGKZBa9Zuuhb5LJS97/Iv1BBuL/m/ccKukBxgFlOT8UHdXLSg1+0zLZexglm6zNotMO5B4FlOD9DYyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231808; c=relaxed/simple;
	bh=JB8HJpsisCWLv5doDgd+hHz+LWUPzULEzP6qW+/RqNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NR4jywKBMIkJvzk78aGlvxCsXL07TPOircUarrUX7sLPAKZ+r/f2dZjcPoGSaVBoM5sI5/ZEc9stTDhic2pjK0I2Q4ro3kJI9qfk3LCFQvafu8EZlnAHSbeFniFN5otdEMagdqZo/ehMB7QUJFOEcBzRRSRTIHsvV8vNvLRh404=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6Bs5BuZ; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6Bs5BuZ"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6769322f226so70371d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792231805; cv=none;
        d=google.com; s=arc-20260327;
        b=MqebcX82MplAEwbHIt1cXIZ/djRf8zu8RKuEZnCl5A+NaS70KUJCebWsHjoD/X00gV
         0kYCqb9A2F+KmKMPKbgLpXe0kQ29NDjvsMVBwGzQhALCeI6GuHxftkiBaYVSetQxaQsS
         JAGDpMlIGop5AlOg8TDXQ5sBCW26BGAdtv7VvJ1UFPnb5sHFaKlByC8vZLso1ky9YCEg
         wT6lDS9bz/aoBkwyY4aUU6wPE1To7XvKAZpo1Pc+TxeSjQlzi5PoXbMzF3oyCaWzOEi0
         xNujlgUu2GjN3RZMqeB0upUvVS2ZsHsHvQXjOXDYTbp5VZDPDTK2ESjerJ6Rplbd7JEr
         kcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LAHir+lWEfmWUBWOaC0dzGX3IRymhxGQYhhLcSlFH4E=;
        fh=elRCqGi7YO4nzSGll1Jx0jR80wJrm5BoozYizRGBbsI=;
        b=Yfsb/Xt9quKoAd1CUYrFZi+CTx5Qxt2/kZkiZs/Dxu/cncjFs/2hoU8AlZ22MX+11K
         MlHz4LmvjWZVU+s5IgshsAe5xZjh690SWzToPcmGr7Y0hMeDnbYRSfDy+HwMIjo53Zce
         Jh/pLAm4wmVkaP3YBtc060GWUbcRdWaivP7vXMHspq8IrKP0XByDCQvx6aZqe9PvjUsE
         5/scziQwfhuSYIMhfS1BEw1CoHwCrTr+yRRcZfmqqUl1v+1xbiWl6UNyvZWaQMOcEhXU
         9qAti/W2DYito39YJbuNGcNG/IbORqw6S64/nibGv0I1w9X1KoO2Rmm3N+GRlUZidD1X
         6GTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231805; x=1792836605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAHir+lWEfmWUBWOaC0dzGX3IRymhxGQYhhLcSlFH4E=;
        b=T6Bs5BuZguyiM9ZzVSZPmHD0CIzwMi0Jub6zqHn5HrvIWhl3a+L2ed3HZI6eZ7ZYmK
         aSJEZgtEsh8icPzwzcHxgRQ7MmR1H6KCGIAOOceGWCb9pCvHxeZh8ByeXsA3vra27yXE
         0Csl3CXBoK0RbO9jbjXldmqXHptmcAeJxoilwL9PNSVE5Hu9ml0D6GAD2vvxOic4jMSE
         aI8PTxSG5lt/UqLewRgpJdYP9flIRAt4FdzPPeHRtxCwFo9pkSnPGJ9X7QYGcQ1Cmo+j
         YvweIRrWFiXSYkp4ytpdZ545xsr8rAvfFgaSnKrEd3scEFyD3Vy7dIBfn4a5aARuZug+
         w4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231805; x=1792836605;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LAHir+lWEfmWUBWOaC0dzGX3IRymhxGQYhhLcSlFH4E=;
        b=sGAa2q5/JdEoQZWg9hol2Z8RFzbixPuQaq2ogFIxLobSSrbnMrry4LUT5Y3nbF4vNt
         CHnXwKPVIADPeZuSBiuaxcberVn0cRb3TertPzsuvddhei+8GTfZL1nJ5Awbumx758XK
         RQkxpLgygAw+cqz6xcQRV3oK9mBXW9dIi3GRNUHwWMndTp6td36b6wXV5uKd9rGmSney
         LCLqEPIqjmHifrR1hvNzV4MVinojN2qvX27qbjBYarnVEe1XXH/R7KEZdhy1g7ZOeTk5
         ZfFaiLv6eHGWhteFvR4BxO0nn1VmcWsq5pNSHAGXMiu5fIGtgAJa6FA8JnfniHR4Nr0H
         QlmA==
X-Gm-Message-State: AFq9FYLgC8Cp9EquoHSqVk6qhtfwipiGVuXDsWdOt6Ky1ovDHLlUW9B2
	5PKkvwdW04X3IKFHLkcZYsd/OBRnS+YuxKbeIE58xijBjsiG2liArXggak+AYeHgMGwYKTP8HL3
	CWtyjnYLBCbj6Hv6zwzqGseCLA1KTNl4=
X-Gm-Gg: AYBFou1bAO+bSUi3PsyiAAbbP9O45p3cvD8ffzAFXqVgotb2neuwWcrrPzE7GfG5iRX
	Nkb0hgYnQaXI1G3sUI5eX9dgyWY5mORtaLYZNqiKU3/50qyYCnsSVbaNWaabizYGxkSu2MOejrg
	gcB3YjmQCu6qgCddFjr5mfuf9R91NqldmvC5jL8j6u9DTuNRVb0s56vLjdDhzsyItSqVfK0c5RY
	YGZkF5kxX1djQd3xj1XAkUin6Rr1j+zLTwqGikq5lmM6Vm9fgP4zew+A9Kbz0zexTwuISeYpy5E
	YRbxqodNke2ZeuoYFkR+6iooJab2pWTA5l7bQ4eydFiKVF417hhO/KfYtzSiyVNd1OTSoaQMBtV
	qVuDv83CVpX4qgBbcHMh0V1IzIqMPOcr5iHsiuCJfVLfce2qek3Uud6qZfRuiTRlY+zfLYKixbi
	KCl291
X-Received: by 2002:a05:690e:b8d:b0:677:d357:badc with SMTP id
 956f58d0204a3-679ca6e8f76mr962055d50.3.1792231805152; Sat, 17 Oct 2026
 03:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Reid D <skibletz@gmail.com>
Date: Sat, 17 Oct 2026 06:09:54 -0400
X-Gm-Features: AclHuK_AxkM8xHoPwHOqg6-enrVTogs2b-lIgbQWzseVs0NEVEg1O2cyZmcpAYw
Message-ID: <CAGNJ+_1hAM8=bwnRzxTOtvmthAeqpX3Rg=yyabh+Kme7kb3f3A@mail.gmail.com>
Subject: [PATCH] memory: fsl_ifc: fix stale global pointer on probe failure/remove
To: krzk@kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

memory: fsl_ifc: fix stale global pointer on probe failure/remove

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
diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index e89e0c6..ff52cae 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -88,8 +88,11 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
 {
     struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);

+    fsl_ifc_ctrl_dev = NULL;
+
     of_platform_depopulate(&dev->dev);
-    free_irq(ctrl->nand_irq, ctrl);
+    if (ctrl->nand_irq)
+        free_irq(ctrl->nand_irq, ctrl);
     free_irq(ctrl->irq, ctrl);

     irq_dispose_mapping(ctrl->nand_irq);
@@ -201,85 +204,82 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
  */
 static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 {
+    struct fsl_ifc_ctrl *ctrl;
     int ret = 0;
     int version, banks;
     void __iomem *addr;

     dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");

-    fsl_ifc_ctrl_dev = devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl_dev),
-                    GFP_KERNEL);
-    if (!fsl_ifc_ctrl_dev)
+    ctrl = devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
+    if (!ctrl)
         return -ENOMEM;

-    dev_set_drvdata(&dev->dev, fsl_ifc_ctrl_dev);
+    dev_set_drvdata(&dev->dev, ctrl);

     /* IOMAP the entire IFC region */
-    fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);
-    if (!fsl_ifc_ctrl_dev->gregs) {
+    ctrl->gregs = of_iomap(dev->dev.of_node, 0);
+    if (!ctrl->gregs) {
         dev_err(&dev->dev, "failed to get memory region\n");
         return -ENODEV;
     }

     if (of_property_read_bool(dev->dev.of_node, "little-endian")) {
-        fsl_ifc_ctrl_dev->little_endian = true;
+        ctrl->little_endian = true;
         dev_dbg(&dev->dev, "IFC REGISTERS are LITTLE endian\n");
     } else {
-        fsl_ifc_ctrl_dev->little_endian = false;
+        ctrl->little_endian = false;
         dev_dbg(&dev->dev, "IFC REGISTERS are BIG endian\n");
     }

-    version = ifc_in32(&fsl_ifc_ctrl_dev->gregs->ifc_rev) &
-            FSL_IFC_VERSION_MASK;
+    version = ifc_in32(&ctrl->gregs->ifc_rev) & FSL_IFC_VERSION_MASK;

     banks = (version == FSL_IFC_VERSION_1_0_0) ? 4 : 8;
     dev_info(&dev->dev, "IFC version %d.%d, %d banks\n",
         version >> 24, (version >> 16) & 0xf, banks);

-    fsl_ifc_ctrl_dev->version = version;
-    fsl_ifc_ctrl_dev->banks = banks;
+    ctrl->version = version;
+    ctrl->banks = banks;

-    addr = fsl_ifc_ctrl_dev->gregs;
+    addr = ctrl->gregs;
     if (version >= FSL_IFC_VERSION_2_0_0)
         addr += PGOFFSET_64K;
     else
         addr += PGOFFSET_4K;
-    fsl_ifc_ctrl_dev->rregs = addr;
+    ctrl->rregs = addr;

     /* get the Controller level irq */
-    fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-    if (fsl_ifc_ctrl_dev->irq == 0) {
+    ctrl->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
+    if (ctrl->irq == 0) {
         dev_err(&dev->dev, "failed to get irq resource for IFC\n");
         ret = -ENODEV;
         goto err;
     }

     /* get the nand machine irq */
-    fsl_ifc_ctrl_dev->nand_irq =
-            irq_of_parse_and_map(dev->dev.of_node, 1);
+    ctrl->nand_irq = irq_of_parse_and_map(dev->dev.of_node, 1);

-    fsl_ifc_ctrl_dev->dev = &dev->dev;
+    ctrl->dev = &dev->dev;

-    ret = fsl_ifc_ctrl_init(fsl_ifc_ctrl_dev);
+    ret = fsl_ifc_ctrl_init(ctrl);
     if (ret < 0)
         goto err_unmap_nandirq;

-    init_waitqueue_head(&fsl_ifc_ctrl_dev->nand_wait);
+    init_waitqueue_head(&ctrl->nand_wait);

-    ret = request_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
-              "fsl-ifc", fsl_ifc_ctrl_dev);
+    ret = request_irq(ctrl->irq, fsl_ifc_ctrl_irq, IRQF_SHARED,
+              "fsl-ifc", ctrl);
     if (ret != 0) {
-        dev_err(&dev->dev, "failed to install irq (%d)\n",
-            fsl_ifc_ctrl_dev->irq);
+        dev_err(&dev->dev, "failed to install irq (%d)\n", ctrl->irq);
         goto err_unmap_nandirq;
     }

-    if (fsl_ifc_ctrl_dev->nand_irq) {
-        ret = request_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_nand_irq,
-                0, "fsl-ifc-nand", fsl_ifc_ctrl_dev);
+    if (ctrl->nand_irq) {
+        ret = request_irq(ctrl->nand_irq, fsl_ifc_nand_irq,
+                0, "fsl-ifc-nand", ctrl);
         if (ret != 0) {
             dev_err(&dev->dev, "failed to install irq (%d)\n",
-                fsl_ifc_ctrl_dev->nand_irq);
+                ctrl->nand_irq);
             goto err_free_irq;
         }
     }
@@ -289,17 +289,21 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
     if (ret)
         goto err_free_nandirq;

+    /* Only publish the global once probe has fully succeeded. */
+    fsl_ifc_ctrl_dev = ctrl;
+
     return 0;

 err_free_nandirq:
-    free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
+    if (ctrl->nand_irq)
+        free_irq(ctrl->nand_irq, ctrl);
 err_free_irq:
-    free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
+    free_irq(ctrl->irq, ctrl);
 err_unmap_nandirq:
-    irq_dispose_mapping(fsl_ifc_ctrl_dev->nand_irq);
-    irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
+    irq_dispose_mapping(ctrl->nand_irq);
+    irq_dispose_mapping(ctrl->irq);
 err:
-    iounmap(fsl_ifc_ctrl_dev->gregs);
+    iounmap(ctrl->gregs);
     return ret;
 }
