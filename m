Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F88414DF6;
	Fri,  4 Sep 2026 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503208; cv=fail; b=N3jsXTTCG6pMisgw4JWRQaluQD/hjKpTnM0GbMUS1GWkTYnMJqo2pXUrCJaBHRYvuIVZkiw0X4aTeoHqe+t3PgaGzTj7Dut/7l2Hag1yN2/YfykjAo6E1P/gnNvaQbDZf/U9JoX1S3WHEoP2jUbJRpWzf6JhzSWh4eFQjPIqNd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503208; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ht4cEL7IEezGE+xF+RzyrSZQQrWSWV0OslK93f4NWPk4RGsYsDjNlmq9MkLkpXdfkb1LlMx3r9DzSGuWGl3ICDyQ3dK13vG3mE5cxYsrBmDihjGrtYKHAWm16+ubisa/jVPDTZj7j9gQpuPYWcGrPJNQCmSxMdvJaMgH4OJGzAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FFD6m46C; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FFD6m46C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sm2zk2fVekJNRqNRMjvIXBxQU2BmBkXwR0HgIrZ3LgbAJNhJbdlvfZxPZYpvZ9J2J+CBSnoAely30smr8ZCBpll7ZySGF8d3Z2RCE1nyoUh0HEzCHIYZo9he/Ug+YCHSpJjl6D/dCaZrqRfe1WhWOsjiR6NZ1nRdXXgPyQJxIfrui/+N/dXs1W6WIAY4YGM8i3MVwm2EntQIPoPso5AKFb7KhBDc3ksjJvQ3OGz2iy7tz0R5gL03MFmFFA+CfUDR376Ymm/FdqdP9kUGEPCtOQJdi97xUjDwHhNtCjU03/FTd05surHu+i7wO6iZzBFqTPpPENtEdhgsRxP7wOEAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=olszuB5xNq0Cin911RUuugiGwGHWYLP2KPc+R/q/y5pJh+YqLl8mv6t8uUtxe8sOvkJ2/jjUw5EL/Bqb41vBb1nFB4287O94DS47MGShG9XiElxUkllyhg6F94F6FY6KIoE+4iOEY4IauTyRHnzqNn8dk6B1MuxqwrZJC5F194x1fE0cKLE8/dfvfy56RcurRYGYUNbthqDPlxzcnCdgJyOGa9QiCZ7gsgtE+GHLcwoDROsV4pvweNgndgEOfYDbhmX7y10KgWEYaQO7944+kdGcTS5QmGuwz95i2YNzjMYaT9RfO75bgAHkCmr1PiLQxDtwe6VFrbMjcj/oj1PfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=FFD6m46C6ZHd+2mVXslA6NZDSD+rTRi7A30BFZiuEQx9hb8MPKLGt+dZgutICplMeaeg4HcuPO+YH+zDVA/0DLPxJgO5xHYk/6xVaD1xVD/sDvhM5gOzFIWj1LPFJNoadZwXyHli0PptQKWpS8uPshVOrcEHscMZjO4qhA8mYmCUWLqlMwHbJsrNS4IzCK3uOAWqmM+bNTMMp0XHTKVEQ9m3Ll1/WZWPGGeu4ORnl2QABoUt6d3S4gcHMZlUY0ZUDnGcrPlVYNwPI9neYSDTn9HTmtef3L5wZTVRDEG6SSvnlumsg8VZGClVh1YKUQRNkYRzv5XHiy9BJ77nHm8eWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB11395.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 06:26:43 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:26:43 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 17:26:00 +0530
