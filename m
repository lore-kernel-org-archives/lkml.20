Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52F4D795D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645869; cv=none; b=ucSmb9VKYaIT2jN+UiDA6RGmo/d3lO2DsslVrSFJ3pt5RQll6qLAkoRv1asGY6mOrka+nqtNMiAojz5CuhFf0JZZX4S7SfgLKxlCV4rdpek51681wCosfJ8+ZUshFgxfhqhM4ujgGWJiaBit9ymz3TstEpc+QxZM5eQb+4CaSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645869; c=relaxed/simple;
	bh=JuqewGusnN29lnaA8BKoBchfAndBqWAC65wHCfOv0iY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b3UF4/DzYqblwxslxgjiXKxK/Rqfb5MxNYTMIzud0v/VJAU6oqteG3FqZTCoUe0PnbZ7ZsB14tLu1TrnDYb/O0zSVYL5OASkP/seUvSZis8iJdah9eItJE1rKeREc2TVNxwRncgwOfJNSli3gNGyk45PYY2g2fNR02YuxQdixho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZRK2Myc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZRK2Myc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so4197785e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789645858; x=1790250658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnjrFm+2KNscvPYEzI2pU8bKMiDbn1/YDONFcw5anLw=;
        b=UZRK2Myc4h+HJHG4jI07vCiOqTxpihXmSxnJOyMbRmWLm0krksoSC+O8Os+ypxvEuY
         vZ7F4vuyCJdBJLIEzw4+t3RMhYAApAz8cIygtMqZ1EV54shbEoJ20DoUkwVenizrsMgD
         IQIzHZmYlUvfUAZn7e2X0AX4RREmAUhnjQhzUwdITyUTPnoy4sSptQ7zBZmbK7qHKvpb
         N4Nc7is3Ebmhwv24Jf1OJoIKobMXx53G0NHcJGVYPsW+sq3Vz5S5ZgCfOZrOLaXZ4qI0
         +vC6gMac0CBds0knAObdAZAm7Y41GJN5Nn0boUN8V/ulrFJ4Vz0PIYA+rEc0izdTfmaO
         +sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645858; x=1790250658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnjrFm+2KNscvPYEzI2pU8bKMiDbn1/YDONFcw5anLw=;
        b=AiqTjaM7+51cvoEup4DDX+DHpeErgHNMA+yI/Y1wczhJyhnn1CEZ5gLeN/FRS/xdbN
         gQ4M+ksw+oSUFfMxABZGQ6bZicnGX2is+eFbCf3MmNEcrDMv7UgtNkMeNvZTZqpAFVsS
         yXHjFKBoeE1DJh+8ISk/Wk4nt1ZFB9u1ns9lTFXykptlnw5j4bMFwityBwANGb/AjclG
         ivDa3KSegH82VwQxsBAkgkOqzbeLCw4Wjt9idG1LoL72f3jB7t17M7tdjJ37x+VCvvpt
         tDleXj/flLbVwprYsS9nsmGeKGf3U4SFB3E4tB7p5Q7sw/h77Fx8Kb8CVZxqrZZ9dapA
         PK2g==
X-Forwarded-Encrypted: i=1; AKwUvByDDcUM2wD/9z0P5i3DSycvzKY59y1oc0DGLxWmVcP8xNyb1dv/KdU4Brkz6wNhkey+D+LPBczAmV/nX2s=@vger.kernel.org
X-Gm-Message-State: AFuF++kVEviLBT49Z48a57v1Vtq20az/0jmxwahNCmaiQ6f2Eqh6TkVA
	ygMYyzXmRGWqo79K0aH9HszP+lRi+Fcl7mNq1Oyoj5nqk3wn4lv2OP1lXfi2sCr87g8=
X-Gm-Gg: AYBFou2w8JhG4s4tje3kf4TkrnPenRyh79M5i7bw8P3S1rYbLFTRHO/mfVnroT4IbIx
	YyTvIR7W0lr93fBN1qfQh0AK54PEkWoCKaBc06zmqJzOHoz9qW4L+L8Wt0rh1vG6rdu0XlLWvsX
	16LgZIfGeWh3QlxAbcsdsK6h2I2X0L8GuZ4Ys+WFsuJ+xy0PhScCHE86G0xoJLHZzeq2YKS+snT
	LdKByWb4Z5C1W3Acc/F0gb8I698sqoYAKTUX7tsibk3+gbS+zEPuexYkwOJpODqtiZ3/aaLOqAC
	0kmMmNiNafJvjCmj6eJ9fj1eLV0grof+TMgK5nuWzl488yhttjPrM9lY42NabtIXsXRQQTbnZ5l
	pZq4X/dORmzA1xKvRXTlNd+MpuZfOqYxmWCkVE/SNF1kKsh2FBlNCw9J/MQblhQ07W8sqaUzYJ8
	nUNYjVFQWfTpPwW0SAQatPMUoYa1DtKR3TVbYXXv+gnkQqVxzdrkaUzQWwMlc8llpPwQGNxRZaE
	U3ayw==
X-Received: by 2002:a05:600c:8b58:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49eb733e3b5mr77934835e9.31.1789645858013;
        Thu, 17 Sep 2026 04:50:58 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:44c:8311:3d26:e514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm79522125e9.0.2026.09.17.04.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:50:57 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Daniel Matyas <matyasdaniel006@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 14:48:48 +0300
Message-ID: <20260917115023.292302-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Matyas <matyasdaniel005@gmail.com>

