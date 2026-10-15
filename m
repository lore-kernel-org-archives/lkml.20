Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FCA4F85D4;
	Thu, 15 Oct 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081380; cv=fail; b=kllma9ZrNoaEwq2INaW5Bki6UZUobdmEjDQ4LEhLBBgyqXGqdPbfhIA8Tr5G7HjrG6DPgIe8puxlZYvtAHEaOSRm4COyEv+Cg2a9hCjOV6RlzoR5Cw9laA4tCl5qg56ZS3gO5WxiFarPCqIePM/arKoS/fRwNAY9y66YsGQ+K8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081380; c=relaxed/simple;
	bh=11VGpVKsd1pjySXvyP2aApcWIryqbg0G73YyKzLLHsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OzO+PaDNCI9/Py1ejnr9gxYBTDQdR4QnRBlOx4l/wdjDbPcnzksD5I3VSqvWwO52D70olhrHRAxbA+XLZNRgcUFKRZTSyZljnEu2ibl3irGnTITtxOhdKSDH/FUlN/xk3w3nnoKaKJRq9xVNdRA281uvMzHiGOQwsOc0LCZhVQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tL4R1NiN; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tL4R1NiN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8AWK18lQ/O7d8Wy+aIYIeFNK1FwhZTErNau7DGPzliXEi2wELH03aYk8umAH5inIJ7n+Bdwt7OIGCBxNoK/olSDo0+cJNRuO1KxRq8x7bLDq+zImGKR+vK4J27JxZDowMEJHVlKPA57NgNin96TlkDjvK7t1BfLhq/urym1CuI1DqxsEG6eFM/DFYKacl/za5SWfVrDReubtIACN26vKrznQZVxto3OlwiyHyKY3zA6Cm7cxjaf1Ivh93ccgQEOuuBrdewNfnQ5dvDpiufYhqYY5rLrWGmo8gGIFZgr00th4o/Av9BSx4hh9KBKUnbFzuoWhoG44rmw4cwLd+5gdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2GQtuAM+4BXTK2kBAwAFBC5IJiYjAytN5LyZ54PkXw=;
 b=RdUiEtiPVoiTrVMBh85Z8uOHL5pHFSFRt6uf5NBlltrRT25dyIJ+XlJWBONatvJV/G7Gb+pX8iA5egHe59xM8wy2vQGlDfZp93Kpr+NNw9tw5/+DCDuEbVzQyupN0CgANTLxv5RMZSDNNOu3x378nacMCxssn5gAhARvQZeGCuIeiRHe2tXDoMyF2c831xx3OeCCjHlq9bfhpV8/SVexstT5hD2Kye/Cuu6zR9IT5S6ikmO0cSYNMLYq8Ty436sgJT/8ig6AXZv/qiqL0K5yFl0DKHa/GWSWqVt5Lw0Gt2qmFgSikQ/e5/nk/x01wBLMQ/yDbRT0sHtXO5S+YBYxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2GQtuAM+4BXTK2kBAwAFBC5IJiYjAytN5LyZ54PkXw=;
 b=tL4R1NiNs3Uu+K/lgZj946rR1COAL4EqL/4uPjlF343rZyKKtB0Fo/uoris+gymjMLPDGGQcI3tQA4fI+ONcHT9mKlpLtC/zNLR0CA0XeiHSVk4MU9qY+HLihjYZyyg+qN62NVyPxs//Vzg5YMW8CEhLkF1ZqH1fP3LQhvfuEp/p+yWo4fC4++dJvLRRWa1J3Rr149Z7Cg+oBa2A+WhNekT8fqkdD7jVg29z1GIc8DF1ePkTPDEpg5C5DKeXWkcoRyQ1gEZFi6dY/muBDrn9hOaQ9O7InzMoyitbUdLLxHooM2/HaKoRsZAB6/zugBh2S6aDaNC9TolBWqY8Twe7eQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:22:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:22:44 +0000
