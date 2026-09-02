Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED0455635
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392126; cv=none; b=Q5Qp7qw6+J/asRKJxv3CB4ngIkHJcTaliO8skUpCHmA86/MyizzpNIgoh1iIKQFPA5VGFnlIUgHueR7V3fZLZPbqxM8gTIw2YMdU6T2byGBXgEuWvBIydMTgqW3BYQGZ/JZIma3fScZa9M6wqYVtczIMNuSz4sYHtzasSCpEKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392126; c=relaxed/simple;
	bh=U71T/iH4wTJhru5jPquFocWPqj8LcYNokk6NJovo93Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF6sDU8p95KXXjaQn3U1zsgu0JpArvjONXvOa2tDmTM+2CVqm6UqgKK6TB/2t1ro9zd+DxWnSmeyLph5JRYIbmKtv6ttcQthBYz+COyxW3d69kTKnnW9E1tQ+/BhgfgGUW95pwbras3sniKcv6C2TziNRwyg5xj3mAmnmAPA1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1+CgPYJ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1+CgPYJ"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso1017475a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788392123; x=1788996923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhxmtI32HeN59PYea0qLMDve3O4zMl3qKBe7Lg9m4z0=;
        b=i1+CgPYJ9MTaoANCKUiyMGxPX9KWLNytH1An1H3wj4hmZjVoe+habo5ZzuDjav7HTU
         iJgnyJJNG3+gG9QAwe+H/2Cio6fW7ouznxPsMV1ih3wpUc5G3MF2tncyp/vul/CEVuhZ
         wXAEUB9344eHQayYDQyh5o7TZRqqW4lX9SNKT3Ea+4dYbsHN0rXcDmBs2UWe9t2wI6DB
         l+nimdoEz8CkBHJWyJxkdFqepcA6qhLEdFJcAq4EKG8JPk0GqpzpFpiA8TSQ28Z0F3C9
         wIYYngwVfz7kcsQYaOt+SP+nuurqrO45LvDIqoq/wAS6q5tL2aDWhUd0oguGAxCUw7HM
         12Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788392123; x=1788996923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhxmtI32HeN59PYea0qLMDve3O4zMl3qKBe7Lg9m4z0=;
        b=SV65wOCkeA5qNwbt8NpB+iUMG0aSwWb9l5ZbG/PGVQdczZ71S6fvtyrdyJxxM8/9kC
         /5WNa4BJgI/s6C5TtOTsdAh7qvpkNpg2f4HqDE1fm6iaRUur5bSQV/7bQsd4tkbfkFEx
         ppFc4s+8B7A2kXjGYauGCU66mnQyhiFq3fp9nE9zaSIpodUbDG3ZUzepweQB1tf6HrRu
         z9hnYBFoSPsgp+e0Z36gHfyZfdXkyeRR52ABySc7H5RGEgyKwC4hr3B5f1ulrcLWC/zk
         70EsZBwroIon+hBWQsVXnU0n9Hf4QLSBgiSWy2rwFwNJYQ4BshD30asxsxSt2Ec0n65i
         SVsg==
X-Forwarded-Encrypted: i=1; AKwUvBwt5cxitjvtZOnOpUs0Y4TK7Ws2h8e4XD58SEPg3zSzMu/BeVhgyHB2o8tw5qXAU4nc2D2b93wjgZ3gi3c=@vger.kernel.org
X-Gm-Message-State: AFuF++l+to/guFPH39mUzEFDWG+/1kQR0rZ90fQ67V+I4uiZlfCNrA+x
	KSnKkJH28XNMXMgWoO9uy/sJICvrhU/BhSytUhxOVcpgHLygWGks/dTb
X-Gm-Gg: AYBFou1N1gLnh9i2rpPHgw4vKUoJiUUcm/6ROvo8cjr59Onl9o4YwYSx3fZDa4Wvx/i
	8LzPtunUWIUjX5uAYmzghq2cBWzHlAig+Uyx1XkjybW4LNRUlgFOqdDXrZvOn5ftWK5f0ROAxkS
	8x2NGGQQaOCPHVIfguPRoNoy71tqDNabrqfUcXBh/w3mDu/L8xxRBZWchZOnpGf/0/2Zq/R9E/O
	TIkpqpYHYsTqJ5nlwIyCkl7tZQ6fjkTcdTqnFrlmBpCCktd+DNghOcZB9fIU8h+vwBnhPGt/fTZ
	3JUV2TXyHV4Xz94XcM+pjxFNS9oFaNpL4zu33UtUu3vilLRcM4V7tIgKN3ppNoF6SVuUDxf22+X
	ZopTh7lx88RDc9W9NO+9cX8AN5wQTolEtms0NaMktZH7ET0QqFv9HLHoMDeJS5KW0NwyiLRyeBY
	Ao2WhaoPUbL1meucebcvs0im6KLjNFX/apV8jSSHd+f1vQK6O/m4aihAePzrOB4PRzvkzplWsWL
	7PJY/jREHp/6WaPCuSmn1aM9sbES38iVWhsbzfDlwbwosFgHEI4JUwdPfo5PnJ1uYQrz36r
