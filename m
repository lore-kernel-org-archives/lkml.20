Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CC33D6ED;
	Thu, 10 Sep 2026 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002467; cv=fail; b=YHt4qNCkJCxMkGziB+C/Zrd5u1JUDrlGT0vsssjKt/RnN7PpfzDs30mVI/Yje59akJMWoavNP6Occ0NdEHtpEI9AyaTqrWHMNMF/MuvOMLi1O7rHbnyVArgiPokVUALqvIKBloGqiBZQRAdKfS+yf1p3X/xLEWpuZX8uuKEnBUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002467; c=relaxed/simple;
	bh=p8prooqAUCsvg8jLW6OUcIUXYINJsV2wXRfoS8mLuao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q7m4JLEeg25xdQPxdpxWPR1k65KWkJUuCqt37yKesf70nnqtFZ+jMnUNUBfBNrEGTrS5k0ZB9J3jYGJEXR6wcdy+gRCQH+K1MX4HW4e/ublnBoEJ3Yi3LvpgxnveydKTJXYDOKqBScnKRjDBq13y1m7V/JFMHKWzJGPO56jPQGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CvPLzh5a; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CvPLzh5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLegXXPur6RvlLeL7IGrf43zQn8MySgmpHhpTYtNhrGzSEi5xkETDLG/kRc9bxrG/lB2biJF+ht/yzM+0C3nI23VTIJi7yJ8aq4/QHwq2t/7d3EDq3xBzK18zFUOVNucp3KlcTsqIri/PmmnD1TQHnJ1jO5Yo6YHP3ON9L5a8MXUSVpDqvpwcHQSGgvz6ywISZ70oc6ZoTfB9O+OyUV6xlfraDxp6UQj+DkxUVF1ALDoWoCA42X13lm9RpM86L6OvQVXlulTyf9xdK/A2AEXUwsBDiOD/MsgFNTfO00SAX3XC7i7HEP0ph8R1O8ZqyaoiHarXFtuEwm/ISYwOa8jIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa62RkRctZT8Gr1pr2Ea1GcAPm4V+IFchQk7JTkEpPo=;
 b=l9lZW96opQLK8KgTkkNlb9XXnaitqO1dBmvByqJ/PF5RvyUM92GeaTp9Hh5YzZxDuX9plhK1LJY3bpwjaY/cIrlYzR7wvSJc3lkji1N/tMzDQynQGFYvgWsDR29waauF1ktSpmB/HJHXsNytfHQbblg/LMe/QHo+EmJmmsM2G8bMKt6tbjA4N5ieAMw4OaxEJVxi2XAD9p4XhMxdSrzbwqd8AdJl7McIS4xMegNzJt+MqM/5ef/+5/TkT2nRswepzi+sIw8MR8f6ItGYjqT3nur45W8p4A42CPVL1fq3GUYhgtvZoHYj8jJbwcuGJdiXYCpBw+5EjSYzinwlotbUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa62RkRctZT8Gr1pr2Ea1GcAPm4V+IFchQk7JTkEpPo=;
 b=CvPLzh5aIpLC5SFM2t7mGNjY8YeAy9D5lWAzdJChNGV/J6c5cyHSusMhaZxEwOGygyMtUD3IsArF/Rvde4FrBALlVqDF6tDNh43xuTBhHVIm79/HqKtILPDsgYvNhJX5tcCcmqqjhqWcUnPpNmS+TiHQSLk3aUsNYx8mV/WMlT4+A8UHz2agnwPlgBk3LANzE5fi71GHYmleZ+uH+xmp7MoYi8TCn+IpsaZOD5G39iHr/MY0kagelFwOAUjjkCbYMGWgZ7+r8m4GNzyr8mTxcSJU973zxoN1PqlZrgvRHNO3rrAqzSYzk9w8SbbfujoD+6wkxhnK1WX827UiaPC57g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:07:36 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:07:36 +0000
