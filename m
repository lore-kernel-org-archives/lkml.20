Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2122.outbound.protection.partner.outlook.cn [139.219.146.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38193CEBBA;
	Tue,  6 Oct 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275653; cv=fail; b=Q5fm8JbYERuCQhg5YtbD224XUUsCW2/u5WgBeudVFjLHseyG6wwerA5Yu5KMGmCgQxGHkB6EkIn6BA8nhp1j7YnqB4SCqPJ5KDPZzNSV055KCr2loHihmmk0nIYDIKancj9DTSqEpDy7gHKr9weguOPCJsHjUM+rqB55wElOEgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275653; c=relaxed/simple;
	bh=Wz1poXpKYWeraqOdb0t1t7uxXyI2X8j8NqhwrrPoU4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uy5XefpcYWuSll37RtyGf8W3HiMeo2axlcPLzLl4tqJaWelJBOBnp5/VLddMbQeJaK2CSeroNwEeYuE1O8wZpRpRcIl/RJSEDygdIEcoOKvpRf47MpxwNHYPLti505wn5EKwQ52TLd49BcTkWjmvzoAP63APJPTirpDrbctgUsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEmIoF90glGsNdQhEfsgABTNuMYCQPGumCQ3Qauwt6IzHG4K/U6p/rnZUNCKRVzYNmGloIkRk/0bY2vssOKfjsCHafNX6QBe9OZvlTJrTydzy1woRcQ9n/kDyPT7dzQtnNFFkN4Ft4G+CjnvQyf35poeGMMAVM5zG5VFof40vBhHIHn9Zmd1Fo+f/DD3SAEUXQ0zRbyWPwnVtiIRt7CSe9CeeVJosifnvnBVcOXggv91RF50g+VEuMoq25VQV1PHJbn32P1Kf5uQHCFQI5pjGIQVVux1Y4icgHJsiNN2UfvzQZL8dDxbFffNBrCZsP35tJzmDEgJS/egZCdWfe3rFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJFLH82PBhDkqVgw2g+ZvkZCtL9yop02dvvhIGa/7BE=;
 b=ivxiKq6Arcq6+YuFSnzgoOWer5HnvsSsJUs0Yhq0LFngzfN4+m7ab0SNalo4RbNHi3efl3tGR/RBq+26vxq1bhrPfrAIsGaVwUN8SNggHzrTAAhoSHscPytvYGQe3RzZ9l0Zk3opLYk3LUhEn3nwa/9mf5JexttFtSqRi1ba6nj4pCTLNtVtBO2BVRogD+y4oz0mzxao6VznP3UJ98ZnxT9rYeGxs9aF+0TuQLVl6ANOjnSNvFAMmBAjuPm7gvlXmsWGNXrXL33KKbsm3g3SEnhv60rvph7yPAW/PWCMYyoc8Pw371Uy0LsJzG/WQ26BHo4qkoeA6mixsdGIuaz0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0556.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 08:34:00 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Tue, 6 Oct 2026 08:34:00 +0000
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
Subject: [PATCH v3 1/3] dt-bindings: regulator: Add RPMI voltage service bindings
Date: Tue,  6 Oct 2026 16:32:57 +0800
Message-ID: <20261006083259.2206001-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
References: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0556:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b1ab79-7794-424d-fec3-08df2384913a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|3023799007|13003099007|921020|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	axpTJ6FEsZM1kQbAEmrlAz80AvMDmcxrrJc+3WD4ke/6yC9X+77/15U7nQOiJSvj3OrNDRnV9PAMCDrBVmvY3B5T1vZ8jt9HDDjs/YIR4kcXsQGk/lXnxMkOvrngD7qbPA3mRGRVrW1gDv4JX6hNVd71MUjXIW/OawvMJVKjqja5inLhsd+UPnuTk8ZGFuMDanmYulARxkY0kJg+kTpjtkzX7vkGSDnQaAuxk/sLf4d6uLT61GWJ6bqlkCEkUrgNKYtzEjn6r1DYd4/NtMcIrDZXNxEZVK/wcRYmnLvPUMLoN01vBBDlq3cfiVO7vk8bDMU2KpDfs7Rcnmvp+VtiozT8Y6VaVzsztJGyfb65N5i3W/aQZBx799lQ5mVG0HOIfT1THRIXZoRJT74ruK9HRI1YETnwLo9mUFxt+PZufPWBlrugSyar2h74exwAiOlzLPQ5Zh1mcgOnGwI8c4qnnjs2EaLN1JVGMOvs7o9D/DDKHiLMcdDRappsXQoQuZrDzguprcEyJApJM0jMLcPSxcwT7fjFahRa4Qy7CoHGDV3JYW7cIYYeJ268v/OY73L0S8zK8xVWTkduke6bzbZDfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(13003099007)(921020)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6MsvH3ItW3n7mFPmHhbWQxdxXjKZW60q/ibD20y5bEkCrqiu/AmhwCve5tjS?=
 =?us-ascii?Q?b0JmxkNRhvZyOxxfmngL9yMnTQeDdboahTyAiaTjGVb9diaYmygDG96me1p4?=
 =?us-ascii?Q?Bi8zTEq+HSLVMaGzsM4RHTyiE3F0I66Wf9pVtVvQj3aSkxk1rEqKFqqwAHmT?=
 =?us-ascii?Q?HyxGbl7+lkDMFl3lPVsXn1UwdURVjAGZlFw1DStq2njgtBV3BICeTayWnoQP?=
 =?us-ascii?Q?jmzKzfeUf3EvWI4x9FDjM8Cdr9E6r0rv4GbWR6Vi3JjgZ+yqjw863LysuBCp?=
 =?us-ascii?Q?P9QUQlt3jsdX8F8bNPJSYLToOgQBQVvRE4IJGhNP0Qj+auyFL0wAageRydlz?=
 =?us-ascii?Q?6RhfgYkvIOEoYaE0XfIi/GRwiBuV/F/P0NJTEExTq/veZ9FyNz80Pv/9dsC/?=
 =?us-ascii?Q?/l8+Qug++eqNZ/xwMxuw5MGMXORzWx7jjHFUm3c13WEZy6RtapInQdqyo8P/?=
 =?us-ascii?Q?7clev4XJl7/o82Nr0qKVR4z5psxbq/6Pd++mBYeTSh0Nu9hRNHgtMwSH/H2w?=
 =?us-ascii?Q?1kEaW14t9TRUHGRy5K+ZOBXHsRJ8y0jnufTEgE/IihaQE8ApSSeIPaqYugmR?=
 =?us-ascii?Q?0XZQlzASRc6pc66n0zpvamhrNg7bXfoix0NHf3mZI0qSwNG6jcJYvvG15HJI?=
 =?us-ascii?Q?XZd089yflHAvGAKqlW7ykW/h9opK01XUYOqSheKEUjjAV8PLoxI7f1EER9Ox?=
 =?us-ascii?Q?RFNK49WdfqzTvB/fBOe0P1JqnAJD6xLZ3B5gql24tp94TFzMKYFHLF8T0tsw?=
 =?us-ascii?Q?+/z3VXVdUdBlyajnNWlTTFqkO1hpCR7ZMYBxv/MXj58OJbvvNwFPOahWF+ga?=
 =?us-ascii?Q?e5cIf3UCt2AMjiFQdkAZb7me1yTmQJHBtmd7g3RY/yUKifXwzPcR0kd54jsY?=
 =?us-ascii?Q?eLGjQhp45QEVA3jlAAIUt66/uoRb2Zy51EctAJYeP1SZ6SjadefQZY9ccYdP?=
 =?us-ascii?Q?71xvGPtBAeUFM4iWsXTUVh1cg1+kVQ3bXjDfgo/XkJZQTEYUZOkh0WSZhAla?=
 =?us-ascii?Q?K/qcNacnpqnO29Sc8zQ1ZAKlcN473EVddTQMOPKi11nZtpinfi+KbKPvoKqy?=
 =?us-ascii?Q?owqyFn/UhNHtN31wFRwNEQXTkDBOo4AfF3rhvUgnPahMjUQrRQUdD5nCdABC?=
 =?us-ascii?Q?ofEY4VJbgFY2H3ulmgHvj6P5EsCkXyy9dCVz00iixcZ/YmPahPEDrBesVvGs?=
 =?us-ascii?Q?qaixqt4XyW2rXPxSLQxPYKnIE575Pg1NhH1VuE3jX1nqbItlwnw2tS0MYFB9?=
 =?us-ascii?Q?pDf6f4u8nByrQR+on1n/PFEg3B3n5NfiiSCFP/DQmAMmcpZwlzZpZtlMvz+I?=
 =?us-ascii?Q?P3n4mXlPiHLmIKdaUQN/VhoHRpTGNVsSCh6TkvJNjMQyFBq9s9vPAQKQfqF4?=
 =?us-ascii?Q?MAhDIX5ISKI0NkENRzR21wAjjkxoz2E2LkrNqpvrxuEJaN06CdJUBCFbBbJa?=
 =?us-ascii?Q?3ODreHFxsX++/CtU1eymhUgn4tjTahgh3Xm8PcAxiFobhkgi5SEedvgKUWDl?=
 =?us-ascii?Q?xv74+GajeX9tZs0AC+xmzM1l5tft/0xfrwedW0bmu91b8EEnTFRVJVXYt/sL?=
 =?us-ascii?Q?xnpkLQfzY99Iry7+hKU18Pg6IIg/riCRw2R+nE2zguYBRaNlumxh1mUe/xgB?=
 =?us-ascii?Q?LgzA9Bmp23sm4NMxTsqWVf8LAU++16CiGzVKd8O2BCko/P1t6K/AFRvjBGGK?=
 =?us-ascii?Q?1Y2tfedvMDsunZZt0mpe8nam4MqXY4aj2GSMsQ/D3ck/SjmNB1RApMZ9rLVV?=
 =?us-ascii?Q?U8d6hsXHshz3XZ1L39DrTKjIwYaZaww=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b1ab79-7794-424d-fec3-08df2384913a
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:34:00.1097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIaqVCbrYt3ZcCxNEJ1N3IbHVrLwYDKk1VfqQd8HJwLxHWxJDKQgtgrFXu1571S2kJzwsPdYfES9GsmSPt/x6ouGceFBm7/V9E9e+DrHrM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0556

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

