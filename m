Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489032;
	b=w97OEsLP6wsmCaIxM7pIBK2mYpacDIOfmPjJlinoYTqbXTkSB2b9Aa4d+o+IF3fgGIDL
	 7mx78qq1X+6EjCBWFUrYBicBPwOnLEZbBsmcUXm76WvbRdG1yqB9ckB6MOV+TVCqM5paz
	 hkJz/2QZf6qb0j4U0UMptVoxcolRj78fFj8M6jVC3VlsRBKzLA20WwvxTstUQkBT396vF
	 dbuaDRqGLmGOQItzhW9vgePUAy9qTfsm7v7JmaxV4FJvioISGVcu1PAz8nWR5eCHiiidp
	 nr8k/KNfunfPPHInSH66bBAGyzuUpDciHNxkV1GDi99zwOl/YnQ6IQ+9IdeC0oUBxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
	b=c8iMuRbq18bdUrcJ/I1/hTMWT7HPTZ5ySRfoxrPuSBAeEQ8spSrLugx5wNXO1l+mr8pY
	 PbYOwUvBj/d6fzEDQA6AWJStgl7PpTtMo1ez6GXkti4cHTyf88klHo4GWLjUsgkfy1dUw
	 QpmWztXtSOvAgwC5ig+GTpaMJyC4k5PgW11ZSW0cDpFD+HOylGbqxGLfSiTZVoHG3QnK1
	 iUUzZXgoYh7Cnwn8rotiWDsx9ZVGJqVDH6XkIIHruWg82j1jwkKE3aISalz5qgnF1W4Fr
	 KdnFcYGh89T5VWaGxtdKH4A+KLYTbDuJq5zPcrtiNcbUsAuioWY98/Hck6mZmnw/8yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=LfG97JUD;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC61E60A262D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC61E60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=LfG97JUD
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c434376dbebso89789066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489030; x=1793093830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
        b=LfG97JUDdY0f5xn16pZkZ0zfGlB14my7j7PRX3fpaoFMYMUGLVmkTTabUGQe6+uuJF
         a7Jj061lJm7UkckA/KSvUewsSv8G1jdgD9Z0uw1Af6dWE09ixRIQPJOMM/t9y1ddsLOP
         9sBEOOdmaNyqZeqiSF9DaSic3o1LcLADe9HDrlMju/Q/3xHz7LGKq9HUXNAQ1aAfVFTh
         W+NPcsCLXzoLaQN3OcJ7YwKPCeJ8vqzOEU+vX7/6RlnRbukjcTTqrpy5vY6lMwH1wccf
         RAHEsze2gwkUhKv6dJHMkkBknioOC9EogPdW8y31iUaMFim3Gdvrq17TZKeSD8JQvT4K
         MB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489030; x=1793093830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26eHFzDuq75BKMwszFnGzYlGwf+oiqj/3YNi48CTJwY=;
        b=sb2DBhx3iPQkp3G/3r089VSllukKH0vemh0ovyBaRYjUKVhA4g1YvBvyAtrw2JM6qn
         q0Y8C7nVMXs29yws/zg4X7u0WcuU5FTa9ZunDUfuNKMnKLfrmBEeP+ZWOCwTMeQjZMuB
         C98oCbBj7IYCVosrdg6QQnaWQRKlRCGhXCZNrQ9XTb/6h2kfzBDd4psEEOOV3r6BOUK/
         Rsu3hy4Xg5IuzGoylGJ5tKX9mUmcFgJO5+yON6y1sFIbeawXwp3k/hgypi7+At8w2j0T
         v9+En4JYhkyZ6v/xw6TQ2aUcrsBMf6UkdIRNq2FoUe0lpQ/u2l3gjM8rLfHH8EVZ2PXt
         WJ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEX50TpDhIHx8SuKbCuJ6MWEpPtuJLiUIU++KrJkHrzZ8EtxhA0nuDa0ii+xRkyXEON0sBzS3RsunaupE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhdAYFzVj0N4Jvw+zp1V3sdRaC/R9LZv6NrPoJ9suADp95qr2B
	XKyWHU2Z/adl90szL10naJ2H37dTfhE4jS4KHDKR9FOdWN58IFdop5jigU/itn2ekzk=
