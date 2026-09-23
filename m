Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F658122B;
	Wed, 23 Sep 2026 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194297; cv=fail; b=fshb6Qtz2imhl7awe6wgL6wLEsafRDavGMzOgbWPSVOpvmP/HwIqpvBLIddaLB1qDhjfwJhHyyWolpFledGV3NZAh2yHIcHqw2x69pM8/eD82K0SHhi3s5fxQQAxGBy0daL5nl4Kirkh0yXz6br00bI7k9CuO/nK0tvEQe+Gci8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194297; c=relaxed/simple;
	bh=r0ERvGZdL+8C9rxRpnLmIP+ae7cjk6vYSQLFCZ0TpLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fIlhRf+RB5kD2Peo/TYjx+suDWbEtBDC5Fec+lVvGlZhejQFio9AgGKi80r52LyYTeLktcRkPs0BtIFXrFT4cYMkuIuyzjoUmQgdNr2Hm4IiT1JiQvWTfiSxp+HVrhHPk/Pbb4Kdb1B7bPZ8ViA1Z8kIVuteK74WJaRw0oRSrtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Upsz6TKI reason="signature verification failed"; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Upsz6TKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqxyP/pW1AUuh0SWDa/zQusoCoaNUlFl1xgAS4ZkCI7za3FsPUfiNccLqajqzVY2FeHgLFsoRp4zIy4waw7hzaMIt/3e5hKsuppFB98j3WGn/UGUpL+OmuSvsL7wd2ITSYRvKkGKP1bObidFDhkojwQM9/r9yf8cGzmThscOqf7o5oLcoci/0b0MyYgVEDbXEBV+RMaqOCt9Dq29g2/4wXZ1O0wsrcxUUtnbJdF/y5iO/1Z8gBYKG0VkOqE6J5VsZ2UFEULVUoSE1GAQ1XvMiXBoP6fO55YArDMk/Ee3edI23X8cUuH+ShrRk9WCyselck5+r/Q7im2tA1EWg21Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Wgnlz9ZRnQcYQhuiHGmOCkSK2lQ8jD2tx3Ocj91yFo=;
 b=gNqdd+xg8/AnECefa304IGskgmZBUNVGHJcTn6ynVGuchTA8AskBs01X/EVyLzDmM31jZE3wUvxJA+1u4puuDPDn5UzhhLc1eeefNshcJAhugH7LuYOwSrPVkp6G152OYL4qkTaKjVPEeroeSCptULAk18pX4vaIo4DNcdfUdHMDI6Nt9yLdtFgZfuZNaVwhry0T4LYtvIRtR24jrVZM8Fcc2B7T0X0Scelul7kXqz82LxxCUZI0QxfaA+MNFXygKUFE7CNxE2wI7MfJl62eZhTa2EJpcGLqmJ7wKXB6zjViQs777cxHOLthDglIrEXemFHL/ZGsBuFrtoL8LJ8V6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Wgnlz9ZRnQcYQhuiHGmOCkSK2lQ8jD2tx3Ocj91yFo=;
 b=Upsz6TKIiLOY+WHOdWiAiOJpnQGnLO6mTQbGYrJvcOVfSuOzWRwW9f8H4XXvNrK+GzVkfvfmm/tREcLAR3OvoO8eWwGW0SIMNgSh1QT07MhgxOHL7sSG4sk4txpmppn8OEk9jCYeIMnxWLn31y038iHIOzB/unOi7G5Z0BPCIq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.15; Wed, 23 Sep 2026 20:11:11 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:11:11 +0000
Date: Wed, 23 Sep 2026 16:11:06 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] x86/mce: Reset MCA_SYND1/2 and kflags between
 bank scans
