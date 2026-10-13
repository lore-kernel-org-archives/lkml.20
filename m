Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6C41D239;
	Tue, 13 Oct 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884755; cv=none; b=pC22X31Ju4iqo/201xd/W8QL7cbbZ5bk8WlpXIfSgtANI6UTsdpsUpLkyVj1Jab2DHFkNtBKqpUK8hxqYPqTfrGPN0Wyr+q/lbQ8D1yeiCvhWieJ+rdKloslAk5Wi3O/f45ELNcGbwhC+R7pXlCEhIva3WmIPZYDc7kx8PlC4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884755; c=relaxed/simple;
	bh=DsmKtAg9kHXbhq0z1HToW5DmnXyp+tUTcmp0uuadwcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dDnAAzDs2BLhPR9rkgDyOhWaDY7mkRz81a12j0Fms84qlqnstNAOelZTMQtX6hTlPionauW0IE0mIyNCMYI8z8ECv1APEntegwNvl2i4jASlKpLSvB0shjQr/JhFeH7iumhFmt+CwbUQVerwUsIE6676vZj+5EILpfTXBnvELtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=JfXvW/ut; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="JfXvW/ut"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xFlrCpI+Yd6quURj+Qcux9BYhkPUHzJhK85eTLRuPtQ=;
	b=JfXvW/utIoeD4MZQd3eJagYvekqdJYySucnkcJCxq1c4OU1UjSrqi07ALYjlQtnbtPAAx/
	Tyn0p1FcYInTRyaXs7BPryg1goO09j8PBBGVRVC2BS84rw6wAnUg7C7MzaHDoCKx7YXGhL
	iYt6zqc/AlI8zvSqEwjeMHieqzDfODvap0V9oUpssMWchqk56FpqbYFM2br8goGo4+7BAR
	FHURH/zGUZK9e8ZWZ4JhlzNiTW4OHsJDQVAES0V2yL6c1PwuS39tDNVUWKCO9kM1HIWORY
	EOMA4AATGd1vd/4A7C8imNpz6xCjPKetqf9zSPpOYu17FYYXqMrtbX323ZJLkw==
Subject: [PATCH 0/8] arm64: dts: Kontron i.MX OSM GPIO Label Fixes
Date: Tue, 13 Oct 2026 11:44:45 +0200
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQtJqFVxEXSfwTR2oaMq0Ip
 Xc36vLjwdtIUQVK526jipeozLnBHDoKd5cTWG7NNPSDNb0ZeS26VLin5MSpyMyT85g4yhvKNkY
 bjuYU7OipLUrFL7TD5fq3rv6BsHyftO8f0SdoR4AAAAA=
X-Change-ID: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=DsmKtAg9kHXbhq0z1HToW5DmnXyp+tUTcmp0uuadwcs=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs3x1rN8ia6Hje3i605r+myoRD26qMDh21s3KMmiej1
 qC0MulURykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERWdDP8D2G6WP3kyxEH14VC
 T8LrOnh7BarbY5ef754UV9y88OOh6Qz/w+f83Jfe5NZ4qfz93+vO65iMZ6aY6ynrCR5pm/2mOOw
 BLwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

The OSM spec [1] clearly names all pads and GPIO labels should match
the spec in order to have unified names across all boards. The intial
board support uses different labels for some pads and contains bugs.

Fix these to provide the correct labels the user expects from the
documentation. This invalidates some previously used incorrect label
names.

[1] https://sget.org/standards/osm/

---
Eberhard Stoll (5):
      arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#

Frieder Schrempf (3):
      arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec

 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |  6 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 84 +++++++++-------------
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 41 ++++++-----
 3 files changed, 59 insertions(+), 72 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

