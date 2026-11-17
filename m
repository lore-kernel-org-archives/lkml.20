Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912214;
	b=JGykLMVsxweTrfSp6Y+eEiFzDUEgrZfG3yDrp6zwV33qs2g8B6eBT9HNrEolz8Q/yQfL
	 UlbrKoxSvJRkw1X/aRHmyyEWNluiio60y7msvAIwqHkxLrLCqQCSEtUQa7qQuwftij67u
	 pNIHqFikYqxBKNVl6196JHqJBTbYBEX5dzIfi6G7UExWRIEcZAe06ZB6q2neCrt67U55s
	 hg0+1U6Me9Rsapi5XzpSHRhda6CcTmxLoGlRmCTucC4E3nudJpAd2QHDa5izILQaTkT2y
	 62V+ewbri/xvUPdQG65o5oSdgq9wtlHkUXDjdV/2nEgJOLvN+75w1ozQK7Jh/sjNp4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
	b=DTMNeW7PAJA3qtVXgfkaExAB9wRxVjV11KXT+LM6iXPpqLSqWEhKHSnjpIrVX9WUtVN5
	 kJmvTEKNUJt9gVVqkz6d6xTVMBeMW5/EziKNvKA+9R/vfPvS/fkTCxx5+25d0NomAT45i
	 oUjuIQzM4V7/Fk1AEONSMYecHsOIl9cy9eCO0htF+H6Cmg3esl0EnwYoJUbbr9kYcF6uS
	 951+JZAwz/PzheGYz3x6jczmdIqdKV7ogAvrTW/9A3xMLN6IXEmmz6X6qO5tl0qXpies7
	 2cObJiKl6ovx6tQz7pwEKIcM9nBNo88YU6JwL46e/uLgkEkTIp8eowEtOhVulsgH3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzCvqTkC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EEC606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8EEC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzCvqTkC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so46613655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912212; x=1795517012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
        b=rzCvqTkCjQZoIJfxDSOBeYlEmLznCaeche4h7hMQb4YCtCKdIu03Bt0VWG+rNggaST
         iZNGLrD6vErb4nYZpvJQIT7TzHvU532sLyOO/ZxfMAVhKW8LaR+EYkn6+lkfQZxzExy+
         IIKhjzQDMo+ifgIJWjNE9zLs0SHCEy0p0dC+TSGmaYhNis0S3c/v7zMLfns/w8t8BlIl
         vnAPb6GaBqx/Mg7OsKVRl2wxssgkw0nAPZAH6PRU11riEv4c0e3TaGFTMrZh8pxv+9+o
         NIQiL7GWfHT4QhnKtNhq/9O6GO37bDDaSZdfOXSiAFle5uTg97aiTpYZ1wpS/UMA5U+J
         bRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912212; x=1795517012;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7zRNxbJKsSMY0hGOLgV+DOB89aCkkPNfi2Ro32Ijdk=;
        b=OOIJOrd9twd/F8Il+9un5Nvo3VKlvtv4gkGvN4oTnglP3hsX4DSSW05rxb8RR7fJPk
         +FM++cjI7UfkeneM163/v3WXru3lgzYEF2YPlOX/wkf82MTg++Fr/T58pzPYCuO/NQ2D
         dBFK50k8PQCvOKVfRLs9TNlGD348yBQ7KMcGn+3g3dmMrUvz5+8qIXWIaykuAvMAvpff
         jTEKu2bnNqpXJbJme0G47vQxRY4+HPDafy9a1wrDevah6HJKAMICnpARqJ3P/cE+E1Af
         MyHvqHr6cmUzOGaR3SfunSoV9l9xXlF/VbOFXlRb8pTQMpdnQQgGo/aoGJz57hWJQEmf
         o5Sw==
X-Forwarded-Encrypted: i=1; AL+hErHYFt6SUtliIZhosr3L1xgfj6Up8OatHPuDmxuFbzpCTHeRHh5f5Vxi0NzzVC/s3LiaEgzDN41CJwgzpgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OYzTmbmzlzqLuc7EHFuoT4jqaNWfMdQGVwqQZtfWQoRXvrJle
	WkzpmxwJ2CojpJYUZANAtQDQF96H+zz0az7Qm+n2TYcGIwnGtVlId4ur