Message-ID: <20260923201106.GC1080284@yaz-khff2.amd.com>
References: <n489m-wELNDg-JxPbFni_X3f1c3kAR0ODpWqP-6B0YEZ_a_xs8eGi6BfU1J5AOS9dt13GpHGucYDJoPucZ0D5pezQwkFoX-Jm_vX7OH72vI=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n489m-wELNDg-JxPbFni_X3f1c3kAR0ODpWqP-6B0YEZ_a_xs8eGi6BfU1J5AOS9dt13GpHGucYDJoPucZ0D5pezQwkFoX-Jm_vX7OH72vI=@optocloud.no>
X-ClientProxiedBy: SN7PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:806:122::35) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: e02f8c21-9a2b-4a9a-6d71-08df19aecf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bAL6L7bZ748CR3/lJshZkqn7TeK9wuatJDMq0lrSySXBBh/Qce/gvRpdhzor4pbAeDRPA3bxMpBPF4m5idp1QJMub3gcayQxMNsyvRn9b9DqLwEGfFnuuKWzIDIZjr+1b0QBORb7ZBwW3DzGyKs1bnl7q24wGCKGRbJ2PLMBndVxUzMPa3On8M7wZLQYall7YxyQBy9Tyxin5zGjifkgVeJqMeNQn7h0JqYzKoun9FTMLHnTLSFeO3AhuTttdKi9VH/VRrvKa3yoauUtfZzW24AjqnzeanmfSgZBjHsHEoBi4hNTFuTfZFRN8BEPJIzBh2DgyKWOEBZuX/Yo7wxRPKVHSLLMIhLkHayqavBpoxbHkNs85P5AxqW82tjHHJoIjKX/17kf//N4//JJ66H40iPK/2oLRhmg74Gw7aP0rbxRSLgrJMVeriTrar1p+8PzQEE10K3jqFdxwFsdLVc1mDOn/6ux1DivfU/PF10ThCJ9PjmaLW2rKm7pFBuy5TNg8S4J94zcYdVUjuJAJGp/Zco9LGNQ0mh3OSipEXAQ0VXXbno4sJ5ORAiJk0rt8nRVtFokFdlSikixyLl7VQ5P+BMYNBo2mJVjevUxJhLltrGeaE4vqJpyyjH/wncYi0aBM73a1/kz/bH9eglmkttZC/1bCqD6+ECzwDyBom3YIZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SUN9uBKvTdF9mHw0LX/Wgu5+ogsPVfs0Meh5dgSuY3zFVibOXiKbNS/kGM?=
 =?iso-8859-1?Q?JDR3zTFMMRvK7pAFE7a2+W5Pmf+3EnEsk2i85glALbVGsjlGon5CZqXKeo?=
 =?iso-8859-1?Q?H/3TmvMVVkMDX7jl8Apjeo7jAwt/rnS4rv1MSYz8PdXrpOREH19RPQtgcr?=
 =?iso-8859-1?Q?xAbVj4Rh2m16rs1nnaSR/jl730dUl0pV6Z+nXws2DraeAVzDZJ7Pf6/Vx6?=
 =?iso-8859-1?Q?hywDy7yL07JhsN2Va4eup+Pu1IUgCpQeKumBDFO8LYsuwxrZzLGwCircZh?=
 =?iso-8859-1?Q?7F3god/XYWN+6VqMhrk/jNtQsL9hMy5tatk/0kWlo675Fo++kSTW1a9+8i?=
 =?iso-8859-1?Q?yHmseEFq0s4zxnMMRyuHfI2N+tlGobJBVPZcmkD6VV0WGiSMaQ0Aq6P7vo?=
 =?iso-8859-1?Q?hugDkImfqij4zhD8owrE3CXk3jpRbT+eiE6YTl4mVsYt+Qj2nGB7tWSpX3?=
 =?iso-8859-1?Q?a5PP7xD5qxds0GbeTuUqxup125pmFO4AL+/EPwBMIjIZw887OZQGykW2pd?=
 =?iso-8859-1?Q?AFqoEjzg4KaVwfrLFAyM2ie53Gtu+VFwmw8LY3Fpty+9+fx0UV6BY61KiT?=
 =?iso-8859-1?Q?uQAvZy3jZzppHTU3WF7PpMVj3+j9ZdfUZacPO1Fn8EDqo61WRIEsb7JBYE?=
 =?iso-8859-1?Q?Vt2oAQrAoxDnjNNQAKudMlV7tNHQJn09Z37ibUD/zLSe7QGUBxrPBKxYe9?=
 =?iso-8859-1?Q?Kvop3Bl5dagWhSzqkSt1YzN4V0V39lmN9bII0EzqE/U1sjUUSKtZ6PDUfU?=
 =?iso-8859-1?Q?yFYZHShIUUAhJJE5qpeOmSvnNKyKIYju7NXNk0HtB2WlpQMuVmlrP9JfGH?=
 =?iso-8859-1?Q?dwaZmUVozNTaHsRXCwD0Ygc2Opf4ePuOpAyrn6dOQvcEkOIVun48tjuBpY?=
 =?iso-8859-1?Q?WzmmfCBvygBAzXFEN1DhBici5DMzWNtYY3Dwi89XRd65pYKM1H4zYCzjXm?=
 =?iso-8859-1?Q?62WYxgtcBH9BscLFMt8shuSf+B5V7z0v+W3JSBydDcoeiP5hoXcfDVmpMv?=
 =?iso-8859-1?Q?ySFh/1BvgLWZil4ihh2KbUrud3v0K9LLQs57fy1lpsVnG7igD14OgIUDr3?=
 =?iso-8859-1?Q?9D7cRatDGQAAO9JVyIF1chGEhFc49j5xMsIEwagdsJ/PsZIdd4wc+JjMyN?=
 =?iso-8859-1?Q?JUWkAFqYER4HuPLReOCJk3X+l+aYAHtEum1tF4mx4hhCLlnyg9zs13oqCG?=
 =?iso-8859-1?Q?mPUvrI3aeW4quiwluHcPTwmZDf0YwvRHDMJjIuXWvyr6SqOTQrdG4NUekl?=
 =?iso-8859-1?Q?cesvxXGa4Sc/jYG6fPJ/Y3ghe3mjaF8pbR5uG9VPHMOCjTOtw4yXeDOMAn?=
 =?iso-8859-1?Q?6eA2a5uvdyjeH6/KJ3Khhjc9HXRAbuYaz1AzTTEv85K0nNdgQDnS5EVIht?=
 =?iso-8859-1?Q?jU1K8AvXe9T8V6cTNNAqbgh/JUznG8hdy1Niz9S2wIaP2fj2YWRV6ctUQl?=
 =?iso-8859-1?Q?hQDLd7R1vK6Mk2YsfPaEBpRn4j1pl7uR48JKxupA1xJ5XhVxHWQrxbuf9M?=
 =?iso-8859-1?Q?K0licfTAJXExrY0SHs5zvZnV7f3eIWCnoGxIAwPhfjZ6fXRUh4J9IqEHqM?=
 =?iso-8859-1?Q?6Uv8/RZdSH7RTrc1hj6FsFi6GEn1zrxRkSOg31+dVQvj/bZlGUOFO4Rrt1?=
 =?iso-8859-1?Q?INL6EFLVTB7OF1JYG5tWpCA2MwRuFmbgbT5sfcsK1GOIQH+WWVRXIPH9t+?=
 =?iso-8859-1?Q?tnsj2gDvCle/jIL5yH5BWmhOkYu4pAZM7J5ymtY6v+GMob7WQwuTmnym/s?=
 =?iso-8859-1?Q?WXxb6StUaH691p+/zw9/928KNzVAA0QeaOSiSeQEaJneuF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02f8c21-9a2b-4a9a-6d71-08df19aecf94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:11:11.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIxs23B/L841dchcwyhPgNKs11co3Hlhfcc8SH0hCdwAYUUC8+yI1k+8q2vxqlwg8Rg48PeVtz/MkInQLuHfmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136

