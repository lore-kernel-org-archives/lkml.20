Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B656852D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000481; cv=none; b=NaL6Il8SQQ5NXlZ8bW2C1dyCitS2N9QeyW81NDgw2S3DYoyPYYWf8/ckb/hM4gYEJi0gpnvh4Csa7iw4TH+kCpKyI4X55MD4EUA7vuXByglhi9xpc4lQnU/qMWqnePq2b01j2FkEA5turpOZ1h0d9fFAEubT0P/ncv2JIqc3YJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000481; c=relaxed/simple;
	bh=BaIz/EHiRPouZhcJJAmfGVCWwp024Upe+xsltSwGH9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC9M9A5UY3Ld/X+9NXbhVoDQXGVX/tfl77s9mLcM2+jFKdp8WKfZBD8BTuH2HbQHw2uDSw1XJBDkLihkm1o6o6WddFb0ZNfzAEt/w25ulPzx872e+O32uCJ6ky+CwEneyigAym34+iVh8y0Suagieno/c/rK9e9vtgfZxXLAv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dJm446yg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dJm446yg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so38216875e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000477; x=1792605277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=dJm446ygtben/2jGmAf23myOtYl3eYII2fmgQjj08ibaDbSg6ciUnyRsWG3PUYPs9E
         EiJRXqruhtOuV/lBigdplUO4Z4WlXvYKxiIK9qrrPvW37jrxwgHMzy5tBIMRRjxBCOuR
         rMZSE7kYyYoTXkg2msw+wFrfyorbEg5FxhhliaI5OgJ31Uh+gsqN0qgo8qQWSbsRGzQ9
         I+3Q33s4HVbkpFmu5gMxqcrlkbl7RjSEPqZ8W1IyLMs2s7s13+duhPNbhCAwtKZbE640
         C49ndZ9gwfUHg7FO3tfKwCQjpvXPoVQR2uu7GUFPykXNap1mDkb42AUateU/4InSOoZj
         a4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000477; x=1792605277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=Y+Bu1LOgzb18D8g/dJnEO9bUMfaxwSuvWhdNCbbv7zwnJxmXHIxg8QbFcx3NmiiWlp
         X8wmmXKcC80I77Hk+a6kHcOvStsReVirLD4/39rTcFVKFyLYtYYK2vwdDJWQx+nLbjAZ
         Ex2cz+f29Y/iAjUC43r84BWix4uHg+HsoDmZhLAs0xkTxpkE9006JyNFe/L3ltyVlSXE
         tdiaoxTmj3kJVhkR3NhYFlRvS4DYs/4cW0uEslLo02bTX/oMxJlS7Ov3/srCUiQ7ECdD
         wvf/MEMgRKT6CNMZbBMhxScfC9esXIlOdA6AIF42AZMMUMSqzHj25CyuOMnZWR1r61e7
         c2KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK++nps8vnWhohfTiGVZZP97fEFySYmfPwXMd+i6jFEK/HOSFIT+wQXPbiFHIpigjnYsbpYrBApmfk8Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+0nzM+JEIqt5XfZktpFtifTaP5CF0WlQ7QaJ2zaOa85Qd9c4i
	J5pHDxWtb6CLGVirAFhQvIKAyEiWWR8UkmGmB0qQ1aPv+2EnSvdgESUhJT5dcmdVOb8=
X-Gm-Gg: AYBFou26F4rHtg8WkaCS216D7P/lIyZuWZAGTFvfK4TD6RcdDy06pbIR9jdtCVC/Orv
	/Tw3fX4/QGds1SGgphfYR3DW7EwayuEytHfGBwhY7pn3wMGEqQqSeruah6ciqK64h2ybPUJt8RQ
	mV+Uln/l9i3AHwpiSiVfafvjEjGfnrDNGU0ZNlp7OkiVdiRyDX4syo+EHq5RhEFjEdTk8TrZU3r
	dFvwerIh+PgoEeYjk7ywf5xufvX1nLKsurxuAHdp+5Usm3/nc+w/xmpnc6EhEw54Hs5J1lolHRT
	UFdy223hz0usylYnlF5rsUFrqk0sbkFjYhHmWaSXygpVDIFTv+7pBrnEminkjJPmqKxA8RlrLy+
	GzDJaarqG1O+Mqw5tfsTTjF1jlt3zu3+2H2t+VnzmvkmYMgUN99F1qdoCpj2NAAYPWOY4wQn1zO
	FevazF2wDC0yU5uXBXL4D3yxWiUeNKonSTcrRYMC/pLgwX2+Gmh0DbkbNAMUOBm4E0E5KAJpF7d
	CnbzzezeX+mI3WmDxRBWEcpd/hWiZCi3nIkqP7+17pstmyydQ==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr349037365e9.16.1792000477357;
        Wed, 14 Oct 2026 10:54:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:29 +0100
Subject: [PATCH v3 08/14] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-8-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

