Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC24502559
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745230; cv=none; b=nYh4lhanAK9kJv82sLIwe38ls8cvzTo2M34et2LaROjNdXll4JUR5++snfomaBrbiilRXynXfZ7Fpq5H7sgXQsL5PraUJrzZbpyR90RKn5LtVkarEQ6pJidFt2r5+CNrUfHmjOpnW3uYWDrZJk0/H/Y1FZ4ONqbJqgLnClxf3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745230; c=relaxed/simple;
	bh=DtwhmvfmmK5pIr/RR1hrMie23QMNX8VOipziXz4rrfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDwUKV+XKnmXR9sLXu8R0yCRJgyDXYLtGFdbeWN8ydkfznI6fiG5DI4Hd+Uxq7jtFc+1EEJ/jP3UIIaRiF/TTW6qVsL4p0y/bam0Rp9ii+wnnVLUJrXvgvIkhCr10zXV5TWWwB+Mnnv7FeF2MGk6/Kxbwlr5hbqVrgrTFxgoZdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=aBbFvpgF; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="aBbFvpgF"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910537b51a0so7866976d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789745225; x=1790350025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yc71JJZaAOPgE/2sEPFAn2J0YmVKQfWX+0ylD9XYCsk=;
        b=aBbFvpgFvX/rl5MO6/YG5yp30+HVL644hPLFWGHC6r40PkZpoUdAhowqmonHvfzFhu
         OtuaN63BIpn9bFL+qlDt4GNhJZtE5ot4gi0V0Pgj5/trxR3i8T12KcFT0BemPPp+PQUF
         6y5DXd0Xke4wZFs8YJW3nK3GEYgeJvDklKMrj2EUZXd0fWk+xbG3laF4H9xa63WF+xby
         Pt8yE+4FwOuR7WYWXvylGkvJKOWMzc9vNKbWz6vqP0Xjfqpol6Ph06Dej9YGumF0dFk3
         0wFOWKyLYIA4H6CzcnnzexDGwIJVJNwVhiAADzWtogXzG+eXY6KHDMAXhtfOU6548dJX
         6fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745225; x=1790350025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yc71JJZaAOPgE/2sEPFAn2J0YmVKQfWX+0ylD9XYCsk=;
        b=2s5av0mw8F4qvy/nxMd1wt5+8sPpvrUjaZce88MR+hrY9s/oDbM8xWylOsZcUtb72Y
         UhantnEQjitH6JIaoOxMnlVglTYYom0VrXvAtH+9SGihqN8YS4tyZUhipF5iKBGcqmXD
         vvxUiYPUEEbBI6wwXPg3+Dfq/DnengXuo8d/3RmW7w1fGCX9aVlSy1HSb7Arm2wPkRFB
         rglOh+KCpE3oCAbKWBqUmTMQOKmDM9HmE9szz6Gova7trw8Dl1EX7hvGvLAyWjg52wuJ
         0k5D5XLvRLVosNvUnWraIGUYGzkNHddJONrV7EKvJr6UURxY8dpdOTRG189oE+kvhYcJ
         LGAA==
X-Forwarded-Encrypted: i=1; AKwUvBz/oKTE/D9Qouxif/ExjP6HR1vteHhb/9dkKLTrDAKfl/qv+u251KaSb7IPNDPMdonT0bbcHOx8EGvD8Js=@vger.kernel.org
X-Gm-Message-State: AFuF++muR8qWaGFgRygBJA3W615CNI5/E+JZeAAd4SYvlcOW3fo007cB
	/EcNSycWRQ0/bysqcOBFgDU5a/ffeZZD91tsMuRXENj1GyF8f3DsApXgTJdaBA5qzNA=
X-Gm-Gg: AYBFou1Dg3q8Jt2MQ2dZUAqdRRsoKFsma6J90lCoxQDBzw5+0BTtU0E/aO2sZoyYGSi
	AKr2C5XyAjHW64SfuHcJqLa99qlQzZmui8e4ilNLXjG3kvae0ckwJw8qagyrOBBnH+ouWSSQByK
	x2BAn7cEiFIZ0AJKT5gjI/GgpVRJwg9WFtXKNFpV7ZmoWTafc8dGsgkKuLMoxqrH5q0FWPEZ8uk
	+Koq1iV2fmMuHa1QFJYgismk1kglYQn/GkH0kqmWQgaCqxa4Xv3Nj9m5Ju2ucoA3xa+FA9FHyc2
	kCDqvYnDuCLkjOZNsAWcPcQuKEC/4sgynQ82I/uAW/bAR9ZkK2Lh3LZhqzp9G9E4w2eBgJLgc9c
	phD5Oz0MaC6qs8AUCsMwq833S+3B6TDXM5w8vnWmrWmehYqnMVOk14fHK2HlqpM5YOFLs1X3STE
	kt6lpHWISZ1bwOupP0XSUAQ3TmM8/NCfHvV0ZjA/uPNZCE+QCPCYx3T8rYLe2hmsB4Iyh7ScgvB
	Ks=
X-Received: by 2002:a05:6214:80d6:10b0:90e:98c9:548 with SMTP id 6a1803df08f44-91254ba3a7dmr37466856d6.1.1789745225031;
        Fri, 18 Sep 2026 08:27:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91257f326d8sm15099766d6.6.2026.09.18.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:27:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: misc: introduce pci1179,0220.yaml
Date: Fri, 18 Sep 2026 10:26:56 -0500
Message-ID: <20260918152659.413268-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918152659.413268-1-elder@riscstar.com>
References: <20260918152659.413268-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the Toshiba TC9564 PCI endpoint function device.
The third downstream PCIe switch port within this chip has an embedded
PCIe controller, and that implements two of these PCIe functions.

