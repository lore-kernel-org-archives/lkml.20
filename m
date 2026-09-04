Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B8282F10;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526992; cv=none; b=JyiWR3S2s5hwk+bZIl81EUsDbmtaJcPmgPnrJfSd94glWsq7tk0MC8FdQVmDe32ffLs5YFeXxfY1fRnNWkhPByI7uYOXfV0xBLy3Ys0XTrW9h0/AhQKwM/xw/Jywp8HPY+nEHdGjOwtLCv4Ybh56MtuMsXzAysTMYq7XTkeCpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526992; c=relaxed/simple;
	bh=Dklj6JDaFdhZK6zw8E5qNZ4lRnEJ1KEPrHi3lBfJN5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PVebG8o0bSK+IbjkNG+dvVdkhEHPaWMh8HDHlV5efLl4mjOpXuwnaLh7YWKqjCsRBDjQaGWAD7AXUwjoe/3wWwa7/kIsyimCIhGWthUpc/wlF3n5OyuWk4TssmA0pRHQ9oajj+H+MIyq4tvgb2eWe/HmJe92Cu9mb6SmsvIqwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hRJt+QRA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hRJt+QRA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 39B471A19A7;
	Fri,  4 Sep 2026 13:03:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3C966057F;
	Fri,  4 Sep 2026 13:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C16F511C7AF01;
	Fri,  4 Sep 2026 15:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9voOvOOTmE0p/jaZPF0zwsc+G6r4jecsh5ZNm8BZdD4=;
	b=hRJt+QRA+No1CnkIDYoIXKnfSNyd1Mz1wkaLsDdBqyJBHvUjD+bkoe6u/PD64UW9s4/EDM
	lSz+quQxiye2eZko4D6WuOStXc4WADQswlrpZKvgdEcUyfhqYi/grT9TItgcGyGC16sw3C
	6Ow8nFWcY7ybb2gmFAj47iPJRuJn/Vowy1UXRrczpw9ex90xdi1yNGiYXsO8GJu3+0hCqx
	wwq6gFFMowq1BWvm69+lWkkQ59wm4arsOn1bLGaYMrH4e3mJB23a87MjxXuoEFhkKNGoko
	xViPnCf0gOdrBDUcIs4xonh4x86YzNiYACPGaVqQdUpgP+b2wk3wTpa+Q0uzgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] arm64: dts: nuvoton: Improve MA35D1 support
Date: Fri, 04 Sep 2026 15:02:35 +0200
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0Jm7Zj+RBBX3MOwgHaQSYSSTiUaw
 t2tnMDle8n3vg2EIpPArdgg0srCYc5gTgW4sZsfhOwzg1GmVFdtcaEoAafOXrzG1yIpUjehT4J
 1PZTak3FKO8j7JdLA76N9bzOPLCnEz3G16p/9p7pqVNj3xlaDr5x1pulDSE+ezy5M0O77/gWho
 giIxAAAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but:
1- it lacks a DT description
2- it does not work with current clock driver
3- it can be improved

This series is addressing #1.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Edit the binding file to mention the new compatible.
- Add a model and a compatible for that board.
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com

---
Miquel Raynal (3):
      dt-bindings: nuvoton: Add NuMaker compatible
      arm64: dts: nuvoton: Add QSPI0 node
      arm64: dts: nuvoton: Add NuMaker board

 .../bindings/arm/nuvoton/nuvoton,ma35d1.yaml       |  6 +++-
 arch/arm64/boot/dts/nuvoton/Makefile               |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts     | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi            | 11 ++++++
 4 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

