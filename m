Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673492;
	b=nY5r/vqoSpEjo1p3q6XlcIsOlPe4bHkaw2hU46Tg9XbMseu8YsSPfBYNg6skkZtmZxFK
	 Kgy3d8ebOLokEVmwo5u1Toao0IehiTavs/KBLEEfD5GOUgavua+VEp/oK7vDAAggHjkpU
	 4YKgPWgUklwDWg4mIN9GjiDFdmulV+9v6Pw0W5K3ZgZCFX9Si3ehv0oRNTidheyXkW0z0
	 dSmPbLkHozeZkgZEpyVu6ZAjM+IMT7TaRWfaZpNK7UT1JiP1abAZ0d+q36Z8X1YFjieJS
	 REjUPI2B2T6POItazEnWzTu1WvMdqnv2ZUHg7z8FeJSQkvkp+fJms49G4doKhxY/HBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
	b=Nvi43FlLk4C/fc7x3lI9JYEwriCyfy3Rr+6NB35tBfU7uTafWdGZOxhqkt0uhbouXozU
	 AE9lqTf8CJ5taLdUJx+pFGa+kHLpFoThFeGeVkEnw1+jpYCjGkvhqVl8GcFiGYja95CnZ
	 QMhBxBnicsFp0klcBH5WedcBnZQQ5ckjCIOgGW1afgmNnOW8VZhhveyd/lb4cXfCQ2QJo
	 ECKsJxDLQH+QY71dbHMclXrhSBpNqu1AXHT8/PnRgMawHZtDZFyNjesBqyCeX9TnjK9OH
	 iu6fPVMg98WPJsV1hDRkXKQzdlZ0L0jn7RC9mnyH0rQiUpUkEw0LxUR8uMQPbziJbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dj11otAh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dj11otAh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so13495645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673490; x=1793278290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=Dj11otAhQFCoZX/THaaTfsyjDmoSJV/Mp/WGzQfTM7Ey2mHLr+bAMzZ7bFVSsqoS5l
         YtGXD9uhu1+pzJTgeUKvtY/lFuN16bNpWTGIdj6lXJAzsTdGdGnDVEMSJGuWQ5mcCMEl
         VRj865cuFNMSIykTtNh9NfaesjKrobKDlyBBQyEKMAkmmmM18DyeTpfw7XKhyVtMfCFn
         9GhTdq7i0uB6qgr0/4FckYrrimqTvpHiuJB8NGKDx+fTphwZO1Grce0CkUw0/xG2rcna
         NpmEI9yCF6Vy5NFx4X3M/VegjwBV5dn1N/XUmNi9IAEgh0ksLoiF4UKAXX4CsMNfbT2h
         ThHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673490; x=1793278290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=dh7eoOf5atyQj/2e6RnpMOq0Z64YJVSAjYc8AYavMY4n27duUpdztBaKq+McuLHujC
         Fq22udUaTx0t2FJZ4LrOuuKMx8i8RE/RiLNGFWQ1ymm8F/8CJHda7odFMqe4ZGF5Yb3D
         p/3MiAV7qLb2MYjpRLJ44/eHC0XCFCXYVBZjleXWeejdA4ZC8SXin0TTE+SlF+CV/6aU
         WMeqwThnUxTcz0Hzt/JGDYXsZ9ujeU5KN2SvX5xLXGC+Pi7S+wEVR3FNJ3HmZnMuhjZN
         vAEgNuXV7qCdKwyxLjpsYNjOeH6JBp5/kZzGhI3h1JvUrGNDbbPbEi1RjVQs8CkOpQv8
         cXhg==
X-Forwarded-Encrypted: i=1; AKwUvBx6lsP4SKT+VdcrSndEwQknRcJLqHzvxL7pc4YvaAYflcevC6Yjo98NO5FPircSQ1dwJHASo7zJyBj6S1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSwB0qShxrLlZUHiW69ntifDm0cSOPUT0TTPl3nnUAz+j/uR1b
	shM7vHfYtxUo35tlqHDywugvpSn7Lm7uP41E+PdSHoH57mW4qYT81qfa
X-Gm-Gg: AYBFou2YwHik7thM/Y21F2IfgHMRwzslQfxSOxI23oURXz9QeNH6CZXP9soTLbbzOoo
	qsmZ+/Kvb+vML8Il1Xy4fPG6WV/OD4gsmgDP9IpPPL59M2dcD3+gsHT/C55higrgv8CQnn0ivmY
	1dp38VyGacyhVvAkjdj+H7cxnKFB1T/g151s04xtDkzTgVopuoEdBF0pI5uSvgq5M244g/iGI8a
	qpnazRL82gn8nm3phWyp0L1DE9eFx4On8Zvbaw4AW66bC+IZauMZxP+mku9TyVhAYEBbEwoyqoT
	0sUOV4GP9AsDeXNBGKYYejYr4lpTPpX5e+nNYUrN30tJQ/5tKc63IQ1zKyaSjafP/pfjETqB4EQ
	L9cSUGNXIAeH9H6ftAy/S3HZa/FKCKHByJFeRaxTynmVv0+tMMA8Y0OWuFcJf7Qv6/wfaA5jiz4
	b9d2qlqvi44Cx3+9J2+E6iq3RbCiiDkCgHloQ35LXFQ6hT3vKF0yMVDsSRQhYlP00M9RBPWEJk8
	i5BXZ2SdaeVtrE7jp0wP73E9sfEXbSlutXiLwB+mLEyF2m+NGgmQTIvpwKcX/5ZvuiEQ1R+heX6
	yHbibXzOoYOWR0WhiskOnZYUp+aMGZieOd1suRrTdCtjJuV6oJMergo=
X-Received: by 2002:a05:600c:1f88:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4a1fdd09ef4mr107714775e9.7.1792673489828;
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 NAU8822 BTL overlay
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
Message-Id: <20261022-imx-nau8822-btl-v2-1-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 audio codec on the Verdin Development Board can combine its
two loudspeaker outputs into a Bridge Tied Load output. Selecting this
mode only sets a property on the codec node, labelled nau8822_1a
independent of the module.

Rename the Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso so the
same overlay can be used with other modules on the board. The combined
Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                               | 5 +++--
 .../{imx8mm-verdin-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a4f26aef77fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -253,7 +255,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -295,7 +296,7 @@ imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
rename to arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso

-- 
2.43.0

