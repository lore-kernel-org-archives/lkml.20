Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007847B43F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240360; cv=none; b=aGJV0xrDkLe+zbhrYqFE/DSbKQZt1uaVBFHY6gwGI8OOEKebgO1SXH8001Um8sj4SvGBDf/PEAsPDeo7NakUT+eCEmODeEPGhRWa1q27OlI7tsvfUwPdZDoDLEDgt5NOaXUlzs+tfQBJVHXvjkGGZALYr9t0V3LdRbkxCjGlu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240360; c=relaxed/simple;
	bh=MVDg6heCaoD/DZvcXr/Fgow4fDzqYEbNs3IMvtWRxe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msBhUtit1gFCq/V9idQNn7UtM7PFGDFGEL+wysJV60D11rbZFL5+ceCTHmexcv3DtVZcWqZgZ3jFUZS3oiO8u6Gc4NdB5zvi3gUlcrHZzrqHlzC8a8kd4VFAc0GyPDHfcibyUjrSLh2BcGKbEHjjLKm1B+hJuyQovR8Fydz9A4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0XnZ23y; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0XnZ23y"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309ce58730so13401001cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240356; x=1789845156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVFk+dJpAVuL1BqlzjfuC680+HsicXDkJSDggWI8BGI=;
        b=M0XnZ23yf7WiGPaTcWUQPvTwXUEkH7SucknTKI6aZdQL+ET4A+cusO1FA0itzAXIbW
         qtByB6eEhycSN7f6ABiIUSi52FpbuN5ZKLCm5k0TNYjGZNeMvFtl/2wGXOxKoljWhz7i
         horP3IMKMMkR/MPQMjspueUHc29E1vKiy0McgCrSaXz/pfljICnoQ8RMftpwkgSw5YH9
         yhVSVWj0W5sWJfo6bmAPzPCwFkyhySQ6RSirs89WfQ6pIGRMGQGYSBDKdLJa5w9cDozR
         2mtHl8PT/2dIrZFl3dMWbYzP90dKcfZknfN0GXo9y/LUcsrMHEIlwAR+Rv5ZCytCNksb
         kPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240356; x=1789845156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVFk+dJpAVuL1BqlzjfuC680+HsicXDkJSDggWI8BGI=;
        b=UBXggfIHlVqjnyKpOYAbfUK+Z7LoZCsvcgcaAqOSTe3eRqRLw6T7P2fBpMXrJfLuVK
         sFC7eyKrFTtgsduIbLfS1Vr4uPDabJBouSUw6fFFPpBuXxC4bUHLUEWXJl0Nzu6+OewP
         ZdDie4nGY3CoZPJmy0tm3dzPci7avKgJ5sQzmWcoOZErSehSvxrT7LwhZwyHSlLLk4kB
         UuRrUXkSol+Noa7fS0hFHl7LCnvH3LBaB4OSdKs/YkjUtK4/VCjSBbgRnzwPeLrfCSPg
         F7Pildj2CNoQlT7bJZMPH734UKsGIkX9bpS7a4Urvkmuso3cS0zwNaIT2jiXT3w2ezvz
         Ifvg==
X-Forwarded-Encrypted: i=1; AKwUvBxo/7zNc9kmKFPQHGL6rxZtkSBsWK45uzgLNLytrrEvicFmQJ9oQ2T8HQG4lIw5pmuTtY0I3qR6c2KmkFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nQWE0HrEQZcseGPr1NBBQ72r26+Gi+1MrmKlpVzgwkIphBmSZt
	XUoyDKPgkngUo7cEiYRahNBoCke1R7kebQa4l3mkhDtnHD8FnptlTfg=
X-Gm-Gg: AYBFou0BoOVlNs7jrsYWRSrnNELjFFxQ5oXZsjaX8zGa8pm4pWDwp53jjqe7Fsd2ATl
	Gc5qzKLPmL/saUGja5AHK4c334n5U3H8sS/dqIj21AN5g08w8rpypH0c5On+kVsAopUO1XoWoIS
	LqOPps4wu/fbABhsWxrqhfRK/Y57XNVqlRZwP34g8/W9vkMtJQopQtCh0+3KPxKMWfw2Eou/2O0
	1+Eu2zxidJ2CE81il+uo3cd+GCHMCko3C9NerZ7L/klLJqSdVJkJkKHMxmxT312nI3iWGxqoyU3
	qAzBTYU1B0xldSvJRuzLceKikdJ8bdrCI6zUdf6mgVy7AVBRPf8f0HgKCYzzajnXszWZdZFCZaI
	hqfs05c9/Qktq5jhxNaxcoPYV75Yaenb1ohsChVZBbYjYm7SlSN9XXe+QxUHmsCEGx3joFkXoOD
	CQY8+4WV2itlaTooRIMXHK/MD5iJ791YpHAaQmu1UW12IeNqTjf9wJrH4wlo8GC+2xxxNQexRE+
	ak09gOGsJiHfMY5RAAKom4byXJg4gJ+0kSUljy9ZiapdUnFJxh1cWAwTBz+z24uogAYDA2X7s7w
	SO1AIbgZOHlIZMTc4W7DPMzgL1m9FjiGxQ==
