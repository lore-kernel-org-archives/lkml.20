Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794848055;
	b=mQ4Sut57E/ZBKfP7JG9T1VDpgYWWYPy9jtP0I7/Ld+olv2oWqvd/R2eE+i4nEJ7th0mB
	 2RMvNzjRnydCWaYF/ZOiAjH6InQVvIqgxMaepQb3ogMiTkMQC92191eK6TctDHjVh9DhN
	 7VHMzLTzCvG7ZFCTUZhzncOvSkqQKYhLvY2NM7ZwyE0Hgr/zT5E7jK0J2A5KgS4ZzGGg0
	 AaxwgNlFDuAGRnM7Hv9Ny0xMGqRW9u0wSBcB0q0VOqvI9mgQYbPtOY3FNrPRadZzBgpya
	 jZ2uj6Cyhv3NzVOitlJ+biC5JGrP+07TJE2lltLO5gyTuLOVhwc8ivxUd4K5CPJnaew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848055;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=xSrVfB9D5irp0CfUCRWxc9PFSLvScyMJMovECZufq0U=;
	b=4/jzL+VuomQhKtQWLZpMIjxBXA+CZP5Jpn6l3APa5quGH5O7hzO8HR5VCBmIg4Hl/9ZN
	 nvqC8KANSm0sis2nCgaD4JKbz8VRWC2PbYTrYLIA+mBT8m33XkQN/y7Puum3EJtPXvmDl
	 Bn+Bjpgd1IQGS57umnfnjq+zDKf8f9g6Im7FQGRI+O0NA812fhtndE/vHfU/+HiOBRz49
	 vK7FGotDVbsfp91QusrFWWMfwW0l2OCdQsqTWCGcTTdcDjmZTkW6JVVxNONXrYVCYI7jh
	 mfZ9POYgAbo+JWPjr/uHU30VlVz+aSNC1b/5qz9pEG2/B0jNOt7LqdP8wK+TXDVONGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ejDtPRXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B9606A323;
	Mon, 16 Nov 2026 16:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ejDtPRXR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccEHPgmX9K1sijWRySKB6W1F8utc/5pd2JG+CdEbiL+UIS/MhNwhv9/H4rvz/WGDNZxRAYiSlGNcSxvLbFgkGzESot8vSRXVYzy6nSpgwrFXpitx1oHJxS7x2M+iGnNH4Fu6d8KQIQMQZ7ADf59Yep1BT5uYcl5NobOc3aYLOYeVPD+1i1BO2Xzk8sO5h77GTbYvNgozelKTfSv6hKz9LMU50iR7TxImFvJ82ZBQoGztH5wWew779PKk9adUsHtNpCFWaHMqD6NwedYbYX3+2YpAVGyjSTQ4ubNQFF2n3TYihF9HeAOGzt9cppO7uHbiH4wDxVPfrUvdlAxzfbx2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSrVfB9D5irp0CfUCRWxc9PFSLvScyMJMovECZufq0U=;
 b=S0etp19UQmStXpvLoFGugkIMWZ2CK/Ds8IuZA9MzJkscz3XBkLh0PkwdM7kW99s5OvKO3VZX2GXxeucjwBnsPRF9Lmqt0USVGy4gozGkp5PXLdWmKixBMuqfwxcACv7jeC/sboB2u4SZ2Zt1SSEeiHqLabwoY8LFDHCfiJ1iSk5Wn06PKQBLtXW0RlvCwzcMCxN4Y48SEE3jtg7kqeYPkbA+5qLdhtIzIMT7+zL+km4pFsphxLp3f37OpQfArOnXNnLcQLF39SnThh1M9pw63hIT1RlUuy5sY3A/UGszcqfjOZivYA9paTghZTANmxpAwLpYqY1kj69JwXfvP4wwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSrVfB9D5irp0CfUCRWxc9PFSLvScyMJMovECZufq0U=;
 b=ejDtPRXR7h3/fXUZPATJsNWlaShjhAsHss/mSbzm1QU9UwCriQ1XQ02+nYbC1/FLLYP7In8eCzEF9CTPTsuFI5kLgLgEhvUw0P1hVh8lIW+9Iso0t34J6kR+Vm2F9u2JW5GDms0cHwzKW0lr4fnorTcKiILzf1cyU382A3LXuy5wahf+QMdrfkgcXfxa3s1lw6BJqjBzVvj3JSjDeSeEU1zpgZqoapLkYMeujEn3pf/SL6cmG4Sj1yT2abnoNB0mzT4h/o5yq9MMjKEzN+lSFSozpCKmESOUr8iYMS9ZDYroprW5CWUNgI0WsiPxOPY3BtwSeTZwXZGfoocLc//9jQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 16:54:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:54:09 +0000
