Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CA442374
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414728; cv=fail; b=d1BOxfZrUTNoxQE9jpvnMR1dck24l30IYm7fpciEuoUaSrM35FH5Ipk4iA1fqHd9BrvrqW/TbnGZMaK2xXiyja8CFt4FwVG8IMLAsBV9i52WunMNwWJCp9W/h53AYO623P3sAzHoi5pgoxHcd5YSfhlYA+xn2T3Yz/JUQ1DVc/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414728; c=relaxed/simple;
	bh=kRqMpEVq7LH6wTl1kl7bBAVH9JBodyIlVoajpmbl9EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SstIdyDz3UQcNCbLXQmPEc9O32hhBfePQGhYxyNDk9oI+KAfaBtxe0BZJ8KONog7tjwLFl8+t+05I8y9n0kmzxEBVS14tPKsMD2iYmEdUFgWGp193++FmAge9fGdsaLiukNf5ur4MjC6VUji/6bMSqHuB2BGQ8jZ32PKh2Hoq8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KQAU6rI/; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KQAU6rI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7R5OCJB9dak/zLubGyYTaejh7gf4BXUWopCTAo9lfT+rBc6xvKrPlUq/n09T0LrfjsAXLNzyXWGiwAg3Zz6+te+RkzJJdo84GCPuAaytEdqWDUet+WcbVfS4pjHGziXvTSzNxVTbXfYDNBAs12LXKM65TA3pYVSLtFTGoarKsyINPB4RM3xvf+h0NeIzEyiLGGCds0SND89woza0fZVDUObphFu8ZNu6X1qVRe+0WLCyedNd4cHBCmQek+pdpIqBzaqNZIxM5bigdg6QzfCql8g5070grzOQlOMFGZR2A7QVB3nGixaHvXyu8MZMpcSNYi/pjxItmcaY2vYmbOYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeubKS7NtzPFM4wdeQxIRaX96BH9mjcVKdeZo5BJmEE=;
 b=V733gRtjuj323SHYMkCnxTz0u7twxtWgtpRFKd3p1MhKCF7yCcMViTiA/0r0Y4bS2mvgPgxOrn4EczbVVl/s0a232P7eEY/OzoCfgp3pKIpVKK13NYcvxfG/5r42wNUmnCNDcPugnLi3fyvWJfbW8KPGsRonpMtd3+R/5CVJ18dr60u11F3PD14KUp3keOqgDpBCmrA47H8DtIvKPHCRT37OD0i5WpVaiazLGI7cwxDZ0BLrv/842osJoBY0LYJ3AIemNu6BwKPgDqgF9kYMwKAJmVY6qu08IK3a8I1I917wrDL3hBZbuZeNOAYcPpITofEn0Zz65xweoZemyxK6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeubKS7NtzPFM4wdeQxIRaX96BH9mjcVKdeZo5BJmEE=;
 b=KQAU6rI/dAaSJZPojd09Khz6jVVjAKKqD/fO4BqgVDz3jMt3ibZh0jdYMbr6VFkGB0NUW8dNc6e18XqDxmVx0b7NVHo5B8qj57rCUJ5wqEu04W9D59+9qYCWmbbiuIOnKlcnBQq5YlmcsHLeD3hEB8tPsk0wci546ZJea6bPv188RxxuwsYsJps15PYmc1EBrr7XNNNjJibiczSiyFjthayhS9EaVeIBmrPJG16kQIwOAkKk+MrZ6EVhklCXykqzrK72hMLgP3sOeQzedNFNztmDlvjoTn2WSKK6SFhIft8xflbeNO0jq5Ve9v5bCAIDlwn1B1G/jGN60XYC5Yhwrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:38:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:38:41 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Linkai Gong <gonglinkai@kylinos.cn>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: dsp: fix mailbox channel leak on kasprintf failure
