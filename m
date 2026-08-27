Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23776446823
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833307; cv=none; b=Yx52oyIyJnzAUTYryGA167z3Ky7MEiYIvpRTZtY2vME0HC/bfYx0y+Fi8D07egfJDZ5J2KHW9Th/TYIoeozsR0VlaRylBTaFTZBqVkW7l6/Jp0tBJlSoE+DeiNq8Owh1QqiHoOzN8voSeTZtZpUS6wKkFBxA6qygUs++NkXvzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833307; c=relaxed/simple;
	bh=L8b31nsSu3eyJ5Xih/nWqGKHd3UwblyHBpxcDaKT2oQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4YJI4BufMC0Mk3wZJvhqGJB5bUdu+mQ3Ni6gLNdtFZ0EtjliHplMRqHTwaiUA1cdVlIKEfhjI8iDPYEJqLjstFXgfwkXndl4HctdfL4FzpHPxp4vQGzoEChirALUyLbC+SHaBbm3g58UHlaxhnga5GNLQCbRHh5NvFNH0SR0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJkhbD6T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJkhbD6T"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49800c6a846so18960555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833304; x=1788438104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=nJkhbD6TcabpWca4gcOhOAejVkxbkQchg2dRRmyRaTbVpXYKXc2mAJQ9ZkcWSaUZno
         NZIP95rFnAdkOIrQJTPtdYte2T7gp1jwREgpEeWJjhP3Nzn3lwX9ZfY1wR7xTBC4+GTa
         ozVpuiseuz1nIOzbQS12N0yWIOAKYyJR4LOLt2d5Hu47emz3dDBeHGG29Aqdc94zKEjM
         XIdCDOzVL78Qm8E3geZxoS2oLTSEpE+xBwgJcgm1fbjLvbbCX6AYriTnwAhhYP5Lw3rZ
         CqV4DQQVFSahtraATgSpDGbwWLIa+9c1DSYVQ0JW353AT7PHvYaNGSiVEk1r9vyro3a/
         PwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833304; x=1788438104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=tWfbMKeDMCO2W6JHlG01Axn0u4Ap/ngozulUZoJybHg5RR/+X1HPZ8sHiMJibNUw7P
         NGM3yLHQOYC9alQs7AwoNgFoMZLoZSnzUMUdLpFwwNedAl2IraW3RdfvVOvf0h14r0TN
         L5iJFK7jl/yhYNXjhAv9fZqO8kja0upl+E/plOZYypY6uT0YhYYMb6l7FbMj9AeWruSv
         Gz28LDukKTtNR1MoNW+XS4isVU/cZmCoR+GtoP7Q6EoEICdTSWjui7f+nM5Mn3z7J5Ic
         Jrg03zHqfKSM8ut2gBMxPKFTT/I7YKtXBN/vPKhj/eZBswdUy5udhumdUXYuwmUSoRr6
         Jh2g==
X-Forwarded-Encrypted: i=1; AHgh+RrpRTMDrPaN74hjzjoG4dHP0Dw/oCTFhgDjtocoL6oshW64+ZLPppG1nJ/dWhybd5mX8gt0Y9ElOONGNV0=@vger.kernel.org
X-Gm-Message-State: AFuF++nFhjU8UOTaZnPZlGjpiu6wyDhFVUFPaliPhAvjztSLsfOiW2rB
	wWeJtxw46Rvb3gs0fo21WAT+mFXdlKlors8pheYYkmyL2UgEVMx5NmE6
X-Gm-Gg: AR+sD10rIJhDV/aAmW+nZUHtBWi1kqIz7XEqJyhA1MU3slqpx4EZM4fR7ITlKC/AE/t
	PH+1KhW+ZF0pGcHAuRqsIl8DxJ0GPLHhPbTUIYbME4yyTjr5UDDl52+SLzFRtykR44aIieDP6Ga
	8HpFex0pMVcpMEeDXdvUzWIT8Ui6iITMVcm7W5o6AYuTTpGRTBuxflA0yjOM6ssW7BVXV8pg6EB
	dRYM5I0m3LSViOcOg18bnSNXIvXE6xNUQQMcYJViPIre1/PSYlzP8jfCoh3OKJJc2mXk23sTJGz
	/8kiOslim9nxPDG/LZbRM5ly8VFPpA65rWuHngqyn8db51OmtbPgblVhY4gq5lj5Ob/KZ4OXZz3
	sjXn6QH7X0S6K8E0RQUtGl3Q0QhPY63xzMO4uiH9R7Zr0y/tFUvhp1i48XypOU/dUP/SgTvahhF
	pb+7z6Ht93fpwWu5bW/Xm781Xo5CuJ4L17mIjFfo28n0WR8MECAKQgN1wIAJ43C/sa3qPwO96Ga
	H4cCC3vdqtTKmBFNRxxERw5SZfml6Ki4vbQ6DfWnPEPVPhNHW/JRbM=
X-Received: by 2002:a05:600c:c48f:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-499dc6eaca4mr142110795e9.2.1787833304197;
        Thu, 27 Aug 2026 05:21:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm50099535e9.0.2026.08.27.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:21:43 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Thu, 27 Aug 2026 14:21:20 +0200
Message-ID: <20260827122127.18874-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827122127.18874-1-ansuelsmth@gmail.com>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..07bb20152c0a
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
+        reg = <0x1fc7f000 0xfff>,
+              <0x1fc7e000 0xfff>,
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
2.53.0

