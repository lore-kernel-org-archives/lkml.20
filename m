Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BD37F8CC;
	Tue,  6 Oct 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286229; cv=none; b=NM34CE0jU1rLbTBjXezRy3eZCyml+G1Pziv3LMJbJ9ngrYmKhqNxF9/RhPVz7iTqGmBshPFBLfiYlGz4Se+GQawikzPU7LqbtBdABlk+Fq6Yk1R1XUbfJS6V1NuQxzFXWDspIEcm5dvZK7+ncHvp0okorfgo+QnEWBbS67X5mho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286229; c=relaxed/simple;
	bh=gsk756PD5iiFHjv6OgXjw/zZXrZkYYMAKYON480JaU8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Cn3lGyjrz056ZNLNsbUd5kR6U6SkpJ+DRkf+ZOf4fWHsHL288t0U8Z/LjoyOyMs3RXXCXbzH3wiE6HC2/Qm6+oxq/KibQdGmuK3X4SKMd8hvUZDR5XiHjLuenJRV6VruW2xfT1PahnzaZBQhyvgLy5DSeXF5xtN/c5caUKmYWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cA6NFb0o; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cA6NFb0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791286215; bh=Kz5rBo4U6MoZRl3APwJ61VsjEfXQCYma3Aw/pcfN+Io=;
	h=From:To:Cc:Subject:Date;
	b=cA6NFb0owje5Fl4Vc5Qld9s3PxB8B+SZg3R9SljrPK8BunKc5iHfZQCwCHBuEaNLk
	 2/CaPfGb5AEwrYP1RGEbL0UAVkUn0cyoVH7VgsHk7yAjKTuFDon34b+KUe3t69hhf1
	 etDsPNo+VLke2jJ6ZQt6wwYnZOjbM9Rea5V5sVyA=
Received: from Amphoreus ([219.130.186.218])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 788B9EBB; Tue, 06 Oct 2026 19:30:08 +0800
X-QQ-mid: xmsmtpt1791286208tkrdig0d6
Message-ID: <tencent_517661DA7DB5CFD22DE073FD269BED407507@qq.com>
X-QQ-XMAILINFO: OTDiW3m6JtSJqOFJCQNegP9oyU6tW+KpbNt7Dlep0Th0j3FylZ8G4925G2LVGF
	 SxGtEElc0AtPAoiguaDpRDtgKCnbrE2cuVqZTy6O4glMIvcGEWPw4ebD1Hw82Q6d83Egi8w/6+Wj
	 RJ9e/BvWOxVHCOEwnTZbphQICc5GY8BLQ99KAZtdJDGjy945u2Hly8gPKxZszr4iN5TmyaL/a7sm
	 O6g8P4YSgSwqNHbiWJqH4LWd1ZUdblV4+IDACJu3VXiUR9cwSZD6L0hfOeJZb2doURlkbe63xZwd
	 tvGzILHqq74u++kg0ATjFFG2d34nJeYM+zIl/LwPG65Dn/z0seAh5da0g8R+oNdgQL9vnrtBoUMI
	 +8rkGv8eJcDD5jU0LzwPGnZYMla+OZQ+QtkgVNaNlrCM+nSiMLCQKO9c4QzRs2qqEQal3radluf1
	 g8Di+S/w/oUHBKyvv+8qg2SMOGlVk6lIJF8RDt/4lbj2M27PsYIu1u5bKrH2wR7gvacC/tI0yGRP
	 MuMMOXkTFu5RGVF9OZArPLynVYKa9bRplQRMs7kkRzAZohY8oOOevKSJN+2KjzQi2LiwaZ25L1Eb
	 RhZq9qzignevCDDKddLF8gu2WDVDTuLRgasx4w+4MYJMZKlg4pbLd00B8Jg1qG6aul2jGi3iov8N
	 rLH/g+y5Mrrb2GHXDAg8ttfF7B6RBflTk8wHFtyJscHPi2aw+r/vtp1WQvq59gpgmX2eOose8q5q
	 6X0Tv3c5jeNb5Lzb/Il5To18zWNK+xwWMYhPNuClPP7imrlxYrrKe6I45oHmkvaPZio3MTRzQZFs
	 5O/6NnbwiVg+kv5+08WbhvUh+HzUwuTnk0h+i89f+qnLoojlv7tGMM74bgh7n28mqUsabYBLH1VV
	 nAvOjxir5lFpIf/60rBxjLyHW9g2k70VJvV5Uj0BkhkgeTLnXmsDj01UJ2r4C5ZHcdJb1/rikWMB
	 YsrlnfiyGZ9DCuW+rtaC30ww6trIIzDSXZZTp1nyOxGes/eqbIbDsy2fonMxz1r6H1sZvBMk+cIR
	 N5d3OnAjOoH4Ic4I1LxDiFiVUSqJ7ol3tU2LLTWo2BMs2466ZhQTdEzp98b0pne03JmpOe5YsN4f
	 kdw8MV
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Raiden Lumine <2557597107@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ovidiu.panait.oss@gmail.com,
	jacobsfeder@gmail.com,
	Raiden Lumine <2557597107@qq.com>
