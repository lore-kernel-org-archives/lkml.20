Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4845A2A5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836577; cv=none; b=hV0ioeIqt/oGEtK0PPq5rc6RJ3Imr6XqX477epQlwv3L4wMNUPgrk2RRBuxZF8iOOX+ObDqf434iEescTVsSifjJ8EJCKZQi9hX0b+eAf519bocf1+e1AFqLT69BGVqFNv/85dYCL7wzjS7/NWqL6E9Hp9crZMdCMkd5jTxWu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836577; c=relaxed/simple;
	bh=9uQY2oAxzu/a3z8lJZrMRZ6tlUX6yn5rLUtGT6ZfB9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZC8fPU+5BLI9ykTkzY43dEEPWOGZm0NcgIuLtyoUuPe7hvNfZHHHo+A7uZNSp9aXH+DgiSRCYDIJs8g8UKwmmCAi0lJZbWVJOBzXRYceTyODamP0+cAT8WkCGnaG2TsVJfgeCwf8WwiNfSU8WT5WmCVy+ZSp0uUaGXwYBKXsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/01fo9j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/01fo9j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so763604f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836562; x=1788441362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ozh67gvExXsrnwoDUAZ22g3egdKS3V6pXOMWX1pqEkU=;
        b=A/01fo9jy/3KiYpjGqL5BX8JWBh6how8gDhsC5OEvwV52lOjx55xVl3uvp+L2KkLr7
         c742XsQe+nGsUsOzK2jyTUY8jdovD/QZaOZIjnaOeAWYH3ldm2fY11Qs+Qkw/AuWbXAM
         0nttYsfNRUBEjoC8p3HW+ruMLqcNFuqZ8oIqtu+rZJ0Tg9CCB2HF9GHh76Rd0SlAEUDn
         K4cflZ1n8w5dtRuXkxIqMrbGsuaxsPOi79UipHxe3pYQJUSauxJIswckQG7qsgpUgVJI
         L9eBSTHqgGu8NQ5cM9fftAHocXUubT5+AyUcny7pW1G4rA/khjuuIXjSCKIHiKyb+TKq
         GbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836562; x=1788441362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ozh67gvExXsrnwoDUAZ22g3egdKS3V6pXOMWX1pqEkU=;
        b=jm/v159Cz/I+Uq2vNPJ2irNdGCbiNxX6gDqhC7f6/IbweBnPcNIzaVeT1+mskBsfOg
         shYbxgo+1jo2FONNbw9WgltI2lnl2h/1/qhzeUlKBzWix4KGZoiK318Qx/FcLQGJl7Tt
         Nl4soowMbQ65hcNLw2THMoh0xlK3FdqEXew71lMkCz9etPfVeLzyzLf1OojYGHK4OfD0
         +kGQSK39dzejAnUrbPG5mLEFhVfNRDpjAhH6SKaen96D4+tjlh9cWN8WwgwkxJHYbP6S
         0Ynncg23BXBxH5fXEWhg7TBAdSMy1hO95zCntZZtVZvUoZFI6mp8HUQdWKEn/P3LCAQU
         X3Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpSZMkCfcNVtCpVsy2xqXrFTDXIKYyCDhc6Deox2dAJImhkxhC+C5F9+l0rYvFtKPlFrVTa+ZM7FhYcPYw=@vger.kernel.org
X-Gm-Message-State: AFuF++kxBbPQMJAfQWe4XoPQ2VqMSV5Hv/88jRfddDQXxG1R+9c4tYtG
	aU+61AIaPfNN4vP48uySDJV7JBkOK92Gexvwh1qab2Sck5ABSeeNWpeP
X-Gm-Gg: AR+sD11ZosqE969mya5WXD1EM7q7ebpai+W9L0o2SKW4bYSl8pccIs7VRwo+iSxuHwb
	s7MtJLOUw2saV2/1qYi+T7Um0MOlRAEvVXYD7y7WdQ2w0juD5u68aBOxcluMTlSQLADiUBjoHfs
	GYKWvrtQTIQmrbHH3CZM3SAAaC6atLWpYeWso5X+Dr5IKtON1BWU0ePi6+j7WsAoP2L7qmg3HjU
	72pn5N6uimNCs/t1QW7RZiguQUIIy75oLhwCyZU2krDoTlLGbvJl6+0vmugI8CHeFyemLZjVEzZ
	lVBx5ExVvHrno1hOWnUmLpPrsiNK52Q4P6dwXYj8Mtq8w2kI3/v3rI3pOD1Htp98YgarECnGnhr
	x72xMVLpE+4ndYH6tQJ6YxXSd/BMuLWLpGIWSC/bXHldxuwn/ttcfPqbwbwzRL4BiDcNMgJlr4f
	2yayl7Phe/ldUTo9GteqoMEtIk+Y6hJmZIz0OJbnCeSRcGjdVMAmFcIHorJa2i809ZmL2uIFp0/
	aj1OltOu7fsI0J+J32vId2oc74DQpNnL6z04Rh5bgIV6GhEc7Rh
X-Received: by 2002:a05:6000:4305:b0:481:5dea:c014 with SMTP id ffacd0b85a97d-482eabb5cc6mr8398077f8f.14.1787836561549;
        Thu, 27 Aug 2026 06:16:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:16:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Thu, 27 Aug 2026 15:15:46 +0200
Message-ID: <20260827131551.26725-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827131551.26725-1-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 Gen2 PCIe PHY used to make the Gen2 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Similar to the USB 3.0 PHY, a dedicated phys property is required to
configure the serdes for PCIe or Ethernet usage.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen2-phy.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
new file mode 100644
index 000000000000..f31d838871fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC PCIe Gen2 PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC PCIe Gen2 PHY describes the PCIe PHY for the
+  Gen2 PCIe controller.
+
+  This PCIe PHY makes use of a dedicated USB PHY for PCIe usage and
+  can also be used for Ethernet usage for SGMII or HSGMII mode.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-phy
+
+  reg:
+    items:
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: ana
+      - const: pma
+      - const: dig
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1fa5f000 {
+        compatible = "airoha,an7583-pcie-phy";
+        reg = <0x1fa5f000 0xff>,
+              <0x1fa5e000 0x3ff>,
+              <0x1fa5a000 0x8ff>;
+        reg-names = "ana", "pma", "dig";
+
+        phys = <&serdes_phy>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

