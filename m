Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450827;
	b=1gwXF+tIult0qCASs4wOsuKMFFkjC0n1uc7udrqLfr/tYVvmtNUDgrPG1hP1dr06WLIe
	 Fw6kZjSzRTc1xaH3P6k2mFi5JcqR/Vd4Fhrt1guaMOSUPW4GkY/m8dC/xxDlVwOb/EPJh
	 NHAnY4GK466Vy0H+o+iB9ouN10GH5m8NdZ7en/gho/lbani3j+E50miLoHNFE60zK6jeO
	 CqLxMy95bJDfrfihqpzrM8zOhdDYHfaQjOpRfjp84TO2/luCIfJDqkA5rCu7nprIgZXep
	 VEgRUciUaDWv9DjxjSb3Mlf3ScpEzlSg/hgZQ1AsIIi0Lfjxg/Z+ryWbDK7CQSFkUEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450827;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/ayVA6hdtoSu84v/ifRbVIX3flOgAnYmQs995Rp3kro=;
	b=19jPkGiey5MZZD9550Ec011nlbBjBfzXrvtgvFJiVJcmjeYNTQVCO7GdM23hWbH8OTQR
	 3/X3totZ3RSFICx0H7UiBc8uR4c4ZOwZ31vP+j351hylMenaYa4bc13yiUSlyM74jy1DP
	 RJMNUdfznAclW9M+E65j31L/7/yF00aHoO+8tM59T9YBhx8cMIXLbbKkkl0tC/tdoqL1D
	 ZtS3A8gJYu5Cw1trY2o6sei3SrUMkxXdtpURJuMQ+Bx9DQwlZx4tX32Ok0LtG6hWfE7sv
	 AiqqHeaPIcnRVRQVm5mmk5hqgGuBJWOCkYv0Oykq2STE47+yYx/0qoAaNAA9iiXWCYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="mE9/YIXT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.3
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613BC606A31C;
	Mon, 19 Oct 2026 23:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mE9/YIXT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkGPy5G9wTqpBVlCLEUEdmRVGziUTogPVWVrJV6lLWWtWZKn4Cr6R961c8bd9cYK3irdp8/9Y6DQ014VVHFqwrxjK1Fd3cwNEqSYRDybvFTg3j2mLOhAHH4+8xp9uuX3HabBLgDQZlSAPe+1rQq3qCIMkIcKxRQbUGAvTgndX+TtWKjsdzaEzFESdyRGYDge926w5qjSsC5IUvZrwc7T5jtPk5nDjoQoTWGVuzcGdkPI1C1Re7GGmP697WwqnT+uUQ0SCTC7L6k0aGba6hlO4/mGTDLRAc/fvphRv6EPtikcLcJA4eOxw0swmrz+dgyNxhInInAcbIA59zx7mjNVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ayVA6hdtoSu84v/ifRbVIX3flOgAnYmQs995Rp3kro=;
 b=UJXD/r4fwblDnUH4WFJSFkJE5clVcP7r7OKUkwJMeksS18H/KL6qzsDKKpdVeruy6qGkXN9ymD+WNLi2DnNMJ29GQxG13SHPB2eaHh0yfHhzyjg2zjwo7V1OGnQCKo9dZ8Ilm0kiHzaWTD78pfO50XyALRfJkPlhGn/9M9Qj30/+eNMsLFtZVHQ6Nn2dvIPY4cLDt5UGVdXy2lLRP5XXln+vE8aC+mBVXox7mCFwnrd3sO/LoD+QTlDYR0TrFaNV7saa7c7cSvU9ndm97lBvUZ7u/i8QWNh677DRGs6aHHe2xVXWQpa9F/F81zzlAhwBzPRAXR0ftlwtHwhwn9KxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ayVA6hdtoSu84v/ifRbVIX3flOgAnYmQs995Rp3kro=;
 b=mE9/YIXTusUSS1Y9igRV0z27JTZ7yL/LCackPG4IiCKtX58qchbwQUzzyOuVQHioopQHk/3BHR+PsPI7033Xny1n1a+i3fQOOfBFHo1KQu+Tgk1IDHBJUDZ4kxyNemGEZBnYBrDZPCw2ol2DkLkc4sRt4/WWrepTW7opNXEekNk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Mon, 19 Oct 2026 23:00:17 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 23:00:16 +0000
Date: Mon, 19 Oct 2026 19:00:07 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kameroncarr@microsoft.com
Subject: Re: [PATCH] x86/mce: Report unavailable MCE support at informational
 level
