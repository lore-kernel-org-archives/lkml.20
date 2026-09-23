Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6240D574;
	Wed, 23 Sep 2026 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190897; cv=none; b=uLIaBaIy0c6K0aodlO3vnr+zzEhK7KlLd8U1Hbymk+hhkklsLOfjlUFQHfqU3ljpNXDR0RoWawvZfoYdP3Islw3bzOW9ox28odUnrS0ox3FzgG4WgAF0gzCcBjoXbGgkamrYNyczA3ucQ3fiE8I7ubj1iX5IpXtyZUN0DY2LYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190897; c=relaxed/simple;
	bh=pGxn6Ika5ps40uSyOM7OC027gpcu3a7mHFb32AP4NnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXfWKg8Om2mIFyQcWDxmakiBEm3WKlNG3mg75vzZg2KRFh28uw5CxBT6k+1j2OgI4aWHA5g7M2nCcN4XUa9QU+ziYWETJReDq3bRK92dXXAF1NDSMP2xaId9qLp/IxCWq42Z+xR1aYh8JWstP6XqcpK0W/KBF7Ug0LV9ilKHp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1PkeHHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1PkeHHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0396D1F000FF;
	Wed, 23 Sep 2026 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790190896;
	bh=QuK5pvrnfAPtI1ZyA3m+ltk1rxBHGNKITbOzR+bJ4Ug=;
	h=From:To:Cc:Subject:Date;
	b=A1PkeHHRMSCHwQicuF3YbK+PLV3fvZ6QAY5pwmIDc4bxN5j++rDdjhWtdK/lQQ8ev
	 5EZfOjgila3EH7Nh4dlik0jZLfdACnvNqK5I+lbHOsok8k7Jf73WBP6EIkJpOa9F6o
	 cv6DpJlTf38EERxyO+n+iO6ohuhcJsYKDpiubzaxJHbHx0wm1fgffrSUV0emKlCC5C
	 b4SL9HiQU5XXetbzfOu9rdbNWwnu11djIN45FeC5+B9MkO16HmWDzVa8wNovi20ZsO
	 Lo+cIkxYAs0GKuTYdlRxfY8mCEhuF1r04825nFxkJQOl6qBtFddF9bmk3Nq4h3cTtP
	 0NPInjfSPpNiQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Date: Wed, 23 Sep 2026 14:14:48 -0500
Message-ID: <20260923191449.2204388-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board
which is already in use. The node only contains the compatible string
and one register window on the local bus.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Clarify this is already in use
 - Use '0x1' instead of '1' in reg
---
 .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml

diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
new file mode 100644
index 000000000000..eaaa8f917bdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon HIP05 CPLD registers
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+properties:
+  compatible:
+    const: hisilicon,hip05-cpld
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    local-bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        cpld@100000000 {
+            compatible = "hisilicon,hip05-cpld";
+            reg = <0x1 0x0 0x100>;
+        };
+    };
-- 
2.53.0

