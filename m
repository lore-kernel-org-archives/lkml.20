Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040F4C10DA;
	Tue, 29 Sep 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671711; cv=fail; b=E3lFYSIW2dwTeqK8E5M5fbCf+y0yLeyZ3jdgQrOpsXXWTNQJoaZvByD5VPtZt39tx/sX+bsXSrWpfGltg3pSz2PyFirSwxW+O+BRKM4KlxygkF++FODTblHDi8uQsVJC308p2klTOtw1ru9oo8kyi6OPXjxpsc9u9Eqh9yvhFH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671711; c=relaxed/simple;
	bh=09zZuqgXe2OIdPfWk8ai6X1WFFxNQ1Ab29TGRIivYYU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UpBOr9BR33gowxb98fX2BTeS903V+LeIy+LmsItx1cvg+UWxlVk3yYBQmlYQok26mWprRBx9DhFvcij7fJER2MYhRfKUap0sTRIhExmWp2VYxn0TZWCqPEr1sd/0KSYbBb7eRfiaPv3X0bYx3zE0q+E00m6lblWEn7jSN1kpkpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hH+8H9kU; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hH+8H9kU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPhdy/W4LyYznCVBDgLra7C7TdRckMUx81Jh+ZNwo+RsklTNN9zJMr25M7s5s6M3i1wu/HpAKQzuw3s/WHEo/BcEtyHTl3OATrA6Cr43c/aqNGjfsXRW8aZrBcjC/iVmq8OvvTRYkTmbzky22k8iD+a7byRYOAb7eLhbNN7ZMUVH2IyYFfBc+Mx5lwUi+ut4X9wB1T7ebATNiDx74UUwCu4fG6GOKQrWGjfq5GJzWunEJnYDoMKmypQqDKXkKpMZymabTJsIS+pmiwpzKX8QwTUWXie/UXxqFXWR2CwpALCztkc+kWHpbWRIP8stAwX2PCG71Ca1Qie1f8us3teSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=X9pRRlSOi2+dt2EhchnHkc+RdNV5Ud0VDKkq1OtHlEtE2/sAxWwDTpgvdLwJ21VWFpWh2A8M6VVnvQUgR/QvO8Ac4zfXhg0PaVDTz5dcRm7khYGmgwqk557f8vbFAv/XQcoMwlPSzqfDkZz4k1l14gLpu9x0618wK9BS+aPbkIBGnVGRiXDyaX2h5/nxYAr8owK7wdOhc/fXdHZl9VF4HhNia+r6Pm5t4ymAyCCeJiE+n8qEAsdAmh+T3yz2gSMcpjUa1c5tI62KVNnsPpo85JssqhGQqZFut9u9Qd9IHoJWCkMNpXtYNdmMJSV+fKHAN8mNtCtxjGd/i0dUmsGIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=hH+8H9kUdF4uzxfV+NWShyKn6RCPKFLwqlmCfv3ITF5hHnW2vMBosBX/V7NLgWxZUiBhFLIFNpkmJq5If/WmhvVzJmaccwG4520xs3bACznc6u89twDW98qbWPbIdpOxmFgVPcK1nDF9NWRmiyS+uCeJTCB4HlXU5lX5IILao0C6tk6Z6AeqTxdb0sJzugA+bpLTNP27XBf6UWE8PO7Kt0KwKazJOwgPUYvYplJQ3ex00AUvIbmVDELOm838ZjGCcrxIPfWN4ycnBE4AKUrX3JrpTKUNhjzHvJSC9Bnh5oHSZWMNcaTlmbg1I55YYu/v2g7VuYohxn95daeN7BnUpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:11 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:11 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:22 +0800
