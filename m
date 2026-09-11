Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525E366057
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139420; cv=fail; b=oOIvx8i3UrOlargcUQ1mu19fhQamjjg2Ki+Ft/t0s5fy+NOpBXpLNW9kOEBkaZArnzdMKwGXv/UCaaFcYsNydMaWVMP080Q4j8Fn/0fQBCW1hZkanLhxSRuRrdbVJJvEIf/zLXGIBLh5UExBjEFPqw8HrhegC2IwdJeEu/8LQ/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139420; c=relaxed/simple;
	bh=mCttPfhc+96P2RQbX855JYFG1qhL0flmpd8tWsC5pps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TVXEaY9yolP/0KVMrSQPjgHLKsViLpbifFduPsrns9X0lgHF8B0sOV+uS8hjei0+LrbKqJ+AkILiiY9ZG8XnKwkrfbX5WLlslOraqQsMiQJkQDSuf2SPbT2ZVCeMj62XiEDqi1tNocc+pyEGC7XtiRmB33/LcHvefSMNhJ8NoYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=krmomVoj; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="krmomVoj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1b6fmKDdoEWlfYa1jc+OJqmG05BKkVz5L18zniC1mTCMYJ7BlDYQ3zPkTIOuSfR/FnnXm37PiiFdwkpSui6zupsP2Iz4Z/vPOuiHSkxKouHyTSSRXK9Krkqzo6COzq/PKRHMjp0iJOIfGfkNVcal6Ra1dMH/zanJdwqjhllKze5niPRT3DTntlGCkFdRMyDfi87hsrULnMWlSR+mhc68Njypm9NKLeAZhqYSHVAde5ZXpchuYB7mRfz3GSiAcCHMyHT6A+Crzb9g7SKYRKKDO7/G/9BGu0xcgdkMVNRyTrlpqH1iJaDzfawM4cUGnue5tTrKyPhk9IPrucieqkKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45WggE0hVqYczmQBNDfOBUyvSALet8LAz0FM2aCpgWo=;
 b=BlxMTV03hnV9CJQpbLwU60eDpDgrqQVzznFxcssSCFtkM0B7FpMbXxrvexoedJoAljLqZ3xJn9F+/2keMDb9GqxgE6jOTf1es3WMC2NtCLEbEQn96XlsW8E/IcmDEiwnWxfk4KaKaftRFt9Zhvv6v32wp2LrZr/frdIu0vAycEKMM/aPMWnvREGEozCQWGKSncEzFD5YRxnlVZADL85+VpPfIfQHYduT69Qgb4EhYb3o4LUTY7Ivo/gYb9vQmhjUFui4l/Nzkg+vr2YKirdR7hnDpxG3S18DhYUZuxtbd8rHLcW8G4Bvg4EdC3P/jQuEq2bPu2gvmTQng49FDXx0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45WggE0hVqYczmQBNDfOBUyvSALet8LAz0FM2aCpgWo=;
 b=krmomVojqWWYI+VCu+b9nvZcL8x6csCrqwQTom/Cp4Q0/ArSdr20TXscwVJZ4ESPgYruYTnGuKaKpAPXPBQQl+kdYiSHFSQXulwiE3R5blL/uhzlQo/dHYlLKoIW2m8a2L/hIA0DNfNgSKPyWEbrVdoKqIM54Imv2D8/slMtG8aYWR/DMxpN0oVz8jcMN/CbJdBx7oPvdQf74XSorafJxwBG6CJfT3xBkwkqlYbw/OS8oRp03jO2uT6reKR4/6iFr3fL7KdjgvKkRalyAOMc8HOLi0q1W7DYNl/Y9pbO1kkES+5qh5ySHr952xSpRfEb/lKaPqJST34HQiAcpoSF1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB532906.eurprd04.prod.outlook.com (2603:10a6:290:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:10:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:10:15 +0000
Date: Fri, 11 Sep 2026 10:10:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <aqQZzqJohIxBwnk0@SMW015318>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
X-ClientProxiedBy: PH2PEPF0000385D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6b) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB532906:EE_
X-MS-Office365-Filtering-Correlation-Id: b362be12-32ca-461b-0689-08df1016c890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	FspTVSbZX5tRn1J56dtPv7NUhVmazH+lJm/E+RF2cwiJTF796+0J5/Ky6LRXNfQ3woy28pNxy6hIScE9RmPtUk4SKZJDut6vbdmCaGP4IKwVunEC+rQRc+WxNOVPhTJ8mSzA72hkJxD9EQN/jFR9FkJ1trZNJahj/BTKgJ0wPN1JyW2D5mfPi4UGniYmKh1sbFQ3HNhqwi5jA3u8sq6gw47TAKIqAL2njv9FlI/Lti8M2S4QLobJeRQft2p2RN/7OTbqUGtFA6kME/oWj8YnWmfNOsjOG9c72WFhQfYnMR7TIx3fG2x1Ed8ksJ0Ee+FrCDpTh34ftbbeS3v3/Xx4vklfIyI6368t3qmto9mkmouT58A9DElm6uJMRSjSZ/LanzwuhI8ttYlUyqRh/fGbV43mYq3aPXdRPiJO1uzuCOGYcQQYDSX6CIKV+YOHEO8wHhz3GIqAEopjMM57hVG28uRFIBQlLceiIlG0pq1LQyW1FhT5Bhu1knibTZ7D1ABYR8xdWC0HJM2/xloemjM37gCFEQBdd5V83ad/sxv7jdJlszsZbTRwy0zNJEuaAfhjan5CKugzAFH+AAjDmWTryaYrWBtiF8YmGxtN+WSbNAlMOdW1hdvCxkLmaDyP8gUCGuJv/dgLS2XwF0KmPuU3bNEewPVoT7y5MJhK8N7dLDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u60dwElRPdsnBlnPHKhEdqnSSDjxwdPGFczrVxS6A4dRn++UJzpy8KxcNEvL?=
 =?us-ascii?Q?wmvLgbMuYKzUZqPSncOLm85WhAOUGH6ZA/ixsvQTkQJ8Jij5C2GLxfEo82eY?=
 =?us-ascii?Q?UxzD9I7rtFm3xQDB7eJOfjtKCga6F/NPI+3x6s+4UdHSFRJTMCPmHg9ZccR8?=
 =?us-ascii?Q?3sAf7mX9DYIJhjk6Nj1y+THjynAg/juaJixM5jQYgw1KmOoqPGl+vkrawGr5?=
 =?us-ascii?Q?IvqIOTqIu1NHxBLSAMUGBaWF2/GiW1StiWa8EWgU5qw/Ro+EBVlpXBAcLkV/?=
 =?us-ascii?Q?4VbFQpChqvNYojN54Q/XG0cxoysl7LJVhHRkO4A9QW47XjAendRuACqKnFQn?=
 =?us-ascii?Q?P+s1e+mZzw4+1/Q/COC8GMebmzUJGDb97WCxRGl0xzCy88o4+VychFrXgNh7?=
 =?us-ascii?Q?7oWYN184h5OMOQSLSYI/GZqsj0kpCtkou8dsqnfWsZWXAeujZ88irk7F8Vmt?=
 =?us-ascii?Q?3tT2yKABcSmccYneTK4VdY8OgZuJG6UOUXW650+P4MneoYo0R5HSluUrvwXN?=
 =?us-ascii?Q?TCgUyo59uVy/JgEIuB8bf+CZsftkQB4RYiVYEpSddhV/N5g7ZAeKnprjSMER?=
 =?us-ascii?Q?P3w4NRh6T4JnFRd3UahNCkArmVl2yLDjrzynf4wN7ShZoInD90eczlF4x0J/?=
 =?us-ascii?Q?XSTUgEUysezqm5UyMw28FMfZZbDLKh2i5+kpidtYHyVhgIcycFDaH2MbBQ17?=
 =?us-ascii?Q?buiJNFvkwByfIN/zQBqdFBom8s6h9Osj647gVKoUXyK+jSGLmWApjPESWxus?=
 =?us-ascii?Q?l9PJPkv6FpFLFinNSnFKI7fvAARXSXdU2zzrKZFcvvNxTae/OMVAo+Wj9Z+c?=
 =?us-ascii?Q?geXxqeW/Fkdq6Nti6xX/ehdi+k79wRK3tz7th7Y2IvfLLhwFGfCvVAc3NycV?=
 =?us-ascii?Q?cVOji7r7hrHp80/zcTgqAG4X6ja0BDWY07QF3wClqu0IWWg+Gs6FSlrqKKVb?=
 =?us-ascii?Q?oMEv9ECgMChVMEwD9wE0ZO7LZJAVon/X+LQ4lIT8MVcOAGTBi3HcD5sF+bzF?=
 =?us-ascii?Q?VyrtfjaqwPuMq5YmCR5hhQ+k1aWMm6Gf6PmuLJmGos182pc2Wka3saUwFHtu?=
 =?us-ascii?Q?uVLcb6Ifhyo0YoTTaQmfvXlMCA+EyMbT3Lu4S/EUbzZgMukBihLm6rk9TpOc?=
 =?us-ascii?Q?sWBgSbKO4+CsJ6SynLZ1YFemSnMxuzTvdajORto6VjtrAS1E8KhsmORFikzV?=
 =?us-ascii?Q?wF7vX5YPMgHmfCy5Wfgw11gim9i1FwSkaASJlEQsf8A9ppv0B4gXnkqqe17E?=
 =?us-ascii?Q?3wVKe7FIGKRHfCYL6epB9TPUpIlWKP3IKy7RF1zfg4W9AMMb1wlMQxO6OEEV?=
 =?us-ascii?Q?dt1bD4x5hXg6zyyTybtAGdk0PiZ7lHU13zZBbtheB8hEmLNLFbej8l2+ZzdT?=
 =?us-ascii?Q?+tiFcZk+Q+giRSQj8pjvQ4tUt0hUd8PSoS6Wf41dmFkfce13XjzY8bIfyMaU?=
 =?us-ascii?Q?mtg67zquHE6cJVRISWWYee1/6NPnz46allo4s+VMfEztnD2xYZol7UJRsveg?=
 =?us-ascii?Q?Z5beI1yXJgta8FkjLm5DpjUos1K0Sf1XZuexPCI67QuSv2AtQDF2/sLlBCun?=
 =?us-ascii?Q?OLfHUlQSLv5rYIM6tJnH3pj9WgsEz+SXjFUQTVFJzNH3kFAUoeXnH4WvBgGW?=
 =?us-ascii?Q?5ITuEeWjnRmyQxxqOIuLtRKboUIBV/lqK4Gw4K0Dzgw6h48+dt6usY5uO85K?=
 =?us-ascii?Q?/uxS8II4KFwezR1HQC/G+1ILVdjNqoj/oQA3zUR6fH7dXGr5yh4H8qnSu42e?=
 =?us-ascii?Q?Pzg47vlqQqZC73SK08975a60kIe4GBkdGYXASI+rZAYPwWcJDvmO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b362be12-32ca-461b-0689-08df1016c890
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:10:15.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/Ugn/De0AaJHf2xijb37QsJ+NGweKEeu9b4FOQxIpAFBrNl7R1WbtGXLuQBwdxW4UTypbv1MMnNzi/dXgGOP9JkBG40plpnITq4aS6xf43d03OdH5miJUyN/ielISl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB532906

