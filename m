Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4DD400E18
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179528; cv=none; b=G9XZm7V1F8ItUl4fPZr3NVT/0RcltkzT/w/pqgqcES+Ts+mc1Sr2RrmSk7jAFw2MYgY23Jy2MMVen3ykV0RPpmFJi/FHCXY88w62iwqFhyqQoyi2ptqeRrSX6nMjAgK2yzMbRxHY9TkJrYw4y6ZHTm7UAkYAopmldNRtEdxPP6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179528; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n9pLoGJjf2vW/4jw6x4/q0+42ZN/R46p+CyJ2XMemZm0Efx1sNE5B/DMoysEFSkFDRVWj15QYua/ZiIkM5sg8vAo7tau0/uSCEEhaC+FXvNOMqqjqHk8o4JcexfISKkroI3jUO4SfmTwzZIiI7eNFIR3hpJMPe3w342nzih/G+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=d597RFTV; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="d597RFTV"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1553074a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1788179526; x=1788784326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=d597RFTV79lXzt/zNSrpgfD3wv0fyvMpbfwa6d0zBFX4Ul9jR0ioO6KACHwzskrp2Y
         JjbXQWaQUT1xWbHXy5dCFXtylNp4SpzwbEmQbpWAo4zilr8xch8lvYGP1BpZ/kHVXAXj
         foXQTjE0EUM+6k+bDunQhEL02ivcR1kx+zHCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179526; x=1788784326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=k2AzJZyHhkUmIYgbsxsZeOtYNI5CvjCN7JQXAw8yVjQaf9bi0htYFz0a1kuffvDlBE
         Be/kd5tTm1+ze4++wbcoHX2XDro0HhuYTmQhkMqXzOhu9VGnJRkZEBYiRxWo5T/YyuhW
         nJdvYaLcspZGX46FhTvlpRSMj/bzPJoOHGNBHMUBBRI96XMb9jjpZYzftxUF+6lchGcz
         dT6e1ZZXHqvuKvgKZWloiBRdFsqAyqHaKdOfWBAMm5aP33Ohu+bym15n43WLl5+A/WGg
         EG4SrOghLZJPFnTE2ppmONepczEDnwukQ/xOpDLnuO9CnZu5EiZkhgiNyBM9bttLMg0K
         lw0g==
X-Forwarded-Encrypted: i=1; AKwUvBxrdI/95EbSF2cKiBOWHoowHcEXFQNI/Bg6Ak9ErtLQVyumIippHMql8/kutNqbNLxRVOYeBBCx9Yc0ySs=@vger.kernel.org
X-Gm-Message-State: AFuF++kc6CZ3RwcvqajDP+rCCjUQGNS9QCKgGk7wocuZhGt5tWn+mGY8
	GetibR9IxGWyr4umKCAhmMoKLvQHPytPk084HlF9gL6HhnBo1i6rwXzP4fqXh8nWaYo5WwTzsyP
	qin0U
X-Gm-Gg: AYBFou3MY594Nsd18obK3o2JrMSqeq0O2mkEa84Ts+wLs8mYqgbk0jS+srEoqLlbhWL
	uJ7cfjKG5ZQRExSWa54iF51Z3WWru2V7mweipj1RIiITeG1vOZ37p9vvRDDNsF2v+aMNskavOIA
	ZG8oWe6fEDVkijTOQuUwCmscnlwGuS2D50gwJ0V2bGIiFzd4q5EMo1WvTPZl8EEEqF07GOwqxNL
	YvWAzZjx+wtwx2KWdAJ7HJANvSvLk8430ZPqpe1Unrx5/8OVx0n+DWelMt3CGH23KNamv5Cq4Mv
	fLDhxfl7j3TPFE66AtBM6L/7/GNQoUwKQU7QRMvDzAcvW94S6PftBI8JNb3R+gREyfA3WtLnUh4
	oMqXdPp4iN0FkffdtEELGgycovA8EzbKWQon7F/U87b502QzwyZlQOk8bJo6ZLAGSbdPv4tGl7J
	Cq1FkwJpglj7mvNMBy9p9QHB1ZL1d4KJNbh3cJ5je/BlBAa9HoADJgG4xwMbGB5QwYLFvznux9F
	rb/Kvn+0E3TUKEcaiuP5rOD3RqmE+UjRfhmISXh9HFJQkAZd2WOnKO1OB/GFYZme8yOU9emgQPU
	zpVkSxmvM3+tdGh4cb7q/LTvnEbOUriU/TYRNQE=
X-Received: by 2002:a17:90b:3d91:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-396d0f016bcmr42950482a91.8.1788179525864;
        Mon, 31 Aug 2026 05:32:05 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm27470376c88.5.2026.08.31.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:32:05 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v24 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon, 31 Aug 2026 18:01:13 +0530
Message-Id: <20260831123113.870832-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
References: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
---
 drivers/crypto/Kconfig            |  1 +
 drivers/crypto/Makefile           |  1 +
 drivers/crypto/dwc-spacc/Kconfig  | 65 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  7 ++++
 4 files changed, 74 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11..e0a8de643d6fa 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -734,6 +734,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.

 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"

 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 2c33b83f3cfa6..b80f211598bbc 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += intel/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 0000000000000..82ea907a14635
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_DEV_SPACC
+	tristate "Support for dwc_spacc Security Protocol Accelerator"
+	depends on HAS_DMA
+	depends on HAS_IOMEM
+	select CRYPTO_ENGINE
+	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA1 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_MD5 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA256 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA512 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA3 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_HMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_CMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_XCBC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_AES if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SM4_GENERIC if CRYPTO_DEV_SPACC_HASH
+	default n
+
+	help
+	  This enables support for SPAcc Hardware Accelerator.
+
+if CRYPTO_DEV_SPACC
+
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	default CRYPTO_DEV_SPACC
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	default n
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write operations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT operation
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_CONFIG_DEBUG
+	bool "Enable SPAcc debug logs"
+	default n
+	help
+	  Say y to enable additional debug prints and diagnostics in the
+	  SPAcc driver. Disable this for production builds.
+
+endif # CRYPTO_DEV_SPACC
diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc/Makefile
new file mode 100644
index 0000000000000..b7125a7797ba0
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+
+snps-spacc-y := spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) += spacc_ahash.o
--
2.25.1