Subject: [PATCH v4 01/11] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-1-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=1898;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=09zZuqgXe2OIdPfWk8ai6X1WFFxNQ1Ab29TGRIivYYU=;
 b=7+9yXiY2PhxXmN45NNFrd4lEQ490ZC2ts5xV3L70OTXO7eZG41SO3UW0rKSc06lKjHq0GdrAS
 4qWnR+fdwuZA46bI6/V94cO2vXg/Ht23q1EnnataWJqIYIoHj1RqSky
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: df652379-250a-43d8-8aab-08df1e06644f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|23010399003|18002099003|22082099003|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	HzCCOQ0D6kq8V5W4RdEu1nfnUEF6c3Fwt1oZGPGDlF0WzZqxfqIlg1xd1q8Wqn0vRiTVnfKOAUmbrRNnZftIkJ9h2bGFj+6DYDZTBtvSzgGcAoDJp3U/JKu/VIgAEd+8S2KRV8zctWsuEA4oGIrPIJCsuLce0ydIgjdOV7L5VXm9x3KkLEsVIhitELr+JHPwOY2KmCSWmZC43CS3b2TljTfLoHkYfCM13UB1Uy7kk/UT2rWXng5zwIgfk9S5X8sl3K/3qNrtSKZqgnF4BQuUBnqMq79sjK7TCrokcVnB0jOEga59GyQWczQJnBdnHxv1CL1v4BAMuVyMjc7WnernLWMI64l71BtvQhp7nuwsKf0FvaQpovjAsm7liLQLDUP+ybbhdntlQVDpjoqhCBZWFaVmL0fw8KypKK3FIzXb/bzKEniSPkTSta6wMOcnNayDDLJO8UeAB3yAWNTQo1glfypaqGjlUVUe461D3+/dC2TV3BgvRq9T6ZGrDkWSqy0cga8qixjqdn1h5GyyTR/4SWkiELwP8CxHrHU+e/9H+clLjd95AdCb2YIyWk6lDmwv7lg8sgl9nRnjrJgPvnbRyo3cZlvio9EHc9CNxM8zPOWSLP847DnfMhLsqjF+5QIcVDHjOaT0Jw3iS6PVl0gOyrAdPJD5oTM/aygeyv9fZKIg7yd7VG+fBwXwH/w8CvmcjVga+BwFu27ucJ7FtwQbMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENycHJDOS8vSU1aeWxHWXJtMmdtaE1aTHR3SVAzQmR4Q3dmTDc2bkhhckdl?=
 =?utf-8?B?RzRMaWwyQU1sK3VvZGtyanJoSUVyT2xzTFRGOUd4ajc0a2psWDNlUzFwT3ZV?=
 =?utf-8?B?T0tqaXowQlIveW9QbWg3WFN6dHUwRUpUMmw3RDF4V2tFN1ErNWFmU3hURWRP?=
 =?utf-8?B?V0VhNG1QLzBLeVNLQkk3ZUZEZnViQTN1Q3QyQmswdmtUR0ROMkJ3QWxiNDRq?=
 =?utf-8?B?YndOamh5emxYWVpQSUI2bDJyekl1NmtqZUdySk1mZStyU3NTN0luMGRyU1I0?=
 =?utf-8?B?eTd2QWF5UmRrYVRIdlFsaXBOTWZ4Ujh0MTRJTHVUbzRQU3krckxod1FJTHpG?=
 =?utf-8?B?SWJNa2xMRFFKdHRrWE9TTFBrZVVxMmt6NG9COXZzaDJVR0dFNFJxL0N0ZytH?=
 =?utf-8?B?a0ZnM25melB2V2RLVUY1SmlkRHVxajFLbjYwZW50TUNpbDc1VEYzeFA4Y2tS?=
 =?utf-8?B?d2RHbGdoS21ZU1JhSHFRNEVoNWFpeW10Z3ZLaUkrS25sM2NQc1lmL1kwVitZ?=
 =?utf-8?B?N05OVi81T05UdHVOQUpnVWhIVkx5QzJFV3ZXMmdsT1U3a2hTT1hOTktzeGhC?=
 =?utf-8?B?Z0tiWG5GS2pnVWg4dHBDam9HRFNaNTY2WVVOQmhvWXJqK3RhSE5MYzJGemps?=
 =?utf-8?B?R2VxSU51RFB5eDYwdHgzQVhkczVwUi8vRXRxazZIMzNZSWo4a1Q3Ny9paHpl?=
 =?utf-8?B?MWpFUm9UdytxVkRUcStxK294bTk3dHcyNDMyaUQwL3BrUGNDRW5sb05oSURL?=
 =?utf-8?B?NnYramkzRlNlcUhydmYvbjltdHRueThhSjRSOFNCd2JjK0xJSGdjRmVtc2hr?=
 =?utf-8?B?RzhjcElkTngvdndRdWozY0dzSUtxY2FHUXlaaTNMQzR0REorazhlMTB2d01B?=
 =?utf-8?B?NUYrNGxnd3V2UEVYNTBKWnhzYUwxd1JxamlNellRNE9KVkFXTmFVUTVRVVoy?=
 =?utf-8?B?dlRXMDJkRUpCWUZ6RHFzc1JGeWllOUFtUFVOWDBpbm84cmZUZkVoc0JZM2Jy?=
 =?utf-8?B?ME1INjdYcC9aUzFHZTFRVElycThhVXgrWm1mZDdpQ2NaSUsxMzdNMnpMc3J2?=
 =?utf-8?B?UnlORHcrb1VwMEVHVGJ2TVlhYUdYaTZJeUFaTm9zOEtKVUlQNTlHeUhLM3pL?=
 =?utf-8?B?azB3L2ExTnc4cUM2RDlQdVpld2F3MmpaamliM1ZTNEhxTG5lQnQvUXEvUWZz?=
 =?utf-8?B?dUxIbEZ1dkdKRldSR2QrdVNqUGRmS1ltZ2lpZlJtZ1AxbnY1VitjdFA2MVZH?=
 =?utf-8?B?WGo1UndpMUU2d05mOHBvQnp4c3lXMGJhUVpCWCtzekRIb0x6dkxQZ0Zodm9S?=
 =?utf-8?B?Z0FwRVNRTDRDbEs2TDRRSUEvZU44RnJlOXlMdHpZbXhWc3R3ck9WUFc4UU13?=
 =?utf-8?B?TDVIbWxsTDErNnM2Z3dLS3podE96TzBCTzdiR2RUZWhmaExXdmI5OW9OeXJH?=
 =?utf-8?B?SzdMQlo0TUU0NlFyVHova2lWTlJxRFJZTzYrUndQdkxKakZNaDJ6ajRCQ0J2?=
 =?utf-8?B?R2JiUzNNNk84QUV5a2F3NTZZTE5qeVdiU1AyNllaSHVOak4wV0dwdlZEeFFp?=
 =?utf-8?B?VmVFZ21oVlcxbDY0amNzcmRDZHE2d0QvLzZBQXhKMDhuRFFXUEtCV1Axdk5t?=
 =?utf-8?B?L3Q4MXV5cWNGT1VhbTBXdG1kblJkZ05GZ1VuLzdOUGxQRU4vRDE5d2RVSE9i?=
 =?utf-8?B?czFUQm11YktZRFczK0xKdklqMjA0b3NaT1JTZFZrc0tWWmpVN1hqTmgrZkNk?=
 =?utf-8?B?ZkpjV1ExRGVweDFtbWptNkU0b1h6aDdyTGxLZ0VsMS8xZHdHSG9HcWR0b3hy?=
 =?utf-8?B?SXZHV081UmVaeWk1WWhzS3c1NURmazVQRnhpa016NkM0V1AveTVOeG9SM0lR?=
 =?utf-8?B?OGVQdXk5aWNTdmNuMTVyVVh6MnBDQmVDYWt6eTBNRlZpdXlKamgwekpsS1Ny?=
 =?utf-8?B?YzRTSSswVUZxQ2hyVkhCQ2k3RytIclk5bVBwWkRHV0FKMEVadjZQVEYwRUl0?=
 =?utf-8?B?R29jem1TR2VoVG5qenRJdUhydzN6Wms3djFxSkpCMWJBWG9GMmEweXh0aUN1?=
 =?utf-8?B?cEVFZjVQbElscGlnM0lTaENwdUNLeHhYZTVCbG5XNVYwaytic3NSVVNKSEcy?=
 =?utf-8?B?QWZLa0o2QnNydm5pUGFPMHVpZUtqNE1aZnpyaEQ2ZldLT3gwTlpIYjByUG5Q?=
 =?utf-8?B?UGhja2VnMXpVU0RYNExTbDkvaktmVWJhRW8veERiWWhXV2MxMGlycEpBVGFD?=
 =?utf-8?B?b1VSR1VyU1MvOEhXbFYvSS8vSjB0RmhaelVSY1dKS2NKeUxRR2F2QWZnaFFp?=
 =?utf-8?B?OTVRQ0V5aU5qSUljZmxOS2cyd2c3dVk1ZEVpNHJPczNBaGVxMDYvYXl2UkFZ?=
 =?utf-8?Q?1Vqo1FJKeHDjdhA/5KhSQ0cN3UBIVqi62Kfzd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df652379-250a-43d8-8aab-08df1e06644f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:11.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcGDc1B4NrMOJVO8RU8axqLmM/URMrqEzrq1MfbyNt5Ta0RsJTm42KWn1HhHksA6cH5OS44z9/DrzuFEKx4AHEkVRdo0uoUTttBntQkJ8RE5n2w28/RlVBSj0kR0o3ZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336

Move mxc_imx95_data definition after mxc_imx93_data to match the
order defined in the of_match array.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..f2a8eb82fbfd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
-	.num_ports		= 4,
-	.num_channels		= 8,
-	.num_vc			= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= true,
-};
-
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1

