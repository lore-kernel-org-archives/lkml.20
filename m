Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263926;
	b=PHihM+oeic5WW/Fyp0T5WzA0zXmQsT6lld2EdFFN662YrPO9G9+VO5Run33HbcPpF9fk
	 An23q9EJ0hK2ufOsLuOSRFlwjjPYIWDk600BNlVbeIICZCcc5lUtDwke8NNuQ9ixMGQhj
	 F4VHP2NasT+G6A/ttVjhLsG7Bo/fGZN6UqBVpTxtbtV9eu9o25UAGEanrnhBqD+tLcIjI
	 2j6VJAyWqYHfXJDvfTXth8GciMg07Stc5R0ynsPsxKSleFQCz0N5tm/s1E4915IDut0vQ
	 x/0WKtxZ9U/juJcqYYFuH45zBXJ/KgaSZmc4I+tkWXzdch0rLtMT5BDWmV3Nvf5olmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263926;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FrnO3uAfcMS5PfQHcon70W8wdgH8yJhF99Gd6WTf5U4=;
	b=4JiMRLkv1BCk7+rrDtHn3+Jbfllbh5yVy+deduiCZaLokdg9+4DztD0Zgt4N/WaAqbLd
	 BKLuBHlF6h+UQ46dd0IrE5ScOITpsZC7Sjc630LGJhkgbocexy7dGYl6b12KSeDvvTmo0
	 lk90CPRpStHedMr1noJGOR3eK5HqIn2FHEq5mnTXoAqTDj6NzJta9UpxF686EF5YCcLel
	 +Nq2pAhPOrad/naK7KXTf0i1tFfueayIqjGmdtjWczvauGxcbcoQ9jDXzWVWY3cLuNEl/
	 mJPXiKNAsalDAJWL5fvRhk6ADSjoZTE8+o9ImnW3pVTnCfBfXvQadwFGFXvMKGuUdag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IP9xbFnP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8160A2609;
	Mon,  9 Nov 2026 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IP9xbFnP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263926;
	b=olvHdHR7GwTaWel+OsSSLZMW4PMVyROLscfhi0HmS0kE79faKsPx0G2jhhJX052TCpIS
	 mYw/AIxJSP946rIDrSF7dsyXSa9ZtKqSMkSUAOX4rZpBry22VUbCvyW5++WwptJ+aws9Z
	 0jXc+V/mhUHU9oKMUB9uVDDRwZaP0oM+in2WXqkXUsugsmm/f3z5qxJyXqNoF5mT+wBib
	 gZkayGm+rG5e5HiUT0EU1r7zg/AXSmoRVjd4fvospjFb+/Ca+zYO7c38Bb5801i9nkoVS
	 YCOaAzefaVhO4bIgWPXpnFdtvWucuKn275QgnxD2v0f02nB026W99ELB3N50BKkoRyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263926;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FrnO3uAfcMS5PfQHcon70W8wdgH8yJhF99Gd6WTf5U4=;
	b=sglBFmTmInktOck78yOimm9puR6Pjwvu0JucWtRlXtXXqbSmUR7jeU0QCYwqCdYQVrwf
	 LLD/oBaw5QYWJ08dZ6XDgZFoIf0QNe4wY7MH8tD5s5J2GIhTGpTu2b0zow+prjxiHgfmG
	 e33nfZJq/0bZCVcXPFqY6W7v7lGEsqZNTNDSzZitwpRba2iorxjpjvaTDcqQgAElS7zCj
	 axdkn0c80GplK4YwuogCNGRqU0Eb1oCnAkigIP7P5vaE6Is1lGXZ7To8BN7OBOKCaBXWv
	 r9Dc0GRPafcD1A07eDhiUTLAm58lXiKacBUtj6D9VQ3as+zqhkJ9O+YnWUfF1tfqmVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EB841F008A5;
	Mon,  9 Nov 2026 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263926;
	bh=FrnO3uAfcMS5PfQHcon70W8wdgH8yJhF99Gd6WTf5U4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IP9xbFnP62PQ14F7DxtFwFKF8/eB2b/bst/a5oRivzp1/51ViV7Qwo4HARkbRQXXY
	 FgZdVBgipGTRtXebItqO7E7iV4gsv62t39plFKPnvbIZxQiafqjiOFiOVcRcnsaQZz
	 9lRPLXR1VW+iN8S47TBCxXgjpOUox/hhk3Tt5X/zBYK4C/A6laguuVc5osX88j0Xf8
	 eYGQ7cThN4Q/B7ZKlowZd+lxJFAQdD0OH3uv7wbun9V6HaeAGQhi9HibdAV8vwdG4T
	 jVk8OsEMYN4CimpO9Eg8j6PpgjT5HfS3QysI4qvFaYamsLVCCkakg+PotY4qmdJCJA
	 vXhdu3zY/t3Eg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9254E486DB;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 22:38:25 +0000
Subject: [PATCH 7/8] dt-bindings: media: i2c: Add ON Semiconductor
 LC898123F40
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-sm8150-camera-v1-7-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
In-Reply-To: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gaurav Suman <gauravsuman007@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263921; l=2002;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=rigIVBWMlVSOi77vfy3OEmUXyFuzk+Zl0xoBupe283Y=;
 b=AcNLWQdV2Cmi4kv8K7vud0KowSrdcDTaYl35bDVKPaCgiM9C1Poe50W+E7i+Ho17AfHNdAOlo
 V3ypeD68riEAQxRTMNIEl+uePxteBWXook54qLua9zf4P08X7oqK1c5
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com
Content-Transfer-Encoding: 7bit

From: Gaurav Suman <gauravsuman007@gmail.com>

Add bindings for the LC898123F40 optical image stabilisation and
autofocus controller, used in the main camera module of the LG G8x
ThinQ.

This was written and tested with the help of an AI coding assistant
(Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
---
 .../bindings/media/i2c/onnn,lc898123f40.yaml       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,lc898123f40.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,lc898123f40.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ac0ab6a8793547a5a3617b75bcc590a1e01af602
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,lc898123f40.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,lc898123f40.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor LC898123F40 OIS and autofocus controller
+
+maintainers:
+  - Gaurav Suman <gauravsuman007@gmail.com>
+
+description:
+  The LC898123F40 is an optical image stabilisation and autofocus
+  controller with built-in flash memory for its firmware, controlled over
+  I2C. It drives the voice coil motors of a camera module. Only the
+  autofocus (lens position) function is described here.
+
+properties:
+  compatible:
+    const: onnn,lc898123f40
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Supply for the controller and the voice coil motors.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@3e {
+            compatible = "onnn,lc898123f40";
+            reg = <0x3e>;
+            vdd-supply = <&vreg_2p8>;
+        };
+    };
+...

-- 
2.49.1


