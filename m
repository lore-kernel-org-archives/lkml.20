Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFEF38CFE8;
	Wed,  2 Sep 2026 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331175; cv=fail; b=u9qUehNwRTj7fHWXM0eUkVJBj2koViUR+fR9xlf8OKPNOKxAJrAbyF6rg+pUG8CiQeODDKQ5u+ZsMqjCWPRGPagPKNG+UsWwj00G3DrXWDa6wn9W3AJdkPNdxM5Z8eEUayzQWk+r12KoQkCcCjwMyzXxNUcyjG+98NgP87LqcBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331175; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qmOZY4mEG8pIyoBz7QCria+wHClW1ks2IAlRkdzlVvcRNnDEwCZiJmiQEmdKCctorkpEcHe8W701aCXwOHWWHnDCLTF1eZ4qcYnQhU1KiBIvwTcuiOTiKimmuDJ1CI3ux6jwNOx6N1G17DG5d2xvFk2A+vjvc0Xy75tLktspCiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d37lmvCl; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d37lmvCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc/CidEBs/pRW1OIznKMYvlk9ufRcJrHN0HXo/pKMIVivPhm/2tL3S9msspOIUl1LWK7Eq3aH+AfWJGO3NCnzBiETPJ1Yw2A85d/tSCUTRt0mBzVgGixO3kUx3JgftJXNIoU2NM5mQPMm3EhYlQ/WLK9Sziz5Re+wD1U7dj5FwW7H8H46TO16XLCzpaV+gH4bb3PSsLcRp8ab+PSgdeiDMs8X4X1v2JDB0PKSKOmOedXBM2WSOeRsiM5g6QtmKZ+S7lqT0gEMXFIUU1pDyWVBZg9Pboxz4+WAH1L+3ire9wYX4xqXQ3t4rT8ili7mI53sZxOboQIELkBebImwzRZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=RuCksB4dhipzdhbYRhUvkoEs2Kbz2Ji0MjiqJAwyE7tcf2NkCoJYB9H1FOn64w098Vm2vkEq7gd2ZygrK7z43dFcT6CwHk7nNw43qSoD2pHFHakp3N4YDAiJgHQ3XYIlDj349jutPU9M69tGO4ZvDztOPps4PlJ7j8LUo2lyOER/RoA8AsKu64WjASfEEp9NTghRFUIzlbixaxu+3tThDFmlG9HMiIZ51n6N8Y86B/rpRwchgPpf9Xw2HCmXBECIctrC3Wp01KeRR9uOCOa/nfj4eFkHPjFrS6F+jZ++A7Ta5rlnCTRlplxzzifFPeooFVSqlUNqkfeDOEa7FHgzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=d37lmvClm3xAlBsk2ddp5iAzCKJ0FJfberhw38Ab+UmxSH0Kd4fcDiBZGaP+zVfpsrgovBD6JfcP8CKC/IAhGzPutkYulf/cNZSFJZry2XygeW7o6QoRzQedcU5i01x1bPSzHkCeiLnNXzwW/8BI62ffXo0EmCpuBVogD2xwDMSkBRp21Wok4FlxGIoqp1JvNnDwBHa4JkrYV2MOM5gxMltXqnpsWcDpfXeoVt5AXXygMa5qAQ65pWeZ8i499WliGxQitNOAtlwV9s6SdfZLarv+djuyS9aa7yW7ZHzmt21h77yPHn4tYffd82Yjn/uDJ5eFNdhYKxueVIrBKI9e+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:39:28 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:39:28 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 17:38:58 +0530
