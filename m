Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695237;
	b=3v7BqlRM212PI+fd27taYiGGMoNMEo0ZYKXDYvet65jOZz8WD3L/7bAZlm377tC//Zxk
	 zq0V5+QJICrqWUh0JgCwYmlWlWvasHQctOZcXI4+6x64gH5h/p92XhKhn7ENHiTNAsAL5
	 k8iYy4QyWu6dRZQqzXaCUd0f+aHYuZnBwhOrSVrZ6bAyFFnOMYDSDuJneOxuL3s+hNI8/
	 Lizx9dDba+4wFSnDMdjFlbSr/1wooM/TZw9N9yZIWF1o1caGkwBlJ3clfy2hSWod5drW/
	 U6G08kaue+xjEgpg74cNgMZoYdO+8Pj6CJbEa8JYNHUrdDVd5ITJGeL3H19QXP0N+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=QhpiRu07h5b3Pfo8Y+yCN79l89g7MHql4r0lqVkuq9Bs4uxFKResTkElOzjGPXTtNL2H
	 tbVQewfzGk9fz5AkPUclSq8n0ScAFakJVqz20FbvlUgda9+2K9vbAWYZEeCTH59ntuaIg
	 VLC+JiQBhugdBMYTI6xG7LSBaaLdwGYgFDhm1mTELkjWs+LQycmf3bzCbuJe7ufDEB5ZZ
	 IVSM324W16CI6d3aVQhRMzEW2ea/oALeNwFbLmJU1JTwraaGCJu6FqpnSXGmV3aFlylcY
	 kySj4Eyqh1iymPf/UaN7+tanzMMJHO+hWE6zW7/o8SCGGD3lo1Uw3/PTt0sNRmES1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9691606A97E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9691606A97E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6f74f6b46abso2269339eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695235; x=1794300035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=gmRIarE9Q49e3N+eyYDYeIXbSWIUOWqXSi/WRTjOsafRsqRgrmitK+Katzb2O5y9uh
         pve7zQeiIP65hLlCihVpiyH7V80U8w4C73mL7cFjlA2pUEYKqCOGLlXlT00mDh/zaxfX
         tP+Usw2C3yV511it/eB6j08OlEGr3GNziSPj9TH9Zd4MhBUkmbkD3AeZVUYK/rotwd71
         vqXDz52/NBq+Jc0sHuMfLZs70hzrhSDd86ZtW8OXOMNpdsSx/kg+Plgq4L2jFrUDnQqA
         ZuqBxx0NO9hY8aEHuiweq3a4Gj693iYyPaNki0+Ft46GntbZmF7A+Il4V8znqbc+27Yb
         S2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695235; x=1794300035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=XSXJ00eSVCsRs3p8hVAznzU/TOvsQgXyDBrcDZEIDPkB8DW/MtDLfQyh0lZyRQSFRL
         PERFVlWj14/lpHiKHK+Gf/PiappON9UIghJnIqA5vNSEcaMWv8KidlIZuPGeyrWp7D9G
         6nmRcfsNdnzaekLYeFlV+vhtW+4X4qReSET7/PF5pG1WuFvN5L+fXewbn8yQGI/g+uFQ
         q7yb1DWeZafsMtMVFE+Qs/WzDbPE8Iu/zgJ5W5b+pppIMy5v/EWGWuh/nxOv5LCeqpc/
         SKz7WIYEmXudUiTQJdzPDSfXo0/oll1m5XA9beB0aRlZQuOia3q337PYQg/XhLov2A/H
         NarQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdKYUvXD4p3BxroGEfh0nfTj/UggQfTrlJQ13K9V1GQVJjFAhjRWjCHoOZ2bbZafxqZ1TL0tweFWpEm20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d8Rr+BPqnBgWi4DCOlO/HAxX1PfiZDesakw7p3DDIATqZlAHS
	Syjh4cs5hCmXYWbfrb9zzYbgY0WBqHc8mrQVpqr8tRF2cvW54xZkW/4W
X-Gm-Gg: AYBFou3vEmPvd32V2/cHm9GrCRsrKTQVH7sDBS61GgbRe5qfvxFPH8+enDKuA6dD8rP
	Pheu5QZRweA89NtfXwZFmPXcQ1qvSot8twq4drTeK3hClN8IpUs0PSMda2D85lJYzdQeRzhG8XZ
	jA2zNBUPvt5NG7xnRwydmxyCqcDYJ1xL0n7hWWqd3z6Bf5JLDwGiUVt/XGob6jLYzFOry0wDr6k
	ApDOtZdVZMQozeUk/d2ngmHmOF9DInj2eUEeyVr6u9Yl1IVHCCnidIDpTOGMu1KmeP0KmG3ndAb
	f7TJ+NDZh5FEEVlAvS0fJoto6eGVPnevOfZNKS3N9apNo0SJPaTIFP2UxN7l28yEJccp+kNLkXG
	rxncL1otE/S1KIzGBeCJjYKFqp+rOt3da4WPjnyPWVyQotJDM5dDU8duCHrpN2dUFWz4tCQGr8Q
	vyHfsrRqTd/4OFy6MfPE6VxwS9vV3D5zOkPKRJ0LZsOgvSQB6iPSaD5bAreTgBTn3P91P9NQXcD
	IVTJ4ifbPQvkPttKKPmZSMJj9FJf68EfQIP5rtk4kVrsv4GRLkbUn5iYra5w3VKodcG7vccpu0G
	iLL3ECwyO4J7ZUZ0HbIm8oku52OqKuKlscMSXsScwdZU/LwZtlw3JThyQMeMWaL0BYYC0eVJ/hG
	zMtvVhfJgytDIpcWOuauMLp/XlgclyHVta0P2AUxCbfapwau88H+MbbAzL2sRZWw6y4uvyrSrm1
	UcAfCNC5fKBg4SyNIPFZChkYprLYkdKFPVEzls36J9EYjgyGTJYs4=
X-Received: by 2002:a05:6820:a50f:10b0:6ff:3c41:8153 with SMTP id 006d021491bc7-714f299c8cfmr4772331eaf.54.1793695235466;
        Tue, 03 Nov 2026 00:40:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:26 -0700
Subject: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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

