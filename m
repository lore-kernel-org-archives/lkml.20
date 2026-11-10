Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308360;
	b=SJJcup4YV0FGSgbrGHoXt2MoNfzb88H2K1k95QA0rj6ffl3dUj2cEvjxGr97av6be/dc
	 /am9umbNGPPsYtpoSWflBbd+Chz9kMY0imuM/+gd4Jy/pRu0zz/rAM38jWC8UB4ZuV98P
	 uAQP3K9ILJdtrccwNMd5KUgu2GpLN4NEA0VauBo6aAfqPWr2jVLUf3nAZHIdS6TVtrpVo
	 vW+Td9Og9luXe21WhnxQHfw09fPG7C+I6ARs/cItyM0E/NNqTpc813E6dHA5m8eBKSaFX
	 CS/37d2F4mgjBTx0jwwPEcuEGPnKh2bQ/X5wEWpAkU9wiJUCLkBbQWtq2nM1/Sy2LPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
	b=Pi1WLpef9jCY9T3SOaH9xqQnuDLoqzAd9NdhO0CITiR+VrmorJwMhW9N5QgHrm9vqYYE
	 hYKz6dpk+mY4gI0RjeE8Vjy59EUkWVJXCmxAqkB9VAvjq92nZucXnZY0Nds3/6MRpNqU0
	 D2bOYUxFHzl99g3oLsCCRg8TOoj500BpLQTEgLk0ARh/nry44DtWp6rCO4gbJiKDedel3
	 OFggNGcQ1V5AHe7ka90+m0/uZke5Rw52fAbG7f/03g5qE28v7/SKUBBsQnXkgjB95I3/e
	 GKJliVorJT0hIaJyipjLFHiQYl0F/WP49gHjRhV6RqyDpKOZ8/kkQT3u6ajv03KpBaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgRceA7o;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98701606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98701606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgRceA7o
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1211049f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308358; x=1794913158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=pgRceA7o5OESaKQnru6wYq3FjMC/Ed41tcOp6bsZ1kapycQC7S+U/CkAjSQvN5wbc3
         dRQwjR2Y+/V90wBCLl7HRFS/yswDRTYAIwraRhUjhpHD/yAOPPu7IQcTM86D4+7Qxt44
         d8I8aSb4DlGspytXKpDsveCCcuJc1CqYS+jaXNLzpXYlZbqehzqmhTN/aTsmeLOdS0og
         +h1pT6aWTiUpn+7BbLJBkBjojCp6CNRTCBNTBu38LQdqG/AM1lALwTloZHsumbSP/ADn
         sYUEiPNVPDhYaVMR5Nuv9yYkPKCyFKekWP9Qi22zP+5TRo41jvFj80ytPyixT8nqusJE
         4NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308358; x=1794913158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=NPZdsotj+TZJ8KGtq7W0HeI3hs51ZiVyC38zys6nBE3cWXeR4mY1sG2QQofAWfhS4e
         bvW/7/9yqpjCewBqUWHqpmpITMMXUK1Ro6oMKXYu+S8NTDUk7Hnsmm1iSWjbgQV/VQq1
         pB36o+HkwL4h5qgFfgIwXep7G2Bvo9vVobPKcWlJAG2kSoDSmEA4+d173c8qS+XQuNp0
         cTbJ645wmSTfm90dPAjBNSvCY+hCkTxAg0cyX9f5M5mXOZZw+rQy4NlR7RPGxNh7Xnao
         wJ2XmIFia6sedZNyq30HOStNexrWLqK2Q2zfgVDbBQCKxgCw0k5UbLuOiput4CCgdvGr
         vBHA==
X-Forwarded-Encrypted: i=1; AL+hErHdlCcovMzBj7gv3b+ACg7OcnhIQ1KSNFW40EoVZJnr2XZ6kirGLgJlIbXpE34pUq71L5DP2M/2LC5Gby0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+coVIeTZekiM56mGiic1Xb8ibC6IcFR6KYy4NkQAZ1xGTDfN05
	QvYMNVG7tSM7elwlqm6vxi7vPDszMg19R49yHaq3yNRxBIQbqfuJhnZQ
X-Gm-Gg: AYBFou1g+rctr3pNUXZUVuZH0PlvuK7bri9lQ265InepIEC4aLlBtCXeGtPDZbvWX8M
	gRyrqP5nUsHRhtubCErYQ98StQ6fDrV8k51XpicUp5Ph6aLN58XtVv38KjQ1mOejfp3WMRbw+2X
	IMUjhBrywm5aalvvJPZhcCKKD0UydFR8HTo8/QSBdO5HjplZwVh7dzEobC+nA2eXhpYLMraD5IU
	vDadbIRdghR3+HWQdKxhN+zHnwtpzhMmtbxv5F2mETIaCN//jqBspTcucyMhDp+xIpLFP3f9nQv
	VJ6L82yRGDRdbBDww7Au4iZxVZ2fhRZWa1eFBGVT9aRsZKyKPEyaEY/kN8gOafgI8hS8sdpE5Gd
	qk54Xe0rJx/zP72MJY3jC6hg13ZobSpR/N8KD0Yr5mFqyPow1WbwMftZL4CWKCn5JMJhmTJy7G+
	sxHWVN1WxM61POIHvoy8L2UYiV+nr65ATluuaGW0o1ZLTCmTEAYI3Fgz2fnOqN4d+oZgaA2qexf
	X21fKnUDL1sW/hT2ndFaYj3fenkS9wwJS9dPN4TFXyRFc4uRQzPS6YZas+zSoxUeTnuaCKj9ma2
	Dc45avhjTNYkPkXtjDyfpKOFew6Wfy5cg1g47l7UXz7+l+7eNVjvWnsqDNFa8asp6cv5aH34Yrh
	OXEhjLPq0YfAayAp0zn0AQTtsjy/KXSGtiW4sXFbZ94xrWRV5Ebg=
X-Received: by 2002:a05:6000:993:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49828d36961mr4278277f8f.0.1794308357856;
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:13 +0100
Subject: [PATCH v2 1/6] ARM: dts: imx: Add generic HDMI overlay
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-1-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=a0eIgXbh+uCZSw0edG05JIfZzW/ZFfMGZsGT3FOJLus=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5ZeElmX8df7/dmxifWr//6Lsm0bVnWB2FxEQN2
 O5nTloQ3lHKwiDGxSArpsiS8URVkE8hRNaDozkZZg4rE8gQBi5OAZhIUgTD/8oXOWsjGTq7l/xe
 kXR1wvdvcSYnH1+OuJzEnKAm/Xsaw2aGf8YRlW1fFnkVs0wJuW+8XKrc5c+fc7KbZ8QtOHfHIqy
 slwEA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a generic device tree overlay that enables the HDMI transmitter on
i.MX6QDL SoCs, to be shared by the boards where enabling the &hdmi node
is the only change required for the HDMI output.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile      |  1 +
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0ad7ee583e8..d03a8d2845e9 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -85,6 +85,7 @@ imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
 	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
 
 dtb-$(CONFIG_SOC_IMX6Q) += \
+	imx-hdmi.dtbo \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
 	imx6dl-aristainetos_4.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
new file mode 100644
index 000000000000..efb7dd5c16ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Generic overlay enabling the HDMI transmitter of i.MX6QDL SoCs,
+ * for boards where no other change is needed to enable HDMI output.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0

