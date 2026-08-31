Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6653A8B3;
	Mon, 31 Aug 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189824; cv=fail; b=U3nGnDIRhZVpBAhkIIGZSDhyJUn3YzegNkdxcF4RoKlCQnOvy9g1aMFcioGKhioGAm3Jq64K7YDf5DSv2sDGQEzc7bE1eL4c51rNxDBCgDv995D2o/vZS7Xv+A8ylNFPK8T9LSEiA6w/zTXj1Tj9gGoWveKyuQRa7IIJriXtTBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189824; c=relaxed/simple;
	bh=6qcaAFHx6FIM5DIJsp4GwvigN4PcSbJCZKXd5W5cLQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pYaeksjY4n3WLMAezI08aFfwOeztf8Epd50Cs3PVSAoHKBmJVwDAkxla4XndjqHiszJKbrY5vnL5yBtI06iDc4ARDvLYLsX5SmjIksj0ceUpwb+23UiMcAMQunM3dQe5AkUwR/o//Ygr82hOexn9mhok9GnnGy9jq8Za8yL5QCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mZEW6ucJ; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mZEW6ucJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMWwSR9rSS1AWsUQUtRMOVJPhINIffzm+4VkGa55azbwfVeHuIQ9yEXK1vvy0PEBy2jjnQQ1reGiFDWm+/TohmBppXMvaaAtQNzQLNGZFvaerc8pyaqEkdpjM34q8dcdKFslE8Hq2KeSZzyQxhVylMB67eUgKVs6+QLHZ0pkAtwA8cI8MTuMcfEdrHqICG/53bL/gZ6Y9mYowTkvqx7PCl3X3xR7Sz3XFvmfpWI9PIW9F+Dxrbwg/Lmu6vPKdQaXkzfXL4TpIdUXz+uMRvovlXFS1lqthTFOJroq3B+1WgMTXifZ5rI8EPsehsiRx4/azOT4dkASIJpTZLd1E3Pa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI5zqa3QUfGjk3xHUPYCh+h6c8PtU2T51Gb0ZmybECQ=;
 b=mvgYKznJDtuz6KvtNK5free2ImucS0j3SFkCbv6F5CiGpZ/TtNIuuGJ5ra/2KcfadXBEdfxX3kBYB7Ii7sHFbGvNEYwjt3Cxb15Hm6UPR1S75HyVkh3gj2A0/F9z6ft7NAZQGc2oWzWEfVcVtKZ8ho1tn+FPe1sPIumuGPweKsOtZ8N36XTeHdgRJOGvnjwy9gjV59r13cDCOh+0RU1rU4aEe34IN/IilRdWT9GjcgQuFa6s9SuxRe0aqXSi6PkL0h/u5cQUlc1aQG+Gvg36psaWRzYqnGzvEGoBPxsx8D1YU6MWzXwVHbN/4E7iK6AoIsQaX4POk2kiDPVM29xqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI5zqa3QUfGjk3xHUPYCh+h6c8PtU2T51Gb0ZmybECQ=;
 b=mZEW6ucJLGZyBtzv+btxT+K1F8qM/riBbYWZAJDf7ibuQI4I8Rwwi12pdnKQTEdrnlJ4mKLdLojAZGsXXn3TKXVotkB4RvbTNiPvH4Gp1nhx2XHlE0YfQT5IddtSjueX7KJ2iAWau5zceXVPhdQOTllEg+ge0fbQyWG7l+2B4lUbBnU97M0DhrBhKnpqxwr6m4VR3iHtgwcyGLOArYWlm7K/Jo9fbEAegtNDAYI7dZJcHznloJAVUS1PpHnwsiJmij2iiwLbKyhSXHBQKeBni+BUBeVpXbaJ+RJMSpuqJzPmGsRMLT975xwypdnpwNMgRAnSoZSh/0AphiwFLN0aYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Mon, 31 Aug
 2026 15:23:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:23:39 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Yannic Moog <y.moog@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