Date: Mon, 14 Sep 2026 15:38:34 -0400
Message-ID: <178941471053.1826729.9281672927010710649.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
References: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:510:174::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: b859dca4-5a65-48bc-46e0-08df1297c7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/Bi44dIbUAZ9XRqBKcovBHK1QkluzLFvTz8NthCky2Lfzb0+SRxekWnes4YilNTZtMnjm2J/aNOSDKAXrr+wwHav42XdtpoOE0Ju3K5Bi6EEv3oKF3zJAvPBQVmzm/3G18soxR8MoP0JmSaX2+vaXpJwa4gnmX/uKlB5YCM6wqKRCk4XAQOHC8IYSkjDS32NFO33LER1DhEfFljHbTrAmEQ/KIJCo91p8LxB6fMtPEiNjcaxgRK79efr5EJRzxrkn6/qj/7haH9uSKY7HgPBSe+cVaDWSbubtxogZWe22iBzwcUItj/tjllO2Y4e31ItZOhlsjFPTuz+z0fFwHx2xdd4Ul0zNt+C/EC2p74JlhCDnr4xh1Fr0FxnJIfSG+LBgm1xpqttIW+H7WDUHvT3LCasXjsY9Z89nx7R2S+13eIYQXyvJ81pvEteYei4cmmwgeeo8YdIWdrMmga7RBddNkidbXhUJcIyPwmReDBm7q2k2FrE97TVidjC/GEjT90dfi0CwkUgDsJ2FYZdDUWN9bRA3WTANvKqMG6WoCvSY5Uoaep1K4Wjf0SCJ0zUkcztjjkvGOpPRuivAUvi0HjUqG3rjMxcagBhDtK07Hjcoofy4AlNZ3LkLCxnrSzcqccLRenJaQqHoUo+rsSsycPPGGIAJBOnbqLM9YXxEdL2fnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hEMzRLcGx0clFrdW1iQ1c2K1Z5NzBwaUx5MnVuQWNGYUp6UnBIaEttbjMw?=
 =?utf-8?B?bkN1dGhoYVlORVQ3YnhQTXJhQUtoc1BKV3BBMUxRcDVEYUFETEYrSzNJMEJj?=
 =?utf-8?B?SURJY0dxdFB6RVR0R01MaWpSd0dpbTRNVXdLZmVWWmtYc2h3bDEwTENUaSsx?=
 =?utf-8?B?N096THVIMTZmZkxOUnJBSnM2NW9MNWg5bHg5eDRQbTM2UTBEMG1HMmJ6ZmhE?=
 =?utf-8?B?NnN5dUNUVXYwRVRkcDdZN0l0bTRCdEw5T0tHWlg5M0Jla2VENk8xRmtFWWlj?=
 =?utf-8?B?L2wvZmJ4cDlpQy94QS96SkJ5V2tmNU9UWWVOZU1tc3ViaG9UWTZHY2NoTDVS?=
 =?utf-8?B?SzJCcUZBdHBNVFZmR2lKS2lPYk1LNHN0Q3hEa3drZ2JyMXVOWGQwWG9TbzE3?=
 =?utf-8?B?LzZlNnlvMUw2Rlk4YVB4am5HNFB3S1FiUHhDbDRJY0k1R3NxaXRrVU4ycVpu?=
 =?utf-8?B?ZzRhRDlNM3BoTmRqbVp6VlpPRXlaT014Y1hmdFQyazg1VFF5WVVkK0NyUEJ5?=
 =?utf-8?B?am96U0l1SDB4bkFoY2Jxem1WQUVUYkc5Ukt2U0JqcDJxR2c1T2dJVU5yQmpB?=
 =?utf-8?B?ekVJN3FjeHF3MGRoR21kZEZpeXFHSDV6Q0tNbU9HbHE0dDNYZzVGeVd5enB5?=
 =?utf-8?B?RGV5VnpoWlNzT1c2dFZLL1JKS21lanIvTDZCdWFialNQa0NKUEg2R0IzcVQx?=
 =?utf-8?B?d014Q1dVamZIN2I4SG13b1o3VVZDVWE2dmhPMlp3NDYvZElyL0hrWVJGS1pD?=
 =?utf-8?B?YXNNcnhVMlRaalNwejlXSWloai9nVXJVdmFqUERMR3hqR3ZIbHRWeHVMVTRZ?=
 =?utf-8?B?aVN0SWhHcHNwZlk5b2xHdVp1cUZlakp5SmY5ZTVrTzJzaGttdDAwRi9KdWgv?=
 =?utf-8?B?LzNreXFkMFNHWUdKdHI0UEFOWmpOUFhsYnlMMllNUmRpMG1MUGZseVVOZlFV?=
 =?utf-8?B?MjlZM211cEFJYyt6SC9iRWtjVjhSZ0sxa25FSzFJLys0KzdPNTFBQ0NEdUpv?=
 =?utf-8?B?cDk3UEpMOHlzRzFiTmRuWE5IQzFNa0grd0lZdzZpbmQ2ZWhPMWwzd1lxMEdw?=
 =?utf-8?B?MmVEZDkxV1pNbjZ1Q2VobWxoTlFzbWMybFNLUndBUjZaVVJSZ29aUm9Rd1pl?=
 =?utf-8?B?TFVOV2RreG5qRzQraDU0ZzhOWWpPOFFEK0lWVVJQZWxkdVpTaTRyY2xBWUdw?=
 =?utf-8?B?VTcwTS9wcUZOT2xyVHgreWNLRklOQ3k0UmVLOG9FL3MwRkg4YnZtOUZHRXhS?=
 =?utf-8?B?VVBqSmRlMTJRbzkyTXJNOG4xc3EvaVV0Mklwd2ltWjlpZ21CaGJXYXlwM1Rn?=
 =?utf-8?B?bXltVlpFT1hWdkdYUlVqK21tZHRHWFpDMUE2T29odFNucndtYnpkVGdHN0kw?=
 =?utf-8?B?MDRJaWJDM21vdzNmRnUxUHpwOEtremd2RkM5MDk0NnYwQXEyQm53Tk1NT3Yx?=
 =?utf-8?B?T2VqeEsyMElKcjhVNlVMQzN4cmFNWTBKU2ZWTHpYc3hRVTl4N1NDYVErRURG?=
 =?utf-8?B?Rzgzbm9YRDZYUDZyUVZ4MS9xYjFxQ1RXY2xIRldFOVp3VkV6ZW1IS01scUdS?=
 =?utf-8?B?T2JTMWRYaHVxMzUwb3AyczN5NEhldFZHelRaRlZWNCtaMS83N2pyQVh2Nmgv?=
 =?utf-8?B?OEt6cGNLNTh1VTB0cG0zcklkaUdia0FPUFJtOU8zaW0rTTc0ZWpoL1dtYkxT?=
 =?utf-8?B?TGUrSyt2ZTZ1TjZmaEkreE11Z2NXTG8yWTROMHZDV2xxUmo2MHJSclEyWS9r?=
 =?utf-8?B?L3VGL0ZBWUxJYjF6NmNLck92YytJTUREUGlnbXJ2WHl0YzBsVmN0eENreG9S?=
 =?utf-8?B?TWsrOSsrenFnV3lhUHZyWCtKV2NFNjlkRG92K2ZBTDZMMzZ1L2l4WDMrZklS?=
 =?utf-8?B?YVdmbnlPek9uVWhFUllTR24vUjVTSjR6Tjd2bkxVMWN0MXJTQmRWOENJbUdk?=
 =?utf-8?B?ZWY4U0RmK05sdTF0ZVZHV09hQ2xJVzlPTjNBQTcxYXNKUFFyUEFIYTFaUXNP?=
 =?utf-8?B?ck1SUTB2S294K0dnaVp4OWl4QWgvZnZzZzlPazdjK2M1SGtuVVVnWGMyRmxG?=
 =?utf-8?B?MW9RbDJpTHVJMklDcTJkL1NaQW5YUEUxeEJiVVBrcnFpaGlJRXNnT1ZzaGhR?=
 =?utf-8?B?aUJKRDd5UWxRRFdDd3A5SmlnSG9XWHNTNU5UdHl4WkJianF0a1R2eFlLcnli?=
 =?utf-8?B?UzJYek1TMGhDSUh3WWJSdTVYUjZGQVJPTVhmQ1U0TU5EcDVtek1sNnVaOVFx?=
 =?utf-8?B?RHZCZEdTdGhSMUtvSitDb1ZlV2dKM0xQWnl1MVRiL0RkSU42REJLRWVMek9p?=
 =?utf-8?B?bmI1enc4ZFRya3dIVkZsSWUxNjFQY2c0UHFuTGpITVZGK3luQllJWFV6ajVu?=
 =?utf-8?Q?td9gTW9p/ehRND2Wdy4qqUAYMnzAMvtKs53fI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b859dca4-5a65-48bc-46e0-08df1297c7bb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:38:41.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5shmUyZwQ7iTVD2/YkhJF+vNgUe4nDzHRXuHPCRUaPoeQwVbw1F6f076u33RoYKP12dpJbk/DNLPYmn17WHj6Pc2Dk3rztKBhd6eJ4tiVFHXYOl3WJkxRIbnPC7achj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531

From: Frank Li <Frank.Li@nxp.com>


On Thu, 13 Aug 2026 17:58:18 +0800, Linkai Gong wrote:
> If kasprintf() fails while setting up mailbox channels, already
> requested channels from earlier iterations were never freed. Route
> the failure through the existing cleanup path.

Applied, thanks!

[1/1] firmware: imx: dsp: fix mailbox channel leak on kasprintf failure
      commit: e3631d0242842940f9e902afaea98202e56277e8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