X-Received: by 2002:a05:622a:4116:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530e819aa1dmr60250491cf.34.1789240356210;
        Sat, 12 Sep 2026 12:12:36 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49661asm52023006d6.30.2026.09.12.12.12.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:12:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: intel_quark_i2c_gpio: manage the fixed-rate clock
Date: Sat, 12 Sep 2026 15:12:23 -0400
Message-ID: <20260912191223.46136-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C clock is allocated by clk_register_fixed_rate(), but cleanup uses
clk_unregister(), leaving the fixed-rate provider allocation behind.

Manage the provider with devm_clk_hw_register_fixed_rate() and its lookup
with devm_clk_hw_register_clkdev(). Managed resources release the lookup
before the provider, after the MFD children have been removed.

Remove the manual clock cleanup and the private structure that only
stored the clock and lookup pointers.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 60ae5b9f5cdd ("mfd: intel_quark_i2c_gpio: Add Intel Quark X1000 I2C-GPIO MFD Driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/intel_quark_i2c_gpio.c | 52 +++++---------------------------------
 1 file changed, 6 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 9b9c76bd067b8198553013af70c9123e33fb9041..443a1a0cf7778d400b40e0c75439e3c7235f8ec5 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -35,11 +35,6 @@
 /* The Quark I2C controller source clock */
 #define INTEL_QUARK_I2C_CLK_HZ	33000000
 
-struct intel_quark_mfd {
-	struct clk		*i2c_clk;
-	struct clk_lookup	*i2c_clk_lookup;
-};
-
 static const struct property_entry intel_quark_i2c_controller_standard_properties[] = {
 	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_STANDARD_MODE_FREQ),
 	{ }
@@ -160,37 +155,12 @@ MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
 static int intel_quark_register_i2c_clk(struct device *dev)
 {
-	struct intel_quark_mfd *quark_mfd = dev_get_drvdata(dev);
-	struct clk *i2c_clk;
-
-	i2c_clk = clk_register_fixed_rate(dev,
-					  INTEL_QUARK_I2C_CONTROLLER_CLK, NULL,
-					  0, INTEL_QUARK_I2C_CLK_HZ);
-	if (IS_ERR(i2c_clk))
-		return PTR_ERR(i2c_clk);
-
-	quark_mfd->i2c_clk = i2c_clk;
-	quark_mfd->i2c_clk_lookup = clkdev_create(i2c_clk, NULL,
-						INTEL_QUARK_I2C_CONTROLLER_CLK);
-
-	if (!quark_mfd->i2c_clk_lookup) {
-		clk_unregister(quark_mfd->i2c_clk);
-		dev_err(dev, "Fixed clk register failed\n");
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void intel_quark_unregister_i2c_clk(struct device *dev)
-{
-	struct intel_quark_mfd *quark_mfd = dev_get_drvdata(dev);
-
-	if (!quark_mfd->i2c_clk_lookup)
-		return;
+	struct clk_hw *hw;
 
-	clkdev_drop(quark_mfd->i2c_clk_lookup);
-	clk_unregister(quark_mfd->i2c_clk);
+	hw = devm_clk_hw_register_fixed_rate(dev, INTEL_QUARK_I2C_CONTROLLER_CLK,
+					     NULL, 0, INTEL_QUARK_I2C_CLK_HZ);
+	return devm_clk_hw_register_clkdev(dev, hw, NULL,
+					 INTEL_QUARK_I2C_CONTROLLER_CLK);
 }
 
 static int intel_quark_i2c_setup(struct pci_dev *pdev)
@@ -238,19 +208,12 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev)
 static int intel_quark_mfd_probe(struct pci_dev *pdev,
 				 const struct pci_device_id *id)
 {
-	struct intel_quark_mfd *quark_mfd;
 	int ret;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
-	quark_mfd = devm_kzalloc(&pdev->dev, sizeof(*quark_mfd), GFP_KERNEL);
-	if (!quark_mfd)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, quark_mfd);
-
 	ret = intel_quark_register_i2c_clk(&pdev->dev);
 	if (ret)
 		return ret;
@@ -260,7 +223,7 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 	/* This driver only requires 1 IRQ vector */
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
-		goto err_unregister_i2c_clk;
+		return ret;
 
 	ret = intel_quark_i2c_setup(pdev);
 	if (ret)
@@ -282,8 +245,6 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 	software_node_unregister_node_group(intel_quark_gpio_node_group);
 err_free_irq_vectors:
 	pci_free_irq_vectors(pdev);
-err_unregister_i2c_clk:
-	intel_quark_unregister_i2c_clk(&pdev->dev);
 	return ret;
 }
 
@@ -292,7 +253,6 @@ static void intel_quark_mfd_remove(struct pci_dev *pdev)
 	mfd_remove_devices(&pdev->dev);
 	software_node_unregister_node_group(intel_quark_gpio_node_group);
 	pci_free_irq_vectors(pdev);
-	intel_quark_unregister_i2c_clk(&pdev->dev);
 }
 
 static struct pci_driver intel_quark_mfd_driver = {
-- 
2.53.0
