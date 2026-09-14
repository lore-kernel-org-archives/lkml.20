Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A35388E44
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410385; cv=fail; b=GhPSiS39qF409krKvs7Ovf+ebZjYk5/9v1dxltLxvrQtbs0TVgUjjEMgL8lzlpZHEAyA8gE5Ndn7Pr3eJekFWgfoctpMaRowDAAGkRYO1gRfybNwL+r5lM61uTDuWgDS2pWaTdZGCLcqHXMvIaAwbuPG3PvC0WUm0DobDNa63Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410385; c=relaxed/simple;
	bh=Wvyqb4dzVYHy4Sl9mQYc97zSK+khRs6Jcwka8bNNcGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OThjdSmHySFgPsbDz2ITib7fIixuYvEioG6LOY9kGHbJfrHq8H5XGeAE9o4/BnY9Y76+5NhAXDR+xCHoMMLtfgmX2DhRbdEBi/FEintBanMp+odp4FvjL/8GV6cX4+mB79AwmaXyteC81bKh1r0hCVoyqM4OQ2SvgwjP5+QgJww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FEZa7cqa; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FEZa7cqa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN5cHh24rdzvjGuXkIq0hN0jPyHJul3Fc14p4Y1JtFMN1q7z8iGZDx6MI3IldzR8KjnoI+ubIkGEmUxNsox9aVMgR/xldyL5aWhGUhTiRJ0RxA0rEnkmR/fHrFxcS5saHXfqWGTZYUeEFe+AY8Nnw3A2qPXIN/+GUnDuLLXH/DRISOAueQblltFQ/JPZoyk77lOhibGFrborsr7HWGqZtnLdVITZNTDxc2uVnJgHclxgZbMqvEyuZbSCQfaPhB3C8357pe8nXMQfyMuIulXsSRu7CJxX2d/jMlCRrWbFPetQq4RovM5Z1G3AwhyDr26pDmT5sOZeonjFOGkwSzEGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rswoEnTEuLMMhKnkI+uacAOz/6gWJeA2odmbYwGzq7c=;
 b=QASh7XV+pIEfwNTaPa1a+cgBZwlzHr3l3LhMxwVmIPqJAbWLCB9/PiBiiPPuMB8NBzs3CR4SUHxYplkbrjyGwZl6Y4PRD+ABDZ5Q1mW5mVLoiRuHYlUpcMX4qaBYtICAgRuv5DZUPCcd+vZeKz2wzF1Yw88jwt0R/kHAP1j2DNTRMSvY+aWztEbVTejl/NSUF8u5ZwGPwW1Gd2MRuzMIoLS3zdVURlRqTEH2rrkfrXwyM0J6J+cKgzybfgq71uncsyc3pb7f1mKtendxHkj+Em1VTpv9TwyjUzSetd0nui76Yib4OYZERa9hB4035GiBuO3YiIjpriL2r7vWmF/gSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rswoEnTEuLMMhKnkI+uacAOz/6gWJeA2odmbYwGzq7c=;
 b=FEZa7cqa1dw2uCBliTWfGEcunonAqwyX/XdcB3gOTWKEVO+rnJQnmbYccyRRgM3wd6n4t9R6vrxsSghjkuGHUyyyozhAli5BfnMm037AQ1xuRk4ovU253z7Ra5IkyPlEeJhRxB6OQhznpAKOb2op0mBy7vopN3LNxHFnRHmeqXtROi5pO0dKZwtxukSrz/crmmNsVkgwTEFm8RPl7IxmHpTZYSobx7It3h90tJ8ocTsygkBR4dtsNRC4nO2cTm4ZXvuoq4x6zERg1rLPPxeTCUn5xx+HGZv0XNC968NNORhQIdcG7fEZex583+/sutWYw0R5DbtOf1OJTNfGGpYb4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 14 Sep
 2026 18:26:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:26:19 +0000
Date: Mon, 14 Sep 2026 14:26:12 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/17] i3c: Restrict HDR modes to those supported by the
 bus and target
