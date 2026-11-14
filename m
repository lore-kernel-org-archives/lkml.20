Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650318;
	b=TZ9mSXfpU5cSZJfcdsKnEVEK4kILDP8SfzASxTHEarq87t3C4oe0spO1McnGpVdESrXt
	 av+DegzTX1pHrNZoAN37QbqYATWBpGzIh3Vo6y5mbYvKD0fmZNVA3tQaVRMp1O0fFv9fa
	 7Ruq25KvUoBusLjfcE4aF2p1uhgfA2WoBjwg/BkaMiYES3kDRTWnZ9/XditskTvpSOZNx
	 D+m51Uh2dymBs+PqDUCx+vn263oh4VimAXg3GvaKZ84tEfENaRzEUuhTo7xDEi8+UR2MB
	 pJBhh3MagwqENnAONcnlqylwaLnVS85ec2WmEwuyf+7jFNDVEJrWj97aLuw0G+5dIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650318;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hBBQ2+0g/na1PrU4CqG64reMm8cYqX820KIGHRPLz90=;
	b=VdA6iWDdF6YcLRoiUq1SVfDkXnqLSsd90LX3i5cFmc0QxEV5ovhCKP2yvQ6yVCsN0CAZ
	 kvkwdQDb11mWQULNHVVWpQFOOw6GTLbizKuEcIS9PELd9xzWmQ2WSAjLQhqQprJlcA0e2
	 HoL6k6IA6R2cObhLAA8dtmqAicDCpyDssjfTWuJU24lEkUpbTCZqJ+K7Pds492apEvNSh
	 5ZTOESbirxXVHWtfJveq1chGkWf3UHrGw+YizpBIHJXvO0Lu3zbyABLhlE26bsYoADW+N
	 6I5RJX1KFm3lkVL7xaSfzPyljR5tEZe9MFzzdGW96VZgmdqKXqId7TqUnhKB7Fpyl5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=dSTtJG8m;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4BD606A334;
	Sat, 14 Nov 2026 09:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4BD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=dSTtJG8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650316; x=1794909516;
	bh=hBBQ2+0g/na1PrU4CqG64reMm8cYqX820KIGHRPLz90=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dSTtJG8mM3K1LOU/GVbjvIisj9R6dZK+OFOtb0aAEvBwV4fB2HUIlmUsFnPJURWey
	 MBe/uho+2kkntapbc8TVSILbZAOF4YHC3XDQGU5hxY0zjeUy6CVOiIqCC247fvDeXB
	 Lt2eRIk2GeH5WpnS/33dN38e3xITXTghZ+ChjtHCzJsL72vzokf2rC390EOfn3SLVL
	 xM2QAT9/IHvBq+JoWXW58pRxle8/u11DxAUHukKOl0rk9m556ahRqMo9/8PSv/+R8f
	 D5hNLylThr5jihK6uc2c+2SdSt/4sqEiHEEx18uVVxCY07vs7uN8JktgMl/h4ZqKdO
	 hD3xF4Nga2NBA==
Date: Sat, 14 Nov 2026 09:58:30 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261114095815.74012-2-lsa.uz@pm.me>
In-Reply-To: <20261114095815.74012-1-lsa.uz@pm.me>
References: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 669e70b9f8a6bcf48a1cbf6312826dfca03c9448
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v5: no change.
v4: no change; Krzysztof's Reviewed-by from v3. One file stays, as he
answered Benjamin on v3:
https://lore.kernel.org/all/20261110-normal-ingenious-kakapo-f8c479@quoll/
v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
with allOf below required for the if/then, as Krzysztof asked of Peter
Marshall's vd55g1 v2, whose 01/11 and 02/11 took this approach:
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