drivers/staging/axis-fifo/axis-fifo.txt file described how the
devicetree of the driver should look like. Convert it to .yaml file.
Issue found by checkpatch.

Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
---

Sorry for adding another email. I got locked out of the first one for 30
days...

v2: Corrected syntax errors in compatible:
	xlnx,axis-fifo-mm-s-4.1 -> xlnx,axi-fifo-mm-s-4.1
	xlnx,axis-fifo-mm-s-4.2 -> xlnx,axi-fifo-mm-s-4.2
	xlnx,axis-fifo-mm-s-4.3 -> xlnx,axi-fifo-mm-s-4.3

 .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..e1b46a2a4b4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,257 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/axis-fifo/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO v4.1 IP core
+
+maintainers:
+  - Daniel Matyas <matyasdaniel005@gmail.com>
+
+description: |
+  This IP core has read and write AXI-Stream FIFOs, the contents of which can
+  be accessed from the AXI4 memory-mapped interface. This is useful for
+  transferring data from a processor into the FPGA fabric. The driver creates
+  a character device that can be read/written to with standard
+  open/read/write/close.
+
+  See Xilinx PG080 document for IP details.
+
+  Currently supports only store-forward mode with a 32-bit AXI4-Lite
+  interface. DOES NOT support:
+    - cut-through mode
+    - AXI4 (non-lite)
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi-fifo-mm-s-4.1
+      - xlnx,axi-fifo-mm-s-4.2
+      - xlnx,axi-fifo-mm-s-4.3
+
+  interrupt-names:
+    const: interrupt
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream RX data protocol
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream RX data width
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_CTRL
+    description: AXI4-Stream TX control protocol
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX control data width
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: AXI4-Stream TX data protocol
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: AXI4-Stream TX data width
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TDEST width (ignored by the driver)
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TID width (ignored by the driver)
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TUSER width (ignored by the driver)
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,has-axis-tdest:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tkeep:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tstrb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,has-axis-tuser:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of RX FIFO in words
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x4
+    description: ignored by the driver
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x20
+    description: ignored by the driver
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: ignored by the driver
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of TX FIFO in words
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable empty interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX programmable full interrupt threshold
+                 (ignored by the driver)
+
+  xlnx,use-rx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if RX FIFO is enabled, <0x0> otherwise
+
+  xlnx,use-tx-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0x0
+    description: this feature isn't supported
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0x0, 0x1]
+    description: <0x1> if TX FIFO is enabled, <0x0> otherwise
+
+required:
+  - compatible
+  - interrupt-names
+  - interrupts
+  - reg
+  - xlnx,axi-str-rxd-protocol
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txc-protocol
+  - xlnx,axi-str-txc-tdata-width
+  - xlnx,axi-str-txd-protocol
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,axis-tdest-width
+  - xlnx,axis-tid-width
+  - xlnx,axis-tuser-width
+  - xlnx,data-interface-type
+  - xlnx,has-axis-tdest
+  - xlnx,has-axis-tid
+  - xlnx,has-axis-tkeep
+  - xlnx,has-axis-tstrb
+  - xlnx,has-axis-tuser
+  - xlnx,rx-fifo-depth
+  - xlnx,rx-fifo-pe-threshold
+  - xlnx,rx-fifo-pf-threshold
+  - xlnx,s-axi-id-width
+  - xlnx,s-axi4-data-width
+  - xlnx,select-xpm
+  - xlnx,tx-fifo-depth
+  - xlnx,tx-fifo-pe-threshold
+  - xlnx,tx-fifo-pf-threshold
+  - xlnx,use-rx-cut-through
+  - xlnx,use-rx-data
+  - xlnx,use-tx-ctrl
+  - xlnx,use-tx-cut-through
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
+      compatible = "xlnx,axi-fifo-mm-s-4.1";
+      interrupt-names = "interrupt";
+      interrupt-parent = <&intc>;
+      interrupts = <0 29 4>;
+      reg = <0x43c00000 0x10000>;
+      xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-rxd-tdata-width = <0x20>;
+      xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+      xlnx,axi-str-txc-tdata-width = <0x20>;
+      xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+      xlnx,axi-str-txd-tdata-width = <0x20>;
+      xlnx,axis-tdest-width = <0x4>;
+      xlnx,axis-tid-width = <0x4>;
+      xlnx,axis-tuser-width = <0x4>;
+      xlnx,data-interface-type = <0x0>;
+      xlnx,has-axis-tdest = <0x0>;
+      xlnx,has-axis-tid = <0x0>;
+      xlnx,has-axis-tkeep = <0x0>;
+      xlnx,has-axis-tstrb = <0x0>;
+      xlnx,has-axis-tuser = <0x0>;
+      xlnx,rx-fifo-depth = <0x200>;
+      xlnx,rx-fifo-pe-threshold = <0x2>;
+      xlnx,rx-fifo-pf-threshold = <0x1fb>;
+      xlnx,s-axi-id-width = <0x4>;
+      xlnx,s-axi4-data-width = <0x20>;
+      xlnx,select-xpm = <0x0>;
+      xlnx,tx-fifo-depth = <0x8000>;
+      xlnx,tx-fifo-pe-threshold = <0x200>;
+      xlnx,tx-fifo-pf-threshold = <0x7ffb>;
+      xlnx,use-rx-cut-through = <0x0>;
+      xlnx,use-rx-data = <0x0>;
+      xlnx,use-tx-ctrl = <0x0>;
+      xlnx,use-tx-cut-through = <0x0>;
+      xlnx,use-tx-data = <0x1>;
+    };
+...
-- 
2.43.0

