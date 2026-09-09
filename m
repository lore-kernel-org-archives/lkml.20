Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFED5867D4;
	Wed,  9 Sep 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986480; cv=fail; b=VEA7CSoxdFCQEHzZteRKaq+Ikiq6dimZOGsIFAsjB0C1z5wQ64Obvaan3Yq9UYWXRbBuizUO3/7rQ8VJ1OyhRLoP2Vy3rW/lOwMbta8M3Idjc8eNk23JlwmZHxaykCkY17HMTrP8M6DwwGEuHhe1WkvBYJr3KJ+OgnIuyObVH3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986480; c=relaxed/simple;
	bh=VijtzH1jx5uUE4ySxYpLRpiPiw6KdfG7CRtjFOif8dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hFm6RcHkqWAk1a/akPwoSg42xFiBnjMMDCwLnJ6hFvFLy62wNrfba10ILjfui6kmgVtPJLz+Zp0mw1Kn7mv1pc0RjkrJjBtZddAF7xjKICdvl4/OaRHNG7T/U5dK8DXJSmf+0lXWMKU2itnNUmaqiC7V7Dqn0bcdiyBXsdJTCmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XjopDnve; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XjopDnve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Leas1w4FecAyCcf97vO77E3+AMBLiBAXTFcGk9kdI4A6DkhQNikcdx0NpmTkf6V17hS3OEGPN12dwNPJ7/zCIiPmagq4i/XTlgxfvdpKOgeiFG3lkzMNFI0n9XmXJOeu5jGulVUzEfvA6c/vW/z5aiGdb+/REvrpg9ddpkw20y0M8vgxOR27owZ7QeMc/KVu4ZX9Tq1kMavr3Mmv7+whybUXUQpCJ3M5yQMC6TejrK0eCz2F9weaaz5XpPMiKV2tXG1OiCtfm0hSQsadKzflkzpYyI6C34OgmLdpT3ppGiviZe5y2k654qs7Nkv8ztHZJCg+VFvpsqlb+J6SqlF/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG56WIDe/eRHAEMLeWn0eW0yzhB/VO2sZVuRMvktSHY=;
 b=qcCBmXrGEIznX2zf0zdVcbkkqCJ/I/+q2I9n/BfHkAz9HpwrwrpJvnu9tzx9j3MRtLTbYIt5q5mPUbdH7YTBx/Ri6QZK3OSK0VFLS95xz50kqkTIqJiM3sqYZFacg8HZ7ayoDfTj1eUJxD+Dl5h20OViPAl6617MzME/4VYAn7obcoaDD8Mug7vF/WCE3cFfoRDsvTy04MQPY3lYbp/gGE2sWiL5N5bXxgXwe27st/6XZNqzKxODAtfAgr+yGnNYiIMSA9LAj3drUNZY1dEHRWCIqe8CMtriSFl9zCB60hgCvkSs1VjO2zNtxpXD8WER/v9QRr+0C2PUaGVFKPYSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG56WIDe/eRHAEMLeWn0eW0yzhB/VO2sZVuRMvktSHY=;
 b=XjopDnve9KVWQGaD/yRRk2tHCioLmESa/PxoAwrkgLw18FDm2YZZ8wT7SbWZg75Nh//wbd947KVcRefyxgPXIladdfIzDprrvS/nFERIK2BTfiNdurV8EUIKKUHE6nIRtMG6HNDxBm3l8TB9YZJIxiPCiKjttWZpbQHPSBeCFrMSKgYcSZZoWbkp9mj+F7EkxFzYtfWsBJt2NS6rPFi4ABj2dIat4DCByzX/W5adbhTU2f0VXGee9gYwP5Lf3WfwFCzjHWQDOncNRhkwAzgspE8I9E6mycSto0rPFBDCPf7jMUU4f2RX/99LfLSIbsHBEvjy/hF+szcrMSIPVvrOhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9893.eurprd04.prod.outlook.com (2603:10a6:20b:653::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 20:40:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 20:40:53 +0000
