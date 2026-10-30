Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381199;
	b=geZGxvrD3Dh23pPgkeE53/meNqz3KAt9kaWxezfiGMbaI+7W5NDpR2I3C7+GmNedG16Z
	 NOV7JU8L4vDcF72zHuidT91sKLw9nzLyj9CA5+IfZul6J6NZDkcSr407mlvuy7S+Em9R4
	 YLF3AiCcxjGck7B1E4IZ/ndIhz6iHnBOLB8EiExTHLY/fvyOM8EiGSfIR7ioFtt9AoPiM
	 agtl9fKfiiZ3Bg2Ede7DQd3bKI3y6PvSzFPUPeKNnlfvrmS6shRyGKbmsBunBwcXVwD35
	 MzmjR9YfWRk5POfArBHINtDIG0QPw2xnDDuv+alNVevgBy053OT1Q5oSn7EQ1LxMC6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=R6w06dMrP2PlmlmezoPBT62tA/sEbeMkivhT7pkX/Bl1NsoHHHzDQSR8aA0semCNQ44A
	 QVGTK2kcASzMtL3LbTewLdHrCDk/A3QjNLUsD/CKI2JPxZ2yNxV4QJ37YUEnZ+YYyQtpn
	 QFPM6MdwThc3ChNcGNF01Xr4BnOqaIlQ9hwgHVcd+3EMPFZWWRNj/plV9/HnpVKA72JTL
	 i69/f2XbN3QjpJN3GS2+yqp42I56ThQ5ImbEJdKYDS4RVp/TZwIXelQFDMefS213ZlTL3
	 xoBDCL+o9HlpubIzBG2rpTPXnszOx1cEx3cKN9SC9dLbE71sp+wdhzowWh8eHRVSnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=exTwvhbq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFBB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=exTwvhbq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso1458007eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1793381198; x=1793985998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=exTwvhbq1wSNUWxy4nWY0ZDbRBFEYpa9zSH85Fg5666ChEWQxB7CrKdbnHZMmff29T
         2ocTxig3Sz830hBimiHlnInuIOmRe03vkN/upDiKeCL7ZvtZGI8mbljfVM+Jd0k3o6FU
         BmGtyYbZcsPWNIl5J3T25wRnI4yq9Wxhlzocg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381198; x=1793985998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=C3LZt6doeYfVJAS61jPup/ZEnuK6KrgFH4RKiqVPBXrcRmCxvHZUcJAX0YnTyXJXbx
         h9Q75FDW6WVVAqkCtZ8nFEpQ8K6byVNmEYlReBctbLBZR+NUIbwusSko6tPCupcFSMbU
         9kR4QHkRbRjawAoDU9Jt7EFBlBeHH/H8b3gzZm0f7AiKZvQn1YzHvtpwGjIlf310Wxu6
         e6E1ZhFgC0AklDMw+bHBRpblkju++9TeFRtFCBabnVNg1FZmJS0JcSDMhT2EpHrbc2nc
         JxiddidYn8zbujirK1LvkkItftt1+MLUCJe0y9SoxeLLy0GgXeVGBiDdJ49HJ52sRQQv
         neMA==
X-Forwarded-Encrypted: i=1; AKwUvBx+N8PxmmCMRiTgT4pK1vL7G6LlD6VkyPhrP7t/xOb8zCg8SkjtCxufFX+ENdE+kGNEBJTIT5IP3e/3klI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrLKsEXA4yzdtz+NCBokV/VlWp36etSO4QJdciopNJPCgWPXNP
	Ijm1fsTFJdtlMUqG+ahttr0FBO3owJ3SMVUWjkOu3s48lpFbLtcKUmF9TJISMXIvGrI=
X-Gm-Gg: AYBFou1rtT+rpZ0VtsTlzytrc3txTs8r2J6gw10wGCG9nlGfVs7ESlEPuZgKpW1Y5a+
	Ika7ekq6r/+S+UhtuZEgzSu+x8sTuVzc0csAH3LuZMn6yyQCRI+zuXiawcO0UExiOXtFh8j78gp
	6UbZQIEkh0qEdeKQICeFm8TkEx/l0wQ20YgpzA5wU/s82/Qt9W0EhT5a7KnNuAOxyA2gX6ymDn1
	UL2ezHoEcJaa5KnPDxhW6s3Mo75RXqOE3wfOT6NxE2v0jO1iK3jPkX/UvEoPRg4/P406wytSyc4
	touOPqyKr4rsHQQkCtC03869p5lesBZL9hrwS8VbERCl9Nfyfjbb4/yXgOtLFfqGpyR9YjF8Rzh
	bTVPcq+WkGvKu7DiRy6iHSBPVFR/khdx4uYNG9MHLm0hiT26nvLcdERtZyDPy+uA0mqVJi/5x2M
	NTVJBn4iTN+HQyfPEdiwTBjIczkX50oRaofw8TAKGdasqz3TXh9ejs31v8O85MTCEIx4nAfiOhz
	J/wCGfVfERU3ehXsX5RyGX9owkl9wKRCszdmDzzDM8mFGKv27HSyMzgg6jzsSpjml6Tc7qHLrdK
	qqVuFxwByATIG4glYpoYlYmSXI2BTeiXAbPxdQUiHkhd8slmbG3p25vS6ZU3SIYRRq+vda7ODkV
	7Wh2mMUdqVl8GpW8UuuE81ZXqzqAtBhS8ibpCQRO+pBbChpzhTfy0mrXnc3RdrU50/T/3
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr5123560eec.29.1793381197701;
        Fri, 30 Oct 2026 10:26:37 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm7641152eec.10.2026.10.30.10.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:26:37 -0700 (PDT)
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
Subject: [PATCH v27 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Fri, 30 Oct 2026 22:54:56 +0530
Message-Id: <20261030172456.274744-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
References: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
---
 drivers/crypto/Kconfig            |  1 +
 drivers/crypto/Makefile           |  1 +
 drivers/crypto/dwc-spacc/Kconfig  | 64 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  7 ++++
 4 files changed, 73 insertions(+)
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
index 0000000000000..b8a7d04209112
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,64 @@
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

