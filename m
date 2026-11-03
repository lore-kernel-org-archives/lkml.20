Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701977;
	b=eOG7F/F5yIyFpDLyonzK+h90o751B8t9IfEA0Z8MPSirqn46Kt6gH7aCxbtayr9Hma7j
	 o22GCSWIRjPc83WI4jbZYxTtIXiezxIuZFRZk8T/OWRBBYsqdgT8A+IIoUsfZ0h3juser
	 zQ/JchTCCjwPHG8Ld1RxiMJgbo+rd1H9lnXW1MbYGvPUPfMg+c9aDg+PKdKc9J314+qzN
	 U1odWV45qPAr8kGcFr2ENm6SgZ0pO4jpEtLHY9ufbU80KNXTNekF7RoCyMQgjABC1/Cta
	 YxtDwmcbNSHJBlfa0+X6W6/LyvD6ZUgeFlol+ZIqgsaSy4RbSTp8yJ5d1qkMCh7DCQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701977;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=x+3g/2mTyBRtfyMD++fMo+Sl/wDkNbI3U1BEdaNY8aw=;
	b=OxFbrZWKiZgJ9esdpdMDs7FhC0DEtXQokvxgd0SLoYM5Vgyq09CntKmidt/92uZIP22z
	 a3jL85pm0XLbAqtS+gH79e+fE4lbT05hCxqPL+3s/SlNxm42QTdbcUzZ0pIbh1A5E6Vwf
	 EI2+u4R7JFruRpNRgCiE4nLVmqyeTEcxDRVDrAtt1Ib2c+u9vx4dh2+tEMyg4K4jemqSP
	 +i6XyieEEOFomoj1I96wQN1avq7S34j2rSYEfvoQtCZtYzcqARptbOezq2YyVAx+LFfZ0
	 UzYQWFcsNRLETe+HPu4OJ0kSBgWx1aEfa9vHhKnaeMNFz6G5FHMHiXDeSplg99K8wvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=INbhnWRK;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D0606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055D0606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=INbhnWRK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793701974; x=1793961174;
	bh=x+3g/2mTyBRtfyMD++fMo+Sl/wDkNbI3U1BEdaNY8aw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=INbhnWRKGaTANqlclc4yMocKNvXRaTrblCW0SFw32HUjPzVim1Y564ubR8zNLoog/
	 B40HaSo5HWvYD1Y3suTS5LhUR+KQBsHR7xJSniUmao9I2D4x06YcWdt2oqHYvUVZaD
	 W5yXTQ0/HrgBcv2SB3426FggrMlvdwTGEvAQCdi9UVDnncwcQcs0vFiSQoe0JbO3MK
	 X/u4ARQhjoGogpal2mKlumoJAyw5MZWPLyFuRp7t1UWbqvzwsYWWdfkHyF+UahRUBm
	 oN1Po1ITNTHei2A3n3waYv34X2i0pPxCu2zhxiAjZzO+XUgNmKo0KQk/pMT7h7AlQZ
	 JpWNpZVIUysSw==
Date: Tue, 03 Nov 2026 10:32:51 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261103103235.94397-2-lsa.uz@pm.me>
In-Reply-To: <20261103103235.94397-1-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a299268a7b54c60b9b1496298ec22c4e134592fe
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The VD55G0 is a monochrome global shutter sensor with a 644x604 active
array, sending over a single MIPI CSI-2 lane, with the same supplies,
reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
its I2C address is set in its NVM rather than fixed.

allOf moves below required to carry the if/then for that minimum.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
with allOf below required for the if/then, as Krzysztof pointed to. It
is Peter Marshall's 01/11 and 02/11 of his vd55g1 v2 squashed, as
Krzysztof asked there, with the VD55G0's description added:
https://lore.kernel.org/all/20260918221705.323510-3-pm@petermarshall.ca/

 .../bindings/media/i2c/st,vd55g1.yaml         | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/D=
ocumentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index dfd87beba06..0245673d105 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -16,21 +16,23 @@ description: |-
  array size of 804H x 704V. It is programmable through I2C interface. The =
I2C
  address is fixed to 0x10.
=20
+ The VD55G0 is a monochrome global shutter image sensor with an active arr=
ay
+ size of 644H x 604V, programmable through I2C at an address set in its NV=
M.
+
  Image data is sent through MIPI CSI-2, which is configured as only 1 data
  lane. The sensor provides 4 GPIOS that can be used for external LED signa=
l
  (synchronized with sensor integration periods).
=20
-allOf:
-  - $ref: /schemas/media/video-interface-devices.yaml#
-
 properties:
   compatible:
     enum:
+      - st,vd55g0
       - st,vd55g1
       - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color o=
ne.
+      VD55G0, VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a
+      color one.
=20
   reg:
     maxItems: 1
@@ -101,6 +103,23 @@ required:
   - reset-gpios
   - port
=20
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,vd55g0
+    then:
+      properties:
+        port:
+          properties:
+            endpoint:
+              properties:
+                link-frequencies:
+                  items:
+                    minimum: 375000000
+
 unevaluatedProperties: false
=20
 examples:
--=20
2.54.0


