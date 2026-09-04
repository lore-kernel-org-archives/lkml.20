Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB536D9EB;
	Fri,  4 Sep 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513712; cv=fail; b=YtiS+gqOrboo3fKu8woge6G5AaFjtI2+tuhv7KvTAsxXJyiHLXoWEBRJopclD5bzv5pk8/kqStVmrcE5jmlVT/LI30H1g0fZIDObXV1T1xhl/mSved19VnxiGsnW3ARwRwXKlRcH1Ied463C8I7Cs9MdbtnmnbE1pyAKZ5Vm/RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513712; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UHmDw3ftXp9M6A4tkgRVwvy8uyYVyDp7J3UdY6BYjo7uuG7vm58GxCX5uUBgXr7vAo+UyVxSYzHUcs2GL6lmtO4DT9BBBWH7B9YXHll4T8hr8sVXJiBYhrtDGbCd4rlrWVjONVTEY7lq2fi3+BHjppNkMOqL88z3YkOoFuh1zTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vo7Ujej2; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vo7Ujej2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVty8kw/YhpwM/tiwhtsRFUjaD2wvASuYi21Yzo9rqL00F5HMOoSsbWeXNLnlZDV/CNUFSzsr1+dQ6xaGEwXjglgrbwDWlKoeY8mNkcV1nKMn9SLmUa/LXznyIMu0/42FY4phi5DjZ0VeBOD9tWO8l3s0SnfytJUPWvFi27DhOos3y99TYIlhHeAEbJ2GSy0Pig8z9FgxGyZMLDy8gHnFbg0C2BA82nXi3pwE2XxwXcRXIwHmfDwHOWBmlaIQTqBr7Eje3AJCHQ59CQRoH/m962y2BnYG2IPcWIEeXVMNSWX1wGFYz2aNDYrOL6C8qrhGxritGDHrGWJ6trh0PacYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fITf+6RZcYa/nQ1YlsGkt+V64oo1NJaMSngZ4vyId4tkbvkhJmhoFraSP9UM0DTDrPAuDYrVHnNoqB+HKRxqC9NEy2938ThGOEty/X0XMClwKrOAEcuX95vlLWUvB1JvzSRQ4ugu3Zeq/yHXz+c1o3VWBWW3mL7evsmVqz4L6KRQy5Uwgm6GH+QSY8sjyoBTcjTX9EbJq3lO1yKLGjt5KXLgJ130pLRX/i5+3SeO37GtlttIrquJpqtSwIAZikuA/yoDFF1QiTv5C4uDXh5HKleGV5X/n4oq1PiLzJEaNgVFRAR4ir6mbTma5mYu0vk1yiaVhPw2GdF122GtV/1gpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Vo7Ujej2FpQLLUVLduRmxb2TIfKdzWj7ts/FdXYUT3s5qQ4ZFCj1BLxB8pnTW17iMwq6y/EV00ikpODkquPIb07LTTyWc1lmjS8VjyIUHWr2OFja6BXaQeBqUEgy7zSIW0CFMq1yb9v8t8UVKnSOPifpQOUHylpGkZO3rCC8GD4lXgcQOJlWSljXm8OJ5zpq7iBKJ7CW+zqzhaGoL770WuINW7LAx0eM3tb98QgSZb9rj4ljg7JP+kFriPNUGcBg0MqGfaVSiku6RIHc/OzKT1EOLzi9cBawzLk67piBESwZEVJjIfgj0mb/HypndYqecjWICHud9Py7TT6Bwrh00Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:21:37 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:21:37 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 20:21:20 +0530
