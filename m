Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF756476074;
	Mon, 14 Sep 2026 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393628; cv=none; b=l8TTYCr9XKZyPst0AAbNAfHHXWPSw2eHmeeUPiAwcqM+O9Y7fkhyhCUFZiGVCVnJ5NXIMbi9yC7x4XYLyeU99c9+XUA+Fds5nPXu8JyVpTnxHxf3i8II4mXk1xh9a7zoodXpZyOyk19HFW3DQ9bTL/QxakfHQJ7/qjxE1KPkEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393628; c=relaxed/simple;
	bh=pOglrSJcZafUOj0qEtXOg20gXxgwfZhlsGRrVVqQwbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEuf7quIshk5Oq3ogd8rvejtqeof3QmhNSxxnxT2w9mXQS0MFYQn+7MSqfUJvPsGKzNZnI0GSnDRjYSHQ+1UsrL6xU8jBmmZJuXNYQTTN3ngp9F35OMBx8jkdEY2toFtoy12jjxjYullGvgQz6lbInZOoXoBJyfRhMCwmgLsNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=DlJ0uIgU; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="DlJ0uIgU"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMTtok1vGdSBVp0FFKGMeWzosUmEKZ13iMybH/0z0xQ=;
	b=DlJ0uIgUF1EyTLh0jVN0Lay8t2Q1t9ndv1G4v6jHd2oD7Anl+mght48W7eLfTYflPALUT7
	QTVHchWBlHfOLo65UO+GV4hkjbp5du8tczvQ9Cr+1jjp++FS+mdul0JYnDiCnFFlxtPKUr
	QnZuqz8l3+Flt/LATS5C7IHjwrOcY2Xc4uDM627DqU1nQZSQqAHltl7/rjDjWrc90w+P44
	nkLqvDldakwIJZpZ+/shPLO5RTs/1+x3UCKBH1MWtHtM7Lt5G6Y7i58jEMmgTxrWpiwmBF
	lduYz3ig7lPY92ocfL43sR8vizYvBf8u0pEZdXLuw0q011xm1r7MlIoiRIC74g==
Date: Mon, 14 Sep 2026 15:46:16 +0200
Subject: [PATCH v2 8/9] arm64: dts: imx8mm-kontron: Add SPI EERAM on BL
 device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-8-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=ksKjZ5u1EhzkI/5X4coFdzLxHzQAXvYnHFT7bfbn+1g=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1M9CqzBCyQqtljPcwmrnXP+xvzHYfM33LcvXKTjy
 bZdOyWho5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKO7owMzRbxHzq2n5j95bf4
 ATZeg5OG/059zDgoFKeYLXZm/zcLG4b/9fv+SQl1MMx+WPhOe33a5wk+ykdtfBPqP339VrWh8Ks
 3AwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Board revision 2 has an EERAM chip populated. Add support
for it.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index 72588af057d2..27bfad56dbe8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -123,6 +123,12 @@ &ecspi3 {
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	eeram@0 {
+		compatible = "microchip,48l640";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 /* ETH0 */

-- 
2.55.0