From: marouene.boubakri@oss.nxp.com
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [RFC PATCH v1 5/6] dt-bindings: firmware: add OP-TEE over the RISC-V RPMI TEE service group
Date: Thu, 10 Sep 2026 03:20:56 +0200
Message-Id: <20260910012057.106966-6-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR12CA0039.namprd12.prod.outlook.com
 (2603:10b6:930:49::13) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|GV2PR04MB11739:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ee09b3-2855-4dfb-69c6-08df0ed7e6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|6133799003|18002099003|22082099003|56012099006|3023799007|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	+rQSD4jSbgN4Rpfs+MQoRB3/N1qyNyaCAWUK08SnY8cuYDG4Lcn8JBuZpymJdgAZ1ZqAbx/9024MmdpoPPXLdGlDbtUeXvYqHAjBTtN+tFipK8hZw47Ss/MbxQRopmUJZ2kruC0l5mIZRENleJY/kbuy5T/LrRJ8gbTTXQw/AlzzuDO6d/XBPnVa3V1568wCH8r1OR1s0MABudAW2vSvf6oNiVwzkFyhyZAv/lLNKbJuKMoGxqtNmvsEMunmixPEWKhDI6nri0tXVvFvxcY2vaIqcXJHjA4CYOTBzph3XHeOFUQhwkK3KW0lq9VYy8Kpq5ZlYtIhNqYWfPUc1jSGqKo6psFwHNDtIxp/r3hxUW85Y22ZaW0aMfZiXFy0bf8+UYTenJmEgwHvD0O1fvpi2mp6RfwGoD+ltHDi+WiFCdkaZVR0NL6VwpklJyH1vaLS2Ju+mwYnP6PQse8LXNof0MrmQx7Rs8jqIRDAoNxf8s+hO7M7QiWmBqTvuSAW0weHKnBfsQXG1lLRac5EC9C0sXSYtRLwNUFSHEyrlcHr5q3AfkJZ7ZlXp10jea8Zw+A7JSFD0kOC/NuksvzbOgQPGuElka/+ilQ3ySWtWcVLCO1sIpYPxqGSZYDqUK057vTs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uwqkF0SRRmKsvZR+j1g/mPGErSo9rZJ9VpZrWOb1qZTDjofhz6AnUl/QPUbq?=
 =?us-ascii?Q?x5rrTzAwA5fbyIzS/ZAE4WSgj4/q2aYDCpw2IOAjaUnDP+x5mBT4iVEZA/bO?=
 =?us-ascii?Q?zJkVP1XcCz6geYNlHU3KS1NCxYT3Njsx/VDH2p56Ml4+qq1czD731p8baKQl?=
 =?us-ascii?Q?QwANNUXJgQty3bUUuLKSvT36SBm6gR/iyXplOi5aIPbW+IC7lSXlp1J+Q/Mb?=
 =?us-ascii?Q?2/+ubNMRl2VT2zeaHKju9iMKFQIizpn1NycxFcEHuMhww1B824x/e084z0SP?=
 =?us-ascii?Q?PHf/lUuLgX4m6A+V0KSM2KpHXZ12SIfgVbmSF+nCRgt9FldPI1jYZGO4BlCn?=
 =?us-ascii?Q?L57t/wvnZvuCCbbuG1jjBMweCO3tB7KU7mYYv12Gm84VFP6xZVw84DRbzh1e?=
 =?us-ascii?Q?SDSs3f2fxkV/x2/3ZtAj55r3z4wDtfyiHjO3LNsaFYGQBsj/l73xuPmIT7+a?=
 =?us-ascii?Q?UoDL5rbSVX3zUkHf9eCvGUoW93qfxw8YCwt/9k+RacfqD5qJ4RuXvk9ytTbh?=
 =?us-ascii?Q?Ye3VU4YeVjFQ/bNsNg0qd4JqJZh4OCMWrgorL9ih14nnMQOvKH32V6kpmsKu?=
 =?us-ascii?Q?j05hOm1nOkhZvLeVINiw8u1S9Q5A7ulKr5Jkev9uUKlcMzr/rSBAFPhQndWr?=
 =?us-ascii?Q?Yr1pe6XO75WqGjRCUwaJ2ugkmsADRfK5xUiB2c7DkSsGoS5p3Ry08Pw0M3p/?=
 =?us-ascii?Q?HuCTyNActqFAcYAV5LGTG1OI7+646flxBMu0jm5wzL4Y7htnwAgaUysExLlU?=
 =?us-ascii?Q?0Xl7CxMRMZQxul/kbQY0Bxmtb0uY/Fmops54+C8J9Wyeu5zFMGNiSNGpFGFp?=
 =?us-ascii?Q?tlK2L6lOEEbm8gFBkcMaw5r+9izseLfSbXP/nqb7PQr7eXKtrq9GQhzy3Ojm?=
 =?us-ascii?Q?p354xpUi8BWUrQNGZ5ph8szji2QhHkdEmup4CRDz7WwnKM3i+9buo9ve+Ugg?=
 =?us-ascii?Q?SMWRWQ75ep8oGwLyymaii+pD6Dm0/a2uUUp+q5vUMc9YjIsaPpglhVp0solW?=
 =?us-ascii?Q?QQJ2SkLSEZWFBseSkQcfMDL01vh+QvFuGnQuZAXCyAFHPDdDxtwga0HY2T4L?=
 =?us-ascii?Q?yGTOLgM8mzI2n+zsHD1R6V6T0yvOasWrj0RNYvNWH9WT9rhc7DfV3j8fZPoF?=
 =?us-ascii?Q?/iCbeh+cdO+j+zkXpgjfOSbAmpgUbe8QF7R7yfeC0L7s2RAGa/BxRa5i8/yQ?=
 =?us-ascii?Q?WEXfm85nkLV49wldarSG8dKUYK1raJcBix13itWO27ttO8LhDxZNDLdVO8VK?=
 =?us-ascii?Q?x7W4eXtgGTEKSQl24r32p3KGjOqG1CCtqHKBdJAetSx55FCuNtXenYhw9oqp?=
 =?us-ascii?Q?AGz4ht9q9HpNhMBLkGukmGiiZVNnEPQLrv0khb1ryfD187+SFjMnzIvH1sLg?=
 =?us-ascii?Q?2NmvZhr/ea0cahPLYkhQTX1rZk/hABAQ6mwYaBKl7T4u18BCM11N1VS4elv7?=
 =?us-ascii?Q?j+YMWvZKo4TevmfbJMVTLYPamlGwsmx+OpNqIlNOMRhJh4Jsq+pZsl0zeWrZ?=
 =?us-ascii?Q?hzezV3zTOpAz0t5Xf1J3uL/LaHQXtlqz4RRDkEb7xuAMcVx9bCqQJHvLSFBp?=
 =?us-ascii?Q?RMy256AddOuy3xB0p+Lxd2cBBf8x/6SW4YK+PyikYfE3USCcW2sinEO+2+vo?=
 =?us-ascii?Q?V1KxisDgQV2JWSS7UYktTg6S4MCJnwBcuM1RV/QRSKbN95hw03wGi1ODcXXv?=
 =?us-ascii?Q?rL5JPTeOgmDxbEqoRWPykxYRyEBA3MPGweRzypwgyq685OOIRz59FXk4YPhg?=
 =?us-ascii?Q?UxJJCfX4tvQYeOHJamsMnLTfkr5lTkMLoFzlbdHs/AAUpcqMgUys2u7EDYqm?=
