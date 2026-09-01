Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020100.outbound.protection.outlook.com [52.101.152.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF71539A4DC;
	Tue,  1 Sep 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263002; cv=fail; b=sCuUekVkw9ZjolRAcSPCYuT6m/K7Rso8HJ4op2+3IfNNkMCMMo7MwveZAi7HdC4zB33IBwqVdhyOQ/4GsKxsXAVLj7Wa6pa2jzWWdB/bSgtk7Pmcu+l2rFqNJreFJDjoljmoYmVvb0ummcnPJFBXxnYUycP7+RvSA9QrDGL0nug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263002; c=relaxed/simple;
	bh=Z+pmCdrWxHfXt+4VgF6amomeRejf0yMXwFW9SBh7O04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rtfD2aoDuUmgozq/HvAROLQ33uG0XPvfl+Xnh/6l7QbU1iGlrLnqVnI7rKx44RQ0KVfO3LMP9iLajqT9lo1Itfthl3ZGNJg+ZL2+r+Gd+7OAaaE+hpcslh3gsp8KPWrDr3xTfHI4CYRMeIoiJVp9kC49g6HDi6GIvSsZ7ewQ3mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=iOMQASEu; arc=fail smtp.client-ip=52.101.152.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="iOMQASEu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2GB39diLQWAk618IOKTF9FBBgvZ7TivU47qDfMUWiJVIpm8DLuEfQyHIEhF2PB7Fxyzt66f5EZ1SC+kKvYKSNaXicTh1x8uqo0soPD+vE+COLw/DLTCsJtQhVDflUrPrWpDT7lbDTgSPwlBhmVwpaIyXBlp1w1tc+fC+5KxMqTt4omJRoPt9+rj949Vn4h/8jtdC8hEwYl3Wus2DV63dlHRi/OdScbMutasaA823WJljnlTU4cdPITk6HVu/TGsnQMH/TopBUQ1Xd4asNy3rVtQORmvaYjxD0EzQUh5zbYdawWu4VC+VjJ77z6csPlK5zQL05RPa+kuTp006tyOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7fMlDkXKYG3oVx4kQUx8RwXQRR3ISB+4nAjaV5mjKQ=;
 b=P7Ay50TnhnVHJM1y5p93lXMD5z2dFW1M8OMsTwxg/h0zvZBdxTIxMxbh82fXO2beQvedYiDf3uOwbtkx9XmnoPU+m4wKLYdoJldDTzmimtEQr9HEW6DMED11tmDZ7uBKPJJeN5dH11lFhn17+VrKA7C7HcQuUEDgZyGYjtQ+TtBtoxkBxaXXmoBljQzZ8629kp5sIq8j0sqR7kPJYyauejrgJinus5puX5Q9ii+3Pim8NY8bXrLbL24ZMgIzVc8dvOza9NsJadSqdsXJFXEBP6tfCiiqDVqeAPkFdOA5EePcSAbJzlPg0eiO7WlftUijydLxafeRzrBmx/QhzoRYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7fMlDkXKYG3oVx4kQUx8RwXQRR3ISB+4nAjaV5mjKQ=;
 b=iOMQASEuA7u8+fi31TCspHTKrsPGcCEJ+IKhCj9dgfAW5vggLJ0iZed5PAvCQUJWF6aFAAt0tHWxhgOYS/LUYI8OHU9G+gIdzJu5arm8DYKPjXCj+0N6gRpWfPa8fIEZhhKj8BeaKp6j8xXZqahLSKNXU/xmzWE9SKsExC2aQWQ1Xtm/Ok346WN6foeEsmWpJHpF2NsKmXfKK8QG4y7jOEKevwFqeAqBs9/8ZNyM0QawZeObRZBVBE8d1zkj4l/92KBOeDquaevmh9GGCcIJPV2zZVr31Ip+hQmjN7kSGvklinxjOwWoTSQQF0xV1wrs+LnEWZuAg6EoIBIJfQcSoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY5P282MB4758.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:43:11 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:43:10 +0000
Date: Tue, 1 Sep 2026 11:42:52 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Chaoyi Chen <kernel@airkyi.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <apa6PKthz_vMv3XP@649ea4ce1770>
References: <aouw7rH6FZxscUTO@0d3a7a881997>
 <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e>
 <4512468.iIbC2pHGDl@diego>
 <apGMEsCwly8TCOww@5be1eda4e59e>
 <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
X-ClientProxiedBy: MEWP282CA0129.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d1::9) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY5P282MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e7b651-34a1-466f-59ec-08df081e32a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	4PHA7fkqgJXwvO8TccO/D96thmsgD7C7qObnnQxS7IhNjuhvFBDhbZr6Xv9HD4I7xqY/RaBzbBmA6rEENLvKxRLyeS+6F2Ygv82a3AL5+KLxNu+uo/nlEvLWL0JN0OS5a5YaGTj2yqxbmhupcNuYL/dDGlu5Ez21DYQ8b6u5eEgOcmwyS7IrekT23QqwfQHcYSXzMf22IT2SuaEYJ+Gph4ZcjzXya5MQ0ibjtX/cnwT7Tht/b8sD7uOEU54osATSdak7fyDfwkNfsOXEPJgbtXSzxPThtXNqdR/o23Ibua0YvxL9nbzfSxumJtJx8Dw9pd7Rl/W0ocG6iUBxBhIDII2jZ1mfIIjkD3jWnM81TeCKMOp9MCTUhy/3jX0T8wB7VGeBstySU3QgUDEzXOYB8jYAF9NpkIV14+kY3HMrnrJ91RMJf8xW4TFeAUVi6YuPXyRUbne5jwR3fenEi9on0oOCcY9otpblpf5EELAVadvV6CWmshKA96NoHg2sTRSnYrkmIrpG/EthbrQHZC/aZrPgfWu09fBjpdOvNoO5IMcn6r7PHnBl6yLH5Sp4yrSwBUosog5qoLXEKQ8W9OK9LMXI3lxjXbrBvmlaL3is57XfTZryroVVxfXhBjA3563dVHTTTzMgY/PGX+/Vl3CmlF8X4izZkFqt+mTY8WORFOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bFebHJVF2SS7ycWWFriUYMzzV0c4HwVKvEkqiYmEaByySSHrFYCLkwayvnLV?=
 =?us-ascii?Q?dtDsj4onfPMq7WhUFUV/d68ChpGKMfStgkoI6HJH5EPAOn2SmvQXla/xu/gU?=
 =?us-ascii?Q?BxLLwJoQT+OdualYmqOaC/XK8DWb8R1RBLfTVfD3K+yaaut42PJ5Ckqsg459?=
 =?us-ascii?Q?NT793z5Q7e/CX420RH5FL/8OlWZW387xom9kJQxC2AGp8rA8250xe8Rv3Iye?=
 =?us-ascii?Q?+BGkrRpn4G6Mosv7mpifJapImxxpeLxd8+8eHeaCFbgVyd2VisY1dHzxJknr?=
 =?us-ascii?Q?I2GgGkNkj2572Du+dAXkCKlrYBUq7W34EfrCQuYhx+pl5mnLa5L6EoZZe70J?=
 =?us-ascii?Q?FyWYQZ+INb2Gbhn+JKaCeTI1M7NjwbChK+1JraG+wruZ3xzGJobcyUwZ9mjN?=
 =?us-ascii?Q?uSNHPY3qJGhJogCSF10xvUCvD3q9lN/KzPUUuo+YW36C6QtEuPBNtu/MXkl/?=
 =?us-ascii?Q?mVwLS1t5ikdudgcBaXw1U9/eoeGaNIxEqpE+yOYcqhrpFeo5TMJ++ceDh+vY?=
 =?us-ascii?Q?DuGj1B7nL062QP4CCQOZTW0x9dlg040DMAG0HCJ5Aenm8j7q+gmTxViSp9KR?=
 =?us-ascii?Q?guiLxiXPZE3LAqQNylj8nagVM9MdYgBveiwKNFiQrqzORaX0Y/JcyZRdkO2r?=
 =?us-ascii?Q?+uJxXSAjmFDsBdUkaACpmWCvuS4TAwypnxF3nEXCzbOkNu+jHhX7jdrqtM8k?=
 =?us-ascii?Q?6VgvDT04wxxE0pvSwcU+Sv5B5d7Iv1OxPR2vYnavv6QF1eMH8xGBvu69qHqf?=
 =?us-ascii?Q?lE3yrTw4FBVl2elDb5XXAFdk1Cft0bcdICeNrEis0yWWLL7U5ASK4NHC6iqY?=
 =?us-ascii?Q?Xqd5thhUrTVBCVmjFeuGs+UUL7HCxytGdJJHSmZJfQn6JqrnJnOUqkfBonBP?=
 =?us-ascii?Q?qsrYE8fbycSB9M/qV8KONMFH1gi68xtHePE8oQUZ+Fz0OeZHwKUKzp2PylUv?=
 =?us-ascii?Q?BnXDX7JlZ2+/09WJx1u2+hj1Ig0C8mIzaVdjYZDDa98y0sQ6eWq01wjYkVRL?=
 =?us-ascii?Q?NCC+eLKgBVF0EnKOLYwqD36xjVDLIzi7qG7L7RQCubOAbUsI4VhvEvfmBwm7?=
 =?us-ascii?Q?clx71ZQ23oHuHwnG4DcJggIxYvu40BqQqrMJ95245dw6rE9xKzwsZnHshjNs?=
 =?us-ascii?Q?qSEaX4L42uLQOMPqfGsi5+52Ezrm+oUglbomGwA2nKfCkuOWnb2x7rYvinxZ?=
 =?us-ascii?Q?bqiqU42S0WXCdTIMIkqK88HmSvy/RIFoDkTXPAuEN+aFQ2gR+TcUCd5IN3Mo?=
 =?us-ascii?Q?PUBbObbtbp+utwAsK5IE7pPLhFs0skRRDQ460sCeFp/fwhn5/av9oqUW1/Jx?=
 =?us-ascii?Q?Ld4VMYkFjx+xO5ZyUF1E/oQDvANROAcQOrzBWerRZ8HpaFEXL/hs3MxDLO3O?=
 =?us-ascii?Q?O4g7G6BBDlOg0bEyX+7oRJ4YZLc9Agdpe4bIiu6ZvLzZ3GsEcc3PWyQGSEKO?=
 =?us-ascii?Q?eOs5ySTpTMB4y7HDQZ25cJeg0ErPZ0PZ2MoITenB5nAIacf3myZFtGANYAkj?=
 =?us-ascii?Q?gwu1lazmrEOdqlxTl7LMiCLVDIvH+XWoOoBvFxKJd+zQfZNwokIeyVQeTvKv?=
 =?us-ascii?Q?QJHOjHcUmgetqzXL9hB5o9nPAyCJgBqwG0R1vz39gopyctQ1eNFtPhnSm7mQ?=
 =?us-ascii?Q?g52ua3elYltxSgEWRG1METfClO5rh9DxG8RQJkpY5SuxjHdmZ55Koj5F2ZvB?=
 =?us-ascii?Q?WDllksL97FskgruI3Fca59qNFnehFFN90/Aa+KPuVfgVPEde?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e7b651-34a1-466f-59ec-08df081e32a1
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:43:10.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WDQBVeFTjaTdBBpsaiKGovkPKQHldLgkFpzs9Sg1FtkJReMRN6VxPJmTX/zP3tCSGJLpAU9/PN6WMYW+m1KNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB4758

