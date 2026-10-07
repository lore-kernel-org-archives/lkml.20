Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2092.outbound.protection.partner.outlook.cn [139.219.146.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B53D34B3;
	Wed,  7 Oct 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367297; cv=fail; b=LoobXxTiQcHUKyez4SAOF6I9KiBHEEtxaoXo3KErbazlHf1sxvtsgNdJvQl3t9co6RJjFF0V6z68xELYIzGH9kFOoVfDVLVPFRBFOa9JYFnz2hxQilO9ivhNrfcjbVh1iSWVkfO/Dzz5W90xruGuEOtFqjJN4WlZLy3RDMB54l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367297; c=relaxed/simple;
	bh=Wz1poXpKYWeraqOdb0t1t7uxXyI2X8j8NqhwrrPoU4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VNkVah9NeYxtUY482WrFAOuuI90DEFlSELLPLSTKLcUck1IOuY8szlXm3HjfgOb+IWS1CfSZDJtJgn4zynxMpCbPBGPoHal69j9x1D+CW2lu4n8HNFkmUkMr+QmEIrjRHYU8vjsy1wHkjQSTGeR4GpBimOksJdxrA0aeZ5grIZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcVDTw7OCR0IRYDvaj6MN9RGJw2hUmu3UMUeuuGBJd5akKJZHq4K7mYd0vm5pBujhik5On+HncPiRjqNQukiA2KpS0yYnl6IUoVrW25MF5qYMBrAg7wjBp8maA+v8MwcpZTZO0GTVb+fzkQ/W+bosENfzaMg5MI9Bp/a79napfBz73iNbTMoozEvV7f/0aTKYYot/VqLnn40/L4mZv9+pngU+ITfY/6Qr+GxQYvK4kfQHJAv3ZfaceMuYEtfmxHXOfl415FxE61ZHtjP2iw/SkBZECtJiNFn3ErnLjpJ04qb+QLXfvEHt5OswPY8c6bwZ1NO81gmFwOmCobhJzdnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJFLH82PBhDkqVgw2g+ZvkZCtL9yop02dvvhIGa/7BE=;
 b=fWi4stHgvKrlM7Uqimjqw8levlNCs/LD7DPIl+InZBIzEAg1zNZ2P4l8fFgjG08rORRJOVkXb8jO0ZDvMxI0IsInZiBotZdrnjo0+FWC1hSiIPTu0XA/LPmf7fQNwUZ12ZhXEblO2tmLvtHNwxmNb3ykaq/sMSimvmv3nez+QCtZL7/CquBwdMDm/IjGaHCdYD3XtkGOUecDjb5bauTJaY23EwLM1m/OozyPF4hJMbN6F69Txs9PHpYKbuMS2rxqdHxECs8035SVSqcIpowSbfgFW9g2w8UAa2uaPhZPEKQvP3z2uNwjEZwz+F9A44GXt3HUapRPuH9Fvf6e4qTMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0796.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 7 Oct
 2026 10:01:11 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Wed, 7 Oct 2026 10:01:11 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: regulator: Add RPMI voltage service bindings
Date: Wed,  7 Oct 2026 18:00:18 +0800
Message-ID: <20261007100022.2512187-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::36) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: b43d5225-3b3e-4888-b060-08df2459ea44
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|1800799024|7416014|376014|13003099007|921020|38350700014|56012099006|3023799007|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+iagevrmNBLjSi0TysZPH5y6u2MTbC8U6nBt5h/G0cbrKlbjf/yq/y90GQakNN0tmZpwWijN9UGhgDmsSsiG2R+08E3/ThPMthxh7EB1UxXWUHkPnPFB38AvUwNPRAtj9J6uBwUj2d8uXJxpfDiO7sqcTU+btapK/1JU0ImJ/+9Cvi5v+uepeh4FZKMH/7mqBWEGdF9SEto0EbWmXxUBAUwIrxvq8CpM5V91mPJNjtpX2M5Cgs50kGv8qrTXfYVKJt6fWcMfYqk9JRNxnW5rScKvy9UysSig6MyYxUkxuIcT8jJCqmuAXtBY1zvMp9TR6vWbPZRtFgcy3BpYPTMgK0upQJEs9f2I6TriB6/OV4YGeOQSgzGYJOnv4LwH5q/PLe6Z0A9JtljNK3q1Lb8JkzG+hfFgSuTocWh8rGJ0rjmSqU1wTna7QIAZyisj0pwqeDj5+vXJ7CF/ArCgBleY+Mjy1tqGfLgwRAunGuypPCmWtNectvVfqazt1mPXJVgBcMLfbMxQjTqyBCAfJhy/5PaqHq76r5fkALm7Z1E2PmUiYmXS5iLkgd9qb0giV8Yrd36Jn8gg7R0+2l+B9a9QYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(1800799024)(7416014)(376014)(13003099007)(921020)(38350700014)(56012099006)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EUYlJEgfmHX7AQLTVX8lLwGbPBOGX8i2SdptMgyQ9hu72yrSdxr2Ao2x0uUk?=
 =?us-ascii?Q?IimhDzKCMVBHTAh3MBLE4DZhCKgi/kIbbDwD8h3brATOvNe+Wpd9AxHi6W37?=
 =?us-ascii?Q?XMur4Rs5bjbLjPHnFrdIF4awTta3TSFKV0kY+WDBGCQ0Gt4yeUBKGSapjlkB?=
 =?us-ascii?Q?7u/3cXI0f9SjMOlKcLCxEmy46Pho5oJIZX6SWfF4sTEc2sQCJEiK7c7sxsa4?=
 =?us-ascii?Q?lCPox3vDoFhOuwiirQUg+f+7miN6WHrSklgSNv0QeF3aYgNoV+P0QiJu9oAJ?=
 =?us-ascii?Q?gHG8a5Wda3NBPxwRYBWFjKXQ/oxbQ2UpdQkMwr+BCDnb8IS1EH2pc7C7NB53?=
 =?us-ascii?Q?ro5Cl5d206KvJanvqt5TW6N4GeLHtlhrqlpH+/ZS333aDykNfOnWuu+QMyP4?=
 =?us-ascii?Q?U4SiaQE7ZCtwTh/iRTnxJRyVUlRfdszOMBFi1knDxpVNMMIDeFqTiAu3lNAg?=
 =?us-ascii?Q?zB85yyULAaGTQITXxjYmFAfJF8SxRep2T5MGDAzUr1armmFr2I6Emkg48i5v?=
 =?us-ascii?Q?+jVlRTqlXXMT6CKX4Ex6r/N2zbV3c93M0/at2TG+Ka7xp/FhA5lh1i8uieSu?=
 =?us-ascii?Q?zfi2siXp1vQFTOFPgNOZbd9lRSAvhVMUPhAqFAx0qE8m7Z2QeH9g/i3TqCp4?=
 =?us-ascii?Q?+03YmY0aLrNUF+XEhkPhqqodwCCV8FvjMf2+XGUvETo70XdR7jVbQXMwuYsQ?=
 =?us-ascii?Q?WMYnVwfv7FvlHEda+AlbxQf/vPnop+KpNZ+9CuggQb2CFi/zKK6nWDjYdvyn?=
 =?us-ascii?Q?1YcykAp34HhXEEAX0VPW9HVcrtEXamwBJoVMq0bzgarLZ6gvFcG8jptBnoqL?=
 =?us-ascii?Q?a9MLiJ5wVTYfOjkhS7fa1l8o36GogOIuosmnsTl0DIPp04IfqObc1O3kRDXr?=
 =?us-ascii?Q?jRXdyKPg8he6WiAhkIhUoV1/3jk2uy7RdQmKBrnrxlnGuImxbiy9vZWIIycV?=
 =?us-ascii?Q?eNOA+/FLgcUxKjU+nPCCF+UDXZcopa9WVHsQH84sz443FclD1rcH+ODAQBxn?=
 =?us-ascii?Q?CUaSmA0pQpkv9t8XDzeJbNUjWPuHHoTEyLoEtuMZ0fLXC+VLv0MmRZR4pGLl?=
 =?us-ascii?Q?l8tfZ2LmDvVAuNsltCTIdDjEbRErtXGG3GaYnN35pyOQ/D3y5M6fvVUPI3+E?=
 =?us-ascii?Q?cFtGkHjVSYLIDIoZfonYQ7V0GTQ+d+5loN4qQl30qwnb99GP3GB/LlVvVv5j?=
 =?us-ascii?Q?NxxDI8B9EUrlVOAQnVbU3rb3563G47pn5FddCin8NvKcbqWd8NBenudmN17z?=
 =?us-ascii?Q?lBRPmylKCaovv7PvULBmMA7/iHJ3lqCFSuGrN51b+umnfH52T0uVq/hOz9Op?=
 =?us-ascii?Q?smL6oX5cTPDgvYbY9YSZsbSA9354sreo5LbaBXQdYT2EaptsnQvUQooEDx2C?=
 =?us-ascii?Q?ioCpBG905IJqtbVTA0kDAS/DfQm5+cWYjsvX7b3tNonstfj6ThpNvDfkoQCf?=
 =?us-ascii?Q?v5c2LzZiA+sM8W3Ont4BcdHOsSa3/A8ddUUHTVR2pnNYpf4uSpsO1AWLGJqE?=
 =?us-ascii?Q?jOQp5+UZPxYeInqMr+ZFsyu90+3fBqHfyfklOc8acmY+oYaeogP+yb1ZHcjo?=
 =?us-ascii?Q?Rrs0LQ8qqAh/NJRnFSEEUpomEq+gOCDeJbofnrAgDEKOx2bm2Jom0jqXZ83T?=
 =?us-ascii?Q?Xgc01yEp1VtB6Pboijlg2s902kHDtgT4NRufw4PbFmlHqt/7/Aa6vDqyqjXo?=
 =?us-ascii?Q?j9G7lZOYHbVdGBu3hLZplT0LYotZGuxMxw/11AtBJXxRAGaaCKCYgxHHSfam?=
 =?us-ascii?Q?hz3KPR0X/Z4EVAFxhOlZJ8+Z6Xdugto=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43d5225-3b3e-4888-b060-08df2459ea44
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:01:11.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGDyOkMpIIwzLA0GSBEU2db2isUOnZpmDsKMT04+eTEYVt03TLgHR+oz897etjOjFbWGcWcupLL7SKcICQv88ABKRBrPhTpwSi7PnDCeZVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0796

