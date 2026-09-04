Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC63C276B;
	Fri,  4 Sep 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551561; cv=fail; b=sF2ArOEy+UrPqN+JkYSx0YbyL3Ij0gc4TfAWXiei8P8CiC3TYnBdRBDWVAV2h6AHq3176Stikead/pMo8tALBuMs+VmDAyydeeji/Ppq56XGwLTU65XYlMtNmk7NScSrRywKGlUkJ5Xb+ACWlkqe7xO49BI6q3Z2ILZt54fMwc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551561; c=relaxed/simple;
	bh=T3vBycGF/uD7VQuOJjYX5DwREqX0qCua+O4QsaRuobo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T+/+pMANhHy18TxT1GQVlC+aCHdXmxuZzmr+UQQdJyZTAVXBVG+AS+ja4+wfsVu2RPcuaCq1akZa+q9kRUo+so6Zh/Rf//Boa+f9se8F94OwkpmoQ2aklEKkF6D9x1eWekc1GOoNuqNKHfpipcX+8A/vu7h35ahtVR4KRcJDbLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X5uvPJUz; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X5uvPJUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIBql8clI2GNM5pdtpfTfCvyCkx6LzT/hlZ0/QOLBLfnZe+4CSM7djynE4syg8AaLx8y8E3nPhPgscKWvcrwr0baG19rafeOma7MzzA13cyjCDLkDmedOscJPTdvc1T7RTngt0rc6sTsco6FqcvfKvw/CTzit4eyCIYX3p3d9s4m1DHqvaoVIe8LnyIYC4lC5qu9+FFnXGpNw2jyswBTI84e+u0g6xdH3UsvnC5xM0RSAZgtv5XXxIL78mPyntOE95IN/f24cQc3vrIGyx+4ubKjtwffpomD5s215wEG9HZ/6pI5em8WI7IkenqHj5wREC1tUswLmDsySbKuLAL8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F0gYvn+x6z8o0NG6EaW6f1jR26vAAlK7zT7DZJQQpU=;
 b=uVRLROslCRLae+lHkEjtt7w+0UvEq6dDMLWrT2kTkAxZrV8Bwqi6x6g25fGAVCyAkY6piGmExEj0yKoy4i7fszqj5jE4/k4HOIlNg5vCJkI7QEz9G4nmb6wZcWO5QNC6VhIvee7Quk1XK0TBFW7qH6XXEuxgNhAph8ZEJxe6VfrkQu5vYTC9gF9+RFcOjOwaCMeSp0sfwXrLC/f5F2YRkCkzncN/m1qZ3q3b/tGP/JjtDWXLUekqqXCt6YBdex5M/4MY5vk4eVqAI/H+pD/AWGJrx3g3Qh/98KGL4cujU9MXOKzrJ/7gGgTwxoGuw6TS2pD7F4LrXBsRgy5wxfTJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6F0gYvn+x6z8o0NG6EaW6f1jR26vAAlK7zT7DZJQQpU=;
 b=X5uvPJUzEcmMVCPG1DulumSE9dcWp2Kyf7ziQ3jjdvhbTAAsUwvhVYUrDNt8SQwSrzITdzNs8CwVuVzAzjbZKdmEUFFzWWRkXr3l+syfsE2sDu2q01EXjlpqtcmkqiHBjtWBsjc6j0omb44pji96Ge2tAVpF/oZGv1ADo6rHW5TLIeGTOod1NKlMMBP9eaymGltAZhzX8Scrv5B1BCfIESheBI95yBWdpa8DK51XRx7QbOmsdfH0MZ1kn0zrMWyg4bEplVirjkqG8ljdKN4wneoyE3Lt4eWLdzcYhPQXjA01Ll+eLnAjwS0AyOpLjlp9gDYcbN17fEAQctd01836gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV4PR04MB11896.eurprd04.prod.outlook.com (2603:10a6:150:2ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:52:31 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 19:52:31 +0000
Date: Fri, 4 Sep 2026 15:52:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v18 2/8] i3c: master: Add controller-only device
 operation helpers
