Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B023B7763;
	Wed,  9 Sep 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983400; cv=fail; b=BG+7pEE1Qwpc2cYCbGnuwbLBgRz10AcQGEXBTTLHcrFvWccP7CukckOFOWfWZakNxJgxOI4HuQRuDLYv0yIFlvCTTHUbXoquuZGnk78onJ5bzmErNyputtzT7A+4wWNAExUYdYapIEcRCVGQE6Z/fREUxV17LYu4xBsVwrJ7R6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983400; c=relaxed/simple;
	bh=S3VfZPYP9I2A8cNIbK+7MQg0UCnHPvIr50Tl4EKZvd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FWg5xj/5bHfYgCoHNERjmhWLbXr+TwmcfXdP3Lr3zBSQuNR9gbTRoh+ExA+PJdAGRWysENfXCbN3RHQuLIF7Fw3Da77oBI1gnmnRabs2190ZjgXvZAFsXLAK0Md4k8DK2BnFnbO3AS3hO65/3BDj4+J3xSgvdvhtxENhUjer014=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pMftkx40; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pMftkx40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdfL/5vPWAkMOU0wIPRSOLslW8ZUt2H0/90ojJdEPMDOrpsCULM/sNjb7ztMOzRSVI0O9D9sEX9uc80Bf6jPJM41mar3HrSIQsxiTi+RqdJOX1ZAqgCEWCcHzgK4Fz0USFu1gnC3M2+ASO1jHmRpLrdqRkIUhoRqWjTHfjNIFnM42ZE9hIfUNxehvuHzxqADjziU/VUZpvYIrYCP0j+nT3kj1wFvJgMlju/0XbU9F7OomSRHN0oJD1KcOLymTpWfXjSfi7cjp1O64XphTrpj98gtz1+nCMKFZCwR/g04C88eWH69yY7XOMGpBpwAm10iR5eSMdDAUrwcpMm7ldUVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kMWUkeKJLILQX/ljY5NjKZLr1pXsHASwWgrlhugUS0=;
 b=ogf7/iIJB1jfSxjLehJ749z9P+W1ZWXkOdLOQsTAsUJMQ5HQo6t+f98nK7XogCsz51NTQKbYr7xTv84ENYjkRd3QN3ZAaLcfCgbkrRG46MY4RiBh2Y6snZKEBW7NXM0hFjATz/BwDcnwwPsfbIs6y80wG4yI75lx5AovbD38woqO1bDxnNSrifsX2sZYlj6NAuM7eqpGHwzc97EuIRIA1ezt0ZHZkV34tylHdjuiEmpvp+Lncs9ZQ0OsC9kvmwY9p1eA2LJD8KYYEM3eg8WjzhWCH/cGgpFeb1NVi+Q4JxaMxz4zvvLTY5LveiUChRimOiWi60HEjioFjq8B0idTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kMWUkeKJLILQX/ljY5NjKZLr1pXsHASwWgrlhugUS0=;
 b=pMftkx40cFhUtNELwbU+bUcXJ6a4tnWwvn6bfIVDdaLa6rdoHJnER2aflketvK0tUnZHDEd935QWLzoUbnWy0Y/LceiatgV6OwzZzVvL4NSq01qLL9FoxKzs9L37UOGCor5Tci59MV/fxCcEPZIxZXTo2+OjDjbR71+6ghQ+H4zhKo37XuuvS7s4e0p102keVL1uQ/Iubf1w8yDjwE+sEum28eiBMn6Ql81sp50pvmB1zMchmknYy2wKSFuACeR/lLu3hSCiqUxcCVm56gjjvSCQduEgLN3ShLDZxOwN0lKjC3/FVmmekFpHIO7Gj+Jru/12b2551KG1WcKoDNMHUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB059590.eurprd04.prod.outlook.com (2603:10a6:20b:6e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 19:49:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:49:53 +0000
Date: Wed, 9 Sep 2026 15:49:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Message-ID: <aqG4Vl3yDv3rNSw9@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB059590:EE_
X-MS-Office365-Filtering-Correlation-Id: b9318198-d836-4b82-0388-08df0eab83f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t1wKicITL5v3OhaUO7xPx1aJ0pzFbLPFXeaf6T1wIjSWuNBKvksWK4ztd4Kf7PLxdOZ+V/kAxl/6hmsATkIejj0T0tc5aA+Bu16zJ9Qc55mEKzy7zWyWNrMUQru3Jzt+XCtCDNEIblzcCclQNvu21oKQAVsEWvLQ1GqCIXRXtk+CiCueqKtrFG3bxIQKHwTUs+pdL2IWdG0v7PSNH1lTnULPPLijCWYA1k6ahW+aeLEDT9MA3ZbSIusfjztam1DNiCdyH4Ch4JeyS4arpRe3iAS3W3p2hH3oYd9ogj2McFsXFAyxOT8aMQgOlCqvRc0cE0u0kh2fdErrh2VqQVSvLCMvXfz1Yhi1bQJWzxftpHVIjdJV+Vfy0tsipgtujQ0sP3PoIydp3leWdMewRQt+GBy9UfG2/xQRuVc3nV+mQq6UGOqs7p0R6lWhtWML7O7imo3BP03Hzu5yEhrLQbusYNpgEi7Fltro1lN7c7zrxGnhzI5DYoxrv6R4f0yGDyhIkHdwihGJrsg/avmu0UPXGmsKX+ErHwBlOMJYBhjCxMfJr2/ERng+9j60QPl+2yCS2hBPNcKOENwwxZzExlgKdBX8uDBivZx5KfuaJKhHTVgi3QGjlAbLlYnkJU0Ia5ob4K003mhnaTG+kH9mSewPI5OCvKyv3d/g3qyVHPmiTPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PV1HPcED7vzhyox/5a/OvVPIi8D6TIA+jyJLlo8bnJXQKeBJjL1o6gns8AHt?=
 =?us-ascii?Q?UTKn7XGkB8CvjQBwjTptESgR054IFMMJDGVIsqNNDYdNZfbY5P8DaofbAxQR?=
 =?us-ascii?Q?eG+5lt7YK9t5Jej/2FWTOHBx5EnC2drXvuprX+irpu5fmPZcpuYeL7+B40S5?=
 =?us-ascii?Q?pFnOGA0OyMHfNDcqhS5e3l1qzCpy18o9xJgemwSODMfdfEkTfC61eJQYOMtv?=
 =?us-ascii?Q?ffsBw+7ypk+dtwUvxTxuNdZfjUXqaaAQO5gjS5x8SqumibGt19xvK8DSEehb?=
 =?us-ascii?Q?PoEACeSw/n39xJfiIdsn4qG85RrdQeaQJ1lofB9d3jtSLShOJHEURSgxKdL+?=
 =?us-ascii?Q?p+NfZysvkVUPQ4G5PfIRP/hT2wRW94rvRvzYvkJPod62XzBZXJUiw7NuKhNR?=
 =?us-ascii?Q?98bVuXgdDt5Px8QSwBMKND4ngaV1gX1NkwBTNhilL2O2udHbnhzfOQLDPiw2?=
 =?us-ascii?Q?wvmly3GeTDWYgh/D3dBNK6UvZ0SQQT3m0D3FlXEo7jcdG/fBR2p5LX5tkdZn?=
 =?us-ascii?Q?jqHoj+WGMUrtAdgV+tF09e1gQNM4IeocLKjqt3tpMx1+gxyHQSjXc76PGWLP?=
 =?us-ascii?Q?zPiNZcPPvRDYnFyigOUWr8rNxFFvyDKU2TkWPdaYuMZQLs6W6VMyUXzPLWD+?=
 =?us-ascii?Q?2PWNncX5r6L92NsCBB5VAXq+up++6QLZqgynF70M4hYRd+0WoekRLlkgmjl+?=
 =?us-ascii?Q?lBsvRvJjYPisI3OVKsQftfCKS0s8Kx8zCGDohmCC532F2fgenRGR4e9wROuZ?=
 =?us-ascii?Q?TYNUJx/xvsptFQx7hd90cSUVQTD3DD/aoRgnoE0FWoGoLxSH2WFW/sl0fwE8?=
 =?us-ascii?Q?+n4mm+n9RnptPPmBR3qUay1P2FePcfq8k0lxci88S0vPz7AR5ZkJt0S7Vfhh?=
 =?us-ascii?Q?1yqsLWozXl+KucaBG92vKM2WJH+OClRzRZjdy8n6O8+m+9am4ySrVVv7evtO?=
 =?us-ascii?Q?HfChV2IAf8vYTgw3zp1WkkLkC5QISXUHNIW3NMPGVqPp733dckr/I2TN3zRN?=
 =?us-ascii?Q?+lMAAWhdaM14lHUnvXOjv0gaPIQqR0333+Etkt9zqv7skRd6YEFnEOb7qSdv?=
 =?us-ascii?Q?H6Lryv+IwgRx7rIP/Ci46KLYR0SIzfTqTRB1cJmbL/zfw64BvZcNaFKVRl5z?=
 =?us-ascii?Q?h/raTdFCYOrHlWA2Xd9Mhvguk3P7mwh3OpQs4WHrItmIsED6JiEUi/wEZThE?=
 =?us-ascii?Q?M9ADgnD55Ns+XS7pDaOec3HbV7OFCctPVPTfyK7m4HhV07idP10hvR310Wxd?=
 =?us-ascii?Q?GeUyJGtgyKTjBZsIXYCoXSibNA0oVDI3AImq3auaDtJiz/xrHWhuGSDZq9p8?=
 =?us-ascii?Q?9nWrTLiBhW4Nnrt/5XwN9eU7achjFUvuVuSe2HxhRR41i+XjOxKL5i0XGo60?=
 =?us-ascii?Q?3iSrQtEnhOj/akp1rfY8aoB3QVrzOO5sgvLqrnXVGWYq6glzb1kDq5w3anG1?=
 =?us-ascii?Q?R8fjOHKqbIGfhbr81AVQl9nfYUUjpXxRgPqi9k3SxKjapJ9CKqk1fNYuQKsz?=
 =?us-ascii?Q?uxSKNqJ2RvakD/J8TxPf/ZbpoHBDpKUFpNSAzeEPvOvIqF4zSsKFb6rS6wfW?=
 =?us-ascii?Q?c+t3SmDm6wo5E4P7Qg6Y21ahmC2k82rb0Afpoeed/I8QFfkP1Z48/Df4S0jD?=
 =?us-ascii?Q?dgok3SvxI1LT4skPnpYvj4AEQdocH7oq0dIBi/WULhHtQGPRaEWdUELGPkRa?=
 =?us-ascii?Q?ixiVSwDhZ3KaRB9WjdoB5gyJaoa5OFQ12cnpQLqtgFV9bfWwVIoToTgX+ta3?=
 =?us-ascii?Q?ZgDSjNHXQ+4mbmS7OKqHJxtTX3n2IA7Ii4Vg5M3BWjrlN7o2/4g9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9318198-d836-4b82-0388-08df0eab83f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:49:53.0669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yj2/H2Os2YGE97rRa4KHtfCiWEhIf274oAiBN3n3vLNbGhETbT+cEL//IguVqH0c3pWq9u37tWOVrFa7eKWv8O+aC+sm3L/GIr7lGkl+R6YBTiLGJbJwlLQaVKaxEAp2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB059590

On Fri, Sep 04, 2026 at 03:46:29PM +0900, Nas Chung wrote:
> Add an interface layer to manage hardware register configuration
> and communication with the Chips&Media Wave6 video codec IP.
>
> The interface provides low-level helper functions used by the
> Wave6 core driver to implement video encoding and decoding operations.
> It handles command submission to the firmware via MMIO registers,
> and waits for a response by polling the firmware busy flag.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Nit: your s-o-b is last one

> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
...
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7387a11facbe..e29018c2546b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29239,6 +29239,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> +F:	drivers/media/platform/chips-media/wave6/

Consider nxp is one major user, can you add

L: imx@lists.linux.dev

...
> +/*
> + * Wave6 series multi-standard codec IP - wave6 backend interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC

2026

> + */
> +
> +#include <linux/iopoll.h>

Add space line here

> +#include "wave6-vpu-core.h"
> +#include "wave6-hw.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-trace.h"
> +
> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
> +{
> +	wave6_vdi_writel(core->reg_base, addr, data);
> +	trace_wave6_vpu_writel(core->dev, addr, data);
> +}
> +
> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
> +{
> +	u32 data;
> +
> +	data = wave6_vdi_readl(core->reg_base, addr);
> +	trace_wave6_vpu_readl(core->dev, addr, data);
> +
> +	return data;
> +}
> +
> +static void wave6_print_reg_err(struct vpu_core_device *core, u32 fail_reason)
> +{
> +	void *caller = __builtin_return_address(0);
> +	struct device *dev = core->dev;
> +
> +	switch (fail_reason) {
> +	case WAVE6_SYSERR_QUEUEING_FAIL:
> +		dev_dbg(dev, "%pS: queueing failure 0x%x\n", caller, fail_reason);

why here is dev_dbg(), other is dev_err()

> +		break;
> +	case WAVE6_SYSERR_RESULT_NOT_READY:
> +		dev_err(dev, "%pS: result not ready 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
> +		dev_err(dev, "%pS: access violation 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
> +		dev_err(dev, "%pS: watchdog timeout 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_BUS_ERROR:
> +		dev_err(dev, "%pS: bus error 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_DOUBLE_FAULT:
> +		dev_err(dev, "%pS: double fault 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_VPU_STILL_RUNNING:
> +		dev_err(dev, "%pS: still running 0x%x\n", caller, fail_reason);
> +		break;
> +	default:
> +		dev_err(dev, "%pS: failure: 0x%x\n", caller, fail_reason);
> +		break;
> +	}
> +}
> +
> +static void wave6_dec_set_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
> +{
> +	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
> +	int index;
> +
> +	for (index = 0; index < WAVE6_MAX_FBS; index++) {

Now, Prefer

	for (int index = 0; ....)

> +		if (!p_dec_info->disp_buf[index].buf_y) {
> +			p_dec_info->disp_buf[index] = fb;
> +			p_dec_info->disp_buf[index].index = index;
> +			break;
> +		}
> +	}
> +}
> +
> +static struct frame_buffer wave6_dec_get_display_buffer(struct vpu_instance *inst,
> +							dma_addr_t addr)
> +{
> +	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
> +	int i;
> +	struct frame_buffer fb;

struct frame_buffer fb = { .index = -1;};

> +
> +	for (i = 0; i < WAVE6_MAX_FBS; i++) {

for (int i = 0; ..)

> +		if (p_dec_info->disp_buf[i].buf_y == addr)
> +			return p_dec_info->disp_buf[i];
> +	}
> +
> +	memset(&fb, 0, sizeof(struct frame_buffer));

needn't memset here if init at declear.

> +	fb.index = -1;
> +
> +	return fb;
> +}
> +
...
> +
> +static int wave6_send_query(struct vpu_core_device *core, u32 id, u32 std,
> +			    enum wave6_query_option query_opt)
> +{
> +	int ret;
> +	u32 reg_val;

try keep reverise Christmas tree order.

> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	vpu_write_reg(core, W6_QUERY_OPTION, query_opt);
> +	wave6_send_command(core, id, std, W6_CMD_QUERY);
> +
> +	ret = wave6_wait_vpu_busy(core, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(core->dev, "query timed out opt=0x%x\n", query_opt);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(core, W6_RET_SUCCESS)) {
> +		reg_val = vpu_read_reg(core, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(core, reg_val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_get_version(struct vpu_core_device *core)
> +{
> +	struct vpu_attr *attr = &core->attr;
> +	int ret;
> +	u32 std_def1, conf_feature;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	ret = wave6_send_query(core, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
> +	if (ret)
> +		return ret;
> +
> +	attr->product_id = wave6_vpu_get_product_id(core);
> +	attr->product_code = vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
> +	attr->product_version = vpu_read_reg(core, W6_RET_PRODUCT_VERSION);
> +	attr->fw_version = vpu_read_reg(core, W6_RET_FW_API_VERSION);
> +	attr->fw_revision = vpu_read_reg(core, W6_RET_FW_VERSION);
> +	attr->hw_version = vpu_read_reg(core, W6_RET_CONF_HW_VERSION);
> +	std_def1 = vpu_read_reg(core, W6_RET_STD_DEF1);
> +	conf_feature = vpu_read_reg(core, W6_RET_CONF_FEATURE);
> +
> +	attr->support_decoders = 0;
> +	attr->support_encoders = 0;
> +	attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;

This is depend on STD_DEF1_HEVC_DEC() is 1 bit field.
I feel like below codes is easier to read

	STD_DEF1_HEVC_DEC(std_def1) ? BIT(W_HEVC_DEC) : 0;

> +	attr->support_hevc10bit_dec = CONF_FEATURE_HEVC10BIT_DEC(conf_feature);
> +	attr->support_decoders |= STD_DEF1_AVC_DEC(std_def1) << W_AVC_DEC;
> +	attr->support_avc10bit_dec = CONF_FEATURE_AVC10BIT_DEC(conf_feature);
> +	attr->support_encoders |= STD_DEF1_HEVC_ENC(std_def1) << W_HEVC_ENC;
> +	attr->support_hevc10bit_enc = CONF_FEATURE_HEVC10BIT_ENC(conf_feature);
> +	attr->support_encoders |= STD_DEF1_AVC_ENC(std_def1) << W_AVC_ENC;
> +	attr->support_avc10bit_enc = CONF_FEATURE_AVC10BIT_ENC(conf_feature);
> +
> +	return 0;
> +}
...
> +
> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
> +{
> +	int ret;
> +	struct dec_info *p_dec_info;
> +	u32 reg_val;
> +	u32 c_fmt_idc, out_fmt, out_mode;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	p_dec_info = &inst->codec_info->dec_info;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM,
> +		      inst->scaler_info.enable);
> +	reg_val = SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
> +		  SET_DISP_SCL_PIC_SIZE_HEIGHT(inst->scaler_info.height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
> +	reg_val = SET_DISP_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
> +		  SET_DISP_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
> +
> +	c_fmt_idc = get_chroma_format_idc(p_dec_info->wtl_format);
> +	switch (p_dec_info->wtl_format) {
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_MSB:
> +		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +		out_mode = (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_LSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +		out_mode = (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
> +		break;
> +	default:
> +		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_8BIT;
> +		break;
> +	}
> +	out_fmt = (inst->nv21 << 1) | inst->cbcr_interleave;

Can you use macro for 1 and 2. look like it fill into
SET_DISP_COMMON_PIC_INFO_OUT_FMT()

Seem you need more detail out_fmt for WTL_PIXEL_16BIT/WTL_PIXEL_32BIT/
WTL_PIXEL_8BIT and *JUSTIFIED. should use FIELD_PREP() macro for these
settings.

> +
> +	reg_val = SET_DISP_COMMON_PIC_INFO_BWB_ON |
> +		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
> +		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
> +		  SET_DISP_COMMON_PIC_INFO_OUT_MODE(out_mode) |
> +		  SET_DISP_COMMON_PIC_INFO_OUT_FMT(out_fmt) |
> +		  SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
> +	reg_val = SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);
> +	reg_val = SET_DISP_PIC_INFO_L_BIT_DEPTH(fb.luma_bit_depth) |
> +		  SET_DISP_PIC_INFO_C_BIT_DEPTH(fb.chroma_bit_depth) |
> +		  SET_DISP_PIC_INFO_C_FMT_IDC(fb.c_fmt_idc);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, fb.buf_y);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, fb.buf_cb);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, fb.buf_cr);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_SET_DISP);
> +	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
> +		return -EIO;
> +
> +	wave6_dec_set_display_buffer(inst, fb);
> +
> +	return 0;
> +}
> +
...
> +
> +int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info)
> +{
> +	struct dec_info *p_dec_info;
> +	u32 reg_val, i;
> +	int decoded_idx = -1, disp_idx = -1;
> +	int ret;
> +
> +	if (WARN_ON(!info))
> +		return -EINVAL;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	p_dec_info = &inst->codec_info->dec_info;
> +
> +	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
> +	if (ret) {
> +		info->rd_ptr = p_dec_info->stream_rd_ptr;
> +		info->wr_ptr = p_dec_info->stream_wr_ptr;
> +		return ret;
> +	}
> +
> +	info->decoding_success = vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS);
> +	if (!info->decoding_success)
> +		info->error_reason = vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
> +	else
> +		info->warn_info = vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +
> +	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_TYPE);
> +	info->ctu_size = DEC_PIC_TYPE_CTU_SIZE(reg_val);
> +	info->nal_type = DEC_PIC_TYPE_NAL_UNIT_TYPE(reg_val);
> +
> +	if (reg_val & DEC_PIC_TYPE_B)
> +		info->pic_type = PIC_TYPE_B;
> +	else if (reg_val & DEC_PIC_TYPE_P)
> +		info->pic_type = PIC_TYPE_P;
> +	else if (reg_val & DEC_PIC_TYPE_I)
> +		info->pic_type = PIC_TYPE_I;
> +	else
> +		info->pic_type = PIC_TYPE_MAX;
> +	if (inst->std == W_HEVC_DEC) {
> +		if (info->pic_type == PIC_TYPE_I &&
> +		    (info->nal_type == H265_NAL_UNIT_TYPE_IDR_W_RADL ||
> +		     info->nal_type == H265_NAL_UNIT_TYPE_IDR_N_LP))
> +			info->pic_type = PIC_TYPE_IDR;
> +	} else if (inst->std == W_AVC_DEC) {
> +		if (info->pic_type == PIC_TYPE_I &&
> +		    info->nal_type == H264_NAL_UNIT_TYPE_IDR_PICTURE)
> +			info->pic_type = PIC_TYPE_IDR;
> +	}
> +
> +	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr = vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_ADDR);
> +
> +		fb = wave6_dec_get_display_buffer(inst, addr);
> +		info->frame_decoded_addr = addr;
> +		info->frame_decoded = true;
> +		decoded_idx = fb.index;
> +	}
> +
> +	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_ADDR);
> +
> +		fb = wave6_dec_get_display_buffer(inst, addr);
> +		info->frame_display_addr = addr;
> +		info->frame_display = true;
> +		disp_idx = fb.index;
> +	}
> +
> +	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_IDC);
> +	for (i = 0; i < WAVE6_MAX_FBS; i++) {
> +		if (reg_val & (1 << i)) {

for_each_set_bit()

> +			dma_addr_t addr;
> +
> +			addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
> +
> +			info->disp_frame_addr[info->disp_frame_num] = addr;
> +			info->disp_frame_num++;
> +		}
> +	}
> +
> +	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_RELEASE_IDC);
> +	for (i = 0; i < WAVE6_MAX_FBS; i++) {

ditto, check other similar logic.

> +		if (reg_val & (1 << i)) {
> +			dma_addr_t addr;
> +
> +			addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
> +
> +			wave6_dec_remove_display_buffer(inst, addr);
> +			info->release_disp_frame_addr[info->release_disp_frame_num] = addr;
> +			info->release_disp_frame_num++;
> +		}
> +	}
> +
...
> +
> +int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param,
> +				  u32 *fail_res)
> +{
> +	struct enc_cmd_enc_pic_reg reg;

struct enc_cmd_enc_pic_reg reg = {};

move set 0 out of mutex lock, slice better.

> +	struct enc_info *p_enc_info;
> +	int ret;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	p_enc_info = &inst->codec_info->enc_info;
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_enc_pic_reg));
> +
> +	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
> +			      inst->nv21, param, &reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SEC_AXI, reg.sec_axi);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_REPORT, reg.report);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO0, reg.mv_histo0);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO1, reg.mv_histo1);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM, reg.custom_map_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR, reg.custom_map_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX, reg.src_pic_idx);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_FMT, reg.src_fmt);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL, reg.src_axi_sel);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION, reg.code_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PARAM, reg.param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC, reg.longterm_pic);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR, reg.prefix_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO, reg.prefix_sei_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR, reg.suffix_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO, reg.suffix_sei_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_LOW, reg.timestamp_low);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_HIGH, reg.timestamp_high);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF0, reg.csc_coeff[0]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF1, reg.csc_coeff[1]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF2, reg.csc_coeff[2]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF3, reg.csc_coeff[3]);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
> +	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}