On Mon, Aug 31, 2026 at 09:41:08AM +0800, Chaoyi Chen wrote:
> Hello Rudi,
> 
> On 8/28/2026 9:24 PM, Rudi Heitbaum wrote:
> > Hi Heiko,
> > 
> > I hadn't looked in to these from the mainline viewpoint. I had been
> > using an adapted vendor script based on the radxa npu_powerctl binary
> > which reimplements the npu_reset sequence over GPIO.
... 
> > I have the schematics and the working N10 here, so let me look into
> > describing these in the .dts and update the onboard_usb_dev.h.
> > 
> 
> Perhaps we should first check whether the power-on sequence in
> onboard_usb_dev.c meets the requirements, as it enables all
> regulator supplies at the same time.

Hi Chaoyi and Heiko,

I have done some work on the bringup of the rk1808, and can confirm that
it needs six rails up and its reset released before it appears on the
bus. There are no ordering requirements, issuing the reset 25 ms later
is reliably working. The supply names being "vdd", "vddlog", "vddcpu",
"vdd0v8", "vcc1v8", "vccio". This moves the power-on into the kernel
and not the userland script. 

The MAX_SUPPLIES fixed size array needs to be expanded from 2 to 6 to
accommodate the rails.

The rock-pi-n10 and the on-die rk1808 (including the onboard VIP8000Nano-Q
NPU) are now both running on the 7.2 mainline kernel. The
rock-pi-n10/rk3399pro-vmarc-som is booting with the mainline .dts and
the rk1808 is booting with an adapted vendor .dts.

The required changes to the drivers/usb/misc/onboard_usb_dev.h are now:

    @@ -6,1 +6,1 @@
    -#define MAX_SUPPLIES 2
    +#define MAX_SUPPLIES 6

    @@ -134,6 +134,6 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
    +static const struct onboard_dev_pdata rockchip_rk1808_data = {
    +       .reset_us = 25000,
    +       .num_supplies = 6,
    +       .supply_names = { "vdd", "vddlog", "vddcpu", "vdd0v8", "vcc1v8", "vccio" },
    +       .is_hub = false,
    +};

    @@ -167,2 +167,2 @@ static const struct of_device_id onboard_dev_match[] = {
    +       { .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
    +       { .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },

Hoping to get your direction on this, and if this can go through as a
single patch, or should be raised as a series. I will raise a v2 of
the above if this is suitable.

https://github.com/heitbaum/linux/commits/rock-pi-n10/
https://github.com/heitbaum/linux/commits/rk1808/

Regards
Rudi

> 
> -- 
> Best, 
> Chaoyi
> 
