Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227011;
	b=GrARGTbPs+UQw6twq1BKV6qipkcXtST8XEvYEs0a1NBpxReULDfzlzo87v+JPZw23Dq8
	 /PgrhDqSXrNAeh6Sdp0V7OGhph5v0trqdxWz9QPWesc4gMn51ClssdfsOP2jf/R87EVWX
	 FX2/AoH5dgD9QGhODFgcjnlaskj9CO4ANtLTFdxAESQ7AJg5/lTRk42quJJmvSabTaTpM
	 z9D9rkoplKypfjE7mCkOcC9E8zkyHlEmHIFoPYYlNmBTTbLrgOwgYW8kPrKjvg7E4b1vt
	 OmnfbN7i9qazDua0V916YGeTumpYZ197uhE3V1zHQL7kN7/9TUw2QMXOx+M5GUCMB+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
	b=LH/w8JCC711tF2LKVLWOWbMg9h5F8JxDhMUVIXQJjZCjgBMnVOzePUN/ZfuaT761DdX1
	 OOlkP9tQrSlZt0DjQJEaDhvuFkKYjFdym34rfJst45AUZkJPujrSqOW4/+NcTKyI0RKSe
	 UfBTWNxLq81T+tKPI164OHxpIx66XTYQEXV9uiIOw6tupzj38D6pjoCdeD6esKjNMG9Sd
	 igBxZ/hUolT0PxyqaaLi66Z8Qya2YBTDG2eIlPxhXkzeA06GaG4f0wwiBqaEyT/pvqS2r
	 zb94ZrOm50dLAsgn3LZViqj2aIl6CN4VwYcuWJ0Jp8AcEZH4XfAq806ZOID7obteivA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IQPPiYe4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35E606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC35E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IQPPiYe4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5267695e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227007; x=1794831807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=IQPPiYe4Vvg4tPUs4hQLCNmBmxCormCUnErojoV8mIYdMz7Fh40q0YB/vRKoQWuaiW
         z2y60I15oNhZcye7JSwwK4ocm5HQGJmv9JNfpUPSQ4P+ZjHpA9kXNq8Y7pprjWrhB1uG
         jV912PaVz6ar7FLDI8Tnf/xD7RPSqbeuVVThryh9QSrS+1V03EHW7v1kyuC8dR6P2/gk
         ecKcNXERH0lCGrnJoATM3QuGT/EpXm5BYr4JEjPlYI5mDMfDfvqyh+Lki3X4nSnux67X
         U+QvyVkSbSaQatPmmoWBzwlEfIbhP5gjnacR6rOhLgaeCqu87jAKZXd1hhFnCI1iQGuy
         wAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227007; x=1794831807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovhJqwiGS9k51qlnCtIasc39GdwQ5iWAHEWL5fIwMpY=;
        b=zOltANg8uPgPYrdbVSO7najxs3woGmNxn05UDc1Pqu3ELbs9gb3n2bczh0k+z1nXFY
         H5umCIKJZJiojVTq8VYxFL2yKiFwxakzG6esmfyu/j3QM/IC/y4vReQX/Brmxd6IlTjU
         DXfX6R69VYpbgr8hiRj1y4xufKjimvSRnQJ42Y9265iCRwbi8zfRqJ271PnAqb9vTto3
         GtqsqfopsdjApHzGIyssgD5dSNESfaAIlGmDMew/HckEfqOlyDDYIwIX8xTqpRfEL+GD
         t6lkaDGV9P+YPe/rnN7bwtx1VCjdtBAeR0iyoEl8KXjuuEKEtR8C93cU2ZMcnSLKdCgw
         U91Q==
X-Forwarded-Encrypted: i=1; AL+hErH35SgSYHkekFBkDbyNXnfEaAt3UHb+UMAUZX0Pl59PPBAa9Eg/LMRDi+XFTfi0vqBHjWAJk4aI+mEaCgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AnPpxRwV2h7UEIG8oEGSp9yMDhqhyfJN4P6/5By9E3PZFrGVw
	sJETDIWOgnvAB0kpymJ0JkWVgvGfWPY5A8msBvsjCwFaR0M+xIWDR9Eu2wZpFAi+8u0=