Date: Thu, 15 Oct 2026 11:22:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <atD9yeOeHZiKzhZD@SMW015318>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <atBLglf0gSLS7XkW@raspi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atBLglf0gSLS7XkW@raspi>
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cfd447-0005-43f5-556b-08df2ad88ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|19092799006|56012099006|11063799006|4143699003|261009223027099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qGZe0e3IwkDC6BLmbE9k72stuHMZ5wLi1qzhMfBrEUO9YXLVbh75gt+V/s/0pqoolDOuDHGWGK8P5yzZU/rv5gKmW1g6xZ8dMzSkqYzO84Kzh4NRu9rT7nGpMt9LGkqaIxe/nXkI+cv8COlY1RnLIRCaCNA8SbaBW6EnlqTikCYLCEp/O3VsBzMO+N2K1v5OWBOgZrWWwnle+e1JRJ/mJCM6112Zh+dKHPPwxTjFyrpm7QyU9SzjdJs51REaSY1FxAUOOoEbrdHRF2276G60mGM5pSQmXUrFc2ue+akS9F4VTpKvZuR/Vtd6tVrbuzfd7O2o9pK3vAGKBQ1qNzXtcYHW6gVLHw2SogZ2QotakQEstdnVst8I6AJQm552O8V8sNlrB1kiAQQLFYe6tAfvrtmEJWLWoOc0Akz1OE5K22PqYyJaDoFtKbMeyuYCFvm4Wrv/9JwM2mh+XON37L9gXzJfnFUtZfEARv6eYDS4ELleT8qIF0MPxnKoORI7kNLwkxsWBkQ2+dDSdmZLrba64/OEB7ornMUjCP5v8pTlYmbOw9eoM6Wxju0zy7BoiwFIopnRKZcT12dN8nv7SndCh9SI2VXNnq47So1xM4GixZj9JyZmruWmR63jpT9wZ57D3e0JthACfSV/unbHqhzOasBt0ZoynypQlP3OBd5DO2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(19092799006)(56012099006)(11063799006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvrRG4AWHgUDm+3l8qHemANhq2FbJjIUP2YFYmPzwI+t5sN3MI/GHnxFouZb?=
 =?us-ascii?Q?rj348uQzuyIuKUTJ962BVSsLkcAk2UgwMmxIyY/oEsKKga3VUl4YuXa/N9fb?=
 =?us-ascii?Q?yJ4EqM2GIgkaeBx/ESbjg8xD+4xcevKIvrBINTAWO4bq94icEAy5AcYgen2L?=
 =?us-ascii?Q?WAa4mIVsZ7G+2rUf7BKaDNMsaL1QawKDgQSRCVjY6CXDL3owKbZDgNItI44L?=
 =?us-ascii?Q?lbCcg7QlzerRGwgtGDtZJP79RiESeK578NykyI/2cm3YHrt0fa2gLYBo6Bqe?=
 =?us-ascii?Q?aIWzwBzCfSeKfvw2730Mh/oyRBwMzYaL8MXC//7acr6bVJFVy2N8Bau8bQQH?=
 =?us-ascii?Q?RGQSXZ2teW3t3zcwYgS9Cm6P4zB/ow47WEwpTSOki+j3Z1L/pMlbJMoMukJb?=
 =?us-ascii?Q?ur717mOjQD5hUQRbns9j+g+pyVoSi52eEaxYzz8tTCsjif4GVcZ3kAMc4Jlt?=
 =?us-ascii?Q?f2xLb9ziIRUgx5Z7i0Z9PKt3RLFmC8Q5oAuqkHw3g7sl4O0y9oq2pnDSv2Tq?=
 =?us-ascii?Q?EzvDQnNhsz7rtX7FyVfVGaP3GHn/qKFG+93ReChji6JX6B9mkooBBsQVNXOX?=
 =?us-ascii?Q?J0zsJXiDzmqZnnMDpEAicKxLkmgmcNWp9HEdVS0HTk5rjW0dLgsaCRLQXqYM?=
 =?us-ascii?Q?hluiMKGcHnVLleTLzOp2yt7Svf0V7GECF2rOt2teZpjHh1WwD7F8UpbGN+wy?=
 =?us-ascii?Q?7V0ERa+/IN429NIZv1vedqpNVR+3BLigeqQydIto4hoRMMNAL5rt6uF0GD9C?=
 =?us-ascii?Q?TQOWhuiJUiaSMnGqFWIHQGPsYoXS/XZTt0LDL07n5ZdcUo6ClR1bDDycWN5F?=
 =?us-ascii?Q?g4AC/mK/WbB8CWkhedRJPgUkG7/iiHG41UhJ3wg5/JrQhE89+FoA27AKlJQC?=
 =?us-ascii?Q?VESpOW8jXStwlhy/qm73nDbLg4JHhIg9Tv+oO9uyApnqUmKgwVozB1Cg9z1b?=
 =?us-ascii?Q?yvB2BlhJgDaovUqyttSmcPrUIcVEj5Sit8BXFNyvmn8Mw6YtY5Bw7sHJXDJu?=
 =?us-ascii?Q?r67NhgEXb4/QZdgUquDkIq76impe1Ny3AAevlBmEUGA6+i4jAYjOEEL1giXh?=
 =?us-ascii?Q?HpSagv6g6R/z1LqjEjUcqPVNu4/m6Pzz8eebMalFe9o7Ba3rOBBo08pg6G7N?=
 =?us-ascii?Q?7cK9e+az4cIFanxoxqEQ1B03tm9WKTU9XmydwNpLa0mKnLciOEdX2PzFINOZ?=
 =?us-ascii?Q?JX9QC4A+C4z69DT+vG3QNndYYmKSuSXgdcNBXHawLyY+Bc8H3aaZd1w2vrCM?=
 =?us-ascii?Q?VJTeaUPuvu7/N+HSfZzEP5Bp70x3Ny87LG0d31m5WeDwpXkRVoa3Vqwgy4C7?=
 =?us-ascii?Q?uJg9IYipJd7EFrizEwdDulAOtn/iZZrO0tfy9XcSDBEPv4L8jMf9MAs2hlW/?=
 =?us-ascii?Q?2umtFGKXmT9Ze6Loa/2jIG5h1wnFeH5pEg9Qu/nkKNGdibbxPPek4bQ7cXfv?=
 =?us-ascii?Q?PHP8PcVF3kXNUZp8s6ZwN1fq+jze8LpZQMMnFqy9LBImvmxnqu52if0CUft1?=
 =?us-ascii?Q?vw7njfRSj/+OOVEf11W6OvjOVwoUQpQ+52OuNdA8pw3hg3MgUPcZOVnxGIk1?=
 =?us-ascii?Q?n3uk9E2mWSqagxpFVe4r4DF/7ptRYrY1NSPECOuFYl8/w9dChCaxINuRgtfc?=
 =?us-ascii?Q?O8oR72MBC3mw6be1xydVW4GTR2bovkqUXQ0k+rsaQNDY/PkeCLCYAxGvBElQ?=
 =?us-ascii?Q?gZ+9bq96WqrnhzzxddD75whpdKhtbejv+WZ6k1tjcJlh8HTIQEPmRjyNcAgw?=
 =?us-ascii?Q?GvCGHTVgQbVTPRWGkhADMVE0r5H6Wm2+dbF93wbFyZv0UHPG0AYO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cfd447-0005-43f5-556b-08df2ad88ad9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:22:44.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEjlCJclL7mfnm+Hbag7+9ol8P1lItEyrv+9fm+62m0OWEIj47HJbK1sBzITtud1baluXHrZ/YxtnUBze12pNlX68hC4rkqV6hdPcdW7JprQO1WlCX0kANDtYN84Y8S1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On Thu, Oct 15, 2026 at 11:41:54AM +0800, Liu Ying wrote:
> Hi Alexander,
>
> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
>
> [...]
>
...
> > +
> > +			dc0_framegen1: framegen@5618d400 {
> > +				reg = <0x5618d400 0x98>;
> > +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
> > +				interrupt-parent = <&dc0_intc>;
> > +				interrupts = <28>, <29>, <30>, <31>,
> > +					     <45>, <46>, <47>, <48>;
> > +				interrupt-names = "int0", "int1", "int2", "int3",
> > +						  "primsync_on", "primsync_off",
> > +						  "secsync_on", "secsync_off";
> > +			};
> > +
> > +			dc0_tcon1: tcon@5618e400 {
> > +				reg = <0x5618e400 0x588>;
> > +
> > +				port {
> > +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
> > +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
>
> I'm thinking that it would be good to have a complete display controller
> DT node in the first place, including those prefetch engines attached to
> fetchunits through the fsl,prg property.

what's current prefetch engines status? Is it possible merge at v7.5 ?

Frank

>  In this way, display controller
> driver's life would be easier - all child/grandchild devices are always
> available.  I'm considering to adding a check to the Linux display controller
> driver to ensure the availability(at least for critical child/grandchild
> devices).
>
> --
> Regards,
> Liu Ying
>
