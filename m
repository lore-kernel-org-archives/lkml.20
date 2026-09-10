Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C86496D2E;
	Thu, 10 Sep 2026 20:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073356; cv=fail; b=qgXbkm9qTM5eOrzTiWsg7jgidzt2e/rq4zlr0Z8NiKcyQB7I/X+ouS9TINm9ANsgcRnvhfayDRgnMo9gHUcnqJ1pWojrjJJL1BePrNfstH6rExMLEp1IwR/NHl6lurC3EwCXhTe9MwuZsZeNXfboSLAzfnMqPyTsODCKcarXTis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073356; c=relaxed/simple;
	bh=0P7yiCoaXWqdGxNRo8IvEtZ9qrO1/GaV8CxBdeFrSrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XMM3hlWH69+0JkdYPjw8BTLiyDHPavVFH7mq2p/FwKMO4BY+ZHVpNHxDbXkpJSxK8bvQ1rqZqy/46PIrPXe3Zy6ZYP7QJVP61+KQI4d3a9HXislXE9+oyzfmmyqt4bOH1XcDzexTfTYCRA7Efsu+7pZSDOrT/JaJ980eyzlGq7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N5K9I3G6; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N5K9I3G6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myfly75j41uDyJHS5zJ/hntYWXgcB/agEGs/itSywM/qjagrzeLwwdHfwuuC6jZXCdeJWQECM+8yo+8zh5ode7PwDXfaMCT33o/qaB0f02ajYgkEyqX5sqJvp7REWjnuE7PqOoHAtf4AAknDvRRzpbe9NHqnRhy5jaAPEXrsj8cYwlO9PDXBiwLygiX3BrtS0QsaBJD5AMOWKUkRCm92RnfKZPMSxAyJMbm/pEAS/WPIgJN0WEkxelNgpbBN2QY1EK+sLch3PSm+r8GPibWU/ep4Jr/eK9mLVwAhjaAdN5RijQrbfrw8+pizzVl60CZ8eNJ4TIamXDtmMlHaUqU1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEYlgKCi+PvuvNGW6W37XS/QAPtPbO0vVx9pxrvBy7I=;
 b=i2qreaIBn1YKlue8zvbqAkpBKgEhfvGr0Vq2oPBj+0kIo4doEWmP35O/m5Jk1yiN9JdkfukqyVFBd14HReOCBZTWLAc6ohjNsFNHAlMSafWm6k+Bbycm+whJknhyyrU86LJ3wj4ygaZRK46RmnOA5Q94D8srPiQqIRHSTfH/pZL0C8IIIJT2FeCDmvSLPIh4FRWhVdxCKnOdzSLKf+8qDuHmTAUaW0DfRPffPIqe1GEODH1XX3UNKfIOVk6d2mAPuxqvgYCGCfAZl6BRUon22CJowceC4lPMRQCnzrPEOUP9iPvzZ/HqaAq8v3UwnK+UTG86EVD+OE6L+ZOmYBBWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEYlgKCi+PvuvNGW6W37XS/QAPtPbO0vVx9pxrvBy7I=;
 b=N5K9I3G6NLFx9SpjnFZnf+LujULLeLSC4398yokDlnbZh7XkSNLRjGHknDei0kHeO+SinOT6jnez2s6kAe8IE8bGnpj5S5eZo87GOHp7pM35hGhgkudzjbrdPVCJ/C9I2Ei1kLt98g8OYV/q/6RfqlBHIVgdTrFN5kSirJWVMu6k7uCGPagtnOYFbqZmT9Sj4PHKmbycpypNqUE22M/wzaXmzcli3zgWQUJwwWeVxs//D+lje8la2tXYw0rdbTLI8zmi7pnT4Afe3jqpdY4xe55uXFUrDXXjlWHvq61djmH1722qcvWc/c3TXhEyeMg7UqMCPbFLRv3BbsO2JYucfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 20:49:09 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:49:09 +0000
