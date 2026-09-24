Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64B48422B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255668; cv=none; b=lImhPADF0CpHIcHfSJ+PnLPHLuk5cAknlOloi9UyaISR/Z+LRChU5Y93Z7wPU9uvegKSYEU6xw69nM3zLLbD/EJ8eJEDFi8ae/jBHFilTjY6WGWbdrLq97vVT86hK0JssNmdo6etgXUt3+NYPY1A3TftTkPhUlAzzj6ox3bfiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255668; c=relaxed/simple;
	bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjRuudzdESNT6C48Irq0GxmwAP2x9jZWTMSX+yV+xDaFmAHPl/JeVrfNS0oiyG4OXxN/rZI30SAzGWfGopMPAgsJHZtK9tC4wkqEgXEgZ2YO/ObM7KhQoQMME5VxqZ8tuA8Vym+AeJMJG6FNj6SvKhtXqOMut0JnsrrKqfqpxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liqRmhU/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liqRmhU/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so15935705e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790255664; x=1790860464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=liqRmhU/yqIVr9dfAuSxDwoDmB6/Lcoh09ZmvX99quCGINUrhDFy/Nt/tVOb85H4lW
         nacza8Z3BEmHcOaXAZ4VrD8l7Z9dNoahbtaQNWdzHkmo/U6a7PseBIEgbDgxTM4CIqho
         jI3QaQliPgaHG989Ir5NiCAMrLSkbnG/1Q/0CiYOUE69mZkjnXsbN+ZClDh8CcMRr7wT
         8zMF3SR8aG3TDcYi0araVhAyuk/QtDEiiJmbVYD68uD8p1pc3Si9Uhzh+ZlnZ3yEK6Tg
         /g0WAvsGVH7VL9bY0Zy4MKEt9i680iJJbcTs8A74ym0M8WhkTpUbubLoqJjnqOMiLbCO
         qf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255664; x=1790860464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLtv64omo0yQg2P3gbqoTCMdccerTB6y1krEjLFdXsE=;
        b=zzrZYS/g0SzXvOi9XB4Knmd34m3qsubZJCuwxBahbCvOu59i1Du6Fm3eadSF8o5WPh
         xuxPJKQx4K2YrNV869XNtg+hhMMueuU0bdhzjpHhimHwuua5KhB6Qm6C/gfAb1wzZh2G
         0UB4Y/eD6k8v5d/WVwsuzyPdh6o2d5maY8goDUoVfB29iY+LWM7sy6FhXbXExQf8eoXb
         ely9plWtCi63jyC18TCNfBkwasxhHGkYqM9IQBFDaNM3lYoINkioH2VNnzWBwhlHOMov
         BDz6kuxnbDsXXgmC8PZS6E12uYk2PSX3krl/untdFLkjb0vk8+YJCuUwOhk7y35CnXqk
         akcg==
X-Forwarded-Encrypted: i=1; AKwUvBz6OFVDbvmAXQoMT6F/jEdcWs2B+xiXyUGmrXnbmtCrf6ycZ8J0jYhFREasQmD40e3ISufV0jCguXWbN70=@vger.kernel.org
X-Gm-Message-State: AFuF++l5355xFFXaMhImAyJ6qYh2ohJqNgpXzDeu2dkNGom2YITIqlw9
	A72oD/EYc0gCxiERQ799Hk4ACUDaRRGkVbCQq8ot/2K7jPxVsILrcRQ/a2iBz8MGDQo=
X-Gm-Gg: AYBFou1U9scp+MMQDWN+gV38oJmY0IOXEjpB2vxlRd5RYj1R0GudEuCpVeW4JPSMnSC
	Pqh2G9OF8xUJtlWr/XSKG0K7i8Qs4PVYEqogx03TdBRROQset5XRNVwpf7pBwIsqFXWqS3SGwWa
	opohxsX4O15syBrEhv+dRs3I5f7iTsJIujMtyXzgQz720boyKzdNeCtt4zM/B+rlnA2ZPVaorP8
	KGz88A59FQXV/FycyFeoNrlVhgBw56w7z7TuW6M0lwNZJY3HttnJdJ0f8xL1ulaB/DGcs/SxZ2Q
	u4lWt400nKD58qaC+rFnfmfu+KVaunpIdNpm2ALD4Y6lUU9aKRfWJ85oqjx/lyIWF2YRqkswp4o
	k8MVp1uZFB/POWyllib4yxXZKizigY3K+Qx+zelAB+zYmmD3dsWSAAqNIFulDWPYjnE9IHqbtgt
	PRalWG7ScYQ46xQQ3mhqFJBQMVu2G06jUVakUszUZM+Xz2pozXbKVzUwJUfqo2L40nQT1teDy/1
	dYMSgxRa7QZYg5QgCU=
