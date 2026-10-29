Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283530;
	b=YjrN6pTePuwzupR5PPBTtS/ZnOuqy+ODiKiWNjCh787IOZ77pL2bsmp4IEBT9FCgezY4
	 aIoKRhvkmZsZSNfda0thVPtKlz814LIv1eGvPFzepb2gg1CThv1TjwMLUo0bKbYm6n8fn
	 xyekcd8W634VC74TPb5svg3HNCn3+4Gdow6L4sBJckVZctCvJ0pRDlYodaKRQrKBgYmzh
	 o8pg4DZlHdT4HvX5afffzCQvbgNEtwK0xPhEdZGc/PBb1VIRfgjxlIkgtLJf9dwHNM8JP
	 yR7QhwuWcZsSErMsB91y5LK2HdHIjACTwUAW6q69ZihEFVObBTFSmiBVxmMtfKB/+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=2Qpm+AbNKRolTLthdHV8b45zhuOfbuZ+3Jq+z0YM9w1xLoBC9jjrs4wtIRQirYsZCbnY
	 h6Dpg1MNjjnT8TZk1HvZcbK+++Cl9hbcB0xQz3nbEZlgZH6iJD3eXthWXsY0HmJpJznEj
	 5YbOSt07gBsx8L7PlWG9Pfm0CagUB8CBXyLLUWDNPfoIqjh1G7VypdLCiNpvOKbgGOBvY
	 vhVA0kH0EzRc/ECeYa+fsWaNtswHpfADzoORiu27KArWurl0GPwMlG3yyIHAiJDmAzo2A
	 /wVpHbNRbNavbZ0/h14Jy9BD5Me5yqvIznpxJNi9KsUwcZLNq8QAAeBR6QWA563J+fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD49460A5BC0
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD49460A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7494885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283528; x=1793888328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=LMzM6aTLoKd8Cru+xZpRaMXjmDhPnBRho+NfETPuWNz4M11boDRJCoeJ2fje8SG8Vk
         vwk2rDplqnrhRNENUapJJssuWVZUQLAqa2qyvw1iRwl1ISvrOPdDs6K0mP6eR201aTGo
         av0YFV2H1V81z/Ih5rXCN13dJuK1nymT2kMGfT+bLMj5GLvEM+A374z9HN68unNMxH4E
         dqWROmO5uI3lr1vF1CaUFrvse6zx3gZ+nqr/3hfKcPmb6UBmg1BcRt7LuRh4c3Tx31h8
         hGRqQV8rY3peSeeMwAnLZCU+lDkjqcKdfW9g6OLuDrXyYgjPsEm1K5LMsj2TjwIgJ6Wp
         sNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283528; x=1793888328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=qRr3gV2iQ1GdMBeej0W1PxjfDaichDxMDIsIZX+z4wADC6bUhKZ8kPg59vI58Fye7E
         bTkBt8jNb2RIlklWsxdwPIQiaLHiv9b7/1t9atOhSGO0PJQXqcU6FOJKsyKzSXE/OxK9
         LZO4a1k5ppDntwp9M2IBclAFmCBkOYpzT1evJUfVdyWhNYGPR6DKfoeVdlnrwmIKl/QX
         QquXuVVgcLML4vov7tWteUtCq6iTHUGpDeuJlJej6rucD2YnbZ7Gj36YzU+AGxSM+ZDO
         ganlDE8xIPSaij/P8m2G12f9y9PAQTU/38HYoKJiqpmA4rejcDWHMukMBJWXStWReBSV
         Dk0A==
X-Forwarded-Encrypted: i=1; AKwUvBzyAXfXmvXmAliAtQD67mCCTJImMp3lxsMoBn5Rt9Qi4Kbz3JTinJtZt7mojs2msevFtWZctlG+2q9C2Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXYU7E5qByfKRub+eOzrnGPWKebRdzAF5g+3UQYOgvIsV/psQE
	y52wZ+B3tp1+U7jgw6RkKcH1VMmI9RscCpkj80hO0+R9GozmfJgXn+zlgRGzMtAYWMM=
X-Gm-Gg: AYBFou3dk2FySCZ3OHjCzUX7gp1g0gb2tmn+Iet/xcn3d2gO84HiXv9C7FRQUTUIaVh
	7sNyvrupikrKHEZCLD+Rjg+uCWZ9WnR9osHOS0M14mfAXYbl8muxiGF5PATW4XfwxHHs/hKpmO8
	Cmk8WGf3v6BRtDJ/6As4zwzMCanuIEYaqgK1u6xwiN4UG1ItWLdadttrxuhPmoulG+iYsZIk71i
	RZDpnXB6FYIAVYmkRjWbqWXyttZmxL7oRK1wHxFzqU+k15g3WZCAnvUivXGf9j8N3/PhF+heX1G
	okgj9+wrnWUmQrnY7kImDxEyhFnzHkYD72g6cmc4/5BrUiesfbaVSFiAl8YVNUXhy2wP+HS3WoH
	HtpA4FoG91J9m+aegkqO9RAmcKpMt8kaRQXskqSi7b9PuJfiQCu48NnCvDHtszUGySWWmUSCdOR
	ZmBO0LRgXJOkbP0rs8SJtUY1AckWZJRfp2+WWUUnHbXUd1tQcyxnL4I7frqGLxxIIOTj1/cZ8Pf
	1ytO08dfqhCMKRF/E6dGlGg2MDF8CvvjM6TWZLo+OkgXGIWvZGOKfkgjhU7nPy28/o+dMYXv7S9
	mX49MpMFhajr0JOpaw/BIsF1kenrWiQezEgChVNIxbwlE1EWRc58sECfflOudqYuAXPWC+c1IQy
	IBFUj
X-Received: by 2002:a05:600c:e558:20b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4aa87d702f4mr44584355e9.14.1793283528130;
        Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:31 +0000
Subject: [PATCH v7 10/18] media: dt-bindings: sony,imx678: Add other
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
Message-Id: <20261029-media-starvis2-v7-10-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

