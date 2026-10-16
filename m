Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFF59C97D;
	Fri, 16 Oct 2026 18:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173845; cv=none; b=J6kqA5Kd8U9g8PHk3nwxTIk2O1X8CzNnHA8AQN9gHWjF368g5OyiaQtxs6tFV7Rk76gxXHkEsmsR+pRRcFcCcprA6g3FmvflugjK5Nu8M2jqWJsX0ScceZe4hj08uU/O1lXP+mID8DBVBwsco08nPlqNLka7jPVEsBFtwFfAYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173845; c=relaxed/simple;
	bh=GMvbzah6mZA3ys6/05jR+TSRw4EUnonbzpVaTY6kNkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKthhnrH8MYTQgxObAHCMraPwjQHjqJeILaofNHJxTu9uxRe/EBq8ca5Cj1SYkIDP0Lld0V1qdKCUZh9psMlim3JrkI9cU3sTOOo5oQz0J6PvE68/oCWlbBbMsK/rHxzACYlTPOFD+mB5lfOPdolstLQz6SdmSCF/WjjYMgwMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=inm2BmKz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="inm2BmKz"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2A56D82B98;
	Fri, 16 Oct 2026 20:03:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhXEAqULeaqu; Fri, 16 Oct 2026 20:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792173838; bh=GMvbzah6mZA3ys6/05jR+TSRw4EUnonbzpVaTY6kNkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inm2BmKzxwaRWAOJ/OKlB5tFeKe3PSf90H4/Y7+pwPMasu9+SE8Tobfw59VwH2H8c
	 InN/roF+AYWwOXMNLO94tAO3949kpAb1pQILiBqHMTytxH3BEP6gncBOoOTKU0iKQm
	 oACjdcqdPDTn4R1baokrdd3Z0N9EBy2pYm7K0FOdBnddUVJjx6v+mQFIgUw6qLIhey
	 Bzx3dE/wGSjgQfkyjHv4RIFfZLuMRTQ0OigW2D48KlVQtrj5gEYyaYGaqpWA9ZTQcw
	 QZ9brclZTM5F2mPMxj+Py156rIEUlV0S26uIuBq+on7tnFs0wZQqvdRG2Uws8HfJj+
	 2QA0Yp4q48etA==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 3/6] dt-bindings: phy: realtek,usb2phy: extend for resets and RTL9607C support
Date: Fri, 16 Oct 2026 23:03:11 +0500
Message-ID: <20261016180314.31760-4-adilov@disroot.org>
In-Reply-To: <20261016180314.31760-1-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "realtek,rtl9607-usb2phy" compatible for USB2 PHY on the RTL9607C
SoC series.

Add a resets property to properties to describe the usb2phy reset line.

In RTL9607C, USB2 PHY reset line is from "IP Enable controller" which is
multipurpose and handle activating various SoC peripherals.

It is unclear whether RTD SoCs have something similar to that so set
the resets to false for these devices.

RTL9607C requires the "resets" to be specified so add the corresponding
if check for the "realtek,rtl9607-usb2phy" compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 .../bindings/phy/realtek,usb2phy.yaml         | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
index 9911ada39ee7..7b50833c8e19 100644
--- a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
@@ -11,7 +11,8 @@ maintainers:
   - Stanley Chang <stanley_chang@realtek.com>
 
 description: |
-  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
+  Realtek USB 2.0 PHY support the digital home center (DHC) RTD and
+  RTL9607C series SoCs.
   The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
   support multiple XHCI controllers. One PHY device node maps to one XHCI
   controller.
@@ -57,6 +58,12 @@ description: |
   XHCI controller#1 -- usb2phy -- phy#0
   XHCI controller#2 -- usb2phy -- phy#0
 
+  RTL9607C SoCs USB
+  The USB architecture includes OHCI and EHCI controllers.
+  Both of them map to one USB2.0 PHY.
+  OHCI controller#0 -- usb2phy -- phy#0
+  EHCI controller#0 -- usb2phy -- phy#0
+
 properties:
   compatible:
     enum:
@@ -69,6 +76,7 @@ properties:
       - realtek,rtd1395-usb2phy-2port
       - realtek,rtd1619-usb2phy
       - realtek,rtd1619b-usb2phy
+      - realtek,rtl9607-usb2phy
 
   reg:
     items:
@@ -130,6 +138,9 @@ properties:
     minimum: -8
     maximum: 8
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -157,6 +168,18 @@ allOf:
     then:
       properties:
         realtek,driving-level-compensate: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - realtek,rtl9607-usb2phy
+    then:
+      required:
+        - resets
+    else:
+      properties:
+        resets: false
 
 additionalProperties: false
 
-- 
2.56.0

