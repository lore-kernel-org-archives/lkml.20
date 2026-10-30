Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378154;
	b=mKrIVhvu+UegVvzQwwJEOC/Dm3UZHJSR8usSCCN2ScYzu3iEGxqPZ6BkBPrjrIidDD9i
	 8ihm+V+aQ4bTRoGmXKqIgJEXksCOCJKZKh8k9lZOM4CPBIrq//qsS0JaVTDsF7nKZXzHC
	 Ou6auiTowBMG+vkz0I8TPAUzwDsjkcbgRiH6ZQnwWCQDf1MlSGwbhKKOW45Lo60qNsvZ0
	 Mi6Zm64zG5I79qZBNUwoGU1VFGwdrKKKCEUSWV+h1oUSscnobZq2TiUqErl5SuiTQnx4w
	 h5tY1PQQiEj5eG1Vkw9V1cIjk/jGlBKy6q+vczS9W9x9RmjWXS8ijK7Hj6/qhJ2jaGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
	b=KPVlgs10VLKBJQoETIyQnsBhLPAwj48sLYoCCf8R8ZXlDEX10q9LliKsD5AhkhJIeMiO
	 BdhYUIl8dV224x0PCoX5P/V3DuujYfuGNOXDNerm6WhEYBX8NHeVlckxVVNG79p8aXAeV
	 Y/yYYdtr+8NnsVLwn2kJDNRz+F/T3D9prkzz6MZJxiZwxV1Rzz34UiwlWJLiLaGpveQfv
	 dBFelMS8CSst3s393jARNI6aAlwwiRkDQ4upPWdwxN1QGOoMP8piqdN0tuA4yH4Uru3T3
	 GYjDkLJQRJq6afNY6yDi079pIfxU8454hN+fxFGzJJyXkx07yF+CsPycn1FWWVvt1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hsRGFSSW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41770606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41770606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=hsRGFSSW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9989045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378153; x=1793982953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=hsRGFSSWo8wApRPKJHaNm6BbRbpz7q6s9AOrNTZBhYQL1B6V9gWecyn4zjjveUMsf+
         RV8gOsrxn6DwVt/VnKcI7rAFdHt9esplQ8tYcjO+5O5qMqQPgoutG3SQlf8bNn0LXRZD
         hMERcILGw5DQDrRZdN+/d8NxuwzIQYvi6S1n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378153; x=1793982953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=nwd4rHmkWEQ1UcySpxhtCxBXH7LIHZp6wgpBoh02Zz/yqLyC/uqWHbfxYz4ncyoqIk
         9jO8IE3cYdU3+P8gwH1tgtAb1rNK6lriY3/RNCIeRirftz2EarQWvAraNRxIFg0FdQOL
         rMpAfWb1SseJCCLezRetgJWG6SwHgebr8LJZYlvmj1XzXezD41/sATSE4LOhhWqsbEZy
         1DE5u/0wDVceSm0DTHGBDVuZAK+EiXRiK+ZR81v8Viwvm1bfFbFsm00yAyE+hcgc/asN
         aZpAzzgbQhgtdILAYiR0dlNcct9Hs45zi94DGLH6F11X5WCAnK3e/6mr5cir6pBfkqtd
         6MQw==
X-Gm-Message-State: AFq9FYLnQH2u5vnyyH63DPwkTZm1R4YABL25c2NxFfM7F7mDAy3wkp5L
	BeeFGkSs6kbvx3OW7hmZ5S4hgwWOyEIO/wHvo84UT3VuKGc5xNYeDR8rbeJntGevGSBzFMQ6g0E
	nqn64
X-Gm-Gg: AYBFou1yyv/4+NEhCEU9ZN7tfE7gRv8W9YgguIottQjev6o092f2IzS4+H8BbORpLFR
	HOqw5kDoREECUJXqFP12B2nAs9hUMcG+UtwvFHj1GvtDu9nbEEsjJjue/XtaMogiaOS7/bFx1/c
	LUC1FVZOK4sqALabvs3yErK5kbSIne/UXjioXeQeTf642ivzi+3GPWFNCAocYh2OFE04cuD4gAt
	4257uS4gFbMiH6Zz6HPnSt/eUhqkYZJE+Ilq8GGhMkZWgcVIXJuXCZGn+AcJpeeUx5ASudRqzU2
	GVVgpBI/k1cFJ/HoGAUsWauimkcqbn6GdR5sG/0GP9wTqwDemQqYNmmGEducEl/QFw5HmgtEvGk
	7pTvt6pRbt0MSgc3uTKkWTwWsigIuLR1WxIEOAZcD7M+EpiqgzlrFiWfKjSVfK9x3s9TWUo2mRk
	ERVvA0gzpYO4+43kfl4mJy5pqMdNkTFssYhOY3hgkPdRXmoEWgofBPrECF3liG68SxMHmW765+r
	xSKjwzmkQ2QlMvBbj/Y84nMxPKNhbaVCEUJ5/DmjlSmBIO78MSryv66wnAFjmy/TrG13AAGkmXp
	k5+4ghXfQ6AocCJmnAiwbHR769vHIclTGaBMIkfm8bmksnXGvM4GkJiW9MlBmxvV6JFWMxv3iPV
	86VDR7wBl8NGddHZxWOBGCJY4c+PUi+sNGvbPDlG1g5QbtM1+5rruzkqRshAxcWib61fN6qz7AC
	COSwm2p4u0FdDUyc0+HqUpK6rl3A==
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr66801575e9.4.1793378152471;
        Fri, 30 Oct 2026 09:35:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:39 +0100
Message-ID: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

This series adds initial support for the Engicam i.Core MX8M Plus Fast
Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
SoM.

The support includes device tree descriptions for the SoM and for the
C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
LVDS display (C.TOUCH 2.0 10.1" Open Frame).


Dario Binacchi (5):
  arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
  dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
 .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
 7 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
branch: engicam-imx8mp-icore-fe-ctouch2

-- 
2.43.0