Date: Mon, 31 Aug 2026 11:23:31 -0400
Message-ID: <178818980337.4013675.3305153518593546005.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831051222.3298730-1-primoz.fiser@norik.com>
References: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0063.namprd12.prod.outlook.com
 (2603:10b6:930:4c::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: d96d0fe1-6daf-421c-b79b-08df0773d507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	r6Ooh3E4/SGu2nzMQWQeboLgfedSdDwz/tJUJwAd9I9+22BjChX67Ujy21mKKt27y1UtlpIzxaeYhSLOwwaIYnzWP++gCSVcmDuqWph6C9rTQPYeBbRE/Tevdktip/2oRgyCb13XfeEC5RiRKimH7fDLxoxuyK10eUPHYSdPghvphuALApMxO43maXkjVt4iiw42ix2YHPNgVWQ0t0Dk/s1TQtrmueCgloJ/Cdu/muDwsVDr/FjWjdAFdO2RKkuYrWkpR52xy0kC0tyERrSY6T33tOcAgzr7UDWC+xgvoTLNtBxjZPQ2BaSSMJrFngg2DapdadDtxs49TeRApdPcwVouP67OPLX3/xFPdqqIj/4uFsr5z2eE+P6K0CoRAQh3OVWB1WtPWrg/A0oU+tgex2sNesExw/QYi2T6CUIlnKxMZMYKOOQoA6xhblbGJpnUN8lNL3EMV4e/wcv5DjiBnFUvmzm5dFPtySLzZNZxHL+dHkATbm9ZWKLOsinRwPkm21elaeg6ktShMDzsH7KPkzPcJseu5eZxvvIvoLxNRtdk8/qerhPBtouOJ1bN6BcU56sK68WkrSa0lwvW/YZSoLlDZkmwBmgXeStgzhzpMHfQDRh2DP6EzcBTVpH1TXaTnnnsVQj6kALRYu8fc71sYrATQQ0k0jSw768Gam/UEQEKA9BelOk57Hf1UzNahy+sFigzOwwgAYB+maVxc2ABlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGtwT25Sa2s3Z1BEdDRDanh0MHBhVFpCeFFjQ2s2REt0VG5YbFptTVRJd05j?=
 =?utf-8?B?MWRoaVVReG53b0RSTXNQMW1udjRvakVrZFlHYjgxVnZ1ZCtraWwxTzBLeUFP?=
 =?utf-8?B?T0g1U1hWc0RIOWY2VE95ZlpuaEJ5dWJHTEZjdXFsSGpqVC9laTA0ZDVEMi9z?=
 =?utf-8?B?TjhLWGYrVm1ZbHJXZ0R0ajBhSGpKYnlIUnlIRDBBMnBySVdDR1lXa1hsNmc0?=
 =?utf-8?B?SjZYbzBaNStIY3RDS1RWNFJxUFVQdUUzWUJXV05KNzJQNURQTGhRdmFLSzdt?=
 =?utf-8?B?K0ZHV1pZMmkwdlMraU5zQVp3dHhIMnliMitpZ0tzZXNEUWxjMC9vdlo2OFRl?=
 =?utf-8?B?cGNndWVlbGFwNkJNaERIQVBrVysyT1F0SVNyak9qVXBuMUZmYSszVnUvWXpw?=
 =?utf-8?B?MUQ5WExvR25UdGtoMDNIMmhwUXRMZXJaQjM1OEc3WEcwYUZXcGpBT0hTSVhY?=
 =?utf-8?B?dmpEb1RObnltM2d3bzN2eFNnK2F5a0VNMWh3WG1LcEthbmxwQWpXZ1crYU43?=
 =?utf-8?B?b0h6ZXJZWVo1aU1kSTdqREp0c21ZdkZpVVdzV2NnTFhzQmE4UHdaaHBYczls?=
 =?utf-8?B?cjZTcUhwV2dWS2dnREtqZGtjU1RzZU9xTWJzcmxOMVE4RnlXR3hXbnZsaVhn?=
 =?utf-8?B?NGVxRmdRVXJWSVJ0SFVFRFg4T1ozZHRoRTRkTHVkN3NDT1UxMlNLNGl5KzJi?=
 =?utf-8?B?U29QbldXbUhZTXp3QWxTY3grdjlOaVlIMGViMk1WcmVPS3Exd0JhZnVSVjZC?=
 =?utf-8?B?aEtxQk9RYVMvd2lMaHozVkE2RWlTd0hNbU5XUWg3OFFvZnNTc3lGdmM5OG5D?=
 =?utf-8?B?aldUSHQ3V0NXc3NFNWhmVnd2Y0tHbE5uWDNadzNOWW5oSmxua3NpQzRrY2Yx?=
 =?utf-8?B?Y0xHZVovMmRKT2xLbnVMSVhOcFdwWXg0eW9DUHhrV2hmcEFHdEpncjU3Q2kx?=
 =?utf-8?B?Zjc3aXpUWHJYNWZCL21WSXJ0ZXZMbEc1R1FOL3NGTFdUckxNQ3kxT3QrMmc3?=
 =?utf-8?B?RGo5QVAxYkp1WVFZNEFwb2RKOVdkVEZHeHNuZ1FIbU5qZGsydXkyeFgzaTJp?=
 =?utf-8?B?UlBVYStKL1V4Tk1vQmpHSUs0aXZPUHRmendGcTJtVjBRaGFkcXZNM09taTgw?=
 =?utf-8?B?eTcySEdoa3ZBVTR2bEU0OXBZZ1FzYVlUVUl4Uk1XT0UrdEd5WFJVd3Bqcm1l?=
 =?utf-8?B?UzJHNmVjWjJTcDNPanhRWEthV0tXb0VuSVN2SG0wQWpqY2JHbk1mV1Nxem5j?=
 =?utf-8?B?TTdva0NZS2pMNnlYTXA2RlUwM3NMUzd1MHhOc2JBYTFlSnlGdU9EVjI5cmw2?=
 =?utf-8?B?QUpOSC9iZHQwVXp4V3RHUTErSVFTWm1JNjNVN3RQM2Jncm5RVHdNUVFOSWpz?=
 =?utf-8?B?YXFhVnB3M2xXTmZEalM4WXRjeFlxUTluaFowdFJ4WFduNkNiYW0rc3NrL084?=
 =?utf-8?B?S1JqOC9Bd2crM2V5Zi9JeEJVZXd6V3hiOG5uRDA1SVVBL2dVdFdNL2VMVVh5?=
 =?utf-8?B?eFBxRWdJZFVtY3ZXaElCdjdqMGN1NFhCOUc3alJFMGJ3YzFpMGtnWE5BVERp?=
 =?utf-8?B?bEQ3K0pPZmVsalZ3eFZiRWhWSktFYkkwWUZsU3YvVEJuMHRDdlhBZUxmd1lo?=
 =?utf-8?B?ODFnSnZMbWRNVVZONWd2bEZzQ3FtTFpwUWtvRmFpUlhhdWthc0ZuN2d2SzBK?=
 =?utf-8?B?NFdwNHI3U1RRMmJmRGxTdDJPc0p6ZHF0ajluSFFLclZaWXRDbnlvNmtVdGE2?=
 =?utf-8?B?TUNQRXZmM3Nmc1U1Qkx2VGtRTXljVjM4a2lnWU1mSXQrRTB5cE1aTTNzMkxw?=
 =?utf-8?B?a1lGNVJPZkl3bnpESXdvUWVEQUM5OHBWUnVJS0JZYmthNTd4YUJqcUczS2pY?=
 =?utf-8?B?c1MxTGE2eHVBb2JZTDYwcEpWWXpldnJOcE15TEJiMXRwdngyTHdzL24zZWQ0?=
 =?utf-8?B?UjFWWmhSTDlITWVPazMwOC94VFVGNkE3Z1pVNTJxbXJ2aDUzWWJ0bk0rRVQ0?=
 =?utf-8?B?UXp1eDFmaUZTUlF3Qnh5RGZ0Sm1FZ2ovMFZzNThidnp3bVdtL1dFZzlibmM2?=
 =?utf-8?B?UFRGdEtJNktscmpBNXpiSnh0NlRUbXNOcGZvenhMa0FiOUhnRkNyUTByK2Zl?=
 =?utf-8?B?MjBQNmlldllHOEl4a1c4WmhDU2RhVWJCZnUrQitEeFh3MWFMNUpBUHhjeHg3?=
 =?utf-8?B?dXV3OXZZMUV4ZFJTR3MzcWMrQXZRWXB2cmhsOHh2L3hNTUlVTGc4NS94ZDdq?=
 =?utf-8?B?d0kxOXZEMW5qQklEYlpLUkRsSHpHY0tnbSthTmttSlNYWVVEKy9DVmsvejlz?=
 =?utf-8?B?VWZ5VGhTckg4ajRIYmtqNUdvOGl5UVZTc1JGTGtvT1hsVlNreUhkckthZURr?=
 =?utf-8?Q?7QdMUscP11yg/Yv1dslaQa7zecLH+NNFXKxWQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96d0fe1-6daf-421c-b79b-08df0773d507
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:23:39.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLXqzn/JPSIuSS4vgq7fFroCw8DK/bkOf5IrsxR3IrgDnoaQPbTNgNuygCvusZY1uoju6F38YojP1a0wEb4nInnPzm0kX6IstJxNGHPvo+eP/UWgTCXiCa+hBJxKMXXT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9496

From: Frank Li <Frank.Li@nxp.com>


On Mon, 31 Aug 2026 07:12:22 +0200, Primoz Fiser wrote:
> The dailink_master label was placed on the codec sub-node instead of
> the CPU sub-node, configuring the codec as I2S bitclock/frame master
> with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
> way around: SAI2 must be bus master, with the codec as I2S slave.
> 
> Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
> fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
> property from the codec sub-node, which had no effect in this topology.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
      commit: 1c3f5701bc0ff5cbe56bdae76157047d47051d44

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
