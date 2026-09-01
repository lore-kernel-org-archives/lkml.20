Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D91313E38;
	Tue,  1 Sep 2026 19:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291070; cv=fail; b=tpMcHqJnjodLujoFKeRaE4lKmeosipynC52awnS75jKIWJfm90muS0sgtucCTueqbGuXeKcCoWoPm+p1dGBnqy/pKQ9F9gdz4shG226eQbwMRBi28SmqSm8y3Fg9/n8CAzx09SY7mFe5WYL6ak1qaelpmOhEMLGHDYcFaxi/pVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291070; c=relaxed/simple;
	bh=dsDttvbe36yqpN+xkHTvPl4c3cxnHfZnUA/+bhtYaSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MndQoHdmxEYFY/gVC+Ik6ktVXsRDqQFiPqle6F6PpcAVyw8dMPX//r+qABk9BBM/Fsa5mULkJMNOnuqxti9PcKGrcNhYLZLZCosQjLWt5CM8bsWaiMBNne1qeH9kINUKLBQQT5iLpfdJtC+xAEIVhutB/aRlclLI6db5Hqd5Ub4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KkdEoMTG; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KkdEoMTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypBpqkhThBZIzKrRmGk/TVcC6/xN3e2d4tJvU5PfmCzK3tDy/4tlkaFi7kbzycfniJuqecxsCJ/xAW9QgZzwi6GY6Ic6Pm7WQmMLwJbj6HZgBXE8Accst6PtcivDs59ElvDAceTLdRN/tEveILMAUYAL2IUNjgKmT0s4t2f9cCldbZY9gMhRfQzLwZLH9DFm3GAjiuMLFcrUtfW4wa2GRnbtVcXwjH2DuPczfuptPbu7Ysl3oDT1Zs8w4tCut/XLV525ER8iNyRacLhiyzY6X5u7Zg7xOt5HgR+6tpwG4YgPJ/oEF4shqAZ5tgDCx1JFQHF0lvgdLTHIwa30t8MzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwWBdMKvNI5IrW5fE5pYJqlbPqlWyJ/ODQ4A5hF/5gM=;
 b=chzroKpi7/5vgwvA1RXVYYP+PYUHdT5QUuRU+b43JjqySgyuTBsb5FOmPIg5mvFxyAW0DNznpY3RuuKjBFnsStOQIYYN3DVbdvX3nL4vK9G+Y2NNi7mincKkX+pI0dwHksEp8QrGJ5UaDRpub4NzAZA0VUfmBVetpVijpiLJR8+d4Zqxeo0S0pO+aqn8QDF+eQ5SM60aCnUufZj2ZEsQF9yaF0o2gg7s0+694Zus3wypjL5NAjTG5pCkHMo4BSc21l9vJWw1IdItzopkj3FWcG2XNJjKAJFgcbFtewL9G/Ersn8jpVIauUXcV++OMv6mBPypojWvPmtVE4o4SVAitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwWBdMKvNI5IrW5fE5pYJqlbPqlWyJ/ODQ4A5hF/5gM=;
 b=KkdEoMTGUn6+10nRbuE0F5p8ZsrSRFc46YWgfGvgpdPTYoNJ+zgkS7pN6IGeJpCtiy6q64FrsRKJ5g44K2XrIxFaZWJibWWoMCNCc+LNG5BwJtCeAfVnvg51vbpLEVZjnYUU0Rd8bR0HTv3N2i/aDmztFxQsHk2xM3zJJuBU7BrffuWGiWnD1IgpYKfv4DAIMrew32xybOgA7xoD08OlSuHrsp10URV6KYjVt23sXT1cLyXGCWUb29ARZuntJFs7aAWp0yGtQf4u5z5erE7bVCqwJT3uhsudgpDzYZTCcsLsMqVweaNaN6mfg9UZMKyflw7zaNptn5+YhmZFsE/dtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10596.eurprd04.prod.outlook.com (2603:10a6:800:278::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:31:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:31:03 +0000
Date: Tue, 1 Sep 2026 14:30:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: otg: fix invalid role name print when no
 current role
Message-ID: <apcn76jpNlMfaSe_@SMW015318>
References: <20260901060150.1667914-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901060150.1667914-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: CY8PR19CA0029.namprd19.prod.outlook.com
 (2603:10b6:930:6::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10596:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bca16f-5786-44a1-b50d-08df085f8f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	usNg0iepdfrEL75no2J6C7l0QSM5eVcmjVRZRBALqVTB71UA8ID9fM/I4yvNLeviGuY8h1aopxkdM56txTnKv18kAkJod5SnzKIeDo9BTL7pr0SkrniwJ9LFPfb9AfDEW2hn2aTKqrqNiR6G43ztr6e1HjuDS+sLeax7/JI7b8jGdum+gE3ORI69+xRg+lBayNVA7FHribXwymMXAX/IadoLlm+NXLzkP4MXRYwNWds5qfWpJsep6a1oTFyfMftSqAos6cNQgcrLXuwUmsKzEtIBpgw0XmDDHGcRO0j4Do5QnBcKKFblWtM4NssP2tF6Wns+HqcLJHSwakMKKO4WdMrWq0pt8AtmjFJt4fWOro6rHGx69y1dbEa7CMzqRg+kyXWbstk4DI/JXuRf06AULUHmnfozh2Q/TPSyfr/+w33ooRPl0243cM8qfIFuTZF3romn4i3aeoWra0qJqqz2QVImt08fx9GBT43/o7wfujbkyLBdJ/p98T0fH38h/q2NSK6Rqe/V0e7zt6WSTcoJx84A7Wmn4/euh30f3eB8WfwESOLgCsOx29FrZvpHkcbqT6J5UL86mmNLJC8BuGrUAXvS/bBXxOBr/WS3YJGKlkBJ+NxTpbwi8prSas61hQ0ZT1j1A3+3oDOIC/iuo6NANQS9WWhIchrFuOdiJ0CfMyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?caVjo3R8jER251S7kgQglj2FcYr29vJO+leC5mX49HKFBo2oJTl3Owjk3WR7?=
 =?us-ascii?Q?ss08Vq95/9g9WLp7xJZ8Z8lhNAwpURjCLLB5ac8cpLSEKWdyOeO2ADN0uwwN?=
 =?us-ascii?Q?X9qEU5NodyctD4LYuT1Y5qZ4jpD0s0E3aoG8kBbgP3TRTOdJrD9Q6EeV5vO6?=
 =?us-ascii?Q?mHWgu4SFg9o2txFOkCGmrVqwt5GeXhkGyNYMG3h62OZqn7dD3IFP376C+2qU?=
 =?us-ascii?Q?bcXgcgZ4Tk4oOzNjwyIdIqF5S8piow1K/Su+QEDEECvDdZpYTW3Yn28KSaar?=
 =?us-ascii?Q?Vh1/fdb1/qhx0Rn9j04MHyzNIQ14ApwC++rQdb1dPFTCEkd1xvg/QEpQZ/0X?=
 =?us-ascii?Q?pobLpRO4Exm9+11WEKZlvzd/vKVeY9rPkXlzdZBskkrNFLna0P07i9qzbRO+?=
 =?us-ascii?Q?6AiO7EICRePCBVFjoo3yua5BtXNGlWWGBODuxuPtOMboLk9d92ml2dbpVYGn?=
 =?us-ascii?Q?2Nkhc/imry5Al8rWIe0NV35uvSX3bOgA5fXTL035XhwnwgxQpSR7feQ5TzBY?=
 =?us-ascii?Q?T7nzVe3+ov6EtevBqJ+dHTk8rfUrAcSmv7kfj9yrYrtaR+v+VWw6MrQ7kcXt?=
 =?us-ascii?Q?4htCKXNHDRcEl0t2/UibHr9sDeYNbEUF3VjCvXelRPW727Iy7a0hqmc9CPnJ?=
 =?us-ascii?Q?z7rZrQDRP+l4cIRytBgVZHGlXfvfCwrOb2VX5yZAL+gID26mbI/bM/PvZETI?=
 =?us-ascii?Q?UM+x8hvu3WsxLFs4N0vZ1/cwpV3gm2R1iYisD77K3okWCmBG4DwL3LWYnGtU?=
 =?us-ascii?Q?C5tSDm8CqCzwiBBkgI91aYZb58NJVjovqx1isPmm9B5EdSLZB/y0bOlgHYao?=
 =?us-ascii?Q?eWaDie4SZTqZM6bavliOU8bo1LldVJ5sPDDr+TQuqLi6Ae9VkeQ6nT1JxK1o?=
 =?us-ascii?Q?z9kiVDtc1GdDVr6tvDugfOvkgLF8CO7vwJiwNffQE3XXx4BBupU/6JRYr3Z7?=
 =?us-ascii?Q?8r47wgJo+xqNF2+TzvdxzwpdePTD6ND7sE5nQgEuaTgbQWFuUDDfmXdfddVX?=
 =?us-ascii?Q?DxKkA/3Rvutnpk7V4HT3kNqdGnKZF4oFUQINJVEQr0pQy182rF6ld0xi5x08?=
 =?us-ascii?Q?eVs8L865mCZ2BoH5xNF8yULKEyf4EnJgJZAMkHw/IMP7C9k3hTiGjfLzuZK6?=
 =?us-ascii?Q?K3IJjTpIdmNZRfXR7glA7PeIX7lN/5lMu48g2ZI4AYYNmWC+a4OZlOJDtlSD?=
 =?us-ascii?Q?5hZjChBOsfkAUkcgo73jtj5YjMILS077YiqX+ALr+3LEJf3BkOv1d0JgIDDS?=
 =?us-ascii?Q?ZSc9ArpLXgfXZlK+29zzXXEKpm1kWRmmoNW7JcXsmC1JwW9fI3vDnYjekrSm?=
 =?us-ascii?Q?GQixy0r9rw3RrqhmYHUkLiRTIBMmLjis4GyxIgrUC7JKCl2F3d6T6twtEXfm?=
 =?us-ascii?Q?IyCQQK10Ou1xWSib6ULhd/mV8tHfyCP7984AEOyRZq+WW8Q49THTx8Jyyv+R?=
 =?us-ascii?Q?nSMCVfsbL7+MLUFPa5aNAyzfrCy3+J+5in82t79fkZvzMBWVqIssiCDqbG7f?=
 =?us-ascii?Q?ti6148lC0LuXgetotv2lz/PPS1W1JWyfLZFxg2bmqO0W0Zo+MspZhn9RmTsb?=
 =?us-ascii?Q?8x5zMjeobMEp1o9I+VQxJuwlx4nYpA9NY2p6R3szi2G4MqUOPJSJzRxujrH+?=
 =?us-ascii?Q?iNuTpRnbXJjdC+eB9UHIQ0iFm1HbnoSPnK4PMupI50r7yPV7/Gn4EFunyUaX?=
 =?us-ascii?Q?zbgSzBTHCRVjnnz/sCZl/gYoImwovDzEzP1Ax1pWeCxrpzvLabr2wb7x1Yok?=
 =?us-ascii?Q?iViT7mgqVQMopefKjF7NO4mFGPNf/AY8qwVcfndTdGniTljb/D7H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bca16f-5786-44a1-b50d-08df085f8f86
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:31:03.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ+W5bGenNZg9eIPDfH7ZDYeCZTYSw8Z1pcnt4OY1gvu6YR9SuXREpt/SCsRuis06dHdA6gsgIhwIDa3nhG+/aGzMnbCRJbGJ263ZwhB/eiBMs0Ym61NoIFaaZ6jRSxh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10596

On Tue, Sep 01, 2026 at 02:01:50PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> ci_handle_id_switch() prints the role transition via ci_role(ci)->name
> for the current role, but when ci->role is CI_ROLE_END (no role
> assigned yet), ci_role(ci) call BUG_ON() and return ci->roles[CI_ROLE_END]
> which is NULL, causing a NULL pointer dereference in the debug print.

This should be out of boundery access,

struct ci_role_driver           *roles[CI_ROLE_END];

ci->roles[CI_ROLE_END] to access next field,
        enum ci_role                    role;
        bool                            is_otg;

NULL should be "luck" value.

>
> This can happen if ci_role_start() fails during a role switch, since
> ci_role_stop() has already set ci->role to CI_ROLE_END.
>
> Fix it by printing "none" instead of dereferencing ci_role(ci)->name
> when ci->role is CI_ROLE_END.
>
> Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/otg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index fecc7d7e2f0d..457417e81b78 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -179,7 +179,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
>  	role = ci_otg_role(ci);
>  	if (role != ci->role) {
>  		dev_dbg(ci->dev, "switching from %s to %s\n",
> -			ci_role(ci)->name, ci->roles[role]->name);
> +			ci->role == CI_ROLE_END ? "none" : ci_role(ci)->name,
> +			ci->roles[role]->name);

This is out of boundery check

	ci->role >= CI_ROLE_END  or ci-role < CI_ROLE_END, and revert :

Frank

>
>  		if (ci->vbus_active && ci->role == CI_ROLE_GADGET)
>  			/*
> --
> 2.34.1
>
>
