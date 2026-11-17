Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794904487;
	b=HiDBJoa+ic8AilXmf5cFUwixBZt6OY5T9jWW6CucmYQabxSRykQQ1O2xj+0SNz7ts4UL
	 /2hlDM+xB3Mcs3dG6vgNphsf24bDkrlELJebC28L9qrdLtHHwAaT5QWxVmmGaPgrg4U8A
	 pRzKty1nA5ROBNKmDQp09/Sfqqz/50fAtg+ipsCCwhcubG5CyN09FKGP6OnaRBLMbeige
	 sa6aQdM+kYyitcQpciVNXICjyAn/YXVFDnPMtDPm1AwLEsb9wAK01GmxDUgOaf7DdniEP
	 a8aPunpLOiaoow0p7WWpJOzbSJUx6ehD4T/gSe7yQYTl/etuNPF8lB0bqMCdmPbn5kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904487;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=;
	b=lV7PoUGkQULCAPpiZMmpCM/C2KUTCi6o+kBIkWWCcsY01OuGhLoxDVbHwgPhdtxin6+Y
	 kZ4VcrGwK4GcB85OdSMfjGXu4DG0UhE4aA1gXWIlpxeWOGolITpwsWd3er2bO1zMcPii3
	 oI7inUUUrbiRFk5zHacSbnWgfuEubGq1YAxE23o5y0fSMu4pL1z7KuClrv+V/SafghIIf
	 qOJWq5iObdFmEP8uuoWenMhe/CAO1RflthywXyTVgIoLfRzGDaq0BvzBWDij6CS2PBjQX
	 Fi/AYBmvb58+D90HNw2Ub4fECmRZu489oTDvlfEDZ0jQ2U3+9+LSo+EuiTGJrOKeQQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.120
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022120.outbound.protection.outlook.com [40.107.75.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33B606A8A2;
	Tue, 17 Nov 2026 08:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD33B606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L665nvRdGHTVCxZyOCx4iJFoOUZLUzaPeR1VcIXhjDomrsS4Iiba6zx/gtXdVyVmagJtLW/dtTbwHfXUx75x51BJcSQIOaNFY/MflBdY8PGcvusRBdI/445VHH9/4cGnct0tKT3VjIMSOgF31PWIEX1GpjkxqDwmbTTx0gzf4qMYZuTymgPIWIwRt7vj1mJLgBM49e9Qt0GzpxB2VVHxocjhfJWw0nomMC6dbp9Uhp8qBShAXVHcaqt6ktHYBv4URYx0WkFLfV/TLL3Ats/C1D8qHNbzb/N5qaFHkoOeVO+fir1VDchiWjQebR3y9ibeCDINOSnUr9tiQKD0NAko3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDgjq6qt5mQy372YVXoX3SsrgTjbojm3RamylfK+X60=;
 b=IVDU5msraNrKfL8IcGmBrKbUlhsEuvzTXq8FSEYC71F0haPUp3VNn/YKU7hgDxgqxLGpDd2bSvrxvgvCpHXxY5JcUOaLp5Iob2tbPyYCWapm4Ma4K+TwVA6IN88oopm57Zq9zc2CVQahEzbDyJ8uMgm1CWv1Uf8RtVG2Y5SoIIE0/s4z694FJIA2rG+gytHlqKjw8uYko/OELPPThULlds2FyLb9govbHiajaz3BDs76uqOFGNXqiSDlJ/ozirhXBjMUAzOV6DDb87FAIt89yMY/GXlDogdRwbKThUzQH6RcJW8EjEIm5xZG2FyINFG++a3+kyUB9MVotx3HklFEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0007.apcprd02.prod.outlook.com (2603:1096:990:5::12)
 by TYSPR06MB6575.apcprd06.prod.outlook.com (2603:1096:400:480::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 08:34:36 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:990:5:cafe::32) by JH0PR02CA0007.outlook.office365.com
 (2603:1096:990:5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 08:34:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 08:34:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C5799427EFCF;
	Tue, 17 Nov 2026 16:34:34 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	Luo Liu <Luo.Liu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Date: Tue, 17 Nov 2026 16:34:33 +0800
Message-ID: <20261117083434.3414417-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117083434.3414417-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TYSPR06MB6575:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7448662c-e8ff-4db0-74ea-08df44859cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|56012099006|4143699003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|20046099003|21026099003|22082099003|18002099003|5123799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	838KfTQFc5Gxbi9NCvQVLGEGgz5iivePtm5AvlvLLR59CWzbw32OG8u7mRQ1JGwoyQvw87Gu5FNG/n/FsyOKVnqm2pRieyX15mrmL0Ds9Hs+4T15LmC//WK8lrqVxennWnNODeDTj0Q4SXolw4HRgL9RvvcleWvBDH2sSFpN6jfhDTRakap+CAoPTWBw1eUjwYFzchvKKLidN0On3l5/2J8pFYUH6QKqrhDaRaDTZLj7Bhv/06PN79YAd172g2nBlfpfnX2+Ye7zOpy3Y3FG3Ya7fp1SRJErOQdpNehlt2vytWTEmJwmZOFBW6iSi1ETMJQ5EWPX6fzSS/qAW5QrndRqk3oZiyF/2/wKD4cbzPbInKCAvjueHZIqzqQDlsnXjlyfjHQ5b3rVxwJfEobUIwewvwWTookv3q+mSL4un9LggxzWYWy3DbYSNSfygW+0BRwBHoaMnqcQbE7ITdb4zvaQ6neM7NlLvQBPYx8fxAgUfY0f83W4wRyW90MgBww43duF5jvi89T6cxvDrng9gqzwNipYkMXzwaMOyxAjDuBIzkak0f6aIQ0vLngPYX7mJdTexZjUkYVr33IUR/rK6LfIzM90my688RyiXkg4KT1Q8xHVnrPvbX4FLpiHr+vfyCOA+nFBjT2II7sbotOLTg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(4143699003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(20046099003)(21026099003)(22082099003)(18002099003)(5123799003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WSjcyYWoPxzOBx9uwefhSezPI/urhVtTdTeUMVBrALqPBTm/5/OXzQGpZ7gKB3J3A65oNj/3CxPoAyM/gcPlEOCbLOu6MF2jMNgqDG4utIVcqniCkkAnZ00sx5Arsc2SH1+uuOHv4Q1h6+3oX8d3E+nhfdlOGXuMWLNA73MF0UvfiBaP3d1s8uTDuE0hFaIPjp83qxVicGj7nDribcV/L+OOt2kGD31fuI2o6lKocF5Og1qSp4Ke66Desu/rbGmUPitdmfVo3kVMIpE0s6lhBmkT4QU7nALHDP5H0pYOq6VfOBWVw7fGaGMcZuerTnqxj4EgtVRoPXnJQOip1GehFhfDI1EW+SoiByjuxBvG/NxTl4ZwGfYmhY/FqQbnbAUnyoeS6BH4aXXiUtpD+SZQ2KTfnKekiMTdqcAD8/Qyi6XP8d8LA252oytVpe0mjVYd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:34:35.7569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7448662c-e8ff-4db0-74ea-08df44859cb2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6575

Document the USB/DP combo PHY of the CIX Sky1 SoC. One PHY instance
provides one SuperSpeedPlus USB lane and up to four DisplayPort lanes of
a USB Type-C port; consumers select the part they need with a PHY type
cell, using PHY_TYPE_USB3 or PHY_TYPE_DP.

The PHY performs Type-C plug orientation switching and USB/DP lane
muxing in hardware and is therefore described with the properties of
the common USB switch binding. The plug orientation is switched through
the S5 system controller, identified by the "cix,usbphy-syscon" phandle
followed by the PHY instance index.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usbdp-phy.yaml      | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
new file mode 100644
index 000000000000..9bdd01e348b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usbdp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB/DP Combo PHY
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USB/DP combo PHY provides one SuperSpeedPlus USB lane and
+  up to four DisplayPort lanes for a USB Type-C port. Which of the two
+  functions is in use depends on the Type-C alt mode and on the plug
+  orientation.
+
+allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-usbdp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    description: |
+      Cell allows setting the type of the PHY. Possible values are:
+      - PHY_TYPE_USB3
+      - PHY_TYPE_DP
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description: PHY APB clock.
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  orientation-switch:
+    description:
+      The PHY handles Type-C plug orientation switching.
+    type: boolean
+
+  mode-switch:
+    description:
+      The PHY handles multiplexing of the USB and DisplayPort lanes.
+    type: boolean
+
+  cix,usbphy-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the S5 system controller
+          - description: PHY instance index within the system controller
+    description:
+      Phandle to the system controller used for Type-C plug orientation
+      control, followed by the PHY instance index.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB, or for DisplayPort when
+          configured into 4-lane mode, which should point to the
+          SuperSpeed port of a USB Type-C connector.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller.
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - resets
+  - reset-names
+  - cix,usbphy-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usbc_phy0: phy@9030000 {
+        compatible = "cix,sky1-usbdp-phy";
+        reg = <0x09030000 0x40000>;
+        #phy-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+        resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+                 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+        reset-names = "core", "apb";
+        cix,usbphy-syscon = <&s5_syscon 0>;
+        orientation-switch;
+        mode-switch;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&usb_c_connector>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&usb3_controller>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&dp_controller>;
+                };
+            };
+        };
+    };