Message-ID: <aqg8RL7KHiYDOXMM@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-17-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-17-adrian.hunter@intel.com>
X-ClientProxiedBy: CYZPR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:930:a2::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9597b2-cfe6-4f1f-d9e6-08df128dabbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|3023799007|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jF2AaP5nCSo0pfiUVgoBWlG1SYKBp4SkIh0Vf4fKE/RgK4KdDzCTt1ZtjDyJ7EItEHNyi2iWY5P9N9r1HE75RHNgNEivCxq032x9JglFuUSiR7cKXFk805zHb4HFncN0bCJtuebPuf/Z9hmm5hH//F+C/HVxVCfI0qXYIquYCbGXmQazcucfkVMa1cyW6SAHoyjVSnxh3ofx8y3XVGMWvAq4Y0EvZBDBwQ112degvOzlBt1L1n7gOKFnJYDm4zRvqfozw0ybejIzEi/s+e4S/5/EyiU8RVz0E+cq4X5OT+baRbtgxGbu0i4M3NAvBgILXTHdQJF9FK3p27r6LPdseghAeGjTWPvUBXwtdcaDCUYfSwScQ4pJych8K1DC0oHoOTvaRm4XcHRpqLiG7F8tPlw7Sm0lGZLv2eZ4m61FgyiKoxvYyHb5OV2Z5i04xTwhgOWtOVy+VaWXlIzXP13PhJk95uv3DoV1G93uxb6jwkNrHhB/WfiqjYtTV8T3TLAvBv59e/67uEbXU7ix0cVltmzbuaxkKhPe7OS7yiv8Nw2eFF0EbS+7k7lf8sZF1i1HtYPTLW8h4XYZ/NGdP/oS6Ihgj4ViiLrIx3PPlsdq81sVksVq3w21w5T5BEpNqUyU9o/ayO2IdXVEXvI5LeO+WyiTbDTkJCPFkpOySCyy+Rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(3023799007)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EfWJkDawFUpbTHW/wpglR8KWeePN5uX4gOwwZddzy84PiZmKhcqv1hLbacC?=
 =?us-ascii?Q?XtLxeV7nC5ro2tCTAfy3rqhLDE4SS+5kZVNmkmGP2jzBpOBQUl3ZYTFkof3k?=
 =?us-ascii?Q?O1/MYqOhdXBm+o0YbtagwwBOOjqYQFQPcA1PkJQidoXeojrhteTa+mcV6zcm?=
 =?us-ascii?Q?GzS+TJ3NibNyCUysxj0qNL6s4EbB4jxtIma17FbaqMbfGVgFa5PcggwLNIZa?=
 =?us-ascii?Q?QMI8qKgDiyMMu2KWUBI0pdBBzA0jErBPLKY8tYD3gclMkqp4agUS32OufVaI?=
 =?us-ascii?Q?wZL5dHfzozeDq3fj2ChiU1RJH2Vb6rNlCuENMQogBg3gBxlcp3gi+op9CKul?=
 =?us-ascii?Q?L4TMHYIp+yGM4u7Zv/dv76MSq7p2Tv5/NpjQ+WN1OIUq0tMX5HcJ/U9aDyk/?=
 =?us-ascii?Q?jafaW5wwKR5hjdeFdNrxDhuOza/nqlHieW3fL8KZh4vSZn9jFNdtX3QYHWf4?=
 =?us-ascii?Q?SJJYNn4q/zIDQ/cadX6gcUud9XBLPWahJTQoDgxeZKr3d98wM/VCTXwZ2TBp?=
 =?us-ascii?Q?695OkUvpFQJIx3HQMz9/SkimUkSrMpNL74cpfCjgOwHnsP92Mugjtf1unNN1?=
 =?us-ascii?Q?NYxzO4WC27qrkb1rTHzybJj8LD5/5c3Vqv5efCYc9p5PvB4ykLHgcI8id2fP?=
 =?us-ascii?Q?841B+6cO6208FIvTx6cFD9qhPXFnQjvFs7l7WKZRaptcp4XxuBJyIicnhIau?=
 =?us-ascii?Q?0LvwM4B8MuyupYTryXboONOqFpqy+PCTwaNJdh974fGrZHqTDwBrW6nZTVTx?=
 =?us-ascii?Q?hkZaeBuw3LC4oVeDjePoycI6595CyCq4F8aT6DtZQQTCbLKtTqm8kdSv6++V?=
 =?us-ascii?Q?5fv8GcXv+IH/MLTwHoe/KqlgpD9QcjYfCn3zVzJXafqe2WpJ9/pLGLU+dXXj?=
 =?us-ascii?Q?+9HBQuEU/1PkM8BqcK2DYSVxjlHorHh6yh4u8TK0r7pZDD0PGLcvtvDJpZAM?=
 =?us-ascii?Q?/+8jAmNrEfgJcCUW7vXR6qfzOqCyXN5KXeB1WdsNX0hV1M9GySV18W797nD0?=
 =?us-ascii?Q?mFtVdNf1rnc4dXaY4CfflkA6MnCYi/w1VHpQNuCAjWCZtmCTAvmW9/1K2g51?=
 =?us-ascii?Q?yGNNH6h9yA+mO0wGIOMk8ES5glV0ySkJe5f6U61SEUG6xwTcRuRClN6IXqtx?=
 =?us-ascii?Q?7FCJmlVIG45jOW6pdISgYW0Q0JS1BjalKtAsPZ4UEYcvdqDazQhcLoPcOMuA?=
 =?us-ascii?Q?BSM9N4gtafzh/cCtwQAtSPInqB35vI+1OvjlYrj06v4BkS4crHNjiY65Syua?=
 =?us-ascii?Q?45fJztwPCsPZfIWZI+5eYLQ6vejbeUc9XaVa+Mzad6QgPgxVplzr/GwgJXAU?=
 =?us-ascii?Q?gOS9iZVOcFQgnsaaE6dIkRmyblOb2pUddGODza/faxUAwM+GXdtt/fa2yEXP?=
 =?us-ascii?Q?HocyVM40n2ixg3gSEF1Lqhcoxudfh+BF/JglxpfP6bUWM/0IGs2X0kRIMQje?=
 =?us-ascii?Q?Y5hXw5XP1cihhHlUb7PnwVicuR30hvx0RnJQ4qxJv39NoPMUDtvd/EZMiRMp?=
 =?us-ascii?Q?6ohlp7HCQyHAtzGmK9x07zAKcIL8xwPQTPng98kXcmiRwUWUsLeGXCbdI5Za?=
 =?us-ascii?Q?X9pNnQOrK6lTmz+MTpyUMbtrHNora1YVgoqkhIn+rKup4Vn0Icq5L9JNCmwJ?=
 =?us-ascii?Q?0UsZwJFbOZ3L+GT8jSiPfLl5Zrb0PLoJDw0MNn7sKPpDgkQJ7cKj+j1Rno0k?=
 =?us-ascii?Q?hGrpU+ZwDPWiQx6niw6/sf49wjn+iOzxNs2YLtlrOWJVj3ZpnPktOdRrYoNI?=
 =?us-ascii?Q?s5zzlsT9fff7HpGVrSGkGjTrAWONhud4hXG9Jsv7YYUKN0WKq6aM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9597b2-cfe6-4f1f-d9e6-08df128dabbc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 18:26:19.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jixx8OgT0UQsmYB6EPqOMZRO4YiSp4X3wVP+CUsB3qMFgwAe7+8eFi2TUQHddWn/howcIuM62f+1LCeTmYXg+KCtXpPCLWPpqMiJR+L6Hpga7SaVBFm/EzPT2WLLKPPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877

