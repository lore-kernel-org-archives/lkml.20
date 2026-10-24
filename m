Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873358;
	b=Dhy6MloC/5m6rFQgwg+0dwddn0ahFwmw+f6RYzUE0xAiiTnbEdQXdB78ehJ0YhP+dLRC
	 3wQIL0Z0n1TxSUSnSnkOmWOdVXb5sl6CUW8kUpbmiIQR4u2cH+Si/tvMQdmlbY/vi/+nq
	 twetWThplrw55CS8BvlJdHzgXwBs5z7nlsy1rjGrSmlF9jafd4WRzwJI2u58JT2tLNCqL
	 olMybZuRzJimROUVHFFg3Tcs6UwfsOAdfu4eTeksZgJFP0DjbfLxI9GqMesT6khIJueA9
	 mLJbnELqxW6vW4oz3Q/7OaZKNZqVFP+aTruvX1b/WnnS2ysGDom3bpAoFmGXjxw+PEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
	b=p/l30U8CY91G2ePuNgD2vv1n+hHK9zZ44XQHAvBUcU20X+AMFLsDuQq22NjLxAQ1edI4
	 HEwNFVOLAn2AGWskiGexTL/tN1xHl5d0Bwhx4M2zgtMYHRcvFfL/D1yHKIydCLcEVlUIa
	 0cDHmi1SErWWRsh2+E/XyK9HsYHyKZ48DLuHdcPZIXEEuvkVOUuSJosjP7sX/zPPjo7p0
	 WDYeZF7I+Cn2Qn5bvcxqk8tgjtRXBtbon8mRGrCOR8aKcRsJpsFaOun7bnzMNUhSiQbS4
	 QJk0Eexgu/w5Yp1G0VkAUcjJlNpW3fS3KEa59GQNxFY+oiSHlhlHKfcS4LSledfWonQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYinJJ9O;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0D60A2600
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B0D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYinJJ9O
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c5d8c7f326so779110b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873357; x=1793478157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=LYinJJ9OhXaxF8nzrRZaZGfcRFHV6ojEbInxF9zFDfV7aLGdG13HR3sTV8U37eCrCs
         9D/caXOr1rohavrMjioauA72Q2ZFYMAW71f+MQ3RS0xHmR6VgJ29k2E+lzMP6ZgyhMGk
         L1Jz1uR/DVBt+8D6GqKdxfy9Jiga30QFLM9Mm6FM5fg8Id0vt/YWh5xJRAee+UfUXqCB
         KDcCCYlckUHboX1NdISqh9E/cxZMA6CZlamQB9regu5+TY3Jci7HwPgWrdixLtsr0wmr
         9JLsb6anBOsihnmpOuFkivWHcc1Gm9enyuMR33YdWIy1YCP4JiIcD4xXWpAlK4SYsapG
         SjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873357; x=1793478157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=S8XSH8z00EjyLmmxQDGAjeAfxYKY5aMoaSW2Bd2ySC9wA1FXLQPgFAAkg9truPKNs6
         CyqCPC+Py2QLuelIe6WCXAtZWucqhJVh3vPemorY33Y2dW/mwyK9ADgiUSnH7WiKmTOr
         JQUaJwQONOL5mkZRC4VZL/wY+ykwfUXvlvGGoO+8qzT6im0LmKJzoVifjBvYtrs9jLrP
         IOlQFmQjH3Zh5AgZ6eyw6MvtQLuR80Mr0raRa2XZR2zQm/qrw/CcPX5DawgU6K7uDsxJ
         xvjsgs0yukeSTHPMSIXVL+ikuCV+MViAp2qDW+qRZHF6L+ZDa+ZiKzWINdXo2Bly3UgY
         SG/g==
X-Gm-Message-State: AFq9FYLNOTDAxYV0GaosSXp33F3dz6BuTFFO3uEKGE4QEL6F2VKKxyiB
	0R03BvYzMSMOcfhYQvy3JiddTaAZt63ePwf5uj5ORh0QwNZOupIXOlB5
X-Gm-Gg: AYBFou1KDUgJqxBi5YtRdc5flOl5P6pgVp+pwF/jkJM5iRtPHzm3HILf9nsx4Z9bc3D
	9sVY54aC6iZptG9EeqT865uKO3q5jzS2DFFE0LyhIz51anUbhmSKYsaZdFoSy/IWEnNzG6t6DPP
	brFS/IGqJP7nk0LAVddl4cdQs/iPJDDZ+AQz4Z1PMiiPW6BfFjMiTWEiZND+OKdR3Toh+hnB/j5
	12ehxqxV59ChVjPBxP/hZJ4sCvAyhzHHIevmmEXmpUkHg36OKJ1v0vv+IJNwcqUrmbWZarU6PUt
	vULuXzaH8GklBRWm+OUYBzdCkM63m/sHWNCBE7Y8cyO+J5oLjnwDaOGtgpUFGqHJSJoe6xJiBzr
	cn3MuYkBorJCCGpNiZp3tdg/B6Mz1etjG9f8eryDEPPAmzlZumxSIzX0pZc/HeC7wvNgCLWGSY2
	VTTpi1NpucLgLFRu6JEW2S2Fl4V6zNgKEANPgMjY/8/Y2V571K53X/Hcg/fMbouHdHmeNhGkBRj
	O2LT7uQnO7H7nG6yke1zOj7sxjhJFa9IQ7u78gadURp8eEe78Ipbpyj6y0lhe1UBN9W1Cdlm/4i
	VA9YM0k2B26G1FmKtxwEvNQEzfk/4lAEuqpiDU0DtkEEnSr8522ZGdpEd2NLmrXASg5lk9FX0OB
	MXu+BkblGC7IJjc3+s+HmowjF8CK0eqvyTI9coIdn2Qx1oDmXnAu78ifoxNRuo5cAgRkic7fOUl
	3zf8Nf
X-Received: by 2002:a05:6808:ec2:b0:53b:8f8f:ae87 with SMTP id 5614622812f47-55c003447bcmr1551104b6e.36.1792873356787;
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:24 -0600
Subject: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible for the integration and allow the standard
fifo-size property to describe the capacity. Require the documented
256-byte size for H616, retaining snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..0f8fd0485879 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -13,6 +13,18 @@ allOf:
   - $ref: serial.yaml#
   - $ref: rs485.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-uart
+    then:
+      properties:
+        fifo-size:
+          const: 256
+      required:
+        - fifo-size
+
   - if:
       properties:
         compatible:
@@ -60,6 +72,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
@@ -120,6 +133,10 @@ properties:
       - const: tx
       - const: rx
 
+  fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit and receive FIFO capacity in bytes.
+
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
       parameter. Define this if your UART does not implement the busy functionality.

-- 
2.53.0

