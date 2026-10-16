Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E031326A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113786; cv=none; b=K9ylrwBhWx+CpHkfutwaqJlHR/khvI7/54RPnAdZWGZpZFQpCT/vkKKtWK1oKi69yw8TYf3hZOowfF4/4NwQgx5aoX9kSMchjEsUnWcICAldb+kdKb1fJfIqhlb8AFlHn7T8+gun+6QysQ3waReD7b5x4yKDDwqgHD8+sZsi3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113786; c=relaxed/simple;
	bh=lR1tSuCtA96YAlETO2wgxJDz/NogluZKvBhIR+zMhC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frAnEmJ/liQbyziVgbL1IRtyPLFMYen6z6S+gIKySr08ZRJ1ey3rvjoj7nBl77nBuB908vaghVXsoOGvp+gtyLHdIsoCCeDpW4IftbYPLoMkExMKpcariB0TTd1GQ7A/C4+il2uQqHFSy5VE+N2xKmcJWx4xizfRT5mZT2lcBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAjCujfS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAjCujfS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2769945a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113784; x=1792718584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojMddD78KtiEJw96nEVmaSGc9IJ9E6LLxgP735UZib4=;
        b=QAjCujfSsjZEgP5u8fyeNnKAO6S+GN3UzdJFVWqI4u4p5mE6JHfODsHSy8uY8XyMSx
         0agyM6sJlkmqUpZAGXtDA3rtOCyqshKyVTpcSa/3nOEkGvYgMYQG257BXtxY9kqAZPTG
         q0GuCztpDrAxlUt5dEGdSbJe4bVikcucd9cHOqJL0wdhENs6CucDlV+KTzK6mTvPKVVN
         sz+cxDZQJ9FLs37zeTsWOMXA66DRNUmGnEMDIEE4EnQA8146D6/SBLvMoOFXwaWJddhF
         HMummmcRZELpa8vzgR4itPweEXJu8EncWbAvn7Kcuz7ltGEOw/PcD9vt+ur74ZaYjGH5
         cMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113784; x=1792718584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojMddD78KtiEJw96nEVmaSGc9IJ9E6LLxgP735UZib4=;
        b=kELl58E2aebAPLfwACOQITW1VUlG3BMWXisejLkktJmuH52o/hNrfgcy1EFDsqwsAU
         v6qW+sjmiRmzrB90Q8A7A5ZpGFxfEtBKU6z2ts3Q6dL9TPbBYLofYOgCR1X3Gq+9iZf3
         mpx9he4vT4lWkJE2F+4rEfdwGsal8DKpbVoSQHLI6dG1xi28MvjZXmKK5by97u3vFq9q
         7ww8g4D1jWkE4CLbheylxrgk8xYHwxjWDtTPuEDyns/9zMIf439TWWvL79e8WckUhB5F
         zTZJBVNiqwwb5je+7iWnIh03iublW+uFbaqfvGt2dLmlGcC9CCJaUVW+LxxTsgFU2D49
         XWTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3fHxvpCEROYW2GS44pl59VhZ0Sn6hgdzohnZApsatSon6Srs/f4kE1oGBHb7vlJxvy2V+A50K2WUagzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY56H82f8XhtuIoA/LqFwnAPN6tyg0BNy7mAUfsFWKYGzn/bH8
	v2GUg7xTc+qoEEdQth+7q9ILizKfA55BRvMMyG9dbkNCHkpTAGwC3zKT
X-Gm-Gg: AYBFou1RV5l+IPfOh6sF7JGTuc3/mOxxNYA0meKlhJsnyoPXECJN0J/rg1sF/PhMx3X
	K5UUzrnrB12LLf5BF51Swj2pzCvWTZgcU98bM8vFdGJcPKz7OSJxgRFJD9vNhDEFYKWSdAqkANV
	rnZPY8Ubc+N9fxPrrbwaYTcxvEW2gy/O4NuH9klLzvNkPJzDwkA1Yjh73am2y5TZrib6YaF5gdX
	rK7pUgNJNxi41ycL3AAx2BwpQVASLExjKi8YcWsRDC9knLvHr23bEveFzaaLlfZBfsluuE5PF1n
	RQjwrD3M0/cUb5FEWN1ZqBNtUzU9AnqoImnhTXiqpi3CghOLKsWUwjC5hb4RQSka4jr1VKVz9HT
	iTygU8Tt+w0SoFwcoMdsKv0lPVfFdgUIonMLld0cKIG6MZyCqQoOidRC8RLb5NPdYkxlPxNwUs4
	QTKgmmfw7vQFFRjopI71vzwScTTW0P9ktKTcLVF/8jN+mdAzHfAJVfYpKQFI5aH4vCRWm72Ujfc
	k177VoTNXWP8bffcB62xw==
X-Received: by 2002:a17:90b:4cc3:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3aca9a185e8mr2849279a91.27.1792113784397;
        Thu, 15 Oct 2026 18:23:04 -0700 (PDT)
Received: from l (ec2-56-155-112-168.ap-northeast-3.compute.amazonaws.com. [56.155.112.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05fb680sm474327a91.2.2026.10.15.18.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:23:03 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: proximity: Add Vishay VCNL36829
Date: Fri, 16 Oct 2026 09:22:17 +0800
Message-ID: <20261016012218.40223-2-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016012218.40223-1-lyf98405@gmail.com>
References: <20261006100943.78971-1-lyf98405@gmail.com>
 <20261016012218.40223-1-lyf98405@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

Add devicetree binding for the Vishay VCNL36829 proximity sensor.

The VCNL36829 is a proximity sensor with an integrated VCSEL emitter
in a small package. It is controlled over I2C and has an interrupt
output. It is powered by two supplies, vdd and vddio.

Signed-off-by: Liu Yufei <lyf98405@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: No changes.

 .../iio/proximity/vishay,vcnl36829.yaml       | 55 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml b/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
new file mode 100644
index 000000000..6f20537ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/vishay,vcnl36829.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VISHAY VCNL36829 Proximity Sensor
+
+maintainers:
+  - Liu Yufei <lyf98405@gmail.com>
+
+description: |
+  Proximity sensor with VCSEL in an ultra thin small package with I2C
+  interface.
+  Datasheet: https://www.vishay.com/docs/80580/vcnl36829um.pdf
+
+properties:
+  compatible:
+    const: vishay,vcnl36829
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vddio-supply: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        proximity@60 {
+            compatible = "vishay,vcnl36829";
+            reg = <0x60>;
+            vdd-supply = <&vdd_reg>;
+            vddio-supply = <&vddio_reg>;
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..e6ef84b49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28754,6 +28754,11 @@ S:	Maintained
 F:	drivers/input/serio/userio.c
 F:	include/uapi/linux/userio.h
 
+VISHAY VCNL36829 PROXIMITY SENSOR DRIVER
+M:	Liu Yufei <lyf98405@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
+
 VISHAY VEML3235 AMBIENT LIGHT SENSOR DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 S:	Maintained
-- 
2.53.0