Message-ID: <20261019230007.GA547201@yaz-khff2.amd.com>
References: <20260923173033.4104944-1-decui@microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923173033.4104944-1-decui@microsoft.com>
X-ClientProxiedBy: BN9P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::24) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7250b5-dff0-414a-2c3f-08df2e34bd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|6133799003|18002099003|3023799007|22082099003|10067099003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	b78KbdP9f/Q8Exk9bvElrFCHgwS0l79IuEbJBzLitj1bhpn7qx/Tq1I/w/k90ENkirH0fz2/IQURnrUAdpjr0lrvf5oyxcHLlag1T8YXWdUH3geZJXCKJ8RKs0tzIij5HicQhIDMunVN5rkDSK51QEgSD3iYXsx5U76XkIz5PDKmMDrH8TDw66P62EPrqpPRqKp0ODF3NeYRVv8N2aqVUxBgkNTXHjl+vDIs/sFFzB3GSWD9UO7bmc07w0rx/eSyuF0YUC0g24B0+UdYauuMdB4kBn3kRxdEYufgn2aaptq1S5C/TtVWBKvwf6kR2uuYweaFP723xHI14mC+4ORGzSVhhfx+45d4e5Q8CogvsWvuRvsbSl+724I/kalCXyziuK9ltT4SbefnoKkdxlhVPIUVSC4m2Z/pwxJa5EzCut9T08pL3yV2nOOL2aQddNOThyd/BYA0ZwiayiCskVTUaEECiDID0TTaDI7MZgfQHgRZWhAe9HIcDSbBieiJR6WvxA4zpNpv4OkgursWeTwTzqPUyKecVa6YQP8B46dSU2FxOA0UKHZqEJXXOMdJJitm64dkWCjjGfnGb/s3moGMFvFnwu7yLwRTQKZqU5vGQ5ZRBjAEWwobmAdLerahPMRpZHTBBc8royI/Hsm8i7S8906NarcJ6SaB9JD5x7mVLf4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(3023799007)(22082099003)(10067099003)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PDcqUdQdsz70GzRg3nzjB/7nbqor7vgQsCUOYIKrntnDOPXHHU+8atH7DIN6?=
 =?us-ascii?Q?fB0kFv5qMCoIDbyGDO7IMCTeXQT3h9/gY8RzZ4BGhqJOj5wfDXWq0q8GHQHp?=
 =?us-ascii?Q?ALN6fM3pFtg/sQUu9Sux9GmBDhKUWxDbLxBbb2z3mlgk5u44Wob8rj9N81Km?=
 =?us-ascii?Q?/RTD4F2UdSr3j0TVdEdxyGg1HYjsG5Ozyg1NxKI78lswG8rdNwPkKprF/v28?=
 =?us-ascii?Q?Hl/7SLbn399H74TRZeW8hEEgce0C5wwwplS4fWfM45V9+mYDwaoKWBZvMb3b?=
 =?us-ascii?Q?POMz3NZ3vLpdsWRYslNb/QPKVZm8CvI/IIhjLr4MNAWvlrgZM945yqxNRHN1?=
 =?us-ascii?Q?YORyJQ/AUrmyrFjB0sWwgI9OPtfqg6D6NspR8HFGZ7CIhjGErwUlP1puckgQ?=
 =?us-ascii?Q?YYn4kxni5i+WIC7wbKDfQwTxPewZa/ZQ82nMWWCfOKxTV2tnLe6Gmviu2Sze?=
 =?us-ascii?Q?TOGKUaCGh+ENWcAuRYuyQ5fDg0sS/SMY+5eLLuc6C0o+6E4SyxhHu9rX0s1A?=
 =?us-ascii?Q?wH79WPdCjjijvHK8SXi8oFupCkSB86oWLyxZUa2wyQzeL6ElbIBkf3D6oPmp?=
 =?us-ascii?Q?EvCUNOwzpPGmr9KlgYiq5dxboXrQQH8cTHAVL0bqQklwYpKQe/T1mSffxxlr?=
 =?us-ascii?Q?cx4a9eCjU3WoikqyIYRF/kSe7X15QpqgV1EFk9XM+z/ZoPVNggD1wJtsCllc?=
 =?us-ascii?Q?tLp4IiBUSQdsZFXAP4zvpNk4zKQK4AF+XhutF4zzWGqpdVbsrjP5qllRQTrj?=
 =?us-ascii?Q?EvVvzL2NPjsMTjQolkNH+eX9FL0R0bz8oYZltqahM13faQR+MrebjWer6aPj?=
 =?us-ascii?Q?+FJ+kZZ+dXR+YjbFODsejl97MhRdAN7vlqm0JwKoHVvIv8qD2tvFukJu2kI1?=
 =?us-ascii?Q?reWIJASWwYh0D+xWqB7TW9Hi1PB+bbFDxIXWV5kOpW6EcFZPGF/YRsl0SNTg?=
 =?us-ascii?Q?Xgp4QfLWRKQuVPctp1l/eztuTwVQ3KrRARhb43Ptv/XDVmnfeHlVmP251P5Y?=
 =?us-ascii?Q?aJMuQDnGR0F4mD3exJv88EiJR0tyapex0x9Y9xIH7E+gjX6U1i/ykSbmHRhL?=
 =?us-ascii?Q?HpS8XF/f4wJobi/tUQmCH1f0TmlP70fArTwwEEvjyLejXQ4efaiH2Q0hjg0z?=
 =?us-ascii?Q?odoQixCT9aLwbO4L8t6p8wkav8qxtZMOOkiNsW1JF9kqTsju0tXaxDEQADHX?=
 =?us-ascii?Q?uI7vE3cHt0ZktP8+Yzjqfdvmdkbm96VQ94GD0CJHR2xQQRSAhsv380nKHEUx?=
 =?us-ascii?Q?L31Beb5BPG7+35PcplgHuQFzuZ2H6vC+6wn41VwhsZzwHQJ+PMbauJifA7a8?=
 =?us-ascii?Q?jP0P8g3oPkmm6gwovqrPNJB+Y0/PaKx9YLxfMjZaVERY/meEJb5g0ghdzg16?=
 =?us-ascii?Q?nOErLADyeLr+FVWUHCjlEgzjrG0Rf+cCHXvsORrZBD4zvGoDHbGHQjKfE59I?=
 =?us-ascii?Q?tJvx+GOyFOX+zMNpNBvUUrJp1IK4lDmIPCW/R6kuSPc/1tlzSWFIQF/8n3/1?=
 =?us-ascii?Q?zn96QBjmgCet4bFWmF0h78W5U+oNLjW4xx3+yt9oiVtOstKr32TWMvJeNfdE?=
 =?us-ascii?Q?r073WxdJCns+NbsyY789Ke3VtgfE4jYqvv86fjcLqrHg0A6dO5EK4wPDJ4XO?=
 =?us-ascii?Q?BhP0Y+8z+KMain88/ES7s6+SptTSY0swf297BK8pG9VBrPHkgKrCT6J2RfDF?=
 =?us-ascii?Q?A2bgl6zqJgCHY/o0T6upi2DpAuKrtze5axQyRYbyEzc+nRtnuaIwrIkYs0ZF?=
 =?us-ascii?Q?jP8DnzOc7A=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7250b5-dff0-414a-2c3f-08df2e34bd49
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 23:00:16.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNZGNGeUuAGVZKmhEf57BZuP2oNcP3HtEFwQGR4X5b6eSXO3ob/p34gOa/wV9KPJNWAh9h+qIFUaGrsvlRZmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706