X-Received: by 2002:a05:600c:1d28:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fe66fc677mr46599505e9.33.1790255664029;
        Thu, 24 Sep 2026 06:14:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm111837945e9.3.2026.09.24.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:14:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 24 Sep 2026 15:14:15 +0200
Subject: [PATCH v2 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-topic-sm8x50-iio-max34417-adc-v2-1-9a0609e72f5c@linaro.org>
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
In-Reply-To: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ixkLfsi5z6rhg+8XtIM+rmsLjd0FiwPrlwpSt0GJlHk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqtSIsRNXKx8hrQxj/AIgbysRUPujHdAXL+fL4nbKy
 cX71SS+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarUiLAAKCRB33NvayMhJ0cdYEA
 Cael6BBw4+XxJp/wnjhttyN+iiraV5CxPTwT72C8ptxer4fHnwhG2PuZgD3DZZQYRKUPWYxuBsWLd7
 1+T5WPFMWGSfsf9oDSL4njspjGZTbAUiYHhd9GaEI6SlFChnggRYVaelvwGjdCUVuQlRBCFGhrIZ8d
 wyyLQO4NGe6JxBVNOWTBjE5ArfaNoHfd68UasxWGPAy898U2PaQQ8VIvvgZGAqN4HxvfqpfJgELCrx
 iUIizbPE9dTAzP9G/aJgkez9MbXLOpSEiNj4M16ElsVF4RpWvi6KQLyFBw/UVh/nnMlSWGlw/14Yxi
 p826jUbEgcg0iBlLSLX6RJM9HXtfZ1w4316UhN1SGLRME+CemrHIUy9+vRIfD2rV8eKICUlHtm5FrF
 cWQ/QObmjoSWPabUmbNl+5Fp2lt3krGISJvxSaRvm46ZZ1GN6yWWATQEdtbUP5Zz5MdEIILQZPpsTU
 h8Ovj4FvccOxvyXhzGKjCvW4xGDXEPVab4xPTooBrxhFjfrgJeGT3jVFtJLNeimtQWMMo5fNtC5EF4
 2AFqwszcrq9ACvrqUH1yIturXDvFWLBvePoLt8ZMB6smQ5aBEARaRlPkkmI2ayu5yB/gbQhMU2rDny
 z6t+X8jOou9EYvD0z7njIXLhOHuuJRgA8PXDFCuYVDAl0kzr7teZElFnsyTg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/iio/adc/maxim,max34417.yaml           | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
new file mode 100644
index 000000000000..058af61cc04e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/maxim,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX34417 Four-Channel High Dynamic Range Power Accumulator
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  The MAX34417 is a specialized current and voltage monitor used to determine
+  power consumption of portable systems. The device has a very wide dynamic
+  range (20,000:1) that allows for the accurate measurement of power in such
+  systems. The device is configured and monitored with a standard I2C/SMBus
+  serial interface. The unidirectional current sensor offers precision
+  high-side operation with a low full-scale sense voltage.
+
+  Specifications about the device can be found at:
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max34417.pdf
+
+properties:
+  compatible:
+    const: maxim,max34417
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vio-supply: true
+
+patternProperties:
+  "^channel@[0-3]$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the sensor.
+
+    properties:
+      reg:
+        items:
+          - minimum: 0
+            maximum: 3
+
+      label: true
+
+      shunt-resistor-micro-ohms:
+        description:
+          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
+        minimum: 1000
+        maximum: 100000
+        default: 1000
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@10 {
+              compatible = "maxim,max34417";
+              reg = <0x10>;
+
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              channel@0 {
+                  reg = <0>;
+                  label = "ch0";
+                  shunt-resistor-micro-ohms = <5000>;
+              };
+
+              channel@1 {
+                  reg = <1>;
+                  label = "ch1";
+             };
+
+              channel@2 {
+                  reg = <2>;
+             };
+        };
+    };

-- 
2.34.1

