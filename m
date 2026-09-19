Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74A37E5DF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780482; cv=none; b=aWW4187OpOc2wcy4bAl75A14I1xqEHQ+I/yFj+UR8gkkHiPEf2E5qeQSTY7zF/FBK7wUwq9u3Dizq6KNEU0K7cIfKqNiHLkDwyeYdNIRpID1s0rIvhqbXjMzSTiDi4SsgfXt/zySjEHwpXyn6MQVWeZqdWqKCb48m6MlDrWtEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780482; c=relaxed/simple;
	bh=zqQ2Gc3YrVtSTqVH9pz+HHauXgCJZooWRhN+Ev9jLqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JfnM7DcJT29lXtrhZIUUMMCPM5NzHxtbjyiDGFADUmLjGtC0kSX/nUd8lW3+lBYWzXS8+ZPFUo6WDNLkkytv4YP2eyjbzfy1b46I/rtnYSX2UvLSJ9OwTFNgNXaIQIc8F+IBseYdLlAnqYZUvIgCH/a7XRu0TqhMZSByilJEuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHCXCE1Q; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHCXCE1Q"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-80032c08611so875657a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780462; x=1790385262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=WHCXCE1QvwvNBvVl7/vVkNmQur++G7Srnu/8VyBNehIJ2KfoX4D5jhzst436M2svCC
         wzfGJMBiFOBAdzkbLQMbtVgp4mEy7um5T7znha8/h0wmhcrtNiqG6ztkVsCP5EYp/YCT
         YwJItOzCcp+rKjN4tzV9HweRZwhSPUOwOfxXi1BSBCxKZBG8rLPGaeu5beRKqp9JzH2s
         BidVtCW/2lyGrixk/eSwX/XsGZ7IA+1oAYmrrkc7RJJtjdwGac8vpACA3cZqrK4MFoyV
         EU46tMZAQfw3V+hnJF/06YhYWhso02HmgmmXpBR8elimR39pG206m+S4/IKuxqW/Rpp0
         vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780462; x=1790385262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxKrnFCKVv+A/s21AGnSTz11SqzSXxKNsYK80fhyo7I=;
        b=Wn2hXEtRyTLcTA/AHOQytXj5nha6dVA5RCzI+1RVfe8UbBAvpmD7kETCuss+kUiDuh
         TZjgvecD10BL9wF8hX0j+obs1VLH+MRPYKD64/wuUYKEjJDJqmwd2NmndkgFPC7SjMSY
         u6UGqczpL7HXftMpgA6kauR2HHG27mkNGTh2JCYUV+uDSO/j/KTGgU92pxq35fVh9qwW
         y6+b4T6YHts9kWTrmUL8T6MAmXUa1eeukvzJKTcQURYci8jvuJ2uRbvgbB5AMMPBLlpz
         YzJnHg95Wnok4tKAs40G0ykf5yM+YOs2rJ49Cbtn1zLd43+6CEbDOM/v4cL3edIolzFQ
         +HWA==
X-Forwarded-Encrypted: i=1; AKwUvBzh8CgUn6WruE15SX3ftLSnSRAOFvalqEzwO+i6tKBE0xMu+p6sv79HTBD6hCtForDc8l/q6CQCRz6TFeA=@vger.kernel.org
X-Gm-Message-State: AFuF++mBXeTRNHbl/UnuuSg3zQoYW1AjQqMmnqjwNW5R/n735GzavR/R
	FlhMFCjHJwmMiaqYrCJGZWDFZX5OzX0GLPIfCxerZp469qmzMBEpH5Ze
X-Gm-Gg: AYBFou0carCFSCEI5/wn2cVXV+U7kOCepVnvBCm4gt0qsThwRDpVWfFYS+RxeB3ypa7
	r3GQNuGlN3HTx3EOPj4QJfuv67evsYwEPI+qEwTMsEsowMfKbJGBI+U8KrDIGl4soYp0IEOdm/N
	/OKLbFdKLyLZnwpbCckqs+XflNqKarcLwwYdwOKmO/UIvHHGR21NoeOIt1Z+kXelObH3taL7mlC
	UeWnK2EMXMGL1avUaRo8/gz7I1yOTVtX+oWq/Wo3iGApVys72zq+JWbD5E9D6mvQy5lFdAoG6Ft
	VioUXb7Ah+pt5hAAwgcUq5WioSriBYEhZVmyX8MVsJELy61vDXb3wJJhTh8CAZLg9R4pXBYfqoO
	E8lfa20qmKy1TUsSYRST91pZRRPPPA034ZDZYYwGh94EMy9TXg3Pl3tLMSyv31gWQd43nbjYVdR
	MXt3j+chavPzn+SxL0ldT2WXUb8RrHRnmcNxE4Cq9n4TFNpfTYPVsoZLG7YUSAx0wRRrBYVnRsg
	mab7yqyujHSWMQjeaXSdK1JOYOJCDfobYEaaMnnxYZibRLyJIq+ziw7RfxtnUmC
X-Received: by 2002:a05:6830:3886:b0:80c:d30f:97d with SMTP id 46e09a7af769-80de33eccf5mr4941299a34.30.1789780462100;
        Fri, 18 Sep 2026 18:14:22 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8107eea55c8sm1317188a34.26.2026.09.18.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:14:21 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH] dt-bindings: misc: add binding for Xilinx AXI4-Stream FIFO MM S
Date: Fri, 18 Sep 2026 19:14:17 -0600
Message-Id: <20260919011417.156828-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver (drivers/staging/axis-fifo/axis-fifo.c) has
supported the "xlnx,axi-fifo-mm-s-4.1", "xlnx,axi-fifo-mm-s-4.2" and
"xlnx,axi-fifo-mm-s-4.3" compatible strings since it was added, but no
devicetree binding schema exists for them, which checkpatch.pl flags:

  WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears
  un-documented -- check ./Documentation/devicetree/bindings/

Add a schema documenting the compatible strings and the six
xlnx,*-prefixed properties the driver reads in
axis_fifo_parse_dt(), all of which are currently required by the
driver's own error handling.

Validated with:
  make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000000..56d58b37b71e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI4-Stream FIFO MM S IP core
+
+maintainers:
+  - Daniel <danyboy28sep@gmail.com>
+
+description:
+  The Xilinx AXI4-Stream FIFO MM S IP core provides a simple interface
+  to move data between the AXI4-Stream and AXI4 memory-mapped domains.
+  See Xilinx PG080 for details.
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
+  xlnx,axi-str-rxd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream receive data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,axi-str-txd-tdata-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 32
+    description:
+      Width, in bits, of the AXI4-Stream transmit data interface.
+      Only 32 is currently supported by the driver.
+
+  xlnx,rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the receive FIFO.
+
+  xlnx,tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Depth, in bytes, of the transmit FIFO.
+
+  xlnx,use-rx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the receive data path is present in this IP core instance.
+
+  xlnx,use-tx-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Whether the transmit data path is present in this IP core instance.
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
+    fifo@40000000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x40000000 0x10000>;
+        interrupts = <0 29 4>;
+        xlnx,axi-str-rxd-tdata-width = <32>;
+        xlnx,axi-str-txd-tdata-width = <32>;
+        xlnx,rx-fifo-depth = <2048>;
+        xlnx,tx-fifo-depth = <2048>;
+        xlnx,use-rx-data = <1>;
+        xlnx,use-tx-data = <1>;
+    };
-- 
2.34.1