Message-ID: <apshbUUOVH83-UhQ@lizhi-Precision-Tower-5810>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903062108.2712296-3-lakshay.piplani@nxp.com>
X-ClientProxiedBy: CY5PR14CA0013.namprd14.prod.outlook.com
 (2603:10b6:930:2::23) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV4PR04MB11896:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af95ea6-d28d-4b30-2e77-08df0abe0cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|19092799006|366016|10067099003|6133799003|4143699003|56012099006|5023799004|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	UNdyrqjzHA09s6TWex1jDvlhBUBmVKdMdqc1jqmwEhKllJqWlStA3eRXpI9k4xR/Kk8GWKRiftbE6Kepov24E65LRvxsJ3gG7xi1HnQE2EUek8Io6fNM3oKti0u482hk/HtJPZvMfeSWCwxfb4EIIsw1CxfTHRvUrGquWbcUGXhyodFK82qPBdF+0zPcXuhHAE/trxKlOXZhK+KhIX8NkEw9SPdO2s7QTI92iq0fuS6L8fjkjYe0kRhqT1+VhBNLaESWSCdu5hPbvZ/pIUMfnDjpLSmtduR4maP+GLVtgJwoYvk28kMQPpPwNmPLLH5uKJri1MlAFnpLgTIpuQhhxQ/80135nCDfeTme5rBegogGEqOMGxtZarfpRhXSNDigi52Zu9qwdVOw7XgslxqoaqqVXyHqlVhB5ETfOe2etiHKUSsgZpGJUOEUNsEfW3fIVGywbE+2UyDuZivSLf0021fl00MDYbvAKTy4UE+f1MSRiHQh6wuDpQDxuoN2tkhHwyha19+alRRskx2BNRCJhGIPjujotG5eQym+pjiISVMNtIssDqQ1T4AzlY29zDWHrycBK04Ooji3f2+MC4zrwhJaSGtX8h+Zju3K/jwho8zVJiH0zfK0tjlbGrfM24RPCcjr/lk83eGvTT2QQuwptO3kl7GKhN9roM/GkcUb2oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(19092799006)(366016)(10067099003)(6133799003)(4143699003)(56012099006)(5023799004)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2NmoHGpkllPR/h+Z5N24hqT8YYDC/5z83PaCvMjYdbicmcjMu+sUuNyWYeyn?=
 =?us-ascii?Q?dPrgr7KXhqjHUAlWrdHAIlEasrSdT65MtYxpcNeGCknr2awd8KIVscqrrV3S?=
 =?us-ascii?Q?MsjhF3rptXEsFSz6dZjgqWc9lhCLuXoo5nmYiW/ojKriCOXYuayl9jxrR0z0?=
 =?us-ascii?Q?Wq3zvopSkN4+xHWI+mphOB4UYgiynsRF1/alB/rBhMJZ5E+j1vhTm9LH7WKa?=
 =?us-ascii?Q?kRZsrv7qBIsZgnI1LNXW21kIkhIcuvVnYH0gewKaVreQjCitp+t8XxMlgvAd?=
 =?us-ascii?Q?lCOhJDwhpJuYWVp8doRqpeho6U333W4vUxgZ6jPGVyhXC87hz93/iPegAkJZ?=
 =?us-ascii?Q?YHqkip763DIPWqqoFttM00+aX3xGOIruiV972gsYbk5Q6OknHQmeVcdyVBsl?=
 =?us-ascii?Q?sdlrACU8jHgqFwUCr3aapSNAK+PQa6Xnpd6MCXkcBTUedIaKNMuHcSh2HddV?=
 =?us-ascii?Q?4oHhq2rWcERNzc7e9iqbLq8+utTw9EcXwjT7hhyki6MFobmQroBwhiJRgm5n?=
 =?us-ascii?Q?vioG8gCnJF2tzv8ucm/R9BQQeawlVodPtNyJskGlTjfwoIUCjsLrnbf1OAgy?=
 =?us-ascii?Q?KxbF+Fof2J2Q6EGhkNZ7/m+zxJWf3zNd9ZGDbd0KTB6zsja0zG7M2DFdU2Qp?=
 =?us-ascii?Q?obij2JJKGooyuRUZwzLRila1zMQIBswXdnO/XPNJhhJj5fjR1hW5IrL4AzwG?=
 =?us-ascii?Q?Y/rvSYgUgtBpHZGcm6TTMY6Z+JfWjWDFq1w10usBwATQ3c9qbfK6ULCm1Ac3?=
 =?us-ascii?Q?9wPTrPZ+BfcpC8hM8B38xdOA7kFgOT1ak30GAJsdmELoUjgvtgUPdl+YYRyd?=
 =?us-ascii?Q?U7Qr9tFvdmhyqO2eihJB7MrbK2coTBHgLpqt7+PjBkRjas6l3nmsmUrg5qVX?=
 =?us-ascii?Q?lVAmaFp30h+D5C/L+jYSytDMleBhMGWfNh3TpcEKNTNJkhdHSXZDBDEeoPGr?=
 =?us-ascii?Q?EwARJP1pSOc0DfPnuOgGHgKzLHVEuWNPLRjO8uSWczbe9VK2pKKlmxJtNj0Q?=
 =?us-ascii?Q?5+xOGWky1gFJNI+57/ZFSaeyjlsh1B5jdDYCqC5mqeJ6j70d7DOxcBiaIoL1?=
 =?us-ascii?Q?uK9LV6KXIWegg7zG0Lm1G4WD6RMTAhJ8T5nzCagChs3CV6I8MzxmUrHfJKWj?=
 =?us-ascii?Q?YAmMlabM9nPQCOMop1YqiL9xsij4AV3hjaLgNieZlnp0QoRTdhcxz/F2E5zj?=
 =?us-ascii?Q?Bj2s2Wv9iZP/zi1Un3aZTf8qqGkdTFyyoJBRN9rseh2Jqf1PjQBu2EXn5CmO?=
 =?us-ascii?Q?OhfkGnNPmYKzmIcmxcSyD+3UMtxScTZxEqTvjnRSVQtWURFRNGoeCEruAYcP?=
 =?us-ascii?Q?DaWFZ4zKvsgWI11Xg4tygsqmspeum3bd2unIr6v2Iv17ImGdKBpU84d749M4?=
 =?us-ascii?Q?IN4Hm7BX1tpczXYcOvcVGqN/zPQD5UFNxSCwoGlt9Z8hGn2oThpzgfHFnbN5?=
 =?us-ascii?Q?Yu1IV+I19XRyum9c+nrVrxMl4dbFQnEeQjuhX/6LUFGgzN4GL8neZBDpmPd/?=
 =?us-ascii?Q?K/z+zZb/TfxSfvY/ieL9FfgbmiZEgl8WQlr3mMyWHYGTL84LYO6vYEMGO5AU?=
 =?us-ascii?Q?Fy9dltBHZpUw3GolZaAddmCU9Li2RMjcf5dlbPUO4fSwxDoAo1IYXhmHRCzN?=
 =?us-ascii?Q?Omz1UA2VtcLJhJIe5kJZQoYcYgM3QJy1MXjtkYRtLj/KMQlUzfzuznkYXpWX?=
 =?us-ascii?Q?mjhogIxBCzprSWteO8EKE/98vPLF976hbGEnjFvYhOI71AQWelltsiza58jD?=
 =?us-ascii?Q?8cFKamtdQPtdRRi0GxM2lbLdQO/2CFLFYyqw0N3oHKv+Iu7dQqfV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af95ea6-d28d-4b30-2e77-08df0abe0cde
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:52:31.1658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mapJgwZU1pq/2eQ6nTjEtfuHNjkvk2M2EMPk1K0jDAalrGdkL1ozOoxZMmwTAHCaSMkQCvk1OYZUtAeLdkTcH8E+X/ly0M3B53ysVvrhUy8X4aumcIEEidLFPp96+H3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11896