I not sure how heavy register read() write(),  consider use
readl(writel)_relex(), if need write/read many registers(). Only last one
need writel() before trigger DMA.

> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
...
> +#endif /* __WAVE6_HW_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> new file mode 100644
> index 000000000000..1d495145bbbd
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> @@ -0,0 +1,649 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 register definitions
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */

2026

...
> +
> +#define W6_MAX_PIC_STRIDE		(4096U * 4)
> +#define W6_PIC_STRIDE_ALIGNMENT		32
> +#define W6_FBC_BUF_ALIGNMENT		32
> +#define W6_DEC_BUF_ALIGNMENT		32
> +#define W6_DEF_DEC_PIC_WIDTH		720U
> +#define W6_DEF_DEC_PIC_HEIGHT		480U
> +#define W6_MIN_DEC_PIC_WIDTH		64U
> +#define W6_MIN_DEC_PIC_HEIGHT		64U
> +#define W6_MAX_DEC_PIC_WIDTH		4096U
> +#define W6_MAX_DEC_PIC_HEIGHT		4096U
> +#define W6_DEC_PIC_SIZE_STEP		1
> +
> +#define W6_DEF_ENC_PIC_WIDTH		416U
> +#define W6_DEF_ENC_PIC_HEIGHT		240U
> +#define W6_MIN_ENC_PIC_WIDTH		256U
> +#define W6_MIN_ENC_PIC_HEIGHT		128U
> +#define W6_MAX_ENC_PIC_WIDTH		4096U
> +#define W6_MAX_ENC_PIC_HEIGHT		4096U