X-MS-Exchange-AntiSpam-MessageData-1: Feb2jfC2WSHevA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ee09b3-2855-4dfb-69c6-08df0ed7e6d6
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:07:36.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLq/3sYiAvvisgrGSyEhzfK2iioRB2phxyjlHuNL1N/kZ6V8eqtrUtlhN19n/TGGrZdjJIeNXLSdDMaELJWl32JKI+sOIHGzCEwDcQH3Geb6/WuhlX2H+WcyDPw7guqMaRv/9aYw0zfFov25AJaLjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11739

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

On RISC-V, OP-TEE runs as a supervisor domain isolated from the Rich
Execution Environment by the M-mode firmware. There is no SMC or HVC
instruction to reach it: the kernel invokes OP-TEE through the TEE
service group of the RISC-V Platform Management Interface (RPMI) v2.0,
carried on an SBI Message Proxy (MPXY) channel. Each call is a TEE_CALL
service request whose service data carries the register arguments of
the OP-TEE SMC ABI, so the ABI itself is unchanged from Arm.

Add a binding for such an OP-TEE instance. The compatible string keeps
the "linaro" vendor prefix of "linaro,optee-tz" which identifies the
OP-TEE reference implementation. The node references the MPXY mailbox
channel implementing the TEE service group, and carries the endpoint
identifiers assigned by the RPMI TEE framework to the REE and to OP-TEE
since the framework does not define any way for an endpoint to learn
them other than the optional TEE_PROBE_SYSTEM service, whose CBOR
encoded response cannot be parsed in the kernel.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 .../bindings/firmware/linaro,optee-rpmi.yaml  | 79 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml

diff --git a/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml b/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml
new file mode 100644
index 000000000..1c3dffc33
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/linaro,optee-rpmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OP-TEE accessed through the RISC-V RPMI TEE service group
+
+maintainers:
+  - Marouene Boubakri <marouene.boubakri@oss.nxp.com>
+
+description: |
+  OP-TEE is a piece of software using hardware features to provide a Trusted
+  Execution Environment. On RISC-V, OP-TEE runs as a supervisor domain
+  isolated from the Rich Execution Environment (REE) by the M-mode firmware.
+
+  The REE reaches OP-TEE through the TEE service group of the RISC-V Platform
+  Management Interface (RPMI) [1], carried on a channel of the SBI Message
+  Proxy (MPXY) extension [2]. Each call into OP-TEE is a TEE_CALL service
+  request whose service data carries the register arguments of the OP-TEE
+  SMC ABI (drivers/tee/optee/optee_smc.h), as described in
+  drivers/tee/optee/optee_rpmi.h.
+
+  The RPMI TEE framework (the M-mode firmware) assigns an identifier to each
+  endpoint. The identifiers of the REE and of OP-TEE are required to
+  address TEE_CALL requests and are described here.
+
+  The compatible string uses the same "linaro" vendor prefix as
+  "linaro,optee-tz", which identifies the OP-TEE reference implementation.
+
+  [1] RISC-V Platform Management Interface (RPMI) v2.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  $nodename:
+    const: optee
+
+  compatible:
+    const: linaro,optee-rpmi
+
+  mboxes:
+    maxItems: 1
+    description:
+      SBI MPXY channel implementing the RPMI TEE service group.
+
+  riscv,rpmi-tee-sender-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Endpoint identifier of the REE, used as SENDER_ID of the TEE_CALL
+      requests.
+
+  riscv,rpmi-tee-target-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Endpoint identifier of OP-TEE, used as TARGET_ID of the TEE_CALL
+      requests.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,rpmi-tee-sender-id
+  - riscv,rpmi-tee-target-id
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        optee {
+            compatible = "linaro,optee-rpmi";
+            mboxes = <&mpxy_mbox 0x10 0x0>;
+            riscv,rpmi-tee-sender-id = <0>;
+            riscv,rpmi-tee-target-id = <1>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 44860f991..bf4884f34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20415,6 +20415,7 @@ M:	Jens Wiklander <jenswi@kernel.org>
 L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-optee-devices
+F:	Documentation/devicetree/bindings/firmware/linaro,optee-rpmi.yaml
 F:	drivers/tee/optee/
 
 OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
-- 
2.43.0

