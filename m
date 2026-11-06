Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973314;
	b=al+KwDdrBYBUPPuP18VjKr9n3B46Oe7xBrao2MprDCggiB+1e5PAdpwar7jlm+ZkkNNr
	 kKEv5IWCMWZmRhJUdlEegyIbq7UVFVSRk2r9UZg7MGO+1S0nfoSoP8HMnR/VHhvsqvF46
	 5suDXd8jRM9rPBvAo8iavYkI2N1ZS173kP4YW+42Wsmk+dI7vre9WGWa8bE+NbXVw2Qtx
	 +NL0wsPB4frqfZe0tCSVUVC0ukkfnhcc1Jb860SKyr2omAsS8ujbTQY2L2fXSX7L+Safr
	 KlEHbqikTkBLr8R/sroP4uvn5G4rCG614RUa9xlCKZODnydBcorvrWDJ05w+A1arvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973314;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=06AQXyihJq/OEvwcZMATqFb1XaBS16clhoCnTaBSROQ=;
	b=LKfgtTb51WXMpABmOqYVcb8XcOMNfTGEJPjqCbciUmlqaNfGOyVkReXTS7LaNBGhB+in
	 zfoA05UW0K2p+hSil3jcS0YVJMy08NL5XWGoRvextHFGQcsYph50JB0MoXAzPyjMyMBut
	 Hwf1jGhe+Cee2wFIq53xtw4qOpsPQVyxHdnpwRE37M90WJwyyPIBiaad2imI0v+aQlISI
	 nVV4dm2IdVQXv+EBFxnbBw3RtfvDyNpHGTGHWqEHdQ9F7hb0omarqFjncnzZmpEHA2NIY
	 PGMqeGqVetpGp95vJ6q/7rrOYw/cPELmkSQI9lPclsrNXwA+Acju5+H9g9MCBqUzXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mHu46RB2;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3FA606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3FA606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mHu46RB2
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135506euoutp022486ac021a9f152bb01c697d0a272d58~leTeYQWTp2517925179euoutp02n
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135506euoutp022486ac021a9f152bb01c697d0a272d58~leTeYQWTp2517925179euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973306;
	bh=06AQXyihJq/OEvwcZMATqFb1XaBS16clhoCnTaBSROQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=mHu46RB2pVMXa2dRtn+nvmIeghwLok2WNcOR56UrmanK6wgT3xFLLPhzqtRIlyjvw
	 I3d3CtfLsOYzra4/T5nOsgQ/Rj/ZdfLn013f7McHULk1fZKvgRozi+ET+N7rcF3tGG
	 zwU0njiz5IbL6IIUCJxbid367nfPIEZZ2BbcKqQY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135505eucas1p1d6f266a6f5c36359454745d176d7ed9b~leTd2VRT81758617586eucas1p1T;
	Fri,  6 Nov 2026 13:55:05 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135504eusmtip293b7af368c9743379df5aae21a89c541~leTdBVRnc2294422944eusmtip21;
	Fri,  6 Nov 2026 13:55:04 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:52:59 +0100
Subject: [PATCH v7 1/5] dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-jh7110-inno-hdmi-phy-v7-1-d49368303800@samsung.com>
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=6AQm50xtAvbrSQTSn64RxXqfjCuQ7qgMNyPcGxB0fq8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vWM++9W9X858Z8RzhSeYuc7qsd/StZAzd+GqE04bK
	1PuP9AU6ihlYRDjYJAVU2Q5uzHaSPIfw9Py449/wcxhZQIZwsDFKQATOb2YkeHI33vTH+Xobl2/
	hEfWVvJelOJ0uf0H/lXw93s+D8i9Ku3B8Js1JmK70F4z/733vtTJKYopCZnc4TK2fH/I6dH9j6r
	XD3MDAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135505eucas1p1d6f266a6f5c36359454745d176d7ed9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135505eucas1p1d6f266a6f5c36359454745d176d7ed9b
X-EPHeader: CA
X-CMS-RootMailID: 20261106135505eucas1p1d6f266a6f5c36359454745d176d7ed9b
References: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
	<CGME20261106135505eucas1p1d6f266a6f5c36359454745d176d7ed9b@eucas1p1.samsung.com>

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.

This device is a child of the starfive,jh7110-hdmi-subsystem node. It
functions as both a PHY provider for the controller and as a clock
provider for the variable pixel clock (hdmi_pclk), which it generates
from its refoclk.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8dbd113b1534a37d00dfd60454f300531a813b8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon INNO HDMI PHY
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The PHY portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-phy
+
+  clocks:
+    maxItems: 1
+    description: Reference oscillator.
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    phy {
+        compatible = "starfive,jh7110-inno-hdmi-phy";
+        #clock-cells = <0>;
+        clocks = <&xin24m>;
+        #phy-cells = <0>;
+    };
+
+...

-- 
2.34.1