Date: Wed, 9 Sep 2026 16:40:43 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Message-ID: <aqHES02SJkIGZWDc@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9893:EE_
X-MS-Office365-Filtering-Correlation-Id: 107ca959-5bb7-48d3-2072-08df0eb2a414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|23010399003|366016|376014|1800799024|3023799007|10067099003|56012099006|6133799003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Mscq1XR4ZGkkatzU4+wjVJPTTtmS/fE/KZV3H5cDciVl0HH6SvgjOokxufm1wPmt7z0J+nrmrzd+/DA+dbtM0fGKo1uaZWxmDaGm4Rf5x/2YQMShQndsIGEwFmTUFRRBDaQvpL+gyFqWUvhWWlGyf9AtR5rUQa2jKZacl7Mkhl/itBXl4q7wvr/9daSP4TmkcD1u9jfLMQMzf+uEpkXjEosYeVdixxFbes+/RUQiYFZdrwZvG3owLcdXOTKXD4+i6YAANDj/tlBHOSAAqdrvJtNXI/FJ03eIbfUdc4A4mj/HNsoCFUPW01aVVr/A/TedlcWOImXUTuK19CVDMO64YvOko8ooQdU2/THPODWwjcvjKOR8uChzaVgJDNRB5fONElIRm53HtR9MzVqC9OwjL6IfCbbXpTPsdoxbWuxs5AlVQPQNICBQJl/DcdlchIAoFYXnYATuBv+O/sY56fCVZ/zbk43QnrmzVAlQYW9S8W2HItfct1OdnQCrvR53oAa4vzyS2MF2yTAN5Z50+Frs4y5S60gBJhHnKPWyZiZVnSBazpOfaqxdsXcZCCndTlQ7kkUj2sj6YAiu+Y5gVVa7p2k3Xb3foTM07Zfz1C4L39yKQaigt6/CWsoHWUgBA4KaczqhlMEMfEE0rppWzaoXlBjn87KIueBeNlNufR0NfRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(366016)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GIONeSsyJgKt3zIvcykyEfZ4FWOXEoqU8fQfBpcWsYLZhy72i6jZDDqJDC3M?=
 =?us-ascii?Q?95GTMriixUi7oH9p/cjazkzfz5bGN6e+UFnzUcfBaB9jJP7PvREl+v9IsX/v?=
 =?us-ascii?Q?IBUSffQrzOJJLaKfnbAzIso+kkmzq/GBzYbXMewqDK0vRkcyxU8VlZiFu+AH?=
 =?us-ascii?Q?QeHSC0ySQ7ODO+yyzdygYnV0MJZ8LpIQAu7sHUK4qJLWNHORdWuSRQb2IWaE?=
 =?us-ascii?Q?MB4zjco+VwUnc1pzDZiT8diSJZNBeeeueZJXNlge6iuudrW2ktdUihUW4w5i?=
 =?us-ascii?Q?wdSMC/MBki6BFozqoPYEOYq8OJRRxgWGeNE4lO6KgRJC42mlzAlsKzijQMds?=
 =?us-ascii?Q?0bfq7+RrwVgdm2DXcb09TQSpLxr5v9oExGZdC8zwa5myrfNWC/lEaBVxpBET?=
 =?us-ascii?Q?paixEAq05BsCWFGDuSTHf218HD2AgGAbYaYM/Ve/GVD0GMouAiEGpl7ukZSO?=
 =?us-ascii?Q?Q2UJHWt1WLKVKx6UJyjtHtzki30m7h5mU1WzvuqFdzkYAfWolnf2Dxa5KO7w?=
 =?us-ascii?Q?NUXd+H4aD7AHCl27N4mWoVibJFZ/gvUNdsVEUds0piBV0VUKZs8MEzGbAylX?=
 =?us-ascii?Q?Y7SUHV9iaTPgD6eENZ/eU/YDPhyOMv2cJ0PAkIXHGJN0DFT0wLfilKi2HBCm?=
 =?us-ascii?Q?I2/TIghW5WPad9YtefVftf+GFGYkfmfFZOiPxod875btFm6lMMqujqNyMCt1?=
 =?us-ascii?Q?JX+Ahs8xpqLE1Xw1lzlRA8iyy9V7ikmcDpH8YPMbdInJokoDgqgw/r0JBuV6?=
 =?us-ascii?Q?kjmZl5mLctfYQ2l/ClFwutfVzfeJaw94eohRJZ73MhQDNO7Def2FjXSsTr3m?=
 =?us-ascii?Q?dMMagy/dkvE2UbGN3LtCg9b6LPABtTecfwZ1b3frjB7Ymo9v1voIKneOGmy7?=
 =?us-ascii?Q?jSBsCP+l2Vtgq1iNUqvjD7RkUjdeHaFeZ+MvUGV/kvRRGfB3bBhU93oGswBf?=
 =?us-ascii?Q?SlfAastIJJYs844Sp7B9g+oFY1q0XzIks1CpPttScBCuGhvP/imcyrsUVs3H?=
 =?us-ascii?Q?o5LmA7n3OFvJId2dgHDzsLziGf4GoA2lXT3QN1CmpD6Un7sXug4X9uLDF+RV?=
 =?us-ascii?Q?qGfHBsKtG1XK3TTwm59l1IYeeLICi7e+Wd5x9/oOEUUxj1NeUbLrjJDVSMCF?=
 =?us-ascii?Q?5elKmYjHkajg0c6UXm5or1Q+b64D5achnD01wJamGWwmsVgbLPo49LpTGlad?=
 =?us-ascii?Q?j44kVHb/V9mZ3EEKBnBvzaIEO1f6DeQx6uwlHXfA5MBMva5XNEJtMu3nMsn0?=
 =?us-ascii?Q?9DbegBjVO93DxtauLPSGvF32iy4FhZYMp9lSWeBQKlQypfe108XtSvsQ+Yms?=
 =?us-ascii?Q?iYAhbV9s6g6t+PD5iizIOsxc8q23BRlSzPngu96h8JimqDI5czwFdlt1ONgD?=
 =?us-ascii?Q?3jGvzLBgo072kv5aWN8STx4Lj6GJKmwatl+aMJekyEgPHSif57F7jZaDSVEt?=
 =?us-ascii?Q?3g/Tp9rna8VkaODnqCJ700Wam4Wq/9+7fvMTvVw96+2J2yvRgy0Ssput1o8A?=
 =?us-ascii?Q?HC47XaAsWcYQxUq2jmazAbP6lovyjNvIlqOpSQtHHNPWiNsBBKZsu3OGXhcb?=
 =?us-ascii?Q?VDTqfJoAR08w9n9xyPmH64Re9qKmi9LCHPRd/vi3J4BTRAaujorsnkgkZf7/?=
 =?us-ascii?Q?AHQFapjVenhVrKlZFBEvY1KMcsk+34jQcQxign9rX4dDMk3qGEfmrAUd7tg1?=
 =?us-ascii?Q?oc1CsXO4HZ3J39oxjY/KgSKctMjuj8Ql5aJZ5funE/hMHE70A0Za2PmGuJW3?=
 =?us-ascii?Q?k6wayjBuSbuJAKUnpI7BFqppXXYakZZWoNpUq6WQsxDnNUWzVCVS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107ca959-5bb7-48d3-2072-08df0eb2a414
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 20:40:53.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA8AXzGFepsAuY0ZSuTDwDiuKpem7kYWfmwVQGfv4G75VFNCoeyEFWSNJwmoAuULMMEMALgwneNlkUOSnHdceO3FEW9iytiKWH8zoovQQwMhNZxZyyLm9TD+6OFSCLHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9893

