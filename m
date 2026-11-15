Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774026;
	b=sbrDc6UUSA3xaHeZ0vv53ZyRPcYvDZ7qIt/L/vOm2eoANEZkUU7QS+/fo2KDIG0U4Myk
	 TfB26ebFjRfZZnIRapj729FATxzZHGkhPD4nfIYo6k1yrro/iKGlP+z81Rxpt6Lfb+XP1
	 Ik+j0NyEjcjFapMFZ2I6QUv7UDX/R5NBk0mkZWt1JQFCaRJ+vO2UIumvD4Tt+UScicmXI
	 ScMxWkttY5W9mBAHbdiDS9OYmiWjwDrmjGBjZTEpTHPqxoJztzIYEAGnUz22JEwZ8Ti2d
	 qpCKRvGUZFdbQSDhEyIqNec1xZH/p1nGNgcDHLtcwkfIIzE4PgWFywcXYyimkruM1qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774026;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vszf3tg1kPcu34CzVU2HzpjTqrtCjpGWNG8mk+DNgCI=;
	b=dx2B/D1dQUjme/BzLZ6P3TrV1pNTqpLQ39I3qMdXrGdcj/vnxyRzbth+cLJMLIkbbYdK
	 Y1xlz4DF11DmQVc+IoOpVaoP8wuQPqv9syCSSKBCCmmqsHUwLCnZBz0gO1yV2/8seZPEz
	 kiBwXKpooESMPjAqVhdVAKC10e4MnTvDpvXoYUMo6uCoHFtNC7wWQV84CtXK/kDZtM+i7
	 MhWC2/qDdCCG0qUSSUAoOzi2VU3Z7P44We5Zjwerf4cgmjjQoW/1a96or84P1m/0bPFGi
	 C+RkDE879PNtcShecGhvXhnj1jk2tzxU9Aps45P0oLkjRZIKKtODxUMF8mRNAn9GJIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WD4HAg5T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86ED606BB02;
	Sun, 15 Nov 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WD4HAg5T
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774026;
	b=IlxPFjTkIDNH/q/AQ3+PHipUwWSlMpHdhKaiK0PWYY2c3GsviuzaRD1ew7ECZdCfecNz
	 T2ei6Csh09ZZYi/yJd/oMsf8QkACktWVWP4gqe046utDquTyJZCmVL362uWMD3GeoRzGa
	 kRI5SLQmrPCx/xLqy7ISZ4Hy1NfOJpfc2g+pcyoHcdIH8H2tFBlnNBp1O6AFePYGfIP4y
	 8xD++obm1QH/7PmogxWzR++C/6OyFGlPrC5sLo68udMkCEhzj1b20Y9L9WFaxny010+9x
	 izuLsLRWW4icBQblODaVS0G7B/U1+kMRylv5r2Fh9bCaCeu0wGlHSnVHfMHkl1T5/lg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774026;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vszf3tg1kPcu34CzVU2HzpjTqrtCjpGWNG8mk+DNgCI=;
	b=XQBoIqV4loFks0O93NO+IabXqyDbeLrOeILFiGfDtFUOYoTSEf6+bYqWu4bMl64YbisD
	 gli8y6zxaQNKqQl7whRORnrrkaZOI95k1TcM+5mcB3A4pG3O4j46g4oqD9EIb+M9mG5eG
	 93f/FGEnXXRe2jsSI1mV+gK3PZYzyTjQ7jSj4goXF2zbyeYr5KhmTcRidXZH8vTlHM9Az
	 acW+WrVmFqNYactxbeS0P/H1xKaQcjfy5uOtCcLvOtXKT6ywobQY1XdMPnIHlNlXhFfAK
	 XgA0ZGW8KZ/RAcD8bBzRmD7E8om+nSe28o5ETOtzqr95TMOGJ05GwhAxBVxEA6te8wA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 081A51F0089E;
	Sun, 15 Nov 2026 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774026;
	bh=Vszf3tg1kPcu34CzVU2HzpjTqrtCjpGWNG8mk+DNgCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WD4HAg5TFz6nmLO7FvEo1RyB7YTf6GZvMxn/VtqEknoPkkGINCRQFL/7m7Fw3DnTF
	 StJRZiLZWADFu8y6kBNifU09wrZD21bpW4zVz/SSdJSp2x82FVrUZA5RjOSs04Hg23
	 ldh3HwcavwlM/7LGvV4fn3H/bIImVIub+QJt6Yp8hlnyzbSMNAn9w0e9Y6psOHPmec
	 mF3SOQl+OGxfIrYFI9RJC7zQw+csldrnFB2VMdRPyQjITc2ozet2V+KosUXjsPJG1p
	 yV+uDo7DXuP7wSHkSgLEyD087YlOp72yN3Ckb9C9kFxZwuAHng7uyZ3Pugm235Vr3E
	 mNuTpQn6JTyTQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D1D34A1D7;
	Sun, 15 Nov 2026 20:20:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:25 +0530
Subject: [PATCH 1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
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
Message-Id: <20261116-vantage-tfa9865-v1-1-e88f0dccc427@yahoo.com>
References: <20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com>
In-Reply-To: <20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774024; l=2829;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=E/tLGY5ToflUGGU/9zfOXZ62i6dDmdU3BhsRJ9tIHyU=;
 b=FkE2SeHQ+mgeLQVqO89a0zMOi4mCqtWkJCJe1uTgOVLKM4v3RkoQ1PjUVRy8fymy9o1SFRsh6
 XV1DrHI/LNjC9uPfzYLMyzlVIRxRl+gpY5rKqnJW7rXlSm+FgHKeBd/
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The TFA9865 is a mono class-D speaker amplifier with a boost converter
and voltage/current sensing but no DSP. It is controlled over I2C and
receives audio over I2S/TDM.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../devicetree/bindings/sound/nxp,tfa9865.yaml     | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
new file mode 100644
index 000000000000..955e25abe749
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,tfa9865.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP/Goodix TFA9865 Audio Amplifier
+
+maintainers:
+  - Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+
+description:
+  The TFA9865 is a mono class-D speaker amplifier with an integrated boost
+  converter and voltage/current sensing. It is controlled over I2C and
+  receives audio over I2S/TDM.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nxp,tfa9865
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddd-supply:
+    description: Digital supply (1.8 V)
+
+  '#sound-dai-cells':
+    const: 0
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@35 {
+            compatible = "nxp,tfa9865";
+            reg = <0x35>;
+            interrupts-extended = <&tlmm 201 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 183 GPIO_ACTIVE_LOW>;
+            sound-name-prefix = "Speaker";
+            #sound-dai-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..bbe812e4257c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20386,6 +20386,13 @@ F:	drivers/gpu/drm/bridge/tda998x_drv.c
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
+NXP TFA9865 AMPLIFIER DRIVER
+M:	Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
+F:	sound/soc/codecs/tfa9865.c
+
 NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-sound@vger.kernel.org

-- 
2.56.0


