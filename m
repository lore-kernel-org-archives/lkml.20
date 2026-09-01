Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6349DBB3;
	Tue,  1 Sep 2026 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301598; cv=fail; b=rDkptqER+P6U2VXXJ05t1VMQtLPPOI3qxRFGoLzEt65lYoV6lQZ48HMT2SElBAA4l9bHnMMeLxZIY8ZDPKBylkFZWodkpZO7DFAPgau9LwZWb5HBLj509PtD2ZZLfEnIBi1LbutTxYOydOZUbdHFe4CozSa0DBe7E0v7JyJsvTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301598; c=relaxed/simple;
	bh=y2aJznmw2eHLTcccSaOpMqnUdo5KXlq/wugox2rYr0g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AC7ylOJZa0r3X9yQ1nZSViQIteOqOvcqgPFGMvYCt6iw9kxDw4R+ItWKOK/eyxQ4OFGOr4z97zNvbqljAqSl8Acu1L9GSpArL5LN5IYA29jtUoxGDUkj7Ownn7/qNlqEJP9uxxz0kuPsNJFh4rRbGQYsBr/vT0VuzIW9E0EGAdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CeQzFPwP; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CeQzFPwP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsmMMpcWUYOvWZpa++YBW08Ss5iXQ+kWehDl0XFzI9zQ9F6lvSvZilTohzxOYMkllDwfIIPKGQOrmhlpApgTF0QXpzJb/E7Uur8iwbQEaT73GVqaefzw0IagDGj7flOx/x8kJ/IQWMWmUpAaVQopjbspytrZLAs08RbX2Ldoa7Zuq3f2H4/j8kYwGJndGBfukVe2jAl1/+aUxFKM8d7xp+GaD/Zyt7mw6KvO3sALkBRzYlUDSVoz8N1+vEToGA3tU2uVO4ZTVqjwc5nXGvOZeCxZd+qrwg5IR6njtjMpa9hgs+BqI8ErpM4//oKu3SqcMBxTcs+mMXqAPQWg3AY/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5empcrRIfoWoZ0FP/M0uCuquK8pQ8bz659IzSiN+mw=;
 b=IHeQXoCjVTmv76yS/nyjE+feRN8ZKRwFOnd9BEpA83JLB+FpkpuvTFHFCEaMStaiKPjm+Wu7vP0V32w81xqP/r/Lumilj3OrSRc8IGEPScUIawtQ1tXrQsz9tpJK5w7nQ8cqv2hlCKTagDlLWCFBVDtbXq+XWcCWl43Tx4bm+JZlsqmXsQYDxpwdjS6/LgUUvy5GTGA8Fy9oDq/YMNofrOX7i7MAv/IoWDGY3wwTNm+RofANQE+cO/CZc5I/vAnqfd9WwcNBYrYxioyXHaOqwElPEus5JcgeBLQof3U4eiCRzcwHzfr6g1TIWDXH7CXhjnvwDZLkWTkkXy/46+WsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5empcrRIfoWoZ0FP/M0uCuquK8pQ8bz659IzSiN+mw=;
 b=CeQzFPwPgQXyuPv6IXd9vp1ppXqYR+nUVYCbkwXJVD66u7HljitaWqZPYybjs0mU9zV6G2YPiI40/TiCWdvTcvbAVJvOOmns3vNRtWDaVIK7152ujONAtLsFOenc7pDxV30WsBHXtOw4Dr8MpOzWHvD1vns0AY8xHb6XzRBTcWmYEZzOA2lN6bNoXnndIpWa/EM7+Zzg/YePsBu1G9b23rmjyYV6IriTEAxxOhIRXsdWsWSUleEC32gMr19HvbRVyfz2gl0Jd7RREyAGZ37Wza0ogW12fsW07HuLeMWkQYKdfCNBS36gvD9Bm6LdWTMCbAn8zabumM8i48r6qNjQzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:28 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:41 -0400
