Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BC443C29
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789945; cv=none; b=kGaW6N8fnPH6vZWy0IXDnmf/7s+v3RemjDQfooWlIbMEynpEb35oaoa96fs3mMPFe1FAoCA5Tv/ennOSA8KCOHB2oWb5cjBNrICvodR8H61nB0J+gHFBTnK6ddyxzT01409cH2QWTC+ZuqtezS1Oypb2csKhd9GBucaMZ3LqXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789945; c=relaxed/simple;
	bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t0B05nt0ug6iXMUPMtUsfLcKYNkG9NXSzCNYrxZBWjMfS5422Xte58nNGJ0KhfUD6uVMEtrOWbvPlRv1TLsTgTCY9Fy6LyyK2R8qAPauvrQIrYFgf9IuyqaFEFNe9CJDg0sj6Emb0k8y7fl4GZDK2jpRLx02Iwq/IwYhx84STDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElobqAhm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElobqAhm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so9669195e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789942; x=1792394742; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=ElobqAhm/Ku/mIUc0obARxzK/Cp86S4UzicGfxSurKj1nDtKJMB2bAsApPszueXA0O
         xOF47FRn1v6iBqOYbpQBz7EnQmvZlOmy0KKgOdZtPH9CYsUtF4A/ckCsJ/3ZbouA/812
         VjNyxvG86VScZ1dZ0kntjSY7ab9hfSJwloBXJwXX2IurY0+VUtCCM6V5oM/cEnMbrh2D
         STbSVUG7TrECyYsA3WdblqB5JNUW8hzpcjRZugxVcusw2npOJTti13GYTM0a6y5/gtHd
         qiDW49T1JnLIt6RZH+NaOclFEk2HBsdXV9kITdJXUMMUe1xFLw56ktKYZ5+Ut1mwawu0
         X48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789942; x=1792394742;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=eqUUopF+Aa0aRvjWrXkj4FGk2x2aBZVZuQBl0q/XufZD+5u+rYYfiRse4Ec2bmaXUq
         LG5ytw9MezUXvTo8PevcacYL0Gmhi2l6DASutEBp1ZMzrnyOCY7DnpI8fLRSr6in1YnE
         eLrSRQEp9efSIntcqiJu42WrkCa0XY3EOeGhiXA7yzGpmcwYwHqAOYKuqNSryAwSje3j
         xZXTYB6PYM+G0MxRnGxnlQVuSQlSqYLP2bDQqq5ApzUmICVzKiYJ9v/2B3PctuapIase
         tXqEy6mKBs7ZP65+vQlefvI7K3wggD5i9KuApvTfPOvq0+joe9VoxxayK8IXu2EOHNML
         O1EA==
X-Forwarded-Encrypted: i=1; AKwUvBzxvGHmH9fQ1RxJ/EIpIqixNzWUaprX2iAkBBLFxjkxlbYFDyRvmLj/fhN++fR68vgsdX9qfzkxEPsxs3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsqM5MyClDr7waxD9rjqELpQu17WE3/g6zX9bB5Zy5n+oRUq9x
	FtXjgRZKeoWmMGPEFHNsZ2UDfvcfOFo/rRAYgCbPZvGLcFtdwYSCbRUt
X-Gm-Gg: AYBFou13sm1RZf8Tm3Yt33I7Ljmfwc1nMQVIg4SJv5Fr3vxZpM0qlaKJ93n5ZXP7XPt
	zzClykhLDmj+MIL44OPB3dfKHqGf4T950JoBzU/ZWe2u7aUMrxCV0ezXKTdkBEsgQoFTIuyL2X9
	CW9SlVJsq0om5g8ssKkxGfd87V5lnRdANmqyP1NaOAGj3NYv1OkOa14VT6NM/O3+COpW24+AjG0
	+/jjn87jjT+0fQHei0HDVHuANJHB432SlETH9txwAKn3swna0tN19PAOFOQ8j8W78saihPunQbx
	XZAPiJMwMU3ctTgnruqrsNb+Qv+bHh6A3tJGi0Chwr1Sm+ZHYngjdHikY+LW8577KtoARRC4vEH
	XeaAM510XibJgl9ASwk8dmVT0rAWpnSsQ5SyQxzt00L6wtYaPDJ/s2x7xm7QY9qo0d2AEd3G1P9
	ImDNrrlywTaxduXSUGiouQJhi42Yi0dzMwNfu0PTHyn4aJk4w5CfpdaKwkgrKmH6aoQhctwiFRm
	eNl/oaNt/EzPzcHmZozITnibK9xldWQXwT81yHz2/jGvm5+heQEwRC2vFpAq8K2
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr158677175e9.14.1791789941611;
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add VGA support for Apalis iMX6
Date: Mon, 12 Oct 2026 04:25:22 -0300
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKLzGoC/x3MTQqAIBBA4avErBtII/u5SrQYa6oBs1CQILp70
 vJbvPdA5CAcYSgeCJwkyukzVFnAvJPfGGXJBl1pU/W6w6SQLnISUY7bIHuyjjFthM3cWjK2brq
 VIfdX4FXu/z1O7/sBKq18SGsAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1908;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
 b=6Na6Gpe9E1PvitnwV+dpCDK0x8whlxg3tt6LUG+45ePWH6KHyR7uTPCZpXJvoHbTKeZQq5b6z
 YhrD1XfpN2gDC54bNXQKOrMjPmqjFju0acH+K48bnab3b0Eu3MBtE5u
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add a new compatible for the bridge in the simple-bridge
  binding. This is necessary because the existing dumb-vga-dac compatible
  doesn't describe a data-enable signal polarity.

- simple-bridge: Add the VGA bridge match-table entry and timings
  struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
      drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
 4 files changed, 111 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

