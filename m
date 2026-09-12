Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1188478E49;
	Sat, 12 Sep 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212908; cv=fail; b=i6LZEDxDGuDmyEP3AiUZmX26OPfka3SJG/MhY0UYzWh4JfZANe5prkcYS6Mnx417Q2bxZ0xp2HreiMQiGrwxc//ZF7xA1KY4qdyPQkbr+eOSKe3ukS/sw/b6kXwdvRHjt8biALu+9CUP85eN20BhunULylwIFmEOSn8GWsFV/es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212908; c=relaxed/simple;
	bh=lyrBjuIdc9Ih1jTyvsJS2jeIUB+2LTzsFxJRufYm558=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U8AEI284KX4cMSa7NcTa+dXsM6l6oDIg+GdAK0bzPmJf8UV7DgwwMETFJ17YKPkzhXEOZkFvZl6tBX8e1XV/guN79hzHTeKe5nB+QIK97gVrihfEexRh89x8tzAiODu3p9BJGqUySZTGNz8aszUiBGtvClWbeCZjVxVYIiOXC0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AaKK2pp4; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AaKK2pp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9bt9HESWCjz6r5JqTogwWBX/80VaP4e5ZxtVgJaUfzYRIouv2WN0oeZsKb5Tia3kDKIoBhmT3Br8b3tTTsuzqxOGE/eZE3Pf0Zl9S660KNs1UiUiaxb5uze0rfV0H1bn7eMxWnihLfxSNNA1eYUzCe3l+nXdS/Rs/jDP2raEOdKwHLrT+yR5tsvwIp6z20ZOm6S1SvbHNhC/RJz4TMrT0pEkrpfe4oWgSjcJFoMrHX9hA9cnICk/k/Z3FNtfugFxlA4YkkIlFL+tE0UNRcgktBF1vl+HOlty7N+wSdHpKDuW0XZWXhktPOEBKWM/dVsNvbAhaIF3cJimP72xzO1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGiiNzXPe3TwviR2iyoc4v4DbbtT1BgYLtrhEDaYcKM=;
 b=sZsV07UjnXhk8etCK62MOiLU7m6YioRxfDyGGkWIrgm7YXr95AZAwlt3zDu0lN5busanH29g1J/Q+1+hcj4JqYzF27yei5kce97H33XEBgndqL437zFfbNa3YHzG+dxy//pOi89ITrqc7UBYizU9s33C1+KaIYXJn9g6d9J5aCH6xv3JASpLglaRGcdzKf3PAJJlW0iCDrfEwtajmWiGbImjYNZHP+xbsj/VTNKKhV9/v3gGvd1BZQ/RTq9e9iQTPeyE48V2Sk85jKUO78nP+lldOBEA/8RpXMqOz/wrg8ry6b8HQsSEKURIyaW7e08/tLfCQiSHf39JoR/HVGUg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGiiNzXPe3TwviR2iyoc4v4DbbtT1BgYLtrhEDaYcKM=;
 b=AaKK2pp4V102g2wRygK+kBm8E0CTA+z2KrO1/J7NooewWPvi0FlyEGx6a0uvuK7AwBxZ7jHZD9EWIDgO4ojNWj2XTLBORao9ZjSKD2OOSebzvOzWxrMD+nEsZ5Xy6PZ/HW9cnKTnptfzTj/7Uejb1Y0H4+FXXw/8zKP5Z6VWo58p3t2nR9jK/wOFqBD65nY2DoX/Tc4eLl0jmlEgERWwfzq42sDxRX8DhmibFaSE+aya9bTedtfYR75QUx5iKOHti1GgYNO0bZcyBfp7NSzHsP4fX9icGQNy2mlFJ8hroEhKes3U266HIkYAnkxOW44Jt6khC7g2RXT+bPhhkBFHeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by ZR6PR04MB466071.eurprd04.prod.outlook.com (2603:10a6:910:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 11:34:49 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 11:34:49 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 12 Sep 2026 22:33:38 +0530
Subject: [PATCH v50 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-imx-se-if-v50-4-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
In-Reply-To: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789232651; l=18015;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=kF2EqFWM4USlrXEQ85FngFC56JJrjsIGC9OrD6bKtqw=;
 b=GMrkigU+n1xAlexWwqfctsz5We2dHHxj/j8qT4EYvrokkEq3YA/L8HOpM/zMmalcLHqb6izLu
 Ix+O72CFfQBAg92lrguHNAOlC9T0ipsEcKH1KKfHX66TFjV9eD4XpWA
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0277.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|ZR6PR04MB466071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa91695-ee37-41f4-bb5e-08df10c1daaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|11063799006|56012099006|6133799003|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	mC67RvrC1K3D1OSZEiNZTKWdDkuz/eWk7YJkD+c8zE8c4gAZjl5IrKFovsiDrp7S8URCh3GcJeGUd1t8KpCdk07x4ciYjoK/DmclB73rCkRmBGzAG3dQhlSNDQ6t1yODiNuocCmyizncc6JJH+xpRXqQvEJIEF3umTwvLORh2NVyuQFFZYRXjgxgt4pMh4viBAPlciaTexrxq5R3ii6FQhmv33cWiOIUDB2xFTGr5MOdUT1YUDPtApRm0USPh03LUC0Q+LXChDGSOObDiJtEeC6cMzgTiax7/oRXC+P1A8e5oRcGB8eEETOLn9aG8r16ilrjCuaeDo0vBISR1QcLywUM+bXDWp3/Q6ridAI0mPMFCQCRdoZvhvf36j/si0Olbj8vnnb5mD+a6j1PIe/AICLbQJmtnmQypc+JkWv9o6kxOkifq5M5Mu1qWnA3m9Pikhqv4FXVl5Pm/cNXQCNYdzCGYSrnlZ8n4bxAMC4WrnQm37CC8pMa0EqQtqQQB8tVurbY9obzYapINrMXcFVRKm2Nxx+xn2lYeC50ugCBOKB3GpoGZx9qu//LEIcOoVB0f45wMN2BCPxB2lY3hTGA+Fv7wu/OpepktPfaqJX/IdD74qysLlxJgZdMS6MZneVxv2HkXG+Il/h7BJrnDQull0+lLaL0OtH+ML5G7Wt7CjdC/LjKHLVjhq3rLQqNy+jh8c4qbD0/UgbblGZPvGGUtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG45ZTBsbVVRbWNQUWxZMmV6WFROL2pHUnoxbXh1b1BqMUF4aGx3cmZtWkwv?=
 =?utf-8?B?TkJmbmYvSlB5R0dIQzhqenFxcHNEZVNIMVdSZmlCZHJBMHhYRVBJTDhSNzRF?=
 =?utf-8?B?M1J5bjVhZElwa1VSOTU2UzNka0lUZ3l6L1FXOHgzRllDVUhBZmxUQytPbWNQ?=
 =?utf-8?B?ZXVxdC91ODJVREx6bC9GVHh2bXpRcWhNWlhGSzBZTmJGcEZ0bUNpTS9sU095?=
 =?utf-8?B?MXVCODJQZHZyUGdQWU1BTlNDQ240ZE5xOGJjWU1JZ2JqbEJwb0w0a2RycHJt?=
 =?utf-8?B?MVd0a3oyLzVLaC9IOUt1eTNuSFpqNnlPOGwxRUhENnRhTkV2OFZIM2NsOXRz?=
 =?utf-8?B?bnE2U0IzVVh4WHRnQlpMZW96WW5pVnBUSnkwNjl3Z1daQkFmWE1ObUxKeHdE?=
 =?utf-8?B?WXhuUUlyaHBMVkVkR282Q0N2cFN0RUY1Zmo5ZkRTd0FuVGlZSklZYk55dEh1?=
 =?utf-8?B?bElNaFJ5dkYvK2U2Y2VCTkpzTlhWZVpoQ3VYSXpjTktLeGR1ajAwUEN5Sm9t?=
 =?utf-8?B?blBOYW41RmFzcjlJdGhoSjFYVm02RnROWXhzQ0JXOERONDFwRWlRMzJyUXFY?=
 =?utf-8?B?WFBTd09XbDZibUZWWFd1aDRndHFXOW02RlBKcmN6eDA0VUFGUGY3dlpDV0Fa?=
 =?utf-8?B?QnVHUDN3SzFmZXdQRUFHODZaWEl5Z0ZNTVNtaVN1Vit5b1NqbklSY3Vmc1R4?=
 =?utf-8?B?R0d3TmoyZTQ3M2JuVFV6L21HRnF2azJ3OHJvYW0rR0F4S1JOd0QzUkl6dE80?=
 =?utf-8?B?WEtkNkEzb285Q3c1NGY1SzJCOW4zd1J6ZEUwVHhiL1ZlSEVaR0lCLzFEM1Rp?=
 =?utf-8?B?endsaDBLTy94ZkowSGNEOWNEakxDemw1Vm5oTWs1djFsNlUvRnljTE05YWwy?=
 =?utf-8?B?WERCR3AzSkRVVmRuUUJpc1lYZGNsQjRLcWZaYTVHQWw1Vm9BbzkvbUN0UVho?=
 =?utf-8?B?blg0VFFrV0puU3B1a0F3eFVpZEt4SHNZTkpTUXVWeFRFeUpCSFBySFB0akds?=
 =?utf-8?B?NkNqT051b05jMG1pa01MMDlVRXkrd0dleGd0d3pNYk95anNTb3VKdi9HWENU?=
 =?utf-8?B?NDBLbW5QNDM3M0xnKy8wQlk4dkNBY3J1U2w4MDAwRmF6eHNFcEVObzNKVmlz?=
 =?utf-8?B?WHRod1Jna0NzYUQwbkxDcHFPR3FmKytuMU9pNGRNb3Erc25YNldzTEpFWWtF?=
 =?utf-8?B?K04wcHhaaFFOdFV5T0JneGtQVmVjYkNuSG44cFlVODJuRG0yZmhYY2F6eU1S?=
 =?utf-8?B?VmVZQXVzaWVDV04rZEpIMWVzalNCRVRCZnZ2UklCbVlCaUVKUzBVeGZHRlIz?=
 =?utf-8?B?aisxTXFFeWdKaUlXOURDdTZSNitIWWRzZS93eGZPcjJSTkJsK05LcFZ5RW56?=
 =?utf-8?B?Rmt3c05Ub0NTYmxPc25hREJnaWtuQmhUV2VFUGgyMU8xWGx1eCtURU14VGVr?=
 =?utf-8?B?N1BYTERwZjVwZGVHcEs3RVg2eVUvczFzeWdTakhtV0krSERBTGZkeFpzckJl?=
 =?utf-8?B?em1MemRqSkt2ZlJOUFd1RzJTb2MrS0d4M0QySzdKcHNhMGJZN3M3L0VtQlYy?=
 =?utf-8?B?S2dNVTZqd1BhQ0psb3RFL3R5bzhYcEMvTWlSYm95Ti9OUXY5VHo0SThiSmph?=
 =?utf-8?B?RTNWUXc3aFQzUFByWHArdm92Q1FQUGhNekdUamE5YUZ5RWRPb1IvNFo4ekFr?=
 =?utf-8?B?a2tZL3ZSOXFsNXFrT3VNSXNhKzNFOG9MRE1pTGhiM2FLNTlSQUZVZWtjRzk2?=
 =?utf-8?B?VlkraFZyTk1LcGFWNEIwNmR2L3BpTTA5Yzg1UmdOM3FibTRWRGdDNi95U2Ri?=
 =?utf-8?B?OExiYTFHT0gxVUEzS000VXRXSEg3VDBYN3VGSFpJRDVHVGs0cFpmUFNibGMr?=
 =?utf-8?B?U08vY0VQNmpycE54bDRKOEdFUC9YbFl3cmdyZ3VkRTJqNWw3bVdHbzVCbzJQ?=
 =?utf-8?B?T3crSFAxM3B5Zm4rVXJUL1dYem5RcTIveVdLaXZOL29OMG44bEliNEdvL1BG?=
 =?utf-8?B?cGxvWjZSYUV4UEJUcERHd0RjVUNSRkQ4V2JuUkhhKzAwbmhBTmo5ZTV1UWxi?=
 =?utf-8?B?WnNxaDVQTmkyMGc0TTBqNXRlZklXaHNYeXdhQ1FZMmZhNU9VUHIvWkFyMVdN?=
 =?utf-8?B?Q1dqWUk4SUt4ZXVrZkNQOUpBd2F3M1k5MVNoQ2pRZ2xzTlQ5RGNQMkhON01C?=
 =?utf-8?B?VjFhbERPUkVvYXBhQWFlUC9pTVZIMUlYaHA5L2lKMVNTRTMzMXJkN0RTcTZu?=
 =?utf-8?B?djRlUnB4S2RHQjdmTEk5bDJnWHdDbVlPZ0Q4QkpiOGxkNTY2b1dYd2dTMklV?=
 =?utf-8?B?YzJSUldkMEROR1lxL2FCR3VIRlNMMlNTTWtSK1VhMTJUSEdEQlR4YWNnMjhV?=
 =?utf-8?Q?ezPuqAtopyx2yQRqjZl0jAnfzgkZ04rYL1Rn2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa91695-ee37-41f4-bb5e-08df10c1daaf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 11:34:49.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQU3wvLS2X1iXzO6UzTUPuVRh0btSYyG0m9mwsln94L+oaqQ6al1Vxhs8AfOY29dycDEkfrCcd2926U04bCJVZZDlZrs+dOK8kPE8DTIk534jGtC5aMxkBBSRQ+XI9l2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB466071

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 25 ++++++-------
 drivers/firmware/imx/ele_common.c   | 71 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   | 10 +++---
 drivers/firmware/imx/se_ctrl.c      | 34 ++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 105 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index dba6f0ee83ed..650153d39f46 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,14 +82,15 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
 	}
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_GET_INFO_REQ,
 				      ELE_GET_INFO_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 	if (ret < 0) {
@@ -144,12 +145,12 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_PING_REQ,
 				      ELE_PING_RSP_SZ,
 				      priv->if_defs->base_api_ver);
 
@@ -203,12 +204,12 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_SERVICE_SWAP_REQ,
 				      ELE_SERVICE_SWAP_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 	if (ret)
@@ -260,12 +261,12 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_FW_AUTH_REQ,
 				      ELE_FW_AUTH_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 
@@ -309,12 +310,12 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
 
-		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+		ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_DEBUG_DUMP_REQ,
 					      ELE_DEBUG_DUMP_RSP_SZ,
 					      priv->if_defs->base_api_ver);
 		if (ret) {
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index c4f87fd0fe5f..838d2f957e74 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -47,7 +47,7 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 
 /**
  * ele_msg_rcv() - wait for a response from the secure enclave.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE dev context data.
  * @se_clbk_hdl: callback handle whose completion will be signaled when the
  *               response arrives.
  *
@@ -60,8 +60,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
  * Return: number of bytes received on success, negative errno on error
  * (e.g. -ETIMEDOUT, -ERESTARTSYS).
  */
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -150,7 +151,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 /**
  * ele_msg_send() - send a message to the secure enclave over the mailbox.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @tx_msg: buffer containing the message to send.
  * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
  *             message header.
@@ -161,7 +162,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
  *
  * Return: @tx_msg_sz on success, negative errno on error.
  */
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -173,9 +174,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -185,9 +186,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.\n", dev_ctx->devname);
 		return err;
 	}
 
