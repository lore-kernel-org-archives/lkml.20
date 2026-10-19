Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445080;
	b=3/I6PmfvlapDglychPWOViYO1SMMceoK6TBT/suFnGnO8bcoIGzjrFmNurlttp9dVRNQ
	 AePlZNedlz2tLDTlOcVXmlkfiTF4Rpp8fTOQCHJLtHwpzZPn1lDDz2dHqpJCgAiVQzqtV
	 3oumkSQIBAPKLafdOK24Pm71vLNwM8aG79irR7eCeMXoc2iB13SJmPgGf88or1UhkC2rZ
	 QBx5HUkwSILTIN8NFc1MaBdicOxf57hnl4sbpxhWCWBw7JewBq65Pq8uLTDRU0nYapPic
	 q3lVgLD2oaA/nqT488XyKiwuN9reOmhWkxG0V0TWoSSm3yAOMk8vbe0eHkSTRuypWXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445080;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/1AN1ESpWi5jgJPYsy5btghJQVKGbBKJpkxKtYBKunU=;
	b=350oSzGbwLAW2oyPA49Dj3D6QQBxE/mvnUe0oFg+g51jfD6GAOnBCyx+AXTnEhbUWtZR
	 Z3YvMjwPl/ZgjygAUVMokJ5ehUAzJ7k4+G7xYcbHaL8ozHzgCiDAQP3QfVTmDykU82frb
	 Hjw9Sw0+LFyLMi0dgjlUjeMXocfYaviU+XHPmWvt9k9xqo135ICp0iMBEUZFbnwUTkkh9
	 iBmHuqxU+5eabUsGgZPW2dnrBJ7/pLZ322BvUFCSBGwxlaIRBE7ebBqTrueGX+Ak4b1X3
	 DCyODrRrfsBtx6mBwB16OrTUsQihnMec8KXoNWCeX3j0QU/+NqHfLg9o8qf+k4IPPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOFZulKP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6777606A31A;
	Mon, 19 Oct 2026 21:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOFZulKP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA2A1F000C4;
	Mon, 19 Oct 2026 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445079;
	bh=/1AN1ESpWi5jgJPYsy5btghJQVKGbBKJpkxKtYBKunU=;
	h=From:To:Cc:Subject:Date;
	b=cOFZulKPhn3MYRu1y0ekb0riZp6D6+qjITek6qm7uSCUrIRhXej4s05s57YMCr+6R
	 l9mBahUFYFhvc7w2ix0N8x9aQ6Mwwu2F2Fg7BBIn7J+mmHjsDFOW0VB/Rn0nYlQER8
	 /S3nqNBneUgY9cILeuTL0YQs6pgKWXClNmMTfW1Yrgzf78mjQLHVC3ZbpFP4ZVRzfR
	 cXc6risAA0iNkB/Iqu2LnGmgTiF8JSbBllRZ7IJtTMQcIB+cgwQioYpPS+6BtmMJ8i
	 P28h/368CrhAldiB29+cQ5YdimVjxuQN6uzqJy+ozUzD2QMOe/rNhSMSaXQY6mUdQy
	 X/XITcVyGGz5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Kyrie Wu <kyrie.wu@mediatek.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: dt-bindings: mediatek,vcodec-subdev-decoder: Fix child node if/then schemas
Date: Mon, 19 Oct 2026 16:24:29 -0500
Message-ID: <20261019212431.4109371-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The if/then schemas in mediatek,vcodec-subdev-decoder are all at the
wrong level as they apply to child nodes. The clock-names schemas
applies to the parent node, but the clock-names properties are in the
child nodes. Move the clock-names definitions to the child node
clock-names property. This exposes that the MT8186 clocks are not
documented, so add them as well.

The interrupts if/then schema is never true as the parent compatible
will never match the child compatible. The subschema also belongs in the
child node.

Fixes: 3fbf1eac01b5 ("media: dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat soc")
Closes: https://sashiko.dev/#/bug/linux-5ab90035-1914-412f-8310-097fb05bda15
Fixes: 355e9472ccb0 ("media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms")
Closes: https://sashiko.dev/#/bug/linux-caa6adb1-38de-4889-9517-2beede7c8f96
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 77 ++++++++-----------
 1 file changed, 31 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d1d209cbbd43..6033ecffd707 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -135,8 +135,26 @@ patternProperties:
         maxItems: 5
 
       clock-names:
-        minItems: 4
-        maxItems: 5
+        oneOf:
+          - description: MT8186 clocks
+            items:
+              - const: vdec-sel
+              - const: vdec-soc-vdec
+              - const: vdec
+              - const: vdec-top
+          - description: MT8192 clocks
+            items:
+              - const: sel
+              - const: soc-vdec
+              - const: soc-lat
+              - const: vdec
+              - const: top
+          - description: MT8195 clocks
+            items:
+              - const: sel
+              - const: vdec
+              - const: lat
+              - const: top
 
       assigned-clocks:
         maxItems: 1
@@ -159,6 +177,17 @@ patternProperties:
 
     additionalProperties: false
 
+    if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mtk-vcodec-core
+              - mediatek,mtk-vcodec-lat
+    then:
+      required:
+        - interrupts
+
 required:
   - compatible
   - reg
@@ -166,50 +195,6 @@ required:
   - mediatek,scp
   - ranges
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - mediatek,mtk-vcodec-core
-          - mediatek,mtk-vcodec-lat
-
-then:
-  required:
-    - interrupts
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt8192-vcodec-dec
-    then:
-      properties:
-        clock-names:
-          items:
-            - const: sel
-            - const: soc-vdec
-            - const: soc-lat
-            - const: vdec
-            - const: top
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt8195-vcodec-dec
-    then:
-      properties:
-        clock-names:
-          items:
-            - const: sel
-            - const: vdec
-            - const: lat
-            - const: top
-
 additionalProperties: false
 
 examples:
-- 
2.53.0