Subject: [PATCH 7/8] ARM: dts: imx6sll: remove unused node csi@20e8000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-7-db741f37a1f4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1249;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xlq2q0XDIL7qgNR+UsBzZXNVZCbxCpez8k101TDey4c=;
 b=7OfCvTp9Il+QXYyo6FreP4vxxisAUF8oRnZ25cy6B//fOjwVbnegczddqAbFHkpLWXkeUkUOq
 qNEDLAYN5p9AftBPhyQY5zXNPt3DBHDI17iYvocemr1GOcTiESqa3+C
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: 6946f65a-d8c9-4537-a5c8-08df087810a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1QJALWdpZ3xea5uJIpInYHZAPMJxEtBPZcyLv2hxtmsEZ2OLhWsBOv0cg6/EVvyvUt1kjRe36W9lHN5O8Ux4erazJ258M/1wPe+HrAb3DJGbppfbgoF3ss7ZJIOlfPZmeh2oCrH4GS8YIOPfd+D63mlbVcMueJPRS9ZK85AhjKOzvfVMiS2YrIq5RK7AqADHiglZ+nyzOVg0+XK/F+6bj1Bln8zyovyar+kKxFxpJt0lpoQt1hSxDgr6RQ5/RSFBedvYRo1PtUS2oj/xsflGeW4EUYbJdPfENh/CyIv4B9D81M9qVPlDtHeUb8CyUUWS/4qQD9zpR82U09zP6BVZK4jiPfSwHH6DQhVe4FrutwNwRn+zcyDaeLSFZIXkaiDSRzN/9purk3M/uC9c02v/7N5L30WTpj3zngBGb/PEcyky2D849LB5aVef8YPOC12W+PgFZEKjL1btGJM/gpGIM5W/0e7Ka3jEWuCmQxy0BNYn0Ag03cTYeTZ1NXhbTFdZSsgB1jXfz6GSTOGfMWArEEKkAkOCP15H9TSfgY997F4Fy2+9+6Xru6V/DrlMkfo26t/jubyLPuJm1bA913l1b0VguL/2xmmKVlz+TLeziyX4wnep9kKxqfvBr75LDKL6YbHzktHAd0YljJyDgVaSTNobWvGA03ZC9u5kTMYfcSI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2tVbUlIbU5TNk5BVXJpb1oydFNCUDFieXBNVThmcHNKRUZaOGJSd292UFF0?=
 =?utf-8?B?THZ1a3VNUnpGdTY0bmhqZkwyQ0lZWGFib203V0tob2Zia1YzWjlNeFhhSUh6?=
 =?utf-8?B?c0krM2VldlNpb1M4SE1xeWNlaERHditTcGtEb0lpbDN4T0NkVm40a2FrbWdG?=
 =?utf-8?B?aldwLytiMHYyWGl0R3BYTkxlU3A4VmFYVDFXcyswK2lPYVo4ZmYwcWZJTE44?=
 =?utf-8?B?aEdqTTJXWFEvUC93Qi9ONDFXWExGSlQvOVpCK05aemYxdEJacjVDQndocGNN?=
 =?utf-8?B?RnlpR0Y4Qms3akwydkFYdkMrOVFuMmFuV2xCL0oycW84SHdMaDZTdHI3Vzha?=
 =?utf-8?B?cnh3cC9CQlRQLzhlOHFZQ3RmTmdPeHpzRlpBZ0dwRjN6dGd0L0FhM0xBcEl6?=
 =?utf-8?B?Q1Vic1J3Q1kwTXorV3lVMEgwVkxQeFFxRDZLdUUra2VKMmpBQlEvNHBhL1J2?=
 =?utf-8?B?QTZQZ3psV2NtWDJqNWF6QW1uU3ZvOURQNFpBazFPZ2RrTFBUS0ppVmYrWW42?=
 =?utf-8?B?MVZoQ01MK2pkbFo5bHZSQ0d2Q0ZYbHIvUWNqdm5aNkVCMjJKRVNDWTJ5ZnFC?=
 =?utf-8?B?cXhiR0hYVS9oc0t2WjdBdk43M0dtbmxQQzdmZ0lTTjFSVTREbkRaak92bm1L?=
 =?utf-8?B?Y3RtSktObHNWbFpHUGsyK1JnbnBxYzR4M3cwL0ZhU0JNRWJCN1hiQTBKS0hp?=
 =?utf-8?B?TmVGeGlUckJzRzBvT1ZmRUFqb0x2MGlWQk9kaTdDazFKNFVWK1F0RkNqSnpG?=
 =?utf-8?B?eDI0NEM0cXhJZzFVc0dxMXArTnlWRFFGMVdxN0kyY29IWnhIaWllZjlLMnNn?=
 =?utf-8?B?SWpYSXQ5VlpHRVFZdlh5cWxXVjNaY2p6dEJQc2ZienRDektpcHZoeXZlejBj?=
 =?utf-8?B?bENwRi83MjRkYW1VMnFvZi9oTFZ6MSt1c3pvWThJOS9uNWp3UlU3RXdwM3p2?=
 =?utf-8?B?WHRSNHdZQXdCc2ZtYXJncnJPRDlsdUxMT3JNTUJYZDkzNUErd3MySmNDODAv?=
 =?utf-8?B?U3pEOHd2Z3E5eXdwNzAwS2N0RmJpQmdxdmNHSmRDaTZWeHROaFh0ZEYwWVNk?=
 =?utf-8?B?RUh6VjhIMnZ1K01DL1FPZkNvWWUyeXpEUVBRaUlzc0hSdFFKc1l5VUIyd2Qw?=
 =?utf-8?B?TFIzNDZwSmgxRGgrSkl1c2RJdE9Bd3VmR3dwak5ZNUZSWURLK2NUUVpEcStB?=
 =?utf-8?B?ZXJ6bDR5M092Z1ZLeWRQd1VidEFVbnVvWWxJYkc2TlowVzFHeDdUOUNOYjBG?=
 =?utf-8?B?SE10eWhDd0pacDBJS2NnUU81L1ZKMHZNeUxReHp1T2hneDk1cmdnNUJwTjRH?=
 =?utf-8?B?VTI5WHB4bE5hUjc0UG12dXE0UW9oZnZrck1VcTA3clQ2cUtmS0t0NWhqeXcw?=
 =?utf-8?B?ZllXSTZNZlZwMEo2Q3g2YUdTM1ArQ2x5R0JTdWRXM05sekJUdENWdnFrcE8x?=
 =?utf-8?B?ck05b2FZRHNiNDdSa09SNExYSldYSjdmeVhRSnBOcFhuMHNZczdhOFpmVEFG?=
 =?utf-8?B?SVJZWS9aM291Ky9weVpXTWFYWXNLc1JySlgvSUZDanBWQU82eG8xN0FuRjJD?=
 =?utf-8?B?Vk10WUtyZW9oZWdGZjk5UGdsV0xCUGVlZmU1dTFPQ3NGMWdjWThSTklxbHhS?=
 =?utf-8?B?cXdqQjN1RUtnU2tZdDhXZGl1aVRHenUzZDk1VG52NjVGOXByblllWWRPWG0x?=
 =?utf-8?B?YjZ4bXplT1U5SkJ1VjEvY2I4aUlTQTBkYXlnNGgzaWpqNGhzWnJqMnYxaVYw?=
 =?utf-8?B?Y0EzOWxVNDBIZ3J6K0VKYXExQVMzUVFaYXE2MnNCSGxiS1ZhQTNmQkRIR3VM?=
 =?utf-8?B?V1gwclN0T1hXc3BPOUJPMC9FQmhUdUR5VzlYTXd1VTVTSXBhV05DN3phL1dQ?=
 =?utf-8?B?Zk43Z0dKdDZ1ZkxuYmRBa3hxRU51M3JKbWdDZE4zYkhrbXVCb1NJUUZSZ0tn?=
 =?utf-8?B?Z0x3RnhIZnNzSk5YZkx6YXNFVEFUUlVaeXU1aTR2dllqMTlFeUJMbE1tUEFU?=
 =?utf-8?B?dm9YaWRQWmRVa2ZjdGJjVGlLZFlRdjhDVW9Ld0ZkMFJ0a2s2UEk5M2l4ZUJ0?=
 =?utf-8?B?QjNCUnNwWWZSMlVYcU05R2hBTXlnVEowNm9pUXJPTnBMYy9mUGs5eTZhaEpM?=
 =?utf-8?B?YjRHaGgvTzh0eVVhVExqZTdmZFIySUF6VUJnek1rY3ZrWDlQemQxTjh3TU1i?=
 =?utf-8?B?VkhtaEZwYVk4SXdLNGRXQTlNUmk0YzlrZ2ZHbnU4amYvU0xRaFVCWisraVNT?=
 =?utf-8?B?NTNNTFFCNmRtSlpiYUZ4Tm1QQWxDdXlOa01JUmVoM1E2bzVEKzZBdWRhWnF1?=
 =?utf-8?B?dVNKZ21jNFlLM0ZQQUhPQmZnVFlTLzRYZTNtRDlXczVsdXEyOEVobUNZeDAw?=
 =?utf-8?Q?p0TtQWsXMPR4qzalma5/s1T1d+8SgOw5w14Jc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6946f65a-d8c9-4537-a5c8-08df087810a3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:27.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoQ4jqmHkuj3etzzUE82KfF3GueVL4KYYnSK3YfjNv/x9SaYSijxuqcnPSPBW/tw1Ns37d/vO30R5z00PMYPrzfOlOf5Wv0XNRflhb49OeqRPk/zaJmmhuhYvq9q8BWJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

csi@20e8000 is never used with compatible string 'fsl,imx6s-csi'. Remove
it to fix the below check_dtb warnings:
  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index c96669605d1d8..929f7815a4546 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -624,17 +624,6 @@ gpr: iomuxc-gpr@20e4000 {
 				reg = <0x020e4000 0x4000>;
 			};
 
-			csi: csi@20e8000 {
-				compatible = "fsl,imx6sll-csi", "fsl,imx6s-csi";
-				reg = <0x020e8000 0x4000>;
-				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clks IMX6SLL_CLK_DUMMY>,
-					 <&clks IMX6SLL_CLK_CSI>,
-					 <&clks IMX6SLL_CLK_DUMMY>;
-				clock-names = "disp-axi", "csi_mclk", "disp_dcic";
-				status = "disabled";
-			};
-
 			sdma: dma-controller@20ec000 {
 				compatible = "fsl,imx6sll-sdma", "fsl,imx6ul-sdma";
 				reg = <0x020ec000 0x4000>;

-- 
2.43.0

