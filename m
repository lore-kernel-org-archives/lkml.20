Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799422;
	b=WB6TfrZhd56kyE1daDMVpV/x11HXxpHc1D5ffnE5VKO79zD+phCvKNZWlGGcMHl2AW1A
	 aLYov0Gv6U+FRoRE1L1rdr0OPP0dxNBuAkDXkKaEMpm0gNRuyJXxw8o9/+yrhLWSFFW1a
	 mv36iVSB9AKkhhn+xZaBdVb0WLyD/YFya+PpDIIFwIT2vWATUl6MBEFdLy3pLnYFvDHz0
	 epKnpUDwPgPLFfVorpIDVzDnMbbtQQEkVVbIPUiu8aY4ccVLNdYZhWgHRir3WW0AcPW6K
	 QS6ZasJqkzXjBUyZweowEjv9k5pubMhYqNkY1zITnU/7nbmkm1bayV/WGSE5FaZ541g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799422;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JHZIFAkSj4hWJoMXcuJzSEKWt1yUvjs66g2MZLqwdZs=;
	b=C9oOS366vhHsE8fnpMSkcARLcIOMBqI9OFiZnJsRALga5oBq7UrTaFA5y6su5VS94RrK
	 nSPkl42SIDOTtZTdGkiybfgbQbdscv6DJLAqmbrSTjq6xrt+LpmrUHzXC37vr4dGVumf1
	 nLfSTZTqhPMCDFEQr/ZmxMOY6/xXDmsf+My2ZO7BdV95TQfzo/irEcr/TYDYpskAFUGeD
	 jOSk71BmtvxPBXnsVCt0mOnup5/A6fFw402vWzXdNlzST91GhpTwNco0M34RGhwTJm3UK
	 Zv44zmNZZqO3tFT/EOB/OFqOVmfLibg3DOvdpJx/GABQJG0RQeeYm6PTDQu8tTTmXlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fBUDZWsr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.12
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41752606A889;
	Mon, 16 Nov 2026 03:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41752606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fBUDZWsr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnIEmFZJ9+KZxgySw/6u3leaBV/Ty3W+8mJcEx4URGSVHWWq/LP/uoa/TozeSEYtqwJEXPkybmezlF4g13EKv5r3goZ6ZqwuMK92USEOfuV3qhdqVvYSxJsK3UIxA2W8Tv4a6cOjrFvJ2kSYjX6KEukbTnTdRgsqPVtpWkU4JoktvI29wnEpDNLFaXnj0MfYmX2jk3SYc83hNa6D1fcFlFy84ONJ7Y+VZUSqpR2CMSwXfGC+jQ4eakwtumPT3EImLrtfHZq+6ve+iXX5eyOAcwzqFxXmV5o4jX+vLJSXhDk8AL549iDVLbNKW/sHotIouGg0k8DOXy2L5K7Xqumqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHZIFAkSj4hWJoMXcuJzSEKWt1yUvjs66g2MZLqwdZs=;
 b=cZf/wY0mAuNVlxmLV7IfxQAAn6TaW2StMjDhUP2Bz7s7DrqTRe+PBwQDX/VhCjxGx39HrHOBrcSEXbzD4yzScFR289c0gYDPZw8wu//MhjtcVji3uvK/zOKU2Aq0vjAduJ+4vG3egvIooIgssDXfsMvIwXdATVklNMD4YRsOCHYJlapcwuDrdPnU1se/4b/Il1jdwT0AU4erpmWu8yj3EXiqHZBKTBfFMH8mhGqz5MruDPy7QrqTyq39fQktWZtY+utgc7o33enAUN8LPwLYXi2PdTmZ+ynHr45bIhkQ0zqSW9FlPcbghX8iu/qMgWtSlo5CBToj3m54CmaKmL6U9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHZIFAkSj4hWJoMXcuJzSEKWt1yUvjs66g2MZLqwdZs=;
 b=fBUDZWsrORGZRcql98vFXxxguhf0zDQ0P8hNhkxFM39P8lNaNv1ZvR0P3AIxfDyzF6LZ8C/fZ/opWsNjiRC5tzl97RDE596Xsl7iGMwBK0OBIwUkrVBNGzcs1ANGiN8aNGdS1MBHeoWULI2cK9YGdkf53rDKzKlolfGuAgH1PgKADz3eSj/eCh8tK0DEccuS0+uwjArLb0mfxCeHgko2yNQST8Hzvb3vMF6akBpVQs1arOSyMuOvLd1pMm4h6B13gyVAIHFQ7V3gUcMyfKuBOSkuY2gvTLUomTmAZbCBPQAUsP87oITcBsZbLKIa1ojC3h9r3ToMOszCEt2YZ5Ydgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:34 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:34 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:20 +0800
