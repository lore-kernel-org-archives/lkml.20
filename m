Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EAA3CEB9A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544436; cv=none; b=G6U0bT6fvG3Tt56w9fyVnaHTeSkSqzfmcGIuGmJREU5jekJviDApKa8IqB255Xa9Whjy1WAJcTv8UU5x8zhMc+mjC8MqPoob/eYspji0xiKdjqhs9Ck2IemtpfpJsOQKTKaEPxxDzaIYv4z4shR6hH7MTw/Bxd2XwcQBsz/NILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544436; c=relaxed/simple;
	bh=3Z8R88v/tx5Du3rc1hWNnOKXjYU+6r1PY7B4+5MN3J8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aA8DA10QHzGBled4uj571rBlE8V18SdIH+ZIz8RH5Y6IN3abQuP1MXV+Eqmw616hV7obnPLCKKDcloV6p1G451K4GOU4d9Boiq0biYV4ApQ0GEavhTPljebfK+C8Vc/v2W3Dgnyqi3MXK8Hc+4Y0CkvfEED3JFc8xOjR8NQHnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnTQWWWh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnTQWWWh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so24840285e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544426; x=1792149226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=LnTQWWWhJlN0TmbnB1nwlKyVZBlAkg8yhsC/UqDzQh2iGHLwd2lUmz1cElRvGCtVJu
         xEDJX71/nBkoxS8DnwsT62+NeLRsgHOMui7++rjoG/ZbwKb/wMIETnbwmPuHAb2O2rTK
         1++Oj7Cta59d8l7nwpzRuS5KQ/rS+2DdC8O0WnzkfIqgz6PeqNE0BRh5JJ5NT+2SB9sG
         A6Th6vi9QeLf8iJggGzyHDYTdDtz7H821Rj0YJku0lTzUl5yiFOdD1zFc9Q7x7a6yaCl
         fcdTfm4sMpi8lOtGP50QXU94Q8LTQpGNudVXGyYBQLHd2YeCLKV23PRaZdR5ZuVLqjm8
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544426; x=1792149226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3WuHrYY1WT9oFIK54Sq7W39RzHltv6fhaKlkGGpDGWk=;
        b=yJhxOxR9IvFE7gU+QieImKedEwFEks9wOXX0AAa778NGRZRJ47e6hbgofvkmohpqCL
         T0gWdt85192mc942pqJWL5kXcSdJlmeo4ZZFZSsTKtHt7LEPlYyumNvKrjEM/TPSQ1E7
         CunpykbYwe/n2fKiq2qYtWQ6uAsxhCzpyBeDdaaxTP5l2QhWtngp1dqKp/BAJONIg9y9
         r54MnpJJCxWQa8fvS+eRCtY1U35UzZih7uaCCBWBXXvRfLIUzPMqey0Ns9KmHK5txwnP
         ZPFHoqhFG4NPevEMpJLWpDg+W7qai5PyYVnAvtISVaPZ/GbCoKZdazHVtZLcFSfxrYGS
         VAIA==
X-Forwarded-Encrypted: i=1; AKwUvBwNiBkCZsvc4I6Wnvj2gbE8+AiA1YV0YICoG/OKtqKanrW/MJqECaC+2iVDuufRwmJ7+OyPYyW95rf+U4A=@vger.kernel.org
X-Gm-Message-State: AFuF++lKfcoO/odAJKMnO5MJnVCbIgMRXnWaPIMxxKoUs4s1XgrCeSFV
	eVqLO5NQ8LAtUgLQJ0yGSghrmDXrgZ6xRX+bsBCjUCTbVI0OcYwfGkNU
X-Gm-Gg: AYBFou3/jOBUvxryTMRbSpzIBioZnw0Mj11BrUyrjqqiLnP+mX4exjCjoo1oZ/oMqzA
	QaxMZ3/6+wN/gDhcpKPGgtrW6oij500hvIEBfOhx7OxXMXYAzIlO0V0mcflPc3YAAsnXXByLBQ7
	4HZ/gDfDMxvXcWMMqN9RmYcvogvNdGzQWaNzAJJzeeRyGvLH/E1yjSrSlTETo8qJGUwlYC2t0zx
	qXXpRWJT4wOETRcGDViIHZDp/DwEOhuVl6fq7RKcplV5rL+GZFHttuFHuSwcrLZkgWuusBSIpeX
	uoeOGQxjuh4xGWQkH9JZ8w/qYnViZeK9w5fFesKvB6/bnxtiM2e443kKZDqcFa9UdSDJ0eaPOFR
	o+EhjCGS8M9/WErxgbo+aZ/YhaqLtIDlo2vgczwWAk1TjoV2YzoOHXWbbDt5/BgvzwaYCek2udd
	FoSlTSTKkoEt6jnmE8q46t3o/5hzVz8oOnyrLYi670oJAkq+AQgR5ZZdlMrc9tm5P5jdpL84K4V
	Pkb4qob9soA7Vc8RaHpn3XotBneof+qwiBduKvoyFuAsol9Ethe04N2gkzs53ln2bYXSeDwpgUq
	hoW3u5Bn9OGK54B3
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr29756465e9.32.1791544426066;
        Fri, 09 Oct 2026 04:13:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Fri,  9 Oct 2026 13:13:31 +0200
Message-ID: <20261009111334.23522-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009111334.23522-1-ansuelsmth@gmail.com>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

