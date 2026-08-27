Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7F3384CED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805898; cv=none; b=FN+2yPl6Xa1OKwckXfmOvFBZGyLLCQE8NqYSlENGhRYn77feMSt90psoecjLt1NVgtYZXgz+d+eHhXe0pT/G4brBrHfFxswyhqtE/tqi0ezu+BJRzvRjIgILl3Gzwnv1D7B0dwSu/wbqQxefuHbrJc1Q1E5uuaIDKxIaaEcN5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805898; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQiPHNhQsfQM+rIfxc3l4dxtK4UPwKqvqH0ZU1XqSmnK7PgQ25nljJ/tZBZi7NVF0J1656kQQtVdq5yhttt8/CXEZa0hKdoS1ZXtGFv8OxF4GRo66fZD4T3BLnZtD5XpwFdh18LkkEV4tHq4cL4VMjpKIx6B9PxHRAKLoxrONM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=VIG85tUf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="VIG85tUf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceaf8a1265so4869645ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1787805896; x=1788410696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=VIG85tUfm7r2QEGNCJQQKf+tb2nt6HuTUNw3AT5DiGrf34D0BNCYeDgrWV5ERMRhYy
         7RmK2BmTUCsnApmeVnNJJUvRkhLPquid0jw9nuZk7OGb1zjDaJH/SjQ1elD2GVJldNBL
         26BmY70qtDAiCsMFvXdFXrfqC9b58u5UeLF0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805896; x=1788410696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=seT/2HC5ACMbSwtvXcAL/EQfAcY8F+oQlAWPIfAchtHna3E2Y6u2K9NmG0jUAlJ/vb
         UylmSJrd9FeNF8I/y4sv5iQ1bv5T4mG4+yf38NUtcwZm3YDqx6m8HDP5MfAD/obuAMLq
         faWlIStv3Ep8EVCfXqV92xqbAdRUE52flNqzsLPEHa/7TjVKQB8Ntf4p1YPs26lpXuIB
         pHvF56CsuGG8txtrJj6xHDpqIoteJT7tcs0pVp7V28S+HcaQFahI6zByHq0MLkUU/ps2
         BYwIEbGrnoJuqBjXnnPw4xKuugwK+ZdPTXnAoJuOx1v2A3JOyXIpTBO9eWoROGoazot5
         +edw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw8RyGlSdEznAhHugo3cd8tzidi0355sfg2CLErEj5Hl1PO4m7+Oyf+sO8BTAjw+DTGR/Saj2xkq4eQmA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzeNObqDPXFidzKq6IYwE8nPWrudRJZ2N82ujF1DdCk7HkSaUO
	gJgzY57JWeMo91EMZvI0YZ6oTTTmU8pHYKEtfPlE+dWzLA+w5LKYfy2432HlXWPQ5qs=
X-Gm-Gg: AR+sD122DSXYGC5yQtf+WhuOQDg5fC1B0XUZznW98ZhZIoriQyPMM5TPhkyiTFsUav7
	PtZnnF2tw8HxVAk8eTEujLo9TnpBbMPMkbG54519IQ9QPAYwNcu7J0eCYPO9eTKqZHEQiIMrPnM
	G4yX2s2bxJGtPVlFguk0H9MI7XsRTixD+tzeAXwMyTCSaWHGayBmRrEQbfD2g8Yn2X9W4G9X04k
	avgbIYblhSGsqqq5gy2IzdDQmlHolGVy1Z78JxoGxDuOpGLBfyqVJIv60rmDYK00B6TN3LHfNrj
	+1Jp3SHHEnrvtvUwZrNUAzrYpl8ikXnOxFMxUhkMGU0yOSYpUgu0nbgKlYAJiR3/IVY4m4FVcTl
	a9xvB58bTD6G2GseXrdHXNfOUQmt+aVvYWBm6AeA5cIHv/502vqgtS/a9sY2vZwmE9Pe+XtyEUS
	dZtiRPAZjxpEI3JdThO888aybTOjq3x0oBk6d7Q+Ysah2v80HrJoiWO5u9XBXiI8FcZmKTweVXX
	r0o70yf9ptXJtbKmEQzgLh7sDWwP00ikoi1o9LKHzjpzphwYnUeKTdQDXc/LiCUauK7DV1ccc4S
	NjnOoihPhS3KKZcSISJEi81hErp0
X-Received: by 2002:a05:6a21:3a4a:b0:3cc:2552:ddd7 with SMTP id adf61e73a8af0-3cf8293ba48mr28734686637.5.1787805895951;
        Wed, 26 Aug 2026 21:44:55 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d63bb23sm14554224eec.7.2026.08.26.21.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:44:55 -0700 (PDT)
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
Subject: [PATCH v23 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Thu, 27 Aug 2026 10:13:49 +0530
Message-Id: <20260827044349.826534-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
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

