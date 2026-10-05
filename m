Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B704E50C0
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232098; cv=none; b=iL1bB0FjcIgB15+81t4Fx2mRPYwkGx+NRw4ikTnlevPMXGZnkYXj2WLWqazn7OiZkmDwwlnPkykOrVLiZSVzk6Ca7H0zutkO6JcsMEi5y5Cr9ZfwdNca3X++x0Aw4q1D4XEb4smt6xuROuL8jTJ7NoNuMPXJGanQm2BceQmU1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232098; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDaLfm0dUWP8OzKycxZZV5xw/+N0EpzlFceCLsBIVktRM/AbFK/0VIXOXd2H0tu/q+is1rGFaNm+VldHMWbeUytcwNS7g160AwxowHlHN3gpwJhViaJzoN9ZkOs8+r7Bp8rQchcTz+7+oxo3Fe80zCtUtEyp3KbL4+ku/1qS0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm7sDQFC; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm7sDQFC"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so2935741a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232087; x=1791836887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=nm7sDQFCwhbhz2fmwEF6zqLMwKE7kqgonfae//3MFeljhPCOUM6HKwAP2xpgLLvVz1
         S7XzFbWE+yLEic7Zplg4DaMC/gmdN3OuRaQAlh61ChaemqP7hgOM5F23rqlfjIuexozP
         V7OFXvr3mKldNnJWGPCWbUW48kRKa2B835qmcgwYsAdZtQZNHxpbrm7zVXm+9jsKS8iN
         C8bS2DyK2l/a8YiYq5qHFkLGJyKVLBkkpynHj3DKhxHCLm0gfYRukptMWrmCMJprxwWe
         vBoFtx+GD696BPJybMj5TvAZCkA0QU/PO1neiUA50cg3UvOeEFacyyzsxShnhKWGTI2j
         xzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232087; x=1791836887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=MlRRnk/d6fe333g7MH7Pw4KkWh2slgcq4CdX33Rs74qd4dU/dw2X4W6Khh9CkTJC6g
         d5s2b+V+8VV+nmzpkM6Qwf1Ik4ZYN81g1GJUJdD5c3lzgfpF9/5wUfbHz/YMUdixOkNg
         VOyaZIN+0nhFc2yqEctgTU2L9kdKuug9R2lVf1Zk9uORhHXE22znYc5l40Zg74KWwHHA
         EZ9VnV9YJ6hvEc9mPB/lFZ24tOROkgLMtxKpJWQ58DW2cdUI5YfbZGMiIufMk+u0T2Cu
         +3nRIFphNXa1YdpKOzJybtMJTaq+1ho35mJMcwtMfkDaKF6FlIj3tPznLiFsfH2DhBx+
         lylw==
X-Forwarded-Encrypted: i=1; AKwUvBzVrPCju2mSJqRpntPfsVOMznZDMjpndp6SjTjM4h7M5R4eUyPQWTgTYiHC0+NC8ce2Knd589dVsPVsIV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqsAKDu6Q2HG9758wPvVbQxmtPklzyHBep4VepV/T6TV1uGVG/
	cIYGdYWl6LVc2gJGgKcwraGdp7/YxVSqDyXzqfR+Q6qmKKxAH4JY4GOh
X-Gm-Gg: AYBFou1gcHcDb73mB/wSAlo1XhP25uOucv3hmuv1pDkY1vD0ccQNNJZ3LJW2HZ3dQBQ
	c6OkQ7tUa7mw66waAqikoKkL++7BKTf6lajCWlkYs/N2E+jQOQHXGGxozjj+qQH8K9J2TyHH+dc
	D2Si7q9kc8b3UUmsuWB7AYuOZa1UjRr2XErIV+AEmTZJSeuraPM0wtom0wBLlwvK679s3xxqxf5
	GkhTy2GOJilmk6ZE8OeolYuhWVD8t9ZRQ8pGPZBtUCv1MbyiwgvOLLflaLUMn7m+ICVEmcpGZ2Y
	JkJG4L20Rz7Ap8r8OHFTIVUhQliGUlhSBUGx/RYr+RIqJdsH4P0AL5qJMjSpkAHcWwkOcRqF4HJ
	+elhiLBKGKlq+y2c8aM51NYd4gS4itVJLvwR8xxkmDnZAWvn7faa/wSZ1UPCoXz7BkYGrPBOirC
	fdMlVlWhOLA0QYHIw7ji1hWDONNvQX9YL1Y8Oak+cgXaJfE/TbxVBmi1YjAoAONebsTLMteVsoC
	j5N9VNb6ZETl0oPMGRBQGVpTv8cgPThCg==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id 4fb4d7f45d1cf-6af9e03ded3mr10580275a12.5.1791232087424;
        Mon, 05 Oct 2026 13:28:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:05 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:23 +0100
Message-ID: <20261005202731.153971-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

