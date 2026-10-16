Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E133BBFD9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134759; cv=none; b=GA8sFljAmuRECaM7ng4prumNFqlkuG6OPWXiD40VurfThPiRYJ5WI7uNeJfk1TuwbtSlAqMBSc4VGmXVvIDSbaQoUCjzhGhdrwUk6oGjspSFttB885xSYqu73uJkKLytQYFUAJBSQbndnd2uTdKxCfjY+5xbo5cDT94eXKI0F3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134759; c=relaxed/simple;
	bh=tEX39GDnTod+NDjDLHnBKvhQxnCaMXJywpN07WIYxfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HhXFsK9PrfPB4+S7Bvwf/G2gur3dpsDhsNYnUpCTwTdz6EJPgbDpQFmB1+tc0ysQzXiKIehGmSM3PP+NhQsfIBPbOVteP6zAaZ35zdZC3QQb50ezENTXkrKq1tgeZ1bch9LbxaH4xrojrmpVEypTVdVkdLlO7gdWe/kDrdfz1B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfFX2634; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfFX2634"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23200075e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134755; x=1792739555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=QfFX2634rWRJPoheoW5LmAnw2t4VvMYsnaP4ZcUDiLM8MhcIniJDMFh0d7buF7U3IG
         CLsm0xpif/sat3YRHz5kOTAsiwcM5z9FRAy+hDlp3Eu/YL5mVtFL7TXSTmMHrrvOzdTT
         4pxZ5z5WXrqrsojOAU2cpTFBly2hUujP0cZEv5R+O5/eInrWcs+Im63rhee/epnL8SI4
         cTHiW4TNc/Py71M5wBJrZt1XO3H7fZuG6M2/2bLZj8aZ5i6gmnfKcZbxXC2tguxgZkqe
         q4Iqfc78GyDQkTE2YvNZVZScBeSu3xVJOXqvMo+wQbpbe98uZaV+VKiC1fClGigqy2Ov
         /JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134755; x=1792739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=oMRw6hFjr+FAZ4oFOk7Z23y/RJE49kHgSRvFdqjYCA5G6rPn6GWRM+0ycQ4Y9lnwPl
         WAY//BXQwkvjwGO93H1STWNArNhl1MC76hGYqImtJXi9hAWgejJUDq2Pk5rm7w3HuHP+
         TajqORh1l2V5o7/jJ7AVInuVGGVQnxoVX6GAtzkAtcV594npi9Z+0g9AdBMUkxxyXCuV
         NlHB6c3M1ML2MfMNuIoJ1S9al85s6ToAgvVZSunz78q7NjGs7I67zhy3muKS3uXQGXJv
         R6SXjbg1v1276r4L+hNPM4xKRiY0Cjqkoo4QvKSttGfskVPEras2UrMEuaKV2ksG9vcF
         2P8g==
X-Forwarded-Encrypted: i=1; AKwUvBzvLt9BPP/18D9CEbIl0bmtrUM6RJzwNda7yRUjgepUIj/r/dr16E5cs3SWmyCv0VpnEbS6+7JHBv6mO1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJigcCKdla61T3vbcp4ULq8WsK94lPr+AyQbw3lS/jzg10OCYJt
	2wS/vdAzx8g5B+KloO4BfETGG0AvLUCnyjtQ7wYcpu2egeHnakje8U5b
X-Gm-Gg: AYBFou3j6/igRAMsh+0hVtf1T3C23QuLWm1lGhtpVyHQoBYuZjOnSU6G3MxmafyAnqw
	P97bJQPeiXIQPqao4lOV9pf2PTEkV1cl0nIvTHWuS1LQOf5IzOBQPUYVNN3qhKGUO42v30uGo4M
	ruzYb6asDaSJ2GJ904qeYpYjnIWoI0/7/IzIWu7ldYpCYXUg+/4BF0R8oG3e+CFvI0sD5K9NjZ8
	8TKNhoFS3JKeodmDVOMP6MPcwNRtMnNsdSJwLNEOdjh5UyX5XNzmhSdy0lIsd2Vm5mwGnssjhWu
	Xr0G+qrcldnz5cmY/LC4SJJA3L2OArBch91PliMtINYI7bXzFoh4pNrT1erx/CYm07+ulqJeHNF
	Ntr6+SOC87Azw44R89i7Gyz4jqxlo5hBTDfwQbpJ9HU8BMXAQ7LF8FhciIBBM4iz7OosfVpbl/+
	XsOcvCUhEWtgNC0s0xuiPc5rEPERkYg8DTXzY7X174miTdhBxpsJSIOmYvl6PrSa5WC5Yw7Lo99
	rZMnMQiUTXhx4sk28Uf6oSc0U/t1I7Nd0O+GKina6TUXkH5bHDJjDdH9buIgAv6bdnzaxAPP+32
	eABLP7F6mUvTWGqWlvN7VzmSjYrT5xPl3A==
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr433992205e9.3.1792134754909;
        Fri, 16 Oct 2026 00:12:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Fri, 16 Oct 2026 09:12:23 +0200
Message-ID: <20261016071225.2092-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016071225.2092-1-ansuelsmth@gmail.com>
References: <20261016071225.2092-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

The PHY link to another PHY (the QPHY as described in the YAML) to
correctly handle Gen2 speed and mode. It's mandatory to have this PHY
configured for correct functionality of PCIe. The QPHY is a unified PHY
that both handle USB and PCIe PHY.

It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
calibration phase or calibration might fail.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..a8ec5ac781cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0x1000>,
+              <0x1fc7e000 0x1000>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.55.0

