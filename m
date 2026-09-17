Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E334E36FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673943; cv=pass; b=XzIk/xi1VSuqAk9toGVm/3xz9S0x+svRQsSDcZz8qR46+rk4Qfc4rqm3Na8dhMEDcYoa73qNoKmZVDszI9EQca66CKt8Ve2IZbpcy1IUS2mbctu4stioBkG5VtZFz0JU4eml1E/9XAoK0IY+/6xDAcB1UUYljiiMPzszpFjJEFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673943; c=relaxed/simple;
	bh=+JojRhYj4z2/5FlQFeoDBjlhoDkwm7cc/v/3Femf6qc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rJOdo8PGLdDgmm13hn4Kwz1yAMMWNbLlBy1IvFfSr/P1LvOL3+9ReGjxmnnUq/X2FSQT7OnFHU0dIWSqf+U79gNeKC9OLyYwHW1v+5SIqRHQEA4UZAYWovG+tJWzOpTb3fkL+jHwM6MYF44N6tpRTQtbW8pcttBT9B22WGPcDy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmSOc+kR; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmSOc+kR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so86899866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789673939; cv=none;
        d=google.com; s=arc-20260327;
        b=Yme9Dx41OMbuQoFBnLc4B2moRuW639lvGY7RsB9I1mr39u/AJDOG/LzYdd6ranzc8Z
         xTziTa6ZpoM66J5YLAmu/3EBwPU8oKuuDAESLBgE5AoHakuPO5/vP5fg2/mjG/ZEnNvR
         4ZklLwDPplAdGxXHi650feYjb7eAdcqM4sXBCroYxJWxJRktM0FhRyOhEUP3x9OBFjyB
         sTkPnrCV4K/isIUe8n7l/bk2qctBOWIp7YSAHFTcg609AVJya5p0kj41CBVmeAua9DY9
         yeyYx9e4UwukjpFndD0rhF7lJ/7Yj0DdLkoXJRuxcsS1XBGwWVWzHP80sST6Zb8CY9fZ
         FJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        fh=LhqEQKoglrzGQljkG/z2dWj1qxaLiXVH1uvMGzd6tMg=;
        b=EkZxGjZ/I4AOmYppeiuQi4MsHdopKbdXJIACjE4QK5KRA/Xtf3XXVN4/7ogpBzWUR3
         kZsi/pwv2GstFRMgX8hj4kvKg+FRkfAWX+7RXYAXw85lEIR4RmNsUsQsLnvSbcsBto7j
         17+nRXzRTYtSYyYG4OiAKbX1qPkicvMno3Z39fZuqsjs2Qgsz8eanIHfh4hYf+9CtKRQ
         WGXK1AMMCBjfvqWUfdEbHCvWzd/08wsiPCNVfNmTpltlY773VrVrsZkdRhZmK4B8HAaV
         8yo31Fda3aRrXU15M/miBUWeMt7Dc7T++9lFMkWyXaxQC/Yu8uGXSZCvWV17qecek05e
         8BHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673939; x=1790278739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        b=EmSOc+kRXc8qqZT8+0dd2nGlKeC1VIHFK6KXrpCLXmjRKVioiWwHTB4VQLI68OdB20
         gnaFlMBpVgf/XHyGV8o9YqswhmGnUnJEYFcBvXf6eunw+FZ+iDSCiFgVJr/+iaYMPHWM
         ESrE5juA6oNwr+OJ0j1yqCvyWVUI7vgIU975MZE+vAlSlFrGe86YCOCcuM48C51eh5Lx
         PKPCLhUfPo1KQgdE3CYE9aX8YVtloh1jq32++B6HYtrnqp/JQzlR5MT8x8NadKBOO5an
         gL1GhwJIuXoHH5GLRL2O+mpZs/yx1oWmp06cGN/fWJV7C5BIRBymobceL8b3znLUfwqM
         tW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673939; x=1790278739;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uvw66+vhRNvfqBiFRqBkRHWchTeyF82H8c57GCkb5nk=;
        b=1gEk0aOMtM7lBXIr8KC9XtgFsLIH/7dkpaMqhxo/vv6iPbO3B2p+iEZ3bXWtD2qVOP
         bR2K2V5gJuXz4itqzDagbZWTIz2oExl85w2j28xT95QjrOQevJWZMEd7IgR7J0y2/tZP
         ipbU6wrF8cx0/reNLQI1qjRsUMTLeRCWlVxSN6x+M6vKI3SYdFGa63/cKJMRkc7TitQi
         Iqth1rnHQQ7igC6MlkDD99d+Uyl20RmbQTYPhKr4qfBx5oAHzGyaKAVeWW5m4HZtVyhW
         I5dDcph+wYvMD5D3l4GitV4pNIB6UdMKHFwWaHNjX5sfjavy7qWCmXv/CaI0+QnrF94y
         yEKg==
