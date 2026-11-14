Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662837;
	b=z/sQPw5T70v4l19GMTtC1bo4vZPLeGueORK5rTrejZGMe981RCqxsDerqCpVO2yd8KCw
	 +tbJUVXC7mb9D3IiklEl2ZF/zDmS1XO1t8Hip8B3VnaGgDysgX10JuS7zMGWjn7elzvAC
	 O/o0w8zW0V+3AvBFKH1eENPLD50KJazxKFgZYi2ZNjlNPqDN2RBzdgMf/LKGpG/fXBlW/
	 FVI5kNcu+8XcM2SUqLNwDosoSvBgxVLxPNgK11wGvI5bRg5kR/OwhlzfbyeTZSxnNk8ET
	 fQ0+MLULgkTNVlwDxOsmakahn8bzCaVsenc16g4OiGnNm+AXLZ+tFRJ4XQOcUD9G/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=qdAWdsfOIhgKCwFOU7Thb13n3wSxw7jwYLIEqrtloYPkAwYC7m3e6k6DCh7FkDPBprKM
	 qMhKqkj0Gou2w+U4vKAKGw0aamv/C8T5aGspizGRIfiPGdz6WbA8c25kDwP9uT1kQkHz3
	 DzPasVvlXoOvDi9muFH+FcXb1qjeG97ECdULUvNh5lCOekxbx/eDcYrAGinNStS3ph5vR
	 lu8BSVXbE7K07WZuskNCrKJp6IE68sWlK0V1Y5sbijt+Jhp1C+1P8y/xW5kBvy4x1HedX
	 aLbrD4Q0YWlSDYWQw3gs2byXgangxy+njET5GGDhkiS0GoVVMOMrQ8Pu19ZS4ajvKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=DYUJmfnM;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E6F606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=DYUJmfnM
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so2604702c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794662836; x=1795267636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=DYUJmfnML8vIMSeTbwMRhyiyoE3vks9XdK6YwzPr7hTZ9VWn/1Npzs87ji1TQerNPy
         HQEEybkK942+gaeI1EG1CgbmtfHUgVpR6vGOsYy3xVlypYvnPY3mhdUxreQpjPtEJ25K
         9ZDaNR8MWm9s8RQwcJp79Er8ejoJCgImJzaGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662836; x=1795267636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=Lu33eGNbJEqCW3y5Nx2jZ96ROgyASvbCHmlEHNaKH8KtiB12WijkpCdxHCOEIdaiJr
         o56AcUwQGaRrkUR1TyP8hDRcDzCCpayH6oKyLbCQUcaVKzw7qmCeMZMSKMRA5Axy60G1
         CF3VD7ZOUXiS9ogaYAQG+d0obT13k4tAE57Qkrr1lFxskyXY06vFBbE1P1T9EA6FLCyX
         3q+aLfrLD2r8pv0PaU7OQiQsJgFONke6+rfDAfm0daoLxQqUXFcsXjAGPAEd38Z9MKmI
         auomzlKkreFOtKCPfYdRkTwRiezFBTaCz4mo2hR4jGNaL9cTK4Srb2hTnKMr8iMkIYO5
         4NWw==
X-Forwarded-Encrypted: i=1; AL+hErGdCX1/pDWWyz9Ulp+I2OybqiIM/qYpwExxXperCe2oQce3Rb6iDaxXUxgeaJJF3F2b/IhmaxhsYjoO0+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PzfvFCRD5mS9Ta6Bxe3I7mITnCYMumbZzuwlf2qNSBrUG0iQ0
	cApuqaR9Omuw95I+ASzKci4Nuvz5o1GVTlLgJdw4T6Y+ZSroCRE1/jgNIE0AhJNDcVM=
X-Gm-Gg: AYBFou18KXi0BROC/GOZm7vC2Xrx+fcDBwTourWm7FG52ZQiGv/fA3YnR0LceLXRChw
	3sD9eivgh5820DZmCUxO/04TfvHlxUdhNXarvCWuDUohJT+nPATMHbzo0neoc9+9e49WM/WpAEb
	GUVAdFSmW0cXnrypDZkQK6xVD4BnBFleUdJtyAc7NaJKL5a+/nnP+4AZBIpZx7soBUqnJPcyg9h
	DjgyOiekE07HH3FbnMfE710n0S9xn/yLQO2TaIinaPoXk9JDTy9XSJGPegy8KXh1eBQTF72J8P4
	9R9detK4pZe1P6n7ObUC/FR4AiHWHU2Mp05u8Oy6TCJGZalAHpxxnsbcSwuASQvVdBWnkF0H+KO
	ib6zW3dk5VN/TziKzg9kArrMVGsnfmkn+XB9egPtXAlEO/pGIhrbej1JqdakRuC5p3zJJmGXeN+
	ByNHrDDQEF+OcunU0lBSyCfYcztjr+JfPWMYjxBEu2UyBUuMlZsv0qNRzXZsTeTK8CcIhmL/Xil
	MZiymwVkUHnufbmbm93uKPMLW+GwwtZH0DPVr8ekgKHyoaVYeKXwS4KWNH38SsnndEvK9emqrgG
	vD4GCVMaL4Ojh0F2fXW90keJQyXrQ4nocSeSNGY0pJc0jTvOzRiu2ueND5ModxLaJsMiOh1CAUE
	a4nsI35FibEA5iCs+QVCGXOvShk66S9HuoKniV87V9zzC+zFIF1irGBsthDRO02j1RPGzav0qEJ
	6EZeCL1lBNZnbNUA==
X-Received: by 2002:a05:7022:ea8b:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5030e2ef6mr4837796c88.29.1794662836097;
        Sat, 14 Nov 2026 05:27:16 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15712003c88.12.2026.11.14.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:27:15 -0800 (PST)
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
Subject: [PATCH v28 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Sat, 14 Nov 2026 18:56:22 +0530
Message-Id: <20261114132622.690129-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
References: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
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

