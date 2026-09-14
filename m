Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14534734F2;
	Mon, 14 Sep 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393624; cv=none; b=htgTxb6+LyOozr7mzLM27Wf6F9CFSJzIU56Fd3W6ANinjTVFFjtPRHdEkv6fb/za8HM9PmVJg925N1Mz3xBFzZmbiP604NhSnUmiEfmwk0z9X3WJN/m4DHjI+GBPA5+UiBwnAOSiMAAfbKFj5NKWUPojE7RMCGrxoDjGlFsG+mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393624; c=relaxed/simple;
	bh=PonSvyZVLvasNygRW7OJBwna+7cnI9pSyCOT7FbGu/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dn2LCnJMcZyPGQukeNKhdxaYIRJzvdkb4Qf4Yml1D67JVFUBPtWCVVUuNSiNACqWRFeitm1Qx1BDYWJWQWwOiyHFbYiDo2zkxfdsZooKleRETna2wt2WgnX9r9y6vM62bnfI+EXK7+hjRYpUTIn1R2dorXRGREbwJ1McwPKIUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=vQ15ezdj; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="vQ15ezdj"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=;
	b=vQ15ezdjPe9EzIjXoaKsgbAP/x41fYotZimQlqw8hvzVN/yehjP0EUdXz/cr5Br0I6aXuk
	r5J5nOcm3ijjNq07K04XRu9YTUiLUrBadsyQl4tOeuKgVDO27Ncm7gWBQyHtqtJyeRvTQB
	hQDilogqUNtwYgpqPEHA1LCi2I+yPRZiaV8V0it8Qt018VN7QhVLT1YQTR1U4RsugvhXBX
	ucq+auz6cEbLTJwUD8pzyJgW4zkctuyTCq6iMKAw/zxfqbxIfnKmZRvmEAjX2G+Szeat+B
	3iQxfQwAqM2+vPLxnJL4j3JskHc153bb7rMP8fWimeREaHpa25to+htsrZhQ4A==
Date: Mon, 14 Sep 2026 15:46:10 +0200
Subject: [PATCH v2 2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-2-8e12bc5f1f10@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=+pyws9R7YxcGiBu21aWCHnox53fIOKOKZJHrE50fyaA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1NeWTbSU69La8uyL1kjP/Oz3C+xi82Lz/oZzWtYc
 bld0lq0o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKpExkZHlyeaby37ta1XkuZ
 B/95p2iHM2fpWvF77vD2nPPdIavpKMMfvp8L72TE31t3xjj0pFOR0soZz3a8vKi/dvMc1+0+AWd
 amQE=
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

