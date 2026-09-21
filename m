Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C53F329F;
	Mon, 21 Sep 2026 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033156; cv=none; b=q1GWu/H+IwDVoV17ABBQG3WrMA3b4sdKOAOgfoX2ikyGH3TrkCqevcCQmW3Nzm4JKyv+AnlvexW+OYcd10DAZH9VqlqyKHQVxaJ3nBUmnsm7JYJjHQ1eNn9WGppz0LdT2i09VZ29QQb/Kn/Z+pKytdYXzGNcc2l/dwawHTxqT60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033156; c=relaxed/simple;
	bh=hW/3dZFhFdKqEMAOoI4yyvwjUsXJuHmyDQB65nwl1jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7buwIaqbTFvWjNtqOfvxNLbRlvVDczXkoBK4iN4VAgD79zSLcqPjkJndrlAp1VmOx8isNDSt0vT6uHAEg0gNclWlvrmQ7zwagXCrFgnfJNFPp5yc675OAfA4oyR2cKlQWDyt+S+QuOGHfvAhfzl70/KYvLhtWxG+pw2XWTBVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDG8KvA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDG8KvA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A431F000FF;
	Mon, 21 Sep 2026 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033148;
	bh=ybjRS2GSw3Pmydj996/wagr78u/EZ0PNM1XPfd8Tp6A=;
	h=From:To:Cc:Subject:Date;
	b=iDG8KvA8iBP4UjKFUa43QBfLhdAKoIpEd8eZNFhca3orc62mYoOuvPVcqYV+5rQoj
	 fPnDzZILWhq9z5/DSOYCQY1RKAyAQ765aa2szZxOb+kjaWBVLjIEKn7JY+4l6vm/M6
	 1Ge3uuf15/s8RvOghJweBg5ZMOtZ0US4jD9wex15C3yHGv+afMEpcZWHtFq5n3unpG
	 fNj8rtyj8FIK+NJHgRqUqmi1Jq66lHunJgguh5Gofg1ONHsQGFToa0vjsJdOQaW2mg
	 9XFPrU5KmNwwvnT5/I0ZJSrRMV2swu8ETOxCfsrHh0pkx19xv00svJnVgj5m06MYvW
	 QWx9EH8syQiyQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Date: Mon, 21 Sep 2026 18:25:39 -0500
Message-ID: <20260921232540.3128596-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
node only contains the compatible string and one register window on the
local bus.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml

diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
new file mode 100644
index 000000000000..f9d48b871a4b
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
+            reg = <1 0x0 0x100>;
+        };
+    };
-- 
2.53.0