Subject: [PATCH v5 02/11] media: imx8-isi: Extend output format mask to 7
 bits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-2-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=1617;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=UuuUNfulf5NlfzNXiYiN4LqbepdTHadX5Ki6f0tWDwg=;
 b=aD2DZH9hCDYy0zmrJ9vlvnX/FLecaeTLmLj3Z1gACKggzwY0MeMpL5vTgUrlAhMJN6GBH1de7
 596WerUltcDDKSd3lcuWc2NFAa5obSkbHOJ7nWZj86NJTyQSBESpwQW
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa9d495-6f08-4f9d-7b5c-08df4390ff32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261022115727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TxFT8Dh0FKsI6q9/2a3r/zfNeJs1+/TjSLHJ8pSwPoqV6OqXCmGSqWKt6fVWTSTrzLJSQKQ3vP2qcPgEkG+aT9arqXrZ937Twi7OG/VE+qJvpAqYhcNjSXxV0EibnPLPrh77tzd+FVpyVV4f85V7aEk0s2mloflWh5ZetsTNsJq0Z6CFaNmb534uONDHEzDEX+PWuFgJkKAjOh+q0mQnvOZrL23pdLVJ1bFpWxmqFrclqhiL1IxpLH9nSfRJBk+fPTYW8NTerfDxXGsTcm2fMmjVR06QHIXeMH6RN6QB+2U0bo6xaddyCyzJIGzGHHA5fiTcjbuPfHZwVFmpcW6Lf37M97x5ett+HIbshpY5K3ciZiMbyFdj3SiMbUGcY6uA7j9R9EZuB4fSowgOptFafXE/dS3+MSEodW4qPNgtbXQYS23EMli824XJam1nj1n6BBiyx9T+MptoivGQ9P6PRYL6TVw07pRPqJBnMgn0CaSB3kCgULmvyRhHIWnenLVA5HN2jLGEnLjsRhfjoBilR8h9iZ3x/uP5iOMyiDhgjbXhPCnJ0T+S2Z39cAH+wSaZ0UJLekpSEU64smJd78kW5hVtSPPoEz4IvCniKd9NyNwcJdIxjA+opP9FUIMrSos3g+tElal+0u6V091tBs3RjQ2kedfxqzIynQKtL7A5UQlwCX9xqL/H/iZiMXGzdMS7vDR0ny+l167FCkUOuxLtRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261022115727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VGdjF4eGxDSzcyZG1QU0ZYYzQ0OGNPQ2tFRjRyU3dXQ2JMNG8wRnk3ejRa?=
 =?utf-8?B?aUR5d2dCdzkzVDRzb3dXSVhsbEhhMzMzZkljSnhqMGF1aEtoSVFnK1luYXJU?=
 =?utf-8?B?V0V4QUJSVWh5WFFXNFV2c2dUanJvS2xrekttQ2krS0lSeFhCbVFHcWpLR0JE?=
 =?utf-8?B?R1M4QkNrV0xKSWZKRUpFQWlKNkJtK2pqT0RjYmFhUk5rRHVUblZMQjNyNkZ3?=
 =?utf-8?B?dUErRlJ3WVRDa3ZWSjFaRDBjNW4yaVhwVzZOeVkyS0dQNHlSVHJIc2NaVm9q?=
 =?utf-8?B?SlVYak9pc0x6TnhXOVMzZUVWc0hibkJxeWF1aXc0SnRqUGFpcnl1WXdRY0Jk?=
 =?utf-8?B?NXBxNjRveVdNWElBbm9rR0xvTFl5Z2t0Y2l6OGs2L3RmUUVKTmJaQUFyM2Zw?=
 =?utf-8?B?M09VdHFnRzZ1cW1BNmV5Y2J3b3NIYitMZE1pSjZLaUMxQnJLOXNuVXY3OXN5?=
 =?utf-8?B?Z0ZONko5M0VNRk9BbC9oN1FocHdLTmFFVU14ZmdUU284YjVLYzNmU0gyTGhT?=
 =?utf-8?B?ZlpnSmd1blVoSHJWNlEwWVVSMFp0b3FXM28vQi9FTkFSS2xwUDNiMm5OZG81?=
 =?utf-8?B?OXVOUG85T0kreDlpT1B5Ny93L2k0S0w4UVNtR2NvZU9pdGVOVDRsdzR0dTNT?=
 =?utf-8?B?NHJaYmNTVE9aY1FiTG5BcjZTczNkaG96c2tjcEI0aUVoeFF2WE82Y0NIRHJ4?=
 =?utf-8?B?RE41Vyt0MjRTWnlYQ2tLUE84WS9ZeUJhTFJDSCtiMTVvSU1ZNEV1UnZmKy9j?=
 =?utf-8?B?MUViU2UxYWtONVVWZmljSVI3b0ozdDFJb0U0Vkltcnl2YjJnZlpxaE10ZFUw?=
 =?utf-8?B?UFFIWkFpb0tDU1pWSjdGb0FJa0VpV1cxcE4yTHArZVR4Qyt0WTF4UjE4aUo0?=
 =?utf-8?B?T1VDZ3d1UmgwQkl3aC9ab01KRlRTZitDMXFyaWs0N01TZmlnTzBIT1VQV1lj?=
 =?utf-8?B?aE5hbS9QOCtXcFdRb3JSYmowWVppQ3RVTmxjYi9oN2NRT3RsTVZpeFNWYzdX?=
 =?utf-8?B?UkJBcnkxS1J5K3phNit6NW9WazU2b3R4SnJrQ2FjRkxZQmxzNndKWFFkN2ZD?=
 =?utf-8?B?QjAza2RVazdVUzUvNkp0WE5sVTdiSURwbTdnbXhpSUlCT1ExT1JpVFZwUS8v?=
 =?utf-8?B?SE9zYzgyamNkalpVRG8wNmVBeDJibWdLTGRtdXJyM3RWY3A0ajNSM3VjN2xs?=
 =?utf-8?B?TW13Nk9sUFZtaWEwb3ZmUW91NmoySnEvM2pIZ0FabGt3MDhoNkpwMWZOWjhC?=
 =?utf-8?B?UkYwZERxdnpXYWt6ZWY0b1ZUZGc4K2hvWWI3UnNoYkZ2bTgwTU4vSmlWWnVK?=
 =?utf-8?B?NE5IRkRVUDJraXE3clZxbjdxVCtSZTJVZlVkSVVydDhDZENmbTlHck43UDQz?=
 =?utf-8?B?STJBUzRib2xYWVROMjVXVHdKSmhDN1lyRkIyUXlYMnZvaHU0UGkyRGtQcWZU?=
 =?utf-8?B?S3h1K0d4TzR3blpTdHhLN3Q2bTU3L2UrZUdHUWM0Wm1RT0RsWk5qbkkyUzhx?=
 =?utf-8?B?Snp1aEdKMnFqYURFMkc5bDR4N3dmRFFab3o3NVNXZWZxVkNZcU1ORytOQnRW?=
 =?utf-8?B?dGJrdkhPTG54U0gvTXZZWm16MnZyZ1pTUUk1UzkrTmpvakRzemxXeWFOT2hu?=
 =?utf-8?B?ZVlSZElCUjYwTFZPNWJwOW1aNkIrOUk1WEQ0TnVXU0lCdHN3WFg1ZEllMCtl?=
 =?utf-8?B?VGtPL2JHU1pkRTJuSzlyVmVYTi9SZ2tESXRCT2xZN2NHWEo0VGFOZ3g3aWgv?=
 =?utf-8?B?WmFFR3pDa1U3REs0OW1yR0NjbGI1QXBxUWdHZlpOdE1jNnNPTmtRTVhJK0tn?=
 =?utf-8?B?VFhFUzRxZVNzZlI2ZlJ2Z3hxMFB2N08yVGs1aFNEb2l2SnVmMUMyRVdHZDJw?=
 =?utf-8?B?Qis3SlNFZHd0dk9JSnRwN1l6K2hZcEEvQ0dhNlRMS2hwSzc5czY3TjZ3RVV2?=
 =?utf-8?B?WVNYaGFQRnk3MzczM1FuTXhScnlqL3ZKSVdjNXM5b2w2QVExejRPYzBQK3g5?=
 =?utf-8?B?cDNwZTI5ZTF1SWd5YXFPNVlqVFR1YnEyOVA4NHZSbkp1R3VwMVFWNHVyY0tU?=
 =?utf-8?B?UTBnVjM5aHZLUldHcm9yNGFHREQycFFrNDBxS04zR0h5a2d1THFPWm1udE1N?=
 =?utf-8?B?Z0lSQjJ4Ky9wSjEvU3VTM1dFNEsvVFJSNlY5Sy9jckFqYVhqT1FEK1FDUHc5?=
 =?utf-8?B?NTVZSWp6YkE4SkxHTjg3MkJJQm9MSmNNK1dhSWNMeEpsUzdIV0t2N09iZHJW?=
 =?utf-8?B?dE5id0tsVlFna1dTZXlMRWlCUVVtQVBSSERtMkFpZ0tYbm5BRHRRblFyVTVK?=
 =?utf-8?B?NWhaeHlDTlFPZHVDYkd5akVReFJNYmtlS0VjM0VEaTZoQlpadGs4Q3RvU2tS?=
 =?utf-8?Q?HWRVN3Qe51zmbUxsUEKxRXQUK9ZM+z8kqDK0e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa9d495-6f08-4f9d-7b5c-08df4390ff32
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:34.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K25DdoG8KCWylGQ+IDdnTvbfyrnkx5JRqpgKcVyYVfWWAIJvPuRClwJ58TIKw33/GZWa3bOaXpmLppIr+gtMuu6X4POz067yDTVkQHbV+hqdqZkWPB/CJgu1w1q57f2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

The ISI output format field width differs across SoC generations:
i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.

Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
bit 30 is unused on older platforms.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Use unconditional 7-bit mask instead of per-platform approach (Laurent)
- Drop Reviewed-by from Frank Li due to significant change

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index e795f4daf3ff..c704be882705 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -39,7 +39,7 @@
 /* Channel Image Control Register */
 #define CHNL_IMG_CTRL						0x0004
 #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
-#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
+#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)
 #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
 #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
 #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
2.34.1

