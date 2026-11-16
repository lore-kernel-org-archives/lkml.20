Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814790;
	b=NlrM/5hPtEExgdtI52UiDlEmPVMcarlwQhW/6lNGTWjsX14vSRVZ6sy1W+SwYAsqJN3u
	 VQu93dh4IBVKCM+PWk0NUSSrt3nyMSEJgf6hnmKqK6dkqT20c8z6lnmYz+DTzTps/FPeR
	 G7vxhEcSEMaQFTF859jzh0vo3GH0qmLwdDRAT+stgyujowajowcZd6eTiyZxowIVlJSv+
	 WxG0wRglHQDVVTZlyjpBkrNS0PGfWhkINeFMRMDGcBQf9CAxn7Ftz0VEQYJFBTXQP9HvY
	 puzt7WxOkxX1W0azWe4UO9Ah/cW5Psxt9b2mjpN9Nz7ChLobEvG4YN/9Yxk5CDYhTWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814790;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	b=cOLbBSWpy0HnIckeCZ2xFL8uRwNUwCMLUQU9wCKfbw7un+XG048Bsh4Vg4LEQvp0X3n9
	 1ay8vhwB+cuxUfbwnQhHqxWvoSN6LzKvJA/gwe2LksbAgXZSsrhBUJpYDWbAHT/kCMehx
	 p6NO/yHp/CG+5FwGmaveX0RQ0nQbyKANwjWhiiR7E1DWE6ELmT6osOkczs+HjLwA8Zp+X
	 Yb+QELcKUzUoXADLjxITpK/XvpXsgDPlDfmtrQi5u28rzZp8gOvJHoNh69l+jwpc7quCu
	 7FAzhSogvM0JIx5ClYuXLeGnPmIVG01lxtorWwTy4MC6l9b7tWkOCVWOIgEKXm48msw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXuHRlU5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0A3606A323;
	Mon, 16 Nov 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXuHRlU5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814790;
	b=Kj/1xhW2jZZ7J6DFeouce9u6mUu61AsyfB0pwU13SPuzttNr97LdzZ0Q2DCJDH281ZQz
	 LI/meIF3yrPxDLP7tDgL8I1J9A2vsKv1PWCZJyf1lbO9w1OxejWb5/O14yNA0cfp3wf9k
	 WEs5XdCZPD++B6yoCW1hQ2/RexXy006bFIHWO8gaUAT/hg/Oe7QihBXPvcLQZLKtsrecJ
	 Zf43ySDcZYWie1/+IPJwjqsLDcuVRn9IOMfQNoIcGdpdp2MzItjCDwz1BLI8p9+oAG2I+
	 KorvIuHn6LqeNsezVlXG63jFoWeA7SmJJiXrnJepFryir3+4k9S4tnjYRd5kjP/qm/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814790;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	b=uESlX8Ci2GwF0dWDOg7hgSR4xDT9gciev3pjpPh3p1CLLyAZ5IQXpPuKB1uIyQw251ar
	 kQ7ioHWhWuH5itdAqGhaOrw5feV6sSoveuFbbfjYZFy4LfW+s9JVraonX4hm/RII84Snr
	 Lbur+dE/z6/w5KZ2jMKMUbgzQ8qtBF5WOEnz4AF8N7DaILVk1N+uj70FuM3x5LViyJ6nO
	 kTs3frJCil2AFZtbcPVPGMH6bhQ3vlX6ffCkQ84svI5JtldcTyLhnzkBdwsPM11ZWKS3Z
	 FumWrsg2KqcS+SOx6AumbwpegsypmjmV15bCWjw5GYliex43ukOzzkWVIzFJq882s4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DB8F1F000C8;
	Mon, 16 Nov 2026 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814790;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GXuHRlU5wnaO2EyRilpe+wC6nyRS9r+AWNKLR1hnSE8mnlM0cLMlK2KJJLYkH+xEF
	 eBdF4ydvqPDGLfq7oTT/KhTZSkJDIZX3ZEMdXSJb+akd1lVJ/HU/ku6Tp+iEStIRwT
	 O6V8qIrHVApUKdzxZuljBCouuvxGd7eTHR4bUN+pFrteJwZrHyLOeSRV5oKXqOXVIB
	 S+EzZpw/i7pFZHR0gJcV5E61/Nn4yfdgrp/fuSmm0t7aGWURPrZh+k2MMLa8eBSvOQ
	 HeQHN1dxy2/jEJcFO6Ii1NoNQU30jvNtQHU7t929+ZZ5niq0Fqi0ZitIcKstN+2Esc
	 9mzxnqqSCR2Lg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A34014A394;
	Mon, 16 Nov 2026 07:39:49 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:09:49 +0530
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
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
Message-Id: <20261116-vantage-tfa9865-v2-1-a93f976c9479@yahoo.com>
References: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
In-Reply-To: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814788; l=2798;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=clpAsQwAhx2GufbyRotHi6YglHtWhSHyZbTP5u+hrn4=;
 b=jbgwJWmMLhk1gJB4iUSTV63UZ60HKSPbuGKO2BYDmqlS7zbd+7p0jb/TErodhGYKlLhiJWx/n
 YipTXqDkywxA5byEyvyqrIJXme09WHZB6VyVLAueENwcAa3JZ/xWyvS
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
 .../devicetree/bindings/sound/nxp,tfa9865.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
new file mode 100644
index 000000000000..ff8fd35d9d10
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
@@ -0,0 +1,63 @@
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
2.56.1


