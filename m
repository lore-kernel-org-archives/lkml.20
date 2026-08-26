Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06B47140B;
	Wed, 26 Aug 2026 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762575; cv=fail; b=EAI0YPdJTJMGBbq1wrazL06iNPi6d5gU1aSejtNXk+nmIXKRWcGFSYvEjenT+sKzlkIor6dkS2JUYtHAvLPmIGFXSaUlLkYPCN9FGJy7afYH44QcwOM3wVWP/Wdw4P7dXyqH7lRfSjHgbfA+//v4I2n1G9sASAfOppBYxEOz1Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762575; c=relaxed/simple;
	bh=ogSMMvxo5uMbBTFmrFN6AsIm3428dApvgojTW+VJvp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hFbqCYCqnOGDo0p69yHkaDLtoK2K33RYF9Rw06urSHJ5AlUCcSEA4U4Nqggi4/5uPnoAtPd16mPOohq5kqNqSbPoWT+aETMIeGg+WlmtNdZQX9lnlDzc76ntRB6SMiHJlpQmifoNkm1geNX6gzOUiRd18S1dgDU9rNAyrnzxWGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vr8pj0GR; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vr8pj0GR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vejRYoelz5kTcyswbRgCIFEh/DfXp2ZhbXCT7CiZ5ZqkXu4tvPOktVALTQpIX5dFNNfjAomwz6aqJ2VzPAkAaBNE6Dz8HZu5GshwRLHyaTqKjumOWnSDF+qGjLjPms/nNC3bqZWxeOmfkBFBe6k7R2dhG1h3xRY3oTG/gPVHJ7HqYn1xB3ep4CB+0mZ2wdF9fkQ+CzO7Vk0pe2mqHy0+6u5D2PYolLhl7gZ/7h16FrnQdkDkJxB4Kh2c6uZQuh7pfbHjA6wr263PlCAbqdEIvpXn3vI3gA/pLE35XdGXkAXe1n+0GLftcLsHc3x0g5Y+gVUZcJHd85e5MOLeQfgHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L5O+tx27yNK/hhObOtqszWrXZ28lMo7My4Jb2hRTyE=;
 b=d1TVJr2s9UK8QqNgIjf00h8TmlGsmnakzhjMdOS5zdavXGDDpeXGnexTD5Yc28MDM/S3IqcW7VCw+4tUmSGF2rUo9JMB5k+yxYgsH1QsWdYsixyFtLUbQxmAU9io5zi090FnVZvtpm31zEvRShXXE4r+j1h7GIsVjfGQB9gY4jIpufJMVUiqzbTm+050BFTxzqCVnNxd4W2magiaHpo2f0Z8Kn/Lo+IMaQvgMfwSC24v1t3CrGaZDAcjgseDMEKWHvAiqnp/eUgDa06vmHNgR6UQ+EnwPALs60l6Et4qttAUF83qUlKUVk0luYE16fwA6xhGO+eqD31QGuOORaQz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L5O+tx27yNK/hhObOtqszWrXZ28lMo7My4Jb2hRTyE=;
 b=vr8pj0GRJvfZhUcQ3LyJ2whyf21Ppmuz9WSWa9aJM/onOMJwNEnHJwbxO31fau4WZDKYBwVdyvNPey2kAQrOmjk3097UwIm4Y7qdI250wTjNMdeUvzB8X1Q+xKETiu+FQ5XmNOqWUkdnBkTiz/9Wr5jfz28KaPyDgIyzyVCdROeZQ+Og7Xw7+TTvDalRCp7FmCS0o2urpkZAMz4/pcPRdUjMumxKeKdjmGW971Pd4FKyJHDwgw2VqbnTrZTUISPWQCvKawh+TJhElnzxHR5SFmoNVmHCzdIQy2X3jDAWthInDF6Lts3F9M18zWAW2FLqODKHSuRwxwKe1Oyjn2zdLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by PAXPR04MB9569.eurprd04.prod.outlook.com
 (2603:10a6:102:24c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 16:42:13 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:42:13 +0000
Date: Wed, 26 Aug 2026 12:42:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v16 2/8] i3c: master: Add controller-only device
 operation helpers