On Mon, Sep 21, 2026 at 01:38:12PM +0000, OptoCloud wrote:
> From: Eirik Bøe <git@optocloud.no>
> 
> machine_check_poll() and __mc_scan_banks() reuse a single
> struct mce_hw_err across the whole bank scan. The record is zeroed
> once before the loop. Each iteration then resets only MISC, ADDR and
> SYND. Three more fields are written conditionally inside the loop and
> never cleared again, so a later bank inherits them.
> 
> mce_read_aux() writes err->vendor.amd.synd1/synd2 only on SMCA, and
> then only when MCI_STATUS_SYNDV is set, so a bank without SYNDV is
> printed with the supplemental syndromes of an earlier bank in the
> same scan.
> 
> A stale m->kflags changes what happens to the next bank:
> 
>   - smca_should_log_poll_error() sets MCE_CHECK_DFR_REGS when an
>     error was taken from MCA_DESTAT rather than MCA_STATUS. A later
>     bank in the same poll then reads MCx_DEADDR instead of MCA_ADDR
>     if it has ADDRV, and amd_clear_bank() returns before writing 0 to
>     MCA_STATUS, so MCI_STATUS_VAL stays set and the bank is logged a
>     second time on the next poll.
> 
>   - mce_default_notifier() prints a record only if m->kflags is empty
>     or print_all is set, and the record reaches the gen pool as it
>     stands. A later bank that inherits MCE_CHECK_DFR_REGS is logged
>     with a non-zero m->kflags and is not printed by the notifier
>     chain.
> 
> Factor the per-bank clearing into mce_clear_hw_err_fields() and call
> it from both loops.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} registers")
> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Eirik Bøe <git@optocloud.no>
> ---
> 
> Notes (amlog):
>     Changes since v2:
>     - Squashed the MCA_SYND1/2 reset and the ->kflags reset into one
>       patch, with the ->kflags reset in mce_clear_hw_err_fields() (Yazen)
>     - m->kflags is now cleared in __mc_scan_banks() as well, which it was
>       not in v2
>     - Subject prefix x86/mce/amd: -> x86/mce:
>     
>     Changes since v1:
>     - Dropped Cc: stable (Yazen)
>     - Added mce_clear_hw_err_fields() so the resets are not repeated in
>       machine_check_poll() and __mc_scan_banks() (Yazen)
>     - Reset the whole m->kflags field instead of just MCE_CHECK_DFR_REGS
>       (Yazen)
> 
>  arch/x86/kernel/cpu/mce/core.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 16183fa4ddc7..e906c3f8e888 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -653,6 +653,22 @@ static struct notifier_block mce_default_nb = {
>  	.priority	= MCE_PRIO_LOWEST,
>  };
>  
> +/*
> + * These fields are only filled in conditionally, so clear them before each
> + * bank to stop a bank inheriting the previous bank's values.
> + */
> +static noinstr void mce_clear_hw_err_fields(struct mce_hw_err *err)
> +{
> +	struct mce *m = &err->m;
> +
> +	m->misc = 0;
> +	m->addr = 0;
> +	m->synd = 0;
> +	m->kflags = 0;
> +	err->vendor.amd.synd1 = 0;
> +	err->vendor.amd.synd2 = 0;

It seems that the entire union can be reset in one step:
	err->vendor = (union vendor_info){ };

This would be more future-proof if/when new fields or structs are added
to the union.

Also, please align the lines on the '='.

Thanks,
Yazen