Date: Mon, 16 Nov 2026 10:53:57 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/11] media: imx8-isi: Exclude RAW10/12/14 output
 formats on i.MX95
Message-ID: <avs1JcPW9mtX1k0A@SMW015318>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
 <20261116-isi_imx952-v5-8-46de1d24efd4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-isi_imx952-v5-8-46de1d24efd4@oss.nxp.com>
X-ClientProxiedBy: PH8PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 828be0f7-8ffa-4f89-3cdf-08df44023b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|10067099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	v8N27usmRqNorMRbgVtihTbKfgO4KTUO6YFC0UdSgabcF45yqrAdK5UNDDn77UK+DnMQEmvCMX6LVD85Jb9m4l1Z3rjdE7y/oEzlyLEmdH2m3BAqqwuiSLkX+81bFOX//8MDj5/Nh75DWYoS32ro/HWzdigr6ynAyWWveIsiIro3MVkx4dSnZhUfwwLgl7tbz03iCG/6ZUiGqW86bsqsL6CXVHRjWkxZgOwlrhCENlXmaBIprqqI5P/xMpTrnDlQD3cXsoYqNG+1fA/h2K/9B4Q1sTa5YWDszejheD+Em0K8zCIv4XWb9Bb4xrjcaqevf3pCd1EBXRNVD2SgoFwGSZ1ULvVyEEBaRRULK+det2ZH7iwHXEx3bGkDgDXYgi5JtpQON7nuCK4TK0ou+kIut3bGoy6tye2qglKSpXHSvxiYY8vDwj5UKuzozX4+dHZSIXUh4InoIIlcL5kUCxAQ9ZuAt8Wg9j8Q4C5/hVkxnH4Buptj+BwxUhLQzZVcf67e16mYZdqNJjAtRQ+FviYXrjT6IUL+Li8tLGB6twmbNRUX7HDhRa5asumsZWkdhQB4ncYgDDBL6sVWAYIVpQH/VHRvYFTjq6MP+5ODJqKjL7979VyC5caWSDBcXekQBxFa2eU6iqGMRdbhyvJ+07OqzSwQnnobuqCUFs83MpE7Jc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5u2E5xs4+BQd+FkwzVFB/XvJQCxnKRS7r50afidNxi5Vm8tUtVn1GzluiTL+?=
 =?us-ascii?Q?qerYTOlnPVN3uRoN4IEqB6gQu7nqNUFBdsYeGm1+J7wzgn6MZXea7x+Ody2i?=
 =?us-ascii?Q?AQM+TlgVJrucsxGBTX3pmcT7ai6lbyLsvWiWBiiTVM0cEUCoh736yA3w5AKE?=
 =?us-ascii?Q?xjFfLvHLxAvxYr9v3YREHwSYI79Ji5m2XTNVflrwei/z5BKrqCY/4Ar6UTYd?=
 =?us-ascii?Q?CGbSR8dY7Mg4q3vjKcUxTN1VjPB5Go9yqxzd7tUkq99StutOFdXOujVs0YLt?=
 =?us-ascii?Q?9Y1s/6n+f30kA0k0CVYhk859ELdquA6V5bLpMWbnLqrHQJcsXj845IvbLVQQ?=
 =?us-ascii?Q?Zs5axZcmxvUHcQQmDmBg7oFX9t+lXJL5AHPfSgcGa3tmDRvxUCnjA5i4nAvg?=
 =?us-ascii?Q?QQfMCJTP30awCdqn+8GkkPcEHO22+RRP9g3Fxl27kGfm83mgoyqy6rEx924c?=
 =?us-ascii?Q?PQ6AXPGI8Es7RWRFYHudJMCuVLLihIx1Ob05onJInAFpXF7mu1VF8qDkyTn0?=
 =?us-ascii?Q?m2bLAx47ZrCtHB3cAOLByKa4v1eokIh446llwiNbSz78vdKvF79N/Q8d20fC?=
 =?us-ascii?Q?HCkJCMdmfAb7mV0ch8KTQPoPjxhH9eTJUunLbLnn0ImTUkIge0HM1BalCAVU?=
 =?us-ascii?Q?65RpXS478YgCDnMvJhGtlE1pOxHgNoTVhWcl5m7A/zYx9Go28l82FkOZMPUq?=
 =?us-ascii?Q?6wEqcpSRtOqU9iOkDpkhFAKe9ubsI1wBWhmXnPkEy02FX9156bJZBNl31hkc?=
 =?us-ascii?Q?0jcFHemqxDHu8EtmMlAsnO+I4BnJqjSWm1xouTBY/aVTBQDUKgNPxTlQYG8t?=
 =?us-ascii?Q?j2s0wkS5J3BB7yPelPQ/VF+3yEMkWouSmLgN3z0TGwSJzi9aUxyA90GjjWux?=
 =?us-ascii?Q?WdSUHGSrd690c8bHh8M5RzGSaE34xSpvkD9AwLh4UHA3+PfRDgRY/6zUYKAn?=
 =?us-ascii?Q?yf5K4zh81Z/HS+KGycHgmxSRVKzCpgkNv+HJz+1CtClCKFSRofQGIUOqS0Vx?=
 =?us-ascii?Q?GXCarhRTzLVPRrzo0rud/oxKjAIZIgR03spAvwdBDLTqEataLGY11+P70Lqg?=
 =?us-ascii?Q?v/A6Q2kMFQ/9yd25bTD/jnq6qzHLMhV8ELysqluClEw3No1J9NKIdg8GKkNM?=
 =?us-ascii?Q?4eG3SXu/5jppKruXUD1/z24fDZNANQhRAzL8/sOURgNodGLrmXtppLZmh90j?=
 =?us-ascii?Q?Uwu1TjZFqGdBJt43gfZCLV/1TGSzb+DshmNQdfASt1/4l4odvyw5TrdKtLy8?=
 =?us-ascii?Q?fG3ZHo54da6mnHc4fdtJGacxrOcTCZkl84reuyHLaUaAq8b4eWCmr0x6+OYp?=
 =?us-ascii?Q?SjIxHYVg1YZ+zw6e3H7jYZ91CqDbwoKYyQSuPo4dRYnpcj6AECK984MrIT/t?=
 =?us-ascii?Q?xFDZxG1vKQCbMalwlFs4sCs//Z7OScxJA2eDpaTlJWrykJMLypNhHPzbYxSc?=
 =?us-ascii?Q?DLwJCxJd51PjfNWpfLlJd4lw+1fUIjEBfuU1AItjZzxK3rgYj+ghtqC/pFQ1?=
 =?us-ascii?Q?0mOmoBo9N8ao48NnxwxHgy+bIgWGQIp3TYvUxf8lN6uHmihAALHDJVJHvStm?=
 =?us-ascii?Q?2QWq3xf+4nCDdXdJaDPrvXdcpSbu+KqNkUhZBxJqnQw8vrM3H7VScDVfylBz?=
 =?us-ascii?Q?yq1PMRAz5mZnvcpeO7fL/RUJfIyUZgH72Iup38iLfGG+a+EWnPOCytIyjJ8q?=
 =?us-ascii?Q?wArvU2yAutG/jgCBCZeHATJvIhNGc3h0T/zKKT0vcSZj2jz8wXi4IjQUXvN3?=
 =?us-ascii?Q?W1iPFocJUrnpeinA3i+iT6vYgStTHRNGTEnQwI7qSLxkC0m8txIO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828be0f7-8ffa-4f89-3cdf-08df44023b8e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:54:09.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b048nJ34JfGTfbTBGLmBsueYiBVKwvOqkYx0u/9X1RI2fLyXes30yzJ8BxPirYuWBxSMEHDRrToq4iipeqsJTdPyAZ+8+ISbb91uriob3WjV0Ub48Kn84d5yyKG23RDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