Date: Thu, 10 Sep 2026 16:48:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core driver
Message-ID: <aqMXumGHR9JjvVrf@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH0PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:510:5::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: bc10003d-7ae9-4d3d-6f0a-08df0f7cf58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|10067099003|4143699003|3023799007|22082099003|56012099006|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OyaeqDZTDUyIFTAThhIkjr9R6Mt8MkGG5sPdasKOpT1tRxsB+13nL7kTyHe3+qaQI4tTkbPE5WnEcHEzdTFkYOVzXMjtbmiAJt7pi9t87Y/R/QQzpqzQ13b1k8v8/LZeGrpGOywAF3u203tTPJuK09piFAqSThSCI8/8FiBQ/NIoXDhJ/W0ww0Ad7pIDmm5v6GkT5+o2y0HLihiadNXmkZxocfxQBTe/ZXVDWHJOpGkxB2qAV3wKk4Yrt4sAuPyZ7fXxOaUGe+/UQHssTGAu9Su/Y1dBZO8wmAuIPvKjfVq0gDRSGt219AMqwGpio39CAX2wUCIK/XjhrkB49tIni/fbVAE1EXO9TxIJ3YU/clz9OTMKgCqGojdNZUx1QDCqj9ko3Y8cLflNrXKT8yrUUNemPS7AuZnUPC+N2GmwmJ/J37vZo7FqcBnyrXt3ey4x6rctQksGlNG6edxnvZee4iU9jULz4Hv8m/kh/128BCnfXoNoKh+2xYghYYw4WdzhCUgyu7iR2Jl0Vt5QMZUE3+dy67JS8mp4VHKPDIusXcfQ1jeff4i6turaydP8lzah59kM8BSZO1r2A0da8+f1rxVrleI509QJzE9sfRS6I7vzaxkU0/55/e+vChoejPM1kKcgRk8aXF3JdIcymE7lKyFThriArnTUTQYLzx7fgYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(4143699003)(3023799007)(22082099003)(56012099006)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ydNVFshfkGWaw1fqd0Tl7b45QtTs1yrXArOLrY9WNvthtEdnlYabo/ITFh5d?=
 =?us-ascii?Q?lLyCSxEFJYZAi9Qe2HZVyfxVjPIQ8EEzjIJ9eBvlleE/h0gdB71tqwa/PkHq?=
 =?us-ascii?Q?XaFrey1uwJ/XXHayB8y4lkHQUjzMF2KY7YUT+VgBtTI2yXOb7WJPMZxZw8Rs?=
 =?us-ascii?Q?m2s1AICyT3Q2SYYLsGufApeSzeIVhsiYcM2/6VaIiB/dzyPFd1OQf7VO3nDp?=
 =?us-ascii?Q?9sWY90hXTzoflj7+0ObluN4xJGKERojeFKTXzElP2PY737WmB1AGc0o96F4E?=
 =?us-ascii?Q?5yzXe2W/2196gK4uTB0vJ3rRzPY3Vn3fEIFDA7qXmccUQesbkvxmOvQ6qF4x?=
 =?us-ascii?Q?Kk1+B7gmD3dWFJIXmFtoAffuG2Ybr68Ud6FopSqyQfwPkf1G1B1TxL7tWzns?=
 =?us-ascii?Q?evEIq51iEuDzBjQVahLSNPU6jlN0/gnRqWkVrM4pRr7GqATJrfcsdYBaed9X?=
 =?us-ascii?Q?GYZFAI81PTRbb5RKYST3iN9bf1tFmMM1T0k1z35TPTU446NhAa5oO8xN1uCh?=
 =?us-ascii?Q?5/x7uWRWju30katR56V1oM0uVwJbiNZXYD98+4WxvUQngkvIn+S78tywOljB?=
 =?us-ascii?Q?r1LuAs3l28LDGOlNonK3/hkbfeTFeU8N9fhjjOz8vPZ+gopAnltbVvjWsL4W?=
 =?us-ascii?Q?Vi1RP8JF2XOJfQdstuc6q9bm61crZEBO+tjHNvTEdtSm/9LUAjShfafX0fXD?=
 =?us-ascii?Q?r/UI5/yTHCyMAwITjY2/d94pIxMjdvDPv/l7nBbw+TxENOenMvgVNChsrAvB?=
 =?us-ascii?Q?U513J72TbWHQPI8r7d1rMw/8sebDFTxu8h2YASQ3XXe2hAFfwizHmc+MSPG6?=
 =?us-ascii?Q?iAF0L0Zy63kJ5RcmMmWrPl6EE7BH0hZjDP0066KDCpd6kRJkDYrbjonpb7MJ?=
 =?us-ascii?Q?FP4NLAfwY0hsKxQagmbJ8nhx4Q5qDYsDviGpPS9AxKXb5XWmgYVjEtLE0iTd?=
 =?us-ascii?Q?POA7ZxNSI/IvqXF/+3thsb/4aGPvp4NzSFgoxDJ/bPo+k0aHDinhdpQaqz3h?=
 =?us-ascii?Q?Bzr+HgCeCx2gJyCrkJPQ4p48nfe5zjs+cKoR5nm9Q0w+lir6pMM6XGkeK8FB?=
 =?us-ascii?Q?+nGcefRjLstW31oMSRF0VxO+obp0s39hFm8chLV3UbWJZuturhBz7T39MUP5?=
 =?us-ascii?Q?gpdn+EcfLbHAcmP1AqjuokDT9AIrWYLIuCQbtrSFpuqS1yNNhA3h29emNysv?=
 =?us-ascii?Q?M7YY/Qz+UewuPRDTyjujyeMSm23O30VFBjtllzLmVIOWQUoqj4mU2qAS0aYT?=
 =?us-ascii?Q?OEF9Nh3fQg+wbeLATBX/062QSWfdvMXTV0vB508DpZ7BhU/dDuGgdTkKUMHq?=
 =?us-ascii?Q?lKvNzTwArgUjJh2EeppTJE3UG46FWU5ijb1dkliPnDMx0tXwpiKwdBmmfjTg?=
 =?us-ascii?Q?W4d9/+U+pq0C6ZEVL4c2ljgI0e4Rmc/ZkCxND0kEdYtfdmn5YxllW+PDQT21?=
 =?us-ascii?Q?4225iFMYi9W/6FES+4/9dqlWey4/NonO+N1u4F2DnI1176wVHYFvm8MFM7as?=
 =?us-ascii?Q?1rPTVmWSGTm7Q4udTFQf7hTL4e5LfXgWkkUhDMS+a6fbGYDRspmbbZT4KwBE?=
 =?us-ascii?Q?S+QqOJ8I/WN5kREv186NDbpVhxEKdFfYI00QL0jJUMLzx21gkePfMu6cWHOq?=
 =?us-ascii?Q?15sJ8Z1PyKTcHS8UY8Vip+OPLFrFVQKKz1+r6wNqHxpieLyZ/dLN2CRuyCit?=
 =?us-ascii?Q?8ZpRgf123VXGHs72jk1bvqasjiZsoc6dXImH3leBBOA/rJ8de8CBPy8S6w8Q?=
 =?us-ascii?Q?K2y7UUPpDmv6HagybpdR+neJsI+udzCfEXdJXpvhH3eHy5uI/ejJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc10003d-7ae9-4d3d-6f0a-08df0f7cf58e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:49:09.6107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yZc5ar1MNJ/+5AXCSs3YKPurhShudFhl5ZTZ7OIL6dmrMmSN8xQbcw8IeJw0DBVtwWUQ6RBq8xoq1xRf6g/3lVKfApEC/Oa5uvUPmnOqY5xAvRyKpGkCCz7lvWxhIVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

