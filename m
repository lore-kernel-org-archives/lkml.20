Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D65563FC0;
	Tue, 22 Sep 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093574; cv=fail; b=ik6JcmD1dHm2eGfVGBJ9kGPM34NrNipt7tGY5X0CiXEdtgighNZ9mZP88swqsm84uMtAqburE+mQhcVgRCvjj+v3Awk77WbOgqsQ4sth9OMblcsIhYQPMaF7wRBxuWH6J70Pq+sQfbFvjcTmAxI78I+sSfAsYLHeY1b5Sttz4QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093574; c=relaxed/simple;
	bh=EfGcPCa64Xj+0dnY1vZg/jeTpEVXfTG44ZthDPN2Zos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NPN6pSN/64OodTZJzyr32MVwV4gUidqyqw6ljasWAJxRPv2I39220/4b+jZtOCmoyRQJb/Elut5eupk3wZJBDh2JCxmajB/ptpJ76DsGrxxOaeyrAcx14Phyxg7IaYaQUnWGNvINXsyLYTdzDVbt8r/S51VPLZqPHD4lZnx5D0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzrumhrxPLhrDsAInBs39LUfay41wRU9fJsMkoxsCFHhvMx5vINeOQDnU7P0YylMNPGEvaGipv5Ot2UYLOhqswB+GJ441Lr2wlR1cZrmIaf7jvnIyujKtG4cWp7ZPZKwEdah8pd8431IPCm0XEWuBPbjWS6RLJfLYq8Bcou6iQAGEsRbesCWWYDzm8N1JxHYiifvRqa+k1ghdQZJi4aMgIN96YQpiJ47Dzj2yGP5D1TvePKz5/iU4Rj737c5DMYTIQx9tRjVs5yQbrjyaz+GZod6DoRphElXN7L7rcBCwLjlcyTx36T7zr0mlE/LGsc8o64OesoRtqlm7W1ztx6Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viOZb9lGILMhtCUjCsOmQ1RdMfdTcfP4nSaCyP8ewy0=;
 b=ahA6105MP7nIGD6qf0djetd8x/dDBEozAbFoZbe3rouIZA4lSFIoyeWvtyJwj5MJVuBXF7MofQDBREb4rX9eYDm6Sf1/o8IwUtojNMrIpNSmDHMZlbiB8kQ3vMwZNiDfOaw/QwhlAKpGPZbcthvyyWuaDSf0FHYrcuqgJpokDkoHWVAAASSwceDCLcPTjL7Qd9jOPRlCwukWK1tDVSnKghszjJf7GU/rl+xGvU2qEYN9v6nqbqelQAQHMpg0RJ+5mH8HylE9v3u3L606PENlvnB5Kpa6FccpwfaBoTkaaafChtyo2gi7pXWIF+X7QGtfg1sGi2rMCEVkUO6iDRgmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0492.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:12:38 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0428.015; Tue, 22 Sep 2026 16:12:38 +0000
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
Subject: [PATCH 1/3] dt-bindings: regulator: Add RPMI voltage service bindings
Date: Wed, 23 Sep 2026 00:11:52 +0800
Message-ID: <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::33) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0492:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f067f0-c344-4e20-8935-08df18c45220
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|13003099007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	ERea6Pk3MRbTQs7AugZHFWz0O0dcCMHzEjGmormRO+pG1vsCeeSpbJpP1rbATwAR5bbf7gKaAyW54nzcxvjHLrZUOsNICqfp12B7xlekJ3hJjtkDkf2WYi61iPPnJsclcK3oKmgFIqxnsp0JKdIFk52umc8yNVhG7oi4szq+gDB2kRJWNXEsz/r0KCF5M4Xr80Gkipve4n3q8b/zIrfDsjSP8zXgyoVf5Uy4TWwG9kfZdfU1zu5Fk3ge86dtCNIlo2fq8fhaXLUy4+fvY6JA4hKVO7bMGA2KdCLzp2biOl9vW/tzmwoWFNUwJqz36htNr7YMSh6VJTB6oQ6OanScKlbz0WdzEgOGTKMSrNzWKURKtW/OFikBy9PM3hxtijYh0XIrAH0CGF5Y0/UAJuAH+pufkSkMBpAwYBGRBOL5464seJvwS1mHletKX/SvyuJfnfK0QXIh6P2yMrinky6OFo0fds39ps9GMTUgPga2vJQ7kTnJ9E5ZIIqveXt9wKFBqh59YZdk69fGR1rGOky182/cUP5kQP4FbV7UM8+FLPc4B04XVa0dxovNn0AMCAQDwsvE9Bv/fYSon/do5ghFLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(13003099007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2H0t99qlI0WnFU/cUe6r30fkmQRqdlR73n4sB+D6ixjsHXavCQVCjyGswfz6?=
 =?us-ascii?Q?KNsIXiiMaHH3+JhhCe2PZsNK3OYTgIXPFNS/cQEL7lAYNAYRyVDnvgVD4mnb?=
 =?us-ascii?Q?LINEILy8uj1U/FT9UKOcy51i19dSyE/OSNn/0h+HpZajMRXL20JqJ+hu6alv?=
 =?us-ascii?Q?Do0qVImlfodCofbJXRouI5wQL4l8/31S923eJMRtZvx+Xy5qqSkJuOS8arhP?=
 =?us-ascii?Q?FaQV/dPFJIWHP+zD4McYK6WmVNe3ITSMwPgH3gpxCvCimVaJ+pN4MljIwfx6?=
 =?us-ascii?Q?55Ws3nrrCtPavLVSzhfnQsBH8q/0xPUG2RbLV0Tc2PfET5lsxUWeWpK9ZXUz?=
 =?us-ascii?Q?BKKt49Rwo9E8x4kUVmMrkgNc6aIliMRaDXS5nCJ1rR5K2ivIJQmDBElHC7pa?=
 =?us-ascii?Q?cWtu3fhsa7ViQZG291TZzxmfHBVSR71JVeo316ORSsyj7nE/k+iRPKu32YMf?=
 =?us-ascii?Q?wruSnKYe32Ko1T3X3TM/Xaeec6w1JYPk8snFt5W8Q9wobHczgZd3oRAoLBtc?=
 =?us-ascii?Q?qoGPKF3fH54bQFQi5eKHzgIDrDbdUo1AWhq396uki3pQM0cDhbZfmxqg52wd?=
 =?us-ascii?Q?+MZwS6oR/1SK2VPy4yQRVSkrkulgm159bxT9gAk3wqbCCrfog9o6viScBTaj?=
 =?us-ascii?Q?DCTYttZ0DbZZ9wcj3S6EB9CL5+/V19HF0mLzEUFqTQzV1tzBzJPUCk3sJTSV?=
 =?us-ascii?Q?ehg0f0CMD652V8ifV9z9hcvvAIzMK5wZK+lSKw2n/cuGcRqByZJCILr9vVKk?=
 =?us-ascii?Q?N6l1MMAN9pWekAT2BueMsTxeCio/mynQP2nsW6I6AhOQl35i25OnOAhTrRCt?=
 =?us-ascii?Q?InxGHSacdoUj9bN21qgLj72AgOC0DQVRyf8t+YDL1sCiUhBH93MhEvgnNz/b?=
 =?us-ascii?Q?G03lQ2S15sCKxkXizK2CoVuX67YAGMAoXgB/3YDJWyysDcaIHfDdQoz3Ku9i?=
 =?us-ascii?Q?4wgY2tLytEDKieYV/57NdS6QmJa1CPe72G7rX5VKfjMAppatrCjO0QmTCxat?=
 =?us-ascii?Q?fOZmdpwpup+N/UFnHyd1BydLUAKJyeSVg87UhOAidPI9uBofFBje2XDn36W8?=
 =?us-ascii?Q?DREScqrW/aaYHaXSBeqx4lGQKXgAy2LCYq4Icz83ofJ5QNeAYxk/XcaMdK3k?=
 =?us-ascii?Q?9Pg5nhs67XXej5zCWiygUK4+0pCl7R+Q/r8q07utRyLfPqn/dYATyoHzw1iY?=
 =?us-ascii?Q?qM3YZ0pOuLeMWNIyAAdfaMCGWmgdFGHPLbE3nJOPtaeLFJmo3vVof0zH9cC7?=
 =?us-ascii?Q?/UrPygMjln+bVZFuSChQUVwv8r7PUe1wYfnmgKqrP+W+jlnz1/yPlruF04TV?=
 =?us-ascii?Q?VXZhSU5NjiBqStpb9usDToUAM3J3fp5lHwHpYg+9qVRo10jDZSRjgvW0aG7U?=
 =?us-ascii?Q?AG0TYqrVwycbASw97tmHHn4BOdNrcMCEZhq1/xMY0DCi5ctueusUxyi0LVDh?=
 =?us-ascii?Q?ytYQWNDv8Ly5hYYIcNuf0+g4vKnT7VP5aqPE0wUfCmsCMIBJ9+ABBirKEVBJ?=
 =?us-ascii?Q?tCg3VaSh3nyyEDFz+pQa5Eieb+/EQRLt9wYuV/hoXMeMZ2Dw8XvWBy2/Q1Lc?=
 =?us-ascii?Q?bSF/IqnG+kygfPDZU5AGtLBl1WfxpwDswoT9CWcr7oW+Rb3e5TBAsr0zqfwa?=
 =?us-ascii?Q?2O1bkOfkAs1bpbOGgiSt2Iv5A3C8FcuewQev1Wj5UaM/xJ9yHNjHGrHuQwNy?=
 =?us-ascii?Q?bZAKqopqVwhnujUx0xvBUln3TDYTOJMcijV6ebfgeqxfTZe7sodyF+F5px/T?=
 =?us-ascii?Q?DVbAOxgGfCzHranrbgRkphMS79yVu0g=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f067f0-c344-4e20-8935-08df18c45220
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:12:38.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk77ruHzRMiJFvverz5dv6NeNPNnKPfrRwCV36V28xNXbWKoC+uNnktqGgPieGP0c3cvskl7x6ilCiJr7LIks8d3j+OPJVJ9mN3ypkmQLV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0492

Add device tree bindings for the RISC-V Platform Management Interface
(RPMI) voltage service group, both for the supervisor-facing regulator
controller and for the SBI MPXY channel which the SBI implementation
uses to expose the service group.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 ++++++++
 .../regulator/riscv,rpmi-voltage.yaml         | 150 ++++++++++++++++++
 2 files changed, 215 insertions(+)
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
index 000000000000..66d1c26592c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
@@ -0,0 +1,150 @@
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
+  A consumer names a domain in one of two ways. The first is through a
+  "<name>-supply" phandle to a child of the optional "regulators" container,
+  whose "reg" is the domain's RPMI DOMAIN_ID. The second needs no child with
+  "#voltage-domain-cells" on the provider, a consumer lists
+  "voltage-domains = <&provider DOMAIN_ID>" and names each entry in
+  "voltage-domain-names", the way it names a voltage power domain.
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
+  "#voltage-domain-cells":
+    const: 1
+    description:
+      Lets a consumer name a domain by its RPMI DOMAIN_ID, the single cell of
+      a "voltage-domains" entry, without a child node for the domain.
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
+    rpmi_voltage: rpmi-voltage {
+        compatible = "riscv,rpmi-voltage";
+        mboxes = <&mpxy_mbox 0x1004 0x0>;
+        #voltage-domain-cells = <1>;
+
+        regulators {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            // A node only so that consumers can name the domain. Its
+            // voltage stays free to move within the advertised levels.
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
+
+    sensor {
+        compatible = "vendor,sensor";
+        vdd-supply = <&volt1_reg>;
+    };
+
+    codec {
+        compatible = "vendor,codec";
+        vdd-supply = <&volt2_reg>;
+    };
+
+    // Domains 3 and 4 by DOMAIN_ID, with no child node for either.
+    phy {
+        compatible = "vendor,phy";
+        voltage-domains = <&rpmi_voltage 3>, <&rpmi_voltage 4>;
+        voltage-domain-names = "vdda", "vddio";
+    };
+...
-- 
2.43.0

