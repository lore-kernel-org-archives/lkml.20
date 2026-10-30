Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378164;
	b=apYAjIzg96JTjUQ0lvzUc6qXM7w7w5G6ivZUYl9vHuQ37uVjamLTJRaCo/QbZqJxj0BL
	 JzWtGat8LdISP0gSqHXSFsnh0c0ZDi9FwNWdIvGsPSttLrFa4QG2AQZz3U674oEFEwtCl
	 iGlcftWYLQcsBQs4y3yU35VsBNW+rY9ok1Xt7C3EnzW+ulRDkYPUjInZ+nOQGEq/CoNUZ
	 rm/GsGGI1THiur+IBTLB5eV160MUx73TeBOgpBeJSXWuZGasMQvC4mXAeJNcf8NlT2G6D
	 4t1cXdY96rPJVbD/obS9fTYlEuHHnLdd898nU+Az7uZ1n8Qr5/Qpv4aveFEGu5jC5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
	b=y+od5jp9jZjt7DvdocsxKxpvju+KNx8M9BZKHUp+Ymnnv0MrtIqgCLLXS4ofL42NoCl+
	 fl6zER42oz0SoYiGMKcwflbtiEFtpVvGB6+rszn2740baPcwsXxYlE6Ajc5pBUcgHWipQ
	 NkXWhDqb2tfmKRYqSphLosLcX5CHgcXQYdNz0DLF5CBqB6WD4P2xnP2cZnSD75FZgAbtV
	 j9+EL+jhIa5hEKykp+ry7ieGlWrkXYBQlgp8qO5gCaG+BXMlilc208wM2vGRmsgsxjb/f
	 gGqYZyWhr8QP9IWJx3G5pzmnIs7ScyVKsyE8bhhEegXGuFlGAAdQPFlFb34AU+7oRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EwtEwBh3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9086606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9086606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EwtEwBh3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9079075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378157; x=1793982957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=EwtEwBh3l0LsMt3xAg2MLjTmnzz5m6FBqaOzEgePXYlVcoS8x40gmSYXRk/336EiUZ
         TDt9Ib2mMGMtIqbsJU/H10Oa9RV417jWYShhe1cbp1daQAu45qaYrlMwmGzHlHBGRfV4
         4ZoHdlI2HJOoOgjBQn6G6Ma/pqjUH5ydA4i5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378157; x=1793982957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=lrVuw6twfiRvdtaK+cIn+QpR8qv5Bjf34poDgz9xNZF7LCkXnqTD0jTzwRk++WRSXk
         ZRae+XRu9lAKTtkiAhp2gHKL/JlD2i/en0sXznl+LZM24DYVnSa1aE+UqHuDmQfp0c3G
         tAhhCfcOf76ambjWETqXaQzC3c14l3Awp5eGfjv0BPJ4O/nAZ+IaQ1ItvojZxpOXSQnS
         bVDZWWt0FtwQOyuD0noJeha41lnYS9yWjtzVLAYuzZhcL9BvCGqBrWG5EW73ZW/E85HX
         Cxtnfpgeb8jrut84tJuz72xC4yNlko/sNRVpgHzxqa5vclbciLiFtQTJjkF1JqJjDmLj
         5HEQ==
X-Gm-Message-State: AFq9FYIbKpkJxUhuxR4WCCH17oa3/np42n+oLicfjBJgnfQsdHq1PDJr
	hYjm7S7uRV0J6oIQngnepd/l1eeEORU2qLIFVdV+qD/fJ6b93B5ezI1PCchoAq+Ofxb8DiUNDZO
	0gaNu
X-Gm-Gg: AYBFou02/JKJsx+NMlt6qiljKLqMoPenyjMa3FksHZIVfRoCQw94q6Nuj46vVkQCotV
	vbaSmwwqALYnqM+yVS+1s/8EfreyMM0KLTt558vhlULvZEoWhrubELL0TT2M6Q5/NLH1cE3z5Dq
	Mq1EZ2iFKgSf2nZvQlVrMhF6fveL32WfmS6vdC+sGFHhlVCAtlsagUn68qVBgxBeL27vGPAh4+m
	VTuv7MoXA/jfLu3Shwc3bu85vCSTXsSgJq/cfEkYLT8M/KDMU1BWlF7cKtXwu2gMgs8vvFO+ddo
	pnX9F66g4va/Heo1QOHlvbuXIdPJV76vkT5sVAAT3ZZCvunCUnXyj+CN2gpjGXafayim1kZssLF
	ifywRQLw0WcxsbD9IZ9Ky3Ab1JwfY1o3FJeT/X5EiQPbfoom5ZKulED0q9DNXOA1m4Ir3FFlKy0
	mF48JRYqK8iQ8EKFVh+6SMoL+rJP+89jj1qGucHLXgpwfMlcP4zLvm5/QW0DBoTRw1YhdFikUrU
	75uchvCEYV9wdHfZbNuOzAameGEEq6pHqqd34Z6p8PkazEtrikByNuHrLj7u6C0EhXJqZ1EoU1X
	JUylpozhbNWmLrN0MEXoDP58gNGaLsjiM2Z1JDOMpWUUODLoDehbAXul+mPOoj6UxJyPCoZR6Lx
	Gh3mhB74+QvQb/dztzVQo8PRIcmSV4KYSZeRWq6iS2g8sWB71YxvRUW0Iulv6b8hz+UNpmPuwXg
	QruvrQ+WYr2JDwUkI5qfHLqr0J8A==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr63214265e9.0.1793378157371;
        Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
Date: Fri, 30 Oct 2026 17:35:42 +0100
Message-ID: <20261030163547.2682583-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Support Engicam i.Core MX8M Plus Fast Ethernet SoM, a variant of the
i.Core MX8M Plus SoM which embeds a SMSC LAN8710 10/100 Ethernet PHY
connected to the EQOS controller in RMII mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
new file mode 100644
index 000000000000..1341de0ba4b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+#include "imx8mp-icore-mx8mp.dtsi"
+
+/ {
+	compatible = "engicam,icore-mx8mp-fe", "fsl,imx8mp";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	snps,force_thresh_dma_mode;
+	snps,rmii_refclk_ext;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {	/* SMSC LAN8710 */
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500>;
+			reset-deassert-us = <500>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x3
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12
+			/* RMII reference clock input, provided by the SoM */
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x12
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x1d0
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER				0x91
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x1d0
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x1d0
+		>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_RD3__GPIO1_IO29	0x16
+		>;
+	};
+};
-- 
2.43.0