On Fri, Sep 04, 2026 at 03:46:32PM +0900, Nas Chung wrote:

media: chips-media: wave6: Add trace and debugfs

> Add debugfs entries and trace events to provide detailed
> debugging information.

Nit: need extra space line here.

> These enhancements help diagnose issues and improve debugging

Remove "These enhancements".

> capabilities for the Wave6 core driver.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
>  .../platform/chips-media/wave6/wave6-trace.h  | 289 ++++++++++++++++++
>  .../chips-media/wave6/wave6-vpu-dbg.c         | 183 +++++++++++
>  .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
>  3 files changed, 486 insertions(+)
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
> new file mode 100644
> index 000000000000..e9589b2f9918
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
> @@ -0,0 +1,289 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver tracer
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM wave6
> +
> +#if !defined(__WAVE6_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __WAVE6_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +DECLARE_EVENT_CLASS(wave6_vpu_register_access,
> +		    TP_PROTO(struct device *dev, u32 addr, u32 value),
> +		    TP_ARGS(dev, addr, value),
> +		    TP_STRUCT__entry(__string(name, dev_name(dev))
> +				     __field(u32, addr)
> +				     __field(u32, value)),
> +		    TP_fast_assign(__assign_str(name);
> +				   __entry->addr = addr;
> +				   __entry->value = value;),
> +		    TP_printk("%s:0x%03x 0x%08x",
> +			      __get_str(name), __entry->addr, __entry->value));
> +
> +DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_writel,
> +	     TP_PROTO(struct device *dev, u32 addr, u32 value),
> +	     TP_ARGS(dev, addr, value));
> +DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_readl,
> +	     TP_PROTO(struct device *dev, u32 addr, u32 value),
> +	     TP_ARGS(dev, addr, value));
> +
> +TRACE_EVENT(wave6_vpu_send_command,
> +	    TP_PROTO(struct vpu_core_device *core, u32 id, u32 std, u32 cmd),
> +	    TP_ARGS(core, id, std, cmd),
> +	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
> +			     __field(u32, id)
> +			     __field(u32, std)
> +			     __field(u32, cmd)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = id;
> +			   __entry->std = std;
> +			   __entry->cmd = cmd;),
> +	    TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
> +		      __get_str(name), __entry->id,
> +		      __entry->std, __entry->cmd));
> +
> +TRACE_EVENT(wave6_vpu_irq,
> +	    TP_PROTO(struct vpu_core_device *core, u32 irq, u32 idc),
> +	    TP_ARGS(core, irq, idc),
> +	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
> +			     __field(u32, irq)
> +			     __field(u32, idc)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->irq = irq;
> +			   __entry->idc = idc;),
> +	    TP_printk("%s: irq 0x%x, idc 0x%x",
> +		      __get_str(name), __entry->irq, __entry->idc));
> +
> +TRACE_EVENT(wave6_vpu_set_state,
> +	    TP_PROTO(struct vpu_instance *inst, u32 state),
> +	    TP_ARGS(inst, state),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __string(cur_state, wave6_vpu_instance_state_name(inst->state))
> +			     __string(nxt_state, wave6_vpu_instance_state_name(state))),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __assign_str(cur_state);
> +			   __assign_str(nxt_state);),
> +	    TP_printk("%s: inst[%d] set state %s -> %s",
> +		      __get_str(name), __entry->id,
> +		      __get_str(cur_state), __get_str(nxt_state)));
> +
> +DECLARE_EVENT_CLASS(wave6_vpu_inst_internal,
> +		    TP_PROTO(struct vpu_instance *inst, bool is_out),
> +		    TP_ARGS(inst, is_out),
> +		    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +				     __field(u32, id)
> +				     __string(type, is_out ? "output" : "capture")
> +				     __field(u32, pixelformat)
> +				     __field(u32, width)
> +				     __field(u32, height)
> +				     __field(u32, buf_cnt_src)
> +				     __field(u32, buf_cnt_dst)
> +				     __field(u32, processed_cnt)
> +				     __field(u32, error_cnt)),
> +		    TP_fast_assign(__assign_str(name);
> +				   __entry->id = inst->id;
> +				   __assign_str(type);
> +				   __entry->pixelformat = is_out ? inst->src_fmt.pixelformat :
> +								   inst->dst_fmt.pixelformat;
> +				   __entry->width = is_out ? inst->src_fmt.width :
> +							     inst->dst_fmt.width;
> +				   __entry->height = is_out ? inst->src_fmt.height :
> +							      inst->dst_fmt.height;
> +				   __entry->buf_cnt_src = inst->queued_src_buf_num;
> +				   __entry->buf_cnt_dst = inst->queued_dst_buf_num;
> +				   __entry->processed_cnt = inst->processed_buf_num;
> +				   __entry->error_cnt = inst->error_buf_num;),
> +		    TP_printk("%s: inst[%d] %s %c%c%c%c %dx%d, input %d, %d, process %d, error %d",
> +			      __get_str(name), __entry->id, __get_str(type),
> +			      __entry->pixelformat,
> +			      __entry->pixelformat >> 8,
> +			      __entry->pixelformat >> 16,
> +			      __entry->pixelformat >> 24,
> +			      __entry->width, __entry->height,
> +			      __entry->buf_cnt_src, __entry->buf_cnt_dst,
> +			      __entry->processed_cnt, __entry->error_cnt));
> +
> +DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_start_streaming,
> +	     TP_PROTO(struct vpu_instance *inst, bool is_out),
> +	     TP_ARGS(inst, is_out));
> +
> +DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_stop_streaming,
> +	     TP_PROTO(struct vpu_instance *inst, bool is_out),
> +	     TP_ARGS(inst, is_out));
> +
> +TRACE_EVENT(wave6_vpu_dec_pic,
> +	    TP_PROTO(struct vpu_instance *inst, u32 srcidx, u32 size),
> +	    TP_ARGS(inst, srcidx, size),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, srcidx)
> +			     __field(u32, start)
> +			     __field(u32, size)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __entry->srcidx = srcidx;
> +			   __entry->start = inst->codec_info->dec_info.stream_rd_ptr;
> +			   __entry->size = size;),
> +	    TP_printk("%s: inst[%d] src[%2d] %8x, %d",
> +		      __get_str(name), __entry->id,
> +		      __entry->srcidx, __entry->start, __entry->size));
> +
> +TRACE_EVENT(wave6_vpu_source_change,
> +	    TP_PROTO(struct vpu_instance *inst, struct dec_seq_info *info),
> +	    TP_ARGS(inst, info),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, width)
> +			     __field(u32, height)
> +			     __field(u32, profile)
> +			     __field(u32, level)
> +			     __field(u32, tier)
> +			     __field(u32, min_fb_cnt)
> +			     __field(u32, disp_delay)
> +			     __field(u32, quantization)
> +			     __field(u32, colorspace)
> +			     __field(u32, xfer_func)
> +			     __field(u32, ycbcr_enc)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __entry->width = info->pic_width;
> +			   __entry->height = info->pic_height;
> +			   __entry->profile = info->profile;
> +			   __entry->level = info->level;
> +			   __entry->tier = info->tier;
> +			   __entry->min_fb_cnt = info->min_frame_buffer_count;
> +			   __entry->disp_delay = info->frame_buf_delay;
> +			   __entry->quantization = inst->quantization;
> +			   __entry->colorspace = inst->colorspace;
> +			   __entry->xfer_func = inst->xfer_func;
> +			   __entry->ycbcr_enc = inst->ycbcr_enc;),
> +	    TP_printk("%s: inst[%d] %dx%d profile %d %d %d min_fb %d delay %d color %d %d %d %d",
> +		      __get_str(name), __entry->id,
> +		      __entry->width, __entry->height,
> +		      __entry->profile, __entry->level, __entry->tier,
> +		      __entry->min_fb_cnt, __entry->disp_delay,
> +		      __entry->quantization, __entry->colorspace,
> +		      __entry->xfer_func, __entry->ycbcr_enc));
> +
> +TRACE_EVENT(wave6_vpu_dec_done,
> +	    TP_PROTO(struct vpu_instance *inst, struct dec_output_info *info),
> +	    TP_ARGS(inst, info),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, dec_flag)
> +			     __field(u32, dec_poc)
> +			     __field(u32, disp_flag)
> +			     __field(u32, disp_cnt)
> +			     __field(u32, rel_cnt)
> +			     __field(u32, src_ch)
> +			     __field(u32, eos)
> +			     __field(u32, error)
> +			     __field(u32, warn)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __entry->dec_flag = info->frame_decoded;
> +			   __entry->dec_poc = info->decoded_poc;
> +			   __entry->disp_flag = info->frame_display;
> +			   __entry->disp_cnt = info->disp_frame_num;
> +			   __entry->rel_cnt = info->release_disp_frame_num;
> +			   __entry->src_ch = info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE;
> +			   __entry->eos = info->stream_end;
> +			   __entry->error = info->error_reason;
> +			   __entry->warn = info->warn_info;),
> +	    TP_printk("%s: inst[%d] dec %d %d disp %d(%d) rel %d src_ch %d eos %d error 0x%x 0x%x",
> +		      __get_str(name), __entry->id,
> +		      __entry->dec_flag, __entry->dec_poc,
> +		      __entry->disp_flag, __entry->disp_cnt,
> +		      __entry->rel_cnt,
> +		      __entry->src_ch, __entry->eos,
> +		      __entry->error, __entry->warn));
> +
> +TRACE_EVENT(wave6_vpu_enc_pic,
> +	    TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
> +	    TP_ARGS(inst, param),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, srcidx)
> +			     __field(u64, buf_y)
> +			     __field(u64, buf_cb)
> +			     __field(u64, buf_cr)
> +			     __field(u32, stride)
> +			     __field(u64, buf_strm)
> +			     __field(u32, size_strm)
> +			     __field(u32, force_type_enable)
> +			     __field(u32, force_type)
> +			     __field(u32, end_flag)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __entry->srcidx = param->src_idx;
> +			   __entry->buf_y = param->source_frame->buf_y;
> +			   __entry->buf_cb = param->source_frame->buf_cb;
> +			   __entry->buf_cr = param->source_frame->buf_cr;
> +			   __entry->stride = param->source_frame->stride;
> +			   __entry->buf_strm = param->pic_stream_buffer_addr;
> +			   __entry->size_strm = param->pic_stream_buffer_size;
> +			   __entry->force_type_enable = param->force_pic;
> +			   __entry->force_type = param->force_pic_type;
> +			   __entry->end_flag = param->src_end;),
> +	    TP_printk("%s: inst[%d] src[%2d] %8llx %8llx %8llx(%d) dst %8llx(%d) force type %d(%d) end %d",
> +		      __get_str(name), __entry->id, __entry->srcidx,
> +		      __entry->buf_y, __entry->buf_cb, __entry->buf_cr,
> +		      __entry->stride, __entry->buf_strm, __entry->size_strm,
> +		      __entry->force_type_enable, __entry->force_type,
> +		      __entry->end_flag));
> +
> +TRACE_EVENT(wave6_vpu_enc_done,
> +	    TP_PROTO(struct vpu_instance *inst, struct enc_output_info *info),
> +	    TP_ARGS(inst, info),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, srcidx)
> +			     __field(u32, frmidx)
> +			     __field(u32, size)
> +			     __field(u32, type)
> +			     __field(u32, avg_qp)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __entry->srcidx = info->enc_src_idx;
> +			   __entry->frmidx = info->recon_frame_index;
> +			   __entry->size = info->bitstream_size;
> +			   __entry->type = info->pic_type;
> +			   __entry->avg_qp = info->avg_ctu_qp;),
> +	    TP_printk("%s: inst[%d] src %d, frame %d, size %d, type %d, qp %d, eos %d",
> +		      __get_str(name), __entry->id,
> +		      __entry->srcidx, __entry->frmidx,
> +		      __entry->size, __entry->type, __entry->avg_qp,
> +		      __entry->frmidx == RECON_IDX_FLAG_ENC_END));
> +
> +TRACE_EVENT(wave6_vpu_s_ctrl,
> +	    TP_PROTO(struct vpu_instance *inst, struct v4l2_ctrl *ctrl),
> +	    TP_ARGS(inst, ctrl),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __string(ctrl_name, ctrl->name)
> +			     __field(u32, val)),
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id = inst->id;
> +			   __assign_str(ctrl_name);
> +			   __entry->val = ctrl->val;),
> +	    TP_printk("%s: inst[%d] %s = %d",
> +		      __get_str(name), __entry->id,
> +		      __get_str(ctrl_name), __entry->val));
> +
> +#endif /* __WAVE6_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE wave6-trace
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> new file mode 100644
> index 000000000000..ae71edeae088
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - debug interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +#include "wave6-vpu-core.h"
> +#include "wave6-vpu-dbg.h"
> +
> +static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
> +{
> +	struct vpu_instance *inst = s->private;
> +	struct vpu_performance_info *perf = &inst->performance;
> +	struct vb2_queue *vq;
> +	s64 tmp;
> +	s64 fps;
> +	s64 duration;
> +
> +	if (!inst->v4l2_fh.m2m_ctx)
> +		return 0;
> +
> +	seq_printf(s, "[%s]\n",
> +		   inst->type == VPU_INST_TYPE_DEC ? "Decoder" : "Encoder");
> +
> +	seq_printf(s, "%s : product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
> +		   dev_name(inst->dev->dev),
> +		   inst->dev->attr.product_code,
> +		   FW_VERSION_MAJOR(inst->dev->attr.fw_version),
> +		   FW_VERSION_MINOR(inst->dev->attr.fw_version),
> +		   FW_VERSION_REL(inst->dev->attr.fw_version),
> +		   inst->dev->attr.fw_revision,
> +		   inst->dev->attr.hw_version);
> +
> +	seq_printf(s, "state = %s\n",
> +		   wave6_vpu_instance_state_name(inst->state));
> +
> +	vq = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
> +	seq_printf(s, "output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
> +		   vb2_is_streaming(vq),
> +		   vb2_get_num_buffers(vq),
> +		   inst->src_fmt.pixelformat,
> +		   inst->src_fmt.pixelformat >> 8,
> +		   inst->src_fmt.pixelformat >> 16,
> +		   inst->src_fmt.pixelformat >> 24,
> +		   inst->src_fmt.width,
> +		   inst->src_fmt.height,
> +		   vq->last_buffer_dequeued);
> +
> +	vq = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
> +	seq_printf(s, "capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
> +		   vb2_is_streaming(vq),
> +		   vb2_get_num_buffers(vq),
> +		   inst->dst_fmt.pixelformat,
> +		   inst->dst_fmt.pixelformat >> 8,
> +		   inst->dst_fmt.pixelformat >> 16,
> +		   inst->dst_fmt.pixelformat >> 24,
> +		   inst->dst_fmt.width,
> +		   inst->dst_fmt.height,
> +		   vq->last_buffer_dequeued);
> +
> +	seq_printf(s, "crop: (%d, %d) %d x %d\n",
> +		   inst->crop.left,
> +		   inst->crop.top,
> +		   inst->crop.width,
> +		   inst->crop.height);
> +
> +	if (inst->scaler_info.enable)
> +		seq_printf(s, "scale: %d x %d\n",
> +			   inst->scaler_info.width, inst->scaler_info.height);
> +
> +	seq_printf(s, "queued src %d, dst %d, process %d, sequence %d, error %d, drain %d:%d\n",
> +		   inst->queued_src_buf_num,
> +		   inst->queued_dst_buf_num,
> +		   inst->processed_buf_num,
> +		   inst->sequence,
> +		   inst->error_buf_num,
> +		   inst->v4l2_fh.m2m_ctx->out_q_ctx.buffered,
> +		   inst->eos);
> +
> +	seq_puts(s, "fps");
> +	tmp = MSEC_PER_SEC * inst->processed_buf_num;
> +	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
> +		fps = DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC_PER_MSEC);
> +		seq_printf(s, " actual: %lld;", fps);
> +	}
> +	duration = perf->total_sw_time / NSEC_PER_MSEC;
> +	if (duration > 0) {
> +		fps = DIV_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " sw: %lld;", fps);
> +	}
> +	duration = perf->total_hw_time / NSEC_PER_MSEC;
> +	if (duration > 0) {
> +		fps = DIV_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " hw: %lld", fps);
> +	}
> +	seq_putc(s, '\n');
> +
> +	seq_printf(s, "latency(ms) first: %llu.%06llu, max %llu.%06llu, setup %llu.%06llu\n",
> +		   perf->latency_first / NSEC_PER_MSEC,
> +		   perf->latency_first % NSEC_PER_MSEC,
> +		   perf->latency_max / NSEC_PER_MSEC,
> +		   perf->latency_max % NSEC_PER_MSEC,
> +		   (perf->ts_first - perf->ts_start) / NSEC_PER_MSEC,
> +		   (perf->ts_first - perf->ts_start) % NSEC_PER_MSEC);
> +
> +	seq_printf(s, "process frame time(ms) min: %llu.%06llu, max %llu.%06llu\n",
> +		   perf->min_process_time / NSEC_PER_MSEC,
> +		   perf->min_process_time % NSEC_PER_MSEC,
> +		   perf->max_process_time / NSEC_PER_MSEC,
> +		   perf->max_process_time % NSEC_PER_MSEC);
> +
> +	if (inst->type == VPU_INST_TYPE_DEC) {
> +		seq_printf(s, "%s order\n",
> +			   inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
> +	} else {
> +		struct enc_info *p_enc_info = &inst->codec_info->enc_info;
> +		struct enc_codec_param *param = &p_enc_info->open_param.codec_param;
> +
> +		seq_printf(s, "profile %d, level %d, tier %d\n",
> +			   param->profile, param->level, param->tier);
> +
> +		seq_printf(s, "frame_rate %d, idr_period %d, intra_period %d\n",
> +			   param->frame_rate, param->idr_period, param->intra_period);
> +
> +		seq_printf(s, "rc %d, mode %d, bitrate %d\n",
> +			   param->en_rate_control,
> +			   param->rc_mode,
> +			   param->bitrate);
> +
> +		seq_printf(s, "qp %d, i_qp [%d, %d], p_qp [%d, %d], b_qp [%d, %d]\n",
> +			   param->qp,
> +			   param->min_qp_i, param->max_qp_i,
> +			   param->min_qp_p, param->max_qp_p,
> +			   param->min_qp_b, param->max_qp_b);
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_dbg_open(struct inode *inode, struct file *filp)
> +{
> +	return single_open(filp, wave6_vpu_dbg_instance, inode->i_private);
> +}
> +
> +static const struct file_operations wave6_vpu_dbg_fops = {
> +	.owner = THIS_MODULE,
> +	.open = wave6_vpu_dbg_open,
> +	.release = single_release,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +};
> +
> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst)
> +{
> +	char name[64];
> +
> +	if (WARN_ON(!inst || !inst->dev))
> +		return -EINVAL;
> +
> +	if (IS_ERR_OR_NULL(inst->dev->debugfs))
> +		return 0;
> +
> +	scnprintf(name, sizeof(name), "instance.%d", inst->id);
> +	inst->debugfs = debugfs_create_file((const char *)name,
> +					    0444,
> +					    inst->dev->debugfs,
> +					    inst,
> +					    &wave6_vpu_dbg_fops);
> +
> +	return 0;
> +}
> +
> +void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst)
> +{
> +	if (!inst || !inst->debugfs)
> +		return;
> +
> +	debugfs_remove(inst->debugfs);
> +	inst->debugfs = NULL;
> +}
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
> new file mode 100644
> index 000000000000..6453eb2de76f
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - debug interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPU_DBG_H__
> +#define __WAVE6_VPU_DBG_H__
> +
> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
> +void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);

You add this patch 6. but call this funcation at patch 4.

You need make sure each patch can build without break bisect.

Frank

> +
> +#endif /* __WAVE6_VPU_DBG_H__ */
> --
> 2.31.1
>
