Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690491;
	b=s1MVd0558ZEhrvdJVPIVrTIct8UQPyz4GG8gduztWcxN5Ul06saPwipKAlJIY0ZqNZuX
	 sXBDdMxFUDqqeSnUatara+LyDsRtdqXCcLMmABUYfhlsCK5wbqrMIGp/UKl5nzrj6ggA9
	 HJBNRZxJeIkUFgN6ST/sTeW4pSBm2kbrkFD+/5kPtx3PS7RLcPtHhE4MPQ94b0k5y2UDh
	 T9aj/+gYxilISy5mpuvZpvBk5c/POPjddIS42WNyAYc7PNo22Cudq7757flt9/kbe36Gd
	 zmqVSszQ+SBqsRbpBTAhhZiWEbOzS6ipyLwSjS/vT8/HbXSW4eFXGi5lRGuXWmLH3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=V33wyh9ti9cTDMlmRSu05zpmWygxBp6QF5X5WzZEi3iqCyzvBLYn5xmKJQIcKQgugcgV
	 FLess+5/QFvLpGhQ7VIi5Mz7MmwUg1InYLbIkkbNc2uEV1a+vmAZyUfqhbEIPO/qCRize
	 7XEhwyBPa5cZLh7WrLEfP1Xg/h7NiIiAs0ifop9zGfeds/JeN4a5hS5t8FZBu4uBn/rba
	 R3LpzNkiLb9WE3sdkmsoZtWxA4c5nnDfaK+IItOpO3dTb79TcjCH9B4DeT4yOE1xk7EMO
	 X2+xMpp23srS3PkrTyb6CJ/lSjhHcIG6RaUv+/Jh+VxJnzXILmujiuHaOszDJdbJ5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E460A2608
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18E460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso25049f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690478; x=1793295278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=sI4LJ6Qy6KS4Az06HsbqBPQPTZ9D3YzEPneAJpoUA0iIU5b/KZFk2B4UmBnfVKtDbT
         1mM9wrXIIbFzjQwUFRTINUd9I+DNl4tERFkhjJAAC8FT/IQALLB020FaiOlnmYdDtW/P
         9mL/0s/jsfzcWne8j0egSHgXLv+klEc2kK7hqYuvF/khOZtrc83J3wO6JsYYl4SuYGsY
         ZNBluYNppvHG2gl4Bq7h7m/oJGbSnWVBDXsM/NhHrbxSZ2rhpWNL+wv83wVYG2z1lFue
         RKfRkYzgkOJQn10QbuYCWdLQDliSLaxXndaPcwWg/81+XK3mJ/OcWLKlJXQKb+HrkvmE
         ayUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690478; x=1793295278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=eTLUKQWtqAJphi987kUjk+Nhq+AaHvQh0yQ7vwZ9h6DiubKEGrfbtwt0+p+CcSES5e
         pqjw5MEM5GOTGbmarzKc9yh8R+RPI7t4wbIl3wpUm6fNqTz7jrT35iCm/ubErjBRFlFr
         HAspE9YHRK6GM5po9qPGL8I3VZEP0yfvi2hzFwUcbRf6zHvkgbm43+2VrSj8q61JS4O9
         DJWxWh1ZYa4aBB9L62hA4GW4BXsnXGTsitRi/dqwNeTHLNbBfEphet3Mzs/WP2yb5gcm
         cV8kGqGl4fsSY/7z2bWeZN+uQnYEZe1iTU4rX2XSS14FEAIfxUdv4EkocfsvTiG69jYS
         knhg==
X-Forwarded-Encrypted: i=1; AKwUvBy0k/z+rElYi/GIEHkOzJD/OacYZazgAX+afxAVQq5n5RLdR9rGHckszjE2vzMZuxghlIu427FwIHr40jM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgundsILROwXFsRHB+t6T2d+RdjVqLMV5ca4oIL3Z9PUTcED/9
	xfHJKidE2uSBJoK0p+R8kw86E6J+279eipCoOkhLPPjuZuivruAFlFD0YlJ5p551sZo=
X-Gm-Gg: AYBFou2rSjncQYraUjq7U0+BNjw0KWorSPl+YSJj+cm6v6LtLrlWoxPDZtil2i9oURd
	6VZpLovGJXtH47WgPS9The/OyiFkzqXSxr8pW2XCKO5Lnt1Q6f0eNpDu29J2b8m+WPFN76GYdUL
	6pwtyOCXINZ/9tkh1lxMVyC98vlSbwAR9fsxbsdY493/m2/+AMtM6Mb8PlHslwFH1H7F/mBZVzi
	uv3LYSmtmnJI5TqEncmMP9Qe8FASLCDb9PES4B5GrBIrN/YNwuN2sk7A5lhV7T5ibPiHAPXm47T
	rSuvaYJbCBzweHR8AUGuvuhHS2hZN+x0+rln4gigsz+/ivSTgnTYEvN+eFIbpk0NF1GgdEFDNY6
	t3bheND5Q8lSS+fUFASZHxcSSpZ4KDQkWuPp169LHrKEGPC6maFy6BSNfNSiwOc+vRrjdjPDjyb
	CZSnwxZ9hLujIKhHbbnbdY7b3Me3Avqs/46702TxNvOFv7Orhi44nzkOZJw/13yQ+S4iqD/xeyc
	gOYpEzjGEF8VKoNJT3UMOomS5WN1FLYi6zMq+d9zf1DxVSAGD0KlQnITpCuqHCEzxRIozM5zGt9
	LruKIy3tvDfLj67Qt3PAVbBPWX+mMGA=
X-Received: by 2002:a5d:6e8b:0:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48e2650e290mr8989325f8f.50.1792690478409;
        Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:03 +0100
Subject: [PATCH v6 10/18] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
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
Message-Id: <20261022-media-starvis2-v6-10-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 44 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..0115f7b00d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,29 +5,59 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
 
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
-  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels,
+  and part of the Starvis 2 family of sensors. Other members of the Starvis 2
+  have the same hardware requirements, and therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx676-aamr
+              - sony,imx676-aacr
+          - const: sony,imx676
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

