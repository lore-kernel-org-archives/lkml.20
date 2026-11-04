Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820311;
	b=c+gnUGKaZ9w/ME8zqzG019gLSh36vvmWflYm4Fq42XhN7lIJEe4HuypRyk5UuHKJHSID
	 NylEktiWdQGKZB/zfX/WIvJvS8Zpr4akPjqDkJwLbfH9CP23hxhBK2m4JQ+ICay95Qchk
	 GaW9CpSymQWfRpMgs8q8QPG032j0pJVMC2Qb1ewsnybP5LVfBaisuqSw+kAyeiWNdnVoO
	 +cEYZ76+bz0EQgzPsy1JX7QKcM1csw0rWx/wZfMVZIGIVSV0/YwrtiALBKMTG2FXqWugh
	 y5YzTPsgPDiNVT+vWQ0lLk+uNBPuMWS2ZYOTeJA6o/81Y+2zHwK/z+vmY1z6smXjIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=W3zHjiK2Zq2VRo6KxCN8cpEedzihHLKSOcvCbtnKXPtgWWt83ihmVqWtC/uSDigxa2Bk
	 VxXurZ3SdpgdRRQ778N6GKwwDHIhVrmL2ofEbYyn1+kx+r+S/Vm2Y6MJNTSf8RIZCU+BD
	 j2xyWqzkP21tQtlT9z3bxbQvvUV4qcw69Jy3QSCyHedXE8vMAVTc+ADiAVkQIVakH2Q/7
	 MnxaGBMSHmlzxcSULHbwdqvNnRSviS/2R/aqgvdPhAt8PnpqxE/8XYs8lE9UM+coAxFD6
	 QZwnDe0Mh5Wcuv+AaihawJzKlLrH/pvBTy/kex+FrmphU6xVQqetfhhMhxpisHbaPlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B26070F1D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593B26070F1D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-5058b105df7so428036b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820304; x=1794425104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=G3d0Ev0PzTKoH9/qkmm1xdyYMItYLtR9472uuxqYDGGE3DTSJDpNdW5KhoxyxluyOn
         bDJ4RdQtvjttKH/Jbe621LTmeAdFhbfq5FcDRI2p0aBcOl62R2c3QdLw0jIgQFq8BkYa
         Rw3733tFokoCWR1RpQc6qIPQix/VVjjpj2qYOOfwn24mnZ/6oHTcvUVoWxyp9r3HFDfM
         khvKJVKxfAdrC2gtj+aFX0JLL+N5mtIOaKAl6tOPQkT3XTwNru6mxU5tsDFZV4NGMFl3
         TIBDEUtPsj1WwMA8a8H21JNq9F1B/R8FDGAFaPj76P08+TiGta82bulTdIFbVzc2KRgs
         Rdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820304; x=1794425104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=XESu1ApICIEYRITslvyLBCJLLvh1XxsrsEx7wg+6BqMxdDF5v5q3fc348Q1fwkahkb
         1Cg4nteoVOvmuokfqCPq4J5EZuKZwaQM3Mp05hwqRiBnkvmj5PaUaQJke232sa9kLuvL
         0P2lf5v0hhkDWtFPGN0vCkcW0i4CKAl0R2PFwYqhCJXUSmEkqen62Zojo8kHA9ufacT1
         CPBGcWvWfUhKGhEWsYSw/uDffvi7hS5ChVrNYOTIJFhXafhFv6Yw0S6P9yLjiGSszWx6
         ol5SqkmoznT4u/62oxVncKvxBOF+uyBzQahYAQDfhGwz75fvJdq30l2ES9HgNMvtGwVl
         9ybQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8m5nVqduZXMocLaP4fgsKBnLzCh/PWtvMyZVW++j/qc2KLy6cp+wNC+Bw6NzOyBry1awnVyzxVfHGHH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fyJz5TcXgcPxY01qCamDpIbx75lQz8SFzOXVcDqYho65HmQKm
	XnULP1aSj+15D5UQjpkCMLEGGLyC79sNjOvjw70xysUBXRxpDTmfzpQruVGvbNx+
X-Gm-Gg: AYBFou1aBIDJW8yO+zqoZAYwcPLHnNqYOZgsR0uWDfdWRb/WFO27J2dvSSL9DCgGIMd
	fDamYmhOCzCS1+M2JndlVwvfTUZgspGshQJKLHbH5e1510ryd76yhGo55LyRLyYGxUFpsWLn4OU
	Nrcm/OtpjgkAGoDClQ5e0wDNfgvD+q4fIXQ3nkzd9TipG2+S1/V0tSFWbxbNFOxkfilt3CdOH1/
	/msqUciPdUjH4YeYJna1BEhL6UesZNQllEW+m2vbBSd7YXo1nPvT9wex5hRpzL2sfniMa+ndmsj
	pMYqPXR2gi2YlYpDmOH2Jg8SiLyutNQsguQaETAr8ykmWyfN/9SDTWnKZZvHYzQB5+8/x9ts6jn
	/MSO0LTdI4n91lVkx1HhfyO6mWbI7q/ZDXAiBV+d7FmVDfyeE1WBhzDohzSGFacffChGtUj1fPK
	2UjucwrLPbrXzXUdFbdrGxDWkIg6pJSv+oUWEp+ynm6Mte5HS+iJrBSUDU1io85pCekQ3XM5VOt
	rcCozO2EhKoSiDILZed3dC338TCWh3b4RIa5LKSeoGnkYligTlurW+xPQikVRJh195whyfbvcgI
	tGXTaLwr7XYMTXj+yv/uDQ/RsvzQrOG1/Q5gKIaod+7jv+7mBfikBEC5Dk4J7X2RZVh963bD4zr
	Z1Kbq9CSw7XtCQXMobK0aUjsiONcyP7wtS0gzhu4RTLSfnwldq/HwbUeHznY9ROuktAfNQzDOxJ
	Hph1/60nbCAu6GEW+eCRVwmTM8WL1qflPJwXLdES44NTYZuVtsdWyRoCBN+/TTt0TrSXRgUGsbb
	V4=
X-Received: by 2002:a05:6808:50a1:b0:539:596f:6623 with SMTP id 5614622812f47-5640de36536mr13164089b6e.64.1793820304255;
        Wed, 04 Nov 2026 11:25:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:51 -0700
Subject: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
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
Message-Id: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

