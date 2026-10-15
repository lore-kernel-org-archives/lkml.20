Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5093A5438
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079894; cv=none; b=WQQfPwvKODG5/FdtZHQdb4ErLFYY4CrZUl71J/NzEawZWHENJwbh4qKdFmcTSP+v1icrcMbU2Eh6CGIVI039Ku4uzfsfBUpfjXEPLdDJHVlRgNiaeGI3QBB0wZz8zZAWPgD6F+KSsTNrksXxBVuwEmYiDzSQqauFGMZhJdZu5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079894; c=relaxed/simple;
	bh=LjEmyleO79NM8uWuMzakkcA0rXksukeE3zemrxG3uqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Smkj6KHF6JMAhtpQICE0QIkpafrZh1vq2SWhll8R/BkPu9iMCLSQ5vxk9ZsEiZM5Pei48qfX38LjUzycQVcCyl69os6kp45O4ULYAiYXmZm/skCQGUKvB/2xJi/MU4G4ixEFhsp7v6MXqfQBn9HPImJdZIoAmimZvq4pT4lWuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pkcVtDC+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pkcVtDC+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20447735e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079867; x=1792684667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=pkcVtDC+zlLyKLFDN+7oZFTje66OTLEEbp4Jz6x0rGlBkq9JNwot1YV5bDpC9brdrR
         axKDRLaWG52IUTgf5ykcibxm5RplT8Gjb07iC57RFeQjjbitp1+VWovu/M076Xq89Gmm
         IQHtRiExi9/1LuyxXzN+UuXh3QdYRbumlvsoW6HqDa0WG0QMgMiQ04oV8vC4bFn2gWVr
         AAq5RIflIZXG9d3ZT7FbE+3yeErphhfFoYCZ+Vr2gvIQV1aK1tP552VcHLtJ5n4O46UJ
         6OiIitlJ7zxnV0Nie0GDOMD8qk1yYGtr+wO93NNjPeBHKzoWap+CpOF20FgQThDwtC7z
         wO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079867; x=1792684667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=lU0UY5lfFfQTAT6PVjyd4YIWC3EoE2vNqElnwpMy450G7lpQbcbWXrqBL4N20KeDjY
         DpdyEN5MSyI7ZfRaELg85DFYP+kW6g5vtFtKI5htDhgnX/Fs4mFWvPNg5PVbWE/cplZy
         GOsgh7Uptb85NtqJE2dP0+xkqS6a9NqEp/5JlBKFwYNYtWF8BNCShPvK9wMCO1ssni7U
         XBjq53/UAAh2pgAF+dhqWfy0KseB2roGcOK28mwM1kpHuS1WGP4AdF1fGkZyws8UAD1T
         tCktVcGNDmu8631N8oZzJQsqgnwonsGTPj4KgYMmLVy3+gM5zfo9uwfTu73MQ01sRBaG
         Wlsw==
X-Forwarded-Encrypted: i=1; AKwUvByyU8riQm0Nzjj0dQyGksGpwVibT1JPlsuVlH8Yejk5ldMVQjUDn1f4rr03A9UQnEsZHmUfseGU5E2pK9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLicDVI7x16Dx+ClGPHG84iydDgRv2wdcjQV3AMuyVhsGlDmwXr
	Falsv0qdZhSrdwi4WikP4ZYDd5TCJRvrMxuTLZdydW93WrsHxzkTzCrJTWYwBpIOiws=
X-Gm-Gg: AYBFou06ht//3LGX+LizWgyu95KdW/SuLvkZI/ci6dj0aKDDiy12t54KdoW7D7GRZjS
	aeX4JJmTbWSYasQYdM65cWbZ7FQDOsUH8sDm+EHNfvqwSHQqkde6SMCzeUWrqt3uMuxy6ZZMZPv
	WFtTNnsx8oJKpCGKJleBRLYfB+icZW/HBzVfmiOjUeCMF92zqfnW9BoDeL6Sw6KaerElkJDo9D1
	aTwrDW68DgeZOG74wnigp0fk7HtYYFn7Zi3XzEJ0fbaBoC39k+4l+YDAQWZJDIpg5sy6z3vU0P7
	Z+XFAV0e7qXRSE87kaxpIBSCEDMh5Ua+TnI5cG/C9LJKcZT6yU0FSQWp+SXoqA6IatUJjO/xImh
	mkiva+t4qY2y5/HrdB35JG9HF7mdqHJbEXlv+3+zDEJ7bqTTZA6nSO216rFd87DrCqlN/pFb6P5
	nT1JWOhEc0sy+9ek1FuOWHGR4W20dyhkr9OLMWg4fYqzu5q2audOT/hiJrqWBwd552jw6iW13sq
	DHhnop+y8QQQf0XUGaf3Pz2oGAsGnkyWElkJi3+N6QwqqU31w==
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr414276165e9.11.1792079867328;
        Thu, 15 Oct 2026 08:57:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:36 +0100
Subject: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

