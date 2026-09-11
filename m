Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258F834752E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139779; cv=none; b=Khx24af9ooNpNGhEZJ8e+WoFy4DUJmLdaN6BNGgn1T0ftzri027fK40dV5lPvYgOVCreUy3yKH4Dtzag/buUBVhhfJLNGVzzn8IRfHpjqa6siSlBKG8SyRZtJRCLfCt9Fn6YOoa2RmM3C1lX9EwrQpekg5o36+L5BSrPk5FfhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139779; c=relaxed/simple;
	bh=8AhNBKZpnaYUD2pQxjChPO5qgquyOMhWXmxX3P9/qnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lxq6tdytksNiyyoxvnZ9HOn1XgNvM+n4prEAL1R7lL+2oQWvGp/DIN/XKMK3ntT+2mgLau7mWJqDQH9zD3xn3S50sapWuHgSieAUYqmHkDuC0zbucuuCcdBOGpanTk/9krgaJObO/6StiXcjfIY2wPqTgiKSaN9pm29eumjjqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=H6mxH4D4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="H6mxH4D4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c262204cc80so150194766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789139775; x=1789744575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuBzPHoSnBjRL86Zizr+XKaGzMxevhAgb2XWxWkSVN8=;
        b=H6mxH4D4VnGGfHmT0ag9DjctgtlupAtfzOAbpqHc+0+Y4krVg52rRNWmeTeM9yWdYU
         P3IBSloqqNkx0n9xCzcsW2AfeElvPyyg2ZdZKYLOZJD9ALJxuRUKzbSZ1mai7JctKyF9
         +SlmrE4NLlzFGY4sF17j5vqylen+JWu/+mkzC/TCcuf9A9LmtZ2iZUbzGAIR6kzMcUM8
         B0fqdjUxnnnI/Nr3IU10O/+slWjmfKuCoEmWR9+3XyRTwcc4eOjJGg2IKBm+HgBhfPrf
         y1tdx+2qsY77+V2JCTe76pp5hYyjzNkNYHmeQBSyiFg/66F1W+TB7mrfrwfHFmwNAHIi
         ob6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139775; x=1789744575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuBzPHoSnBjRL86Zizr+XKaGzMxevhAgb2XWxWkSVN8=;
        b=gQkUVmLX/KXICZx9j8IZkYAGHMKCzfNI6jxvox1FeRyv/CyJO0jPOwS7FdJkDSxkWI
         Rxx8HVqBWJpwr/8qwkPYZif/9s2YLeDtdqVKfKw9OvAqKvyvpVj+QY6ObqMnMwSEdlAF
         +YkUpGOKO2GimPfCPjRH5j2M79IcOL8XkAxYyqSag4+47a5dYoTf3JPvWi9iC2Ta1A8x
         sxnzAldN2rKasMbNHeQT5fg5VrEblU4/BhD5unWLF3ibhOWX5DT1zNgc9Gm46xwAWrIV
         BpYrZn0OAqwlGTuZDcNUxNp991HlotOzBz5wzX2WvAe1vSBEh69S4Y360UL+jZLz90B3
         z5/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzU6H9V3zhiyA40O+yOca6wGEtDIbPe580KomUkw/6tgqBvCnkS1VnAPcgTlD350zu0GYhKE0hbtiy2eoo=@vger.kernel.org
X-Gm-Message-State: AFuF++lqHwZumH6q5f4Lh/IeGm8kTeUJcMmIefpUF1Fd/D8KRjDdI5VO
	6mlIYaCWq7a+zhcd1v7Lmn6fYd77xz0gR1qfjFOMWlxFPsurRcU0vhw+lcaDJL0IF1U=
X-Gm-Gg: AYBFou00pQQghdn5XGvPeWN6QmWrgEUQRgH/wloZ3+M9ihl0H3aAp3AOXPscWso1p+t
	kKkdmHg6at06GMLvB0HpIlzwOXX4L48ktL3O1LbW3i7I2HMSc9OS8TXtVyVU+/0Fgdp0fgZZsCR
	J9T+xJAYHX4KapN7umoUzi3/xsJQOHa7QK2nl62nlAJofIY1J79Tkw1ZW3jOL+dTPptNfD3laGq
	A9+pvBtC9henC93BIsxqDKMGDHXQiu7Hp/edGxjXRRJSn7jCWgJ+BInSU+VsPJgo2ZmbPAIqIfY
	SSJE60MeFV8NLwLc7xNOqhqg8/ue2lXXMWIb0SvDgZ3wa2Suc4QC2gycTprFZRe5jC/iJzBqtbj
	NQSZD7G+L2NUmlSHZOZUiJpTOIXcFBRjTOPoVi87PlV3XKDxUodYLDukNbXoHd7Q3MkGlzlixfY
	v4UWE7/yrbLQAvwOgqEqaTOvT+9EectXX5+sYexWZzMEus5gnkni0gjsmG0cUnmDtdJfXZ50QEw
	cmjqvhvRIqaORuMGE09v16r7+/xQC1wjj1+/av9/RW28ve55g9doQ==
X-Received: by 2002:a17:906:6290:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c296671348bmr202563666b.42.1789139775315;
        Fri, 11 Sep 2026 08:16:15 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm94656766b.45.2026.09.11.08.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:16:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Sep 2026 17:16:09 +0200
Subject: [PATCH 1/3] dt-bindings: input: touchscreen: document ESWIN
 EPH8621
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-eswin-eph8621-v1-1-db447ff9e445@fairphone.com>
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
In-Reply-To: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789139772; l=2508;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8AhNBKZpnaYUD2pQxjChPO5qgquyOMhWXmxX3P9/qnM=;
 b=klm5WaCMDKqec15ANu9XtYr2/JmBMK+XJPgebCb8nmQlHNdiQ6PGH2kPZYx1us0RzXLSKLfl8
 5FNQAJ9XfH7C1PKqsY0VAh3Ov1W/+d4FyTZ6HK7k8FY5F5hY90iGJ/+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ESWIN EPH8621 touchscreen controller, which can operate in
SPI mode. Other touchscreen controllers from the EPH861X family (and
potentially also EPH8621) can also operate in I2C mode, this was not
added yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/input/touchscreen/eswin,eph8621.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
new file mode 100644
index 000000000000..03f981ba19e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/eswin,eph8621.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EPH8621 touchscreen controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - eswin,eph8621
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  avdd-supply:
+    description: Power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: Power supply regulator on VDDIO pin
+
+  spi-max-frequency: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vddio-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@0 {
+        compatible = "eswin,eph8621";
+        reg = <0>;
+
+        avdd-supply = <&vreg_l22b>;
+        vddio-supply = <&vreg_l9b>;
+
+        interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+        spi-max-frequency = <2000000>;
+
+        touchscreen-size-x = <1116>;
+        touchscreen-size-y = <2484>;
+        touchscreen-inverted-x;
+      };
+    };
+
+...

-- 
2.55.0

