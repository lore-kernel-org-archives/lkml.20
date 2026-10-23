Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778368;
	b=RKrHO3hi6QxqCo3RxR+0wXxmHG2X5evqlVwnq1ZDw125pb7a1UADAVcOXfNV03deM8Wf
	 /mJbsDJU+Nh4/RXePxG2CF6vLinuQtHleCgZ/szt+YSsxtHU3bmBFCkSKOJMTvVgXNd4r
	 4T8hi5m7rLxX1d12IaVw3gQGXEu4ZjxiP23+xznhDUJ+MLBgUvHQ6Olbg1ghwQ0A8gjA9
	 o/X3GrEhB9SQ5sPFgPqy0VIXBWlJefexNjePVUcjSPz0ZwvOu/k8+I3ySDoHrCgOqrOAW
	 TtThBBK3GuE4ANNkQ3p/C8upXB5TUAHoVVy5Un8696dZrAupMNgcj1eYd4cSH+XbX8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
	b=vZ5iwoK0uOisVMuYN/TGYOoMQTXI6uYcE4Lw09sr63xZxMBO+JQasw7Eb+WZs3eCkwMS
	 IkZD5ySes2Yb3KKmgA0mUMA0xskOmOds7jX5S3H5lRBZB/2RZ5N8c3vPfHpHHcjbw0nwe
	 0XYlXz8V/H1J85GNso6NoulDt4RXN3lUH77osGmVsmkymT+Nk05/Iy4ggdTY58nvWjZJi
	 9q1PF7PG/6fkYFWOOcCPKiVVmvHLtxiR4tpCtTebxhsi/EkDX59vj0v1UIBnDZjw4dIKL
	 xPCygVhveFsyexjCMMf/Gil2al6mzPOX6mT3AsEKItLTl35K6AwQfSYy3MuE46X4wcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F51606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F51606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9491615e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778367; x=1793383167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=UW1CsQmWp71H8y3Ya8dgqs5sxJZmBbYOORQQ+AMwjIQDQVb76BLAGEYcIl17q9xPIZ
         uvXybPge4G98nc2n4WLPIgSppaD5S+7FH/X6dK19ZdDJpl+zWQ9S6Whyg8dzczUbgzQT
         4gg+GQVFGZyv40vw2UQibUrse/b6E0gBoCxrdFt2YRhZ52MZQJTzTvoraZiOE80wRlW9
         hl703X4LUXodi+Q+1wiQIuiIIZBXLbi2nvoYuZHoz70a4dlqQz8GTdf9yGYMeTEWmdcz
         EaSYOIfG8JRL5OwUbajKVaCsrFJcfj1WrGAHLxouW0MbyWlbHDMMc6ckTIBVUeKjs+1W
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778367; x=1793383167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=2JH6ynDwrxMA3NNe1zFAu460AteYYJpiKI9o4fbsB97lnmTaPVprTG0IaE8znDr0X+
         Ykuuec4S+0DNwG4yq6ycks50mb6tehBsma3tED5CN1WP1aS0HRF2U6fmeFwcMTXt60uj
         FMcOXMa1CBLTRp6I2MEafwkmuMU6O73e3br+vCBb8NMqe8wdBVK4GgF3tmjb2oWz1B8U
         8gNzkwCocgfxb5nVUvyvRK+u2GNCDkiABEp7y9lmtM8TvfokAuuFNMu+Lpm1geDqvPxV
         6JNWke2xQf/+0ePeRQGV6AsZfpkggbs6Vw+GFaAc14ejURHvMtOLI20DOKQMS/mvcmiD
         fqQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGlM71iQ6nrD/iDLTCSVFpGtx1swuzFpUjlDGyzbHzAkvR+2mJI6UJZ0uJ9TYqjh9jmOCtLmA96X/rjE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKkdjeGOThiL7zYf3FfKpDiUUdohVctuQn3rAmhNhAceu2coHu
	Xg03GXJsqc8wzNKEW0qJQ+ZP8Fv59+AP1u93xWWVVzOivNwkiFmg+bcl
X-Gm-Gg: AYBFou3NqgB+L+LGBJ24ThoVXqGoTLe4ZOpjVEnUVaqcvgwgDkuyWJZe1mLWYAo63gu
	FW3CqAGgG5tvBsLC9RY+BAOOGYur1wtdZfEwZU1eEbw2SZ3fv6f0yGmDn5OWz2GeiNhi47Or6wC
	SKHFF+z7IAS4Akd1S5QcAV09CopbnM447loNeokBD3EYGXt143JQFnaCEKFchzneKtXemGlD/9e
	LhMPhlrnjC3CsTUF8T2TNxDjyaSDA0aTxbGEpTNmmiGFlTB4qC8579GutPWJesrj+cS4WUENT9v
	10K8Ze6aCZZVCKlRec/XVzUnBTZp8VAo0donFJUu4sfEUyDJs0H1SN2scpZZcM7iXbsDTj3q6wV
	uohwoJcWSCrbjBN8jt8C0monJKROwSOMA1O8jhvraERYTWOACvGQJO6ARQbEx49aM+wtfZlTpje
	JDSabWDdu0UTSi+KK0QrHZowsSo4Hg0MEzxANzskQU9021u5LW3VVIfNtvzbP3yCLMgFkkCyXny
	6+kbAOyezk2oFGAsP5Buk8F1fslPJP0lpjU1jd9FiM055QoZeiXfptAZCuVZhmA0lfcG7cl/sdx
	y8v+GzUqeYbJvlcMuo1Mtn28XUdY5tWsqgjaETQEHW4s6eTQFJQGhbkFA3KoTaAPpGGXARVCaPR
	W55htNfhZ66GLULo/LqSOrIa564FSQNoGzXmKPTwwk5nl1+sXlr0AGOkgqJnrWB6L6Ug=
X-Received: by 2002:a05:600c:2196:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a211ee51famr34379215e9.25.1792778366577;
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Fri, 23 Oct 2026 18:59:12 +0100
Message-ID: <20261023175919.160103-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the ADC binding for the RZ/V2H(P) and RZ/V2N SoCs to describe the
ADC variant used by these SoCs and its differences from RZ/T2H.

The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
20 ADCLK cycles, does not support calibration, and supports selectable
12-bit and 8-bit conversion resolution.

Add RZ/V2N with RZ/V2H(P) as its fallback compatible, as the ADC IP is
identical between the two SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Ack from Conor

v1->v2:
- No change
---
 .../iio/adc/renesas,r9a09g077-adc.yaml        | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 5b496729022e..a0fed2f31370 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -18,11 +18,15 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g057-adc # RZ/V2H(P)
+          - renesas,r9a09g077-adc # RZ/T2H
+      - items:
+          - const: renesas,r9a09g056-adc # RZ/V2N
+          - const: renesas,r9a09g057-adc # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g087-adc # RZ/N2H
           - const: renesas,r9a09g077-adc # RZ/T2H
-      - items:
-          - const: renesas,r9a09g077-adc # RZ/T2H
 
   reg:
     maxItems: 1
@@ -55,19 +59,22 @@ properties:
 
   dmas:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     description:
       Must contain a list of references to DMA RX specifiers.
 
   dma-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     items:
       const: rx
 
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   '#address-cells':
     const: 1
 
@@ -101,6 +108,29 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-adc
+    then:
+      required:
+        - resets
+      patternProperties:
+        "^channel@[8-f]$": false
+        "^channel@[0-7]$":
+          properties:
+            reg:
+              maximum: 7
+    else:
+      properties:
+        dmas:
+          maxItems: 3
+        dma-names:
+          maxItems: 3
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

