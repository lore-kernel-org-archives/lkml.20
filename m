Received: from mail-qv2-f29.google.com (mail-qv2-f29.google.com [74.125.230.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD54E0B6B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669274; cv=none; b=D+wmhzrZUYSb7ObRrpVcZeLq75wSBa0DGNPq8cpF1v+kB4IFXKxoQTbaP4m5mpSPiCJkjxq2d9WP9HIHpbHaNyj0JKDU9r1DPgnrGMo8s7ZlFALIM1Bdug++u0SYsnzSx+UXANT/3SxhZ/enY2uZS/8rj4JKTDouvhyMCc8syjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669274; c=relaxed/simple;
	bh=6QaB1vCAHPDrZfq2UMtr0C/Dsi8/MZihkvuPXytBOdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kl1ytyXG0kQY0cN0ZmqYaejnlJ/dSPWAVPI12sve8+pdFHRuU8GM5clu8f4SCKbvhxbfDG3+Q2A7ujFDmkC/yKYv2MEetDwizNCgUmV7XUkCmEeUzxSl9KPIpaCt/PF07978LUVtKqJJQcLMN3J8VCFAloYe85nPbCan0uVWMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsJyOlk0; arc=none smtp.client-ip=74.125.230.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsJyOlk0"
Received: by mail-qv2-f29.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso9220606d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669271; x=1790274071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxvIE5VyPmqRXC8q+9POUQDnnJS4uUoBxGmPT77wF0A=;
        b=hsJyOlk0GVVLp/TJvSOu56tX9ctJP+DNB+uKybx7JFxZmmvpr6c0/U+kKMuPNVG2Y4
         aAjxscp5NAuG8QiTHHS0ZLCGoF8NIKN+e2u7UzoLXoi5N+Sl0pZQ4Xrw5qsJYfKwBuAS
         tueGevEmShuRGR+ocbUT4uflEm0V7NTLsRYX27nFUO/NkT/KXZWRM+W1tZa9efWJWvrb
         pZAhk92jcp6inapGjbjKfPs0gYKE2QzWRMoyp6qRWJH1Ui51FXzmxU4w+LGbrsf0PN/N
         nU5wwShf22un+trMZTgxa2W+B79efUK3D29fSBlkKVcUpE70q0YCrGNTTQGq51PXnwHG
         BvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669271; x=1790274071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxvIE5VyPmqRXC8q+9POUQDnnJS4uUoBxGmPT77wF0A=;
        b=IZ06KrrSuxFRIQZJ4HC1hgE3+eS9dK3Wsvaqp6HV59SaScAZ33stIltER65z8bxZz5
         YZmyI6FI3DIQSRfOwu7+FPJK0iRNnDv8rwiJ5uLYlEQtoASXSqGZA45+lVnP/H8Z/8+3
         zxJTXv0ltrPRPRW5aLGwjh7UbR4WlInnOhg4eMp3Y3Jhyg2x9MjR2J5cDMcZRhusDE/A
         woonVwUAochGDsTrxYhze2vmZIrwnlfCwWcp9M26M8GvA8zifa4Jl7NySa+C75kA9wNS
         bVqNzQCf1I3mhlYBM1iCOCakZgLLMJ4QI9aLp73a4/N8g+/47tL+pXKzgC/VRvxg7DF2
         UW0w==
X-Forwarded-Encrypted: i=1; AKwUvBxWKgtA4SNpxfE5E1TABclp4Jzs9iR8an87vPDCmKc4u64SI6DESblA0JIJtlPqrRNUpmgxbv/xKyL1trg=@vger.kernel.org
X-Gm-Message-State: AFuF++khJD8ARBDlOZ0+48D9HnbsJPGd0sq3CGVSzAwG2nOHeBQqaeYE
	lExv65os/3mUBRwfCs54SeGrWfEMDNMnHKU2ZdIcXDWuisIjLp29mEK/snVsDz33KQ==
X-Gm-Gg: AYBFou1ilyZRrMqcxaXt3pqpbXDaOId41QFnHGUAcEWoSuSS7pAbPD8SOFbryc7Hfg4
	EmPCcDo2IldRaHwq17WGgyRu/LLWIUpO+xcPGtPZEgbMyD/3McaQFE9ljzjKfMgUePPE9A9oOqh
	VFpWmjHSYo0vzFR8jmqLAJIfyY1QO9Y8ToRfffen3zJfAa30YFWuTNifntzg36dILY2e7zz5puW
	3a7RhWtFJSOt/TIDVW6zPSf3Ot5PPDrbd3GT6VqAQY1KFN5Y66lFWT54cOJrx8mHjCY+GIcIUoG
	1rWweL+qubXkjQRwhUVwl09VVET/uTTJw8MQ5LhBmHr0uVdCiV9c176iUcj7xLARZ1bz9hNWhwh
	RktaLdpVh9CiXt5KtsLHN78HYRvpRynXuN0lSbafmLqwhFth5HHtjEwtS7pKelnBV7lJOtuCHFD
	QVioalpAhOUiIEk7gIIyKQZGNBYlfZPlAw3qTDcfWlKmtibi84TIXateGw+aEhp/frNTbY6GI4y
	EcT+WDaNYAVFkuJbXMVZmxidsg3ORIxXTyqLq64RKDWtcku64ogWdq1SSpAh2eans+jVmGp5A6C
	Tz7ao56UGujiZ5CVnp6bhas/AEY/sPOGNVi3YMljy32nbL5c
X-Received: by 2002:a05:6214:4119:b0:912:3c52:5f34 with SMTP id 6a1803df08f44-91254bd0194mr797506d6.31.1789669270580;
        Thu, 17 Sep 2026 11:21:10 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc7ce2sm3684976d6.34.2026.09.17.11.21.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:21:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: radio-maxiradio: balance PCI device enable on cleanup
Date: Thu, 17 Sep 2026 14:21:08 -0400
Message-ID: <20260917182108.32566-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tuner initialization failure and remove paths omit the matching
pci_disable_device() after a successful pci_enable_device(). Disable
the device on both paths, after the final hardware access on removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Add a Fixes tag for the initial Git import, where the PCI enable
  imbalance is already present. No code changes from v1.

diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -159,10 +159,12 @@
 	dev->io = pci_resource_start(pdev, 0);
 	if (snd_tea575x_init(&dev->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-maxiradio: Unable to detect TEA575x tuner\n");
-		goto err_out_free_region;
+		goto err_disable_device;
 	}
 	return 0;
 
+err_disable_device:
+	pci_disable_device(pdev);
 err_out_free_region:
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 err_hdl:
@@ -180,6 +182,7 @@
 	snd_tea575x_exit(&dev->tea);
 	/* Turn off power */
 	outb(0, dev->io);
+	pci_disable_device(pdev);
 	v4l2_device_unregister(v4l2_dev);
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	kfree(dev);
