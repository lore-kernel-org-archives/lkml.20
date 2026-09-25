Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152734C9DF0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349939; cv=fail; b=ACaenfg0iL3xyQCRe2WaoopChk0H6UObdnxNmEm833bviR6PBPRuPwZXsURv1LP/WRb9iz7TPSIykI46BkeLJNJGkxyG1g53CqhiaSQwsmY739f+dltZNZvWfyn3sJsZe6hpqq4yJuG7YrROSjOhRLbNfIu4rKqCyjTddot0FZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349939; c=relaxed/simple;
	bh=nAF13aonUCO5KGm3utqVsyqhwcVAqSU4uoJX64iQAVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DT5Kl5Y4/OMZaHKrudEBzxwfsbwi0p9tBMcAHqBGw2l36ffibZBlgvg2YTpJuWrZvyJrEYBkEmjp7zcfPcQAZG/jo+cX9lVcq+RlGEMjHCaNOMykDjaIwednSgq9FOR6dvodyuAhDQxw5nw/j2ojC5IAeK9HzAbUOEVcvRtZjhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C2GA2hxe; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C2GA2hxe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/u5lnk0GG4/0HLBAOSNYgoMztVSfMXTQrBxWMUWmTOkPbW4Kdz8tWZrQGnTG9wj9KVlbpAqEGuIsHAdxgJ80Z4wBCNvsCi9DIjNsi+0rWXbfDjnmuvaM+3WFmi0nVrUeAlcHI6GvANX2vPzAnZU8hT1F2uyNt4X39SPA0F2rCYBNap5vUO0hvpcb9OXrufOXuOLmHsM+tk9bcfwe/1ulLyDX0wfqEntnIOC163kGfnPMLfS3NkGSxRCUlLID2WJhN6pkymRgSCBTLHdYQGaCL1ur16S4mqUIdXhZkjlWdkd3V4AMLVgYS5SBQ8T/+jlG3Y3FZESjPQ251uNiHoPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JFMHYrKmN3i/Mkxj9/BoD047VR6N+LzjtEUICAKkTY=;
 b=jqyTiOVgwV0Aep4qMbJl3Z/cW6g4NGB5iM4y8guYMcxB8rYzpcDGHt6BEQvMBO8Nth1Wy81bLSRlB1A3JAnqivPz+2cBroMP8GYWoWEwuQNFmC4oGtbSRqRwpAsFhRuuiUoLC4bYYj8vRE3gquEZSLRDg3vAW89cNwdBF8EchLSUUZ6zprTqssgkeDbJ80n8jdAsB1w4W3Oh75W3aLYnaNh49OQDUFw6kpRuiAlsLkgHLDjX3KIIB/CO1lfRkT4Gyjl+tHiO5nl9f8rx/awiXEt8hpOPfHkndmc/tpzJjcXmv52Ixk2xt/1Bl8YBJTA4StKevOu5yqo0ioc//0XioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JFMHYrKmN3i/Mkxj9/BoD047VR6N+LzjtEUICAKkTY=;
 b=C2GA2hxe1APtxYKPmWgQk2ZjDINWJ3CjGrZriLZZhh350kbzRj0Y4Nq3Fi3Uen3rFgOS7RPgb/PGFceo0svOd8J+dtHVxv7a9qCNdwP8RxpAAd/mbKNIl0g7LbkuLjx0yZNMsWsxjrPsSNP/ZhIaCYPBiCBjOCu9GkKVa1A4l/665/RdRtt91wLO3/jZK4X1v5YTOKGzr8P4nfQ5gNuj2t7WLf4TjG/eiFfKQSDivlW3wJqj82jNxsbpP/azlQ6xRqLJ2vNc3ZEydfwkPwClnwuxlYC1O/W48vFkJG1SfkoV7Up9nxkAAtTYObmFtRTairw2YFYSN5IVvNIFE63bIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11612.eurprd04.prod.outlook.com (2603:10a6:102:512::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:25:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:25:33 +0000
Date: Fri, 25 Sep 2026 11:25:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
Message-ID: <araSUuwTSx0aIuDp@lizhi-Precision-Tower-5810>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921230603.2518652-4-samagazaryan@google.com>
X-ClientProxiedBy: CY5PR15CA0254.namprd15.prod.outlook.com
 (2603:10b6:930:66::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d97c04-3724-49bc-f689-08df1b193226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|3023799007|10067099003|4143699003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	asF+7lZa/Uu2bSwb6EePuuMPeOYrrsYmMdaMTfycGiALqUGVnlUtoMzzy24PFLEjuT2KOKbR3HRjYBkjP8yTpCCLnnjWJR6CswOZ5JmxnmE83/cYPzjq/qR908FpBORVdW55TLSSwMiP9iSOI7xYVgDjVx7cIjGuAE8RmX1S8s2dFZ4g2ZrmOztyD8alelJGxvlJmCKWaV32jy6RAseqOYA2gCktCecEk+P41GAPzKqLk/1GJICPsfevOH+Of7SxcG6jzXVzzc4CbS8jNFWqeUQvENyZJcOC8QSe6Mk/TUY0Se9YTOc6fkXl81APO90dUmD0XwA6KNdWIwWOFPpV/IzR+EcKeZXkWzKkKXus/kO5WbERVOjTndSH721xK0CbtrAn74LLldsSta3Mwv9R9BmiqexofgJuDEbANXFgUwjbzOzu7ycG1mptIgQYb9dIhVj5U+5bOiLqwNg8I9IFdB0gwXvpVgIWHzmXkjHGvYam0LobgDIs/rlLedCGejT02JHtRdS7hgmhkNybHXtTST/7fz427QdCCtM0xiVucNuHt0eH+SHUIndmCYpeOw5Pp5a1gTVzh5enVzuxmnmWf+H5qLxRfSXhCWcKrUBNryV89WLRO3R3wUHJJIlHjRKQAVCiO3ivvLKArctX01Uk1todhHUqxTVqSL323vSkahE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(3023799007)(10067099003)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uJeHHVYNzAu/BIdzuC/U5/l+VuPIyL8L/RIwkIm/J7beNvKO5ojBYbgjvJDJ?=
 =?us-ascii?Q?J/uzdKgBXencNTc2UpaIRZ4XWbaVILcqviFeYPGujzpOJUOk04wIj12X03WA?=
 =?us-ascii?Q?T5IRWDhZvxZ/fkGMjkn/GQQq/SVKmnT72UWDK6aUZ0mhmT6XT8+wvhqlAmlU?=
 =?us-ascii?Q?2MHiDBSefB5YjJ6PbFQyL/7Q47mejYqWDHyKl2ML5Dr+dGGyCkBeSg2kRfX8?=
 =?us-ascii?Q?h4GNXXspa/Ade6W/Cot2a0D8J+ObhzKvV06mRuRFjf76DG/C4SSMFXa0SmTF?=
 =?us-ascii?Q?ujwkb7yLJWpuqjiROx9qXjSotKcV73W1pI8jhLl7LkeLoQFIkAt6sJKwoXCd?=
 =?us-ascii?Q?jAHS5lUPEFSB08DKud1Dyfjdd+FL2L07FyOAr+7/MaPJswKhz+Y1KzF4I+uH?=
 =?us-ascii?Q?HczD19/hjKhuyJVuyN/Ib4ylH+bgXX6/r76zLFmMs0Dh6kLYKL5u7eREUdut?=
 =?us-ascii?Q?tgPzQsuzuRKoVBIAn72JtmGTjCmIOnvsPNl2/vQ2zKhd6jMz1o+SFiuEDXFg?=
 =?us-ascii?Q?czqQaTsBKiO5vrcpI3fNm+OVR414muoEHVtxdohm1VNdb3GAAVWgLGYDOJEm?=
 =?us-ascii?Q?vEACwNuPwlpJ4Efdns0fDRAtr+ND/CBoBnkjhWsYal5ItO8wkMI4qgYzSftv?=
 =?us-ascii?Q?lfhoVtkgEOn/U3bwOVwLe46MzVE6zoP+2uU7COViY1tExx6FpsDdyEJJOJbV?=
 =?us-ascii?Q?Fm+y5xjzglqfhvrSBuLxrrmHAI3ZqA8qRY5050jQkC2rVMRVeUpsAHP/+ZGh?=
 =?us-ascii?Q?H0HYIV5MhbRVqgLmp/fuEaGV7v2gMYUrQiQfDPmSPkHUPfNlSkrn+Acwcdql?=
 =?us-ascii?Q?289cvu8m64UzgMDdxiRnYyW0hfpmoxoUmrHzBMWqRVezE6uGjJeg2PFDgSoD?=
 =?us-ascii?Q?d6lVkT1EOuu7cWn/0vavIx6CBj9cIY5ZMYjnEqXRbU4j25OmAATkDt3Ed/ue?=
 =?us-ascii?Q?m2Ujs1c/Sk3rprYumTZJnVndnz07Q/cqvwdTLlYCOmDUJFQLIpsAcPyKISdF?=
 =?us-ascii?Q?rNU/g2xe7ibsgxWO9MIqOo7jMap05gjbcwMhQDVzFwlCtE5tkKKm+4xY4Muq?=
 =?us-ascii?Q?xSi/m3Hrw5sCr1ERLIIt4WKDLHv2zFxAbIfYjzKn01TfHSPTGAlfTsCGdpyY?=
 =?us-ascii?Q?y4VvrJRpO83G4FbeDtfz14rAd7J6oFLDmaKByF2QmQd9GgXBVL1IALWpM6zA?=
 =?us-ascii?Q?WJaB0BE/5n5E5njAXh6ReOtJBa6X2Ka+LWFJlQZHwm4jEh0abL9PhSHEktal?=
 =?us-ascii?Q?BlSTQGPfP2+YDsLbIdp5JYAScahG+Dw12Q5uDReWSbh4VVFPoS9uT64b+K83?=
 =?us-ascii?Q?sBuPQen5+sQXuqrBVr/E3TorYhFeuSscmjhN1Jex/FsCUv2TLOASGnM0r4rr?=
 =?us-ascii?Q?r5+5einVWQUJ8mwkX6sPSrDEE9+veE7GxcOUj5ijrY3a6hJu74CGlkKT6e40?=
 =?us-ascii?Q?HsIw7C18KupKi8O4AS5IeHcFuZHfI044UWHcR8/E/Qr7/Rnd4NT5utSxRdCY?=
 =?us-ascii?Q?M3w6KHQEty9eePPxGb8Haoi7gDuYWy4F6GhSxOniLuzmIGhTzaXFiqPluVN5?=
 =?us-ascii?Q?jMXPNT5CAxyuDcpgVJd0NmsxxvaArweVJKd2Lgc4AGJ+PXeTCR7B4wBg/qFS?=
 =?us-ascii?Q?2vmv2bT6qyyWer5tmevPGA66+7EC2rWzNr9sxuBjjrsK22D63uzIpcB8Drbq?=
 =?us-ascii?Q?UwEdfIk/5uKKwAssm+n8rs496wsZSVdsnQFyiswzkcnDYwPsLnYxwctYQaZy?=
 =?us-ascii?Q?OAy5lgxrm/uWEJIjKF+LYmj7ju+tXim6gzFt9N8pUa0PgJqVLrvp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d97c04-3724-49bc-f689-08df1b193226
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:25:33.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx3nRnlsyrRkbLoKDCWFNYvbEIna2AZ2gd2KmHkGFdCqtbU8otot0JYqFeRAY2J2e+9wPu2RPFIJ2DPu0K9snyNiKnO2WiFAgYirT4ez8VtOut+0+ctNL9gNjrPGwO9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11612

On Mon, Sep 21, 2026 at 11:06:01PM +0000, Sam Agazaryan wrote:
> Currently only the amd and svc I3C controller drivers populate
> i3c_xfer.actual_len on reads, while dw-i3c-master and mipi-i3c-hci
> overwrite i3c_xfer.len with the received byte count and leave actual_len
> as 0. Because of this inconsistency, mctp-i3c reads xfer.len instead of
> xfer.actual_len, making it fail on controllers that do not mutate len.
>
> Unify read length reporting across the subsystem:
> - Clarify in <linux/i3c/device.h> that actual_len reflects the actual
>   number of bytes transferred on reads.
> - Update adi, cdns, dw, mipi-i3c-hci, and renesas controller drivers to
>   populate actual_len on read transfers without mutating len.
> - Update mctp-i3c to read xfer.actual_len instead of xfer.len.
>
> Co-developed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
> ---
>  drivers/i3c/master/adi-i3c-master.c    |  5 ++++-
>  drivers/i3c/master/dw-i3c-master.c     |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c   |  5 ++++-
>  drivers/i3c/master/mipi-i3c-hci/core.c |  2 +-
>  drivers/i3c/master/renesas-i3c.c       |  3 +++
>  drivers/net/mctp/mctp-i3c.c            | 10 +++++-----

There are not dependence, suppose mctp-i3c.c change go through other tree
It'd better use sperate patch to fix it.

Need fix tag.

Frank
>  include/linux/i3c/device.h             |  2 +-
>  7 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index b35386260350..d033bfd4ecc2 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -412,8 +412,11 @@ static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>
>  	ret = xfer->ret;
>
> -	for (i = 0; i < nxfers; i++)
> +	for (i = 0; i < nxfers; i++) {
>  		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> +		if (xfers[i].rnw)
> +			xfers[i].actual_len = xfer->cmds[i].rx_len;
> +	}
>
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 4563d8761ba0..28e8eb293747 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1029,7 +1029,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
>
>  		if (i3c_xfers[i].rnw)
> -			i3c_xfers[i].len = cmd->rx_len;
> +			i3c_xfers[i].actual_len = cmd->rx_len;
>  	}
>
>  	ret = xfer->ret;
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 2d98c1ce9b12..331062c10b31 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -795,8 +795,11 @@ static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>
>  	ret = cdns_xfer->ret;
>
> -	for (i = 0; i < nxfers; i++)
> +	for (i = 0; i < nxfers; i++) {
>  		xfers[i].err = cdns_i3c_cmd_get_err(&cdns_xfer->cmds[i]);
> +		if (xfers[i].rnw)
> +			xfers[i].actual_len = cdns_xfer->cmds[i].rx_len;
> +	}
>
>  	cdns_i3c_master_free_xfer(cdns_xfer);
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dadf049bd4b5..f74c02fab9e3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -509,7 +509,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  		goto out;
>  	for (i = 0; i < nxfers; i++) {
>  		if (i3c_xfers[i].rnw)
> -			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
> +			i3c_xfers[i].actual_len = RESP_DATA_LENGTH(xfer[i].response);
>  		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
>  			ret = -EIO;
>  			goto out;
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 28c0927a0179..a3dcb4cd9b0e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -918,6 +918,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  		time_left = renesas_i3c_wait_xfer(i3c, xfer);
>  		if (!time_left)
>  			xfer_failed = true;
> +
> +		if (i3c_xfers[i].rnw)
> +			i3c_xfers[i].actual_len = cmd->rx_count;
>  	}
>
>  	if (xfer_failed)
> diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
> index 6d2bbae7477b..5f94c11a1712 100644
> --- a/drivers/net/mctp/mctp-i3c.c
> +++ b/drivers/net/mctp/mctp-i3c.c
> @@ -131,12 +131,12 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
>  	if (rc < 0)
>  		goto err;
>
> -	if (WARN_ON_ONCE(xfer.len > mi->mrl)) {
> +	if (WARN_ON_ONCE(xfer.actual_len > mi->mrl)) {
>  		/* Bad i3c bus driver */
>  		rc = -EIO;
>  		goto err;
>  	}
> -	if (xfer.len < MCTP_I3C_MINLEN) {
> +	if (xfer.actual_len < MCTP_I3C_MINLEN) {
>  		stats->rx_length_errors++;
>  		rc = -EIO;
>  		goto err;
> @@ -145,15 +145,15 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
>  	/* check PEC, including address byte */
>  	addr = mi->addr << 1 | 1;
>  	pec = i2c_smbus_pec(0, &addr, 1);
> -	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.len - 1);
> -	if (pec != ((u8 *)xfer.data.in)[xfer.len - 1]) {
> +	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.actual_len - 1);
> +	if (pec != ((u8 *)xfer.data.in)[xfer.actual_len - 1]) {
>  		stats->rx_crc_errors++;
>  		rc = -EINVAL;
>  		goto err;
>  	}
>
>  	/* Remove PEC */
> -	skb_trim(skb, xfer.len - 1);
> +	skb_trim(skb, xfer.actual_len - 1);
>
>  	cb = __mctp_cb(skb);
>  	cb->halen = PID_SIZE;
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 971d53349b6f..f868a7bf2bc9 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -59,7 +59,7 @@ enum i3c_xfer_mode {
>   * @rnw: encodes the transfer direction. true for a read, false for a write
>   * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>   * @len: transfer length in bytes of the transfer
> - * @actual_len: actual length in bytes are transferred by the controller
> + * @actual_len: actual length in bytes transferred by the controller on read
>   * @data: input/output buffer
>   * @data.in: input buffer. Must point to a DMA-able buffer
>   * @data.out: output buffer. Must point to a DMA-able buffer
> --
> 2.55.0.1082.g2b9226bbc0-goog
>