Subject: [PATCH v48 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v48-2-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
In-Reply-To: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788533484; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=DpFSkE9uV+dEZu7IP8uiPqM3UJ3oDushyhacj99p8NigygkZAW9ehDsXbWNWmTMhLWLkhH7Lm
 0jafw6poENAB2sjcDgpnp8+0h71AMuO/d/tVFU+JesaMz0oRMXQp8rY
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0297.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e23f91-2d13-4935-5b78-08df0a65ebe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|6133799003|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	riTctVlFl7xD+sA/iyORLH+xkf+hU+1RwSK8T7dv7jNRC2rYsUTfK3G46MSnoRiLKcMSuKHwpjLO4mD3x+nJYK8rZdy8t4vUfGqShkytfAMpTOgZad7AyK05UL3149JMfbQnK4+oIh+5NmrylMeKH7sIDyCnE5TA1ObBruS8jSLnlRxFWhqx0oDs6tVihlXjQXha0cF0XUJA2wYvQe5Gukv2EbTXxy4ICu7yN0qbIk7U/vu0Xb/1nkehHJlDA1qVmUnXkd3lWjRS851zZFxV41WSXa+fen7vrfzvY1jNVnzhEXjSHRLkIDX0+cSdCJUjGmQw6uagINjYLDmt6Aw5vrlNqmQCKh+pKZo0Xtie0tZ1QphNJgfFfPD6l3ZRQvswGL7hf2ayugCWQao4vj20pG1was12UzOxLqy6u3vWXqaVxf6waNPwLtWLYig/IGDjbF7ui6XmfNKKqdVLOjt0Hnse9pRMcfNR3kmtA/TgFZwQgAJj0MwDq81H6S1LR8/gSdc7x8Ruh1U45IfS8mnK7hjuFBupNzho0SWdqdB6ohZH4Dvgl8Zzvs81rBgu/Gcupeqy6vn/t5wegzEXPqbaSqcFFFy65OdQ4cxELeRPHRmC9lRqL0vTcZb0cHGsJ+T/Dbm5D78N/dWdaIPKn4HQxVJ2gk0FY3qcV3OTLCjndag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZLY3ptSXp1SERMQVJNcHNlSk5hUEdlNDVJVDVFQmFtZE5NK05PUzFHWC8z?=
 =?utf-8?B?NmpRdFpjSnRXc256WFFHdlJ1SDRoYkt6V2p5ZTRwbmlOdlBnNFVrakFCWHN0?=
 =?utf-8?B?RUdFV3JFS052QTh4bEFJQXBOUFZUaUlpTEY4ZnZCaFp3ZzR2MkNLMXBHc0w1?=
 =?utf-8?B?NlBMNU1sZCtsMVEvTTBLVTllUHhKODNXbDJCMkdDb3hQN0hSdlRZdmlrUHE2?=
 =?utf-8?B?NDBRY3BwblM5TVdNNTJGNld4VlB0eFU5WW95S1ROeVVlYVljOTkzT2RiakRY?=
 =?utf-8?B?TllURkxVUmVMbXMxa3ZOb1k0VVVZR2ZDWDJybUNEc2g5bmxjY3JyYVJydXpE?=
 =?utf-8?B?RUZIR1FpTFdwZmRnaHRiTEovcmdmelo5NXEyR1VOZFJpNW9xeDhGY3g0cFFk?=
 =?utf-8?B?Z1FyOHZZK3pOYmZ5c21QZTFJWjdmUFBwcnovSDVhY09FWURXM1ZMUjUzSTRB?=
 =?utf-8?B?NGpQYXBsaGxHRldOYitpSjZLb1hJZElERmNpTWFTRFZZcFdFUzZxdTlQWFB6?=
 =?utf-8?B?SWxkMWtaRkpxZUswZDhTaVAvb3dyS3U5TmJMVlg3Vm1MYVBiTVRHSWVXRm5w?=
 =?utf-8?B?MWdMNlg2by9rUmI2SUhwZEJmT3I4TGcwTzJSTGU2WGtwaXYxNGpxR0JiZVpJ?=
 =?utf-8?B?RzR1R000MUdTRDlWRlYxa0VxOThzdHJRWVhaVHcxTVowOFJEUzM5Rm04K0Uv?=
 =?utf-8?B?aXpwZWtvL29pUnk3bFljRFlwMjhlZ2VlWXkxM3czMnVhT2c2UlcybjY5U2xC?=
 =?utf-8?B?UGRTbjhOSFJoODVsZmZ0M3ZsU1VHTXJvTy9rZzlneFJyNVY1d0l4NDlGeHNj?=
 =?utf-8?B?dnFQemtmWGlldWsyd1QrNTdXbUJad3RzM296ZElVb2k5eVFXT3lLakJEcUgy?=
 =?utf-8?B?cHl6YTZvT2dwRHdBR1N5ZExXZDVjQ1dIVGM1U1BjVm9YdG5EVDhJVzEzbWpD?=
 =?utf-8?B?ZjM4Qm1Da3V5Rnl2KzhUT2JmK1A0a0JKaEYwcG9TaG9HMVN4d2RiWnNEdkFn?=
 =?utf-8?B?KzVIdlFjbm44WWxCV1FGS3drNmE5STQzRXVoU1g2S2hkQ21wVkpYSWszd1Ur?=
 =?utf-8?B?MmpZTzk5Yyt2Q2d3dk1SMUVvOVhWdGxiVWxCTDJmUjd0WWNrM1NYaUtucDNh?=
 =?utf-8?B?VUJ1TUpUUUQ5bVZUc2kwYXNxSjFCMFY2bVZtNVNSenh2Umh0NGdaeCtEZ0U2?=
 =?utf-8?B?cnF4anRLYWFrMGxtM1lnQkZzd0ppQ2VHU0NyVXU3ZitXTzJ3WmUwNnEvMVJB?=
 =?utf-8?B?eVFXM203aUZwZTdncHFjQ1VEZWxDRExPVTNyVjNFc0ZnM2JXbS9jWFJCdFNx?=
 =?utf-8?B?Rit6Ylg4VUYzeWVqeTNsWFREWE4xMFI3c1Mydk9vdWJRNG1VdzQvZ1NBekRU?=
 =?utf-8?B?T3FvNEJ3c2x5QXRRdCtnNjRvYUdienpuR3h1empsZGxIYzEwSXNyUklxUDBo?=
 =?utf-8?B?VS9MbHFVSjJWdWpTTzJuWjVUYjI5aG9SMEdzc1VmTFk2bHUweTg4N0F4bUda?=
 =?utf-8?B?Vjd0aHNDdzZ0akxOaW9HQ01tbldTaFREVFdZbUlwVkdiSnJmOVd3WUxzVDA3?=
 =?utf-8?B?WGZRazVpQmVEc3F1WXlhZzZHMHV1M3AxSUpKSllsVE42RTRZU3doeCtoS0NV?=
 =?utf-8?B?cDNYS2VtWUJQVk1CSlhmUzdQSEtLWjFTTU5RajBsbWlmWnV4NnM1SENsNzV6?=
 =?utf-8?B?Wm5sYUttcnRJZVRReElUY25OaERIVzlUaHhuTU45Tm9KckpyZkRGaHpQbk1k?=
 =?utf-8?B?REVCV24zNHdjWVJBbTJEN1QyUjQ5TkVKREVSL0hwK1p5T3dnWEROaVczOTZW?=
 =?utf-8?B?TVJyRVNUSnFXbkRHNVo1YWU2OEdpM2QvWndlNUN1alI4eVdMaG0xWTJ0ZTlG?=
 =?utf-8?B?OGZENE95RVpON3Npa1ZRc1NBWDY0Ti9vSXp1SkFYSFFDd05YR2lPRzFXamE5?=
 =?utf-8?B?UDRyYkswbHh4NFhXbTVqWHdOMncxbkRiWm5PZVdoY3RpQVdOZC9zQ2FYVHdz?=
 =?utf-8?B?QnZ6V1RPb0ZLNmtRdldEU3Z0aUtmdTN4OXBSYmU4L0hLRnBzZ0UxcExEU0ZO?=
 =?utf-8?B?Zm5SMVQrcXNaR2lLR3VXcnA4SmxQTkJCMGNRVm52ck12YlNrSWFhM0h0cEtz?=
 =?utf-8?B?czVoTGppOXBwUmdST1dRWVNLUkRDemNkbTFNbk03VG5oYjJKcyttbjQ0amVQ?=
 =?utf-8?B?blE3cTVRMWRrZi9mUUJMSnZlNGdoODRDMVpIWVl3OUN4RnNlaU9sc1FkcW40?=
 =?utf-8?B?WHI4TC9VZlFhT05FZzdVY2xRVWg4TmxpcUNnc2VKTjl2NVppL1JydUdVVU1E?=
 =?utf-8?B?WlZXd3JnRmtMWDh0aWsxRFlDUTNEZUJMS0kwZ282SmI2aG1oTk0rN05OZWFy?=
 =?utf-8?Q?8MeT3v7zM3LqTcNpCo4GM1k6zJAQkT9a94wkL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e23f91-2d13-4935-5b78-08df0a65ebe0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:21:37.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwY7ZXt0LYOBw6FnhIaLbSmSikT55cy35tPJkFrAou19T7fOyS4rbvlYNBsN3TsIycLH9OUH74d1If4ZRt5JIa+U7d/nJDf7N2efDZw01EaxDKKtglZG3iqcM7aPnGrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

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