needn't U

> +#define W6_ENC_PIC_SIZE_STEP		8
> +#define W6_ENC_CROP_X_POS_STEP		32
> +#define W6_ENC_CROP_Y_POS_STEP		2
> +#define W6_ENC_CROP_STEP		2
> +
> +#define W6_VPU_POLL_DELAY_US		10
> +#define W6_VPU_POLL_TIMEOUT		300000
> +#define W6_BOOT_WAIT_TIMEOUT		10000
> +#define W6_VPU_TIMEOUT			6000
> +#define W6_VPU_TIMEOUT_CYCLE_COUNT	(8000000 * 4 * 4)
> +
...
> +#define __WAVE6_VPUERROR_H__
> +
> +/* WAVE6 COMMON SYSTEM ERROR (FAIL_REASON) */
> +#define WAVE6_SYSERR_QUEUEING_FAIL			0x00000001
> +#define WAVE6_SYSERR_DECODER_FUSE			0x00000002
> +#define WAVE6_SYSERR_INSTRUCTION_ACCESS_VIOLATION	0x00000004
> +#define WAVE6_SYSERR_PRIVILEGE_VIOLATION		0x00000008
> +#define WAVE6_SYSERR_DATA_ADDR_ALIGNMENT		0x00000010
> +#define WAVE6_SYSERR_DATA_ACCESS_VIOLATION		0x00000020
> +#define WAVE6_SYSERR_ACCESS_VIOLATION_HW		0x00000040
> +#define WAVE6_SYSERR_INSTRUCTION_ADDR_ALIGNMENT		0x00000080
> +#define WAVE6_SYSERR_UNKNOWN				0x00000100
> +#define WAVE6_SYSERR_BUS_ERROR				0x00000200
> +#define WAVE6_SYSERR_DOUBLE_FAULT			0x00000400
> +#define WAVE6_SYSERR_RESULT_NOT_READY			0x00000800
> +#define WAVE6_SYSERR_VPU_STILL_RUNNING			0x00001000
> +#define WAVE6_SYSERR_UNKNOWN_CMD			0x00002000
> +#define WAVE6_SYSERR_UNKNOWN_CODEC_STD			0x00004000
> +#define WAVE6_SYSERR_UNKNOWN_QUERY_OPTION		0x00008000
> +#define WAVE6_SYSERR_WATCHDOG_TIMEOUT			0x00020000
> +#define WAVE6_SYSERR_NOT_SUPPORT			0x00100000
> +#define WAVE6_SYSERR_TEMP_SEC_BUF_OVERFLOW		0x00200000
> +#define WAVE6_SYSERR_NOT_SUPPORT_PROFILE		0x00400000
> +#define WAVE6_SYSERR_TIMEOUT_CODEC_FW			0x40000000