On Fri, Sep 11, 2026 at 03:44:40AM +0000, Sam Agazaryan wrote:
> On Wed Sep 9, 2026 at 9:51 PM UTC, Frank Li wrote:
> > On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
> >> From: Vitor Soares <vitor.soares@toradex.com>
> >>
> >> This patch adds userspace character device support for I3C SDR private
> >> transfers via /dev.
> >
> > Add userspace character device ...
>
> Updated in v5.
>
>
> >>
> >>   - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
> >>     devices when unbound from kernel drivers.
> >>   - Dynamically allocates character device minor numbers using the IDA
> >>     allocator.
> >>   - Implements private SDR read/write transfers via I3C_IOC_PRIV_XFER ioctl
> >>     with 64-bit aligned UAPI data structures.
> >
> > Consider PRIV for SDR, need unified HDR also,
> >
> > I3C_IOC_XFER
> >
>
> At this very moment the production use case we have (OCP Recovery) supports SDR mode. That being said
> supporting HDR mode also makes sense.
>
> >> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
> >
> > new post, should be 2026
>
> Updated in v5.
>
> >> +
> >> +	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);
> >
> > kzalloc_obj()
> >
>
> Updated in v5.
>
> >> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
> >> +
> >> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
> >
> > why force to SDR here.
> >
>
> For reads and writes we don't really have an option of passing down a struct denoting cmd mode.
> Is there a different default behavior you had in mind for read/write besides SDR mode?

