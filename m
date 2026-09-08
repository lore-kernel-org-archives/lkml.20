Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5154DAF2;
	Tue,  8 Sep 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876002; cv=none; b=VXa+jquutkQGhB6d9dOHcvaBXtzieD8Qlniu5ZQ6kwtz2subQRn6mfENDDG/4cImdVk6WQSYnNVWIq6RYZWfkgg1wx2ykTXP4i54sx2hlg57k6aeABNGsWaC1FX5zWKY5Nt3LMNPgwsme1rIivEDC3+bZzOQ+59jmQ2dRjM+mzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876002; c=relaxed/simple;
	bh=PonSvyZVLvasNygRW7OJBwna+7cnI9pSyCOT7FbGu/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOyBdzgKeBY0/JRlsc6eVOmgELQ+4qGzLeQNlrnYg/+eAU4PsYEp4B/itlQ8YN0168V2/52+2WzqHAVlIUdhW1Y7rqqdDljv0LlN5l5+cWcehxyGymmFxXHFqr4u0QFsta5hR4wy4wQdmesH5q4F9k9pJZns7TD8HIoLIGP0zTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=IaaGJijR; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="IaaGJijR"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=;
	b=IaaGJijRZ8HWvwmpTNPvJ3RXY1lWbsNbeAtzeoO8UMBcsiq9UgpTUTiY8TFvAOBVDxIo2t
	WKT39/lsq7ZC1nuCxCr5y9XXTzqvxoh1HrzhIee8CO7yeg8SOkahuyU2mexDuVbdbZOjx0
	JRbUS8KAlUDzGnC4XtpS9dIGdHkGx5hBw+F0ya867cn4+9G4dc75WLVcptSrwYwTuGZa6d
	EPQpl1VyW5atvEhQA7mPN3BJKHteNbVAFNfu6VmfbRRrSpv35mQ1TIndmuRVKyKqtOgEFX
	MA23by46eTRgXkcCxEBaEqRt8cgeWU1nvxI2HmYiqYTfGg2z+1LffiFqlPiq/A==
Date: Tue, 08 Sep 2026 15:51:49 +0200
Subject: [PATCH 2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-2-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=+pyws9R7YxcGiBu21aWCHnox53fIOKOKZJHrE50fyaA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsJO48J8PvrX9Khu7D9scj4rewfM8XORf3sLZf47au
 3g4P33fUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJFzPxkZVr102L7s9Y8yr4ml
 1c+TLNd2XFHpjzh/4MaHXE/TWweL5jH8d67T+PE2Zlovf0VUk9NmfYXzAaceHDmlH5UZ8bdxsoQ
 eEwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Describe the GPIOs and their purpose using labels.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index a71669bef7d4..65c5f4450c36 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -132,6 +132,22 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "", "ADC_REF", "AIN1",
+			  "", "", "ENET2_MDIO", "ENET2_MDC",
+			  "AIN2", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SD1_CD",
+			  "", "", "", "",
+			  "CAN_ADR0", "CAN_ADR1", "CAN_ADR2", "CAN_ADR3",
+			  "", "", "LED_H14";
+};
+
+&gpio5 {
+	gpio-line-names = "DIN2", "DOUT2", "LED_H16",
+			  "LED_H15", "DIN1", "DOUT1";
+};
+
 &i2c1 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";

-- 
2.55.0

