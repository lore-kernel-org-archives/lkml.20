Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9B2DCF67;
	Fri,  4 Sep 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526994; cv=none; b=PZ2h2FnE00TT+EpdIynkmkj1wP3WW8igayN5rHtJytz7qA3PmlfYrYHmg+YeYAYvrhT3r9nYxogONaTmFCGbVfxk18bJiIrWDukjCX44W9eL08KRYL2ZpqGgh0ljHvKEJ+Wia39iNYTkkimiek4vKm5XyC0jJUyFuAes2zlLl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526994; c=relaxed/simple;
	bh=550a5UUxYYtdZC+chP9FRVZb6VTssB757jXRI82GmOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BbD6FDt2cYMza5BtVSIBxI+mqkyT6S+WTlWTp+N+6MXItmSjtdKvR3oDRfroglY2xpzxtXQwP9n7yn/woDaEz7MlENwGlLTGeTtODhWn4ZAPFj+BCjf5vIfJ1UQvev/lUxbYUhYSoge+LneHyPf4VcPbqzLg2Z/En7WBAwvtGkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lnoi88sE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lnoi88sE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C83E24E4150C;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B96F6057F;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A178F11C7AE94;
	Fri,  4 Sep 2026 15:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	b=Lnoi88sEb0A6TD870U4z9+BTIX6iwzgoROcFBsgoM+el1xv0bD3XfrG3+zX7BcXSHLOt4B
	75h6eqvCqTP0ApKYsdL9h2qhXUT8RwUyKuBnYamsl1pwYApRFwjUuY5htL9exUrpsoKBiI
	t8ro0xhtzQB+U+fLCBxelVq5mQHavxAUp229yqgb900B0Twcw24h2QpdmAHVXaV8kQl9wE
	4QcLRmS2ip/ruSQGsP4DAieKSKs1RCBrIj4CcsvKGJsVehilbFLodcWxIR0Fq6AOJeW9qX
	I9Nsp7w4QiXhSRYDH+aOznNvPLeTkSACkqYWwI/eP5AKJcKLA945nb9jND80eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:37 +0200
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
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

Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
for it have already been contributed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9eec44128d28 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -431,5 +431,16 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		qspi0: spi@40680000 {
+			compatible = "nuvoton,ma35d1-qspi";
+			reg = <0x0 0x40680000 0x0 0x100>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk QSPI0_GATE>;
+			resets = <&sys MA35D1_RESET_QSPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.54.0