this is problem, Maybe we can use ioctrl to set default cmd, hdr/ sdr(default).

>
> >> +err_out:
> >> +	mutex_unlock(&i3cdev->xfer_lock);
> >
> > use cleanup guard()
> >
>
> Updated in v5.
>
> >> +	for (i = 0; i < nxfers; i++) {
> >> +		if (xfers[i].rnw) {
> >> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
> >> +					 data_ptrs[i], xfers[i].len))
> >
> > Use actual_len,
> >
>
> Updated in v5.
>
> >> +				ret = -EFAULT;
> >> +		}
> >> +	}
> >> +
> >> +err_free_mem:
> >> +	for (j = 0; j < i; j++)
> >> +		kfree(data_ptrs[j]);
> >> +	kfree(k_xfers);
> >
> >
> > use clean up __free(kfree) when alloc.
> >
>
> Updated in v5.
>
> >> +	case BUS_NOTIFY_ADD_DEVICE:
> >> +	case BUS_NOTIFY_UNBOUND_DRIVER:
> >> +		return i3cdev_attach(dev, NULL);
> >
> > Does all i3c devices attach this driver?
> >
>
> Just i3c target devices without a bound driver, the controller should not attach.
> The controller itself is explicitly skipped:
>         if (dev->type == &i3c_masterdev_type || dev->driver)
>             return 0;