X-Gm-Gg: AYBFou35wg5/mh18OMvz77Xx31YuyWH+ed6QSJBffSfqUEysTAG5m/HGbmPw2OvCur9
	t+vAxNcxBYzSWqKlq+GFe/dDyrdCYIpkiQh6rXKg8EZzrFS/SM+I403LMmEwzkpov7Kpuz9ImN1
	0rmhMEnBN64xd1UkUNWePIW4P54/nV13ROydmUZaIqK4fUVtUYYQLCHjRU2O7fTPFMh9t0y2qkm
	vIgqmD+rn6X9p+rYPnP/xROYaHW61Tux1I+Z/sDe+a+/xn8NyenYCqR8L8ztzwxyZMTvuN2K2oK
	J/BZqkGMg2UVBCTjsvEA12c9yhiwPwPWaPTXx5jkvtizjp6ULHOAzqzxhVkTPCRe/gAw8xmFQSZ
	VWCWSy49c+KymwzBV9EYM6o2OPw9CdR/NeZpDFfFAdmf//lymY32je4J932heon4UBW1DtPJSWt
	EC5qxQBGmu9+gqKarcfa1IRm+0a7J+6iMWQisR9LUe4KT322G0B+y0euf90f0OsOTfMjNlBTnf+
	wWJiewf95Ol4shYYuvETYjToiyaW07DBZmqJ7QSn793VOT0UzWpSNdkpI5K6zA72LMm9fzg+H1R
	cyNnOW6tpIHffiwCeZ0s93E4d6TtpAe98TccI3hrO1YjgiHFainjA2ZxzW5Mu+e9+Oo9Q8DujQo
	lER0v1wJbMA==
X-Received: by 2002:a05:600c:1d05:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4b963c7585cmr73754505e9.26.1794227006810;
        Mon, 09 Nov 2026 04:23:26 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:25 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Mon,  9 Nov 2026 13:22:45 +0100
Message-ID: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
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

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier boards byteDEVKIT v1.0 and v2.0[cite: 59, 60].
It also adds display support for the integrated Youritech ILI9806E
MIPI-DSI panel by extending the existing ILI9806E panel driver[cite: 56, 57].

Overview of the series:
- Patch 1: Documents the vendor prefix for Youritech and adds the compatible
  string to the Ilitek ILI9806E panel binding[cite: 56].
- Patch 2: Extends the ILI9806E core and DSI driver with init sequence,
  display timings, burst mode, and supplies for the Youritech panel[cite: 57].
- Patch 3: Adds the MIPI-DSI controller node and the bidirectional OF-graph
  link to the LCDIF in imx93.dtsi[cite: 58].
- Patch 4: Documents the bytesatwork vendor prefix and DT bindings in fsl.yaml
  for the byteENGINE and byteDEVKIT platforms[cite: 59].
- Patch 5: Adds the Devicetrees for the byteENGINE SoM and byteDEVKIT v1.0/v2.0
  carrier boards[cite: 60].

Subsystem / Merging notes:
Patches 1 and 2 target the DRM subsystem (dri-devel / drm-misc)[cite: 56, 57].
Patches 3, 4, and 5 target the Freescale/ARM SoC tree (Shawn Guo)[cite: 58, 59, 60].
They are submitted together to provide full context for the hardware support.

Testing:
- Validated on physical hardware (bytesatwork byteDEVKIT v1.0 and v2.0).
- Passed `make dt_binding_check` without warnings[cite: 56, 59].
- Passed `make CHECK_DTBS=y` for both target DTBs[cite: 60].
- Passed `./scripts/checkpatch.pl` on all patches[cite: 56, 57, 58, 59, 60].

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
  drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |  12 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   2 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts       | 459 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts       | 441 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 11 files changed, 1321 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
