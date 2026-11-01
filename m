Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520583;
	b=P6bdShpdVH5idjjJQ581wXke1sdZXsR6Z5iVna/Naq96vLLD3R5MHDLsm1lxxOEsA88G
	 0aA2ca1rxC26hEjdifxn0ZJ0/DnJOyDIu5VhVKnaSkA9+rTn44P05qNIjjFrnLu69iULx
	 ZsJIBpE7c3GCilRMCKvH0jZRsYjpl8b2pbIHcgAwM1kKtvIgbxtmIeYSE/R7r+bS4Ah1l
	 QcD/MF8QVlJPX4gKOadv7r4L+1jrEsGEMD0pDBSe3w4XKHD9G8uPc8MaPnrAE/vgdTH/2
	 1H8VzEBA1zRtBNZDq04c96trdLVFq+4LTnvQ2n20gD+yxjI/w/+MSJeqisjTPSw/uhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
	b=LObLX5p5Xk8uoWq5lMzy7tAJTRqZA1UvhZXPMhq/X+rlaDTE5+vkVKrZuHPkP1Iuio5J
	 ZthvKucZX646YrYdCeAhGOIqtkrB5nVa8nbOmiwYh+HjK4Vl6m7/+fOuhleprz1ziCa3P
	 eylIWnVbvbYjVeYtPcfThyiYdtGpWdIzCbGE7VB3MV5TWNKsRZFw1IOWyHp9dSMhmOfd/
	 /LvbP6wfNtUW/K4wpwwCxKLIXrC9gpzhEDF1j6dygIvrzyXiMmtFgH/Sx7jfQR9QPzEJi
	 c1SHwrcnzT08RHxS1+CTG1uk2ApDwF+ZcTkuOAdKge9bw4spW+uLKKneifXvh7fIfbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B51606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B51606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4015261eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520582; x=1794125382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=wp6k7NjO7CvhnB9nj/3d/3iVOtHiuOC7juvPoVeBZzvXJDmftA6/TLI4zWL8Dld//0
         wA8cHBigcXtZ4Kz4r1wdWExQsZhcveWPx2P71RdqfYdnMhnVmaNTTMgrXVV7LKRMhOJN
         XBneBxGqmDus+d7xflLQ2CiXhsg9Zey1hmbzT/0xxbNjgoYy28qLFtsXKnwo8PdhDKmk
         wDVtYqwgQIREWraLUSTzjnGyMOkuxDLZj1eV5JJuvgcinAtMjEuqkagKmu0sCNGXWGes
         CY0ezDue5rCO4+AHKFA+3Lea7B5ZxS/l7Qa7kpt5zK2J2MqlKuc2vjq/rsey1xb1/9/X
         taEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520582; x=1794125382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=H00z2PEzWpNwZYpAoBEd1mppem114eR3fzs42bmFdKU33sn3Xwv7hlU3KiK5XnbpU1
         BXmkVhgg1A35juK4TjxR0jcwvkF7ijR+SDyzQO2a4erk13RYGG3+9kUv1Ia3qs33QXFz
         eugSizJkg1qFYbon50l2ROvaXaTRLBxX7c5R+hCKYmFkX9haxSIowXkQwjHdSY2uc7rk
         HXaam4XZYgNUEbvAaUS2feQvcGVoilEMfL0bG5eArYbLC6vyKm1HIyeCNI1E76j+YSoY
         nb93GpLnna+b2njl0W3c8QoJ38+B21n8kTE/2EeeTaHs3EJr2VXvTAKJE8jfzlNirP7Q
         8+/g==
X-Forwarded-Encrypted: i=1; AKwUvBwWrXRHhXGqz8Ld38ggNd5BJrqdK+maQcYtwIcwpRpNr64E89ybv0KjSecIfEaPeGm5SE3awVyjXyJf4jI=@vger.kernel.org
X-Gm-Message-State: APuU4Z95wntI2B82xgnONgvLFCPprC4yYtVt2EBjXufWUkK1I2ZIQjU3
	XpvM/obLdbcQHJoPljseMR3jSLYT1T7sNjQsXNGqG6gmuq8HyNzmW214
X-Gm-Gg: AYBFou3K5rEuzQ8fxofEAD9MYbf5VB0pv+XSSxU0hRmcIvRWq84rkqGTwfbTKLTWe4o
	41KNxAYE/uL8jo70uVv5ic94xMgcIwOIIWm89cwpQEsVXAR2rvDmyPQV+zsaEedx8FzI9Yy9LrB
	PMqHMdY9/0yAHNPzfE6C8iqKHOSNPDwDUyHmuWPZT/8Yi8c3M0OzNZwTeykdQDGVrU3eGCEt9ig
	GhRiWUmFqWu+4HpdvZrgJ09vXHjSponZgD7sdXg74xLllGYSdP/GqoKeT7lc90a1sZDEzLTyIAX
	t1WTqlazpRGwaavMOqgOjzS9mb+Pi01LHlKJ9ZyReOk/RrfqRxz1uC+d447nLBQI2ErWGiXLHN0
	VwJW6BzI/Z+a6UBYJSxbN2untskrPJtXjKgsPpZstbOjUf6NzY3+nZO5Uyni7+h4mM1tFy9QLnp
	IdZ1prQu48YpYVZ+59qJBNgdUMnAlq3VkkYF4Z0bYvvA7bLlD/if/LV2CgGsWqEvWEIvV93tD73
	+e8dSHb4wteRzFMS6B5SGpY93i7g5UcXyuprrr5i3w2w8bxjgyKXubI5tNREWAean5dBjuynhCQ
	KHpmOOnpFmk8d+TysJ0qbfezVKGHUMLcQvJTp8+Z
X-Received: by 2002:a05:693c:6304:b0:36a:60f:3e9c with SMTP id 5a478bee46e88-36a420595aemr10215792eec.0.1793520582159;
        Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:41 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: sound: add Everest ES7202
Date: Sun,  1 Nov 2026 16:09:25 +0800
Message-ID: <20261101080926.267041-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