On Fri, Sep 04, 2026 at 03:46:31PM +0900, Nas Chung wrote:
> Add the core driver for the Chips&Media Wave6 video codec IP.
>
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. This driver
> handles the interface register regions, each with its own MMIO range and
> interrupt, while relying on the control driver for firmware loading and
> shared resource management.
>
> It configures the V4L2 mem2mem devices and communicates with the Wave6
> hardware to perform video processing tasks.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
>  .../chips-media/wave6/wave6-vpu-core.c        | 448 ++++++++++++++++++
>  .../chips-media/wave6/wave6-vpu-core.h        | 126 +++++
>  2 files changed, 574 insertions(+)
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> new file mode 100644
> index 000000000000..89cce27802cf
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 core driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/debugfs.h>
> +#include <linux/iopoll.h>
> +#include "wave6-vpu-core.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-vpuconfig.h"
> +#include "wave6-hw.h"
> +#include "wave6-vpu-dbg.h"
> +
> +#define CREATE_TRACE_POINTS
> +#include "wave6-trace.h"
> +
> +#define WAVE6_VPU_DEBUGFS_DIR "wave6"
> +
> +static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core = dev_id;
> +	struct vpu_irq irq_info;
> +
> +	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
> +		return IRQ_NONE;
> +
> +	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
> +	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
> +
> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
> +	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
> +	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
> +
> +	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
> +
> +	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
> +		if (core->vpu)
> +			core->vpu->req_work_buffer(core->vpu, core);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=
> +	    sizeof(struct vpu_irq))
> +		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
> +			irq_info.status, irq_info.inst_idc);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
> +							u32 inst_idc)
> +{
> +	struct vpu_instance *inst;
> +
> +	guard(spinlock)(&core->inst_lock);
> +
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if ((BIT(inst->id) & inst_idc) && inst->enable) {
> +			atomic_inc(&inst->refcount);
> +			return inst;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void wave6_vpu_core_put_instance(struct vpu_instance *inst)
> +{
> +	if (!inst)
> +		return;
> +
> +	guard(spinlock)(&inst->dev->inst_lock);
> +	atomic_dec_if_positive(&inst->refcount);
> +}
> +
> +void wave6_vpu_enable_instance(struct vpu_instance *inst)
> +{
> +	scoped_guard(spinlock, &inst->dev->inst_lock) {
> +		atomic_set(&inst->refcount, 0);
> +		inst->enable = true;
> +	}
> +}
> +
> +void wave6_vpu_disable_instance(struct vpu_instance *inst)
> +{
> +	int count;
> +
> +	scoped_guard(spinlock, &inst->dev->inst_lock)
> +		inst->enable = false;
> +
> +	if (read_poll_timeout(atomic_read, count, !count,
> +			      W6_VPU_POLL_DELAY_US,
> +			      W6_VPU_POLL_TIMEOUT,
> +			      true, &inst->refcount))
> +		dev_dbg(inst->dev->dev, "[%d] disable timeout\n", inst->id);
> +}
> +
> +static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core = dev_id;
> +	struct vpu_instance *inst;
> +	struct vpu_irq irq_info;
> +
> +	while (kfifo_len(&core->irq_fifo)) {
> +		bool error = false;
> +
> +		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
> +			break;
> +
> +		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
> +		if (!inst)
> +			continue;
> +
> +		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
> +		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
> +			complete(&inst->irq_done);
> +			wave6_vpu_core_put_instance(inst);
> +			continue;
> +		}
> +
> +		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
> +			error = true;
> +
> +		if (inst->ops && inst->ops->finish_process)
> +			inst->ops->finish_process(inst, error);
> +
> +		wave6_vpu_core_put_instance(inst);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int wave6_vpu_core_check_state(struct vpu_core_device *core)
> +{
> +	u32 val;
> +	int ret;
> +
> +	guard(mutex)(&core->hw_lock);
> +
> +	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
> +				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				false, core, W6_VPU_VCPU_CUR_PC);
> +	if (ret)
> +		return ret;
> +
> +	wave6_vpu_enable_interrupt(core);
> +	ret = wave6_vpu_get_version(core);
> +	if (ret) {
> +		dev_err(core->dev, "wave6_vpu_get_version fail\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
> +		core->attr.product_code,
> +		FW_VERSION_MAJOR(core->attr.fw_version),
> +		FW_VERSION_MINOR(core->attr.fw_version),
> +		FW_VERSION_REL(core->attr.fw_version),
> +		core->attr.fw_revision,
> +		core->attr.hw_version);
> +
> +	if (core->attr.fw_version < core->res->compatible_fw_version)
> +		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
> +			FW_VERSION_MAJOR(core->res->compatible_fw_version),
> +			FW_VERSION_MINOR(core->res->compatible_fw_version),
> +			FW_VERSION_REL(core->res->compatible_fw_version));
> +
> +	return 0;
> +}
> +
> +void wave6_vpu_core_activate(struct vpu_core_device *core)
> +{
> +	core->active = true;
> +}
> +
> +static int wave6_vpu_core_wait_activated(struct vpu_core_device *core)
> +{
> +	if (!core->active)
> +		return 0;
> +
> +	return wave6_vpu_core_check_state(core);
> +}
> +
> +static int wave6_vpu_core_probe(struct platform_device *pdev)
> +{
> +	struct vpu_core_device *core;
> +	const struct wave6_vpu_core_resource *res;
> +	int ret;
> +	int irq;
> +
> +	res = dev_get_platdata(&pdev->dev);
> +	if (!res)
> +		return -ENODEV;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
> +		return ret;
> +	}
> +
> +	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +	if (!core)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&core->inst_lock);
> +	INIT_LIST_HEAD(&core->instances);
> +	dev_set_drvdata(&pdev->dev, core);
> +	core->dev = &pdev->dev;
> +	core->res = res;
> +
> +	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
> +	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))

