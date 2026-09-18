Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73E51DE0F;
	Fri, 18 Sep 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755904; cv=fail; b=qUbPkqdC7Nm1V2MBOjjR245u3xUEb7nHhPqhD5BO4d+s7kWDPlZ8Kiyk3Y4rTx8S/rgEnfoE0yWJ+sjTl7aWYdgSI7Z94uMMnSHAjLRk7Gw+71iKttU4Q8MDy4lrYTFAWOGHYg1dFzFkX6LnxiT+pVAwnRHBG3aTC5uRzSVaz68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755904; c=relaxed/simple;
	bh=7xBKYUhP13BjRHZ6/TkSEO1i5T3TMYt+KN5AW9mPmEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MC9U3buzd8WayKuFfJy2qqEcs0tiAg4sS1IUNlWK9NqSSmjP3Z10/oWjgmFfY47RQBpb0P1zehjI56RIba9elDcAc2TE43FI1L+8oA3KLharqkY9E/5JFJtknPcEnq4138RFRednsz1pCgIQ4Fl1u5xZPSDzs0IhEMKz+MeaBeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q4b77BLx; arc=fail smtp.client-ip=52.101.62.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q4b77BLx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+889nJIaQh844Akw4i5NK7SqrG/vrWr2XQ1fI8FyIRbLQWCIGKDJaS79fUQZ/xnvsN/9+M6ii+a4UjbB0zOwj91ojlFDf0k+GLDTtjEUi9U1D4mOQ18w4VXpMa6YqKpekCbuUMWoMm+F1B+8pmQ2qMSzShksRui054LyHVZ5tQjURALCbKUEqoycqW5Rf4NVP8z1PGl4OcbuWVJVYmYY6UUP9LLg19N9/qsNeXKRTnfh9GkFLtG8lHZ0knFw6mobylFuE/x6x05HvNe+5PDxXemP01r0aG/9ZkaYIw8o/2sIsTSnhqut3ZtHJns2oynaCSt9CRvcnjJ2PtA0abR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N27kUA8nOp7AZyMO51B/Yxv72xRKS7lhAVo4remQVRM=;
 b=TaiqZudSa36LV7Ubn1MkwJyYD6hsPpkQ/yGacEjCHRHotsTcGwQ6ysPN7sLPI3ZZxOX/s9pro9NfNXyNDCPfbpUgBS27ydXtD2WIjhSceFYx/PApqibPqJsl1D+0WacEZgstRHZ3Zbo2u828O2fVXoBE0aSDkCulJCZ5ZjGhf8igVubWVAJu2UPkbRq7W3UPr8/W1UpPC0NsrA55hHBfW+/0tKFhTxkqYOg5dbYrZxS4r2D+4++t64n1bjRvREcfJZ0mYoka8zU3F7nEmfsmzADL1tU1XqYphaHa4090+dIcuBwc3+ZifBMsmdPuKMT2H0h4K1y3aT4nc9UPHM9x3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N27kUA8nOp7AZyMO51B/Yxv72xRKS7lhAVo4remQVRM=;
 b=Q4b77BLxOJr0ECUV+shWolqhiqUN+HE2O1E9cqrgl8xcAe4WPqvBJqlLZ/Xjuk+I3LqM1qEGNR9vUakJ5q2NTJ72j8epsTbqmCOW0EvMByNhq7CtUlG5e6DLWGMJgruI5e27Oqn9A9hVKcQP3I5BWNEyeeftdz0gYA2C+NFCwKw/wDcxKwSvFLx4I0TlGbZ2p2Jv8YtCr6OLDgxuZ0JnbFDlba2yX4IAX2Z+oAjL3OPoCpo7Qhh5QwmbaY+Ln9RvefRzrhEfVxC8cJckao+yxeop+XNzVPKBqiU43zLwzsTHLmMFanymg7fHsgNsrYaslKeFWXhhJXmSTcloylTfJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 18:24:54 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0428.008; Fri, 18 Sep 2026
 18:24:53 +0000
Date: Fri, 18 Sep 2026 20:24:43 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
Message-ID: <aq2B612KT5JGdsaf@gpd4>
References: <20260917140707.3807229-1-arighi@nvidia.com>
 <20260917140707.3807229-3-arighi@nvidia.com>
 <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
