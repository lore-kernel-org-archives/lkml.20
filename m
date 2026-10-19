Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436502;
	b=PX0KaVrecmTz9xR8bQeBgCq8IG8nZCudot4d0MCCV0R1/W1lB1UQJhG3uoP1dq+3uxha
	 8kC7xa3FF7XlrQ89iKh8p42myqudzbzsPPft59vKzJlQIoZzHv93+lRRGrC2ssSH9jVe5
	 8puBTveUFDb9olgehYrWIraKNSkNFbVflxEEhpQzNjhCke0AmYjOykdmA/T9cBpaXK3xo
	 /Vvz+WxPc6KSYSaLbTpWfvuVEbIXlNZah2i/UQb3FEnijtxcUAZr2XKCANJITiLukg1rC
	 YJmB5KJ4J4atktqWEcp4vPfbXW4aLz/g4ZPeL4XPdRG/JXf3TAyhT+j0zxPuzpZk30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
	b=30EUaD8gnLtNCv0I4sNNBw8x3f7/cpRE3FqB9iNshoIN5XXlBPuGU0XdgdNzJNfRErKj
	 ta4waOSW7oaUViWP9FPrYpUAnTPVJKoOf7PZad9imTpN8sG6Kv4iozWlfm57kQtd2QmQ0
	 17YkE6ZJZJflfktpY8Sr+z9qKwu2qdlVCySjCeb3SoNAGAI7gorwh8JPioZTvJQZ4l7us
	 SwCZgWaK6E+H6MulQhmV964EtYbr/dEs8vY+4jkiBvSRwilWUdfUMAZFFiVUMQsAM1dlI
	 YWDrkDekJkDKX02KnIEbjWz/U/oLLNpRd4p3w27J7D/TRxcrRhl01jE2tSjgAVg5x4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OAPsQlG3;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A28260A3838
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A28260A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OAPsQlG3
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd76b1361dso68055ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436501; x=1793041301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
        b=OAPsQlG3DvMjo9lVJ/3+sVyF5Ji6NovFNVHNGpJUCx7Pe0zC/JdG8RU+ASnlOLxlg1
         gc9SF1xU7mhmeaP2lXBc4t0GgHBQMzGslM8IUdQWv5wRv3cu705eA7Yujl/AVwZNHDWx
         4CvM/EE10gI4tas8t4P2zZXFylCjFlSa0D8qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436501; x=1793041301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0ffJvvgOrYCYreXinduE/MSyfEkUTiTaHiJcqh9oWA=;
        b=IgO/3qjUQLnKEaiTUU7vGqc49BwZm9PBcF33rqNFDLBspu6x8DcZC+sWOGqOG5OxUU
         n/oIWeKtuOK2P0TZ6RvSjVsce02yzKTqVYilQB1hi5ZjsF2Nct38yv1h3AT4ZU2d4ojw
         I9SdZQVRvmcDlrwpMghu085ce5XX704rlQ4BB5fgaAm+qRnLrK/RfHnVB9ktEnn229/a
         yvSt7tCqjw7orb0qc8D5Pw40EPc4su2jHy5OVxWGNt2Uqmi4EpZ66FOadZB/QvZhibdH
         L2TNBl7te8YMgV0JJLzRAqAytjFFpNQV4jc89ak+ARDJylEoL/53tDozVYVvEqiF4Vlt
         IDfw==
X-Forwarded-Encrypted: i=1; AKwUvBzRvuJI4n/2emCnPrVia9TbgmaQHZtnhQNKz9+cE2cE9skEs2OvCuBtbF7C4yqs9f8fMqgLQFbo0p7Or28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRrAD4+w8hGIW1O9GLMrb2YZ7DN7DB+DOC5iE4Nr0/k5S13WGQ
	XMxPECU7QgwaO6fj7N8vRZVVsG3qHvI+queR7hYNZ5SDWzwl7EEmjRuNM7frvfMz4A==
