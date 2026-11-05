Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894044;
	b=FLVtERtXg/tKpsBLccqQljnxNzbc1b1F8HJYauhIYwPSS2irCxlDsSSZTTso6Z3YcuQb
	 F5tMXFXUoJ/khnVTwhSnAVr3dfLtssS1PC2LrzRIdGHlrUAmww2lQ85E1Cf43AOPNzcwo
	 Y8DWkq8iSNSrb/pY/qJ7Wye2FrfZpyDx9wbHjBp7nawZTUH0CP3bDx0yOq345uRjjo+GT
	 qOiDYNNLmcipZOu6mEh5mspNqGsenwg/mQNs1IwaQkLsbLuWOcfDn40J8sBi0oKkUw5Yr
	 6ZoEYrD6EK7ZFLq4SjNsC5iGtUXai3+6lHU/h/FPF44L3EXX7kGS+wfpds1gyZoJ3cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
	b=ybGOlVnievDoD7kj1nrJ++uUCNVhvXmNoJSdr0AUfgArwjvWWvqOwbP+uCQmq9feBQMa
	 tXw5NB2PqN0tr9endgBovVAEiGbYcTdaJfLwIc9L+MW4umEYmEZdQnHMZeb2qrxWfT2+k
	 Ooe34Szn+hOi3FsdY/p/12Nx7HBVorKTC58pXxNbZ0PWnlDUxR9GW+XpDizUDEuLhSryS
	 HOCYmdFpOQvqecxiVUq7Vg6A9HPHL6ZEQG3/3C4KDtqXwtzliAVoj90kOM7Tji5IKOF6Q
	 iNvnVrHmnmZjGmc2yu2n0mB9bonY6ICIbhb2xYP3/5PRhYxQHMSwC0Y49zcvXZKvMiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugt04DdM;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62F606A628
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB62F606A628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ugt04DdM
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1370394a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894043; x=1794498843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
        b=Ugt04DdMvXNIQi3CXkpq6YOCaNigKtVrwiH+cApbnptfKsc3875hQ8SLzdVvHnp1BT
         dDJKJlt57BhJ/VRTJXF34zczoA/aVp5goduL7Ghdh5Us3RrGs3LoOL/AsaVHnWTxn1Yt
         yWCn/Vb3vePRNkG3+cBgdBmV0XE4n0miN8b5mHWpzbyQRZ2XIoBZaiF0Iq54jw5ycBTL
         atYFmOBbhhDiuO4wc3GLBxcxNsj/EgNPc8K2pi9jYNhuIshsfZQ5kGY9JrzJy83XlDZ9
         Tbp26ETT/OdIgT2qr2LwwoiTDpKy9aEYZyrTmyiBc9jmm/JdJlTVst3dMSpSWDKet7UW
         vIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894043; x=1794498843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lRC6CWOVikwkZ28NfqI8YIi29jv4pscxSqAe8AOmBM=;
        b=Cxu7tiZLGi5zvsDZo2Jfro18yZs0shRxKLAKD/BrGJqzlYOmYnrhXVDQX1q5ikz0yp
         /FPR1ixEPXyd9dXXqkilXJuhM22MxsGHFbLmtrzJseLrxYa8yCMvRoRgxFvKUOZUvtgc
         sO2/aPoAsl2/9i6Dja7rXWlKmDmnygHYScobCh/fEdXgZ/D2F25nuJgfSzRzcT8PRZTU
         3c+fiKwgSYpAQ3wQKUQx+bjLwc23vmyrRvsG5OJgI2RoWEyzPKhnB1PChcsM3LiROKwB
         RgF4PFPvZesIyZ+Vwl+Ipc8Mi3yR4eduUskhEGlUGRlCxV70vVk08RxsuN+j1yotVQam
         sTLw==
X-Forwarded-Encrypted: i=1; AKwUvBzvWLveQ54LapjRh9kkmtiIs5qsDoFt23texwbuHSx7FbSGF5aLAORGmL9dmrKvNIR/TPZ6GWNsQlva5gE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6pk5wiPvl20nX5M714Z+GqyqwaRFlh3TUePRE9Jrjz2yBFzC7
	sOcWbGziHz+lfrlFgWa/V+qjFCMBgv7BE7V2gaNHY4R5y0LwXRHwudnA
