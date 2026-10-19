Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DBA573F2E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420118; cv=none; b=VDUb2ES1kpD//c/1y1RWjOGVB/R1UIVPO6KWfFgP1cwAcarCCEHUmGeS9Ppajzcx2nnCDNEzDhwQ/q0jdOuNluTmgmLrWXe7Oke35PpXAIcE+MGRs5eL9+Ts/ClKQgoQztBYZgODccsdlx0+19dCJTvV4YROZ2TfkEMIJJmoL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420118; c=relaxed/simple;
	bh=LjEmyleO79NM8uWuMzakkcA0rXksukeE3zemrxG3uqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCxHMs5YXLu1Dh2/c/Oje8nPUxAbWgA3wKqqAPqy3TP5A+2RndpPN6WkPo63qVSRhmxE199kYWI7fA/WNjbyNpR32JJ1Xgm9pzKG3cxM0KZKUYf0V28s4JveH0lTTKd9oICXBThWiDvHRBq8jlIrXGlKR4dbDUYN8fbCjZWPkZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OAWKpFV5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OAWKpFV5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1858937f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420114; x=1793024914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=OAWKpFV5fC7ITiG9MvCp7m8hAUvR6iIf8XDBT6fTbnpv9nsuRp/3QHN+fCud85tnjL
         eWeZ9WOulfA1Ci9iIinYt3ISS4MbPBYUE5RMgyRdsudoLZrn/rPeYpktjycouz6cNQ6n
         lWAcjEl7OFHW3admBjuB6DxYuUDvlqV6RfrMGKFdPGlh0E1qLqZez6aJ32RM82IraQmV
         TfpGI+PSsHmbc8rHQ8ycMubd6F4wshjUE7Uei74ZoYMrHuY4J9zzuauYp25xz8LCFgFy
         KrVimdBoUKIOb3vixoZmwy+sTUrqPHTmkgcdx0T4+dn2a44eSyjggYRk1uIw0JFsPflZ
         idtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420114; x=1793024914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=DLZ/xZlI0xIUCMyq3kTI2d74+van8+o60TJ1Oc36qrj/NNiq4zUWzGbq2P+xUCRg7+
         uruPJ4CCcB4Ipu7xpBk8e5rbzx5lgs1niby8WijiwU3mSc1MflIWHbD/h3CTOkj5TmNw
         DUx8xdcvmNU8DuUAwC17EX27nGp/O7zsj0cR5UwS6g3QZKAWNObwZuHPyCjQi+S+mFco
         HAfGnpUXMqF4uggqZOOR1nB+h9TAS4kMoJpml2fBp9xAc1cY10yYuxem0ePlaIUeeyAy
         mazR224rNxxDCvaEi7AlpG5WvLCsb92P4SjGTw8m56JUKV9TnAppGzIBX5BQMy6e0HIE
         VyFA==
X-Forwarded-Encrypted: i=1; AKwUvBxzK+DxIJ3LtkFTcu6GMRNCN3eWPAuD3uxdcoxseesLCftZN43tcgDO3e3lnEUEwOKQJNspkY+8dDhfZxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6jbam0QgmqR3evZPD/DK0odz94oiI9kP9XCi8JPeV9RxsWLY7
	uYKtjr9RNXjWfbzBQiu9pnhnCnM9ZUo97eohO22Ws7M+58Q+ByXVaTxx8RpGViqgB8s=
X-Gm-Gg: AYBFou2yytaF+e8Es60TjxRleTs8wxeFaRRSpgZatRO7yFdvGmnPH1/cw3W98Pv9V0X
	cya18sGC1/4rZH5QiHNqNqVkg5DxMy2y9BdJGKCYDlSgjXBi4MddO2E8w68w/TsYIg1Msw/A+Eu
	vIUG7OkyJApMdfFdP8Z5BThK7pDLaeA06UOM1b/5Wr+MbyoYd75V0fZ8eFfC7CMvgTg4HPSfP3W
	qDTMTYvacY23bLzpvQeLaxoonGbmLnsOOOrbMNjalT4A+rr/r5nRtivkaJgcbiz1jge5a4KXTiz
	jNOOnaxSM5VOIAiY1iNc/HuOt+qfbEe8X3l24M7hjoKt1Ba8QINWzs8lSLH29xkdVO9v/ubD5Bz
	BlUja75Ot23UOtnM1Orwt2tn3rs+QfakT9WSiNqzSHxfYASTQYpL9ERV9HKzbWwhPA8VdwBX1ed
	i3fJCUcfJamGsQ/UgZidXOrZZMvKhEwXbfkbWJlQ3Ewb+CFT4kN/C5uwdudzc/7RiJJEVGO/uby
	ORqzZWhRMop2kOAMxb+f+Wsvl2FsBaCU4cMJT7g299Nhl+f5g==
X-Received: by 2002:a05:6000:c4c:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e07fb36a8mr11991206f8f.49.1792420114082;
        Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:17 +0100
Subject: [PATCH v5 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-10-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..027872a134f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
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