On Mon, Sep 14, 2026 at 02:30:02PM +0300, Adrian Hunter wrote:
> I3C v1.1.1 Table 9 defines which HDR Modes are permitted for each Bus
> Configuration.  A Mixed Slow / Limited Bus permits no HDR Modes because
> Legacy I2C Devices without a 50 ns SCL spike filter cannot be shielded
> from HDR traffic.  A Mixed Fast Bus permits HDR-DDR and HDR-TSL, but not
> HDR-TSP, since of the two Ternary Modes only HDR-TSL is defined for a Bus
> that also has Legacy I2C Devices.
>
> However, both i3c_device_get_supported_xfer_mode() and the transfer
> validation in i3c_dev_do_xfers_locked() currently consider only the
> controller's hdr_cap.  Since hdr_cap reflects controller capability
> rather than bus or target constraints, HDR Modes can be advertised and
> used even when the bus configuration forbids them.  Likewise, HDR Modes
> unsupported by the target may be reported as available.
>
> Add i3c_dev_supported_xfer_modes_locked(), which derives the usable
> transfer modes from the intersection of:
>
>   - HDR Modes supported by the controller
>   - HDR Modes allowed by the bus configuration
>   - HDR Modes supported by the target
>
> Use this helper both when reporting supported transfer modes and when
> validating transfers, ensuring that the advertised and permitted modes
> remain consistent.
>
> GETHDRCAP is queried only when I3C_BCR_HDR_CAP is set, so a target
> without that bit is treated as supporting no HDR Modes.
>
> i3c_device_get_supported_xfer_mode() now takes the normal-use bus lock
> in order to access the device descriptor, matching
> i3c_device_get_info().
>
> Also fix the kernel-doc reference to enum i3c_xfer_mode.
>
> Fixes: 256a21743d91 ("i3c: Add HDR API support")
> Assisted-by: GitHub-Copilot:claude-opus-5
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/device.c    | 15 ++++++++---
>  drivers/i3c/internals.h |  2 ++
>  drivers/i3c/master.c    | 57 ++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 69 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index f1ba363b22a1..4df4682af150 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -301,16 +301,23 @@ i3c_device_match_id(struct i3c_device *i3cdev,
>  EXPORT_SYMBOL_GPL(i3c_device_match_id);
>
>  /**
> - * i3c_device_get_supported_xfer_mode - Returns the supported transfer mode by
> - *					connected master controller.
> + * i3c_device_get_supported_xfer_mode - Returns the transfer modes supported by
> + *					the connected master controller and @dev,
> + *					and allowed by the bus configuration.
>   * @dev: I3C device
>   *
>   * Return: a bit mask, which supported transfer mode, bit position is defined at
> - *	   enum i3c_hdr_mode
> + *	   enum i3c_xfer_mode
>   */
>  u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
>  {
> -	return i3c_bus_to_i3c_master(dev->bus)->this->info.hdr_cap | BIT(I3C_SDR);
> +	u32 modes;
> +
> +	i3c_bus_normaluse_lock(dev->bus);
> +	modes = i3c_dev_supported_xfer_modes_locked(dev->desc);
> +	i3c_bus_normaluse_unlock(dev->bus);
> +
> +	return modes;
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_get_supported_xfer_mode);
>
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86a36b951e0d..9a6936e2c660 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -18,6 +18,8 @@ bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>
> +u32 i3c_dev_supported_xfer_modes_locked(struct i3c_dev_desc *dev);
> +
>  int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev,
>  			    struct i3c_xfer *xfers,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 4296c51a9537..c8093708807c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -938,6 +938,61 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  	return 0;
>  }
>
> +/*
> + * I3C v1.1.1 Section 5.1.2.4 Table 9 lists the HDR Modes each Bus
> + * Configuration allows.  A Mixed Slow / Limited Bus has Legacy I2C Devices
> + * without a 50 ns spike filter, so there is no way to hide any HDR Mode from
> + * them.  Of the two Ternary Modes, only HDR-TSL is defined for a Bus that
> + * also has Legacy I2C Devices; HDR-TSP is defined for a Pure Bus.
> + */
> +static u32 i3c_bus_hdr_modes(struct i3c_bus *bus)
> +{
> +	switch (bus->mode) {
> +	case I3C_BUS_MODE_PURE:
> +		return BIT(I3C_HDR_DDR) | BIT(I3C_HDR_TSP) | BIT(I3C_HDR_TSL);
> +	case I3C_BUS_MODE_MIXED_FAST:
> +		return BIT(I3C_HDR_DDR) | BIT(I3C_HDR_TSL);
> +	case I3C_BUS_MODE_MIXED_LIMITED:
> +	case I3C_BUS_MODE_MIXED_SLOW:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 i3c_dev_hdr_modes(struct i3c_dev_desc *dev)
> +{
> +	if (!(dev->info.bcr & I3C_BCR_HDR_CAP))
> +		return 0;
> +
> +	return dev->info.hdr_cap;
> +}
> +
> +/**
> + * i3c_dev_supported_xfer_modes_locked() - Get the transfer modes usable with a
> + *					   device
> + * @dev: I3C device descriptor
> + *
> + * The HDR Modes the controller and @dev both support, restricted to those the
> + * bus configuration allows.  SDR is always supported.
> + *
> + * The bus lock must be held in normal use mode.
> + *
> + * Return: a bit mask of &enum i3c_xfer_mode values.
> + */
> +u32 i3c_dev_supported_xfer_modes_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	/*
> +	 * master->this->info.bcr is ignored because it describes the master's
> +	 * target capability, not its controller capability.
> +	 */
> +	return (master->this->info.hdr_cap &
> +		i3c_bus_hdr_modes(&master->bus) &
> +		i3c_dev_hdr_modes(dev)) | BIT(I3C_SDR);
> +}
> +
>  static struct i3c_master_controller *
>  i2c_adapter_to_i3c_master(struct i2c_adapter *adap)
>  {
> @@ -3856,7 +3911,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>  	if (!master || !xfers)
>  		return -EINVAL;
>
> -	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
> +	if (mode != I3C_SDR && !(i3c_dev_supported_xfer_modes_locked(dev) & BIT(mode)))
>  		return -EOPNOTSUPP;
>
>  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
> --
> 2.53.0
>