X-Gm-Gg: AYBFou1YRFdOAijKs/tFE36sFiRmanR8YAKxJa/LU3a516cPklSbNbxFIleRk0qRynn
	E+fOZ2JmiXcdXt99S+T47RWIUL3c0gJ1o4NDkMcQEzcftl0xtPjXbKb0YaO9k+UvJHADlz1GU7+
	YpczJJDTaVTZFAPo1MDDe+peMqYmuk4j+x3Gr3LInTpfTxzDaTheVq/a90NXUG/2SKGq9D07p7U
	qZNA5rUZ89fGj01npjhkfuWCRmOvWL0lNsT0h4G0I1uCyCwoeg6ct7EFSTM5W60yEoK+hBYCitJ
	GIyEPbnex/R/wXFjkhPPdA46O676BgaZBBVjxzJvz/+GmNZBJ7KfrzN1hPt0SRbyrcwXX5CqjT6
	8NUZEb9o/ppMYQpVSQEaNy9Rh3Z21yk2vo224wJD7bM8zyIfGfhmOt3HARidRJHluWuL2ihx3lE
	rRTVvOMigmRVEDMRbj3Z2u4Dd7m1wnd6jBtrMrLFhEoas06M39loO1lG3SYu8jrhx19Wz/Z60oQ
	jJjN0uLXPdgFZ7gGwO9W4w=
X-Received: by 2002:a17:90b:4b90:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ae89851099mr16476018a91.52.1793894042835;
        Thu, 05 Nov 2026 07:54:02 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:816f:e3c3:bcdb:ef3c:2956])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm4518780a91.0.2026.11.05.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:54:02 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Date: Thu, 05 Nov 2026 21:23:47 +0530
Subject: [PATCH 1/2] dt-bindings: iio: magnetometer: add Infineon
 TLE493D-W2B6
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
Message-Id: <20261105-tle493d-v1-1-3246e91e6394@gmail.com>
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
In-Reply-To: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793894033; l=2848;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=FR1ySw/9hgFNGeOtC9yaVRejdNXl5U2rc2d5645AYE8=;
 b=ntwaFkEjnDHWypKRs0NxTxwu1QSP1xhgCTyTbCwd1OAgwx3t9TnJha+6oOgDTsPg4rA7tdYPf
 Y+fa81qBonxC/rkt5+A+zUBzE3QQJpP6QqS/vOgkxJHdZzHUwjSuw/P
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

Add a binding for the Infineon TLE493D-W2B6, a 3D Hall effect magnetic
sensor with 12-bit resolution per axis and an integrated temperature
sensor, accessed over I2C. The A0 to A3 variants of the part only differ
in their default I2C address, so a single compatible covers all of them.

The sensor's /INT output shares a pin with SCL and cannot be wired to an
interrupt controller as a separate line, so there is no interrupts
property.

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
 .../iio/magnetometer/infineon,tle493d-w2b6.yaml    | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
new file mode 100644
index 000000000000..46f9c0e77e24
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/infineon,tle493d-w2b6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TLE493D-W2B6 3D Magnetic Sensor
+
+maintainers:
+  - Viral Patel <viral8854@gmail.com>
+
+description: |
+  Infineon TLE493D-W2B6 3D Hall effect magnetic sensor with an I2C interface
+  and an integrated temperature sensor. The A0, A1, A2 and A3 variants only
+  differ in their default I2C address (0x35, 0x22, 0x78 and 0x44).
+
+  The sensor's /INT output shares a pin with SCL, so it cannot be routed to
+  an interrupt controller as a separate line. The binding therefore has no
+  interrupts property.
+
+properties:
+  compatible:
+    const: infineon,tle493d-w2b6
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@35 {
+            compatible = "infineon,tle493d-w2b6";
+            reg = <0x35>;
+            vdd-supply = <&vdd_3v3>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..c8916e1286d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13110,6 +13110,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
 F:	sound/soc/codecs/peb2466.c
 
+INFINEON TLE493D-W2B6 DRIVER
+M:	Viral Patel <viral8854@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/infineon,tle493d-w2b6.yaml
+
 INFINEON TLV493D Driver
 M:	Dixit Parmar <dixitparmar19@gmail.com>
 L:	linux-iio@vger.kernel.org

-- 
2.43.0