why need check this?

> +		core->vpu = dev_get_drvdata(pdev->dev.parent);
> +
> +	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->reg_base))
> +		return PTR_ERR(core->reg_base);
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
> +
> +	core->num_clks = ret;
> +
> +	ret = kfifo_init(&core->irq_fifo, core->irq_buffer,
> +			 sizeof(core->irq_buffer));
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					wave6_vpu_core_irq,
> +					wave6_vpu_core_irq_thread,
> +					0, "vpu_irq", core);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wave6_vpu_init_m2m_dev(core);
> +	if (ret)
> +		goto err_v4l2_unregister;
> +
> +	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
> +	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
> +		goto err_m2m_dev_release;
> +	}
> +
> +	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (!IS_ERR_OR_NULL(core->debugfs))
> +		dput(core->debugfs);
> +	else
> +		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +
> +	pm_runtime_enable(&pdev->dev);

devm_pm_runtime_enable()

> +
> +	if (core->res->codec_types & WAVE6_IS_DEC) {
> +		ret = wave6_vpu_dec_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"failed to register video_dev_dec: %d\n", ret);
> +			goto err_temp_vbuf_free;
> +		}
> +	}
> +	if (core->res->codec_types & WAVE6_IS_ENC) {
> +		ret = wave6_vpu_enc_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"failed to register video_dev_enc: %d\n", ret);
> +			goto err_dec_unreg;
> +		}
> +	}
> +
> +	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
> +		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
> +		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
> +
> +	return 0;
> +
> +err_dec_unreg:
> +	if (core->res->codec_types & WAVE6_IS_DEC)
> +		wave6_vpu_dec_unregister_device(core);
> +err_temp_vbuf_free:
> +	pm_runtime_disable(&pdev->dev);
> +	wave6_vdi_free_dma(&core->temp_vbuf);
> +err_m2m_dev_release:
> +	wave6_vpu_release_m2m_dev(core);
> +err_v4l2_unregister:
> +	v4l2_device_unregister(&core->v4l2_dev);

