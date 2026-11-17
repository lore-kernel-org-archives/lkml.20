Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895566;
	b=CcUNvRPQqJM6+WWw59mjFEslEJeKnwCQUV14aYtYIxZuxTRn0RgpG1SX0bipIli6FMyr
	 NmBWesEmEvQzTJ/HXS3GLml8zWuzAZn2663koyKqmdgvGZaTB3wRp8aClas4EAW5Ignhh
	 Rbu1cO2ozPUTEOQhwhXvGGsFE9dxb7adc/mjm9oXdq3pvZ5T/LCiKVYGpm0hstn1Jmow2
	 FE03Cp9REDMVtdsXGQ4DoFXLepvSNtTAWqXxKy5JWmbTuuDFv1T5a0Ryvu5nJLb+GURbG
	 JdRBgGp8+oHNGJmMO74E01zkv9LDwbRgtW5ly/LFLrRPPebzwZQ1QkH/drXd2IQJ35w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
	b=gik4+ZONbgmES10LE+wTp9zY9Frs68gUN2KLLdgvuBBPBS6FLDyuzCoc+YvOhm42SV5g
	 IH6m+no1Vt5bR+Y7iTEmeyp8fw3W0eL04N9HX4t4LAz6Lp/DCRHPfLFcap+5kTM1kO6Lj
	 pqBkz8SDGunlYpWDN4fxvAY4AoGweTVREICbkau1ng4yy1n5rCnJ/Y/v5u8GzcU5e5XWD
	 GZSXUPlW4wUMzMWLD2xG5B7jpNr99kif/JBbI4oyj3llN3CF5uwFnk1qX3sXkQfDpfaXe
	 Uj3tCK7q7MVWUduyx+wTlxN+169sAc35fdCMyfBk3FHvYJTimriddsmaIBpqHYV41/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tWi7/q6v";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWi7/q6v
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so3627166b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895565; x=1795500365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=tWi7/q6vl+7+X0c8AHeIlPtB1P3zi9lys0vDqtm9cI0df1oFwj0GGruQmuxMfwEKiP
         Xvq26YKyWHF3hcJy0fdM2hrqpYAtw2jBCV/+R/03nHhKia8DmFmUExRQTkCcNIlt36f0
         tI1Dbny3jBaV/TPAa+EbI3wAFvTMVwiDOekDX38XhGHGuzkqD0/gBiK40ack13/ItbA0
         /0E19o6ShnYSdNojBqucpQEnp1QKszf6c899p7rLSCSqyuSo5Q34M7iCc7lrZsD/pcop
         maoUBTLffKO95rskK6Jn7FMhYvVuh/4oMUe5mmN83E5da2u34m9NRrSMZT4vmXJIhKKA
         QaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895565; x=1795500365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fn/7Nz6sEtWAi655Kzihh8bKMNCzwwsZZnavj9Q/a3U=;
        b=RWkJD/DVnn+f3a8qxmByE/Q/TRT7rZ+wthuIIrLpm1AY43PljQuqtj8VLrOF1v/dJG
         LYEKQuh92bpLGGUmMFiaSBuCKSgUcgoG24Uy3IcHDM7d4/VyLV1Z+XjF2RYO7JdHFec6
         egWawFjUV4Xo76Oz5UQvZYdACGeWN51qC7q8stWD4XcGBxIcGrwz6S3nNr6h/YkW4CIZ
         prDLMt2uEfsi0gSTssDB/XPZxS800mR60iuOTnNKfK06xtzVydv1QEQq0DUsfnQwRmbh
         wiuhdxQemNH0ys3Asxrxaua/GFJzCx1WWYrNW188xuCB5FvJqijC1y3awMBXYInFnIs3
         GEBQ==
X-Forwarded-Encrypted: i=1; AL+hErEAWmMqYTZ03MyfYapDN0CvFZy3FUXDK2Eif5xP7ePimO9N1tbbYdevkhZxygs8QqezLjqzMXhg6ctaAyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UBOr5DB6ScpVMyDS+KbQWxTJwJeqhOpywqaxwQE/6hM7Ubn8W
	gFP/C83GgO2kGXCEAbO9MTkqvKwcTe6hEpSqFUQOrKLeKp+gWAzK3ZU4
X-Gm-Gg: AYBFou3FmaurqoCAEjORK6+uOL7njE1z7X1QlZ7d1VQ7IwK2J2tO/sdjbPRgbAmPNK/
	zLgnPqelllMo8GeUZBKAqu1OFFmu0ye1C/t4pDI15PW3bHFlgEqp5o98wNiIUOlnZWJRp5/wA0d
	yZkEB2fv+5gn1a1pmKBCu+filpAFYnwzlme7eUb3yArWIUdRuG5xSs97a0Jcu4vSf4Kz+cHILiO
	HVbE9SMnm9zW5iAT2l4wKzcElUbBGsa9LvxG4l0OcIipnLEWQI+T0N5LFG56suzHxFP/KEa0J0R
	WGXyqsfYMjWuTR2Cflwwd8bOXrDGLbMtFHL/nSWjR8qClXhj6L3xB55YqezAwO/YAzJpEAbL76K
	3Od488viovsGL+cHBrGvIA90ra8iLqIcaE5bSwZnzMtQHlq9qK1K1arq0WIhlJ+ol8gXfVrqS+I
	+RTsVCmlrnZgJIBmh+cWyIgSyt8wTto0YdavdkB2KzzCoFW0q8NdCd7aPDrqNR4lo56jBIyO7Bm
	Y7YHdhIn2sbkYvkof6qIwBfLRPp/gP/Iv94Vgyfrv6aYuCZgfi5I1WcvbRnssdb/nW1XtOAndAQ
	Ga1qSWAZxivC3xVd22hhoGW9fth4dYNFMj3I24g0kWkth1p9Xk7LSx+8ZvD/RRiHGf1aLY/ewLq
	YJtJ+eGI1s4I=
X-Received: by 2002:a05:6a00:1990:b0:8b5:efad:d088 with SMTP id d2e1a72fcca58-8beb609d4bbmr11260989b3a.9.1794895564913;
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:04 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
Date: Tue, 17 Nov 2026 14:04:58 +0800
Message-Id: <20261117060501.2611071-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The system management (SYS) block of the MA35D1 SoC also hosts the
on-chip temperature sensor. The sensor is controlled through a single
SYS register and has no resources of its own.

Allow the SYS node to act as a thermal sensor provider instead of
adding a child node that would only exist to instantiate a driver.

Reference the common thermal-sensor schema and update the title to
reflect that the node describes the whole SYS block. This makes
#thermal-sensor-cells a required property, which is fine as the sensor
is always present in the SoC and no driver depends on the property.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 3ce7dcecd87a..a0cb0f98c1b1 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Nuvoton MA35D1 Reset Controller
+title: Nuvoton MA35D1 System Management (SYS) Block
 
 maintainers:
   - Chi-Fang Li <cfli0@nuvoton.com>
@@ -12,7 +12,10 @@ maintainers:
 
 description:
   The system reset controller can be used to reset various peripheral
-  controllers in MA35D1 SoC.
+  controllers in MA35D1 SoC. It also hosts the on-chip temperature sensor.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -26,12 +29,15 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#thermal-sensor-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#reset-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # system reset controller node:
@@ -41,6 +47,7 @@ examples:
         compatible = "nuvoton,ma35d1-reset", "syscon";
         reg = <0x40460000 0x200>;
         #reset-cells = <1>;
+        #thermal-sensor-cells = <0>;
     };
 ...
 
-- 
2.34.1