On Mon, Nov 16, 2026 at 11:28:26AM +0800, Guoniu Zhou wrote:
> On i.MX95, the CSI formatter provides MSB-aligned RAW data to the ISI
> via the Pixel Link. The RAW16 passthrough that older platforms use to
> produce LSB-aligned output now passes through MSB-aligned data instead,
> so it no longer produces correct V4L2-compatible output. Exclude
> RAW10/12/14 from format enumeration on i.MX95.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - New patch
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  6 ++--
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 10 +++---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 38 ++++++++++++++++++----
>  4 files changed, 42 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index a30633a7e2e9..ba0d6df98fd4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -320,9 +320,11 @@ mxc_isi_bus_format_by_code(u32 code, unsigned int pad);
>  const struct mxc_isi_bus_format_info *
>  mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
> +mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
> +			 enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
> +mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
> +		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
>  		   enum mxc_isi_video_type type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 1178947bb548..1ad0fd1af3b1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
>  	const struct mxc_isi_format_info *info;
>
> -	info = mxc_isi_format_enum(f, type);
> +	info = mxc_isi_format_enum(NULL, f, type);
>  	if (!info)
>  		return -EINVAL;
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 35438abf3172..b83a25a58ebe 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -425,11 +425,11 @@
>  #define CHNL_IN_BUF_XTND_ADDR					0x00b8
>
>  /*
> - * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
> - * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
> - * to align the bits to the left and pad with zeros in the LSBs. The
> - * corresponding V4L2 formats are however right-aligned, so
> - * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
> + * The ISI shifts the 10/12/14-bit RAW formats left to MSB-align the output.
> + * On platforms where the Pixel Link provides LSB-aligned data, the RAW16
> + * passthrough must be used instead to preserve LSB alignment. On platforms
> + * where the Pixel Link provides MSB-aligned data (i.MX95), these formats
> + * cannot produce correct V4L2-compatible output and must be excluded.
>   */
>  static inline bool isi_out_raw_shifted(u32 format)
>  {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index ca8fe8782af8..708aa4c775c7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -458,14 +458,32 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	}
>  };
>
> +/*
> + * On i.MX95, the Pixel Link provides MSB-aligned RAW data, so neither the
> + * RAW16 passthrough nor the native RAW10/12/14 output formats can produce
> + * correct V4L2-compatible LSB-aligned output. Exclude these formats.
> + */
> +static bool
> +mxc_isi_format_is_raw_unsupported(const struct mxc_isi_plat_data *pdata,
> +				  const struct mxc_isi_format_info *fmt)
> +{
> +	return pdata && pdata->model == MXC_ISI_IMX95 &&
> +	       isi_out_raw_shifted(fmt->isi_out_format);
> +}
> +
>  const struct mxc_isi_format_info *
> -mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
> +mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
> +			 enum mxc_isi_video_type type)
>  {
>  	unsigned int i;
>
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>
> +		/* Skip formats unsupported by the platform. */
> +		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
> +			continue;
> +
>  		if (fmt->fourcc == fourcc && fmt->type & type)
>  			return fmt;
>  	}
> @@ -474,7 +492,8 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
>  }
>
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
> +mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
> +		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  {
>  	unsigned int index = f->index;
>  	unsigned int i;
> @@ -482,6 +501,10 @@ mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>
> +		/* Skip formats unsupported by the platform. */
> +		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
> +			continue;
> +
>  		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
>  			continue;
>
> @@ -509,7 +532,7 @@ mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix
>  		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
>  		  : MXC_ISI_MAX_WIDTH_CHAINED;
>
> -	fmt = mxc_isi_format_by_fourcc(pix->pixelformat, type);
> +	fmt = mxc_isi_format_by_fourcc(pipe->isi->pdata, pix->pixelformat, type);
>  	if (!fmt)
>  		fmt = &mxc_isi_formats[0];
>
> @@ -803,7 +826,8 @@ static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
>
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
> +	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
> +					video->pix.pixelformat,
>  					MXC_ISI_VIDEO_CAP);
>  	format = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
>
> @@ -1222,9 +1246,10 @@ static int mxc_isi_video_querycap(struct file *file, void *priv,
>  static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
>  				  struct v4l2_fmtdesc *f)
>  {
> +	struct mxc_isi_video *video = video_drvdata(file);
>  	const struct mxc_isi_format_info *fmt;
>
> -	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
> +	fmt = mxc_isi_format_enum(video->pipe->isi->pdata, f, MXC_ISI_VIDEO_CAP);
>  	if (!fmt)
>  		return -EINVAL;
>
> @@ -1281,7 +1306,8 @@ static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
>  	if (fsize->index)
>  		return -EINVAL;
>
> -	info = mxc_isi_format_by_fourcc(fsize->pixel_format, MXC_ISI_VIDEO_CAP);
> +	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
> +					fsize->pixel_format, MXC_ISI_VIDEO_CAP);
>  	if (!info)
>  		return -EINVAL;
>
>
> --
> 2.34.1
>
>
