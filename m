Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498B3672A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362417; cv=none; b=EzxlWtrf3ra1EIConaIZBUzXClj0eutmdpyqV4lrlIm0UwzrkTsAb3h8gB1LUYoWXRP8WwFjMEhLTZtS9I/NFrPNzUaSxZhAPOmLZWIJZec9//zhYwj4k7gRt0ehQiOktBiB4D9BXcTBoILinNPP71iRtCv6C/4rtUS3PBPWpfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362417; c=relaxed/simple;
	bh=iGB5A7kG2/XHLgLAh7HgAItjlBw/yOawGtKgimguyD8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=keNzurbIN6+41+Jkg3DY8LGf1868pswFQFkujrlGEMK6RBQRAZa4F4g1iJS0UhPgUKGz4V5HG6PnvpGKhbWcbaRn0Xcg8XfYFivF+OXFqH9Ir4GArXi2YAG3RHVQzdf5J3+la54K01o7Z0OspDO77zDsT+LB8Zqun9xOOJxZ77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=k+eEXbXI; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="k+eEXbXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790362408; x=1790621608;
	bh=o8Zh8ypkR+J0IaKNJxzzlPYCPVRTl41mdQZpe5rZ0RY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=k+eEXbXI7e+KZm0FI0CbOYjMm6ynWiF7bqVymbmAFGxNC4iYPislu9JLBLhl5GjkP
	 omGTYeehYWzKy1z9sikGHRhqcA5wGqKsyslHqgOG1Sq1G9rg+p1Q9CA+oxCbu/x4AB
	 K3snCKzJoNJCwnFiV2ficbSwumE2AFLa3QiPcgbVwwS8aFDUUa3w2PmJYOeWZhzMz+
	 rDGIJPLm4WSj4gTkq2W71DBvxmKyO4LQBuLBn2UPUxtKJGniYvIWcTkmxoBzVU1Vf+
	 t3DlsCniRZsSM+v5ghHoTeSp/Ytat46tEkRZAfnGr/iLQkDXm94UXRUDhdZjBOCRrJ
	 C8Wd2GYgrhAug==
Date: Fri, 25 Sep 2026 18:53:23 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Message-ID: <20260925-mt6735-pinctrl-v9-v10-4-cc042983c565@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 446fea31648009c4c7691153c14f119d75393922
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 36 ++++++++++++++++++=
++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 4df6971030416..94117008ebf9f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
=20
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:

--=20
2.55.0


