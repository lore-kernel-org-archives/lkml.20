Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427170;
	b=KfKEOmhdShiMRuaDc57QNBWguay2/PE6GMkWk6LrL36LoLkAuzkq6lmZkAKcJh+8x3dH
	 J8Op63wn64u/rtDglqC+1Hj5A3/K8Xt++nvhZPNqIcxxaJ1VP3glU8UUYZMibcKakJgEw
	 q+DT81c6tWfznU95EDgdvjP90ZmOBihSpjqlC/dsjwfPHSOKOK6c158rGt3yj5Gt6JtTf
	 t5QIjp0OO/ESaydx4zYLzd0n6vkElZ+YPH5hpWZUjClwYCzMCmUpZSFqhl6GvJ4stbo/X
	 u0Poti36wEcGlsLYQjxvb3DwMnZu6Oikp5UJYtBdNLNTvjebTjWOG8coCEZERY87juw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
	b=FqaoE7F5orth8ZZs2jZ75w4AALWGv+ns5VnUBOySC+H35VVIsubsJ1o3Hf1vrRdGDgN9
	 ZSNb8IxFC6c+dk1Yd1qZBqfr2Oa66clhBEDq/J/Rmv5d8F/ULeHn4YTvhbHjo/Bm2q90I
	 hHPdcXsAvauEvtFK8tFZBO76tRM+mc9GDgYQXzBX1QiehO9kGNnpUBZvWdy2b/rcpmWue
	 G1VPzzcprv5yEMdEoqOmBFW4r71JsU/rb6G7+crxB+1+eJ/J/R4ooLqfYmm5DqdJ1L4La
	 y7cFOzbMCct0p0I0R5B+kDca336BA5IyX7oJQ2XoT2UxZhaQM0lIYZ6SV5D3ChtJAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=GJm0gref;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE860A3825
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DE860A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=GJm0gref
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so3451007eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1792427169; x=1793031969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=GJm0grefAxiKvDAd6m9AgqHUQj4RTV/yJB7OnXO9S1cadFdhSqy+D/Uwjmpifz4B/s
         xyTCLsoqDYeTxA4v55mDBmPcRQNwxvaTloD/YwmDs+KyzIcZeHANhUVz9x/xA7EWZ8Q2
         H+XpleDqWrjM3S64MO/2OBODkcIgMkKEiS1CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427169; x=1793031969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=T2rv4BbEeZqPg5rNcMuAlpgCJ5LzfGJ6TqwsGQNZlS2lwnHrX+OUk+x2VrsSrQy0BL
         VdvTNN/TNxXulvyqirqd1VKa30CLh8MsBEVHVGiGBrBQZSnzfDz6ZkF5mCIvrPqIqiZP
         6Iyl8Zh1q7Tu84TLRJSPOkorOtQaAmZdIglr5EO2raJ5gXL1uqEoBmchwRViRhGbWeTe
         KzTaqBmrgI6AVhyUj0lvhO+ER6TjZMMpkXYzN51Qg5B5saaFr8J3B1V4W91VqcHoB4mQ
         670LdJ5/D6cxA1Wkl41ojYPnIESDTaOvQR5s2Ni0uU+KHIcd+NeABO+nrOGd39ym7Gih
         962A==
X-Forwarded-Encrypted: i=1; AKwUvBwh3C1YK4kbVG6onoycVb6noy22Qsm80jo+tNyiTR2+5Rkoul+h+7HEsfR/dCYXq6HG1HfA8uh5sUFhsRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnHLL1vqaP/HUnDfoHLGj6mjrY0jnyjLjwA8Ot8u9h55gO+JYk
	pTI5shk02k0UYlHAB4O9y/YdAk8V5hrHYutNlz7U6c3TB/6d61vLQ0cQ/FfRQ/zNFL0=
X-Gm-Gg: AYBFou21Es1ABVuQqQJGhlDE/pwKDHY6bKz9vuA4vMbOQ49wR/nVUCnPWK+NEbiOtB8
	M6NiVVWt/XCZAdO+sbXaaIQNNuxZMNnYFFLRJgU7o3weWWAk0JoTMSbv/HyVUJT74L1kFIVxBg1
	kK/dcqXsEp843qAl/eKzTYk1OaX5xE/MbG6d2Hut9zOwv0sBE8a8HXWKWiIo6lgfrIWaIpUfIn7
	dVmfhP/ShpzYsz5qAdxFmFPKgu6fFdgr3nKmapQqcYcna3+01G+Z/SFtwBaBoD2zyAX193lq4uo
	68q33Hi8iPEAp3vXZLht3/LGgCinvMxyNGcDcQtA6fbs8PftxWdTvLYlJl68QDFOqOWT7Yk89Xx
	zrdnb+haV1lfYwBZGqxxpiH8yJcL3UX5s2A66v75d3Wo5Sg6giWxQNS3Jwxhr81yefSRLmozVXe
	4951kkhWloyPcZFUH26QlDGLtEUoAGvw5M5MocE6n2hUO8vuoFsLuxA7iEiRGr2SVjZYS0OnSsS
	9vAulEmjTeuam9zIX1LEf0smf0zcmwc/3OM3VUO9C2oKGWAxAuL07rO65MbpVmiwdNdo/zVrKl1
	WOIZkfLMlxzaZ25Yc3U8falJDGem5UXz/xKP0w==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr11727614eec.3.1792427168698;
        Mon, 19 Oct 2026 09:26:08 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm32218885eec.11.2026.10.19.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:26:08 -0700 (PDT)
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
Subject: [PATCH v26 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon, 19 Oct 2026 21:54:57 +0530
Message-Id: <20261019162457.1000115-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
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