X-ClientProxiedBy: MI1PEPF000008CD.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::43b) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: d865a43f-3271-426d-bd0a-08df15b22259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|22082099003|18002099003|3023799007|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	EHm9P17GtOVEbRNtM/vdBbvoT62rxELyPQBuOfaZL1eoPOXSjnApguJlV/s8Zncf7nCCKYeua/Zy5szpAELh4kuuf2oyq8Df8kOButLdYwOWzXwopmJc4NMvsVAxqlQLC+S8DelYD2mI9+Lmgxf4rRpaC7NbwAWlkUV67R/WvWFAYGsydrAJBTkxDHlJUtQCU3+JFxUfo4EHcauw+4kN4CG0Cbowu/2YE80UWpnNo2u9z81m238kgsSxme5FErWhsYjkfIn81IPRsAVCaaaWD28BTYjw8RUW2q7nCOdGU4hfIUS2yQtZWmycxKAHjTP+Q4EZm7ur1LaGVcgi4U4+VxfEvdn2mvNWfTNWlaSySZQF9/lJCRtkwrSHACDgdYwbSNCZ4OCEwrBqoeW7vGO6r1YFW2j7xcNv3sQsEzqqX2eEDNAoHO0W9VwuG6amz7mkWCpiBf70tW/CD+EbZDA1Kdlr0Sb5F4TVUIRdOEwOmlCU++ULJOnKPJAlpuoHpbI+kEXbgiHlmyOMR877R9iVb71l/FbAFBEgIHk7HiECYnqYCMRAPGN6ZNMjENQFLp1ENJlQxUy+qPz4jJyljgJ+JPfwpSL2oqb0xUUbzsaPyP/5pmTF9HKkT9qwt46fqFPzfBIAYczKRgXOaSxxiqtOs654lhp8ImfgPZZSJ1z9l8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hpGbk7I3jJuclTN9lHgVXDLoAPuxws4jNAknj5SlBOWJwVlIfAb9QQ+nWO3c?=
 =?us-ascii?Q?jTI8YDYcbjpeWGVXlBoTHfHmPexbSSNB9k+WZuP+kGAm1vYXjFmWa3vHbmNZ?=
 =?us-ascii?Q?5FU+n8peWrqp0zE72yUSOJk/Qd4J83nVlI6aDEZQEfhFRHf1RXHQ84ETYehq?=
 =?us-ascii?Q?npHMJ+nZKckP9Igf7esnAPWF55B46VRzTACUy46OYoeEMERuWO5vnDka8Ovu?=
 =?us-ascii?Q?nCfS0Wac579f4tJRgL96hUT0OS38cOxwtHAi5h2w7KBe/bf6mDvxzPTsaBIJ?=
 =?us-ascii?Q?wjjakCGV25gn/Mn61bwS4pvdA7LtL/mNPSkz1Fb5A7k9DgIh3zyYMuozViEq?=
 =?us-ascii?Q?AnMiyorPWyDwJzhfJmINEVqT7ZfOfaZYmQOEEOtT2RkVgtw1IzzNvyFGW/p1?=
 =?us-ascii?Q?hSo4Wsay+KY1WB3ggNVy6hhLETuhpVl2wHplchjNCQ9BRsCWyTt7PUyjvX5Q?=
 =?us-ascii?Q?lCmRPBjXof4CsHbYL6VNena89Ef36jUfdilQHqPMOak/mBU7TppL8Vyd7xWP?=
 =?us-ascii?Q?BxdlDTpuEATJT2RFXH29PQC1XanATcVnB3gZkV4CihP1JjU/CjLjjsxSekro?=
 =?us-ascii?Q?Yi8LSiKkX3a/SDzA+FwKTU7XXo+tAwi0JEvBuOx2KHDE6sYbVBx+bgXVrpKm?=
 =?us-ascii?Q?FnH29sGm83KRPnv4RNMWbbAWPaO2yzCA6y/cZh3STnOpZ9Lk2NThqLnnwBMr?=
 =?us-ascii?Q?33I5Jt7gBaR2FPt1pqqDnlS3eTPWzXh2EkHPcnxtJW7PW9Z0KWdbB1Zi21+2?=
 =?us-ascii?Q?FNI3tisveoCfErdufEF6+Te2pNQ5gMMDhVbt4N0+ELFaSQxFCszL76ezEUj+?=
 =?us-ascii?Q?JsDbZAWovBbvE55v0isNO/g8vl7UYpwoVxT83Eqt0kSp2XejOvboPK5M70cj?=
 =?us-ascii?Q?O/KouZbDd8SDihTFwGHYVZIDFx1K5CBKXDJbVOdzESEYozfSs/IFQ98PlYKr?=
 =?us-ascii?Q?A6Tk9/OAnz1/ROLiWfq1Sqke31/EudtZ84Zcq8vxDrYaT6z9uikykCy+UfkX?=
 =?us-ascii?Q?0upd5rSBw+Wgd1mcX+qNj9jeDPhqipqjo7WE3Weg5BbKSXbvpwAyFdloNJxY?=
 =?us-ascii?Q?iYHe/RUjAHCVZyqayhe5CeqJewzOMmYv/bUKMMRyNpVkCGaR3VSjss6RiaP4?=
 =?us-ascii?Q?cbGFEHH9LwfTf417oMoPwzM0SDbo3Xr3PWlFc+acU13Q+c7raHyuM6hzpS7h?=
 =?us-ascii?Q?DJUHUW1hfqy3QgwiYRhiCb1X3DYwgHV5GOvZe0Iu4O35sIMzErSk6ri8NJgc?=
 =?us-ascii?Q?ZGEOVUtNb60W4MZgjjBIcpfH77xkvvZUHpy2io6ZzcPrMkCF2kM37R9r9an0?=
 =?us-ascii?Q?LUqQhKtkpfcdWnTYl61+IbIiTh43CrOTemdVWmk8zonDLBuX8gPpjNuJcAFl?=
 =?us-ascii?Q?MFEY/BUir/r6vMHTDi+xDVHtUUNqW1NWrskUGNNADtACqYZqfe9J5RSFBZ6l?=
 =?us-ascii?Q?080rmKn8loB1fanxpn1K7o10p+cZwPIHKtgFd3UpPZAuIVnotDLBNKlUYeBr?=
 =?us-ascii?Q?IuidOhyFslL6XQmXKexAV6uCHrGLPiVmitpXbvpncsdhktaWlaffYwUoXa+h?=
 =?us-ascii?Q?qIenKm7wPvQQ8dtRfELjrMjopACRqv7VlDH6bl6jQefQAM4ds1oU6sMPB9eT?=
 =?us-ascii?Q?+e1u6csS62TMQwwagF2XhaKIAbk/6jxRH5CwtsHA+0qeOUnYQiYdxCxrCv5V?=
 =?us-ascii?Q?PtHje42QJhbzJe11zjRyR58FwqLvdzkVz/f8HjnnHwFmTGfLunXTZgB51GSQ?=
 =?us-ascii?Q?cA5Nf3JNbQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d865a43f-3271-426d-bd0a-08df15b22259
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 18:24:53.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpEovwtcqH8EtyjoZkZJHYXD3C6mK1tsV4ujevnK90iFwtlVJ0/lRFt9l0VK54ndilypvwspBSLyFin5qlk31g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471

