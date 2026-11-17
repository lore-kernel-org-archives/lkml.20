Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927879;
	b=f/8pHxxFWjlwEPwvsbbnaFhKJut82aXLis+cl2BiOI9vgBQwraoFIYzhWgr7dV7KA0xr
	 rYYCvKaUk5vxYeUVgChPhoUh6GK34/rAjZsYlIFXEShRVMM1XKj2JXimDmGmz6LzsnUw7
	 pSdLwCUmg8FS+R+eA108hdiM4o4CyctPB4m3kmlGnsGoDeXR0xcvER217+PlCEJWx30Ln
	 xpMfqpzULHTRVbBdnYFjXIqMxfRpb8r0Wt3MJpv0RihR81ODYvVc2vnBWIDER2g/6I0Wc
	 z4sFmjA2z95o7lcP7ohnvhgmicU9m3yyD2RlvESle8VHtqpqZrPSHVeuXtHDv3+Newg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927879;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OZbTpqRde93JIk3Ow6cfpRy6pFZeYEEQk8UUBTYEvfQ=;
	b=dzBZ04Zd1cKXP+vXSj74VbfY1WIJ5QYqV7SHgr7bqkdzc3urgbPkTd6ZHBhQviwse1Ep
	 7R2YAZbgMLu0pBAwds0btTsn1DlDoiNNkJiJIRY5lIQyeSiJGXHeSvB4yByf+u2X0QDcZ
	 m3J52jpFv8q255b4jyIyRmOwU9TeI9GoFsaTaELTaRCbNe95/u2Q+a/QdoDU9iC1+WcMh
	 WDL7Qc7VGT2ANOdGm3DNYF3wTLV5yVKOQEQVN/G3eLX5iMyKEQC1Hy4BPij7xkot5tOnW
	 Ctvtw8MMzt2n2OW8hBySWfVjTIiVeHeoKtKmkcsnChW4bB6OzINTH4GWjMFQEDxpSaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zXO6+VLu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F61606A31C;
	Tue, 17 Nov 2026 15:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zXO6+VLu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkziEWw5EAfu6lLCj5svugetHGJMbz9PTAVTR62T773ojJW1OyCkKjfiFL+DgT9+24O2h0rWC5cWML98QKPnBzK1TYzZuq/Bk4i/9QpdkK/bHqff8LcDj07ySep8dHnf52sO5rU43sURuxG3BS7zBiBPIQ+T5yhMJ4f/aBSFD75sHQmRXa0O3ljlkdQB3xwduRSKkpFiK3OtB1Cz95HSrtpmaPK9YAAkv5Ht4H0o0yD1/DdUZUOuAO+ZHleeCEMet+qJe5E838Hn2KXaU/lnFRvwVF4ot+wbr21zUXK0Vt4gcBgocJOhLvYRyRHQYy0oCb2JSKpQ1qRzF/UvcIvWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZbTpqRde93JIk3Ow6cfpRy6pFZeYEEQk8UUBTYEvfQ=;
 b=lDb7rJdsE3rrevrUH1NCxRDmBewAu02jfxoAinb/2lnI2CRUVCan1GaysrJOUNq/CUNx+D9rDOhiqMacC7kylP8aO0rYVRQQebjWvGUu9PTjXSc2aSarTYk5NOQ9JmK9N0arnfVtwC2eHtejNjPdxq1GgnmvOVuGIlGiedVw22P8s0uJ3VYT/NTIAsRikIpDcDGGMcTeK52t7ht0WtJ8e0pr8x/0dQHjICqZkpsCVaRC5IPi2Zpdpm5IpzHMYBiVmD9n2Cllkx0SQgTUK5zTCq/m2fQAL0bHOcGRBHCneNeRIqlSD63weCHEjIYi4YHU2aO89M1rAcdw8VF+v6+lPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZbTpqRde93JIk3Ow6cfpRy6pFZeYEEQk8UUBTYEvfQ=;
 b=zXO6+VLutjhjJ01hei1zd7kbd78G7z+dUX2eqshbE8PXW49UddzJZLH0ww7gQWdKb9U3JVcLCoBsZwDZEYIotS7ivlEKT8yA+pnqq+D5Q2pQNA6RfZxrleV4q70wIo6to1uVOhgSj6lSalQpNcdiYftAsAinb+mmWGWERtCn0ro=
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 CY3PR12MB9556.namprd12.prod.outlook.com (2603:10b6:930:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 15:03:09 +0000
Received: from CH01EPF000BE947.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::2b) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:03:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE947.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:36 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:32 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 2/4] dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI USB support on Versal Gen2 platform
Date: Tue, 17 Nov 2026 20:32:16 +0530
Message-ID: <20261117150219.1326693-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE947:EE_|CY3PR12MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 947434b1-0f36-4f42-65db-08df44bbe338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|82310400026|23010399003|36860700016|376014|22082099003|18002099003|6133799003|3023799007|261009223027099003|261026121527099003|11063799006|56012099006|261102123227099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 UrqImHB0a+BgWrrcVDURtTL18wR/GnBUAULBIQ+sJ6fFKf1hwpBNpiFwq7B9ztcxpDVBvPuFAb7Ug9t7VeYxMdVlcF5N9yq7K8uqROTUVkgbnSe+I07ym9Xy3Z5GUUPBfkGZFfS8DIPwU73SFKr0lIzyA5r0k5N50OK+7rD4nsQnVNaTwSHkk5W7My8ZCshgBut1Y26tdL19HF3yOdbxUq0vJJjXWpzCTkBwexfMbViIdZvA5PHb+B2xtL3IgohoOCRJWxlNB6ohzoz6HxvJRjlOcVYSto3lKd+DL0GfouuMtOzLbiPW0r6Kis6f6RFWvdnBOhX+K1ZL6f+R/IBLPa3dVA9o3jS6JUhinORe+yfRYjixLMoWaZb09q7wOYIXPzZ0YLr+pW5BnZXjiYNQPQTECcFWA6FKJU5fLKlRHS2W1V++nuT3NUxKHrBCs5Ly3o9hHLsiLEkmKUcyVVgIyYg3G8DFZ94AS0/fHCtD0wZZEXsVVtQXOD1n4sM0nojEIXMHG64co+eF6zAZyFjHyOvFctYmuPEg+kF9U8uG/e6m0/uLp9jzN2fOLgNAAR/3EQwN8PspXBPzata5EQ4zE1ARL6HLyZTeUEHVgzIX7f54xK3TwGDfc3Y9jtnekGRzvMHxlVQcJIZg7HV8leAhQA==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(261009223027099003)(261026121527099003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 o1iQ8TNB/ainueB9mqQJuSm/5LmhnQ+S49KmIkT5nxM81DwkdtX7Qd5hI8KTamDJPgnlapSc7P30M8b6WSz+lip/Xneym/E0JB6MTEnWIrqgfgNJyhcBok65Utm4vyOJnug/s5I/mItClue1yGEcsws4cAbvB6THMUN7mbW/ceEVt0iCqJdtV/FhgS3gyPlzdQAfg/TKos1oTml/8Sad8mrlAYYwr7fQCO7k4MSJo/RYaPI5qCAJ7sHfD9SEr8VseQulFQeGGhtvKa8U8RTgTgiwr6tsLRTjB9jE/XeZq74wE/0lxUilmhhQuIhTVgFNbAGpryKhbzYA28+fF4+rF+Ufyx/IzzRCx91Tzu2GY2xPDVplGohtxiBfFgLbcvLfFRjmVHQQ0JHun2hBFO1CAOwdV1Ija7/Ej/THTIDJqiAULSoKuX1IEHMNLVj7pAlk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:07.1314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947434b1-0f36-4f42-65db-08df44bbe338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 CH01EPF000BE947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9556

The Versal Gen 2 platform includes two distinct USB controllers. The
LPD controller is a USB 2.0 instance and reuses the existing
xlnx,versal-dwc3 binding. The second is the Multimedia Integrated (MMI)
USB 3.2 Gen 2x1 Dual-Role (DRD) controller, which natively supports USB
3.2 host and device operation over Type-C in a Gen 2x1 configuration
with a maximum data rate of 10 Gbps per direction.

Introduce a new compatible in <vendor>,<soc>-<subsystem>-<ip> format to
uniquely distinguish the MMI USB controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v5:
- Add Rob's Reviewed-by tag.

Changes for v4:
- Switch to flat mode and rephrase commit description.

Changes for v3:
- Modify commit description to explain that there are two different
  USB controllers and difference between versal2-dwc3 and
  versal2-mmi-dwc3. Suggested by Krzysztof.

Changes for v2:
- Add blank line after compatible as suggested by Krzysztof.
- Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
  IP from Synopsys is part of the dedicated Multimedia Interface. The
  Versal Gen2 platform also includes a separate USB 2.0 controller,
  and the mmi suffix uniquely distinguishes between the two USB
  controllers. MMI is an independent subsystem particularly targeted for
  deployment in Multi-Media related applications. The MMI block include
  following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
  Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
  Controllers, DP AUX-I2C PHY.
- For MMI USB define parent address space i.e UDH block.
- Fix inconsistent MHz spacing to use SI convention with spaces.
- Move description before $ref and items in xlnx,usb-syscon property.
- Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
- Use 'usb' node name (without unit address) for versal2 example since
  it has no reg property.
- Use 1/1 address/size configuration in versal2 example, use lowercase
  hex in syscon offsets.
---
 .../bindings/usb/amd,versal2-mmi-dwc3.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml b/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
new file mode 100644
index 000000000000..f71fccd95b2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/amd,versal2-mmi-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD Versal Gen 2 MMI SuperSpeedPlus DWC3 USB controller
+
+maintainers:
+  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
+
+description:
+  AMD Versal Gen 2 MMI (Multimedia Integrated) USB 3.2 controller.
+  The MMI subsystem integrates a DesignWare USB 3.2 host/device controller
+  with platform-specific clock, reset, and power domain management. It
+  supports USB 3.2 Gen 2x1 SuperSpeedPlus operation. SuperSpeedPlus
+  operation uses an external combo PHY shared with DisplayPort, and cable
+  orientation and role management are handled by a USB Type-C PD
+  controller.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: amd,versal2-mmi-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SoC bus clock, has to be >= 156.25 MHz in SSP mode,
+          >= 125 MHz for SS operation and >= 60 MHz for HS operation.
+      - description: Reference clock, generates ITP when the USB2 PHY is
+          suspended.
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+  dma-coherent: true
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - usb2-phy
+        - usb3-phy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@edec0000 {
+        compatible = "amd,versal2-mmi-dwc3";
+        reg = <0xedec0000 0x10000>;
+        clocks = <&usb_bus_clk>, <&usb_ref_clk>;
+        clock-names = "bus_early", "ref";
+        dma-coherent;
+        dr_mode = "host";
+        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi_devpd 0>;
+        resets = <&scmi_reset 0>;
+    };
-- 
2.44.4

