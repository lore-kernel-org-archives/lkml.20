Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882575;
	b=q6xsw6M/K0bKSfHkobFGBuZnLqgrP1YItybf9PINc+9ZbndS5icX3qkBKZxtR7Yd0dI4
	 z5vFmX4T50D/LbppvgnkDsgQXh307R/lHuO1iGVZaJLamIIbJnx/wUqnvKJ7En/fr8L37
	 PSZHc7NAi3tgtDKtz3fpTesxP1vBQGfpJeC2D2GpPDPzItW/2ohety23MPLw+cnwLxEm6
	 H8bo7eoke+TvO3gNbIvQ4DPre5MmGDeL/To6cfIUEtBM8yHgFQ4HmpBNaKU8ijOP5iPAy
	 /oz/UtuI5BqbJ5ERRj7Kox4/RIs8gUkYk3EfmUDbjzm0smhBQ9pcbrDz5tNmBVHi9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
	b=wKbb7oAhZpKK/kiqfRMQnXd0CHJNs5QmnlMUl5QoDdSZaud/s9ZDURUrKotVYPPklcyO
	 jzxZP/Ll1XIBlVBNZVgP9m6MLKMoLWSq420iknTnZHtYUnfQw1F878b0v4nMH0+FfsJqi
	 SXVlIkSag1yQIcLc+c6auHrEgZ8Hp5kjDgaI2G7RqD5WCk3vPE0cGgWqMeDWMkdTqH7iO
	 mQvPybYiO53KW3Fj+8mposv4v49X+oDtIvvEUNRQgOt1GjnsjwGjMK9OQmBrOaXaLhVoa
	 Jm2jJLhTpUtl0NGjc0foA0p0vZOic01ukSwcPJht/r2hfLLxMzMyf66Qxsr9ummUV1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kv3MlWHi;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238C6082BD3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3238C6082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kv3MlWHi
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6536535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882573; x=1794487373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=Kv3MlWHiv/Pi2yYZQ24WH57pIgU+4rYl6XNaf8k9PCshrsKUqoSpI43BBg38WQJG1r
         f7kKmjbHuB8cMAvCPqBki02n1awpU/sgIxa7ZFAPRr3zMZ63688UkIbAL5PNkNUeGFFs
         AQKxCpD5Wii/STujUsXpGtCe+EJHWP2b8PxT2DChfD/rAI8NcZGj/t9oY5424pQ8wZ9f
         uj3qm4Y5cemH8OdKURbiG9A0df8wSGdfHL7OJ8sXpFV7AqF4NNjq16swlalGL1h2a90H
         FSltisQ8J87JiVejGoILIMqvEi2klOg2+VOcT2rOgnmHwqvnkMpwHl2TOk5AWkQzwj7u
         hX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882573; x=1794487373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/diyqg7QY/1MGJvSdYZlxv7HwRgm18oyLDb6CPRKmRg=;
        b=IltI0yq6Mdv/T4WD7S+mhAGdFJ5Gl65++rWYZuPXGTQa+OlUj12IIbHPRBD5yvMmFJ
         aDmLS0H4xscvjwezvteC5D+qxsbtoRDEW2kEaPdLP29RFjEIUxJIa7c+tzznuIMkpvGU
         mY5P9weGbEklOjRNcb23+DPDIDH5dw/DsmXkMVdOzR8xCajSi0ui58+iAJJE+cQga/Q1
         N4fgoF1M12ZWEiTi3Rahvt5zI0jYL9x0nO+LS0xoGWhVu7O0YxUxaYyUGKSltTlVMANt
         6sZYvvBK3YTcoLBBT9DfmBSj64pVkh0HN0A5uXjesXpepbzz4tOyfUaLkH3Nsy5GbRTt
         eTMQ==
X-Forwarded-Encrypted: i=1; AKwUvByJnflZJacH46Trbg0jc9YUe5hTgQSjMhj7SaJ7pS8YKs9JkViTjSvfJzyRj4dkGROhTWhaV5y5EJf0Dqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZIlNoJB+DYdGBo4a3pDI87PFtpKjIsxGmAaiLp8nLooDrl/vl
	xGwXITVI8iDD093tldVxAHoRYMT/fifJlTz4/blEMQPC+V+wAeW4xgG7crMVm/tIhlc=