Multiple internal components are accessed via PCI function BARs, as
indicated in the diagram below.  This is facilitated by the use of the
devicetree pci-ep-bus mechanism, and is demonstrated in the example.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Dropped pci-ep-bus@0 node from the example

 .../bindings/misc/pci1179,0220.yaml           | 146 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1179,0220.yaml b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
new file mode 100644
index 0000000000000..c92c8d3d33f76
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1179,0220.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1179,0220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 internal PCI endpoint function
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+  - Daniel Thompson <danielt@kernel.org>
+
+description: >
+  The Toshiba TC9564 is specialized SoC that implements a PCIe switch
+  as well as an Ethernet AVB/TSN bridge.  In addition to these, the SoC
+  implements other functions, including a reset and clock controller,
+  an address translation unit, and a few other devices.
+
+  The PCI switch has three downstream ports.  The first two are exposed
+  externally, while the third is used by an internal PCIe endpoint.  The
+  internal endpoint implements two PCIe functions, and attached to each
+  of these is a 10 Gbps capable Synopsys Ethernet controller and an
+  interrupt controller that converts internal "wired" interrupts into
+  MSIs delivered to the host.
+
+  PCIe BARs provide access to registers that manage almost all IP blocks.
+  The SoC is modeled using a PCI endpoint bus.  The IP blocks are bound
+  to platform drivers that access the hardware using MMIO through the
+  PCI BARs.
+
+          ------------------------------------
+          |               Host               |
+          -----........---------------...-----
+              |        |             |   |
+              |  PCIe  |             |I2C|
+              |        |             |   |
+    ----------+........+-------------+...+-------------------------------
+    |         |upstream|          |          |       ----------------   |
+    | Toshiba | Port 0 |          |          +-------+ PCIe pwrctrl |   |
+    | TC9564  ----++----          |   I2C    |       ----------------   |
+    |  SoC        ||              |controller|       ----------------   |
+    |             ||              |          +-------+     GPIO     |   |
+    |             ||              |          |       |  controller  |   |
+    |       ------++------        ------------       ----------------   |
+    |       |     US     |                                              |
+    |       |            |    ----------------------------------------  |
+    |       |         DS3+====+          downstream port 3           |  |
+    |       |            |    |--------------------------------------|  |
+    |       |    PCIe    |    |        embedded PCIe endpoint        |  |
+    |       |   switch   |    |~~~~~~~~~~~~~~~~~~~++~~~~~~~~~~~~~~~~~|  |
+    |       |            |    |  PCIe function 0  || PCIe function 1 |  |
+    |       |            |    |-------------------||-----------------|  |
+    |       |            |    | BAR || BAR || BAR || BAR | BAR | BAR |  |
+    |       |            |    |  0  ||  2  ||  4  ||  0  |  2  |  4  |  |
+    |       | DS1    DS2 |    ---.------.------.--++--------------.---  |
+    |       --++------++--       :      :      :                  :     |
+    |         ||      ||         :   ---.--    :.......           :     |
+    |         ||      ||         :   |SRAM|    :      :           :     |
+    |         ||      ||         :   ------    :   ---.---        :     |
+    |         ||      ||         :         ....:   |clock|    ....:     |
+    |         ||      ||         :         :   :   -------    :   :     |
+    |         ||      ||   ------.----    -.-  :             -.-  :     |
+    |         ||      ||   |translate|    |M|  :.......      |M|  :     |
+    |         ||      ||   -----------    |S|  :      :      |S|  :     |
+    |         ||      ||                  |I|  :   ---.---   |I|  :     |
+    |         ||      ||                  |G|  :   |reset|   |G|  :     |
+    |         ||      ||                  |E|  :   -------   |E|  :     |
+    | --------++--  --++--------          |N|  :             |N|  :     |
+    | |downstream|  |downstream|         ------.----        ------.---- |
+    | |  port 1  |  |  port 2  |         | XGMAC 0 |        | XGMAC 1 | |
+    --+..........+--+..........+----------+.......+-----------+.....+----
+                                          |       |           |     |
+                                          |USXGMII|           |SGMII|
+                                          |       |           |     |
+                                        --+.......+--      ---+.....+---
+                                        | Ethernet  |      | Ethernet  |
+                                        |    PHY    |      |    PHY    |
+                                        -------------      -------------
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    const: pci1179,0220         # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  reg:
+    maxItems: 1
+    description: PCI Bus/Device/Function config space address
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+examples:
+  - |
+    pcie@0,0 {
+        reg = <0x0  0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges = <0x83000000 0x0 0x0  0x0  0x0 0x1fd00000>;
+
+        dev@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000000 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000000 0x0 0x4000  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000000 0x0 0x84000  0x0 0x200000>;
+
+            pci-ep-bus@4 {
+                compatible = "simple-bus";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                /* Map 0x0-0x1fffff to BAR 4 */
+                ranges = <0x0  0x4 0x0 0x0  0x200000>;
+            };
+        };
+
+        dev@0,1 {
+            compatible = "pci1179,0220";
+            reg = <0x100 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            /* Ranges will be updated dynamically */
+            ranges = <0x0 0x0 0x0  0x83000100 0x0 0x0  0x0 0x4000>,
+                     <0x2 0x0 0x0  0x83000100 0x0 0x4000  0x0 0x80000>,
+                     <0x4 0x0 0x0  0x83000100 0x0 0x84000  0x0 0x200000>;
+
+            pci-ep-bus@4 {
+                compatible = "simple-bus";
+                #address-cells = <1>;
+                #size-cells = <1>;
+                /* Map 0x0-0x1fffff to BAR 4 */
+                ranges = <0x0  0x4 0x0 0x0  0x200000>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 6096dab7121e8..aa6b805e1ab2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27670,6 +27670,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 PCI DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.53.0

