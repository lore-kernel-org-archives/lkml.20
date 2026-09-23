Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE573D9029
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181379; cv=fail; b=kiZT+NSbJ88RgUDQd1nBJOFTYiHyqLNNK6j8Lu+G6ITqI9lfBHOt12JXnGHwL0KjZSbonAEdJZLjy59c2yd+FecI5/XVPtqzBEwFbOqwK5cNu3ZAoKC7jqIulRUlQEbu/bMNjAaUVrlVZN0Jrmq9mI7MPAsa+lDJuNHkRToR56s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181379; c=relaxed/simple;
	bh=Wsp4dq78nJHFZxl57iXIYYNwoVypMX1h8l2m1bxhkq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aRdveCBrlAR1mg9JF8UDc7DUVID+wrXgXqOiwVegqNkBg4Yd2K0MaRwri5Ikzi5cISddX3L9C0orzR9FNZHodLmow43/RD1k+mKZ/81j9z8Huren3czTwOLTVnULtcGs0eYJyKaHxPRZ8PoWe3dGsqjfzBvRYAUAPJ2THz/nawU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DjLyjlhD; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DjLyjlhD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT5wGHRT6b1xP4qH+zdyspI/RWyEbt3QGti+dUNPypXLUTFGMlNmMWDWICXqb26lzb2sxBgNWllevwUqBD7WIJB0dwJc0yoyOEBqeJsNDrTmiYqXz2q+RBfWrud0ldan2NUSvrxzIhbG733iRYG90Hrz0SrB8X3hoP6XCQG5ESvWI01IC+c9TPbjGAQoGZ0oTpU+7/iDrp6emVqoD8miSVvckHUxerniRtu/VTUkJRdblTvsYGE7bqi8oPs2cr3nqJ170FXHfJXqybofiRzDRUQf4p2E6RXlYwg6YvldWltTfZWG9Q5tN4C4iMTHUc8lgG13IjOIU+OGlGAJWJfd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n28+ha5zJZebYhyo/KSxV6PcfEI00ANTl9R3+6sIKB4=;
 b=asXTGlOFsPtu+S4Z0c8mWexBakJFkgCOfY0msLbZhJX+wF+lcIQjR97qSXSxlR52rc8KTcMJqjZ03jQU/FQpbJwZPmy8vDDyCSpE6uKOJRlimcgUVlLZ3JB7azzGbDk3k2tL7IuZagmG4KlDl9qVuvn50ZALHSsht3AOp6adrWJ3QIK3eBNQ1IO9cAzJv0yW5iaaD/n4k49VAoU84WN8Q8Ql7cf6eZITm99CwRM5LuisyaBmUr/DTu5R5nLfXnMgsI9Jn36TrefY9UJyoClyHg1Oj5mcWy5YXAzAdQHCrTT91/iSw3ztgVQPbfdB8cCV1d3X4pnGiGCV1Wv3z6h2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n28+ha5zJZebYhyo/KSxV6PcfEI00ANTl9R3+6sIKB4=;
 b=DjLyjlhDu8HVkMq0e36hR5tQgk77NLanKlayYuGOcYRD6BPgDJy02BthFE5vcjTBErmO/V8E/sZWrxj/dLeYoUeRiko0GZlTd7OakpqGU0eom5k79w/Xwlps/dNUiegHhDdjg2WEtuB7fNviaHuIEXs4/HzzbNe2tic48kIzYgXK45eCzv5uA0Jr4nDlR5G9RipuYn66/JC79yADtRMjqgwSU+xTGjj6JjbvddR4tvN3QQGOq0ZzcG9/QdwFGjU6L/pgAGk/o0NTWLhW4kLs2W91osJtb48q7mT0u8QM2x2yAXqQ+dU7sh9YVF/ZRe8vO0EXm3vHOSvNcebWeZi30Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10503.eurprd04.prod.outlook.com (2603:10a6:102:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 16:36:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 16:36:08 +0000
Date: Wed, 23 Sep 2026 12:36:01 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: use named initializers for acpi_device_id
Message-ID: <arP_8VZZZq9yHyt2@lizhi-Precision-Tower-5810>
References: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
X-ClientProxiedBy: CYZPR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:930:8c::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe04340-3bae-40a9-1b53-08df1990c4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SQyGiJXfzSPRsG9ej21OB5JvvF1Y+gt7MhYF5vUgW5MhjnXYDizmUPcKb8YQMeNAQ0hlykAwLIudifNW1OAz3+K4RK6IL8S5rkv24GHdRcCeT0o3eSZD6/tO0dBm0oBEj3mgrlL4ptMEznlThPhnKBEgjuLUATQfwRFx7JXVo64QDoB1wQdCHJzarvr7emRIQyGPoXwFPcfheogwOIJDEKyJws/3ynvl98rVPqp0iIGuLSfJGphYjSESmYM1dokvW+SEzFSQGuW99G90rPDxQp7lNqHUFPj37AIx+rpE0YvFoqTOowJPAR3SaIcF9s7gZtoI0TxM1SUsTnbMJ1cYNOsvys9rzEANaoQXKet3B0UV9uPc5uqGmmrq8YX03Kt5q2wxo5CQYXk9e75YVA8ndVIjO5WEVjy3vr3nEL5AFfyJS3LaUckaNnrKgD/iPft+M77NbC94CKpwaTSjwbfiHCW8jcmy2j1K0CNBGn9uNDqJLtK+c5LdStuHQRxXy/xSAQ7QvPKqlemtzkizKp41tE7L3lDaGOyvrG+jDfMRMvhp2QkanxDNfNhAyp/fnbB+DSMQKMLOy1xt6V9uuzH+OjtvzqH7ta6DblgdObffCZVTHfrC+1xyA+Do30W6xdGM4fEyg0yElV0ufhJy7GECrM+0ahLVSMK9qpmoxrUx55o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TCfsZdgLHZr2Q4MTDUGbeq9PYfVDI/5qADefX1E+rtEig0b+G0w6BB9AVfY4?=
 =?us-ascii?Q?FTT0PO2+R7e5WM2CVyX+6uBX8MxW9QlEbztrwkKS0z0QwGNLicHCdUjdRrM2?=
 =?us-ascii?Q?F2lvltNs+r+P25jS/ThB0/1Ml6rQyU2ligCR55mOltPib6zV9W+Wj3Dh/v/d?=
 =?us-ascii?Q?VRqr+0kJarNVjaWtI/oaEqMO57WpWUbHwxr2W4gRzkcUUmMsnODmwg7/YQcc?=
 =?us-ascii?Q?w/tekXoqZTeQtUQGUF83LvKqIj/yJvp3ntcLIamT6LgVL73vqiDhIXW7FZqn?=
 =?us-ascii?Q?az+WznZqRe5bbNhj3WJM8WiGyIUeo19/Mq5U7CcuMc+99J5oYVFP9cFY/QZj?=
 =?us-ascii?Q?GVUkWIgPgHVtWqLnmbW3/TJbuPXZQSHgQglDLTHhlH0o0a/C2/bw4QkD8RCK?=
 =?us-ascii?Q?8bjlHWY7f/uNwLJW8RZlcKgl0kyd8cd14U2QG8hpprUhDv0rnr9JqPHOd6oP?=
 =?us-ascii?Q?TJL0G18oLtDd0sIsr2ST2ordOpLql42sSZ53gZ6vx/KDTXoP77cKQeSXRHYU?=
 =?us-ascii?Q?Tp5BwG+CQIAYH1QD8psQ+QMf44l2rTak4jky9EkIMWtkFRPg2duKepNeOJWr?=
 =?us-ascii?Q?i68lgKIhph9D53YH+73SSj0fVo2Nr3XnrLykiK+FJtfFtS5zIOMgW0a3U7tc?=
 =?us-ascii?Q?+iQ1WFGazH5KpeEcmlQADHIwJVvZ31zTYOfwjWFypz2SjBb6wcPbhCvQnfUK?=
 =?us-ascii?Q?HzUrKjzIItLW2YNv8XqdeOSc2fHzF2Es1zdpKqPQzDZoolCefX8hLadhm5Jq?=
 =?us-ascii?Q?80Yq084XompISZd5H4fyHW28l/OtXPkJblz5I2g6cPxqStrnxzjdFoVj+p0n?=
 =?us-ascii?Q?Y3VGbskJrbRs9NStDmWzBw7iqwDhk5mrlAyCbeLKR3EJ3jwhxFYBmbj+tFp5?=
 =?us-ascii?Q?1gvgw2GHSbAEm9EW83bxnIv3QnV20Lpoj2xaGfWfKUw1nJvw1N8pJL+xdg9O?=
 =?us-ascii?Q?v2oWBjo3XpeOOq+aOA7gKh8rOKq7noiOpdT99zEG0duoNRWCZv92gga1pSwB?=
 =?us-ascii?Q?lp4upp9pVUpECg0/99iRLltSeOIiWI7tcQwq3xqGTPiMhudaayQa1F4Sd4Ky?=
 =?us-ascii?Q?CVe4Q/jPeEowKD5j3Md2Sga81QV6lKeTEu4ovUH+Fo9RBnfU74oSTmI8zG//?=
 =?us-ascii?Q?uZ5JcHGAmdQ+WfRM3j5uiLfbZiC7ncCAevpjDp9qmWOW64vbK3XNJz06XGqe?=
 =?us-ascii?Q?AT4dMJFBpeizxeVfWx38YJkWSQyOe2/szVPHbbc9b6vLJFfFy0LrJ8sqkcde?=
 =?us-ascii?Q?UKbfBMWF+nWXNCuSbRFfDRAV4uqk+nUmWC8/4/V2TYnjtb7BKkxKyVvtayL7?=
 =?us-ascii?Q?3gB0gN3VOvO0O5Yoise7xorNTStha0e5+hYu6/BjwHMbuhHgKynKDeJajlBf?=
 =?us-ascii?Q?kSEiYxrfs9eFVjIIIv6ADdR9IKjTXIo352xIjaoqw25hIBT6xQqbH/uBsE+Q?=
 =?us-ascii?Q?qDWHf0s1NbWAL5zKEgczOjjTUEQjF3T5jrB9MKEgCIFRQSa/dyqO9T8XUA4s?=
 =?us-ascii?Q?UuScZaU326112k6lR4GpjzENye7I1g8QitdmZRUZhq7KY16DEnKkgcUAxfAP?=
 =?us-ascii?Q?8R+P3Wo0gefCKwLf1CajV6AE3IgOUiGtZnJy+JONngOerebNIUYr8TpUketZ?=
 =?us-ascii?Q?muUCKPArEWv2KK0AgrUQAv4mNyqSbO+j46yf+rk1ERgP3ojbV0B9mVjCYUJt?=
 =?us-ascii?Q?rsE+zFhFXXFh0pnnYQSS1lnuDkuPkVeLsQ0lthFQWxmDeL6FE14CiwjWG12d?=
 =?us-ascii?Q?9lAIHGTQP5SduOwmKsCwf+h8F2+38gNFRXT21OIAF7bQOQFH04B0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe04340-3bae-40a9-1b53-08df1990c4de
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:36:08.1001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bEkNqwU8FQk99979qxC+W1xIZuk2xxqLwNqdFU664IKyq3NdaX7dNC+FYjDRPjCcHl1i29qAgZV2QF2OeoVgaNW6tZ5ztCTYMNTdlisXwmTTizjIeWmTXRMaQ8QHAAo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10503

On Wed, Sep 23, 2026 at 04:47:05PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.
>
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
>
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
>
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
>
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member
>
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
>
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc4.
>
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> ---
>  drivers/i3c/master/dw-i3c-master.c     | 4 ++--
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 4563d8761ba0..05584ddaf104 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1934,8 +1934,8 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
>
>  static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
> -	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
> -	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
> +	{ .id = "AMDI0015", .driver_data = AMD_I3C_OD_PP_TIMING },
> +	{ .id = "NVDA2018", .driver_data = DW_I3C_ACPI_SKIP_CLK_RST },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dadf049bd4b5..5b8d84d0106e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1205,8 +1205,10 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
>
>  static const struct acpi_device_id i3c_hci_acpi_match[] = {
> -	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | HCI_QUIRK_RESP_BUF_THLD },
> -	{}
> +	{ .id = "AMDI5017",
> +	  .driver_data = HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> +					 HCI_QUIRK_RESP_BUF_THLD },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
>
> ---
> base-commit: fe2ec83746e501645709761605c2464a44fd2929
> change-id: 20260923-acpi-i3c-4cc518a8e77b
>
> Best regards,
> --
> Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
>
