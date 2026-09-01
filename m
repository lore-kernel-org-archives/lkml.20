Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9D39A079;
	Tue,  1 Sep 2026 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301579; cv=fail; b=XVObUsVU8UP5/2SmEhDlHpCHVsNRne26RgJlweU2fh6z5SuLmjjjb+3YicVPvFmEc/2td2WNljXrmef4AFxjjZLvgLYmbSRa+Nlo1WAOI35Uw8bK+Ngfvugv4/Nwt7+VaUkL93oZdhfEanZuqiyF9eIXZYOkPm4C7TSchKtOM98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301579; c=relaxed/simple;
	bh=6p5O/L0LBCJLssA0dMWWFqeqwKune0YDvGHjBtcmd/Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ajgQEdLXzbLUymNeiaplFGxRbdQWcXA3yzHEQnj8wUGEVcEbURg9Qi0zoqw+/QDgYLp1p88rGliCiGCNlj8jOdp/WxWEELlac3nUTQn7FqUkb+AD8CGuNWFfIKpvAzfAX3EuBYBrkqUMGevNUrcamCEMlqLBqhnrlbupix4yhDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FSeK7PLK; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FSeK7PLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO/D2QjA3SY0TB8ENkiHkmo4aAfroad1uvI6WzQFNVCBbxW0FuzPM6P98FfoL4dL6qW+5sZ3vHwOEsKNg90KPRIp3Yo8DuxzRwMId+RpVSPFMZnjOTPrCtkNGEgJhPBdVvmjINt5Tu7ptOZ9heFMOsFDidZ13YsaU0q5SwtAPzQoNcpWRpMSmcw++ZdfB0TL051Bi+OuWGgEY/ZV3tjUyemg4yRHNSbN5jGx1+wRQ110TfjvhSYrx9nqpaQxe2AcS8YqMwg/oZObeT/0wdaxlFE+ldK7723DGy2JPIpWQ6AJtc0CgiRAJyYL48UiSdw13pSG0fRFkr02q15ha4sn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvMLpuhM9zCTJFOvoXlSAzwssi1b4b81Jgn/pw3x8WE=;
 b=S7RmcAbS26Vkcv3UzZJuFTr5klm3uTI8UgQqyur5gK9O4x950HloUM6djVsJKScTNlQ/g3IjAELB+k3zhTaKU5eUdgAd13WIYcGcKJr5KLPik9+5vA1Pz6aqV1gc35tJcXAnJlcZysIZEh32W5rpfN+a3rF0sUgy/AJ1haol4s7obDA8o8atQJ6lf1kfg+QcYfAVR1PW0dHTeuaYriqytzT49B+X7ywAQS6LqMQwMsDwhWJZmPIifjKfk/sgxa0UE7S6KGTDdOeJOapH19UypfxzgEZwB91QLBkRhXMXl28VYDY7Uy+vYz1qoBqpAXPF/Bl/0WWkOkm/5i0b2C76Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMLpuhM9zCTJFOvoXlSAzwssi1b4b81Jgn/pw3x8WE=;
 b=FSeK7PLK6FBQHXstfZj6mlMCvt1EvigGzjsB8Azh1zA+i3voCB8/zC6APiWZIlyOfCflbb4HSiYeFjP9T8JwqbagM4c2qqzaxy7+j6XPdeCddYtG8eIbn816LY5LAzkhColknGzymI1JeT4JFnvws3xE1fqU6GyilRzfbtyNXFUvREOOgFx9qJOcLlfYbjSDbzvQtQuh2uV+5vjXM9JiOHxKQGSANQY713yxJ7g43bJhtK15o/5KMtPgZWwMR8JhEGfO0MKwwxtu+UL/JX20Dac6S1nBEdHVj3GgvpdHWGr3O9Db0pa1uzXWdh4jaj4KRTfOxIQYvRJpKOBbr5nEdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:13 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:38 -0400
