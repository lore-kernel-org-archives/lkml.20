Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEB43D2FEC;
	Mon, 12 Oct 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786689; cv=pass; b=l/zIaEyh7Q8vsSoxtFJmA/XgzX/FpltgIJepymcHn9ruy1z/2iTyN0AYskNvjrW5xbD75Yz/SqazwMrdI+LphRwPsW8T34E4l8fkZWsFEO+AlzsdZD+Wq5nIrpP2rRp239Drvb2auPCLdfMMCU4o8vjOA1/0cMq4JIqn8K6hHdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786689; c=relaxed/simple;
	bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsUrqJQIOuJykfuG5Dc5etAN/qyStROeF5GbsAs7vFScxsJ4Q+1KckgBdKRuDACWgruUloJYjxH+qngEoymuEMCCVM9GLNy7Go90H4AKfypKLL+Z0dlbY2uiRbUgbU9cq74PMMUV0YLAkRZ8lkZb3/IG6iTVohIloggqQhGKi+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=bsX3X1Uu; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="bsX3X1Uu"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AB440200873;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=bsX3X1UugO7MVUGGjtlWOAo9WLj/IjNMRKkykNkzWEhnHxwuozekinpWsURNkOYFIRugW/
	g0IWKEGRErxzfocrKJR8B8kbAJcpfvKVZZEb462nEBsanfXz8u7R8L4DMJG+thRuv5MR7Q
	I7VPlskh6TYBrM9wm+K9V+zKH4Lu7W7TM4RwPV2fJ2/YaPuZ6zTXZbmaRyX8xxlnGsT+X+
	8zN9Ia3uDD4lOvdSvO4IGNDdT+8qd/ADHYPZD8rhD6IqBqx12/UeD9w8/LDdiRBgzbJNwr
	+FQQB1uHUMXXJfmLnux2vJd0NueAHeYRyAHBGxiYUXbTKW4W+yKKz3oKTfR0dw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786679; a=rsa-sha256;
	cv=none;
	b=VoBo1IQY9+CdR34kE0NM77gARDMyM+SpSbhUS+BOp0vxPlmCWxGJSn9NcYLTL6mednhMJM
	E+1+8cpDu4ENQGUu4vT0nvxXKSfCUA0Hcza41g67SUXqk8+uOaxVBR6VRiUwElw6MmWYvQ
	vdZyokFwNHdwHYJEAm4XVaL4ibkp2CVoWXP+38dTIGe73ZD+RKUMtDUNodkw8QDQO/K9M9
	73EK7DLv+s9NUPJ2CbZJp0IQ/rbQWvbyMPlLb4uJMHcuqyKQxzqkH93vqyfrKMN4TMaUcq
	fbyrtK8DZTnGr1Ogx7PGku1bRw8O8EhnuDPKwQL8hNGhQbFNPm40L/b2CqRTug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=eijU7suQCQNxtaZOHQfSxHuQmBv9nWsc7bHlsHP3INtAUPhk0TXqnrpP66CeRSVkLg5M6j
	TFZ6y/D2JVPiyyUI52l0RgN+f2jjY+1lW1r3Yaa4rxK5VTFYo4VwsbjlOcZl1Qdu7aP4O5
	v+lRtehUC3c1KOB9hpqQFnfbIdz1d3V8ZrCqTe4B2upbf9kxt2lcwN2FnX0deiFCnSMDOC
	M42sl7qFKyt95r2SbuN98DZaYJ5NaLgYukq2LFlUdw/x//cQg+WWdCwgVBjfuf8holEtRw
	uOTYBZ567YcRMIsamLtHlX0P7w1kmp9pf//vdXW9DfGKHlPRKeITL2Q+nUYKWg==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:31 +0200
Subject: [PATCH v10 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum3O3xj5458sVVu2z7731dxpe/ZdEN/p965I5pxl8
 vq29SviO0pZGMS4GGTFFFlUFlbwiXp88IycJsIFM4eVCWQIAxenAEzEspGR4etxhizF3S+LLkVl
 P5a4x5Nb/i/lsenTLXUWDfZFqxpZ5Rj+e7BEL/iXcuPGrOMC6v/Ml5daXO+Z63FDbEXL9AIJ876
 FjAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a compatible for all revC-based Skov boards with a touch panel.

Also, in preparation for adding a new device tree variant with a
different 7" panel than the already mainline ones, also describe that DT
compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805bc..3ff8cd69b0830 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1153,8 +1153,10 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0

