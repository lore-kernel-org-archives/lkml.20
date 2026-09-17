Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DFB40DB5B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625404; cv=none; b=ct7/yXxg5Y3gF6HiZhppWhafWgxyXuDKrfGAmdYwh3mkJAMbEoRBhMcvX0D643VnkzrKe/aD/xCS545Fhbz+1wQtvluiQbRqiTltDybetxv2u4AQxfREDM2nL+gPGRUNEONNsQXKuPBgUvumZr+4U6SrqQNHDBf9fZp32WghelU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625404; c=relaxed/simple;
	bh=gSgYMnuRUQemwYMm3QW+ALY8D/T4sdah7EsE+5pEX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCwpukntUxUKrHUbHm7gqmTz2WQjiYIFKc3GhZg8+CpW31xAb7OTWgUYYg52CV0u7MDRZnrQ/nyFv1f5P0YmkhHrvkvbzjAGsKSNhSKki9rFmSFZlQu9255/TifCQ4eO3aNJKlZ0mLTr0IQ0rkpEMyli57rnEQHKSCjwm8FYvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQGxNRsm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQGxNRsm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1580275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789625401; x=1790230201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewebXkNrJWhfTTXHIqMmBOFdCxAPRqRh9LeTiOeGWGE=;
        b=IQGxNRsmCJrhWAyCKcvLJvRVnp/Vr1OtDBl1RMlWUfjVXP50g6Wcc2LDzhWklBaskl
         UGnNOzP5WRsJKvStgcOI3wOYQ1y3fmdKaeWpkf6pQhZ4f58LnR4hrtWbkI+fYwZ0kqbj
         aeRG91Gjwb0B3RDamGNdy6/3FYAcjDsZF2hyi0bZa+qDU//fZDa226GXvCpb5PaJ6hzi
         b60qDxDnNsMVSMop1TYaRE001zcwxkh+zazZ3aO7tTmj1aOjo9fuSNbRe39m4LrWF1tq
         NsIC+6XRs08f40fMqthAAvXx+xnzxCZnf7AyuQ+A+dVy12bdVOPgrS3RWe/1NOHV9YNC
         lWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625401; x=1790230201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewebXkNrJWhfTTXHIqMmBOFdCxAPRqRh9LeTiOeGWGE=;
        b=q0CogQ9Vu/s26x4/XnYs290hNQ85nUE4AcLa2TKf/22PswwrXgmJviBJiRDofC07Kv
         ZD0Xjd3hHG5Kdem4blFiR51tEAAyIeXjMC+/zooJCeoMi6W5bvkUsU/ErlXJRviDZydI
         dNONPapcVoHqRh4cNntpuZUp+z/zenz6kHoxsIN8L7pbFu/kNiwOnXIdTQ3KZ30nOEvE
         rg62PTX1kj45HVecugXWyyUGE86dhc8jLRxeL7xc3NcOixdppKFtfQmM9dXevW2vgUU6
         nJiby4gi4c8h1xpLkV0FHpv55taHxSYbBjTFhoBygt33CTLApjxb7AF4LSrPolgfPtBm
         VwaA==
X-Forwarded-Encrypted: i=1; AKwUvBxEFMpWHKR0jcnWyiZwTMDu5TNK/cZlFhfyx5OKW4iYpp2mWQu2m7vNjQiJY94JOsRmDuxL7mxCWRcmjmc=@vger.kernel.org
X-Gm-Message-State: AFuF++mKMvps69wjjRlkzb/JbDojO0PC8NbEYEstItgqHWx38k3qZxU5
	ehA/tLge7UbuqYrf65Bf8t8G6pmXjIIaNpvO1AbRsB7VeR9Hxj04L9oZ
X-Gm-Gg: AYBFou37gdRGdo5W23WPhnOCM3+VjRSqMNmwIXowRGRKPW3dE3JZ+n/O0GKzuSeR+GF
	bd7r4O+1ujv8VZVRvMp6ZwZm3XtA9lLztc9MqIyEiTzPMiDxtBcSA8L2K+9g4aD4Q4Jws3mxIdS
	Aya7RmjWL0ZVjeXdetvDYL4T5LixmV7btTXoBxN8CbH9nXvp+w//sY1e4VVEtVo0XYvJVmu73IY
	fCMLlBzRIE8g1dA6j0VXjlDDyiT6dXtTiNmRP7YOtK6oKVnH+oqgKg8PtKboTPpNQ6AWxXV8sNu
	bPkOMrlQfbFXCXm6anpd599CcbjcD5PL/pmPizI5Z09Ye14hr8hOo2t+ZkA7zKm4c7pJIoZ+nBW
	CtIWUWNOJ7pUHILgCiCSoPqYy/LNldzD13/Pzdtwima0jLdGgB3CZ41g/+uDJVL+H+9NZ7C/a/l
	F3iUjTG21RyWjxtmkLLiiu1YTJkl+xFeoAvncORQDmr+h3tV7xaLd9WBNfiL3dNm80iLKr
X-Received: by 2002:a05:600d:849b:10b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fbd1af3c8mr19275045e9.2.1789625400878;
        Wed, 16 Sep 2026 23:10:00 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm81090045e9.11.2026.09.16.23.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:10:00 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: misc: add  xlnx,axi-fifo-mm-s