@@ -199,6 +201,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -206,7 +209,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 
 /**
  * ele_msg_send_rcv() - send a command and wait for the response.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the dev_ctx data.
  * @tx_msg: buffer containing the command message to send.
  * @tx_msg_sz: size of @tx_msg in bytes.
  * @rx_msg: caller-provided buffer to receive the response into.
@@ -219,32 +222,34 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
  *
  * Return: number of bytes received on success, negative errno on error.
  */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -255,7 +260,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -290,6 +296,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	/*
+	 * devname_snap: a local copy of dev_ctx->devname taken while
+	 * clbk_rx_lock is held.
+	 */
+	char devname_snap[32];
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -313,7 +324,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -327,8 +338,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -343,13 +354,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -371,8 +384,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -384,14 +397,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		/* Snapshot devname before complete() can free the context. */
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
@@ -401,7 +417,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 /**
  * se_val_rsp_hdr_n_status() - validate a response message header and status.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @msg: response message buffer to validate.
  * @msg_id: expected command identifier.
  * @sz: expected message size in bytes.
@@ -420,9 +436,10 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
  * the firmware status indicates a command failure, -ENOSPC if the response
  * size does not match @sz.
  */
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+int se_val_rsp_hdr_n_status(struct se_if_device_ctx *dev_ctx, struct se_api_msg *msg,
 			    u8 msg_id, u8 sz, u8 version)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
 
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 39bba4ebe8b7..89ae4c335e7b 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,16 +16,16 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+int se_val_rsp_hdr_n_status(struct se_if_device_ctx *dev_ctx, struct se_api_msg *msg,
 			    u8 msg_id, u8 sz, u8 version);
 
 /* Fill a command message header with a given command ID and length in bytes. */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 0013c960ec43..b5d3421c0987 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -294,6 +294,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx);
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -337,6 +360,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
+
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	mutex_destroy(&priv->load_fw.load_fw_lock);
 	mutex_destroy(&priv->se_if_cmd_lock);
 	kfree(priv);
@@ -426,6 +455,11 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create device contexts.\n");
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