Subject: [PATCH 1/2] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
Date: Tue,  6 Oct 2026 19:29:54 +0800
X-OQ-MSGID: <20261006112955.208744-1-2557597107@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver's compatible strings were undocumented, flagged
by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a devicetree binding
document for drivers/staging/axis-fifo, derived from the properties
the driver reads via of_property_read_u32() in axis_fifo_parse_dt().

Signed-off-by: Raiden Lumine <2557597107@qq.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..219a7de223cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,191 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+$defs:
+  xlnx-uint32-zero:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+    description: Must be 0, this feature isn't supported.
+
+title: Xilinx AXI-Stream FIFO v4.1 IP core
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
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
+  Currently supports only store-forward mode with a 32-bit
+  AXI4-Lite interface. DOES NOT support:
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
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: interrupt
+
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: AXI-Stream RX data width, must be 32.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description: AXI-Stream TX data width, must be 32.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of RX FIFO in words.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Depth of TX FIFO in words.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: Set to 1 if RX FIFO is enabled, 0 otherwise.
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: Set to 1 if TX FIFO is enabled, 0 otherwise.
+
+  xlnx,axi-str-rxd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Ignored by the driver.
+
+  xlnx,axi-str-txc-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Ignored by the driver.
+
+  xlnx,axi-str-txd-protocol:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Ignored by the driver.
+
+  xlnx,axi-str-txc-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,axis-tdest-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,axis-tid-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,axis-tuser-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,data-interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,has-axis-tdest:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,has-axis-tid:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,has-axis-tkeep:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,has-axis-tstrb:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,has-axis-tuser:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,rx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,rx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,s-axi-id-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,s-axi4-data-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,select-xpm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,tx-fifo-pe-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,tx-fifo-pf-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Ignored by the driver.
+
+  xlnx,use-rx-cut-through:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,use-tx-ctrl:
+    $ref: '#/$defs/xlnx-uint32-zero'
+
+  xlnx,use-tx-cut-through:
+    $ref: '#/$defs/xlnx-uint32-zero'
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
+    axi_fifo_mm_s_0: axi-fifo-mm-s@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        interrupt-parent = <&intc>;
+        interrupts = <0 29 4>;
+        reg = <0x43c00000 0x10000>;
+        xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-rxd-tdata-width = <0x20>;
+        xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
+        xlnx,axi-str-txc-tdata-width = <0x20>;
+        xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
+        xlnx,axi-str-txd-tdata-width = <0x20>;
+        xlnx,rx-fifo-depth = <0x200>;
+        xlnx,tx-fifo-depth = <0x8000>;
+        xlnx,use-rx-data = <0x0>;
+        xlnx,use-tx-data = <0x1>;
+    };
+...
-- 
2.55.0