Message-ID: <ao8XXagBAhl6zANu@lizhi-Precision-Tower-5810>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826103819.1614843-3-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SA9PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:806:a7::6) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|PAXPR04MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e9715b-af7c-4172-d809-08df0390fac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|6133799003|11063799006|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L84o62rfLq2GjZ5/n4XwWsTTxzLK37TlZsXQ3wskD4UmlyU7PcahJW0wY2UGu5Q8teoptLb47AZ/Fvq9Ut60l6aPmjcenaDRLJty8T9cKBy6N+jddApD5vXTRVga11+53KqBjPG+p6CZszEPu6PE7G7CO6LLxFutHIwkLIFleQO6b4PFFLOxBxCjFDOHgBeToQaFeDLKwaMNNLJfG8cndv4E62nPrnZhYItf+OrHI9828RO88nRyi2wD7g1P5Jh3c6WIceFuJpxZ7vtM9PMsPdEffp0cNaYQaGzuFi8UTGxlKqVqdrnUT6omut4E+PrPqo6nY3Harrge/wbvexqB4XB7ZifLmEyDg5gKKbimXgn1uJbBmOhSi8XB0JpsnXHIEZ6vOYVOxhLCtx6YSthqLTgVfOrrkEk1WGMM0vz6acSqWhc8IBUPSeEoFlQ2pclnFeW90zEw4GSDv90xAFNgXYUfLV15p+2NdX1B99CZ87F/c7lkU+VMU/h8yZ+D5sD0xh1YC5b1mTwwqyXyGO52s3hBpIUkVbvD7A5U2O/RIYVghxhqYH8GVL4vS+4iEPnQIRKJQlpbaJBjTW2EP3zyT1r11cqltjxOuJrY8ibS3blxjHPO+/S4Ra9CV8lzRm+IWsFJ+gDJJ/9259K5TZdPJbnZnQkvtPTbBQh/KCBkNX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mp/vrEmMjH/ydf59KdcWftIKIOkOuapTVo1NNYWzIB1zWC0z0V4FeVgzNoZI?=
 =?us-ascii?Q?7yjwPhaYT3OrPFB3i/Gz6GTJ5EKM98FgYn3dvgBmP5umweViYj1Ht+wdd/pB?=
 =?us-ascii?Q?PSPOYdLYIrpMYntqQteYXRINw1e+raGhHytxQQds2y932+OjGYsRkB0WYSYb?=
 =?us-ascii?Q?ngWZ5gNW/sdSl+EL+g2luObOul4D9+PiNONsfSonbjpp33pomgWPsV6y6HHw?=
 =?us-ascii?Q?hJ31HL8qwyPTPwwOe44TcXwzqVs6dqcPc4SaMVOjREG5Qcxtby0KGPsr85lm?=
 =?us-ascii?Q?vdGlhmUsglLjHcV4YpUZTpM95jg8OBCEIKCAddpz7p+oBBa7kREASbbKnrvl?=
 =?us-ascii?Q?gOsgDhtLCQulH25azF6O9w0cda0zBYh2Mq0qfnEaw1Adv1oJRkAg9zOJfuEm?=
 =?us-ascii?Q?Z9txmXW5m0b2r3bx+ftABB7b2u2/2HFYE+tcuOZ4iEmLX5vX/AphJohFpBnM?=
 =?us-ascii?Q?Lq2lHRxzgTWxbFI8ahCzxhvZ4A0jgWn6kCj1SHrQ0eGiqM2VDecTllpmcReH?=
 =?us-ascii?Q?TInqK3lO4fXJXHgvOF1NobpAqMjTAAukKNbrPw/wYNd30U1yclckQ9XchtQE?=
 =?us-ascii?Q?vNyPl+LOe+AYhCy7CPy0NPFVqavcLmipacoiflHTPwzzpcz1sTzBQcGXsnyG?=
 =?us-ascii?Q?x/MqJi+ZMx44QOi1iWIYYsFE4FaANraVPvHoxLeszh+m9cfv3K3sKHKSn/45?=
 =?us-ascii?Q?FM7YWqpCB7NkFkF6mF4kUxy6QxZBltt9OAYlU5atR5FFWhqAE8a3fxkHw24n?=
 =?us-ascii?Q?+/2wn4RumkQALekJVarBGJTN96LDaAxflFIMDRJx0adS10DJuCIlcw9HAqIQ?=
 =?us-ascii?Q?dldwwWGiPoB2oQhPskLkCh49xQfpNdAnSzpTkxrms34o9s8oMjyQCf4/RtKD?=
 =?us-ascii?Q?m/9TOleYIQXrWYqCaCvdSkmUMxtubcF4ArVxt7jvaNQ8rx/QWmgJwi7gLufh?=
 =?us-ascii?Q?b8QnTEhZOtXOOdEZY7x51UvKltzZj1bnTJvqRonwEzRRDz86es4ZjEWUJcEy?=
 =?us-ascii?Q?PgBDuSV7Yl5F1NnCbdITDIX2iHYluGqh5/gW9Y8h94IDJ5pl2OWgulg0M02a?=
 =?us-ascii?Q?jF03VUPdFh3zyusTYnGtmzX2f2BEdfBp+xRF6EnH4nGmNXYl7MPlG0tSFkeS?=
 =?us-ascii?Q?3Co3iS2i9o+bvQ05cD+WCNFl4skSRsL0Sh+5Wot5Domp588np8TJ03pEoNjv?=
 =?us-ascii?Q?Gp0pE6PZ5CAZzIpsweiRU160239VBCjqa37+CMnNRl9z7zBx78bp9QkSvqMM?=
 =?us-ascii?Q?nGfZSMGwjvjUtBuPeJJIqFnqexXPd35kAreQkg/BF8Py9zycNHrWuF9EXv+f?=
 =?us-ascii?Q?acMmSYU39BbmUiEM99o0JbVIuF4CC/Cs8DgHA86rWq9jdWe2zTIiKEEM6gG5?=
 =?us-ascii?Q?O+wSkwqCp2UGJZrV5gwK747nAJP+wXZyZ7ubgy2pBOvzr5EHrUJw9yrG3wv0?=
 =?us-ascii?Q?cDwBh/+DerhDQkMNekh+QSGfihhy0oeys6MuHpqf2BGaqsU2sT6DScVPULfu?=
 =?us-ascii?Q?4nYQmDj3UsIgUhEPmq+OwVmVlwZvgKyTKow/OTvYwhpPJA/UOoik/TyY+pcL?=
 =?us-ascii?Q?66oL7p5UIBwIjAhOQtMxXFz9lkf1MuGiUmC6aPbvxlKJb1//5vy53deJvULM?=
 =?us-ascii?Q?iKg1D9OGwP2SRfzKqwHWKFIBMrNTQoK7o49xNcnfThjripkZwCH2dgzTsFm8?=
 =?us-ascii?Q?JJDHDCHg5O5RIHIxZ3tD7AOnCimtGxXl26UdB3AQKMAYmXGU2QWObp/L7kfY?=
 =?us-ascii?Q?uSuagRxF3DH3Yp5oNo4XX8xWwbrechg6NyWlGDh8GFNFFV80vkQU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e9715b-af7c-4172-d809-08df0390fac3
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:42:12.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnzAfofe4ji2RTtkDTD3CLhIoq9a7eNUqv9Wf0NZO619L6O7yBOZKvRaefK9fSxp5Pw/v4YlQFiqjIMKljQIm3JzAE3IYLFC6mZh7xp78KUDeXmSBURpVRu798kykvdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9569

On Wed, Aug 26, 2026 at 04:08:13PM +0530, Lakshay Piplani wrote:
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
> ---
...
>
> +/**
> + * i3c_dev_recycle_ibi_slot_controller() - Recycle an IBI slot through
> + *					   the current controller
> + * @dev: I3C device descriptor
> + * @slot: IBI slot to recycle
> + *
> + * Invoke the current controller's IBI slot recycling callback.
> + *
> + * The controller is responsible for synchronizing access to its IBI pool.
> + */
> +void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
> +					 struct i3c_ibi_slot *slot)

does this one need hold lock?

Frank