X-Gm-Gg: AYBFou3PowKXYv3NwOqFXj2C1izmfenH5i7fwGapadRCpzvLb6lkSKCesaCWXi9MgHu
	WgL7XKVHcA8FhDvhCvpNlF/2ypIE7S4uw43BcOdIjWLLbIuhN8IcoQgcaz8CjjDeMxVOSjhyIE1
	DZa9KPi5eg0ae4dERBYqJ319SlB70KwYCwtOcPF+FnV8pMqPx/VvhvkGv4rHdx9ZqgG4AqrW4s3
	m5d1KvT/7nfa9qy+tW18+hOox6LCXkukDRnbqbmARHBI+YatBoHXq8iGFaq8UaGptTgjnJZg0so
	jrxztIY3mmF17ongqkx07JnFybqwKPLw6ITHd2CHG/iegJz3JwZAtET3qcu4u/ZxHa0vnYsWq8C
	U4NZOjlwYEWKREXppU7fH/v9TLvX/sXTbrbmBTEN5J77vdF5sBTZtsW8fOaO1k8S2VEY5MpLyUE
	2t1qIMnqfjk/oln46aZ0NDxhB+Mrm/aztHXtXKmUvqgd1i8Ku5CGF6GMKCeyTUMbCVu620hAUqL
	L+3RF8q3niruj4d+6CvIVZuzzjITbEX/xtCpjtW2mzDxrkLThKWasagUKWDPDY0tREqt6UpqeyV
	9N1Cm710IOKbLT2fsyUOYpYf07+cqldEqSHmfJR7yDO7
X-Received: by 2002:a05:600c:34d2:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b55e07e6d5mr43391015e9.16.1793882573382;
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 13:42:46 +0100
Subject: [PATCH v6 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
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
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-1-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3254;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rt+RNgD7W/568mSoPzZilfLHyJVHF2C60dxHxMFmmgI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnKPcrukw2okC9t8mpexyXqI/3FLXbirVbNr6b4
 t+eHdZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ygAKCRB33NvayMhJ0Z7ED/
 9idBXRdH9kFNiTN7/6IcrnwX4NtxIWgvEr/hlO7fCS2EAe44in6EfkeRVYFr7PH9lyHqZEfwfkvJZr
 qAdc8+9/cgYYfoEGBUpexgW1+LXFACC0IO9jMXbNvYboGo5rJMEFyKsUoKKcyUgy6Y0xEmsrw5Wbqj
 n0wE1NZCP2FlnjMXBIcfh9adX/YUn3D2kWcryvrqPKjOUaUfRs887lFwFHFdDbrjJ0G/JvORF9vCn7
 6IEF5yqcBY1rX3A7LVgAximQZWuGFfrO0IpbbIGuq19dK60XKzSuhlaiUgKWfYAMUBf4obICI6b5rL
 xwUbwEnCClpLkcEUCrN9iNZH/1eSNfuwrc3loSC+aX8dZZE8vJuRWCFSMNPfTXd2m+VF1ctEyXfVUE
 TTjR5M4OppC0THcNaPTJasNVWY2wfyFNoVO5q4hwk5GN8n0Z0ZVTc+o0tbdPWuciQwhZLqspMsObFw
 RWAjNwxdV3LZEBldswAcSinTZA4voubn7oaU6MD5LZJOFhbwPQB9aTnM0LpwHLzRqQBqW3n7LekvTk
 qAzJCjep5m+eIEvzIhztJw+lB6E3SBLKdjRdyAaOewD8F2QKuKHp6GcQzD36iiP0ZSWsDOFr5LfflI
 tGj8RmmQchAO+xj4N8tDxpHUrOoRZWBQXJTH/aW4kcJx0KUwXJ9TpcPL6Fjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
Accumulator used to monitor power consumption of portable systems.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
new file mode 100644
index 000000000000..77934a9baa81
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,max34417.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX34417 Four-Channel High Dynamic Range Power Accumulator
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
+    const: adi,max34417
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  - vdd-supply
+  - vio-supply
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
+            compatible = "adi,max34417";
+            reg = <0x10>;
+
+            vdd-supply = <&max34417_vdd>;
+            vio-supply = <&max34417_vio>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                label = "ch0";
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                label = "ch1";
+            };
+
+            channel@2 {
+                reg = <2>;
+            };
+        };
+    };

-- 
2.34.1