X-Received: by 2002:a17:90b:4a8e:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-39aedcfc81bmr12171133a91.0.1788392123330;
        Wed, 02 Sep 2026 16:35:23 -0700 (PDT)
Received: from samlap.tailb86931.ts.net (c-24-5-101-44.hsd1.ca.comcast.net. [24.5.101.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm1209199c88.10.2026.09.02.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:35:22 -0700 (PDT)
From: Sudheendra Sampath <giveback4fun@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Sudheendra Sampath <giveback4fun@gmail.com>
Subject: [PATCH] dt-bindings: maxim-ds1302: Convert to dt schema
Date: Wed,  2 Sep 2026 16:35:49 -0700
Message-ID: <20260902233550.947218-1-giveback4fun@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Maxim DS1302 real-time clock binding to DT schema.

Signed-off-by: Sudheendra Sampath <giveback4fun@gmail.com>
---
 .../devicetree/bindings/rtc/maxim-ds1302.txt  | 46 -----------
 .../devicetree/bindings/rtc/maxim-ds1302.yaml | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml

diff --git a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt b/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
deleted file mode 100644
index ba470c56cdec..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Maxim/Dallas Semiconductor DS-1302 RTC
-
-Simple device which could be used to store date/time between reboots.
-
-The device uses the standard MicroWire half-duplex transfer timing.
-Master output is set on low clock and sensed by the RTC on the rising
-edge. Master input is set by the RTC on the trailing edge and is sensed
-by the master on low clock.
-
-Required properties:
-
-- compatible : Should be "maxim,ds1302"
-
-Required SPI properties:
-
-- reg : Should be address of the device chip select within
-  the controller.
-
-- spi-max-frequency : DS-1302 has 500 kHz if powered at 2.2V,
-  and 2MHz if powered at 5V.
-
-- spi-3wire : The device has a shared signal IN/OUT line.
-
-- spi-lsb-first : DS-1302 requires least significant bit first
-  transfers.
-
-- spi-cs-high: DS-1302 has active high chip select line. This is
-  required unless inverted in hardware.
-
-Example:
-
-spi@901c {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "icpdas,lp8841-spi-rtc";
-	reg = <0x901c 0x1>;
-
-	rtc@0 {
-		compatible = "maxim,ds1302";
-		reg = <0>;
-		spi-max-frequency = <500000>;
-		spi-3wire;
-		spi-lsb-first;
-		spi-cs-high;
-	};
-};
diff --git a/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml b/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml
new file mode 100644
index 000000000000..3e6264464e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim-ds1302.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/maxim-ds1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim/Dallas Semiconductor DS-1302 RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description: |
+  Simple device which could be used to store date/time between reboots.
+
+  The device uses the standard MicroWire half-duplex transfer timing.
+  Master output is set on low clock and sensed by the RTC on the rising
+  edge. Master input is set by the RTC on the trailing edge and is sensed
+  by the master on low clock.
+
+properties:
+  compatible:
+    items:
+      # Maxim DS1302 Real-time Clock
+      - const: maxim,ds1302
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Maximum SPI clocking speed in Hz.
+    enum:
+      - 500000
+      - 2000000
+
+  spi-3wire: true
+
+  spi-lsb-first: true
+
+  spi-cs-high: true
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+  - spi-3wire
+  - spi-lsb-first
+  - spi-cs-high
+
+additionalProperties: false
+
+examples:
+  - |
+    spi1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+            compatible = "maxim,ds1302";
+            reg = <0>;
+            spi-max-frequency = <500000>;
+            spi-3wire;
+            spi-lsb-first;
+            spi-cs-high;
+        };
+    };
+
+  - |
+    spi2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@2000 {
+            compatible = "maxim,ds1302";
+            reg = <0x2000>;
+            spi-max-frequency = <2000000>;
+            spi-3wire;
+            spi-lsb-first;
+            spi-cs-high;
+        };
+    };
-- 
2.47.3