Suppose you should get check_patch warning, to prefer use BIT(n) for this
defination.

Frank
> +#define WAVE6_SYSERR_FATAL_VPU_HANGUP			0xf0000000
> +
> +/* WAVE6 COMMAND QUEUE ERROR (FAIL_REASON) */
> +#define WAVE6_CMDQ_ERR_NOT_QUEABLE_CMD		0x00000001
> +#define WAVE6_CMDQ_ERR_SKIP_MODE_ENABLE		0x00000002
> +#define WAVE6_CMDQ_ERR_INST_FLUSHING		0x00000003
> +#define WAVE6_CMDQ_ERR_INST_INACTIVE		0x00000004
> +#define WAVE6_CMDQ_ERR_QUEUE_FAIL		0x00000005
> +#define WAVE6_CMDQ_ERR_CMD_BUF_FULL		0x00000006
> +
> +/* WAVE6 ERROR ON DECODER (ERR_INFO) */
> +#define HEVC_SPSERR_SEQ_PARAMETER_SET_ID				0x00001000
> +#define HEVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
> +#define HEVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
> +#define HEVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
> +#define HEVC_SPSERR_CONF_WIN_LEFT_OFFSET				0x00001004
> +#define HEVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
> +#define HEVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
> +#define HEVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
> +#define HEVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
> +#define HEVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
> +#define HEVC_SPSERR_LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4			0x0000100A
> +#define HEVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
> +#define HEVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
> +#define HEVC_SPSERR_SPS_MAX_LATENCY_INCREASE				0x0000100D
> +#define HEVC_SPSERR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3		0x0000100E
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE		0x0000100F
> +#define HEVC_SPSERR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2		0x00001010
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE		0x00001011
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER			0x00001012
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA			0x00001013
> +#define HEVC_SPSERR_SCALING_LIST					0x00001014
> +#define HEVC_SPSERR_LOG2_DIFF_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3	0x00001015
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	0x00001016
> +#define HEVC_SPSERR_NUM_SHORTTERM_REF_PIC_SETS				0x00001017
> +#define HEVC_SPSERR_NUM_LONGTERM_REF_PICS_SPS				0x00001018
> +#define HEVC_SPSERR_GBU_PARSING_ERROR					0x00001019
> +#define HEVC_SPSERR_EXTENSION_FLAG					0x0000101A
> +#define HEVC_SPSERR_VUI_ERROR						0x0000101B
> +#define HEVC_SPSERR_ACTIVATE_SPS					0x0000101C
> +#define HEVC_SPSERR_PROFILE_SPACE					0x0000101D
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1		0x00002002
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1		0x00002003
> +#define HEVC_PPSERR_INIT_QP_MINUS26					0x00002004
> +#define HEVC_PPSERR_DIFF_CU_QP_DELTA_DEPTH				0x00002005
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_MINUS1				0x00002008
> +#define HEVC_PPSERR_NUM_TILE_ROWS_MINUS1				0x00002009
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1					0x0000200A
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1					0x0000200B
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2				0x0000200C
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2					0x0000200D
> +#define HEVC_PPSERR_SCALING_LIST					0x0000200E
> +#define HEVC_PPSERR_LOG2_PARALLEL_MERGE_LEVEL_MINUS2			0x0000200F
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_RANGE_OUT				0x00002010
> +#define HEVC_PPSERR_NUM_TILE_ROWS_RANGE_OUT				0x00002011
> +#define HEVC_PPSERR_MORE_RBSP_DATA_ERROR				0x00002012
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1_RANGE_OUT			0x00002019
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1_RANGE_OUT				0x00002020
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2_RANGE_OUT			0x00002021
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2_RANGE_OUT			0x00002022
> +#define HEVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
> +#define HEVC_SHERR_ACTIVATE_PPS						0x00003001
> +#define HEVC_SHERR_ACTIVATE_SPS						0x00003002
> +#define HEVC_SHERR_SLICE_TYPE						0x00003003
> +#define HEVC_SHERR_FIRST_SLICE_IS_DEPENDENT_SLICE			0x00003004
> +#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_SPS_FLAG			0x00003005
> +#define HEVC_SHERR_SHORTTERM_REF_PIC_SET				0x00003006
> +#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_IDX				0x00003007
> +#define HEVC_SHERR_NUM_LONGTERM_SPS					0x00003008
> +#define HEVC_SHERR_NUM_LONGTERM_PICS					0x00003009
> +#define HEVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
> +#define HEVC_SHERR_DELTA_POC_MSB_CYCLE_LT				0x0000300B
> +#define HEVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
> +#define HEVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
> +#define HEVC_SHERR_COLLOCATED_REF_IDX					0x0000300E
> +#define HEVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
> +#define HEVC_SHERR_FIVE_MINUS_MAX_NUM_MERGE_CAND			0x00003010
> +#define HEVC_SHERR_SLICE_QP_DELTA					0x00003011
> +#define HEVC_SHERR_SLICE_QP_DELTA_IS_OUT_OF_RANGE			0x00003012
> +#define HEVC_SHERR_SLICE_CB_QP_OFFSET					0x00003013
> +#define HEVC_SHERR_SLICE_CR_QP_OFFSET					0x00003014
> +#define HEVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
> +#define HEVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
> +#define HEVC_SHERR_NUM_ENTRY_POINT_OFFSETS				0x00003017
> +#define HEVC_SHERR_OFFSET_LEN_MINUS1					0x00003018
> +#define HEVC_SHERR_SLICE_SEGMENT_HEADER_EXTENSION_LENGTH		0x00003019
> +#define HEVC_SHERR_WRONG_POC_IN_STILL_PICTURE_PROFILE			0x0000301A
> +#define HEVC_SHERR_SLICE_TYPE_ERROR_IN_STILL_PICTURE_PROFILE		0x0000301B
> +#define HEVC_SHERR_PPS_ID_NOT_EQUAL_PREV_VALUE				0x0000301C
> +#define HEVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
> +#define HEVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
> +#define HEVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
> +#define HEVC_SPECERR_OVER_BIT_DEPTH					0x00004003
> +#define HEVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
> +#define HEVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
> +#define HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
> +#define HEVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
> +#define HEVC_ETCERR_NO_VALID_SLICE_IN_AU				0x00005002
> +#define HEVC_ETCERR_INPLACE_V						0x0000500F
> +
> +#define AVC_SPSERR_SEQ_PARAMETER_SET_ID					0x00001000
> +#define AVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
> +#define AVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
> +#define AVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
> +#define AVC_SPSERR_CONF_WIN_LEFT_OFFSET					0x00001004
> +#define AVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
> +#define AVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
> +#define AVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
> +#define AVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
> +#define AVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
> +#define AVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
> +#define AVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
> +#define AVC_SPSERR_SCALING_LIST						0x00001014
> +#define AVC_SPSERR_GBU_PARSING_ERROR					0x00001019
> +#define AVC_SPSERR_VUI_ERROR						0x0000101B
> +#define AVC_SPSERR_ACTIVATE_SPS						0x0000101C
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1			0x00002002
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1			0x00002003
> +#define AVC_PPSERR_INIT_QP_MINUS26					0x00002004
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
> +#define AVC_PPSERR_SCALING_LIST						0x0000200E
> +#define AVC_PPSERR_MORE_RBSP_DATA_ERROR					0x00002012
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
> +#define AVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
> +#define AVC_SHERR_ACTIVATE_PPS						0x00003001
> +#define AVC_SHERR_ACTIVATE_SPS						0x00003002
> +#define AVC_SHERR_SLICE_TYPE						0x00003003
> +#define AVC_SHERR_FIRST_MB_IN_SLICE					0x00003004
> +#define AVC_SHERR_RPLM							0x00003006
> +#define AVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
> +#define AVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
> +#define AVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
> +#define AVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
> +#define AVC_SHERR_SLICE_QP_DELTA					0x00003011
> +#define AVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
> +#define AVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
> +#define AVC_SHERR_DISABLE_DEBLOCK_FILTER_IDC				0x00003017
> +#define AVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
> +#define AVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
> +#define AVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
> +#define AVC_SPECERR_OVER_BIT_DEPTH					0x00004003
> +#define AVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
> +#define AVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
> +#define AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
> +#define AVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
> +#define AVC_ETCERR_NO_VALID_SLICE_IN_AU					0x00005002
> +#define AVC_ETCERR_ASO							0x00005004
> +#define AVC_ETCERR_FMO							0x00005005
> +#define AVC_ETCERR_INPLACE_V						0x0000500F
> +
> +/* WAVE6 WARNING ON DECODER (WARN_INFO) */
> +#define HEVC_SPSWARN_MAX_SUB_LAYERS_MINUS1			0x00000001
> +#define HEVC_SPSWARN_GENERAL_RESERVED_ZERO_44BITS		0x00000002
> +#define HEVC_SPSWARN_RESERVED_ZERO_2BITS			0x00000004
> +#define HEVC_SPSWARN_SUB_LAYER_RESERVED_ZERO_44BITS		0x00000008
> +#define HEVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
> +#define HEVC_SPSWARN_SPS_MAX_DEC_PIC_BUFFERING_VALUE_OVER	0x00000020
> +#define HEVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
> +#define HEVC_SPSWARN_ST_RPS_UE_ERROR				0x00000080
> +#define HEVC_SPSWARN_EXTENSION_FLAG				0x01000000
> +#define HEVC_SPSWARN_REPLACED_WITH_PREV_SPS			0x02000000
> +#define HEVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
> +#define HEVC_PPSWARN_REPLACED_WITH_PREV_PPS			0x00000200
> +#define HEVC_SHWARN_FIRST_SLICE_SEGMENT_IN_PIC_FLAG		0x00001000
> +#define HEVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG		0x00002000
> +#define HEVC_SHWARN_PIC_OUTPUT_FLAG				0x00004000
> +#define HEVC_SHWARN_DUPLICATED_SLICE_SEGMENT			0x00008000
> +#define HEVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
> +#define HEVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
> +#define HEVC_ETCWARN_WRONG_TEMPORAL_ID				0x00040000
> +#define HEVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED		0x00080000
> +#define HEVC_SPECWARN_OVER_PROFILE				0x00100000
> +#define HEVC_SPECWARN_OVER_LEVEL				0x00200000
> +#define HEVC_PRESWARN_PARSING_ERR				0x04000000
> +#define HEVC_PRESWARN_MVD_OUT_OF_RANGE				0x08000000
> +#define HEVC_PRESWARN_CU_QP_DELTA_VAL_OUT_OF_RANGE		0x09000000
> +#define HEVC_PRESWARN_COEFF_LEVEL_REMAINING_OUT_OF_RANGE	0x0A000000
> +#define HEVC_PRESWARN_PCM_ERR					0x0B000000
> +#define HEVC_PRESWARN_OVERCONSUME				0x0C000000
> +#define HEVC_PRESWARN_END_OF_SUBSET_ONE_BIT_ERR			0x10000000
> +#define HEVC_PRESWARN_END_OF_SLICE_SEGMENT_FLAG			0x20000000
> +
> +#define AVC_SPSWARN_RESERVED_ZERO_2BITS				0x00000004
> +#define AVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
> +#define AVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
> +#define AVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
> +#define AVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG			0x00002000
> +#define AVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
> +#define AVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
> +#define AVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED			0x00080000
> +#define AVC_SPECWARN_OVER_PROFILE				0x00100000
> +#define AVC_SPECWARN_OVER_LEVEL					0x00200000
> +#define AVC_PRESWARN_MVD_RANGE_OUT				0x00400000
> +#define AVC_PRESWARN_MB_QPD_RANGE_OUT				0x00500000
> +#define AVC_PRESWARN_COEFF_RANGE_OUT				0x00600000
> +#define AVC_PRESWARN_MV_RANGE_OUT				0x00700000
> +#define AVC_PRESWARN_MB_SKIP_RUN_RANGE_OUT			0x00800000
> +#define AVC_PRESWARN_MB_TYPE_RANGE_OUT				0x00900000
> +#define AVC_PRESWARN_SUB_MB_TYPE_RANGE_OUT			0x00A00000
> +#define AVC_PRESWARN_CBP_RANGE_OUT				0x00B00000
> +#define AVC_PRESWARN_INTRA_CHROMA_PRED_MODE_RANGE_OUT		0x00C00000
> +#define AVC_PRESWARN_REF_IDX_RANGE_OUT				0x00D00000
> +#define AVC_PRESWARN_COEFF_TOKEN_RANGE_OUT			0x00E00000
> +#define AVC_PRESWARN_TOTAL_ZERO_RANGE_OUT			0x00F00000
> +#define AVC_PRESWARN_RUN_BEFORE_RANGE_OUT			0x01000000
> +#define AVC_PRESWARN_OVERCONSUME				0x01100000
> +#define AVC_PRESWARN_MISSING_SLICE				0x01200000
> +
> +/* WAVE6 WARNING ON ENCODER (WARN_INFO) */
> +#define WAVE6_ETCWARN_FORCED_SPLIT_BY_CU8X8	0x00000001
> +
> +#endif /* __WAVE6_VPUERROR_H__ */
> --
> 2.31.1
>