X-Gm-Gg: AYBFou3zyDk7KfKYhHaEXugw8ADY7LZSaI9MwCJ495tOAmtTOSJsHRov+RMQN7xEfd9
	cJttFBMI8ds4i0tehaPhvfCsNT3AV1B/aFL+4fr4wG5yd0IPgrY4JBs4aPMlBrZMCiROVnlCLpU
	7g1u2F0pOIFow8qwZKveEZ4jL+gBC7guZCDxJLvDiT6SPYmrbarHx47vWCzFafRVNrZ+nEdTKZl
	12JPxAqJ/qGlIM8w9D/bGKJCpK1C6UQYyxBS4Vo+nti53xMpFe91Zu3C3nrsM9RF83lp/I5cdIw
	pZUrTZUNeekWy+g/d/lV/gTZ/IeCFNm6qz1aP4P/a9c+wEXoRQUaGJDVFakYEzM9q31/bZtt6o7
	1+hXYBcrl2+9xCBH/0MI5skA4fV2Ys++N/Ckw1PUdc4NSoO0/gfb0HuQ/SgZuVnwJ7vqt79ZEMX
	L18YeTZRa73gIgkDyQgV8iT64crPBddAibV8yMMWe/Sboe4nsYQ8LHAUasfZZtjd6JwZCSKiyvW
	4ym4vVLBSpiiRJi2wpYhX1q+Xm0AKRYKc6W1a796EnNJzYN9GTJnajS0AIJ0J8TEddJRe7dCdiB
	dZM4FNFkqCQVW1XL5Tie4nxLOd3HmBoeU/RaEL9ymrG7xX/Ng763dxxYfBvVggQ=
X-Received: by 2002:a17:902:ea12:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2e9a705023emr80598155ad.53.1792436500085;
        Mon, 19 Oct 2026 12:01:40 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:38 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:20 +0000
Subject: [PATCH v6 08/11] dt-bindings: input: Document hid-over-spi DT
 schema
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
Message-Id: <20261019-send-upstream-v6-8-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, 
 Jarrett Schultz <jaschultz@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=4977;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=3JV7SIx4Z2hhtNXaNrWUG27kANewD8ikLOOlV/xW+/0=;
 b=lIoWtzK94uJ2CVOcYas1knqxryWopuM6+bcWy1s2MFL43hSH7uhTVG2g2uPlgxQ4yidS0l0qV
 8EEWiL1+FpDD2WJlM4xKES4vF4ZWysNWe9oO4shLMegkzX5e2etMgEc
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Documentation describes the required and optional properties for
implementing Device Tree for a Microsoft G6 Touch Digitizer that
supports HID over SPI Protocol 1.0 specification.

The properties are common to HID over SPI.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 .../devicetree/bindings/input/hid-over-spi.yaml    | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..2a5fa0868a09
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HID over SPI Devices
+
+maintainers:
+  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
+  - Jiri Kosina <jkosina@suse.cz>
+  - Jingyuan Liang <jingyliang@chromium.org>
+
+description: |+
+  HID over SPI provides support for various Human Interface Devices over the
+  SPI bus. These devices can be for example touchpads, keyboards, touch screens
+  or sensors.
+
+  The specification has been written by Microsoft and is currently available
+  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
+
+  The HID over SPI specification does not define fixed values for the
+  read/write opcodes and the input/output report addresses. The host
+  retrieves them from platform firmware (ACPI _DSM), and they differ
+  between devices. These properties provide the same values on Device
+  Tree systems, so devices that fully comply with the specification work
+  with the "hid-over-spi" fallback compatible.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microsoft,g6-touch-digitizer
+      - const: hid-over-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for the device's reset line. The HID over SPI
+      specification requires a dedicated, host-driven, active-low reset
+      line. The line must be flagged with GPIO_ACTIVE_LOW.
+
+  vdd-supply:
+    description:
+      Regulator for the VDD supply voltage.
+
+  input-report-header-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report header to be put on the SPI bus. This address has 24
+      bits.
+
+  input-report-body-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report body to be put on the SPI bus. This address has 24 bits.
+
+  output-report-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Output Report sent by the host, listing an
+      address where the output report on the SPI bus is to be written to. This
+      address has 24 bits.
+
+  read-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Read Approval packets. 1 byte.
+
+  write-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Output Report packets. 1 byte.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - input-report-header-address
+  - input-report-body-address
+  - output-report-address
+  - read-opcode
+  - write-opcode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hid@0 {
+        compatible = "microsoft,g6-touch-digitizer", "hid-over-spi";
+        reg = <0x0>;
+        interrupts-extended = <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&pm8350c_l3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_d6_int_bias>;
+        input-report-header-address = <0x1000>;
+        input-report-body-address = <0x1004>;
+        output-report-address = <0x2000>;
+        read-opcode = /bits/ 8 <0x0b>;
+        write-opcode = /bits/ 8 <0x02>;
+      };
+    };

-- 
2.56.0.212.g129ede20d9-goog

