Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4D3B9D86
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476757; cv=none; b=NVQOoxwsu1oSZYdZYNxM5RaGmJHbo0mgr7SkhW6md36Ckgpdu3yGMZa6X0mdvGW4uKQRYws7a5jynqEn1q8E0S8DGQAI9BtfyRVs9FQytiNbhZzHAG5wAOUlkJTytBNsd6Y8yfh11qybz1EHowdFNhDOqhjGmVPNc7p5MsC+chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476757; c=relaxed/simple;
	bh=m8sAzO33iYtVKLXrd+2NaUjzgG3gzawYUAd74pqePhQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1g5fUnTKwQkQMw6AHvu33hKgPb0cDHGGxLBlIUigLR8LYnDy/HXwSDWGEW5E7c7CvoFE9yPc65FUJXNi3UpxiJmFxLU5Bi87gevH/c++SaZ5Zx9D85kGaIt+ISHiwB2tyfGtBZM2NGy6IIRw6v79NHLeifacHud+LMTrnEOG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1TMNnOa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1TMNnOa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so385002a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476754; x=1790081554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lSkFSVGa/dllH5JEoKe0+pLfgUwm43MOT22pfjYzUoU=;
        b=a1TMNnOaWPkCyd0PRw2yfor8ttdv8V+icIEqrnSBZZp/NbT1ZToUPALVzveFb7j045
         jk3uhghFYcrRfdotIYtVjVDsjYvYdZRDqTxXBphdOVg3i8eWNXAi4AkSB5f7cv7clNVP
         evMPJv05xelxA7uBW8GfPB5VA3aq9Jrf96VkbW/R+5xrmL/WPINWNkCN4OQymr5lVN5O
         5AZkdQEF4NfsdTluVDgfJA3wjxNVf/NyggjXSaCHqiZEEck3OojiTL7uBpXQMpo5lKFe
         Vk8kO9le9hgtgmNrAoeU/C898gYXg38Vlxc1yeeI9naM7MmtVytAh34C6JnhoYWfC0ok
         jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476754; x=1790081554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lSkFSVGa/dllH5JEoKe0+pLfgUwm43MOT22pfjYzUoU=;
        b=GctHWP58IsJysoXVlBly6Nd7oFXzHdn0QgH3JUGUJZNts++/0m9R6PfU+BFl/uQAj0
         Nrxqq9FHJnKS7/kmOgw5OrkQJMNvYjEHReG+zzDQieYIGCgfu9LKKBIbMowZJ8RXLLHt
         lJSBNwfyGRvoYrRdww1jiQjl09lOHymxhACZ2mvlI7Hea7cBJC+YiiPfNZD4Fx40J85D
         l/0SJgiKHOREbSOlgV1MwCoqqnZsxCxXTU1o1ImNREPWk27iXFpJmj84P/ndGm4NvvCh
         0HpAhUPAIEHqHcCpMAM6KoQPDJO81i2xGdeOCQ3FMats2V/tXQtBdlvtQLXrcvi2SNa6
         KO9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3y1atBY5B32d3OnplLwf5Q2pFi3c08P2ndR/wLxU6jFNSddAfuX51IUEYgOqZbb3kD7ZRkB8pFu8WP/M=@vger.kernel.org
X-Gm-Message-State: AFuF++loJ7s6ida3S/m3z32lznNCYP8KoowfJXz9sbb9Qspiz1266zbs
	kMmOo/NVQ3DBUCYZYFl9pWlnnkzXxKDD/KTGk9xV0T3WbvPgHlk/IF60
X-Gm-Gg: AYBFou33TsDvJw0DZlc4Kzh7S8qjhKIK/52KC5M5DzF4AiS/6EcSLbI6sl4P1b42onR
	iixRCDAvjwq9hiHWgz1MOwM8z7Mkob97RDsdHVFZxZ8CF5ec7Ah9Il3fV0vlvM/33z0F3y+X5Xs
	YNFE6sjH2hk1H93ssQ2TFJkiZkAEM3h3xWM+6F16rNl8/yZLgaNZAo6rO9QIrhsCE/RUGi7lxD9
	NTqiI+S8KggeLsu9CCfe6egVGpOUgpJ7ypGD9ZA4VCS/Xozi3y2qG40dPURmlxfGxGohUtaFz2q
	I9jpFJSH93yUDXOpzsU4e2AymNdrQxgoxK8D8iLcrwFfDJj/2cBGzk0Q9kerxT59tu//0paLL/5
	MkpBl5y9GZ8eBQwduw6ondYIEFb97gNgyrLI++ECTqHP+u6t0g5lbDQUr1K7cpZ2obCaTta0uAx
	gPPjlh5FsFRnyBGd2Yhlb7ZxnqMDneuBEJZvoBIdq2Sp3IEz+PIIkvqXluFLpQDvVIeHZlH2KeE
	JVYZ/aE5G+HcD+7WnxsG1IRM5v7gjtJ12bH+SUvsozzQ0jSCPTk4ZmRwkdGgnNy
X-Received: by 2002:a17:907:724a:b0:c29:4cb4:8582 with SMTP id a640c23a62f3a-c29d79e7c35mr78298466b.47.1789476754036;
        Tue, 15 Sep 2026 05:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c296605b9a6sm587969266b.25.2026.09.15.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:52:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Tue, 15 Sep 2026 14:52:23 +0200
Message-ID: <20260915125226.20579-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915125226.20579-1-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
 include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..fc37786ac7ed 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,12 +72,23 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
+  - if:
+      properties:
+        compatible:
+          const: econet,en751221-scu
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-          enum:
-            - airoha,en7581-scu
-            - econet,en751221-scu
+          const: airoha,en7581-scu
     then:
       properties:
         reg:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0