Subject: [PATCH 4/8] ARM: dts: imx7d-meerkat96: disable lcdif node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-4-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1012;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6HtzfcbpeZBVmMCA6HB2Wd94bVj0cPaT8wAGEuZKu1I=;
 b=45+clUNKIoMAEyxH6cziruRpMglqmJdjntcUuTOELcPbIEBuRxaXOOzOwnjIexca95p0ampf/
 GTp1c9j6y2pDBvJuBC76zlAZ6Z4UcRZVJwc/8G2oGY3gbRVs1ck8t6c
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cd802b-714c-4400-8f84-08df08780806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uMDLVSYmAI7VgHMK0iw8iWHUcKYDSgbiIxNjyqHze5ysBhDpe2owq6abJJZOCtXlFzeK39W8q7Ar1q+k2dXl9hPfytjb3GUl5aUH7+Ex22Ozd5HTnGsw24r9iHGq4U3pV39Z+9RdvhYwpOOFOfuoVgMvRY2JA8fjtpdctk2tdKNee/qIExdsOXVEQV3slZ4vVfO7N1T4oeyP373JfuRmC9Z/5jcYG5DCTaIS/00pLJuRgYG1EGm+kMf9AU6Fnz1oS2Q+nleemo/nxTrePhX7dSgr8DYdQboTiOovAxiFVIFHtPWxmDl6cnr6/qrj7D2aM5u0vMWLAN6jaCpgZ0hOpxq1oVUrFPnqpXqTffcHsJZQVYMfGCp2KS20mDKO4bdn3a1Kt57Ty3aNENP2GQVRRlv+1kH0CAkvHvHSnjFjYh3dmmhIA1RBUHLSPd1DUdY6FIWfM9LNcWbA/G/MFedWUpH4bRMMkR1QASKDub1nqtEeFDPcNuCxCKZKFsuvjqRV6ZOcfQHP/6xpj5Zpn2kDeibaypraczptSMZFqP38Y3zXOc3fvk6iTZncyOFBCDOu2pMzKzJc7n7YdZV2Wx2WoEPkoo8ma4j3L+fom/Kdu8LOsfhhm+TTI+n6c6f3E6SinmVWVUDAE86+7oDGppFLIFfJCnfaTSsa8lF2VWRt73k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWUveE5XTFhMVUk0SjNMbnc5dE5zWU9JanRDZGlmNUdhRmVneXpHbDQ1SEo4?=
 =?utf-8?B?NEQwSXJEK1NXN05KNWZBSklmeG8wQnE1Rkphc2lKTjRRZFpudmdpRU1Ocnd6?=
 =?utf-8?B?Y2FNTlhuOWNSYlIyciswSTJwTlBiNHNQWXdjd0QvRXkrYnQ2ODlnbWpMWWdo?=
 =?utf-8?B?cU5BWXU4OFNpbzhTSEswWm92Wk5OM2ZVMENNQWwvVHJVMUNlS3BsRVI0R3c1?=
 =?utf-8?B?ek0ya3JZS044eGZWcVlRUExxR0hPNUpRS1ZGZXppbjFTb0lqM2NDSk54c2ZF?=
 =?utf-8?B?eCtFSlZZQ1ZFa01RbTMyejdRTTBZejlGSmVDQ3JoSWNjZ2FkczdGTGcrWVR5?=
 =?utf-8?B?ZGJVUXNJbGNvanFJeEVSUHY0Uy9DTFYwYWVxZ1dPbEQvcDZ4RndZRTcrNm5H?=
 =?utf-8?B?VzIwb1BaN0UzdTdLZUVKNm5zYVVHQXE4NGhqZEVqVktyaklXdWhaN0VTOXhl?=
 =?utf-8?B?NG11MWczN1NFNVNmSjNOYzluS2xSdktRcVRSUFl1aVJsamtnNWRUS0NtSmxQ?=
 =?utf-8?B?dVp6SldqYVJaWSt4c0Y1a3d3RW93ZXpxeCtJUGc5eHp5NjhBRzMyWFYvRGlN?=
 =?utf-8?B?cUpEUGxkTjFsSTNGTUJoNDZjTnZmSi83RnQycFdiUklkZXd3d3F1OXlVbWpy?=
 =?utf-8?B?SmNjSW1aTnBUaWRsQkVjMER0UW5yMGFlaExTTWcwbVg4LzJIN0tOOGJ4b1Jl?=
 =?utf-8?B?ZlJ5RVRhWWpVK2ZvbHpwbUcrY2FiNGg4WHpsQ2tDME15QTNwNm5LaC9WNjlC?=
 =?utf-8?B?cnpLaUdqbVVrSlVrbXgvSXp2R0w2ZThPMWNBNlZWWUY1SUJtVGVzMmYvOVZo?=
 =?utf-8?B?SWJtNmgzTEVjTGh6MlVVMjdrZXozT1o2WHRMRzZETjkzYk9tby8xMTlMWmlD?=
 =?utf-8?B?Y1pXaWVnZW9ZR2JlVmFzUFIwMDEyZVdFam0vejBiY0hKNXI2WXFtSVdhTXRy?=
 =?utf-8?B?NlhFcFFlRUE0bGh3QzVCTHZ6M0UwRmRtd0FVdGtQcVJkTEFqakdyM1ZpMTBV?=
 =?utf-8?B?b05DSERGNU9pZmxoK2tWWkRpV1FUQ1lsMHprdUlwdjRXQzM1Y3pMcVhqVHo1?=
 =?utf-8?B?cFFwTGF3KzFINnhlZndoYi91QVcvNWZHQmtCYzk3VGxyTlNjellIc1hzeXB3?=
 =?utf-8?B?WWlDejdEQ1Z0K3hUdVFPRW5oazFYWG9QZDdEQUl2SFdEM3duNGt3Q1AwUi8x?=
 =?utf-8?B?VWV2akF4MGZYR2NCQzlacGFxMi84aGF4ME9GVTF1VDBMT0xGNjRLSXFXY1BP?=
 =?utf-8?B?OXFjQmRoQytLMk5ENko1OEhMZmFkQnhCckxiZHdFaUh0MGl5Ymd5dEdjaEYv?=
 =?utf-8?B?eFp6VEhtVmI3bFI1WGpZbG1pUjhjaU1WT1UzZENpSFc5VnVVRjhvNnNwUmxQ?=
 =?utf-8?B?QU8vYkRDMVZwN3FMc3hRMHRQcURMTGNwUmtuL1pwZmpTbk1qTThha014SjlZ?=
 =?utf-8?B?YUdzeUM2aDlDVTIyaUt1eGliL1JZNnNBb3ljOVFjY0crZldURnVNSHMvWUlZ?=
 =?utf-8?B?cU90ZTc0ZDlUcTA4NEkzZTN0S1VIUzcveXVyZEVGS0ZaK2JpYXBMT3hFMEZr?=
 =?utf-8?B?YzMycDFaNUlnbmt1QllCc1BoRXZqWWswZWNFdVRaWVVwdXhuODVwQ2ZJTHJQ?=
 =?utf-8?B?THcxOW41eFNxRFdzc2Z0Mis3S3RTa2JmVENFM0dzSmh4VHBMekZQT3ZpOEdN?=
 =?utf-8?B?Ryt0bUhhcHNYcCtsdm1tR1AveGdRU0ZQeEwvVE5JdkE5akIrQWpmYnVxbkVF?=
 =?utf-8?B?SnlIZVpMbTJFeEI1cXl2M0dlRi9NWFdXaUNkY2RqeVZrWFBKZWMyek5MdHhK?=
 =?utf-8?B?eUFJZ1FDb3VnSVk4bUdPN0JOelZCZ3NCd0hZK0lqS05UZWNkTWFub0hFOWRa?=
 =?utf-8?B?QTN2OVIxalVjUHQ0OGhENWp6a2tjaFNtNldpcnFJQlZuYmg2ZVZZOTVHYU02?=
 =?utf-8?B?N292d056SEJseDBHUUczcnZvWFJiUkJOMEJwYkp6WVZmYzhNZ0lGWEkyK2Fr?=
 =?utf-8?B?VERSSGFUUnFQWW5OVFVoUEg2SzFUTG9tREJkWUlvNjZJTi8wSURGNFl3ZUo0?=
 =?utf-8?B?bHFoMnQ5b2dEWlhNYk5yN3ZLNk5kV05DN0hXbDR6MXhXOEtHMHExQ2RlRXpr?=
 =?utf-8?B?Z2tPS1U5SXIyS2h1SDZFRC9pOGhOYkRmV1JrMW0weE9aSHJOUFA0T1hmZTQ2?=
 =?utf-8?B?ZTZSd0ZJNFJCdE5EbzkrMXVycUJyYlkzT1J3YVVZb0M4cnpNdHF5NTRQcUhL?=
 =?utf-8?B?VCtZY2dCdTN0T0htVDFXQ2tuTVd1dEEycDJDLzFNcVpuSTI0TTVPTmVIais3?=
 =?utf-8?B?RUNjNGdSMERBTENNSnhsZEg0TnV4amJyYmlHMHNEZXFkOE5zWnd3NUJ0YjhQ?=
 =?utf-8?Q?hV5j8x8J2P7nmf2WtmFWgeMN8Ba7JWmz4/ALm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cd802b-714c-4400-8f84-08df08780806
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:13.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ONsLVqCsS+6jYL/h5QCcdvjKCryXyMqO6W1GbQB2mHKov13GKdMzCH4Yfs+Pox0vpY5ZPdCNM+o64MX8nrrSwU4rO9Z6dYJzGxtWXVxiILOh3olPqeWcdE9RLxEIpXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

The LCDIF node is enabled, but no display panel is connected through the
required graph bindings. As a result, the LCDIF DT description is
incomplete and triggers DT schema validation warnings.

 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dtb: lcdif@30730000 (fsl,imx7d-lcdif): 'port' is a required propert

Disable the LCDIF node until a proper panel node and display pipeline are
added to fix above warnings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts b/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
index f0fda15f30204..38f886c25509b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
@@ -134,7 +134,7 @@ &i2c4 {
 &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif>;
-	status = "okay";
+	status = "disabled";
 };
 
 &uart1 {

-- 
2.43.0