Hi Shrikanth,

On Fri, Sep 18, 2026 at 07:44:25PM +0530, Shrikanth Hegde wrote:
> Hi Andrea,
> 
> On 9/17/26 7:35 PM, Andrea Righi wrote:
> > Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
> > at the SMT scheduling domain. Some systems benefit from the same policy,
> > but their firmware cannot currently describe the preference. Inferring
> > it from the CPU model would embed a platform-specific policy in the
> > kernel.
> > 
> > Add the sched_smt_asym_packing boot option to override SD_ASYM_PACKING
> > at the SMT level. Accept auto, on and off. Auto preserves the
> > architecture-provided topology and is also the default when the option
> > is absent. On and off force the flag without changing asymmetric packing
> > at higher topology levels.
> > 
> > Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
> > also covers architectures with custom SMT topology callbacks, including
> > powerpc. When forced on, priority remains defined by
> > arch_asym_cpu_priority(). The weak default prefers lower-numbered
> > logical CPUs, while architecture overrides remain authoritative.
> > Siblings with equal priorities remain unordered.
> > 
> 
> Wasn't this a temporary solution you wanted until the firmware changes are
> sorted out? or something changed in between?
> 
> If yes, could you please capture that in changelog or in comment.

The firmware-described ACPI property remains the preferred long-term solution.
However, defining and validating the interface across firmware, Linux, and other
operating systems, as well as completing the ACPI standardization process, will
take some time.

The command-line option is intended as an interim workaround and as a fallback
for deployed systems whose firmware cannot be updated. It allows users to enable
the optimization independently of their firmware version. I agree that this
should be explained more clearly in the changelog.

