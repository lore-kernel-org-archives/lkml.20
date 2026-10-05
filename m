Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B5D38C421;
	Mon,  5 Oct 2026 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233601; cv=none; b=iriRfADzlpqpROWHFdhNM/fZNxP8C12prMWMFjW6umjCDzHCQHktMGXs4omhNtxvG5QLrrhAJrf586CwUqV56T+CGAE+Ihk2elqLe/+qi1BNogVGn1ptBV0hX+VU5gndOJkE5jnYaPjIYOZgDrpVwkYDOrSHazYPatufda1eHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233601; c=relaxed/simple;
	bh=tquE/NVmKX3DPsVOXDQsR6wB3VzJBz/LmH09qdrtUBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwYgfFVF8e2VYavnrlUxcp+sh37N5fkiR/B1LUK9k0P0IjsyqEySXCcb/ZOBCzSQsIohLANaqxLuwXKqtVIatvbyJm97anSM6F1qffJMn1wGO81oa0ya/gkHsiunqmVXMmZJgGkg+wBVu2eCVZZoCHnYvxQpYHqxUlsQ1oNblCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQA9aNw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQA9aNw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1861F000FF;
	Mon,  5 Oct 2026 20:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791233595;
	bh=gHNk22pbCqfx8E0EQYn4xb/j24xuqJC3MOGMKoEHKBU=;
	h=From:To:Cc:Subject:Date;
	b=KQA9aNw3LfjFyp5T6252uI+7LpqZyygd0ftKw8DQCbL3rC+0K/TnneLulTnAvMVJJ
	 qQJv1dMUmZvXQ2lcjbkDVvYD2vIAi07QiDPiMp9vf8Ad8m/wj2zEhF5GvC1iYpmCmF
	 japMa02wnEwjDTkxlGTvWwxRRWy2bL+kVr1NuEIsN8gOMJZNuBlPamh8c7ctGk5uWM
	 Ag+/RqHXLGFnG0fsLEvh5+gQ+qVpFCp3CA7wJqxr6D+Yl77HAb/u30m+jXh72ZOgHd
	 UGU5hZ8pv3RUgkB7cEPsVBi38Ik9brthbtLxLxvW8YDOfR2PO48w7RthM+cP5ow5gn
	 2/U+ZqP4PalgQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: bus: Add HiSilicon local bus
Date: Mon,  5 Oct 2026 15:53:09 -0500
Message-ID: <20261005205310.2079198-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a schema for hisilicon,hisi-localbus which is already in use for a
long time.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/hisilicon,hisi-localbus.yaml | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml

diff --git a/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
new file mode 100644
index 000000000000..cd9ecea88269
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/hisilicon,hisi-localbus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon local bus
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: hisilicon,hisi-localbus
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        local-bus@80380000 {
+            compatible = "hisilicon,hisi-localbus", "simple-bus";
+            reg = <0x0 0x80380000 0x0 0x10000>;
+            #address-cells = <2>;
+            #size-cells = <1>;
+            ranges = <0 0 0x0 0x90000000 0x08000000>,
+                     <1 0 0x0 0x98000000 0x08000000>;
+        };
+    };
-- 
2.53.0