On Thu, Sep 03, 2026 at 11:51:02AM +0530, Lakshay Piplani wrote:
> The generic I3C device attach and IBI paths perform both core-level
> bookkeeping and controller-specific operations. An I3C hub, however,
> maintains a logical device descriptor on the virtual downstream bus and
> a separate parent-facing descriptor used by the physical parent
> controller.
>
> Add controller-only helpers that invoke the controller callbacks
> without updating the bus device list, address-slot state, or generic IBI
> lifecycle. This allows the hub framework to keep the logical descriptor
> associated with the virtual controller while using a permanent
> parent-facing descriptor for operations handled by the physical
> controller.
>
> Add helpers for:
>   - attaching, reattaching, and detaching a device from a controller;
>   - requesting and freeing controller IBI resources;
>   - enabling and disabling IBIs at the controller;
>   - recycling controller IBI slots.
>
> Refactor the existing generic core paths to use these helpers, keeping
> the current behaviour unchanged for regular I3C devices.
>
> Also release the generic IBI workqueue and state when the controller
> request callback fails.
>
> The helpers are declared in the I3C internal header because they are
> intended for use by the generic I3C hub framework rather than by
> individual controller drivers.
>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v18:
>  - Rebased onto v7.3-rc1; no intended driver behaviour changes
>
> Changes in v17:
>  - Document the calling context of i3c_dev_recycle_ibi_slot_controller():
>    it runs in workqueue context without the bus lock held, while the
>    controller owns and synchronizes its IBI pool
>  - Retain the request_ibi capability check to preserve the pre-series
>    behaviour for regular I3C devices
>
> Changes in v16:
>  - Rename the controller-only device helpers with a "_locked" suffix to make
>    the locking contract explicit (caller must hold the parent bus lock)
>  - Route i3c_master_handle_ibi() through i3c_dev_recycle_ibi_slot_controller()
>    instead of calling master->ops->recycle_ibi_slot() directly
>  - Destroy the generic IBI workqueue when the controller request_ibi()
>    callback fails, avoiding a workqueue leak on the request error path
>
> Changes in v15:
>  - Rework the patch to introduce controller-only attach, reattach and detach
>    helpers for use by the I3C hub core
>  - Add controller-only helpers for requesting, freeing, enabling, disabling
>    and recycling IBI resources
> ---
> ---
>  drivers/i3c/internals.h |  14 +++
>  drivers/i3c/master.c    | 239 +++++++++++++++++++++++++++++++++++-----
>  2 files changed, 225 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86a36b951e0d..416c37e2f75a 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -22,6 +22,20 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev,
>  			    struct i3c_xfer *xfers,
>  			    int nxfers, enum i3c_xfer_mode mode);
> +
> +int i3c_master_attach_i3c_dev_controller_locked(struct i3c_dev_desc *dev);
> +int i3c_master_reattach_i3c_dev_controller_locked(struct i3c_dev_desc *dev,
> +						  u8 old_dyn_addr);
> +void i3c_master_detach_i3c_dev_controller_locked(struct i3c_dev_desc *dev);
> +
> +int i3c_dev_disable_ibi_controller_locked(struct i3c_dev_desc *dev);
> +int i3c_dev_enable_ibi_controller_locked(struct i3c_dev_desc *dev);
> +int i3c_dev_request_ibi_controller_locked(struct i3c_dev_desc *dev,
> +					  const struct i3c_ibi_setup *req);
> +void i3c_dev_free_ibi_controller_locked(struct i3c_dev_desc *dev);
> +void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
> +					 struct i3c_ibi_slot *slot);
> +
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9ea4726495ff..b864fcbb1a59 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1898,6 +1898,30 @@ static int i3c_master_get_i3c_addrs(struct i3c_dev_desc *dev)
>  	return -EBUSY;
>  }
>
> +/**
> + * i3c_master_attach_i3c_dev_controller_locked() - Attach device state to
> + *						   controller
> + * @dev: I3C device descriptor
> + *
> + * Invoke the current controller's attach callback without changing address
> + * slot state or adding the device to the controller's device list.
> + *
> + * Context: The caller must hold the bus lock.
> + *
> + * Return: 0 on success, or a negative error code returned by the controller.
> + */
> +int i3c_master_attach_i3c_dev_controller_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	/* Do not attach the master device itself. */
> +	if (master->this != dev && master->ops->attach_i3c_dev)
> +		return master->ops->attach_i3c_dev(dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_attach_i3c_dev_controller_locked);
> +
>  static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  				     struct i3c_dev_desc *dev)
>  {
> @@ -1915,12 +1939,10 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  		return ret;
>
>  	/* Do not attach the master device itself. */
> -	if (master->this != dev && master->ops->attach_i3c_dev) {
> -		ret = master->ops->attach_i3c_dev(dev);
> -		if (ret) {
> -			i3c_master_put_i3c_addrs(dev);
> -			return ret;
> -		}
> +	ret = i3c_master_attach_i3c_dev_controller_locked(dev);
> +	if (ret) {
> +		i3c_master_put_i3c_addrs(dev);
> +		return ret;
>  	}
>
>  	list_add_tail(&dev->common.node, &master->bus.devs.i3c);
> @@ -1928,6 +1950,31 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> +/**
> + * i3c_master_reattach_i3c_dev_controller_locked() - Reattach controller
> + *						     device state
> + * @dev: I3C device descriptor
> + * @old_dyn_addr: Previous dynamic address
> + *
> + * Invoke the current controller's reattach callback without modifying the
> + * controller's address-slot state.
> + *
> + * Context: The caller must hold the bus lock.
> + *
> + * Return: 0 on success, or a negative error code returned by the controller.
> + */
> +int i3c_master_reattach_i3c_dev_controller_locked(struct i3c_dev_desc *dev,
> +						  u8 old_dyn_addr)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (master->ops->reattach_i3c_dev)
> +		return master->ops->reattach_i3c_dev(dev, old_dyn_addr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_controller_locked);
> +
>  /**
>   * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
>   * @dev: I3C device descriptor to reattach
> @@ -1958,25 +2005,39 @@ int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
>  						     I3C_ADDR_SLOT_FREE);
>  	}
>
> -	if (master->ops->reattach_i3c_dev) {
> -		ret = master->ops->reattach_i3c_dev(dev, old_dyn_addr);
> -		if (ret) {
> -			i3c_master_put_i3c_addrs(dev);
> -			return ret;
> -		}
> +	ret = i3c_master_reattach_i3c_dev_controller_locked(dev, old_dyn_addr);
> +	if (ret) {
> +		i3c_master_put_i3c_addrs(dev);
> +		return ret;
>  	}
>
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_locked);
>
> -static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +/**
> + * i3c_master_detach_i3c_dev_controller_locked() - Detach device state from
> + *						   controller
> + * @dev: I3C device descriptor
> + *
> + * Invoke the current controller's detach callback without releasing address
> + * slots or removing the device from the controller's device list.
> + *
> + * Context: The caller must hold the bus lock.
> + */
> +void i3c_master_detach_i3c_dev_controller_locked(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>
>  	/* Do not detach the master device itself. */
>  	if (master->this != dev && master->ops->detach_i3c_dev)
>  		master->ops->detach_i3c_dev(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_detach_i3c_dev_controller_locked);
> +
> +static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	i3c_master_detach_i3c_dev_controller_locked(dev);
>
>  	i3c_master_put_i3c_addrs(dev);
>  	list_del(&dev->common.node);
> @@ -3520,7 +3581,6 @@ static void i3c_master_handle_ibi(struct work_struct *work)
>  	struct i3c_ibi_slot *slot = container_of(work, struct i3c_ibi_slot,
>  						 work);
>  	struct i3c_dev_desc *dev = slot->dev;
> -	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	struct i3c_ibi_payload payload;
>
>  	payload.data = slot->data;
> @@ -3529,7 +3589,7 @@ static void i3c_master_handle_ibi(struct work_struct *work)
>  	if (dev->dev)
>  		dev->ibi->handler(dev->dev, &payload);
>
> -	master->ops->recycle_ibi_slot(dev, slot);
> +	i3c_dev_recycle_ibi_slot_controller(dev, slot);
>  	if (atomic_dec_and_test(&dev->ibi->pending_ibis))
>  		complete(&dev->ibi->all_ibis_handled);
>  }
> @@ -3640,6 +3700,29 @@ i3c_generic_ibi_alloc_pool(struct i3c_dev_desc *dev,
>  }
>  EXPORT_SYMBOL_GPL(i3c_generic_ibi_alloc_pool);
>
> +/**
> + * i3c_dev_recycle_ibi_slot_controller() - Recycle an IBI slot through
> + *					   the current controller
> + * @dev: I3C device descriptor
> + * @slot: IBI slot to recycle
> + *
> + * Invoke the current controller's IBI slot recycling callback.
> + *
> + * Context: Called from the generic IBI work handler in workqueue context.
> + * No bus lock is taken here: the controller owns its IBI pool and is
> + * responsible for synchronizing access to it. The generic pool
> + * implementation uses its own spinlock.
> + */
> +void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
> +					 struct i3c_ibi_slot *slot)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (master->ops->recycle_ibi_slot)
> +		master->ops->recycle_ibi_slot(dev, slot);
> +}
> +EXPORT_SYMBOL_GPL(i3c_dev_recycle_ibi_slot_controller);
> +
>  /**
>   * i3c_generic_ibi_get_free_slot() - Get a free slot from a generic IBI pool
>   * @pool: the pool to query an IBI slot on
> @@ -3951,6 +4034,32 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>  }
>  EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
>
> +/**
> + * i3c_dev_disable_ibi_controller_locked() - Disable IBI in the controller
> + * @dev: I3C device descriptor
> + *
> + * Invoke the current controller's IBI disable callback without waiting for
> + * pending IBIs or updating the generic IBI enabled state.
> + *
> + * Context: The caller must serialize access to @dev->ibi and the generic
> + * IBI lifecycle.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int i3c_dev_disable_ibi_controller_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (!dev->ibi)
> +		return -EINVAL;
> +
> +	if (!master->ops->disable_ibi)
> +		return -EOPNOTSUPP;
> +
> +	return master->ops->disable_ibi(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_controller_locked);
> +
>  /**
>   * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
>   * @dev: device on which IBIs should be disabled
> @@ -3963,14 +4072,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
>   */
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  {
> -	struct i3c_master_controller *master;
>  	int ret;
>
> -	if (!dev->ibi)
> -		return -EINVAL;
> -
> -	master = i3c_dev_get_master(dev);
> -	ret = master->ops->disable_ibi(dev);
> +	ret = i3c_dev_disable_ibi_controller_locked(dev);
>  	if (ret)
>  		return ret;
>
> @@ -3984,6 +4088,32 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
>  }
>  EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
>
> +/**
> + * i3c_dev_enable_ibi_controller_locked() - Enable controller IBI resources
> + * @dev: I3C device descriptor
> + *
> + * Invoke the current controller's IBI enable callback without updating the
> + * generic IBI enabled state.
> + *
> + * Context: The caller must serialize access to @dev->ibi and the generic
> + * IBI lifecycle.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int i3c_dev_enable_ibi_controller_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (!dev->ibi)
> +		return -EINVAL;
> +
> +	if (!master->ops->enable_ibi)
> +		return -EOPNOTSUPP;
> +
> +	return master->ops->enable_ibi(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_controller_locked);
> +
>  /**
>   * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
>   * @dev: device on which IBIs should be enabled
> @@ -4000,13 +4130,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
>   */
>  int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>  {
> -	struct i3c_master_controller *master = i3c_dev_get_master(dev);
>  	int ret;
>
> -	if (!dev->ibi)
> -		return -EINVAL;
> -
> -	ret = master->ops->enable_ibi(dev);
> +	ret = i3c_dev_enable_ibi_controller_locked(dev);
>  	if (!ret)
>  		dev->ibi->enabled = true;
>
> @@ -4014,6 +4140,35 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
>  }
>  EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
>
> +/**
> + * i3c_dev_request_ibi_controller_locked() - Request controller IBI resources
> + * @dev: I3C device descriptor
> + * @req: IBI setup request
> + *
> + * Invoke the current controller's IBI request callback without allocating the
> + * generic IBI object or workqueue. The caller must ensure that @dev->ibi has
> + * already been initialized.
> + *
> + * Context: The caller must serialize access to @dev->ibi and the generic
> + * IBI lifecycle.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int i3c_dev_request_ibi_controller_locked(struct i3c_dev_desc *dev,
> +					  const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (!dev->ibi)
> +		return -EINVAL;
> +
> +	if (!master->ops->request_ibi)
> +		return -EOPNOTSUPP;
> +
> +	return master->ops->request_ibi(dev, req);
> +}
> +EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_controller_locked);
> +
>  /**
>   * i3c_dev_request_ibi_locked() - Request an IBI
>   * @dev: device for which we should enable IBIs
> @@ -4056,8 +4211,15 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  	ibi->num_slots = req->num_slots;
>
>  	dev->ibi = ibi;
> -	ret = master->ops->request_ibi(dev, req);
> +	ret = i3c_dev_request_ibi_controller_locked(dev, req);
>  	if (ret) {
> +		/*
> +		 * The controller request callback failed, so tear down the
> +		 * workqueue allocated above before freeing the IBI object.
> +		 * This is the owner of the workqueue, so it must destroy it
> +		 * here to avoid leaking it on the error path.
> +		 */
> +		destroy_workqueue(ibi->wq);
>  		kfree(ibi);
>  		dev->ibi = NULL;
>  	}
> @@ -4066,6 +4228,27 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  }
>  EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
>
> +/**
> + * i3c_dev_free_ibi_controller_locked() - Free controller IBI resources
> + * @dev: I3C device descriptor
> + *
> + * Invoke the current controller's IBI free callback without destroying the
> + * generic IBI workqueue or freeing @dev->ibi.
> + *
> + * Context: The caller must serialize access to @dev->ibi and the generic
> + * IBI lifecycle.
> + */
> +void i3c_dev_free_ibi_controller_locked(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +
> +	if (!dev->ibi)
> +		return;
> +
> +	master->ops->free_ibi(dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_controller_locked);
> +
>  /**
>   * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
>   * @dev: device on which you want to release IBI resources
> @@ -4096,7 +4279,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
>
> -	master->ops->free_ibi(dev);
> +	i3c_dev_free_ibi_controller_locked(dev);
>
>  	if (dev->ibi->wq) {
>  		destroy_workqueue(dev->ibi->wq);
> --
> 2.25.1
>
