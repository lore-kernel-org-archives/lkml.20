Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666221;
	b=kX+pQ+StRdaCju3dKb9P6+NUij8iGt12CgBituhPTQtVl/ARV6BCPZwIaihoPdMnXARR
	 7mOaLyUotecpFGWz/4je2u5myi7bOY1c+LxFU2WYZD1ipRpkxcI4Qvt9CMZfhHqkPGZRo
	 ID9Z9uzjO8gUnKBbJDMpx0h7/WVVBzzUgs3j3zKod+FHNkSDlIotYY5/4km+XZTtkBnxw
	 G1hI+2HaUb/va/4PwcahGlIh/d9BR+30xwOUKRwhV/XIMy8e2vHiPhT312WdMCKdMPiAF
	 EnlsThw75w6sJ8MIL3cLcc1TnJIw/d8UvlWHp1czmxD3iyKkeLUWflKEBLl+f2wL7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=H5se2dc78NsMbMzG0NXd+2hRkxwaAyiUKdRMXRhZzCX9JU70gEAPhpYiRHWaw4qoqXJr
	 8yHirtnDGaGn/gBYoZuvqZb+vGV7y+Ow28gfe7sU1xSH3IxGeu3gYbLMLSAziKknlN33O
	 mMHpy/8idwmsJApC0miuE0ajBh/kDWG2x1cZC5x2vuz5muNb7tFG0GqRl4TEzpJk0++04
	 5hshF27LfGhDNhLhqpWHa2v8zPmju+zOtbVRJSd7u1xbhvNIc94YKFfgZGV5J/LzrG4Ur
	 U8rpiLSZz39GWIdYeqFR6Yw4GCKZNHdktoSSuy8iNtXLlU1vRIdv3UO4nftwuqo0XZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=TYdHSwT8;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06312606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06312606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=TYdHSwT8
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so2885931c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794666220; x=1795271020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=TYdHSwT8Fdi7kBnH+zjEag50KdubB6uWXYmuHAn9YNQ89y7Nx3zUyLizRLtOiwY1cr
         WHiwi+6Y7gCAVmpQ5XZ1DXPDriJIVVBTi0T3aGkTzq1Ek15p46eTkyVwafb9awIJ+KCz
         mPKQ8lRIMY5r7wBd+7sLozRnFt5gkmrRUOcuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666220; x=1795271020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=iqn0Fi8Txd9AZOIL59QhWU2oL28ixeU9RHcAOn1CYDTPBH3CWFXQyy84+vk3qLDJJh
         RsNowAxTjiuSoTw7FUdbIb7JQsew5D9Eqx5HWO2JMvANVQp8eddBRLYj5pBppj9cbUDE
         +4coJEuHnLSr0Wc8j4Srkd847dyC68R2i71+eR1eGyXe2OTQ5qdq+A3CP9ENfV9Wua2A
         2akSilT9NeSNmyvSvnpz3Lio8sxVzp/ePiZyvauacmZB0WFKZHEgAFTFr1l1RQESss6B
         IBhPUtYD+VYZyizRJDiMvNhM1XSocvny5uqtLnoIAbKLGKnW68kDWBhCtTiDRBArGcNq
         rIFA==
X-Forwarded-Encrypted: i=1; AL+hErEucqR55b0ROnaasUK1HQZFysVAMRXBI4X3UA6GstzcF6uM7WCRmCOtboaqF/E/pDlztN7010vGnv6G73I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hx/R6hYDHpp/1wu+HmRCUNG0xvYciDmvHruhvFpft+rnqTxN6
	GaXDcs06nz8jOo7BQZ+fP4g/zYkmVQp01uf9LHuDE/tnN+crbaL7PFE8tok1tfteA/A=
X-Gm-Gg: AYBFou0WuORmJpmnqCHQyzYfVVwfbHwxqe6TMNYtmmEw2lB9ibqFWhTbBCv4tp36bxt
	RUAoNuynrpb3M3McQgDQmH7BD7+2iWeabCaMq/shlGuHq8ORzWi25gBsCxNFhKpYAyfERkgkJb2
	eRo3l5MrlfpTvESPzm/PlJuw6aggANLso1ybTgag2o/BsaX2B9ZhEKcoBvcTXQbI00s6VfJfI6Z
	3gS1NYzIT2+txnHoj3t5dbuAJl6JnDeFGmU9U9X2L6MUwDZDrjt0gol4EbAvOEwTF09DAdCCWmH
	//bZzkZNnanzjJ5p41OJCZsZEvcUqYhiOpqHVeFMy410O4UUZ1Z+DBxxiIzgm7AD3HWZINKCPwP
	RmRtp4lumsky2BfcDmDo3blTCvFdsMawt1LN1FklNP79a2phJKOMOH87LPlhImiFHg8AcTeXlRd
	+Smmu30BcKHbi4Y1Hq0Zi5D1aKxooQcpTaN4zkI+1Y7yqaqgQHWw85nVck3RvF0JthQGEEDsJMi
	jI+7Ac52EQ7n4xmN6cuy7N/0OJ5+N13NfAVasycqBofH6tjXfmEKEk9VgL5z08jA8MO3+p4bgA4
	8znc7hjc6MoVE/MsMYxWB67k5p6aiyoKWNLh2fGiydaKTbUEnl0OETed7HR9qkYRBy6qdsKbaJ5
	8ey7Xdhjm7dbpD8LgAVvXMQ02kQtc5lNvGNJpht1urELjmtVXEkcjxwZLGdPqbUC8IJxi
X-Received: by 2002:a05:701b:45d8:10b0:17b:fea8:1425 with SMTP id a92af1059eb24-1b50315310fmr6223169c88.30.1794666220211;
        Sat, 14 Nov 2026 06:23:40 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm19376962c88.8.2026.11.14.06.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:23:39 -0800 (PST)
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
Subject: [PATCH v29 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Sat, 14 Nov 2026 19:52:12 +0530
Message-Id: <20261114142212.716906-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
References: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
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