Date: Thu, 17 Sep 2026 09:09:48 +0300
Message-ID: <20260917060948.14700-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for the Xilinx AXI FIFO
Memory Mapped Stream IP core, covering compatible strings
from version 4.1 through 4.3.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 228 ++++++++++++++++++
 1 file changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000..f53b353cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO IP core
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  The Xilinx AXI-Stream FIFO IP core has read and write AXI-Stream FIFOs,
+  the contents of which can be accessed from the AXI4 memory-mapped
+  interface. This is useful for transferring data from a processor into
+  the FPGA fabric.
+
+  See Xilinx PG080 for IP details.
+
+  The Linux driver currently supports only store-forward mode with a
+  32-bit AXI4-Lite interface. Cut-through mode and full AXI4 (non-lite)
+  are not supported.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi-fifo-mm-s-4.1
+      - xlnx,axi-fifo-mm-s-4.2
+      - xlnx,axi-fifo-mm-s-4.3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: interrupt
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: Protocol of the receive data AXI-Stream interface.
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: Width of the receive data AXI-Stream TDATA bus in bits.
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_CTRL
+    description: Protocol of the transmit control AXI-Stream interface.
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: Width of the transmit control AXI-Stream TDATA bus in bits.
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: XIL_AXI_STREAM_ETH_DATA
+    description: Protocol of the transmit data AXI-Stream interface.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: Width of the transmit data AXI-Stream TDATA bus in bits.
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TDEST width. Ignored by the driver.
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TID width. Ignored by the driver.
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AXI-Stream TUSER width. Ignored by the driver.
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: |
+      Memory-mapped data interface type. Only AXI4-Lite (0) is supported.
+
+  xlnx,has-axis-tdest:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: TDEST support. Not supported by the driver.
+
+  xlnx,has-axis-tid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: TID support. Not supported by the driver.
+
+  xlnx,has-axis-tkeep:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: TKEEP support. Not supported by the driver.
+
+  xlnx,has-axis-tstrb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: TSTRB support. Not supported by the driver.
+
+  xlnx,has-axis-tuser:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: TUSER support. Not supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of the receive FIFO in words.
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Receive FIFO programmable empty interrupt threshold.
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Receive FIFO programmable full interrupt threshold.
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width of the AXI4 slave interface ID bus.
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: Width of the AXI4 slave data bus in bits.
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: Whether Xilinx Parameterized Macros are used for the FIFOs.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of the transmit FIFO in words.
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit FIFO programmable empty interrupt threshold.
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit FIFO programmable full interrupt threshold.
+
+  xlnx,use-rx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: Receive cut-through mode. Not supported by the driver.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: Set to 1 if the receive FIFO is enabled, 0 otherwise.
+
+  xlnx,use-tx-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: Transmit control interface. Not supported by the driver.
+
+  xlnx,use-tx-cut-through:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: Transmit cut-through mode. Not supported by the driver.
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: Set to 1 if the transmit FIFO is enabled, 0 otherwise.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - xlnx,axi-str-rxd-tdata-width
+  - xlnx,axi-str-txd-tdata-width
+  - xlnx,rx-fifo-depth
+  - xlnx,tx-fifo-depth
+  - xlnx,use-rx-data
+  - xlnx,use-tx-data
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_fifo_mm_s@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupt-parent = <&intc>;
+        interrupts = <0 29 4>;
+        interrupt-names = "interrupt";
+        xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-rxd-tdata-width = <0x20>;
+        xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+        xlnx,axi-str-txc-tdata-width = <0x20>;
+        xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-txd-tdata-width = <0x20>;
+        xlnx,axis-tdest-width = <0x4>;
+        xlnx,axis-tid-width = <0x4>;
+        xlnx,axis-tuser-width = <0x4>;
+        xlnx,data-interface-type = <0x0>;
+        xlnx,has-axis-tdest = <0x0>;
+        xlnx,has-axis-tid = <0x0>;
+        xlnx,has-axis-tkeep = <0x0>;
+        xlnx,has-axis-tstrb = <0x0>;
+        xlnx,has-axis-tuser = <0x0>;
+        xlnx,rx-fifo-depth = <0x200>;
+        xlnx,rx-fifo-pe-threshold = <0x2>;
+        xlnx,rx-fifo-pf-threshold = <0x1fb>;
+        xlnx,s-axi-id-width = <0x4>;
+        xlnx,s-axi4-data-width = <0x20>;
+        xlnx,select-xpm = <0x0>;
+        xlnx,tx-fifo-depth = <0x8000>;
+        xlnx,tx-fifo-pe-threshold = <0x200>;
+        xlnx,tx-fifo-pf-threshold = <0x7ffb>;
+        xlnx,use-rx-cut-through = <0x0>;
+        xlnx,use-rx-data = <0x0>;
+        xlnx,use-tx-ctrl = <0x0>;
+        xlnx,use-tx-cut-through = <0x0>;
+        xlnx,use-tx-data = <0x1>;
+    };
+...
-- 
2.55.0