> 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >   .../admin-guide/kernel-parameters.txt         | 11 +++++
> >   kernel/sched/topology.c                       | 49 +++++++++++++++++++
> >   2 files changed, 60 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 33cd30996e47e..36c3b2e563441 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -6799,6 +6799,17 @@ Kernel parameters
> >   			solution to mutex-based priority inversion.
> >   			Format: <bool>
> > +	sched_smt_asym_packing= [KNL,SMP]
> > +			Override asymmetric packing at the SMT scheduling domain.
> > +			Format: { auto | on | off }
> > +			auto: Preserve the architecture default. This is the
> > +			default when the option is omitted.
> > +			on: Force asymmetric packing at the SMT scheduling domain.
> > +			Idle CPU selection prefers siblings with a higher
> > +			architecture-defined priority. Siblings with equal
> > +			priorities remain unordered.
> > +			off: Ignore SMT sibling priorities.
> > +
> 
> Wasn't this option/parameter to come from arch specific file?

Will didn't like very much the idea of detecting this through an Olympus CPU
quirk and requested a firmware-described property instead. Therefore, we moved
to a boot-time override that avoids any Arm- or CPU-specific detection for now.

> 
> Isn't it going to be confusing for archs which don't benefit from asym packing at SMT,
> but now there is kernel parameter to say on.

That's a fair concern. Following Vincent's suggestion, I can drop the auto and
off values and retain only an explicit force option. Without the option, the
existing architecture-/firmware-provided topology is left unchanged.

Thanks,
-Andrea

> 
> >   	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
> >   	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 0248227d983a7..cdfcecf673fd7 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -32,6 +32,46 @@ static int __init sched_debug_setup(char *str)
> >   }
> >   early_param("sched_verbose", sched_debug_setup);
> > +#ifdef CONFIG_SCHED_SMT
> > +enum sched_smt_asym_packing_mode {
> > +	SCHED_SMT_ASYM_PACKING_AUTO,
> > +	SCHED_SMT_ASYM_PACKING_ON,
> > +	SCHED_SMT_ASYM_PACKING_OFF,
> > +	SCHED_SMT_ASYM_PACKING_NR,
> > +};
> > +
> > +static enum sched_smt_asym_packing_mode sched_smt_asym_packing __read_mostly =
> > +	SCHED_SMT_ASYM_PACKING_AUTO;
> > +
> > +static const char * const sched_smt_asym_packing_modes[SCHED_SMT_ASYM_PACKING_NR] = {
> > +	[SCHED_SMT_ASYM_PACKING_AUTO]	= "auto",
> > +	[SCHED_SMT_ASYM_PACKING_ON]	= "on",
> > +	[SCHED_SMT_ASYM_PACKING_OFF]	= "off",
> > +};
> > +
> > +static int __init sched_smt_asym_packing_parse(const char *str)
> > +{
> > +	for (int mode = 0; mode < SCHED_SMT_ASYM_PACKING_NR; mode++) {
> > +		if (!strcmp(str, sched_smt_asym_packing_modes[mode]))
> > +			return mode;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int __init setup_sched_smt_asym_packing(char *str)
> > +{
> > +	int mode = sched_smt_asym_packing_parse(str);
> > +
> > +	if (mode < 0)
> > +		return 0;
> > +
> > +	sched_smt_asym_packing = mode;
> > +	return 1;
> > +}
> > +__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
> > +#endif
> > +
> >   static inline bool sched_debug(void)
> >   {
> >   	return sched_debug_verbose;
> > @@ -1950,6 +1990,15 @@ sd_init(struct sched_domain_topology_level *tl,
> >   	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
> >   		      "wrong sd_flags in topology description\n"))
> >   		sd_flags &= TOPOLOGY_SD_FLAGS;
> > +#ifdef CONFIG_SCHED_SMT
> > +	if (sd_flags & SD_SHARE_CPUCAPACITY) {
> > +		if (sched_smt_asym_packing == SCHED_SMT_ASYM_PACKING_ON)
> > +			sd_flags |= SD_ASYM_PACKING;
> > +		else if (sched_smt_asym_packing ==
> > +			 SCHED_SMT_ASYM_PACKING_OFF)
> > +			sd_flags &= ~SD_ASYM_PACKING;
> > +	}
> > +#endif
> >   	sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
> >   	*sd = (struct sched_domain){
> 
