Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292A42902A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141787; cv=none; b=PqkH3ZA1ISGoLXxf7CzYiiCcu3QGdRHlBMVTgNl9Dcs1Y3JqunzQkgZgfGj5E+yV+kPCSpYcxQq4oFQhtT8W7v182ehSI6ZNuB/0NlHr1tVXchJz6BzGHa2llxne+cORqbRjee/pkgUoQCYZ7/qtFHX9rOyjCl0k5Irmsbc1j1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141787; c=relaxed/simple;
	bh=5k9VLU6OvtrGZi0gO1yZy16OfwqfrZmQwujeqIifWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8yr2rJuOGpY07t/mx7B5PvqoV8ZFVC012GAzzQr6AVrqXojHtyvtrNOKk6vR+hrndDmil1IYNGWSsoXFloGtwXlCTdbHXXrQPPzcAJV3T7iNjjs35RG64YY+MKZtSY0frRz5o5Tw46NML5B8Hm++iOgjndfhgg6eaSmhcGWs6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8XH63Z4; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8XH63Z4"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso376316b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141784; x=1790746584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=F8XH63Z4doIji6bAgrFxU4KEekuBBKmXL51+Wdkbkecnt3xzvQGiJ1lj6kBiiQE78l
         6vt0ZXymtZwSyYJYb3xeB4CmuzVVdbvwsvON9Pmdscl6FcrzMXmyawBtN9dynJ+8gwNN
         YRUrlwN1ZBsGdgrlCvm4KY6vI00oR6JgtnCqXh3Al3/tQWCPvopqWqeScOzz3ApR3aMF
         qSRL/1UsfSmgkSPUXWGNkGBcZRViDMufWKGPqpKEkvu0eyJHIDhDYBCEAH3MEwB3n2dY
         eFQMaLv4if3U391jU5QfTeY3iz8JDef7iyMh5NtrfQdMcNMF4tqbUgVjIHsb3OXZfhhQ
         /FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141784; x=1790746584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=FEFFvsbFr200cguqfIm6jkdWB6TljSC7TpHw2fbpTlAbB5CUjqqzQpJlYhdQ/Mvqd7
         d9jSeYIj6yfvxG433rHYjElZFlbabkVaxbkLpODDb94Qnx4MPlKngIVVofzQnfp3uOek
         bVf8m4mkhZoqSFbsnfYbqU9DX8kWyiCT+SrixlqDd2bVnxZZtejIyE8vvl4C32HGRqlC
         KKiZvZxZ6IpuHTtHeIcCaAhwlJ/gFCd28MKrlAle4AOZnKHNS9PsesLFdLFwKtqGZxSL
         w082JH3KMEQpyeXNyzX1UFoq8TnGpobdznac3mRDXruBuzIXsDyypTzRPeO6RX+3waCy
         aqrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI1i59a100z01jlSt6xpb2joeFUuPgFzowfS7zMuE+8Cb08P5ZmkYahDfAICT1RzpzcUj1iOEV2uY44Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++nyedUpb+oT958fvIVSkgFlSsr0U0S/MrO7mooAD99Rz1rqERId
	RiAVwo7mJvoXP/kqh+ll0km5t6/lPKa2BC7fOGvmV1qGJZ39LQdL+bM7
X-Gm-Gg: AYBFou2FUZcWv5GWbuB4a6o9xB3ibU/15z6YStt4Lonnd7ZfEb0Pw7J+mj0J5LuKTz0
	+Dc5gSHBJZ3oJLsYmuGZYs6PL8IucePe0xWkVaghZDGT4A2YyG7FtRNdYWWK5RalWnwXPF/e6JY
	TNL0hje8tPxSJ3ARxPTDlkiTSxKzxL0z1n1j0h/y2krk9ePdWHEkPNfJqjrAw2/S/eyEegmw88x
	fkriaWVhHlBPeSEAwlIlxfRAYZFwet3QeSBUC1dNVgYOeMjZ4Yx+lrWT+G9Y71pHoBcMha1e6fd
	/G3RtjZfY2MflieB5XDwlPwTTJXpOTg1s5QJ9qJonpVnDIj/uis5NZoEzxplYH8Ada3dVU9b3bo
	rt4a9c0GWAlJIOrLMt9lY5RuD8CsL+0A2h8dGmxAyAzs7sHFPT+dWY7wna4s9L5f3p7NcuV1j/l
	m6llfulDo+8vgEMXjGtMs44x78oFRWfT+hqrBXSpOsrAfnySb03t086FACBIrEWaatYngz7K1z3
	SLkqyT56GZZtMB/YkiVhw0RIAhXJbnP5OeMuE1c95uhWBIl+Big486Mh7i4hyI8pKakjlj8B7B7
	ITKbLM2Awm4OdCJT0qBZnkiLsT9xLOL7MM/MnjeeX1lGsGMOEq8frvG6qEysI0nhNV7hCSIYBRR
	R1RXshd8OX4ax5n3PVNpM
X-Received: by 2002:a05:6808:6b8a:b0:4c1:9127:c0fb with SMTP id 5614622812f47-4d5ba3c38b4mr1883196b6e.36.1790141784089;
        Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:14 -0600
Subject: [PATCH v10 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-1-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0

