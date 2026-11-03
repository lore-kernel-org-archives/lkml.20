Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735426;
	b=gAljYLhyiKZ3nkqzy1TugJAS//qrD8p+vmqsPNuhuZ/UgWljG5yM45Xdr+k0BEh/25ca
	 h3SriJfCDWj0UpYHEIx/5P6GHYeSqPzVolAIfAB53AuqDnQvOgbcfaNnqTFYHXabvZ7Aj
	 0G6i6kx9RfpdvzpcM3O3jbJxr+xDt/XEMCIPnjgIOGJmXzlk04C3/LbSrw9aUdNCScvGL
	 cHffsizhnMuK/4U0wHVdaf7NA3pJbMgjsXfl9WehUXvWselxlygopfAW1WiAGAFLA4rso
	 klXvt71/UmAtCBiWeJofpdqhK5RlVQnXww8pi7WSg2d6SKvxXmFhwdgHHpyoWt7KQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
	b=v/pFF5k51O9qyWfAmuKn3/k5LNmjF41mQPw4cGf54jbKgkX+7T//EHavXa0rcFjMVyWy
	 1BElQ/kPCgspyuW44jHLBgBVScu/onBK3+J5AdIwEhu8h1+6pdoIYMnJXSXaZch9PHER2
	 FusvBtHR29rStMCjWzFEdsroqglbGlWVtnx9nMHs91s6jS9uUlit/8/FZ2JxG62d3zTlc
	 XTaWMtUXbnpDUjEJFsmujEV5CA/OBimDRTYcj7xvyIqFJVIpyfZZviBSVBeV+xBMS7lMb
	 xu5bMLfszuEy/z7tFOFqIPqw6vD0KO82lTlaFeYZ64mNguq7vmKNPTb+Av6m3n9MlLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysKuAiBt;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1F606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E1F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysKuAiBt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3966498f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735424; x=1794340224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=ysKuAiBt+W6nmfkqU8y5XGJKSO3ZL5DYe3tiPCeWCbpDn7lxzuB1JcIN3yVNuN8LAK
         +aRd8J+NHAq3jF669fCMTqfWL1Khtjgk/z/KHdyt9wlvGaE6JF2Z90cl2Z0as0GGSDUI
         qHZXbVDM/3Uk8qLFCVS90VIb1RG5zAggucft+MFP+SKjkHWcHUpuxRV7rSwFOZ6n9EHc
         NFubSNb7+tgaYjI23yv5NiwKsUVzVJ6N94VGPIvHoDBDRAQFDrjBiKs3fJr2f7Sfb0mh
         CRpNLjGmA4I4BgPO3B4OTACrsHfuNn7rCKOJHGN+g31Rklj4W5prSb6SsXUwLgl2wVNu
         sXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735424; x=1794340224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5xMolcA2jijade3hq2GliWPHkN3pbidlI2m81QLD6M=;
        b=XO0CVVWaOEuVMgVUt5ksnruW+1IkhDcuB6DdpqtwJdB47SlHALQ882255LseW/NMAI
         lyI+/EiS1/y5Pkn00BfLtpSHhAgoC9QsXJuK8DqPx7hMQVnSXb9ga1zvshb60PoeeODw
         eKRl74gF76SVmxC4PzPTXES2/ul6AGl6Az9gSPYBQWLZ7fKXsa4rYs2j5kqhUBFpqCHv
         YFJozVgMj3/xA78/1pqOghDXSGub4a15dbNAJQPpGx2lnN6rVqfkUPN5iiZC8awwnP3T
         VwgDXt/CKfjpx2znKGzLqX95lR6QTVVgiTWDIOgHSMPgqDLhuWhkijYUWJbU9JavvUP9
         JVng==
X-Forwarded-Encrypted: i=1; AKwUvBx4LoYGwOmr8nws6UjKxDmTDGjHz/smF0BKK+aQC8Qw8n/XSH1bDRVqWA4KGdT0bqPKO1kh5AtV9afC8C8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RYiPDsCFumD5ihEzi3rM5shLBsDDxc7E/Po8QsvohFp2Ly/KG
	+0VU9TQnTdphlRw5f6KW4JUsQDo3N6S8msMIs2K23gSuJVycovyfPdD7
X-Gm-Gg: AYBFou1P+LpFOjzp2bi+wvVe90eVlwZ+t/SBSG4rVE1MJzQpFp2Wd4g5tzXrrGly2Ch
	rMSkOv24QoOgfjX6P9JFmsBVAeHbeOSiqsw4aXyZNl6IEjeQ4ulsUHj0Z8nq7OZXL9jNilEzvkF
	4xglzu0iPRESJNjWSB/nwIsBelWgoj8MoKWuGCPHm4gZMCERlRDMDA2IY3nArglhbSCfFP3GEPs
	N+Pn8T/8+hOoRGxtSF4DDUez2aHWVT0kYlolnv46os/N+ALwmUBj5bxExHUVMkccxErP5qUJcBm
	DoTGtiPT/AjfuhXKjUxymFyC+70Jgrlj/Lb4a70q/ZkP/QYhCshhhpyM8YJ1MqP4uiYL+nc04Sf
	gAKzepbjyvsraeShCgbqbZaJso0yLrlZ9UZHxrXmv5G/gP8v6jAsbiW2OzonpLW2lZlIiluWuX8
	kcuJIe2U53dBb8V4rVube7Gyk4FXzgIgYwmwTtdteaytAfeSZi4ZnIRrE22rXVY2LYTKVJB6fzt
	ZT7FRCRKTcfAqHCCY3BdxZDRXjdcrvAs6mkE1y1h6fTmC27rueltPBytX/Ijf53Kzn3zWKZuAyw
	8QHgOAuB6/5hkb0S3gY3HVjEmJfX8QXbwhMHz5cSzSUPeNdRUVmWs9bLbq7lSskELRyCt75V9nt
	JtHNqVzQ4HeBhVIWadHyvO02eIh6IIdH+ig==
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr30004149f8f.18.1793735423549;
        Tue, 03 Nov 2026 11:50:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm417802f8f.2.2026.11.03.11.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:22 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue,  3 Nov 2026 20:49:59 +0100
Message-ID: <20261103195007.9721-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103195007.9721-1-ansuelsmth@gmail.com>
References: <20261103195007.9721-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