How about this driver built-in and other devices build as modules, modules
load maybe later than this driver?

Frank
>
> >> +struct i3c_ioc_priv_xfer {
> >> +	__u64 data;
> >> +	__u16 len;
> >> +	__u8 rnw;
> >
> > In HDR mode,  rnw is command.
> >
>
> Addressing this in the final comment in this message alongside the rest of
> the HDR suggestions.
>
> >> +	__u8 pad[5];
> >> +};
> >> +
> >> +#define I3C_PRIV_XFER_SIZE(N)	\
> >> +	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> >> +	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> >> +
> >> +#define I3C_IOC_PRIV_XFER(N)	\
> >> +	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
> >
> > I3C_IOC_SDR_XFER, support DDR, TSP, TSL future.
> >
> > Frank
>
>
> On HDR modes - I think it makes sense to ensure the UAPI supports HDR modes now that
> they're integrated into the i3c core. Would you prefer a scheme where we pass
> in a more unified struct to specify either: SDR mode r/w or an HDR mode r/w
> with ioctl?
>
> Drawing inspiration from i3c_xfer:
>
>     struct i3c_ioc_xfer {
>         __u64 data;
>         __u16 len;
>         __u16 actual_len;
>         union {
>             __u8 rnw;
>             __u8 cmd;
>         };
>         __u8 mode;
>         __u8 pad[2];
>     };
>
>
>
> Thanks,
> Sam
