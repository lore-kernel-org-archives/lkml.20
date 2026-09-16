Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4444D37AC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589591; cv=none; b=uW3srpiwN2lZReOQC9yMZFHuDFjA3vQQ+YyvE1TJtSl1r2WiJCdn9UgcrMejP/23zRW10WTvzUNJD3khpe9izVKAGo78/pYGpqgMGVaDu374snykBXl6E4+s5Ng32JTFLtVxFv7ExSNVO+bi3UEUv6Vun3T2xBs95UReirjA/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589591; c=relaxed/simple;
	bh=uwMGDDuWtKUoJStwXibNUSxN2BNOlX8rRHbGS9jiREE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eSM0CZpqXAZBlY0T6N8nGXtTjMemI4SjmHz3bE5TgVxniaiYGxa1rzViZ1EVoFHCe5sccxgBvea9Iur483Ixvd2yM5KRXRvO83wBthw2J8LYAz4fIw2ht/01vI4xCPgKahgP4MSughUAqOmUAi+5AMGP08WFjpYx5D0b4nlUJc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5lErooi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5lErooi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so626135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789589580; x=1790194380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=X5lErooifYQ/zgsKns2ujeL1r78+zZ+5INEaP/H2FeQN80Ba9NEQCxUdjT7lTmGXGg
         ZtBM7ZfBNWGdYuboIel5WRHDoc/htr8WQsEou6r381Z4ynhwWfUCE6tn8uAL1FaQoVWj
         Rh88IRdGugn8eu7ykHszgzhVo+8h6rPrYVsCEqpV+1NVot0QzWdlbnC3Bh9bqXJzT+8G
         GpEznnaIJUAG6upNB9ebRyaMZUGTSzRjvWMpvFntMWvDtXWyYostuIZV2ppAA0RdArPs
         VsH49uOMi+Os7J8Z9QrppJZVy4Ap0oZB/N5+mA11FTv2bnkSrzUYZVc0yQmztNgySvIJ
         xN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589580; x=1790194380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYhx8ZxTsScYWYyqDbVe9Rlssw/WyreTZuU/4EjcUrc=;
        b=qEWwDyOS4hLx/NRuGV0MFxYeCtBtnOcaxfqpXh9FSRywBwhmR4hi+Yn2LvnagfbF9n
         wmdGx/Qaa7dmxeOfyqq5yfVDJnRtv1KrslzjDZldO82kcAswfnNlG07YZt8nrKPqSZPv
         TUESAPk5hmT6JZ/4tYUAYx/G3WkkRy6aYa/WBMmvFXjd+f4BzTc3mZYBytrMjXks1uHb
         kQ0gt9WaKnaxqVp7002YbEU8hAkVt3O7LM4OgN8D40uvtJznDpoWqWFBXYVllV7EkiYm
         lVJeTdSMcp4VaqC7wassPpEpjFXltEb3v/o0QL5e1MDO1eOHLlNPJzeR16MaFNqSyiDj
         dvtw==
X-Forwarded-Encrypted: i=1; AKwUvBwI8ZRLfyVW/Sp57cKr9+D73YvOJebKi7g+gWxPYU7HmI2nfzIUYVOjL9grgZAteHJgTPjztYsSqFyYdjU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYgNA3PIANTrf5hLYWGNTRANRJKG27jhrB1GTQT5Ut2q0QtuBK
	WDPbn6cblGnWd4cnNscpxcFOaQSK5cGSx8bQ3H7D0V1+JRHIv9j8ZL6k
X-Gm-Gg: AYBFou2SqGMRvv2IH1miN32BM+M/knhVOaLFwcjdfLSkRPit7YM8v7kh7ohiboaSwlM
	Phdb0k88rKkfraUZfdRvoCwxd0VkaJkslEoFM9Mfo6EON2MgEkmbzHBW/BxJtJoY/zo1oRcxQSe
	kbyOGA2Ub3+xyX9PN8LZN66xcuOgRX0f1k0wRSQLydghRm0sB+M2N7qY9ksferJV5UZL7Jhp5lI
	pTpxrBwW1X0oK8PIas4PHLxpbMjbCteOpbtSs2mzMaHbV1bWFiMRZd69FNrqj/x2AusHrvmSgmN
	oqa+m9RGkF1Id0GufqfirvpTBZUucEhQd+kbQ2ppcJUYRalNs0FGVBQsVzrTPQ8vyjJtVfiexHb
	rNkS5XXsksCc25+qa5gwYfzoZaRBLbbDQC6U3LKbVas3KJlHUnZJQTx/RUOdl/XQkLwGW+IKqw2
	wqTzBYLikFsBPQAd74aEgSqbPyvZIg1lv6l/vB1erB7z3EEFp5jDyhjh6ne/u0C6s3gJmkWfWE6
	/2UhNOOCsz0GCDt
X-Received: by 2002:a05:600c:1f96:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49eb51902d9mr45307715e9.8.1789589580117;
        Wed, 16 Sep 2026 13:13:00 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:ce1c:cd76:6ea7:d213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm5484125e9.0.2026.09.16.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:12:59 -0700 (PDT)
From: Daniel Matyas <matyasdaniel005@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matyasdaniel005@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] dt-bindings: axis-fifo: Added missing binding
Date: Wed, 16 Sep 2026 23:11:50 +0300
Message-ID: <20260916201253.483877-1-matyasdaniel005@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/axis-fifo/axis-fifo.txt file described how the
devicetree of the driver should look like. Convert it to .yaml file.
Issue found by checkpatch.

Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
---
 .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..ef1e6bcf782d
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
+      - xlnx,axis-fifo-mm-s-4.1
+      - xlnx,axis-fifo-mm-s-4.2
+      - xlnx,axis-fifo-mm-s-4.3
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

