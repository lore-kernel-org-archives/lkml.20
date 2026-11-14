Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645519;
	b=aa4wYzY4Vgv4IAkI7Tbeq11qZggYefOdV5DBRiW5eCojm6PTiM5g/TxraDqT5d49VzMm
	 yv9/EmFj7VjcresVA1VXzdkr/08UQGxHrGSM9WlpcSW1gVpbjsXMrDoG6Rf0D4jNBwBIJ
	 dQzvYCA5IJB6fhjnMZVESgRHfKFdf05YYEY8TQl2fqxnkCmGZldwQ/2i/boieVOQgU6fn
	 g5tpfpQe9aZLn5Shg2plY2EuZIW1JyPZE4KMPo79+DLPXOcP2B5dRHwQcV5CMl8yN071/
	 U9AHO9UOq4zAqcOMKQucXUGxOlX4YlDoRFSSpl35OJk7+Tcs8zzxYhcgpn84WSndLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
	b=Kxz/uxbmHZL/bTWAAxeVNkHgmgsOJmiCzaUXBPhzCPVRwtqQLAJMsIu8/N7b1W1LxMtG
	 eabNFLhAJmrk4AOA2AhU32RUer20DAaDR8RLD+thizAFdy/V/I/zk09H/dBcVfDFiB3Tg
	 x/OtFQRjrZYyehnLrNWGnJFSz8ZAB9E8cZP6BGcXefMM8YfrbBIRKvDfbXiwqDRCuck/R
	 WRPRqkLwmkfPtP1wrW07se4JOEsETwmGMdeq5leGsbEe1Gystkf3f1e7yklcgGl+drmdJ
	 +6wCKr5PGXqCw+VXi/5bSbLR/CDZwlJlvhudeP7gqairj/cxThdOnrsp30ouWI4IdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0Mb++yI;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD8606A89E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BD8606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0Mb++yI
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adff684a52so22905421fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645517; x=1795250317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
        b=t0Mb++yIbpunMuxHHwKZuirS6kHgEIlj7XoC7EmEihDJtgIj3Cwk0gKAO0305MGXd0
         3x9PYJr/2WJaI9StZ+dQCTjk2p4jiHiIeqgQTk4fJ+hofbbc05trklIFVtT1OxHXg2XI
         0rOiEvHMjiOs39KnOMCkVnXpKveQgC3j3e+eX1JYHZMAyGiJ7NEa4p2Q7ZK2QCH26w7F
         MuGf0LMQ7sun8vH0IRFRrUBUvHvrTNgqKhkWKtd3+t8rn3n6g782HAAhCOUvS6Hjzwyi
         D99bK9fHfdNZ5mSEyRLhMpESKW2A2+gOb1Di6Y1cQMdqIqyJHuQFV+Uqz8IKAjb3BKNQ
         L2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645517; x=1795250317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
        b=CkMSMXGdQeESYxmhr+0t92p/LSCDYzRAKOQfKut+rZhR6TRts2aYoNdMMBwdMUsEu3
         k5Wj6lW7CYjii6IXiwUxIc6PUK0ccHkkgjBXf3Psa4P364mK46AUy1q7HLlxLnqi0Hlv
         PdgHRdSinEmulpKIBZvVt4kj7p9trPEZydztB1C/SxP3HxtYiufeAUmsqP3hyfEigyNr
         fWX9953Udwd6fN4c/pS7YD5Ms4p7bIWbZ/OHDyOzlTCIv0v0E5mNFYLFoJ5qZsjjpM3W
         WNWS63hxxKoAyL2N+40Pifa8VRK8OrZ+4VOcSN6//pCAKtSi0aTTfQ9FKq8BYa6rtsBQ
         OI9A==
X-Forwarded-Encrypted: i=1; AL+hErFyf8c860X1c+qiYR9sCoPiwfgwKh1BFfMkKMnxnO3rCZJ4kKcXzHNaG8jFPy23cfWcO7gU9mfUEjM1KqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z877et4XSp4H5TStWJLyFu2CIK71zmfJfhcSlBM/P8tC5RIhRv1
	e9rYKJt5Ld/TY021wx/41Hjn9gdf9ud0ypaZZs08UZYaciqKxrUaSsJl
X-Gm-Gg: AYBFou3sUYmvlwZ/XcYy67i+wsSjLvPb22gm3lXf+l3xdQyjZ94iqePnfxrMEMhIDHj
	oL8w06S45ryC4G4w9IxbTkLOHd2M23E8+6bkqo4VjvcD2MHzarFV2My7UX1/MX7NDLU2ThlljmA
	fZlprDVimpJexe5Ym6AaJHs6wMQplmLplOQibMeDLu5p/KLnGwnW5U0Z8Ejltj0ECOLGcqIYdhE
	834nQneClm6ClVBQ0EbLDSgFOW0327u+scL0KITsuHXZNUP3/Z7TfLChLS8zMQS6fUDf/8KUxb0
	Gcsr0GfXzF9ZZ/8Y3PN0s21BKAxniAsTmvlkD855smAkhj19KYnp4CRKZZiZNkueczVDFLYmxWc
	Zst0e0LT7icPnA3uMpewK+sPhCQB/rmFlQ3sDDbPX1ssylo7hyda5JFLEwl9/FmzLdsLqrXtcLD
	Fh+HMrj/QXTKsx+WO8KwIgFss9AcU3XWA96Y4+oD5AehOzH6EW86AzVAQuoxKue7hqsL2Ec7z/5
	JGvybjwuesAtaUWD6L3FxpAdaRVnOPvh7e74IeREtEVxRlzUlfJ/ycePzcKli6Q8m8Ezwz1v/9O
	0gvSCSvus/wh4dwMZJ5Cuwvnhn4aBQkUqx8D9dKOB135GZQYg8WYdzR7bioa9ehe4wmsQlBbFKo
	Lm5ALe83pbR1xouWtXJPo6aLPR4BGw6Css2JChg==
X-Received: by 2002:a05:651c:1596:b0:3ae:920:ac4f with SMTP id 38308e7fff4ca-3ae1bfb800fmr22203951fa.8.1794645516894;
        Sat, 14 Nov 2026 00:38:36 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713565a6sm1527803e87.78.2026.11.14.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:36 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: pressure: infineon,dps310: Add interrupts
Date: Sat, 14 Nov 2026 10:38:27 +0200
Message-ID: <20261114083828.18059-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114083828.18059-1-zoone.rupert@gmail.com>
References: <20261114083828.18059-1-zoone.rupert@gmail.com>
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

DPS310 signals new results and a full FIFO on its SDO pin. In I2C mode
the same pin sets the address LSB, and interrupt polarity must be the
opposite of how SDO is strapped.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: no change

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 .../bindings/iio/pressure/infineon,dps310.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 416117dfd927..cded6e0af147 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -23,6 +23,12 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description:
+      New result or full FIFO, on SDO pin. SDO also selects I2C address, so
+      interrupt is active high at 0x76 (SDO low) and active low at 0x77.
+
   "#io-channel-cells":
     const: 0
 
@@ -42,6 +48,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -49,6 +57,8 @@ examples:
         dps: pressure-sensor@76 {
             compatible = "infineon,dps310";
             reg = <0x76>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
             #io-channel-cells = <0>;
             vdd-supply = <&vref1>;
             vddio-supply = <&vref2>;
-- 
2.43.0

