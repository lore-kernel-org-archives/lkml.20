Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630157;
	b=5cZQSFHnG7rpBnhfOOwmMJkGh8ItS+hRMdjaNg1q/p9DekGJKa3ZEiJxUjfJmpcAzQZA
	 5KS64mbRpQL0PooFhGCZhE4g5++ofhFbaCtoxjxdRov6E7DDlxZjmuBlw+KQZxkn6B7Ko
	 UfS7VmE/KbVBVMp26kzmi+rxVvhQWC7Kbg4AyCuGu6DeNhJvVVy88VNdwwzQFI6Pt7FlK
	 uKWjJzccRukUkSNUxfcWDBqe0eOFx2OLB8OWJpLlcSjfUovNUJpfMZwiVqiCN6D5gjaZH
	 DMUU7dm4yeStmheSRNKakKOwBkaA8DtUsswHwrER/nCuzb7T9+vo4s6Jam10Nl4VD6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630157;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=k6JsvlO+FTrnVdxlZVAHXXOTiOSZX6Rcee9TJ1sZOQ0=;
	b=c+2Zh7O0t62ttJRxiSaMOfSsr6A9oFQ8KweWFf655vn/BASP1TmJh5jruAk1LJrN2XM+
	 Dm5VH3lDObZ0uyVdrikgmLexqm0t63Rn83ho3+eX5iTw7uwUbcb9lvrAbPYyYhUn9al4s
	 HdNtyqsWE+WdLGO3c3IAQSguO4sS4DK/DIDncQCpLXo9lA9jGIcgWvQ6pSn6DGqqZHWN/
	 GX3KtpsxmK6+ZbX38OekBppbENeD4SYe1fEPja/aYejSAMKZWgoJGNBXmAT2lKXIiEMCZ
	 MwTPW+AwLh0WbJl1lmSN9PIDVe0br3WunQKYbUnmyHi4KpLCtEN1l1nElH9/4CPxf5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wPYPXebE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.61
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E28606D808;
	Mon,  2 Nov 2026 14:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E28606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wPYPXebE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgfZkSKYQG+iEeUluR2PFej0iJH+a6lmpaBQOPqpFeyy8ovaUPeW2EO1D2FK9YR8FcljPXSBzxzdMJ86XmaMhEKGWtocFQv1HEh0TzY1W3e++1eyogOEJKMjVC2AD4R8X6WAx5l6g1yR/yojhkEh8HN5pRBZA3709mABcXaKl9+kmyWtMxGzuxm3NoqM5pCWPETjOfeqae7dVeAo12wcuNf99lpgRxZntI0k0yoMBrAoEXKbnc4x2m7DubYxSWsyirpe/F88zYcBgbBX/lHZg9VlQpAkP7Di/myEYrOFSdROiZdeEao2cUlnWBfq9pJce2iWq/KcV8guQ+zn2d0A9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6JsvlO+FTrnVdxlZVAHXXOTiOSZX6Rcee9TJ1sZOQ0=;
 b=uDVgWX8784Ugn+bxv0EoHQe2lMLyEPT3rkqPU6va/2/WYzQZnPbANaZsJL7JNw4uTvlIU0PWYOwr5UBtfSur2fCIVz3002xFlIxBZNf1gpnvhH/RUITN4Xx0DRsTmy0sD4zcUJc/7/+5vzzCL1b2HipFl8D5+kx8j8ePUt9UCusVP9p9Lu4vFhah8onIcSvprV6qlKd/Uj7S86oy/RcQkOh0tKfRDSspx0B8K/p7+w0yzOVSGYNRZ3pG1N0wsP0DlEPRzkIffJlOzc5HG5ohZj781Wr0dZNm/9E6umsc2zqTeJQfxeJce6MQL+8pLpBrs5qQLPxsWdDdf9BSmCmZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6JsvlO+FTrnVdxlZVAHXXOTiOSZX6Rcee9TJ1sZOQ0=;
 b=wPYPXebEm67BiTTpmc01nHBJzibtdbmuvBJg37BVJ3zsPbkgn7x9Rx1VBxDEL26RkFFma2AiqEZTOwpEuRozByHL+HX6j+oCvkPlN2eCF1hxgDJ79nZe0BJ1/ZuxJgwEY6Ii3VTgkg6woCeeQsjLtb9UOuHBZNDVJZjfYdYMppM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TY7PR01MB14494.jpnprd01.prod.outlook.com
 (2603:1096:405:244::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:35:53 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:35:53 +0000
Date: Mon, 2 Nov 2026 15:35:38 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Peter Rosin <peda@lysator.liu.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Restore RZ/V2H(P) USB2PHY reset and VBENCTL mux
 state on resume
Message-ID: <auifuiRYEb69Q3rZ@tom-desktop>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TY7PR01MB14494:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef77f7a-e469-4fba-75c9-08df38ee9927
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|261021123027099003|38350700014|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MX9Bngy8NUJcfNwi1NQvvuSoUXCJEl1ZaPiomaUfe2qZn38+Zy5FWqv4QyJNL4ndYnsoBVsfc/qf8cJwLH9XT66zM/cCME1msf/rOqEjI9xn/IMd+mJ6IsVT1i/0nTzaGz12VbNyZX+SCseku+wpFmSfqa0XHh4mmPrWcKkp4tzaBdDgtaZqcfUDGzZagAU6PBCtdYwZtxqdUtDJkIoFiTBYBGKNshn6QGoR8J5fJtRYoG2Baf1gQ52NYF+I5/rWHPtb/Zxu42yZI0GRNAsKpNkfQ5sUK3u5zQKsWdUMYeZTZW33hVFC37MNREYjHbySYJtC9qfkIg24UAwQ0gDlczPHBWY38BaYDhzVWDm02BEsfQXRAFWU20Vz7QzKOD8F57XEan4GAK5NEJL4s7Xu3EiamYoGuhaVhLoQiEppsAlL8d6FLaXgO+JddiyJV9L0hfbvapmS+Wr2j6LwlZcnjJAUrVFwWmaSHDpgjPeWIviBgJmRQcxaS+f9N2DdD3dd97LqWTAfCVXS2HF+OpxWohPHZGLAb6/a41nzs67oACTVdsizvMvlvhrG12OXEutFE4mq2H36CGuKQh1EStGE0yRytDZpir2dJInu0rHSinLl/WflGab3ZMS7/ieVkE1irofHYFKC8P8hZaD/Z7iy4a9APaf5LAcnaUVOYwyWuiXJhJURnKuZMHrHe6OlZvi1w6o3xyuZ3a/uY1dkHqvS1ExUvRj2NQA/zcLzg3BI90c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(261021123027099003)(38350700014)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQxI02fz0vV12UgLF9ckHoROrXfmhUUIfhQZ+klXvaaIa4lfOmesGQBRXP91?=
 =?us-ascii?Q?xpF1ReGejbjojHX0DvwkQSOPUHx5WMX7CZLn/k6hq8mVoh0ap4qi5TJBth/D?=
 =?us-ascii?Q?RJ6Z18RHXJ4iSHyzq/EGkPOo5bUB9GwArr9mmZndua7llzfnfcQruCvNL5TU?=
 =?us-ascii?Q?aNT0TpIMDzMMiPg7/Ea8O/G97BhVTnLiITN2uK8ldxudQ59acCDnDVvaU/8t?=
 =?us-ascii?Q?836OTWPbeC3B5qzTizhffxjcemluPN0aL7aapNH+lvjv0KO/YrbTY7q/feb0?=
 =?us-ascii?Q?euuiuHQyJGcYhMCROw3Ew0dq75mvuuyQZYdg6ErXJsafJWB4/fETK/j5y7++?=
 =?us-ascii?Q?VJfr2aewwe9+46piX0AVY/F11QmHt3j9pbRHQOdyjJkfap2NKHaMIceUGMgU?=
 =?us-ascii?Q?DnyA+FdR/mRieGmPHPptSpLPMtTvSqnqRmmSLnU5IGbDdeFw/fPB+ZkKXmOl?=
 =?us-ascii?Q?WfkLeOnY78M5tEQkOK3775cENsGTQyY8gF25feGyJLt4EbOL2veZ2jPq9oOc?=
 =?us-ascii?Q?o3HisRZFkneXrsNUlE74ITWZE1GUP+IhnCUpbDBrKqcnNZJYyu17LWIQH60g?=
 =?us-ascii?Q?91wHkTpdD7sLr7FmnfKzTABxMyoaj1XskQ9YoDtxA27m7B/98FakyU6GGH1s?=
 =?us-ascii?Q?LvkhNC3mfXkR1Go/PgJiuQBK9JTXWqvjQg1EnyO1wFkBfNlR4kyHKaAUS6DI?=
 =?us-ascii?Q?vGSy7XbWSABgYMaG0tusETI6+K56zCtN8S5VCfQ3II+Vg1jNne7iWCmeXOEg?=
 =?us-ascii?Q?/wSQeNYu4bdTKDvS5pxph9TMRihydRma7bquCKDZtLCEFPWjzEYRNdQpo0UD?=
 =?us-ascii?Q?ZSgbf9nQMU5Jj7RMw6WJT1xumDZw+zAJXWaETzbt6Fc46pVNnK5TCY8NlNvR?=
 =?us-ascii?Q?u47b1ejt30YCV9yQiYzZnq0xCGpCw+bBscEheMntAIOLyMSKfylbF4qULErd?=
 =?us-ascii?Q?RL9nREt1M16uYFxrClC+cI64ddUMl0GsgkVMzWdl4Rzci7T6NkV5ITVKuUje?=
 =?us-ascii?Q?jjnwqbWK8TFIjPc1cD65yZXMCKUot4TWjdQlm4FfK/zKpgCdTaDvt+7Ry5bT?=
 =?us-ascii?Q?ujEyQNhi6Xz4mb01hO7SrDq1mX5kQJ/W2g4yOSpfqK0FzEsU6j8pOzyg+Zm6?=
 =?us-ascii?Q?Yz4MP79MYACALGOQUNmGz55MfgYPzQNDi+0gdnpyFuiQs/VYYRHvxkUbHp6F?=
 =?us-ascii?Q?/HstcbH4FhVXHjbbV1lp0EDiK3j6TM2uqBl1t8XGSnpX16d8rHfqOUjg6SgE?=
 =?us-ascii?Q?38SC1yPw5w4sg4f8c4gcb53odWevM4MFUhPpoTgWxCUmhR/hFmhTO7rcSEs1?=
 =?us-ascii?Q?t0bwNDq8Btv/MiXZr9US3PzLOl0Y8eZJD6DhPA5vZvlIBGtjJapD5geLSKl1?=
 =?us-ascii?Q?OEgMKAO5cgS6xAw8xe7uuBaQRT7c5fQpCkPQimN/vxkas8WEkrV+qjysQF+0?=
 =?us-ascii?Q?X65myjLVxyUb9zAjhiz5iykzhkGWzd8ZnlAOfgotjgbpy3srRteNXBAhUuNx?=
 =?us-ascii?Q?KxLp0kgsgojGNtTi8RWIuvyRrzRPjW/0GbQNxe6oNItkXlnC4JqErpISseXs?=
 =?us-ascii?Q?gEZLYT0RZkC3nyrNy2bRC9D4vuA53w4Xdsg4d9zaBdbjV6MPZkKscQmddypS?=
 =?us-ascii?Q?2HvO5+qgiWFFEu6aYyF9RAFvX3YeTG4UlhGNtDOG6ltwqzXiUR4O3GcW6ARr?=
 =?us-ascii?Q?+wEKBi20CEQehLYTOwfPjjy3Uvm2boHLqeZwUIgr1adlUYCAT+drmarLJsg6?=
 =?us-ascii?Q?fdv9hXPbqyXKuspJ40/5LF3vaPPwAqI1dkqsUaPo0Tk+05zRxDPY?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef77f7a-e469-4fba-75c9-08df38ee9927
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:35:53.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLUF5NGMJ0MB4d2H/wIuIr8fmc1LlZNA/odarY5mo9svrTGTwqHTY/Q5wsPtRdqJGBmaODA7486OHlFM7jnAxbj6DA1XhTJx+SVlFBR0me1YJdtGAJVHWpYa46CLlPQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14494

Hi,

Gentle ping on this one.

Kind regards,
Tommaso

On Thu, Oct 08, 2026 at 09:44:45AM +0200, Tommaso Merciai wrote:
> Hi,
> 
> This series adds suspend/resume support to the RZ/V2H(P) USB2PHY reset and
> VBENCTL mux drivers.
> 
> Thanks,
> Tommaso
> 
> Tommaso Merciai (2):
>   reset: rzv2h-usb2phy: Add suspend/resume support
>   mux: rzv2h-vbenctl: Add suspend and resume support
> 
>  drivers/mux/rzv2h-vbenctl.c         | 24 ++++++++++++
>  drivers/reset/reset-rzv2h-usb2phy.c | 61 +++++++++++++++++++++++++++--
>  2 files changed, 81 insertions(+), 4 deletions(-)
> 
> -- 
> 2.54.0
> 
