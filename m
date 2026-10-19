Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424937;
	b=oKg7ZGFRWDGhMhwygSphA6nUOtnlvL2CwxNVhKUfL3wFq59U4Y1ocCaflWxBh7XeADgT
	 clExliIpfCMx8S1D+NEuor2igWez0CVWV+hJ8xNi/9wYu9hW1R0i34PqPpz2q18NSot3A
	 taYzjsryAJsC24+/c+K8X2C/DR7zGfwUq4JODy6ndrTRkVZX0KLrBtDZVhUbiMMP4SZd7
	 6hFpQfDfG8A2HI2xjWbTFqY2aIvQDXCxpGTAwCdYEXkjo57xGNvnQRCYylNTzZEypbqSP
	 X+0zSni3ZbB7JNh2katX4OVarM10Y25TvsbjLS9dXwrdSV8mayFEnHLevkrtiCDZYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SrddGqGEKlVywaBQP9jvBbsEZndrBLK5f3u5R5NoZ7Q=;
	b=pmoZGhWXqx+/2/5llwcDZB8Gwr4P+4F5sBJq7L5xmpoMVSw0ANis6Kj3rIVlOknnVhZ2
	 dPdmM8KfsVCraex0MF2hMIddow/jNog3kTcTLB0cXk2U1pN4r8xy0fgD9+z8OnHQ1IjGn
	 izZWJPNYtKTHVCiEAkrX/6HeZVeped/cURtj92TnDI3Td/6O378OvFG0g9vI3XD5XnCJm
	 myRR3P7W0get2DB+C+US9JG25JE2HFEvm5EGBXJ2rn57p5k3GvA1wzJo3yhl4zcnzRqvj
	 RmJcxR+UV+EuIC9eOljyQJSSl3UmO4TBGzzpKcPPICqLUDgeg8xWUdZZA9PDLP6v9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fGN2GRA3;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55B60882A9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA55B60882A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fGN2GRA3
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc502d509c0so819020a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424936; x=1793029736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrddGqGEKlVywaBQP9jvBbsEZndrBLK5f3u5R5NoZ7Q=;
        b=fGN2GRA3sIFa5mBgAgyqZhaXFOxvZCn2CKZ0qbK05Q1SAIL5hTRualHuO0AHSQHQKZ
         BO0zoil9wcHt0cXD+wdhdIMXp0uLV/YFok1cwoHTPnkiDudhu7XTdBzD/Zd5Sc0NZzTo
         FR0EfhYgu9QcJ9C+kBv9dVTG5FTDgtG3mZIVZMFMwiA6Hi/PJYCy4pqYcyuYvMF2wPQw
         lzPbcwe82Swlvizymm+QZeSeEriWPOfdpBKS+BzRSeCXECF2r4FEgKRjYuibKHHtXODt
         ZMZdbxPjFzZUvUUVSJ3Lq04EOgBDvxCEZxyTqTITKgQ6rUt8dV4bSJmiRAMyAyLswvFQ
         ZOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424936; x=1793029736;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrddGqGEKlVywaBQP9jvBbsEZndrBLK5f3u5R5NoZ7Q=;
        b=Bzu6MzrO/YR1QemQJ4seJFG35gp8ZpV09ST8Hc0KCz0asCNsaYQbFaJS0wbjHH17v1
         bFf1l02InmZsYHqCff4sG6NZbk9w2IZzpFPBePBQHp8PD4z1wsUL3kXlxR9MLdMfQdAR
         cziUq+PtpTQraDkY0ibaS4Lfx9r6/Dxrovh/+5efejOLjlElCif/Zy5UUeeh6CpGYvL5
         05E/kT3Y4yjO7BOqfAnMDTAu447GPNoUQFHm8JtIOey+QhDa6YgybYiYYPpnN8Ld9q3i
         e1Arhv4cGVhS1WxvmE2iOGOZFtSedLzGQC97P2jeZYS5752eLTR4XCb271r9QtxkisMR
         Nn/g==
X-Forwarded-Encrypted: i=1; AKwUvBwdm2witzH00y2j6+HXkhjw5cK+TRwtAOgSmX1kWCi1QWQP19LHuA6hVFvGT2tXP913R2GF64Cvjxc35eU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEq1VsyCaAL6A0NUKx3L7UPNr9c84cMK+QLKstJ9r8JQZu2S9z
	AJhlpm8uf1EE+8ISX49B1vWxNu4Kty5URopjgXNPFzYw4Ez1FaStpFgX
