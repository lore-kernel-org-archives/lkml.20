Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C93A9612
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266390; cv=none; b=hmvsnRY17mDlbMmi8XYeh0lH5I3U1CpOhlwsmYehRVOsDKgt9FOtI4xyV/OTz79Bgbeja6EWXkb2RamqdcpLnUvoE4Zc5KAiwS9ZHEgoiyP3w7Jo08mXI4buPEWxbJ4SNBziRdPY3oeULGaVWDfLttY2pNX3JkKKSXD+pU0VIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266390; c=relaxed/simple;
	bh=HZaY6x6GPhHYibc098Whc4/fjwrAqZCS9AacbYwOBOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDiOFlg3i7SQuXL7vFJcOePJL5X6wcGF/rYHHld+tkefSu4DsWdSACDlbc8DLWF6IlL857OxwBQWHTKtEe5qCqn141GhCfRTXTguI2wWx4zYdp2ZoWfTDf+VdMW/du4ZonQ4zG33oHuTAzlrVIuzMIdDrvGEZQJHEWd/JfhGFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjs37Y0o; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjs37Y0o"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3010712f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266387; x=1788871187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PSi1RxUH1oU6vn8Qf+5AgLaeRjmhNUBH22lgQsnU2Us=;
        b=Xjs37Y0oJpsa2OoVVyeftPzD4HKcODC1cR+CDWIBVZDvqSrvwkwyLt7ER/Zi5RXpsl
         CwvxD2Yp2btlg7bPjbKn6DwUn5hCS3aau5pWGEyKL/2u4bsUL51E/dhzQoiUFz+51Dlf
         m4ZkC/I/bXLeZNQL3vWoT/UiONUa4c5aisH9h0U6sO/J3YH+TwQnMxpu/phKRqQFphJv
         8zlMJ3MNDIEX8IOd1HPO0r+DRDJg+idm+/taGmvZbBtK1wk6DD3WQzMZgICFS5t4NWhE
         ab5WaE4I9GUMgqk7JSAMriZG5J4o+EFCs5xlYpuM/3pEr63xS84gHY6nMAqNe3sS4uF6
         ikQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266387; x=1788871187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PSi1RxUH1oU6vn8Qf+5AgLaeRjmhNUBH22lgQsnU2Us=;
        b=O+mFRnv7Ne4Y2WkZ3QRuchmwVi8axNbB+VysLabdFXDkBkt0sift7iinuLv+kyhZGb
         tvqdeYXMqgXQaiv1KDARLOZ0pr4nTdZXYQbC0UuLuFzYm4ZzvVNaBEClxldpJpRcdeNR
         P168drOd6cOb7xomCwANJQD13gfryZJ6XO98qrbanqTv1ZImoJAdqTG+5mz7snMgSzfB
         /pgyQt5a4zvv91096TJKVK6OnAnK8PPPIR6JkjpwH1i7cuG84oliXg4XdZbs2c91gF1L
         Q0rtQRqcKX9qkni8m/LjpJdr5jrqQCvfV9BzaIpCXHLKxFAlw8NkUnZvUK6NrxnEp8Wl
         LZTg==
X-Forwarded-Encrypted: i=1; AKwUvByeZyNixyVwPal5sC5ltpoGGVc+f5XVd60Y+m+kRlp3ZByu1Ikj7QcxZkDlcjgObt/XggiCk87YbR70z44=@vger.kernel.org
X-Gm-Message-State: AFuF++nYyftpFMXFHQCbha3kCG4F8WnXwnlbMxXTACjovoflSSpLWrS9
	rlAykHa4pXjKcNNz+M+uXYgXU5+bJwSgfwTLViQqL7XKB16kfYIFd+zi
X-Gm-Gg: AYBFou0bCFRYv+slAxa2r4SfSQVOoFMUrD50EvyTfxGx2yluFOWmVR8aLRXJOzoT5EG
	LBpJ9aHLtTl81bU8aNGWOz0C9OLrwpMM712aOb8TviXlJzdA+bSTdrtrSGjNhJ/GsgrDVfhTr5Y
	feo1uLMJ9+bF/K+4KCZSQgj0I+aaSg0lq78/ZEOwB5bk8lGQBrLbaaGz8EDiP93ZAXmB9E4pHMw
	FI0puQVou8bTuDdjVTLKtm9nLy0IoSr/j58G0aiLiTdkRhfQZDtoQH/wDHsySoDq3siLqQrflax
	IB7SymM9iKRv9/ULlwxoqUSf68gYJOvX5AQ39VibMM7vX48xSCKI9O11eXN7zKQzOuZpLSLj/BR
	G40sV1J63QNJbHzNl1EiVMbPzGhpt8Xeeajc6V04OsLcPjOvlL1VUdmotcT6dWHHo0K6mfS3Vao
	vMuBQQpJ6ZUn+dl+PV7kC8b4XZORSoI5Cx2+KqQvA2TooPJq5FMqYFrYDAUsa/XONos43h4EwKF
	MIAvRaCfgtfyh/F7kzga0IONt+alDL84kCeT/vEDp8+WYWNgF5B2w==
X-Received: by 2002:a5d:54c6:0:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-48440fcee78mr11971287f8f.1.1788266386406;
        Tue, 01 Sep 2026 05:39:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm4644130f8f.15.2026.09.01.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
Date: Tue,  1 Sep 2026 14:39:32 +0200
Message-ID: <20260901123933.15388-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901123933.15388-1-ansuelsmth@gmail.com>
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
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
index 000000000000..424da3c5ad01
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 SoC PCIe Gen2 PHY
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
+    const: airoha,an7583-pcie-gen2-phy
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
+        compatible = "airoha,an7583-pcie-gen2-phy";
+        reg = <0x1fa5f000 0x100>,
+              <0x1fa5e000 0x400>,
+              <0x1fa5a000 0x900>;
+        reg-names = "ana", "pma", "dig";
+
+        phys = <&serdes_phy>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0

