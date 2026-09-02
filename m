Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B241E6A9;
	Wed,  2 Sep 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347134; cv=fail; b=FC269KO9duhn5/PBo/GW5/ht4Cb0YcRvurx53OZqATvfdYcfBsTonJ1XNR9xbkPVAKtRm6RDmIWSIPwdkIHIDXtdfQx3LKsl3TG3zhZb6LZ1bPsqN/fLKO8Fyf3jXoU4eTECYiKnycBu/k/eQLEl85UV3cxC+FwERwS5SjissME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347134; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l7UZEivsDScUnHniw+cHK4fpx2wzILLN5D6fSXMLeKSAU/TrONB1BSkvqsSlIGfylAvX4xNAX742CTJcf1IqbgZMKNc7c1wgOBkuO6PPfyoxuJLWPzblmUFQdNcnzYd4ss82b+mhyqR//Xn0t9IPd8Y2yf327OO+uD9R2kxsf60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d/+GolkM; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d/+GolkM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzGZ9fMPtkpC1iBZEac8kq9IWDCcs4AyD9YCT2FG+DzB0k4w2l6S3/bQYYH3biqxeApsgFf1XfIxn2lGovO8rFwoXjXINbO1ACcXafo+dENtd8YreJVz5vdBfdqNwmLCaV5PeQbB41lzxr1BkQhCyVhh+vxTDGG8K8ghj2FbqtW4OotBiUhEjuErH95fy/bm1jZq8IojfgwcOKtIRceLX1rRl5TAX788H9ZQSN3zNlIgyqkixLu/r4liAlY/IFPna4l13BSidYM5UzjF7mugXZhCMk1mxSXDsgxpr/BuWWf6lcDWbprIY05nSneOQVC26dMok3m7IJAaTe3hf7JzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=xWCXBjJXd7ybQUC6ncQUJ4PPNU4Au6O9mYcVxd1gbsFWoJaMPNRcVKjtJuRkn5YN3VnlhbM5HQnfdbHwv1XehHTcsO44WjboN0UfU1NB4Zlt3ZaczGe2MJzyO+0DDjOLX0NkGoK5/Vgt5RDMSAI2vGn7uDDwGZelQ5WL2PguSzq+Uzdyh/xg1XfRDtt080eW8tW+DanTC+ePovYS2G+bnKcuH4HFjfIRGm94usBp60WiwG8o4tfWQjWHjd0dwfJc6TAAA3eqBGc//BCn6nyVYHa7ewjTjT7NUkybH0rgcPy/1/+BiVCWyUgvpYHrrFyIhDsFmi+D9+cBebXLRCxwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=d/+GolkMRF77ZkCTrdom/lHjzXSPq1gVJjrIbanTRRAbHm2WAgc6uVQQ/zjDILdmGUMlOAc9c2wCl0Dp9zaQ3/TVqBtz1MdYPC7J+osSEdV7EzciMijEktB8BfCShhTHvH20Xm3KXQnfyQ7cSDZnBRxD8PK4O3/CHsk5NRffVZ0mJ4+C1HrrCFRvBeW5dkaHNLfUyvI7hkZjuBpO21tu2Mb5Fmqy98J2Y4qJhyDIXPEl/noEHRw37Bf4Jgz1V+WuG9lV5T5+1eAP7k+V9GDXGXLeDgO6VtJDL9FmDX5PCwwrEXvgpruQaee1krNV3OPWLRZ2sR8kgWswYQTw3N3Vng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:05:22 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:05:22 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 22:05:14 +0530
