Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334889;
	b=KBHN9XDV+1T2YGPEJC7iHAVDE1aTDqf2cqTj9CWi2fPxQyJa62K0WeUGG33qBFONJMr0
	 g0yWXA/7xgPVZwFEQu4WhrQB3tpWeCbtVDVi2aFCin3Z7EupXbFKlpfdtdT3IrmpETDnm
	 C+Yf4rW3s/i/YNIhaqHMnY+pcC3W90txmGuu552l1bvh1TGbWoIHAzwFRGNnRLRBSxkGx
	 HREkv0knUQdOKVU9+OtR55+WgpluKWqZRalkYUaQrSOoUVdHhgwi9jMbNmMi/g19uS+QD
	 KIB6pXXciGwRpLKWLAkCUHjnE5Kg9VJNBdpBoiItdt2E70ChNHFPO7xatTSOzo5li+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
	b=G24FwpcsPJvzEXbTJnuorRTtbY+XcwnLbaWzIL3HQ/lrTgAC6BYzdcRCmvYhYCajHGRJ
	 IFz2FsSvx8AYWQV0NIC3rRtL1ZsbvJOX3I5yXwHm0NtDIPhzf86tshPhhSWR7hMlgYPWp
	 MuYs5hfqnJKmDCH/4kmYXjQsao2Sl3OKbCSJgsfzeNufZmXgjL6qBG34+dy2YIah+sTpb
	 jAI27J/0XiOd678VoLFUdJMPKbWNz+v7vdCwmYLmDDeOYMVRe7eqVJlJAYD2vayx3ecTX
	 JaluEpPIfYsG1MwfWsl6qyctgQYlWBRlEp6pA++UifE7RbmWlgkC6Xoj7h9QiSE4f3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMKqWfWA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C3606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMKqWfWA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so15948475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334887; x=1794939687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=RMKqWfWAghzk5WJuHRkb1WroS6RTG+obBeePaKx6J5bQfU0ZMHKjkHkPl6sL/w31eX
         PwigkiYuHVH6o+Sea79842++t/bM2z5y8yn0HibdY2aS8MjZy5PHguk/K4UGy+/w7/1T
         dE9wWNABKEoXDp1j9Q0MhvBbF34Jf4qDZgNr9XsN0fR1tmLznMBHOOOj2972JUm3sx1L
         sWGU4u6zv9t8HmEh/r21Ds1ORky6PzkdS2JBJHxF/ceCZbYMd9Ypsrk8pyc0uA7HFTsA
         OaGWy51YrbUMeszqh444NCapezU+pVBPAlFzEpsqJ+NZvqoITX/aQ5pvlGTm8YfAlL7w
         BjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334887; x=1794939687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=tVyeXBd/+KVJKqFNLvfNN6DB92ums8ZEGHxTGKTCy5R0O4knJwZ2Jnmkca4Ny7lgwT
         Hw3iMmgAphoaWWEVr3HlsEtwtnekzXZBg0L9Sb65mTJJ4SnteezghqN7IkHxdttu2P5g
         AD8j8d88dBzSSBFDa40mmmiwsKLDMcB696SGR+zUOv5L69cFe8KSEjAA2ippTVQcSwyd
         G42Av8Z8exzN9jMl7SlhNvaRBnYaA4twiT075Wzr7LlFCO/G6XOb3mkd+rYo1qU2CTV6
         XBKsjmCtv50+e8aJgdSKuqel2+8LByU16qexzEOiH3lkJo/vYvvtAciVtShfmqASvLd+
         xAhg==
X-Forwarded-Encrypted: i=1; AL+hErF3faa9QWM/15UF4tRen51DlVI/4OsK//s7GnVCMegJhzCzTNoOr7Zt5zff/ALes/GCS1FvOSuixVLb2KQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PWCkiVz0KrbpChmPvpeX+1jsxjG2a2E1eG8x/xVhSbpPDbUx7
	bLAONddDZphUGkiDR7pS4u8UmKwcaXi38qK6eD3d/BrWdqOblWoqDezL
X-Gm-Gg: AYBFou00SXdJ2baYyW/f7CZPSDaNrJKXP9ObMkYF2tSsbARayjfnwQmsObPxuTg9weF
	q4khzWcbXqyDirkP1i2HC6W6wMaR/K/sG+vCkEOWY1IC8Zpf573L3o6Fb/KRHAvPUeNJik4qDO/
	tw9ek8MMcp+aLxRtKpHW7i3LrIQtIriaPHjbCS8zJ/gxeJLfdYfyqwiF63UzKEKztNOFepaDpuD
	SrWOxOyRkREGvtMgIvt0aRPlKMRHpm9n1oQA18RZhWk33JPJAHz59C9wtqAroZQS0AqHoHjbOzG
	bl48PG/+3DkJX04GdworKz79IwGHkTrw68bsIRT3O/bp2Uh5HRV/Q83ZAub2JK8z4w//7sgSVBg
	r0GmLKE+0UhFGLAo+0FGe1LSAQtxovY1aiDT6xDNhjIvqyHb3oxDRJI5aPZcjSsu3mACVnMrj1/
	mXhlrwCUHFs33XzwquIwG18Om0zG6j25e3vW2/knjHbUyUkT6rCMivH5X1xmws6sl3ahGTVFT76
	030NIiPWMU5mSrtY9p6WKn8b7tvxFUT38qzEmbDVru7ZQQYU1y0pjqU9j06MY1GRfyY9gZdK/ut
	bSw6Ylk0RvSFR5hjOvH/C0uHPny18tDdu+JEVfWEIjcKzuT+ICjpDRWdyPcE69rK0iXNR0ZADz4
	uZNWeBpFvKgo0qMKc0jC8xMnbuRyaW9ImLUigFulIozYwDLljfrv1UyQ=
X-Received: by 2002:a05:600c:8b84:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ba02355aa5mr62875845e9.30.1794334886677;
        Tue, 10 Nov 2026 10:21:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:25 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Tue, 10 Nov 2026 19:18:10 +0100
Message-ID: <cover.1794334398.git.stefano.r@variscite.com>
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

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 647 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1294 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

