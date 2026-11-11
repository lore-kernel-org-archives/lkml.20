Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428630;
	b=gLT9zcLhfGQmdmFbn4sH4Wuh/PD7AnUH8DBARWx48sN6nd7guW05oizsGwFqAdwsnZeh
	 aS1aGxFgGydrhhCTwzLa9Ja5/cluGxSxFfvsC/hpCXp404tUAc6bQGyHzvH0sjZpCQtrb
	 veMgikqS5xhBSEHvKWH4GgpXxwJSjKHUi1yb8Bc91+/lSqHDHT5bK7sTn4sJsljssn9TC
	 haom9f+Lg9B8ZEdArAWUGrhTybSZ71BUi67KD8nGHabqsnGb0yBSeTzPwbIn0bMbMHOv8
	 4Bv573dlFcdmgVehqVQ/HrZ3P0pmu2pvHPVsmxNdXV4MkninS62bc4mOldZSOtPT1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
	b=J6lMBMyE3GkimEtUb7ZWlAM7BS1pQs4OEUy4exQVwaNt0BoMbqltmSzlMKbkSYLFDTNB
	 nKyUJRF2kroxVDoTkcXphCVuQ4M7HoUdYr/ubzLc9iJr8cA3D9fkKMqxe8ki2WmO9yEMb
	 zxKuU4LSWyR7Xj+sXBCHLtgtrJDjnqiXYOmwzsYEtXMv1gNgjYhFO/dMLDIa1XEeNFtiu
	 9Yksi/T32DvV1y5YpFK1BffBGQOQrRTKbyEsk00gP1DM/BE+9/m4bqWGxgcsUdOR2LjpA
	 vmZiJhNWJY9zdXQ61mdEEd2hmK/4glkd6AVfsmrs6EaiWKZ0pxEtNhWeuqs8BVtXwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvVQJW16;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AB4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AB4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvVQJW16
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso2853484f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428629; x=1795033429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=zvVQJW169YCl2FNv5XPTZUnB12yoJm+4jxM0NiJnDOVIPtAqUg6eYQ3foS1EnyNukP
         eTcWw99nUrY/yYWpegdwesAg5R+XcMpkUL60Gg3+8857AfWtcNZSnd3iNlAlH45m1k9R
         gmDy2K5k0Rik78HAIafesPAcgbGe1B52O4B7tSqGymO+tCLWGx/b+3qGo6v8aVAM4yE+
         7NP79w2BJqR6HXVJ4tZ9cG7DfXf/F1JqsxwhmIG1lsXJvO+zhcENxKFAUo3/6l8AMaDC
         uybUfHV2d+yJp9sf/PP0Rr/bJgRlZ0dTT1944Xg22EPxn+fUqcMu9uM8h6qEAAN+SxNO
         04ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428629; x=1795033429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=mhZxgtYiZ6tRgOu5oGKah49gdToJSp9Kk+h1cu69bzXJ8PqqtkcbTFyhLNE8TyeCOu
         xXD8lCAPqxR+XTGaI8p3vA4kVyVCgIH+S4MiMDdqQZuQxMBqk5hR7LFtgedkJ/NKlBsM
         jY8HXWXgN8V3QTJ27uoDQHrX4rC66JZa9IsVwXQ9yMisTU2nUZpp5N9M9aGsvWP3z3Ao
         Ngq24GALneIU0EWOuWUBMHzzgLL29k25A78FagAgvcTuNneUX8mQRtOCXOAkVnG1Do1r
         IByObp1pAUwzHDP2QnQQDgKELqJx/yJZa4xxafyCXaig+oo2/2Vy7knUpPIa6h/dCLRd
         EvHA==
X-Forwarded-Encrypted: i=1; AL+hErGz5rWapxsmyV6rCk74/jAPNxcsrGdaAgg40eUNHQ39uBV1lATr5Bd+eqYWalpCZnek/HLBGn6n6VPY63k=@vger.kernel.org
X-Gm-Message-State: APuU4Z940sdUj6nSv5SbNSF8F10lAHmO5uu/JpsC5uz7Q6V/a6RQxAHU
	svl6EUZ89wRjvPuPnCdgnuB+FAmhaJOXeaVVc5HhpFR3TtLxsvSEdbC5
X-Gm-Gg: AYBFou0DsmSUWzfLDwbi0U6Rb6sRb+NEL4APqUtI3QjHKpgHA3++Cz7NrrICI3h+KT+
	f7x4/tSep6jhuZ87d0j77L25HhxcjhbcAlTPBkYHQ8LHCC6+GtfnOUHQd/oRDsSIYa2VwRSL+MY
	BWheBJwX3Y0rwJc+j/J6sjdlTdG1uYFaZ9ka0XVAyo9EQok+MUNsFQUOk1HsPoh0kwtMjb6bSRB
	S8ZbosOjPodSC+fVwkS+EFJRl0qRuOQYqaNGfaZ/SyDi7o56mZsfunwbdzCx4ZnQ23rKStQESTd
	wCn6bvqDgFV9Xmh5otgkwQvTOtQrmSemuISWyxaHkdxHLssGbCm6pYZJzM9IoowLKZbQPS6/nXI
	fGXshGhgB9JY6Uhv4VR9BviO7IqDxzyeuegZ9uJbhWgBUylsvXqS4bX5F7Ng5qT7nevAcrkcSg8
	ESohzI6i7x5zSgvsoEo290wWjvxSaIMEPfya8vaFyLp6E1vruqfQF2h5QHSRODqsKagIfTOUtO1
	e8xXmdyLx8I1D4VYoideBljrvtxLxfEOF4/6R3gYQVjCSWdR77Q5nVMYLKzATMffcw/TAdxoY/x
	mKpE3J5cP7egqayuf3b8x9DfgWasyHsGfRVv7WRJWnD/oY3FN8YoyZeXb2aUKQtfJ0T7us/aSuC
	LHIGArAvDFhxPxGcVxcO00Mix40SjnaGz+LqQE1IpCQjqQQgBNi3mxZY=
X-Received: by 2002:a05:6000:611:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-499c89825fdmr6554563f8f.10.1794428628387;
        Wed, 11 Nov 2026 12:23:48 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:47 -0800 (PST)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Wed, 11 Nov 2026 21:23:09 +0100
Message-ID: <cover.1794420001.git.stefano.r@variscite.com>
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

v1->v2:
 - Remove the unused ft5x06_ts label from the Echo touchscreen node.
 - Add uart-has-rtscts to UART1 on the Echo board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 648 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1295 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

