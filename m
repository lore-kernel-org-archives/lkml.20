Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570FB331ECE;
	Thu, 10 Sep 2026 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065263; cv=fail; b=YgcjL4NHiymXD0L+6W2+ay5vHWK9/Si6K1aTWaiMxzguGxFuHoEgd0ElDeQwgKMSv2xKekeVhpb026E3zO866cYGKh4lv7ydHnt0fBOFfN+6jSXrDPCUphvl9p3yORi5LJCFZnvJzP+50GYlh0aBb8uT625CPzqtTGSzpKMPMn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065263; c=relaxed/simple;
	bh=B6L32D1VKCl4olO2wl1HfCZ8dC0dXcjLHqMtSXgqISI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eTrIasZbD6EObI7OnhLOjqjvRHbqv9pyoEvl7EdJuGXXLXzHGHB8GuKDIbZ0J129OroeACSSnH1rU2y66ZNH/wLMzuwenLr5xo1sSMIIhBK/c81MD+FcX/FFh0747cJDX5qZlvp2MtNep3RR6le5CYJE95wVmGZPNyWqCXRsHQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=faC3GW/3; arc=fail smtp.client-ip=52.101.84.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="faC3GW/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKjeFcX4FFzpRvd5Aca650mxPE7FFIQ5+YKeWduly9FmV63fkyA/+/kyvJYL1LsGhupRGLwk1FOTHs4ZUELgyYI7I6kGpQlsxbaqVNpYdMKP3eCUFP7stQHd/NGVoaCIsBeJNlgm+IFhlHjZVZQR8RvI/lPsLK9/EFdCFwlHIXFhR7KR6hHUBKORTWKu+2ynjn+wJb2HIZkjxEF42LRi0e69mhLONOlyRACyks2GugpYJdECw2uyW+P4ryn+JugCwSi33buDCa8/kMuG9DL2rFmmsqWNVFrwkB/3Jq9Nd7gyrjFtv7m0YUMnw9HW02YG7ecQk1oP0FBNpENEfQdhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiT/NDFsmJVOqHT5jWw8HxH9sYbvICEqJnMFr5WFvfs=;
 b=yVzd4PeUHsNxW4QO/8mLjWb2Ryl+I3hmctE3NHj0jTLOFbGIhZ9s9G/yXKhR4+4YsD6CfbgnRtsqckyyCJmIKK7wzL9B9p2LsEYm2RbvgnXjwTwYV8V9MJ/cI6zQ3wmljGhQxyWWUtHlkECbwQPp9bbZHEx+od5Oe2SE3q68JdYATbtJAzrJ5aG7j9Rfn8NEI5kISmVAfoTeN8C29R/k1lUcquLjUJYuZri0ppatLUnuc5M+bfLoBdsKW8wkt7ZLvai6qtiwn1ejrWP8g0SWgms0a5bmWC+MZidoKVHx3Uq8rkEv2kNXLJsccWqjBscLfRuxSZRuXGGL03OMY3IcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiT/NDFsmJVOqHT5jWw8HxH9sYbvICEqJnMFr5WFvfs=;
 b=faC3GW/3wFHJDYXzq272aYyuWQ8p8UrBLA0xyA+gi2zaRswY520KOQeDdJA25vMxPqJYiniYiZqtRoX0VQkQbKTaYBRG6/3DJmMQwXPpnP0creirLJADiPXV9v/h3jmO6v/yIgH2LM89El4zy6E5/d1nqsFvvbkUoND7gsyKN65uXHr72o3x0eUVeHFO+jMo52qmMUm/O0z5matSV7gP24OUfyyoQhzcfNEFWGpr/AoVVKPs8g9twF0Y0OB1djY8QYFo/nLR1qDnKi8hKeqjZucrjAZxN7lqJcKQPjYyb2wlNiNBSt872pyRtjttkwFWl8sLy/PcTjsHghiUHm53Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10467.eurprd04.prod.outlook.com (2603:10a6:102:44e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 18:34:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 18:34:13 +0000
Date: Thu, 10 Sep 2026 14:34:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	meaganlloyd@linux.microsoft.com, git@amd.com
Subject: Re: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO
 limits
Message-ID: <aqL4HaQ1gjeaJYUQ@lizhi-Precision-Tower-5810>
References: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: CYZPR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:930:8f::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10467:EE_
X-MS-Office365-Filtering-Correlation-Id: 703ed2c1-05f5-43e7-314e-08df0f6a1c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Uztp8Az4smfvMp6FtTJCD737NIJ0BGicE6YQEl49t7Wh+m1qgremanhn1dy+IEIFJRG0zOiOZ4yahYaTAl6foqrwvM548HffH08Skn0ZSfaI/Z3kV4yVw1QH1gCxDYvVqkzMrwEmlm6rHg0SXhhKXRJu42XtzoYf1+kBFSE7hs6/63uKNveoc1p5eGYCK1FiRPDoINhjP9yAl/vcL3nj1GR/ulXq8jPWLyZE2hPhxApRzK2MlnqTqWfcMO3Z/RvryzMf7h0uV8kdN2Jt3B1pPIXmytB0wa3uct21z9hMyvnSB/yY7cOQp0sPFeCgS7xLCq13FJXVI8HeKVum+Y5J4DPSGID2Bht3/tCg2gYUglGuVipz5YgQmY5ClyAYPrsGhHaoh/zVb+JbGFVkQnp8IXbRY4eoNR0ZvQC4xVR6pQIE3Q1vXEVler3TpVJT7+vIP+5iu4YtFKaFglQGOapbLGsL9jiOuwhiJuPAIY0/jTV3+5BaLxjVvFBCVIrv8tPrLX98pKMQ1gDtlskZSM4I/5lpgkDMP2YPbFt0eTgzPA//LcrzetTQakNl25dB68unQx4vIsMoXJq9f8Y8pCnSteR1/K1tP9uCpcPo9hDVRh8D+t8GPWEoWfQvR9mTOCG4fx0NVf2pxG4NgjjToNZTOUGgvygRNX/zMTkxcwyojFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVC8JNrmVpgt+yQ+4W2H6VslSjiehvSGQU87tJSzvSdMdqn4gqrnq9J51V74?=
 =?us-ascii?Q?majzIqYWsXyXYtmt802Axgy5HIK3lR5hutmLi0Y4CVABBjBk3rPZFQURTQm4?=
 =?us-ascii?Q?e1eBNa4NNH/lZ6BrQdrUBY23wvwKaaXqzLSvCmDL1gUxpkGpYZ3ElmtPuK0N?=
 =?us-ascii?Q?W+c4GDH3KwEbOuxRGyBp2cLOaLTpUdOsUrAgvGQC7DWg6XRD/meGvRxRkodi?=
 =?us-ascii?Q?xUVr2O+pohRR30nOBTFqZ7aRUQx4KpEEzsHAMgXe5tEa+DUIEIkgZJFh63i2?=
 =?us-ascii?Q?0hhJrtG6iy7hUR/adclEXFui8ih6otG8YVCkkvQLmLCrIDhsvCyfemrwhAKz?=
 =?us-ascii?Q?pvndGLavXSXltPfQ7YSIdDVwX5xoS+xcqejdNkgq83I6GqeqQEUIZD6QUN6V?=
 =?us-ascii?Q?fhKP2KIpZpDD7qsg7nk5/VAoNUjKrWQdtE4OFhm+6NZhZL7xRekZZxko+Zfm?=
 =?us-ascii?Q?bZv2uNxzWc91bj3TssEdCp3fqWgicsHihxSIBkKQD5W789m3xDzlw4r85OvN?=
 =?us-ascii?Q?1qZecqSAQZQbI9TL5ko5Ef5TfQi3ZMQfcDm6Fz+8uxosmpZ2N+aciybxXCqX?=
 =?us-ascii?Q?O9Xy5m6Am3X/HAg5JSbOImWxqLQ/fSAXA9uxFH6edu1HyMIoxZb+Yi8RbnBx?=
 =?us-ascii?Q?DLbGNvI/34tl8vjs2xFaQl+rvPUB7JdrkMfpuyWKC3V8/xhnsgRkHSoy20C5?=
 =?us-ascii?Q?uEBOC/LexpKcoBTz/dkNlpYsr28Fhi4UAoTd/+2tD1JEIS9gqxqe1gEfSHSJ?=
 =?us-ascii?Q?3RLrVd1uLSQdjatL9aXGd1S44Qtn2MXKmIaxN7LWfz/iEEJD6CnwAIqsHllK?=
 =?us-ascii?Q?wObdZV14NcX5s54SpEZy9Z+3P4922oNUdt7fLw39uSvx28J23KEBwlYDcb0i?=
 =?us-ascii?Q?V4ylp9fLrw3Zi3Dm2jod5SE4fs32g5lo1JL9V+yaJCjZvGFVRNQipOtBkYL3?=
 =?us-ascii?Q?TANCatGunFPEr/+aOI7wyXh4rJirxvZArHhTSmFXksKTM47ZPMxN/gd33hLD?=
 =?us-ascii?Q?EeLL+egZIItllcSNpoToC0OhVfhwFd4gu9X1OmWnntxsFwpOB2xp4Q9vjRwz?=
 =?us-ascii?Q?6iB3R+YqqKj0XUgA0jWPP7uFokd+gYHs+/VwmPiMq1pSH386p/PexQDYzygw?=
 =?us-ascii?Q?zT3UDXdSSjDyfTElXMDa0jXp5CPSC0R4vqIj0UIHU0HHHT07IsvoMzvMv8xY?=
 =?us-ascii?Q?09Kzv85b3XbuO+dbhoYwZ5S9bDxT/AEm4ZD1we1kJRCTHBLmMcSkDqp7psha?=
 =?us-ascii?Q?IKRMFCt2e21f0LZ0ySpAGhZYE0Zjo4tm9IrylBni5YC+R0KoNchGg5CtDk1a?=
 =?us-ascii?Q?LLq4lhanb+hVp633JsCrXAC1oqPnkrvvL6eV3ZejrFAVEQhEGhZcFVd2uX6X?=
 =?us-ascii?Q?7qDSfI0bi43mixgdhFH9hFgQ+tS5+/SZw9zcAsMBK8IeEiOgd+UIvypkPVYu?=
 =?us-ascii?Q?xtQ1xHcYna8qq3YqhMhhU/xeHDYni3smJIXSynj9RYBVo1X96ltiGfgh7OS9?=
 =?us-ascii?Q?Jo/uQ6hT1dZ+mek+aoumUqOKxWhHGrOaCSXMwhbgpjW0j+ECNjnK81rEijH3?=
 =?us-ascii?Q?EjVIHqHwJFXCzhXa0tjArLYVkP0aZPBDeytSw/gwPyZLwjkLEClh1nokwSOo?=
 =?us-ascii?Q?5aRR/zfc3hOgJofjxpGLO2d73UWONuIL+JDNEe6doX5WUUREpXQ9jmpIaSSk?=
 =?us-ascii?Q?+dXuFv/zCdqAFKKdwAkSufdTbCqwEzYhGr1giDJ7zNhlmZ4RD3SAOPZnUyun?=
 =?us-ascii?Q?gnRdm4tElavWlacBblnMCn/ZbaTMTZ9hM74Jvot58pGGW4N6TYc/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703ed2c1-05f5-43e7-314e-08df0f6a1c71
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:34:13.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzBjI9Q0Spv776VqNCXeAo52RSq2wG5VQsmrV2adv9yaS+nqDIyJpSQJBu74FmhN01dcS+9PBr6Grm9Po331LLywR7c7SCL0wyDf/vi3iduO2+z1eMRGyj95vkzALFCb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10467

On Tue, Sep 08, 2026 at 03:57:24PM +0530, Shubham Patil wrote:
> The DW master rejects private SDR transfers larger than
> caps.datafifodepth with -EOPNOTSUPP. Targets often report MRL/MWL
> values larger than that FIFO, so the core stores limits the controller
> cannot meet.
>
> After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
> same target with lengths capped to the data FIFO (in bytes), then
> rewrite the GET payload so the core keeps the same values. Only update
> the GET buffer once SET is acked, so a failed SET does not leave the
> core and the target disagreeing.

I think i3c device driver should know these information choose
min value dring each xfer. even though you set devcie's MRL/MXL, device
driver still issue a longer transfer.

Frank

>
> GETMRL is variable length: the optional third byte is max IBI payload
> and is only present if the target returned it. Clamp that IBI byte to
> the IBI queue depth from QUEUE_SIZE_CAPABILITY.IBI_BUF_SIZE (bits 19:16
> at 0xe8, encoded as 2^(n+1) dwords).
>
> Rename the unused EXTENDED_CAPABILITY macro at 0xe8 to the databook
> name QUEUE_SIZE_CAPABILITY.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 149 ++++++++++++++++++++++++++++-
>  drivers/i3c/master/dw-i3c-master.h |   1 +
>  2 files changed, 149 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 4563d8761ba0..51defcb57761 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -203,7 +203,13 @@
>  #define BUS_IDLE_TIMING			0xd8
>  #define I3C_VER_ID			0xe0
>  #define I3C_VER_TYPE			0xe4
> -#define EXTENDED_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY		0xe8
> +#define QUEUE_SIZE_CAPABILITY_IBI_BUF(x)	(((x) & GENMASK(19, 16)) >> 16)
> +/*
> + * IBI_BUF_SIZE is encoded as 2^(field + 1) dwords: the smallest buffer is
> + * 2 dwords and each increment of the field doubles the depth.
> + */
> +#define QUEUE_SIZE_IBI_BUF_MIN_DWORDS	2
>  #define SLAVE_CONFIG			0xec
>
>  #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> @@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	return ret;
>  }
>
> +/*
> + * Cap the limits a target reported through GETMRL to what this controller can
> + * actually transfer, so the core never asks for a private read the data FIFO
> + * cannot hold. The optional IBI payload byte is capped to the IBI queue depth
> + * instead; since that byte is a u8, the IBI cap only ever applies to
> + * controllers whose IBI queue is smaller than 255 bytes.
> + *
> + * Direct SETMRL is optional, so a target may implement GETMRL and NACK the SET.
> + * Clamp the values handed back to the core either way: a failed SET only means
> + * the target keeps its own larger limit, which is harmless as long as the core
> + * stays within ours.
> + */
> +static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
> +				   struct i3c_ccc_cmd *ccc)
> +{
> +	u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
> +	u32 max_ibi_bytes = master->caps.ibififodepth * sizeof(u32);
> +	u16 actual_len = ccc->dests[0].payload.actual_len;
> +	struct i3c_ccc_cmd_dest set_dest = { };
> +	struct i3c_ccc_cmd set_cmd = { };
> +	struct i3c_ccc_mrl set_mrl;
> +	struct i3c_ccc_mrl *mrl;
> +	bool clamp_ibi = false;
> +	bool clamp_read;
> +	u8 ibi_len = 0;
> +	u16 read_len;
> +	int ret;
> +
> +	/* Need at least the 2-byte max read length field to act on. */
> +	if (actual_len < 2)
> +		return 0;
> +
> +	mrl = ccc->dests[0].payload.data;
> +	read_len = be16_to_cpu(mrl->read_len);
> +	clamp_read = read_len > max_fifo_bytes;
> +
> +	/* Optional third byte is valid only if the target returned it. */
> +	if (actual_len > 2) {
> +		ibi_len = mrl->ibi_len;
> +		clamp_ibi = max_ibi_bytes && ibi_len > max_ibi_bytes;
> +	}
> +
> +	if (!clamp_read && !clamp_ibi)
> +		return 0;
> +
> +	set_mrl.read_len = cpu_to_be16(clamp_read ? max_fifo_bytes : read_len);
> +	if (actual_len > 2)
> +		set_mrl.ibi_len = clamp_ibi ? max_ibi_bytes : ibi_len;
> +
> +	set_dest.addr = ccc->dests[0].addr;
> +	set_dest.payload.data = &set_mrl;
> +	set_dest.payload.len = actual_len;
> +
> +	set_cmd.rnw = 0;
> +	set_cmd.id = I3C_CCC_SETMRL(false);
> +	set_cmd.ndests = 1;
> +	set_cmd.dests = &set_dest;
> +
> +	ret = dw_i3c_ccc_set(master, &set_cmd);
> +	if (ret)
> +		dev_dbg(&master->base.dev,
> +			"SETMRL not accepted by target: %d\n", ret);
> +
> +	if (clamp_read) {
> +		mrl->read_len = cpu_to_be16(max_fifo_bytes);
> +		dev_dbg(&master->base.dev,
> +			"clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
> +			read_len, max_fifo_bytes);
> +	}
> +	if (clamp_ibi) {
> +		mrl->ibi_len = max_ibi_bytes;
> +		dev_dbg(&master->base.dev,
> +			"clamped target IBI len from %u to %u bytes (IBI buffer limit)\n",
> +			ibi_len, max_ibi_bytes);
> +	}
> +
> +	return 0;
> +}
> +
> +/* Same contract as dw_i3c_master_clamp_mrl(), for the write direction. */
> +static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
> +				   struct i3c_ccc_cmd *ccc)
> +{
> +	u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
> +	struct i3c_ccc_cmd_dest set_dest = { };
> +	struct i3c_ccc_cmd set_cmd = { };
> +	struct i3c_ccc_mwl set_mwl;
> +	struct i3c_ccc_mwl *mwl;
> +	u16 write_len;
> +	int ret;
> +
> +	if (ccc->dests[0].payload.actual_len < 2)
> +		return 0;
> +
> +	mwl = ccc->dests[0].payload.data;
> +	write_len = be16_to_cpu(mwl->len);
> +
> +	if (write_len <= max_fifo_bytes)
> +		return 0;
> +
> +	set_mwl.len = cpu_to_be16(max_fifo_bytes);
> +
> +	set_dest.addr = ccc->dests[0].addr;
> +	set_dest.payload.data = &set_mwl;
> +	set_dest.payload.len = sizeof(set_mwl);
> +
> +	set_cmd.rnw = 0;
> +	set_cmd.id = I3C_CCC_SETMWL(false);
> +	set_cmd.ndests = 1;
> +	set_cmd.dests = &set_dest;
> +
> +	ret = dw_i3c_ccc_set(master, &set_cmd);
> +	if (ret)
> +		dev_dbg(&master->base.dev,
> +			"SETMWL not accepted by target: %d\n", ret);
> +
> +	mwl->len = cpu_to_be16(max_fifo_bytes);
> +	dev_dbg(&master->base.dev,
> +		"clamped target MWL from %u to %u bytes (FIFO depth limit)\n",
> +		write_len, max_fifo_bytes);
> +
> +	return 0;
> +}
> +
>  static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  				      struct i3c_ccc_cmd *ccc)
>  {
> @@ -866,6 +996,18 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  	else
>  		ret = dw_i3c_ccc_set(master, ccc);
>
> +	/*
> +	 * Clamp GETMRL/GETMWL responses to the data FIFO depth, and the
> +	 * optional GETMRL IBI byte to the IBI queue depth. The GET itself has
> +	 * already succeeded, so its result is never overridden here.
> +	 */
> +	if (!ret && ccc->rnw) {
> +		if (ccc->id == I3C_CCC_GETMRL)
> +			dw_i3c_master_clamp_mrl(master, ccc);
> +		else if (ccc->id == I3C_CCC_GETMWL)
> +			dw_i3c_master_clamp_mwl(master, ccc);
> +	}
> +
>  	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>  }
> @@ -1728,6 +1870,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
>  	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
>
> +	/* Read the IBI data buffer size advertised by the controller. */
> +	ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
> +	master->caps.ibififodepth = QUEUE_SIZE_IBI_BUF_MIN_DWORDS <<
> +				    QUEUE_SIZE_CAPABILITY_IBI_BUF(ret);
> +
>  	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>  	master->datstartaddr = ret;
>  	master->maxdevs = ret >> 16;
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index 17ad817d1f8e..54c3912374c8 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -15,6 +15,7 @@
>  struct dw_i3c_master_caps {
>  	u8 cmdfifodepth;
>  	u8 datafifodepth;
> +	u32 ibififodepth;
>  };
>
>  struct dw_i3c_dat_entry {
> --
> 2.34.1
>