X-Forwarded-Encrypted: i=1; AKwUvBxYYb2T0xEX5XT+0pFCFOQTLSTKM1cUlZdmWsxvVnTjHhmEpQguntWuan+45uyf52LjvHoR/AHcSnvSqBY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1J/LxjvyBOwwtatyZTP7R36PakAD4gCqK1hrQ7XQtrGlsDveM
	k/qkVmcw5BD2lTFa7Xspl3b0wVotLtaDUktTMVrtzZLDDw1FRmSy1CWStV3aSaA6M/VCtBMMVGV
	SPcGX7/anFciJLMDJfLFULglFEQ9D5YDb3dwqVA==
X-Gm-Gg: AYBFou3QZVxSqzxDVhSkQF0SJI1UrqIGLBU1mO5FHKigIryuetxvubeR3xewUg/JGKK
	8l7qq8yk4yvt4NdxHBJuM4pHnEZcEpeEP67qDpeDUIoR4Ra+hAjdFZn94ZhSx4qUxKCSmeyA00L
	IyUtEKVkaFLIAgHbfqbcVA4iwJxn5KdIPHbxanEBNS27wd6N3LDtrGP82cY8CkSN4Q1muocImL0
	n+28Ni/h3GZFxZHdMCFG3oXaS6fK6F/GB4fiOqqlfgWnnes8Fk2uxIQfnzSn6gh5NoVb4gzQKKf
	VNEMdZvtgZqOVX5RyoGurHSLxlIK74LLk85pMNpHsGBQS11zSLwdwgWY3eZEWWBjKYmG+8sBwH+
	JbkslxTI8EQ6ZBBp/XxFyhD9aTyOSfsBoRjUtcVZzmxzvdULd/zvGuEYHKr6+fdyW
X-Received: by 2002:a17:907:e895:b0:c29:d0a8:79d3 with SMTP id
 a640c23a62f3a-c2a16555ca6mr12782666b.14.1789673938518; Thu, 17 Sep 2026
 12:38:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 14:38:56 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 14:38:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:38:56 -0500
X-Gm-Features: AcwNN1VE7wb6WhBCZTA5cbiH9rHwbsomzIyYk4514CYjmv-1kzjg1ciyy8BsNrk
Message-ID: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
Subject: [PATCH] usb: gadget: pch_udc: Disable VBUS work before removing the gadget
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The GPIO IRQ can queue irq_work_fall and irq_work_rise, and the PCI IRQ
can also queue irq_work_fall. Neither work is drained during removal, so
its callback can access the gadget driver or controller state after
teardown has started, or the device structure after it has been freed.

Disable and drain both works before unregistering the gadget. Disabling
also prevents the IRQ handlers from requeuing them while their IRQs are
still registered. Initialize both works unconditionally before requesting
the GPIO IRQ so removal can disable them even without a GPIO IRQ.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dd63180b758d ("usb: gadget: pch_udc: Detecting VBUS through GPIO")
Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through
GPIO with interrupt")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..20018c09f6f3 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1372,6 +1372,8 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)

 	dev->vbus_gpio.port = NULL;
 	dev->vbus_gpio.intr = 0;
+	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
+	INIT_WORK(&dev->vbus_gpio.irq_work_rise, pch_vbus_gpio_work_rise);

 	/* Retrieve the GPIO line from the USB gadget device */
 	gpiod = devm_gpiod_get_optional(d, NULL, GPIOD_IN);
@@ -1380,7 +1382,6 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 	gpiod_set_consumer_name(gpiod, "pch_vbus");

 	dev->vbus_gpio.port = gpiod;
-	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);

 	irq_num = gpiod_to_irq(gpiod);
 	if (irq_num > 0) {
@@ -1389,8 +1390,6 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 			"vbus_detect", dev);
 		if (!err) {
 			dev->vbus_gpio.intr = irq_num;
-			INIT_WORK(&dev->vbus_gpio.irq_work_rise,
-				pch_vbus_gpio_work_rise);
 		} else {
 			pr_err("%s: can't request irq %d, err: %d\n",
 				__func__, irq_num, err);
@@ -2982,6 +2981,9 @@ static void pch_udc_remove(struct pci_dev *pdev)
 {
 	struct pch_udc_dev	*dev = pci_get_drvdata(pdev);

+	disable_work_sync(&dev->vbus_gpio.irq_work_fall);
+	disable_work_sync(&dev->vbus_gpio.irq_work_rise);
+
 	usb_del_gadget_udc(&dev->gadget);

 	/* gadget driver must not be registered */

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.1