Subject: [PATCH v47 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v47-2-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
In-Reply-To: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788522985; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=sIzCICvfZCqbnOv/rjgIQoO4+gZvWQ6Vv+q57LDj1ldaEqkMqgimCoK4J4WSvgOjkUdhU3OvV
 /yk3SbSIlqgCZdZHjPRshHDWsXkjvLaqanh711P2vgnzigQ/zschnId
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB11395:EE_
X-MS-Office365-Filtering-Correlation-Id: 431f3c91-8c38-4107-5dd3-08df0a4d7cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|6133799003|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	t8XRPWDSDZmuL5MlgYV85bv1LnSvu1m2l6Rpy5TXZiZ05ZNc9FdBg3JTiIH1H3aA+tglb7DWzf+j0CsR/dV3lle6WjhRyJL9enYMprfMiHBOuixr6lpW6nBs34eTsoBOn5OosoKDlECJyHrJ5pDKCji97Yw3L0MRLkTg3ebL2GOR9NVrFiNxLZ6C45CCGj6SOHyJTVw7tLyHzXDYXZG44+sgnYLWh6TwArzhwwTDGRQ55WoRnCEwXp/b4g6Bu8FsnLT7kZz35SBetVrpM5itOvTiW3+BVq777epmuEi9xbRAcSdhUb1cVa/hC5yTh9WIi0cJJKnTh4BKkP1q9CRii+2r2b2fUaCyaqrBcHcw8jk/40IPap29njAgSkGZ9pgsSmPzR8nQDdf+hIzLeHcMhfokys4L6r1b2Bwkenipg0I8ofg4FIJrJjoNiwD9gY1RX9/h+m3V5Tsy87IgX4aKyPfkhLhwRizj7KVbuhxKZJntasZwljU7pBw1BgAlF23ckF7f4R4YLgsJO4MXnyOiukyHSrT0O+WzATqaMHt6lPpup1baHGTjzO53qN2vwNAiHQj0Pn0k21KVpAQ9LTUfdw8Rqk1iZuxq0a9RguoV97uTaSxl4DOitvf5fr2c7hawxdom5/u+3JTk8SeU8LuRs8/zko2dbG1w6zzir+p9Jqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjIxRXpXYnVkVzQ2UTE1djVCWGdndTAyZk53TmFiTHJuRVp0Qi9HVGZHOC9M?=
 =?utf-8?B?cjlnT3JhWTQrRU9GN29EYVh2aGxjSUJsQ2dqQ2dHSGRBb0ZiNklLWUpsR2Fl?=
 =?utf-8?B?V01hMjdZL2NoWlV3azlWcTVCSFl1NnlPU3lMbk8yaVA2QVEwclRKcDlwMnN6?=
 =?utf-8?B?cTA4dnlweEdlMVMzd2tEOWpoUlZmWU1FUEl3WUdvUVF0NG15aFg5Uk0veEw0?=
 =?utf-8?B?TDhTcnNmMDNDZFdyajVuZ2t4a01KamdjUXk1WVNGSWhwV3FNTGk0UnE2Y1Fy?=
 =?utf-8?B?NXFDM00rNW93SC9wV3pxeVU0TEJDaVNoSW1Ca0Y0TlVHRDQyeDY0cUsyaUFF?=
 =?utf-8?B?OFJyWVFBQkl2QTZXUnVkcytMbnBvSnhKSWxvR1p2c1pEWVJQUnJKVnJUay9h?=
 =?utf-8?B?Y3ZlcE9TUXVvUmlFTWk1ZldXNlFEWkxZdzM0bGh5ZU1RU2ZLamxDRURxYWxT?=
 =?utf-8?B?VlRoa3kyazZOSGt2OHJZbk5kazUzeWhxK3FwOXFQcDBRYm01d01tRjdJOG51?=
 =?utf-8?B?NzRxWGgyM0NaR0cwam5QV2JXOFA4cXVLN28wa01rNi85RzlaaHgxVDNielQ4?=
 =?utf-8?B?ZWUwbytVcURack04TFVuVzgyL2JMNGNENitCeE1McmNYQUQwMW4yNklPbTFP?=
 =?utf-8?B?WVU1SjJRcWVMNUNLeGV3WTZOT0x1TDFlVThpZjlCZUJKUW0xV0hyTlpib20v?=
 =?utf-8?B?MzVrRDdQaXAxTDBSSHJUMlNhQlh5U1dtMG5LblI2N0ZEbWxqTUgxYldvS29X?=
 =?utf-8?B?SEwwdTBrMXhOYm5jSHhPNjlqdkUyRHZDZjZRdGV5dVlac0J4VDVpanJFbU92?=
 =?utf-8?B?S2oxb2trRjV0d1RlbkhVNGF0UGpLVGROL0MzVEE2dFNlcU04c2ZmT21WLzYy?=
 =?utf-8?B?RUNWVzZBMTZucENHMWt3ZklLUVc4QWk0RmR0TldYNThhc1lqWUNNVktpaEdY?=
 =?utf-8?B?N2dzMGhackRUQTErK1hOaW5Cc1hUNUNPd3Z0eCtuSTZrU2xIUmYwZGhscmdh?=
 =?utf-8?B?amFUYVExbjZJUkJkZ3N3SnpvaEZiRm8xbi9xY2lDb2pNdnBrTS9jTlNuTXBF?=
 =?utf-8?B?bFJmRkpKQ3ZDYS82RE1xdDUwWjY3VGNQSmtYQXJHcm9Odm13NzJjM0RjN0xW?=
 =?utf-8?B?dCt5YTc5YzgyY2NHTFdHYXpzd2dMSFQrZnEzeHVZSXRXMjRWWEZpRjlyVWdL?=
 =?utf-8?B?TWxnN09LVVpZMVBrb2o5VGRUcVY4MmlCcFVrM2xvUUFOK28rNkd6bzNYdi9C?=
 =?utf-8?B?QllHWmMwOHNtRUdPTm1YVW9zNmsxV2oyM0hwVzZsNnhiemU2RWp6cWc4K2Fw?=
 =?utf-8?B?Qm1yVzVoV0JHZVk1SWtvcmVsT1AybXRZS3pCK0pyc2duYjE0bE5uYnZSSUJ2?=
 =?utf-8?B?cnZzb251OGVxK3Faci9VZ041Y3NrQmJzcUxUaG42SmxoNWlhQ3RCNE94b3RC?=
 =?utf-8?B?MVdQbXhla2tWeTlmNDhjZmt4NHlZUWZqb09kUmhVYUVmN0lzTFhUMk1RM1px?=
 =?utf-8?B?NTBhZ2NuTG5hckN3cWk1Nnh4cDhCOG1NWElURjlNV2V6dUt3OXBvOVlpRVdu?=
 =?utf-8?B?bzR1SHN6TjAxaGVlVjlHaDdvdllFM2NvaEFiRURzK0tXYTdzcUR5T2JFNVg3?=
 =?utf-8?B?OUxtQ1hvU0VJZFlGbEZrOWhWdmZ3SU14YWkxV3BWcHRhb0RZQjFtSys5MVRP?=
 =?utf-8?B?YjVLYTg5ckczSnVlcng5b0lkY0w5YWRUVEFxekRsc0VzY0ovOUQzSU9RU3JR?=
 =?utf-8?B?OWxkemlTemY5MkE3dUxrNE1MRXJzSzNoSnl0bXAxWHFDZDNqQzlrTFJxZGNC?=
 =?utf-8?B?Yk54aXBicnFEZ3daK0dnOHgwNTdhZFFhbjd4Rmt4Zml4RWdKeU5rVVBPTGVQ?=
 =?utf-8?B?MnFqTkF1N0x1OVVrMmI5dzIzTGdTUU9RbHc0a1FGL0x2Nk1HZ0VrMlcveHp0?=
 =?utf-8?B?V2FyNmVWVHhpMHEvWmJQbXpvNXZGOHhuTGIyZC9TaitIdUdyYVVqUUdteStM?=
 =?utf-8?B?dkxHOWthblNtaXFqMW1naFFOM0hkeExBM1lxREJhN3ZaTCtFdDlsUkMyd0RO?=
 =?utf-8?B?U2diVUJIYXNJdzJhc0tzNTYrTkwxM0tjUC9kelAzaHU1Ti9iYk5GOUFPNnhS?=
 =?utf-8?B?bjJsc1dkdmRJQUQ2Y2tMMnRhV21OOGlZV29Yb1VHdzU2TkdDbjJJeHVCTHRz?=
 =?utf-8?B?Zy9IZTJoT0FleWx2MVVCQkZTZGdMSGJ4ZHc0d2twWUtxUWlZa1Z1MUZvQU5j?=
 =?utf-8?B?Tm5aWXIrYnBkd0JVbXlRV21NRFVVdjJUK1AvV3VCN2R5b0VINUFhUlI2SCt6?=
 =?utf-8?B?ODZsNWFkU3Jsek1ZLzIwOXY5OUZDLzZwTTg3ck92dlJiVnpQM2NYeWRpN0JP?=
 =?utf-8?Q?3SB/Hs2hLERyAcufrjKky0Tavd8uiNe0zpSEr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431f3c91-8c38-4107-5dd3-08df0a4d7cfa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:26:43.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8AlnBrTvInI9Tsyxw/jb+9j4A4QKgpqkuhe86NvRQ2xtyymyfwdUTecNng7fVkz7Zp1uzkTnoVrFF0eyybSHcmA2ojJP1ENbethYzJarocNErtaNommBPhPw/9hp6cj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11395

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