can you try use devm_add_action_or_reset() to elimiate these error label?

> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_core_remove(struct platform_device *pdev)
> +{
> +	struct vpu_core_device *core = dev_get_drvdata(&pdev->dev);
> +
> +	wave6_vpu_enc_unregister_device(core);
> +	wave6_vpu_dec_unregister_device(core);
> +	pm_runtime_disable(&pdev->dev);
> +	wave6_vdi_free_dma(&core->temp_vbuf);
> +	wave6_vpu_release_m2m_dev(core);
> +	v4l2_device_unregister(&core->v4l2_dev);
> +}
> +
> +static int wave6_vpu_core_runtime_suspend(struct device *dev)
> +{
> +	struct vpu_core_device *core = dev_get_drvdata(dev);
> +
> +	if (WARN_ON(!core))
> +		return -ENODEV;
> +
> +	/*
> +	 * Only call parent VPU put_vpu if the core has a parent and is active.
> +	 * - core->vpu: prevent access in core without parent VPU.
> +	 * - core->active: execute sleep only after m2m streaming is started.
> +	 */
> +	if (core->vpu && core->active)
> +		core->vpu->put_vpu(core->vpu, core);
> +
> +	if (core->num_clks)

Need check it. clk_bulk_disable_unprepare() is empty ops when num_clks is 0

> +		clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_core_runtime_resume(struct device *dev)
> +{
> +	struct vpu_core_device *core = dev_get_drvdata(dev);
> +	bool boot_vpu;
> +	int ret;
> +
> +	if (WARN_ON(!core))
> +		return -ENODEV;
> +
> +	if (core->num_clks) {

need checkit. clk_bulk_prepare_enable() is empty ops when num_clks is 0

Frank
> +		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
> +		if (ret) {
> +			dev_err(dev, "failed to enable clocks: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Only call parent VPU get_vpu if the core has a parent and is active.
> +	 * - core->vpu: prevent access in core without parent VPU.
> +	 * - core->active: execute boot only after m2m streaming is started.
> +	 */
> +	boot_vpu = core->vpu && core->active;
> +	if (boot_vpu) {
> +		ret = core->vpu->get_vpu(core->vpu, core);
> +		if (ret)
> +			goto error_get_vpu;
> +	}
> +
> +	ret = wave6_vpu_core_wait_activated(core);
> +	if (ret)
> +		goto error_activate;
> +
> +	return 0;
> +
> +error_activate:
> +	if (boot_vpu)
> +		core->vpu->put_vpu(core->vpu, core);
> +error_get_vpu:
> +	if (core->num_clks)
> +		clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +
> +	return ret;
> +}
> +
> +static int wave6_vpu_core_suspend(struct device *dev)
> +{
> +	struct vpu_core_device *core = dev_get_drvdata(dev);
> +	int ret;
> +
> +	v4l2_m2m_suspend(core->m2m_dev);
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		v4l2_m2m_resume(core->m2m_dev);
> +
> +	return ret;
> +}
> +
> +static int wave6_vpu_core_resume(struct device *dev)
> +{
> +	struct vpu_core_device *core = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_m2m_resume(core->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
> +	RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
> +		       wave6_vpu_core_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
> +			    wave6_vpu_core_resume)
> +};
> +
> +static struct platform_driver wave6_vpu_core_driver = {
> +	.driver = {
> +		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
> +		.pm = pm_ptr(&wave6_vpu_core_pm_ops),
> +	},
> +	.probe = wave6_vpu_core_probe,
> +	.remove = wave6_vpu_core_remove,
> +};
> +
> +module_platform_driver(wave6_vpu_core_driver);
> +MODULE_ALIAS("platform:" WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
> +MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
> +MODULE_AUTHOR("CHIPS&MEDIA INC");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
> new file mode 100644
> index 000000000000..779e8a132f57
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
> @@ -0,0 +1,126 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 core driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPU_CORE_H__
> +#define __WAVE6_VPU_CORE_H__
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "wave6-vpuconfig.h"
> +#include "wave6-vpuapi.h"
> +
> +#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
> +#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
> +
> +struct vpu_buffer {
> +	struct v4l2_m2m_buffer v4l2_m2m_buf;
> +	bool consumed;
> +	bool used;
> +	bool error;
> +	bool force_key_frame;
> +	bool force_frame_qp;
> +	u32 force_i_frame_qp;
> +	u32 force_p_frame_qp;
> +	u32 force_b_frame_qp;
> +	ktime_t ts_input;
> +	ktime_t ts_start;
> +	ktime_t ts_finish;
> +	ktime_t ts_output;
> +	u64 hw_time;
> +	u32 average_qp;
> +};
> +
> +enum vpu_fmt_type {
> +	VPU_FMT_TYPE_CODEC	= 0,
> +	VPU_FMT_TYPE_RAW	= 1
> +};
> +
> +#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
> +#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
> +#define VPU_FMT_FLAG_10BIT		BIT(2)
> +#define VPU_FMT_FLAG_RGB		BIT(3)
> +#define VPU_FMT_FLAG_SUPPORT_ROT_MIR	BIT(4)
> +
> +struct vpu_format {
> +	unsigned int v4l2_pix_fmt;
> +	unsigned int max_width;
> +	unsigned int min_width;
> +	unsigned int max_height;
> +	unsigned int min_height;
> +	unsigned int num_planes;
> +	enum frame_buffer_format fb_fmt;
> +	enum endian_mode endian;
> +	enum csc_format_order csc_fmt_order;
> +	unsigned int flags;
> +};
> +
> +static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
> +{
> +	return container_of(vfh, struct vpu_instance, v4l2_fh);
> +}
> +
> +static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
> +{
> +	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
> +}
> +
> +static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
> +{
> +	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
> +}
> +
> +static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
> +}
> +
> +static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
> +{
> +	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
> +	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
> +
> +	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
> +}
> +
> +u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
> +void wave6_vpu_core_activate(struct vpu_core_device *core);
> +void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  unsigned int width,
> +			  unsigned int height);
> +struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
> +						  dma_addr_t addr);
> +dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
> +			      unsigned int plane_no);
> +enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
> +const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
> +void wave6_vpu_set_instance_state(struct vpu_instance *inst,
> +				  enum vpu_instance_state state);
> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
> +int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
> +int wave6_vpu_dec_register_device(struct vpu_core_device *core);
> +void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
> +int wave6_vpu_enc_register_device(struct vpu_core_device *core);
> +void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
> +void wave6_vpu_finish_job(struct vpu_instance *inst);
> +void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
> +void wave6_vpu_handle_performance(struct vpu_instance *inst,
> +				  struct vpu_buffer *vpu_buf);
> +void wave6_vpu_reset_performance(struct vpu_instance *inst);
> +int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
> +void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
> +int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
> +			      const struct v4l2_event_subscription *sub);
> +void wave6_vpu_return_buffers(struct vpu_instance *inst,
> +			      unsigned int type, enum vb2_buffer_state state);
> +void wave6_vpu_enable_instance(struct vpu_instance *inst);
> +void wave6_vpu_disable_instance(struct vpu_instance *inst);
> +
> +#endif /* __WAVE6_VPU_CORE_H__ */
> --
> 2.31.1
>