X-Gm-Gg: AYBFou2r3dp78NoHPdCbfjxAeXRZoNBHxCYCRgYnHuSGOVLh1pFMJqrf5dW+hHs2Nuc
	OGDBc1K7ZUlwdp33Jms/KVPX11QUs+AR9IhDNPYdxvUBKGU+Z4/hSWi1y8WZnd5mNkYZR4E2ZXd
	0XBFk64TzBgkVZ3IJDHJWLaWDUbycITG7dH8pyaLzjYTJ+3UuPzcOGBAqC+/fi5casMAQ28DShq
	wmT5cF/xpJBpgoMMRFgPbWe/uw94bRDktlUWtLze7i00Mh2zqaeWR/DRLVf9C/w500tih6YBFqD
	syt4wVSNKM4pqjV8AndvO7xSgWujfSLRRrAMpxWjyE8OxZGM8n+A76wZIVgC0nROd48oNJ3TF97
	QJy44Wzc5LB87MBnbKu5jhE4G2/5Zf8aJSknQPdVG37qCBdI9badszet00C9srnM9yYEK/1/jP7
	MxEpIK+72ROpHPO0BvGlft7mM+n2tPKHhXdLB+bCCu3gc6xcpHsHepd2KXnNcIQmzthg2tZwpsZ
	PDaA4/udzh0rp1TOpILWiA0BUo3GLh9zeqRYnkIl//IJwVdgx+LTAuc8w4ZlqHRfzVGh49RZ/nI
	WBSGVgMYkggWBwoyvWQqo4ZHeF6UgzTKgu7E5iquKDaEDQTH54RAs0bT
X-Received: by 2002:a17:907:c081:b0:c43:bf29:1509 with SMTP id a640c23a62f3a-c4603c04e5fmr108178866b.12.1792489030235;
        Tue, 20 Oct 2026 02:37:10 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:09 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 4/5] dt-bindings: net: maxlinear: add MxL86211C lane mapping support
Date: Tue, 20 Oct 2026 11:35:37 +0200
Message-ID: <20261020093655.344585-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020093655.344585-1-robert.marko@sartura.hr>
References: <20261020093655.344585-1-robert.marko@sartura.hr>
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

Describe the optional board-level mapping from physical TPI lanes to the
MxL86211C analog front ends (ASPs). This allows DTS to describe wiring
that differs from the hardware reset mapping.

Select nodes using the new property so invalid uses are checked even
without the MxL86211C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Select nodes using the lane-map property so misuse is validated.
- Restrict the property through the negated compatible condition.

Changes in v2:
- Define the lane-map property at the top level for type checking.
- Describe ASPs as analog front ends.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 53f430e121510..7b6140baf1757 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -20,6 +20,8 @@ select:
         - compatible
     - required:
         - maxlinear,use-broken-interrupts
+    - required:
+        - maxlinear,lane-asp-map
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -34,6 +36,7 @@ allOf:
     then:
       properties:
         vddp-supply: false
+        maxlinear,lane-asp-map: false
 
 properties:
   vddp-supply:
@@ -41,6 +44,21 @@ properties:
       Optional regulator supplying the VDDP pin. Its voltage configures the
       MDIO, MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
 
+  maxlinear,lane-asp-map:
+    description: |
+      Mapping of physical TPI lanes A through D to analog front ends (ASPs)
+      A through D. The array index identifies the physical TPI lane, while
+      its value identifies the analog front end, encoded as 0 through 3.
+      Each analog front end must be mapped exactly once. Omit the property to
+      retain the hardware reset mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    uniqueItems: true
+    items:
+      minimum: 0
+      maximum: 3
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -90,6 +108,9 @@ examples:
             reg = <0>;
             vddp-supply = <&vddp>;
 
+            /* Swap physical TPI lanes C and D. */
+            maxlinear,lane-asp-map = <0 1 3 2>;
+
         };
     };
 
-- 
2.56.0

