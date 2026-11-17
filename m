Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919197;
	b=qi76EeDhaBJyZvy8bEDtV6bGDHRhBvPp4Se7UzLqZCEjepsjeYuiVN08rG4RCkuHPSfb
	 oKbecSbq1DzS7cKGhlqEPz6BwKVHiHglUxPO0rCDRp36kCmI3ZyLR+/g5jvknn+r5ITNy
	 7qt0ycMfRiQoiwSx8mEXtNMXS4ebwCt6GMt1LPml312MJ511mWF5/oytsWM/XZL9h6PM2
	 c1TldaSWDRs80u7sqLtKihuHQuTABzDxORD+y75GbcEAnDEsdaE29oDEld7l6lyoA5SUG
	 RfOEYAwCRKzKqNGDHtSM6eaUvWuMJx8woFxS5n6zVRPupM2wmVuHTZjOkFQjdhns6bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
	b=JsyOrBmuMz3MQmmY4FzCKSnJsRJ08J16b+fO/KmUv7/kXLPTUNMWsTl/iIBGhc2+keLJ
	 JYsaLBr/9MVqJ+qfwt4UnHmNH8Z4TzCYjlqlVybqNTEAd3mByKyKyyGnhmQNa3nwz3IKh
	 UsrkcwaE5nTb4VobxhY0ph2mMoqYVvklbrKjSrsk4g67GOZWUxhRQjsndQqRMPRjiXk9A
	 L/vJdYVzvZ0VEsvKEEoDc5XIGuN3BKbMi1r+ZYwRKaEQKLGHKMygxOedKpWc7kG2de/dl
	 tiUXFgkRvGyJqGZlRlpeQf4k27qHpZjwsvekHPfYiOiVbaLxfQOA9IM0XtS0QM/H/hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA37E606A8AA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA37E606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so226662f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919195; x=1795523995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=y81t6W7aTl95C4y9Rf0QU2nrD+sHK1morXML7lei63TX2FL3EWpNkN9I0aknlqyqK4
         gqHGoz2NXR8U0/otEEzXPgPNGzm/tI0i3FS0qTz08OkkknigPevlog1Q6m3RP7mq4xh7
         0RfSrVo1lbYrDa/L8TWUkyhwAHxnVHA0nNsFgAgAadTUbVUV7wpjcy+WqfOsafTXixTA
         A0Ksby2GTQifFsp4kd+zFwI7enrUtCAQxXxlWM3SNu3pqse7KFQHusE6UEAgcGgQRkpW
         PUcxqKnK+MccmXMoCZfVKYkegfkG4KcED9/9iyc1OUoDzS9PJPfwoWpqUo51uQ0qjeVK
         Tiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919195; x=1795523995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=s7CixqQ5NkWjfQzieVVxM11esUCj3o0v63rF4lqazFOK/0xZmynGc4pmWh6cD6A0RP
         yZqwFrua6ZRiL+MJvZc0qu+1kZrnCu1fXyH1HU4t5st53b6+Db828GHgSySLdy04BUje
         tB2lR1glod1EDzNKGxL2aBoq9Jh1BO1W4S99cUBvUlI+GsCdBshl2HcwEJaLuYaMV5lx
         MqoCGt2PeG4hg4saurGydxiuugIb8sTnwnd5H3/oooY/QnAoykMskRdav2m/5UgS4I2x
         Zw8elX76swDekjZIitEQESxELR6TeI7cLxY6zbj4SprONpuU489/zHyNn5bz+Ea7K8v0
         yi9Q==
X-Forwarded-Encrypted: i=1; AL+hErHCFNh4Zkt5SOdehSjNY0qxdaZpqwoSvvif4etQEDQBwaHUkotr33KGKGOqc7S3A2rfSf/QHQVoXLoGttw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bC+W5Wu91aLbu2zfojKjKrtLv4dKHgw6A+K++ZGhSFv6W9NyD
	RFueUm+4XDj9ovCNmovX54XUCANlWXmnh10LiUmiq0IfDanHARxpS3XV
X-Gm-Gg: AYBFou2Xxf9ZvJmHdx5YDG/Jrw2cUe4FVl/k0KZseGjnxh7DDjmz7yHe5UU880AIGqt
	C/yhH4DuFxdHSkL2RhblPJDWgpCEn3A0yOKG01gZyzX1B6Vqz2a5LHYhJ2KBDHib1kIifEE6wrz
	9A5Ndy0rYdgBvVItuLXPLbpkVsLp+K56huaViBmi8j4qtPHyFuC3/iXzrzy3nfjPBO2+uO9uqpM
	W+tv0/T2fdvDv61jE9fJM4J8znQNizjGOicMIHHbqi0VKXZWd7VkG+HI4eiFxo45iJv9cs8ZnuH
	NGGznxEPAx9qO3bOiUevGWybIVtQPIqz54Yt5edBUDv0GM0EjDg5y4xRraX7y4PLPgOo4uTTvrA
	urBwy03LrMRlAfrI0YOHwBtYKh+SlDK1aK2JBScDu8ftCb2JBGT1HL1mfaLqyj2jLQvv3mwxpr0
	CguKq9pwhVfu617LuSOk6qSsCkp9Wdv2EH5mqbye4RU+DZBTMzUpUFXypxfsHPXyK9BErzU3O2b
	7VDHNb9MF8gIeNj16FN02T0alh5ue3Ca8N9Qi7J52UPvqzo3eTHgFpWNGBY6xmaUXkbIaGFLBOq
	6XRxPCt33mRYq4uwvLaPx9gjfVLHL3Bnxm9HkqXKcPHJw1SI3z1ErOnjdiWs74v1wUI4Zg==
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr55075555e9.3.1794919194974;
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 06/11] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-Id: <20261117123946.668557-7-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the I2C touchscreen and its interrupt, reset, power-enable,
and panel-size properties.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 74 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c56cfb8530eeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 touchscreen
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description: |
+  I2C touchscreen used in the LG V60 timelm JP DCM. The controller boots
+  its existing flash firmware; the enable GPIOs switch its 3.3 V and
+  1.8 V power rails.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low controller reset
+
+  vcl-gpios:
+    maxItems: 1
+    description: Active-high enable for the 3.3 V rail
+
+  vdd-gpios:
+    maxItems: 1
+    description: Active-high enable for the 1.8 V rail
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-gpios
+  - vdd-gpios
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@28 {
+            compatible = "lg,sw42902";
+            reg = <0x28>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+            vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index abdaabe16ed53..f4c54d7d86bd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