X-Gm-Gg: AYBFou0FJ5OTQXCSemiDwA27YUra5PlFVHJ2Rlj3LAqYahW/cntxQnbaR5Ls4dUVyEn
	e/6bP1bWneyUftTIMweUcR2Js/6uz0v3XtEdSzutIMLGurBrExu0Wja5mT4qDsAvnf7edzmhx63
	H9h6VZ+kV4xmPZ83QewI+Gkl63fgDVDPrMoszGb8d0/zsidyH/JKiMBy2ciF1GpEcIIxR9ylDYo
	AarJU11ykMJ6TCvTDeO/AIFa682saJRvwd1jloCRgPLjpAQsVm5uYCIIlYtgGFVa3qqJBiEhR99
	Eamexl/flWX3ruFdaQeoOLduMjaWmxja0ydeYSj07SgMN4Xb7cGKRrgpRiwrpCk5RjbwlUx22Tj
	RAS4asFgqvtcH1F32TKSI+Ji5LntDIeqkjvgvPGNLVzJ6OWb+7VuFOLNi4gC/yE3IXeFACi29Y0
	8Pp0W9QYi//CIvgP4nPhb7XvKL8N+fOBvtMkyJhOAI9L71GnATxtd8uWj4Hwz68IcNawNRyceGv
	SFWtKU7JqfBe7X6aWIYGTE3MOWikVDsegYJsc9EsWLW7WV3vEnd/uWnqff7
X-Received: by 2002:a17:90b:17c5:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3acef5f91d2mr7219305a91.67.1792424936253;
        Mon, 19 Oct 2026 08:48:56 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ad5cc13658sm63271a91.4.2026.10.19.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:48:55 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] drm/ms91xx: Add Kconfig and Makefile integration
Date: Mon, 19 Oct 2026 23:48:08 +0800
Message-ID: <20261019154820.68659-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019154820.68659-1-hjf3108@gmail.com>
References: <20261019154820.68659-1-hjf3108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable building of the ms91xx driver

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 MAINTAINERS                     |  7 +++++++
 drivers/gpu/drm/Kconfig         |  1 +
 drivers/gpu/drm/Makefile        |  1 +
 drivers/gpu/drm/ms91xx/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/ms91xx/Makefile |  9 +++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/drm/ms91xx/Kconfig
 create mode 100644 drivers/gpu/drm/ms91xx/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e678..b7be4261bc054 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8243,6 +8243,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
 F:	drivers/gpu/drm/panel/panel-lxd-m9189a.c
 
+DRM DRIVER FOR MACROSILICON MS912X/MS913X USB DISPLAY ADAPTERS
+M:	Ho Jie Feng <hjf3108@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/ms91xx/
+
 DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c65..93d73c7b90ce1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -330,6 +330,7 @@ source "drivers/gpu/drm/mcde/Kconfig"
 source "drivers/gpu/drm/mediatek/Kconfig"
 source "drivers/gpu/drm/meson/Kconfig"
 source "drivers/gpu/drm/mgag200/Kconfig"
+source "drivers/gpu/drm/ms91xx/Kconfig"
 source "drivers/gpu/drm/msm/Kconfig"
 source "drivers/gpu/drm/mxsfb/Kconfig"
 source "drivers/gpu/drm/nouveau/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923a..8e98b7ac89f2a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -191,6 +191,7 @@ obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
 obj-$(CONFIG_DRM_UDL) += udl/
+obj-$(CONFIG_DRM_MS91XX) += ms91xx/
 obj-$(CONFIG_DRM_AST) += ast/
 obj-$(CONFIG_DRM_ARMADA) += armada/
 obj-$(CONFIG_DRM_ATMEL_HLCDC)	+= atmel-hlcdc/
diff --git a/drivers/gpu/drm/ms91xx/Kconfig b/drivers/gpu/drm/ms91xx/Kconfig
new file mode 100644
index 0000000000000..526aaa2ee5504
--- /dev/null
+++ b/drivers/gpu/drm/ms91xx/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_MS91XX
+	tristate "MacroSilicon MS912x/MS913x USB display adapters"
+	depends on DRM && USB && MMU
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  This is a KMS driver for MacroSilicon MS912x/MS913x USB display
+	  adapters with VGA or HDMI outputs.
+
+	  If M is selected the module will be called ms91xx.
diff --git a/drivers/gpu/drm/ms91xx/Makefile b/drivers/gpu/drm/ms91xx/Makefile
new file mode 100644
index 0000000000000..98dac2602c135
--- /dev/null
+++ b/drivers/gpu/drm/ms91xx/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+ms91xx-y := \
+	ms91xx_registers.o \
+	ms91xx_connector.o \
+	ms91xx_transfer.o \
+	ms91xx_drv.o
+
+obj-$(CONFIG_DRM_MS91XX) := ms91xx.o
-- 
2.55.0

