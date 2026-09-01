Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B93A7F54
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267513; cv=none; b=R4TA+ABe2vhERT6bJvkXFty9sWHj0unUQ5KVxInbnYDg6xEnPS44olfSLivIfFycub+/bz84RyjqDowPX+U+/nu6P+nxUE1fJk2VvNttyuwdv3l56FaY9xlokDGs/PQXJGd2rg4bLelPcqb5kv/sNeYQlVR+oNd5QSaAw1beVc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267513; c=relaxed/simple;
	bh=Xb89+qyq0qoc5FkJnBf9sbTQo5MzEBRB/z4KxpjpIKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8hjuUo+hdvspN3iHYfQ5Cnm/Is6Uvo5aFcDo9bqSaXJ0MllfLTZRXVzT92qX3jtsZkV/ivE+lm8Ovp6ryLGauU1Gax7EA6Ca9vRoFFNcJu26icQ18gXPt3orweeEfzoaCylCsOtEapJOxHvHInYzJRbyyHdm2bYfvAMvDH9T74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSdNPJGU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSdNPJGU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso6372400a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267510; x=1788872310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=ZSdNPJGUON7n8OC1/kjKo3AzL0+/MxY9XRn4T0wlGcPKXlCXsF8qFTsGaWAc350eOq
         aG6k3Hu5e05ZARikn80BQYj1rW5sz73IScq9QMPl3YRSTkYqySvnI0RMnttf+bkJXpp7
         TuAoZJAxLy8kTfRfXLa5v0cB+gO0ElR2AlkjoBkYvosEyObRmhXIA9xGgqoKwlGOQuix
         br3pNxcGYITaYaq123pj0EIsY5GlibNooE69QWS1PY26olaZrPyptTrYREgSzJPfWc4e
         /+/gFfeP2URBTQCxROi+RVhPXAYYucq19WI9PzGto9P0QI/CAXEk9DpuKzZ5B4QIXZJm
         +I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267510; x=1788872310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3SoUapY3IA8tD1+b3WHVHM5822Ty391/3XnWQKi5WWU=;
        b=CQlV87arEWL1okCuwcTykOr3xnMVPAgrDhuv1PKgNykS81igOG2etGld7JSEo4i6G2
         ZVAltFsY56HH1xJkcISa5YyCdy3Ov9oRkMDu845W39xvnzGPXLP379OYnwjYTIaepXua
         thMNDawvshbCG8RAeygFPxd7Wrtgtb6ELhQ6ilxTLjxD5s1+pi5v/nG/ZrHrJqaGuE/L
         HIIv9cnZ1j2qSyTMtdK7kRnNoFT0pfAFnW+/M1M8abPKd20ufEiq555G1mPDTwv03WKW
         mEWvEOujOOudi2VcZPKcNkbSM6NwOsnv24UVE9CQU26NS5J4AqrKGAtesfwc588KcvaT
         y9JA==
X-Forwarded-Encrypted: i=1; AKwUvBz384jLNQAezo0SmQrdPtL96FTzwR5aY/Pepdk3SHktuevPyibqcxQa7p/vkk4lsOjUa3k12LrMfquj5W0=@vger.kernel.org
X-Gm-Message-State: AFuF++kC/XxqsifFwxxRrGHtM/YSxbIkEYhH5HXMhFn8hZ9qdYdoOqGa
	v4n2hrEtKKfcLq8MO+fhdZ/eBcciFLO8X3eS0AsPpWuodewqnkU0Wm4V
X-Gm-Gg: AYBFou0A9nLLHkOC/a5M3B6yNJd1c2DcNDwZKWcxLrwh2oVJ0vWWRj6WihOzzXmQ9GB
	RAJDXQz7onZpFdKvUUEBeyNa18SxEH7e+x8jTZ15FpMMFTkc5/3Gn3voFmjjfoj//I5UrJb5+q4
	cvujCWhOdMAsHeg6fPWWUEJ71tEQ5bpvO0yfnwt93Uu5DnAQkXXQqjHIx+t0bZW1f32MIAwFi36
	S8FgkI3jkvvsZYtrpqIafQA9eKvKZnfoXeFLISQkafj0ULX9j+EULAh5GWg8x6FCTDIgasX7Ue0
	T0Xdr+fbl0fxgG2uy3mjTGF8q2AaaZ8L5aXo8Wp8Cn3TNIqOhBNN4izw8Ok2h0IuCcYGRFPBDcl
	1CJNCfBZlFluFpUAQyHCqwye82W4ZikANvw/chutGN2DwvWTzYBv/Bg1YxMAlHBJqH59TMW1vDx
	kq2sO4nrGOfmvwY7hky4ta4Av8+1ym5ra6nR/6viyhL57uEMY76TAedAZ2L6F2DkmTmRwTXxcHe
	zGnr1IiT4nHi4+LB+r85IfXSV9/CM38try7i54SXnOtUarSAgDSRvKSWT34EnQ=
X-Received: by 2002:a05:6402:5048:b0:6a6:32f9:d7cd with SMTP id 4fb4d7f45d1cf-6a632f9d943mr12264712a12.18.1788267509677;
        Tue, 01 Sep 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d15d10asm773959a12.28.2026.09.01.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:58:28 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue,  1 Sep 2026 14:58:17 +0200
Message-ID: <20260901125819.20378-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901125819.20378-1-ansuelsmth@gmail.com>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
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
2.53.0