On Wed, Sep 23, 2026 at 10:30:33AM -0700, Dexuan Cui wrote:
> mcheck_init_device() reports an error and returns -EIO when
> mce_available() is false. However, MCE support being unavailable does
> not necessarily indicate an initialization failure.
> 
> For example, a TDX guest with TD_CTLS.REDUCE_VE set and
> FEATURE_PARAVIRT_CTLS.MCA clear does not enumerate the MCE and MCA
> CPUID capabilities. This is an expected configuration, but it causes
> the kernel to print:
> 
>   mce: Unable to init MCE device (rc: -5)
> 
> MCE can also be unavailable because it was explicitly disabled with
> mce=off or nomce. When it was disabled due to an earlier initialization
> problem, the relevant path already reports the reason.
> 
> Report MCE unavailability at informational level and return -ENODEV
> directly instead of routing it through the common error path.
> 
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index f3a793e3a6c8..24ac10075263 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -2825,8 +2825,8 @@ static __init int mcheck_init_device(void)
>  	MAYBE_BUILD_BUG_ON(__VIRTUAL_MASK_SHIFT >= 63);
>  
>  	if (!mce_available(&boot_cpu_data)) {
> -		err = -EIO;
> -		goto err_out;
> +		pr_info("MCE is unavailable\n");
> +		return -ENODEV;
>  	}
>  
>  	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {
> -- 

I like this idea. I've seen cases where 'mce=off' is used for test
cases. It'd be nice to have an explicit message like this to distinguish
from true init failures.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