Add device tree bindings for the RISC-V Platform Management Interface
(RPMI) voltage service group, both for the supervisor-facing regulator
controller and for the SBI MPXY channel which the SBI implementation
uses to expose the service group.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 +++++++++
 .../regulator/riscv,rpmi-voltage.yaml         | 130 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml

diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
new file mode 100644
index 000000000000..8cc53879cdf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/riscv,rpmi-mpxy-voltage.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI voltage service group based message proxy
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines voltage service group for accessing
+  and controlling the voltage domains managed by a platform
+  microcontroller. The SBI implementation (machine mode firmware or
+  hypervisor) can implement an SBI MPXY channel to allow RPMI voltage
+  service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-voltage
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    voltage-service {
+        compatible = "riscv,rpmi-mpxy-voltage";
+        mboxes = <&rpmi_shmem_mbox 0x7>;
+        riscv,sbi-mpxy-channel-id = <0x1004>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
new file mode 100644
index 000000000000..3be47703af5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/riscv,rpmi-voltage.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI voltage service group based regulator controller
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines voltage service group for accessing
+  and controlling the voltage domains managed by a platform
+  microcontroller. The supervisor software can access RPMI voltage
+  service group via SBI MPXY channel or some dedicated supervisor-mode
+  RPMI transport.
+
+  The voltage domains are discovered at runtime from the platform
+  microcontroller, which reports the name, the level format, the supported
+  levels and the always-on capability of each one, so none of that is
+  described here.
+
+  A consumer names a domain through a "<name>-supply" phandle to a child of
+  the optional "regulators" container, whose "reg" is the domain's RPMI
+  DOMAIN_ID. A domain without such a child is still registered, but has no
+  node for a consumer to point at:
+
+    codec {
+            compatible = "vendor,codec";
+            vdd-supply = <&volt2_reg>;
+    };
+
+  A child may also say what the board permits the rail to supply, which the
+  platform microcontroller has no way to express. A child that gives no
+  voltage constraint leaves the rail free to move within the levels the
+  domain advertises.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-voltage
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      Optional container giving discovered domains a node of their own, for
+      consumers to reference and for board level constraints.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^regulator@[0-9a-f]+$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+            description:
+              RPMI DOMAIN_ID of the voltage domain this node describes.
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-voltage {
+        compatible = "riscv,rpmi-voltage";
+        mboxes = <&mpxy_mbox 0x1004 0x0>;
+
+        regulators {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            // A node only so that a consumer can name the domain with a
+            // "<name>-supply". Its voltage stays free to move within the
+            // advertised levels.
+            volt1_reg: regulator@1 {
+                reg = <1>;
+            };
+
+            // A board level constraint. Equal bounds pin the rail, so the
+            // supervisor applies 1.8V and refuses to move it afterwards.
+            volt2_reg: regulator@2 {
+                reg = <2>;
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+            };
+        };
+    };
+...
-- 
2.43.0

