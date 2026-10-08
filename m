Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2D4F4D12
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488430; cv=none; b=f96zyNu10/KE3RJvfSNUFBQbGHuBN06DkAH3utz6OkH/rHmogvj8SIh6cph2HO0398XmaCtaLJrDmaOy9UaQuS+HYElIph2tMFtuPYbw6h08HRvFycR5eOUPDucS574k62NMcPZpNuE0TE7E8hN8LWKaH6O80m+8J8yMKBO1YYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488430; c=relaxed/simple;
	bh=louYATGthOtYvcZekgYD8gJCu1Mw18vnkIVWgcBPVp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbuQGUzZ1IceauZoSAsmc07OXWhLAPwCqU4bIlse80zEKbtKOcSqHNSNhMCoS7yWW++iUzKKVxTzGTv923CCc50kukp8AeUtziIV31VNtHvrQlV67jKoHTnyNvenaTK0ZlQHcNiMe8PDVTD/gdP4+AkihG8KyWXW41XkIpINnn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvcpFw7P; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvcpFw7P"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ff680331aso62242205e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488424; x=1792093224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=dvcpFw7PCXfcFXqjfhi0ibDez9viIX4betznDOMv+kngZUjJigAJhrLzHkInthkAMP
         ocI/v+yWhumN/ASabbXyqL8YfPaIO8THos9LIU4huXFV/O44Ov5AO4F3JNBVOUmnJ+43
         ftF6n5ADJFklL9iBSovS23OZ91MsYmFPkBlqrbf+wvyw7OyiJKzh9svw/CiwRRm/4VeD
         D9K8dk+wK77/PNlPdj7BfTkBJScaDHulJmyhxkaxXB4ZVgiQnLHvI8IhaQiEHTUudMca
         WvvIRcU2ELMG7QdN1ryofZG6umNsdAtpuouxPBqStRakdRz13UwNN+LOxkqdxJ7ih9/J
         JCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488424; x=1792093224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=2jTSaxQ3dTFTp+6Uf2OASR2NG5tRV258xxo+HGw8yOabKMzGlaBPhnOLG2CtBBAqRx
         bJldMmFOrxbXyM5suVv8WHrEWDukwN0Kd4cedX2eP/v85tO5jcR35UBXWgGkUjrZZVkP
         tVSfkxxiMxR+e8JPgNAhjElAWm7LDLXYKxQIkRVLX8Lg6fQfVATMiCPEHhuBuGUeoUjl
         mRxU19nBw/xzq5rla/REGzkvwInc9Zx1aIAr6jCLrPTefXH5tkD4JGnVvd3Fm/PEzO/P
         tDL7jnsuOabICbY2zCi6n4KSSsesIufj8zOashdxc+MOCdzHDZupzOVFDKqxI+71ErSp
         AO3Q==
X-Forwarded-Encrypted: i=1; AKwUvBywD/uRsO+7w5IsnSDsWElQZFLRsUwmNX+UGHr0LqPwmWN7C/DOLRqbPzYcemPfOHo/2KxnfgIPCu0ZPww=@vger.kernel.org
X-Gm-Message-State: AFuF++kvZ0m1YTTDXaTlbmfX7ilbayodcsBPAfG9NcF9ku6hLTDz+Jb6
	8b3cQgbittNeextH6mT+YgxqjOSPHtnwh8gLw7kRNaKAYYOYJos1jquS
X-Gm-Gg: AYBFou0t0+ay99rtQ57qeHNqQZ2nLF50Kb6x6dC94urjMLwYqOxPjVQOGjjXoyV9Prq
	dIY9SHaDD3dnKIi6EaACzDRjdEecAYnORqee9D7t1EaCAE7T5hFzvYxso4KODRZxy5DxC5U1h0C
	ld8KCN+gmvfG9wBX265TVdqBm2xX/BLia0HEYmkKFGz4PpzzRvgt0e/HqTwhG1rODeYroKGMGBX
	wHbVeqQHIKrFqVuTKwsYOyuA0DlXTICCeehgVFWv031giHRNItKnYeq6m548gKMymB9tlD8GxaL
	wH4q1e1KFjV3/EuqfzRQJbfZYl82r5Od3V/PHpFC45LTKlh2iv0aOxUWPxqjDLTq+qAhDgdcEcr
	UDy0wkT/PLDAGTsPfS16VmM0PZIiy+n2j/GGesFH1YQW6xtXpMN04MgFQynbk16Vwe6ocgP9gTF
	7zuYEoz05SDg1MwX4g3oc6jWuGXSB1quH+tjYglKZtrcIhOSknquBmOhWARLjVOzl16mrferCtj
	yyGeAHy9q0ZSc2lqUMKPOZXy1TzzicsXZjyztoSs9U8c7Ao+iV9CF9zhWN6wLc6xMJRJ5K7OWR+
	Ns/jB5ZWZXBftMxx0uwsPg==
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr110758385e9.24.1791488423759;
        Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Thu,  8 Oct 2026 21:37:45 +0200
Message-ID: <759d62ee229f0cbb83a51cacbb70ed7dacf4ea3b.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The binding describes micrel,rmii-reference-clock-select-25-mhz as a
boolean. dt-schema requires properties ending in -mhz to contain an
unsigned integer value. A bare property therefore produces a
property-units.yaml type warning.

Describe 25 MHz selection as <1> and keep the property restricted to
KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
reference clock select bit. The driver checks only for the property
presence, so this does not change runtime behavior.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Rob Herring's Acked-by; no binding changes.

 .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 6fa568057b92..a1f876dc00de 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -63,6 +63,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  micrel,rmii-reference-clock-select-25-mhz:
+    enum: [ 1 ]
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode.
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
 allOf:
   - $ref: ethernet-phy.yaml#
   - if:
@@ -90,6 +98,18 @@ allOf:
     then:
       properties:
         micrel,led-mode: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ethernet-phy-id0022.1555
+                - ethernet-phy-id0022.1556
+                - ethernet-phy-id0022.1560
+    then:
+      properties:
+        micrel,rmii-reference-clock-select-25-mhz: false
   - if:
       properties:
         compatible:
@@ -105,13 +125,6 @@ allOf:
           description:
             The RMII reference input clock. Used to determine the XI input
             clock.
-        micrel,rmii-reference-clock-select-25-mhz:
-          type: boolean
-          description: |
-            RMII Reference Clock Select bit selects 25 MHz mode
-
-            Setting the RMII Reference Clock Select bit enables 25 MHz rather
-            than 50 MHz clock mode.
 
 dependentRequired:
   micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
-- 
2.47.3