Subject: [PATCH v44 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v44-6-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
In-Reply-To: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350933; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=HLD/d5OqH3MIgCujt2ijCCG0z9wdeBMk3fT1XOkV7baZ0TCfJefCtU3gWiKJd2CyGNmKNROPW
 w4OBarda2XLB/iLFS/lW/ixLGINxlkmdWQGbtZAfEn4HGjs+7Kjp2gX
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: e20c9ae3-c356-415f-5f22-08df08bcefb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	LWL1TEq9uI7lj451WppPPe2CrD1XIDDxqzHeIUGkwg2S0Ca35jHtaX/O+a09b3yWm2W1BXDl6FOSJVwL1LIJjxnx80+OXG2hqrOhwIZaYJoc0C/xatFroj9Z35w/xKEh2XmjbEUGMgauHTPOA/oJ72NjSogQtJb6nBAvLuQ5TeF/3FNoSPY9nphzg98C8ew67oVFuwt3LdRP3Ec+eGH9NBw8C88Oh3D7uV3tNfMrJKzBORT2HZfWdPGcY7fsI/l5g+gKTtK5ZWJC5EMXayzd3HBDdOXEUwGVoKxTEPUPIseJ0Za/o6lId5dVVMu+dFS830WWX3nWKBKo1PWchgKFSzwTHFq8vQ9hgSc37B8Z67JI0GfuUvXqXgmLdha7Bpi88+ZpwRCloPddsgGeFwNy6cfs9/WcA/QlQrcVuwe6oYywA8NCVzU/ztRDEChpNXfK8/JmmTB2psiEdtHD05nbb2fjLwYHU2Rp0OGwfeW6/cjY4mG/maGPpIsa4IAsk9vTl5j8z0kHMlQUnWQBaOnFuWz3GNFgn7n9PWI+nlYck2C1yVUrj4vyZpx7vaeEzx87WA6zzMoYHnZrYBbuOfEdTNOc3Ypac/2SezFRvq7u1h0CFx18XMSpWq5p3ym9uV7DjI3nNi6tMKA7ljmoabH30ppL1zXcH6q9CFx+zb9TG+jnnTmczc3nKup6dQaZ6V7dBp+q7KSPCfw35UfxVmR/yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhHRVZIMmh3cTRnUXdHTjE1eGdDR3c4ZURIMzhRbmhnMmo3djZqQmw2dHhQ?=
 =?utf-8?B?aExEKzA2NFlmRkNUWHBZVFRYZEZIMWxRaGtkS2ZkN1pHaTV3bUliVU1VUVo2?=
 =?utf-8?B?UGxSWXZQVHQ2Rk9lQWY0NW4vVzY1eDhYdzVkeElNdGVGQWtXTzd4WUJhSlVY?=
 =?utf-8?B?dmcycE4wdjM2UFJQY2xuUVU1Q2JsNlkrTGpLRjFDZ3RLN1kxWmxoaVlwWnFV?=
 =?utf-8?B?a1lSMGV3WXhDeTYvQmhmVXpkYkl1OXhJUmpWaHg2YzArT0xDQUVSMERxeGli?=
 =?utf-8?B?S25PNWRyckZaeURFV1hlQVQvbDdUYlFkcGdJdDZBNnp5cVVyOW9xREZjQit0?=
 =?utf-8?B?QUhKSTNLcnVpd0ROK01aOC9Vd0dDZHBCRDhDOTJpenN5cDRKUzNjUXVSbmpa?=
 =?utf-8?B?ZGE5VGxQbFZkYzNncCtvakF4bGpZL2drbDhLTEVrN3RCd1hLQjhpR0xkMnY5?=
 =?utf-8?B?TWhqTzBsZC96QXR2V1VwR2xoY20yT3FNWERvZG96K2lzTGNHN29mZEt1ZStp?=
 =?utf-8?B?dUZtdHFlU0I1KzRhU3N4Q25YdFROUW9RZzFCUllMcjVUZjNLMUR6NEkwaVpJ?=
 =?utf-8?B?R2tVbzRzcDFsTm02QW9CS05Ec0p6V1daV0lraUt1dGdCWW9sSHBnVmxtSXlq?=
 =?utf-8?B?T2diYVZVN3FWcXBwUGV2RXg0RjZkeWxHa3VJTWxrSGdpWUxsVm1JbkNZU2Jw?=
 =?utf-8?B?N3dOWUZLalNPdUhMdFU4YmhSMnhRa2RVVmJxRDBUTkVROWU1Z3NGWHRmOTNF?=
 =?utf-8?B?ODZGSC9ENEx5bk91Vzd1aFZ0SVpIdmdSSytEeFNpSGVhUTJocm1SeXZTcng3?=
 =?utf-8?B?NEZwMG9UamlWKzU3M08yR2dtQ0xQeXhmSklnV01BakZKdkxBV2tSeWRrVFhX?=
 =?utf-8?B?TXo2VHdQcVZNS3dDdmVKalpraXZFRStjVWxOUG85WTFEYnZ6Y0Zqak0xZ1Zx?=
 =?utf-8?B?SkVlY2VsWjdJbmphcUsxNHBDZGVZYU9CQnJCRXRsTXBhcElGZWtjSzZ5dW1L?=
 =?utf-8?B?WkxvcTRMNFo5VytSd2J2QnNCZ29lSzZtbnlHN2wvME5oaER6TWlJb0luR1NW?=
 =?utf-8?B?VkpPWURxVDVoY0JxS0E4M3RROCtwSkpBaDJwVVZhd2MzZVFzYnJvZVhpMjVq?=
 =?utf-8?B?OXI5am1oeExlYnN4dTVta01sWW81WjZwUXAvMzZSV1IwSElMRlFmRncvSS9h?=
 =?utf-8?B?Y2pVRzlLYWFrbmJ1MXN5eEEwaWxWaDZ0SmsrejVsU0tBaFlXNEp4Q1BISDBI?=
 =?utf-8?B?NUZnRTZ2ejliZDExMEc2LzlaTDRlMzFNdWlkWDZiT3dNSHN3aVhSbjUxQXRP?=
 =?utf-8?B?enBlczFEN05ZY0RoSCtiVDdvaVAvNjFQZVJFQWtQbUVJUEFtSnZjVXNmenFm?=
 =?utf-8?B?ekorV1NUL3ZJK1RkZnRlcXM3dmpMM011L3NSM3RlYkZmRkFMV3dSNDNYck1o?=
 =?utf-8?B?aHN1RmNsdEhkMzJ3NG5PZ2poREFVWHcvTjBHdVYvMU8xdW5nVFMvVmRtRHJU?=
 =?utf-8?B?VE1LK0RVWEVRK2JiZFBSclBJQ1RXa1VSbkFJUTR1b0pIUzZxM29Od1pUWjdI?=
 =?utf-8?B?RDFXM0NoL0d1cmlVNlNzb29heG5lYVNMTVk1UWxIaWtXNXhwTVZnS25Yb3l1?=
 =?utf-8?B?YzQ5eDBvdUlnQktwSEVneU1tVFQzaVpOY2RvcWEwcHk1WGZhZlUzSmJtTmNy?=
 =?utf-8?B?bTRnT2UwNEVNM1lYQS9OdzFFWlQwN01KeDJDMTl6bUtuQVl0dGtaeVpQV0hn?=
 =?utf-8?B?NDFaK0NjYkpqSW5HMGJYeFhiS01CWlR4M1JRRU9WZ2hnM0JBRDQ0SDFZYms5?=
 =?utf-8?B?dEVCRERiZlEzNkNxd1JTMVlQWnBocExFMzJsWU5jTVhudHlpbVJEZVo1RWpp?=
 =?utf-8?B?MVJqcDdoc1R0aGx2ZFRZalNQc08wY2g1UVgyeGlxN0RXa0xWOW1pRC8vaGRR?=
 =?utf-8?B?U3pPUk5PVURWWHFFZE8vd2lYLzMyYlN6TXZVVGpNd3J5T3FIMml0VGVESkha?=
 =?utf-8?B?aFMvVDFodUVGdDQrTXBwVk9zK3JFbGwyL2tMcXFBRlpqRHlQcW5VbjV0ckN2?=
 =?utf-8?B?Y2lUeVB0STlpUlAxT0pVOXBsT3ZmVVgxNkF1OGRsVXRJQlgxNU9zaW5xYzlj?=
 =?utf-8?B?RXI1Z21Xellxa3J0cFpEQnFyeHFvYTJzKzVYV0crcmdVbitHNEhDTmcwdTBm?=
 =?utf-8?B?N1VvN2JpUEtveDFJcHFXMWVHc0FlK1BhK3pJdEdVY1hkMEl0UzRyOFZVd1dE?=
 =?utf-8?B?c2duQm81N2NzNVJIUWRieXFueXlEYU9WMDg1QlFRMXdmUHlXL3RnN2JFWU93?=
 =?utf-8?B?RStDT1c4K1B6VTZ6MFBDeWN4bFJmU0JXOFFnbStPd2xheUVGZFcxRzJkRTk5?=
 =?utf-8?Q?mYDxB1gtnHBLmhXyvR8lwFYSYrw2q+l4SznAx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20c9ae3-c356-415f-5f22-08df08bcefb1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:39:27.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II1aRNlfKsGRtIgKBOhiURNa+UkaVNDpttLJl5I8qsc2eWfKvF5xCL4eSKwyYcpPRv5XbDOjnyG5676klM7j9nxs+qAfUMvdQsOy7+1Xe+RTBs0QmTjjUJK4mRPxguLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