X-Gm-Gg: AYBFou1+E/9/KbFxhuNpVaP6q7BbHJgpNIwRN6TbQLAx8i3lbY6cdB4fU8rBG2x5A3+
	r5pVsVOayhM+4OmAh/DurraYvXcCi/gtn0KYXDtPzF2xKLHBxLLGQaECePKbGrTAfDT+ETCYTN8
	gBPb0LsYLg4vdWXLV94RQvKw2RgUvk+rkwYJgHHAzavDTc5pYjSEzAc9faoSYv5zvbPDtvQ9MoW
	JhvHsPBJAU8y6zEKqU6QaCm4xb30ReCYOawnJxPyxOmqyLLN5RWGeA2lv0dS3ZhlFBDAHGcDyUH
	r3mwHQlp4v2rn+ewjjIt3auYDzcZFPMDHci9PsdJEticf39EWLXsODMNe0aEztmJ7WcEpbXEpx2
	BZPoSTvwtWFb0s/Zt/YMbYgfxtT3cVoBjOV1aKIwnU/5ICJBAMtH6Y7ttg6dCU4Zl11QNexjwZ+
	6mtGlCnaez99BoLr93fq6TEmsntk9RkKExx5HjP175Ue+/vGBuo7S7daKbO5qXiy560rTgus32H
	PeARfNFCTkBIsJktlD0OnhJqgmmD6e6kpPr51zspR5lDDywCSgKJ2O7lIcXiDNkgibU/vpE52OG
	0OIZg5xBHVU=
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr281170935e9.6.1794912212117;
        Tue, 17 Nov 2026 02:43:32 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm61091805e9.15.2026.11.17.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:31 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH 1/2] dt-bindings: power: supply: add samsung,s2mu106-fuelgauge
Date: Tue, 17 Nov 2026 13:43:27 +0300
Message-ID: <20261117104328.1176951-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117104328.1176951-1-tadilhusrev@gmail.com>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Samsung S2MU106 PMIC's fuel gauge, as a
standalone I2C device (own address, 0x3b) rather than a fallback
compatible on samsung,s2mu005-fuel-gauge.

A previous version of this series
(https://lore.kernel.org/all/20261116074000.355176-1-tadilhusrev@gmail.com/)
extended the S2MU005 fuel-gauge binding and driver instead, with
samsung,s2mu106-fuel-gauge falling back to samsung,s2mu005-fuel-gauge.
Sashiko AI's review of that series pointed out that the fallback let a
board bind through the plain samsung,s2mu005-fuel-gauge compatible
with no guard at all, which runs s2mu005_fg_get_voltage_avg()/
get_current_avg() against MONOUT registers the S2MU106 doesn't have,
and can misreport charging status from the resulting garbage reads.

Rather than add a flag to close that specific hole, this binding
avoids the fallback-compatible construction entirely: the S2MU106
fuel gauge only shares the S2MU005's STATUS/RVBAT/RCURCC/RSOC register
layout and scaling, not its device-tree node shape, so it gets its own
compatible and its own driver
("power: supply: s2mu106-fuelgauge: add standalone driver").
samsung,s2mu005-fuel-gauge is left untouched.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../supply/samsung,s2mu106-fuelgauge.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml
new file mode 100644
index 000000000..3dd91412e
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu106-fuelgauge.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/samsung,s2mu106-fuelgauge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MU106 Fuel Gauge
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Fuel-gauge sub-function of the Samsung S2MU106 PMIC, on its own I2C address
+  (separate from the 0x3d charger/MUIC/FLED block). As on the Galaxy XCover5.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: samsung,s2mu106-fuelgauge
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  monitored-battery: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        fuel-gauge@3b {
+            compatible = "samsung,s2mu106-fuelgauge";
+            reg = <0x3b>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+            monitored-battery = <&battery>;
+        };
+    };
+...
-- 
2.53.0