Subject: [PATCH v45 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v45-1-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
In-Reply-To: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366919; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=CR9aZpEG5oiaKBhlTU1VYPFJJa3uD6QhnbWK48OG6fv0zlObsSG6f4zi8OLcOBHgrAX3D8RmS
 tsfiioxN8UID4wmShOdrVadI348R5Pazriat8h/TDW1m92Qi8iny14m
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: a49fad3e-3843-4657-807a-08df08e21559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|3023799007|6133799003|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	9znvLcH6eQpskP3pU7XvxqODf3ywXZ0X80iFj9xnfRkgwaoxFG/LVhQI2d5riDFLC2Ah9WHmxa7bekuKQEEvm6FuygnBYOFho4b3Mq4AuQ5MphkGcslIr3upku2V40lTtgGqtUX4lSMAwAyVihNE4G2LmKg2yOsOjITWqJ+HYLSCbXf1jtSYDRYn68ZsBzd7jMteM+f/Ps/562ukwBDjNOmMXu1QVEQFN/qJ9cKpZvB4meK1FBnVzkOYjplNgkE7hvgopU0M2n30SsewKiPctKK4hExwtm+GbOlk0rkeoYFt42fCDgqo9JGPs7CSXpD/RZGG+pFcbdAsIiUQAYLmgy5xn4VgIUOq+phioMOr5CzDDJj9sACf6NBBTzfRCZn6L2SHuZBUnAXq60E12mNoIy4J/CTpLIGZOuK0ghPF+mUPwj0QL90aFNqlfplXuSJI8KmE5hphz1TEdSHSMPT75g498nbH+pKh715q7aXS3knVCO8NRyeCLIBHsmfoWM0M3TW+ii3Wn6E71AQQyY5KZK7jv4B/b7QP+lpUT5/KYizCOT57d6RjAuY4sDuy0i3Ux5J4XoQ7KezRVT4LQzweiCwbYIhxlknix94ZObPKtmQ/aWtCGWbosv1Ue2zP4yIRCMETaxTb/+5J33LPpEOrjkI1PnFGpakKj3UjBEdaXmvfE202Wr5nz+EUVxLIf2WoUdN+nBFTVVmcuJDz5RmV4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1RNcFJlWk9lc3BrTGd5dGg0dGc0clkrMjZUc3VFZGtDbWJmQjFOU3oyOVAv?=
 =?utf-8?B?aitiVWlnV2p3bmkyMGx4TVhweGtOUytxNUZ5T2kzMnRKaE9jMFovSC9iNXZ1?=
 =?utf-8?B?NXFLRjY1c2xmZ0pBRWhNN1FtWXZRK1VnRmV5b2ZtOHB4a1NBOUxKVkx3d2lK?=
 =?utf-8?B?cFVTS0hLVGtpZUVLT2U2OGt2QXkyMkVmTFAyVDFPd0ovUFBHdS9jVEZPaElM?=
 =?utf-8?B?WHJvQjJVQW5sSFpJQ2llSThXaWxoRHNCS0dFVkdtczJZU3dsTHpHNXM3OC92?=
 =?utf-8?B?bDhRc24xS1pCbkt1SDBCT2RMaFB5b0tYK2N2TlZWNFF1RnVkc3ArbzF3aVNH?=
 =?utf-8?B?Q1Nla0ZHWnJjSElhNlJHQ1R6UWFpYzFYQ0czd2MxNTVGUnIvd3NEYytENWJy?=
 =?utf-8?B?bGlOS1F1eDBudXRtQlkvbjVjZTVaMnV2Z201L3RHSkRJZlF5cW1nWCs3Q2xt?=
 =?utf-8?B?Nk1EZVEvZ1hFTkFrcWJMSzBDZnRVR1NyU01mYzFHMUZkTm9LbW1TcjIvckVr?=
 =?utf-8?B?NmlIM0tLKzFCSTRBdXZDdlhMY09EQlBFS1JFWjZGS0R2RkVjSUUrWDBuenE0?=
 =?utf-8?B?UlN5LzJEcTRCOE02b25BNnRKQjFMaDJXeDlVMTRUTHYyR1pBWXhreHNaVk0r?=
 =?utf-8?B?MzVmbmVlcldEVzAwQUd2Zmp1NVdBeFpuZVpBSTdISk1LSUI2TThWWW9JWDdT?=
 =?utf-8?B?L3BaQXQ5dy8xSHY0R1ZpVE5JLzFGcW0rMnVKakJ1c2tLN1hWWHo5NlhnMUlI?=
 =?utf-8?B?TmZpcVA2eUlZYlR6REZpaFRnSkc0VjVpMEQ2N0hFY2pJbXMrb21BZkJ3RmJu?=
 =?utf-8?B?TW5BY2NvMUpGKzlSdXFaTVFhMDVicStLbnQyblBPMDY3V3MxTzdVc0NZWE9S?=
 =?utf-8?B?WXcxQzNxOERmUElpTVVFNFNuNWVLekVIZWxmMnBmWWFJK2c4ZHpRckdYYWI3?=
 =?utf-8?B?d3hRNmQzbkdaQXNzR0ZIOVZPNTRMZ2lXZ3pNN0V0aXdKVFloa3QzMmVaRzBI?=
 =?utf-8?B?djhMcHZXU3Fob0J2azEvNkhEcURKSm1pT0ZUWmk1QnBxUFlacGprOVV5SVMz?=
 =?utf-8?B?ZWdhTDVEb3VtRSsyVDk5dFlkUnpUa2dPWFQ5eFZWamdqaHd1Y2Roc3RsRUhD?=
 =?utf-8?B?RHFzNVc4N3prVmc4S3J5MmlEVE1ZOHJweGR3NWNHMW5ud2lBWVo5MnFUemE4?=
 =?utf-8?B?Yk95ZGczSEFzdWlEdDJOMlNKUTRWb0hSY1N2b1A1ZFE3QWNYRzhsamNmUjcx?=
 =?utf-8?B?ZXlUTmtaYVNSWGJxV1RkOHRKeWJpNVRoUWhla0JlNkVZYXpoK3o1MkNJOFp4?=
 =?utf-8?B?MHMrVUpLdUxxSDUwYTJRZkF3ODRwcTlkZUNieDVYdC9rMjNpUFArb1VCSVhO?=
 =?utf-8?B?VjNuZ0Qvb1lPclhYVkUrMXg3RFFPWGVpNmNRWS8rUHJwb2YxVGNhYW9hU3li?=
 =?utf-8?B?VllrOTFQVkN3aHhGVy9IR2FhYnVraVpnZGlUcm5zeDFWdE96V0lCTmNqazBK?=
 =?utf-8?B?UzUwallmR0U1OHFIdjYreTl4ZXVrY3RSenpqbXZjOFNTVHVJdk8rVm9CZkVs?=
 =?utf-8?B?WFplMWhVODF2b1RUbmZCOWNvZElPaTN4RE5RT0ptR3lSTFpVcWllanR2MDdu?=
 =?utf-8?B?eVN3Q1plemh3YTdEL0l5L2xBTjY1MTRsTDFOV3FNeW1VTVBpclEyaFpwdnlL?=
 =?utf-8?B?ejluZFpsbWdqbGdWSlFjWWk5a3Q0d0NFeG1HU0JQTXZwOE93T1VhN21yc1NC?=
 =?utf-8?B?QU05Szl5ZmZqbDRsVFVBNks3cDdXZHcxbExlMFBkVDRjbmE3bkNnamk5Szd6?=
 =?utf-8?B?SG1TRThoaWJjc1BqSjRtZ2N5S1d4WGt2U3Y0Z0tQd2N1R3lQWUhkelNRb3Ny?=
 =?utf-8?B?OUJHMUM4WWJYTTJKL1VPZXgzZUpQU25KTEZLU3J2K2xTR3l5dlg0YkVyV2kz?=
 =?utf-8?B?ajNYeFNvdGhNYyt4LzA5UHJremt2Uk9WNzUyRFVLZWJ4cnJrcVZzRGdpa1pR?=
 =?utf-8?B?cFo5L2ltNnRxQk1SNTRLWll2d2J0WVRoM3grVFdMQ3ROUEV5NGoxakJFWCtF?=
 =?utf-8?B?Q1NKdm10RzFoMWN2VG1vT1ZidytqWWl2WTRLTnhCOHlEcHFaYVlzclVaZ1VL?=
 =?utf-8?B?eUljK1lIcXRHRFB5ak1XdE90eDh5OWd6Z01XRXF4czAyY1lwa2JnK1lVWEhh?=
 =?utf-8?B?Z3plVGZpTjdwbTZNL2UrQjVqazBFSlBVZ1JMUDdhNG9NZEF4c3lXZWdpcjFS?=
 =?utf-8?B?YSsvQmVFcnJ0VHRhQ3Q2bjkvbmFHQWZVeFlUa2o5eXl4MlVaK050VUFxM3Zr?=
 =?utf-8?B?WTNKc0hHRFQ3Zkc4cVhUSk5va2E5R1FTR1Z5WkRoNUtCL3lQVzFXaDVyczZV?=
 =?utf-8?Q?BWm+prDDubVYwkXFbXpUB2YudUMX4MVUxOqwz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49fad3e-3843-4657-807a-08df08e21559
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:05:22.6383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y22RBzoGZmV/DYCdqopkep1dD2kvO3WueRW9XxIysvBpZR0APAH+N9xG41I7wUlBm3reOWtBRSaFw8RHu1HGhW4FBoey5wVKMWt/Hjy8gQLghdNpG9Hm1SEYKYQF4oR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

