Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632341D11C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990931; cv=fail; b=CuxMJo1OQEb6NnYwG8eZLSd79wqsVMdRAGtoPHsBqN+Sve2TwZO/5mjxat/j/eXDjW/2msWZk0KsvJ/9fjKeOWgaeWLHSnrKCTp0aHe3dbd5JqVCIK3WRyQ54ZF+/onjaWey6gsTbid63poeL5f77/Cs7DRDFFJv0wi0rFrzeyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990931; c=relaxed/simple;
	bh=B46WAte2ooP0nXglX4QpAX/q8qkZG1vxgLbz4JJe+tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hHYDksukY76jRCEJqJu4T5xNe56G9Om3WEqgQ8GXyZ27hcGDYxaN2w/ZnJTlU5v7h80eh+UqwLcQ8n7/1yY7dK15n6YXZkl9Tmu2Xw6R97xXVGc4fOozZXUiii75xtlzpv/+wk/VrhynQkCNs0mjR7iFX2EQOIlf8YipBL3weOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TOfrBzHd; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TOfrBzHd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esMHpvuNYNN+0y5TPzCbKkNp3QMVH2jwJVU29GO0PEMAggSL5B99A9bxAB/mLwURJrtBwqms75ejt9DAHBGchjaVFOVYImH1E5rv2mS9cxzxlCR7XphO4F7WVIgMdi5+pCnDNdUjAGfoHXKTqrYwkzqo1idqpA/MNrI/nq3ClnbWkhxOiqEUxiRd963UqIDL6xmElDxl2oJtIe4gsnKCyhbRTmkxoUjAzlHZ4dRv95amlJAykut4Afma22bFvxxKVvdU7BuuUSMpVOPq8fQwMBtof+HfvvL2TuZV9UjmqkM/bwal9Spwogr2VhOd/2EB3D1VwIaKccZMD1+Mgtmj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq7ZSwOaUTGiU16nuWNax1u5Ehg5D2/UyxBZyh/g1c0=;
 b=p5Ovb6WoZEBGx8J4Ub7tOGIdPh3lcieJw0XXuvsYnDBfj4S87PiA/Bh6pyg1iANJ74b2xNl9aUXQGd+MqtOmCbgCWGVs8aGPi7I1+EF1YbBSzKt+vp6ggu/R1NNiKFrfjhILlNhjmgtZOsLLHJdUbWEy3Zcmr3SQOAAwP81ONLj2zpsZrFDO33W3jHJZ+mV5jbkJhcVQqNqq+ds/sPMs3fswNzt6anMhh2uMcjUgRnjzH05ib330I5aRtSU50FgNwhbsIXMtDs9hzCEiTe+8OIyv1e3YPoOBXJgNK4FAICZM16FAS1HxmFNlgLeHjtRESpbSoHEaupgqIt+jIOUo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq7ZSwOaUTGiU16nuWNax1u5Ehg5D2/UyxBZyh/g1c0=;
 b=TOfrBzHdNdaqake0VCj1UDCFfvwvfConQei9au0G1FT6P5rcDYVYGH8RN9sOQcgb4mssiMuohlr1/ZAJ96LGkDOszoWCsa89Pc7adGPMUnGczY1+WP9FMT00pwxsDbuFDU0ScjH6bwdb8phfPHWVTWFj3PUfmz2FNwpn4DRGmYybMTIUogvrWpxKx4sK8bJq/0Q2uK/5LpOpH8cru+FS+BXR/QmOe5loNVYL2w+l1bn68DW3YRTjRh+xnBRscqDAMQdwwRWybCJ0wBRvD8qnrlJSwsmodFwHa6rEXKWzEe8997B0nrkD9Z4ywNAYW4gqAwu5eVpjG80QftovzT7UpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7886.eurprd04.prod.outlook.com (2603:10a6:102:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 21:55:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 21:55:24 +0000
Date: Wed, 9 Sep 2026 17:55:16 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@intel.com, git@amd.com
Subject: Re: [PATCH v2] i3c: master: amd: Report direct CCC read length in
 payload.actual_len
Message-ID: <aqHVxFH940BqvtCa@lizhi-Precision-Tower-5810>
References: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: CY5PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:930:10::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 82506e34-0d23-4236-c01f-08df0ebd0cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cj7zCGWMj2Wyr9yrqY/qtG7zGjj8xCYFT5bHP8NKJyEI2Ao7WSz+Yf9XWHPHF7f6BBngoLLfCoEV9oGh2em2/pVzCbBJqBWkBvPJQHcDrTChi5iikX6hmtduYIkCKfiyg8WM6GIYV8hCCy+MzUrIqoDRuDfXgobwo53oUjs+5u99PLiAoiUOHw6c8QY1lPinNhJfvYo9FR1ckwJ+WdZeyRvw6ySqnSLDoiuLAzPAQnmhpRNSsEk/ZVML8jlOV1JzCn9tNEojTgcuQVPyABaL8xQTyrukUG3m6Ya5XGHCYTQGT1fwIdNw7PBz9JVvrNfMSHZ0v8SbWY/KvzCii/ACVFhUu7ZAHTt36vnLHhT4dn/KiU0ZDiss4f49xGvABgz68DQr/t50Tz1MqPXBKjVaM8FEgy3LGHx5SsChm2dmCq50WIsG3Bs1Equ+5g9ev7SMe43wzs812Smqe71/2ps3rDSE5lwHVdz86mjBpGnlkM65NWgXCO31/NYFE6YIer0RjJ+qDoKDGva6cxg4/NQqovl7t/Ywu9q9GHrpGyishWv3CHf5/70VEh4n4jvJ8NzgjFxBkI2MtX3UyiOsDNqWXBiPZy0hAs1RdcZs9/xSh9CwRZP/DAjE+dgUfFFxfXJQo+COIGt19k4ZcUtRNkGTVdQemJyFipGQwcyqs84YhkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bRjM4W/kjcPOQtqbxZjliFo3IlGu5uYha/56v0iMo3kiCMqeIxG953Nb5K+D?=
 =?us-ascii?Q?BkPlZQJ9YTtdGkv/+/0T3fneUijWQ079WwQJDDSgjE9nBRRzvaF2LzCFEwFW?=
 =?us-ascii?Q?87T1n4hLh8ZCEusW537KMyIAgo1IHv4XmXefNYkwebFCoLLGqpd64CnTZpPl?=
 =?us-ascii?Q?MTZS/AgDRCnxuGJsxCrpP54KjnB5aboA84c9TQ/QoFyhBTgDiFegN9RrvMtp?=
 =?us-ascii?Q?HBcUlMsU67/xxqZr39m7VpyGnsgszXT9yZAeRwZBRriGxW9+sXnyD/Ikova+?=
 =?us-ascii?Q?B7HSp/RGqCmkd1ScBhzubdZ7CzwJ+UUDcXpIkwWSil/NEhfjgXdggKGIgfi4?=
 =?us-ascii?Q?P876LjFgn4d+rHR0Tludj1RDcR+lQgOEq0czW8RRzbYdCtjyTj0Idc0Sf4s7?=
 =?us-ascii?Q?ib+yXHrUh6ph9z6glXu9kRJixQujTwYxQO0ra1NPjA7JQVeX2uam/1/kSr5x?=
 =?us-ascii?Q?OAzaeO6m+GQ8/q0ZHEhspnVbWtAUx3xf3lqYgFeobQAPFr6L2GxkiZVXJEmt?=
 =?us-ascii?Q?kIBdcy97qGiVBWbUXy5T65uL1Y4Q1JhZliRtI5E0N2pYq+sWap0NXK9K2QYQ?=
 =?us-ascii?Q?Wa+T5atB5ZVPpa1odbGyDTY9WAOal2ulGjICbgddnHjw2H9mJVhpjWq5QPVc?=
 =?us-ascii?Q?AfuDZxBosaNnIOCLSuyua5+x0ZAi8OD/6ZMZobQLlZqnJpaJVeQCRQaR1/4Y?=
 =?us-ascii?Q?IfOYpC6ya8Rurf8hT/0nBLdLp97bviqrzlPgrsRW9OwP6BCB0QLzaTzVSEHX?=
 =?us-ascii?Q?i0AoM9wYpmbYUfgRkmrC5+XsEGqBpdb1haQa6GZa7OkoQo8gzNgkIgBSxUfX?=
 =?us-ascii?Q?/c/dO9GhQaMDAUzN75LNhL4TOKpjZtL7XJMImd8KHW2LHFUVGTrUJLC54y/b?=
 =?us-ascii?Q?sR9oEzG9gyiaqul0heFblSlixMt72PCBYfrEH18QkPUABt9tRRujWRdhr4Sy?=
 =?us-ascii?Q?oRldvt0qOYG1GnAm3qUQdU2lEMjP6tbMp/Q6IGzNoq86ndQE813UwLgM7/Ku?=
 =?us-ascii?Q?RG+EtderBqxmGZP7lqdchUYo1cl0vePgc/1tUtFJsKyqJI7hmo+qaqQ1Fo4R?=
 =?us-ascii?Q?YesQ5wYGx9FxKZJbWYbD+BDdyXpkW4brx+FWKTTEjm6ROpzkCHcv/Pfzy4gx?=
 =?us-ascii?Q?ucSXR87+wP5S1JRn0GamGqtvcmbRxS1IhJo5HpDwUsTOiqTY8GSmI2cRV5VU?=
 =?us-ascii?Q?kDQ5aKInJM0ZDL6nT050Wev2UgaACZA5pZSEQM+QpGwCc/7D7OF+Ida9yWgo?=
 =?us-ascii?Q?Gxshq/lYtLafDZpWuFO0ggLs9x23zNDPvpF3GXCsn5whSO0ICF66EOZ+kNlX?=
 =?us-ascii?Q?oIjbE+4E9Hjkp9haqZTupPhkG5fODcWu/qZIM9ellNSkWZktEPMiAezPjN28?=
 =?us-ascii?Q?K0z8lVLwDo6AI/G5rVP+Fny/7ZMSvFz9ruVdsQq1LSrm2FegGXFZfKXazBuo?=
 =?us-ascii?Q?476HqQmnc4n9bHDa0JcaJ3c4gQiF6ckaQNHIRRd0UOXt9sbPK+iTQYYs6VFL?=
 =?us-ascii?Q?JIfEfWpn5oBsytm5Sdj7LY/4l+gqy6gdz4DQ2Vd6n6UVP/VAf4h0NTt19eVO?=
 =?us-ascii?Q?EvHZbwDiK3gxbAHhLqdpXECzFBnSs6i7+HFrgwXEDlG1yrEFTuX0uFWvPSJr?=
 =?us-ascii?Q?XpiRD1daBQCqkzTwRhaHH2U16ZUnW95LictyO/kEf6swlVy7cxOvoFWFNdhj?=
 =?us-ascii?Q?vIGh93G2cV6MeklL/iJDHv7FieGWlPjga8emy+jkMTCDT4vK/0TYh/QAk7ak?=
 =?us-ascii?Q?5aez3mjMwpLnYXDzh3g64HKTSka36i565dh9ncnoEJgMKIZHHPju?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82506e34-0d23-4236-c01f-08df0ebd0cef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:55:24.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REBNA7rkr/00lSPG3S+6QD+dqIIkJvFaSUuv2/+IoETvtUqk2vbtVD/aFNcgQrEnQITICXgfLPdVCJv9HfXqaY0oXwkl5tTaMb9PiFp5zIFUqpqtHYUBziQMuqicD1AR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7886

On Tue, Sep 08, 2026 at 04:42:07PM +0530, Shubham Patil wrote:
> The I3C core expects master drivers to leave payload.len unchanged and
> report the number of bytes received on GET CCCs via payload.actual_len.
> The AMD driver was overwriting payload.len after direct read CCCs.
>
> Set payload.actual_len from the directed command's rx_actual in
> xi3c_master_send_direct_ccc_cmd() instead of modifying payload.len.
>
> Fixes:629a6ddd1d9a ("i3c: master: Add driver for AMD AXI
> I3C master controller")
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Added Fixes tag
> ---
>  drivers/i3c/master/amd-i3c-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
> index ef5ad5abb788..f205aa06f9b8 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
> @@ -806,8 +806,8 @@ static int xi3c_master_send_direct_ccc_cmd(struct xi3c_master *master,
>
>  	/* Report actual byte count so the core sees the right length on short reads */
>  	if (!ret && ccc->rnw)
> -		ccc->dests[0].payload.len = min(xfer->cmds[1].rx_actual,
> -						ccc->dests[0].payload.len);
> +		ccc->dests[0].payload.actual_len = min(xfer->cmds[1].rx_actual,
> +						       ccc->dests[0].payload.len);
>
>  	return ret;
>  }
> --
> 2.34.1
>
