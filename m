Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D63368A2;
	Thu, 15 Oct 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077246; cv=fail; b=BNirwZu+uLLkwdwQBO1SOqQO0NOtbf2TsSYMu9bTMI//G/EIJERGDU6UbCT9x/P8zytGIt1ek9MD5HyGmge/6/hbZ8zHFx5opsNt92QAC3kA4eUwCSSdvTpR6MoLSSGZCUL3apgWz4IPSyJ3YhiGoRpusRcysFJkMe+4ToVUmd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077246; c=relaxed/simple;
	bh=3dso7vRGITaM7JPOlDaZPThSHTtNMVb6KqPehsSk6Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RKRK9ayWejM57w3NkUMoGqQUr4qnnpS+2ZSWSu3SijNlUTwdGnV4ul25bw0bTRAfXd8bArtHbic6p9XiiR5uaH9u47UI6loWkeXRNFiOn+tH+VqmClIDigt8BexrNLhWFjyIty64C32s8RG02dE7Yzmr66Q3aaAJN5QFdUIrcKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o47fpIp9 reason="signature verification failed"; arc=fail smtp.client-ip=40.93.195.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o47fpIp9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4lx7WZ96+KW/vjBbpHwFRAQ4x1fzQAwDzfYmUBP2pnHLBZdBf4GpR1LjYcA24iidvWsWiSRrFJtB5/KbQVFHe3UrunTL7pKDMlEdjOJa191lCBRfbrVvbOX1/80Fg6G1eWh0aAZo7bXqwoz1ijgtY5K4Wkbu3/L8rt4V5fAx525C7Zpysoo5TxRLWK6LlcB/6yyTP2tvF8YCoHHy7GyJqATi5eCJugDbT7xciKbSYlMeVZIQ13Q2CkMNFdqrlR4tXW9VkQiszllZbS1g0swmfEEK+xIsbA2t98WjGlJ7Ei4Jb+JFitW73wVfzUyPRb3V+qGlNJuFxqimiEbvrotNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZVqZGI3IKsaR0mer9Do4I5lbvMlKC+vnfyaUQ+fmHk=;
 b=XwuychTm4zDfFlVmrHHXLAhSbNaZGn70giEk5OXjaH4i2dl/1codgyJ3EpSIPLXbYETvNIZvhbhhW+eCGfQyMs7K0f5YuFGqFCQpNimvYAFfQ0BnnPmS08FjQxUjKL6Xm7qSJ0orMWvdKodKDr+2t6nvflVpDU0kZoFejznnfN1FeVaZOa+6KMGm+zYydS9hqqw6Yww8T4RJiZInHSWNrL+1j64rbNTd6W23xa/RXgZwJxIUJ4XhF3m1LcQnz9EOBnFvBXZhHoabA1cOd6WUbaiJbrpemubr5fnkKRFm+g6ybRKZClG6G5V/zBH1zIvTwF8+H8KGtp0QQB9Q74JcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZVqZGI3IKsaR0mer9Do4I5lbvMlKC+vnfyaUQ+fmHk=;
 b=o47fpIp90wpzGoPCDk/RLLDsU8UW2kV7Ed5WyASSqCFOrcDz3fW2JnUDoUovviepP123RjM83xZJv6qipSFmjNjcEGXfCqJJm1GeQDJk46ipMvQgROqXhgsx7D6WDJK3X8/1/C+cZJGz/8VrOHcQzW2kgItOGvesNKspzy8zgGc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS0PR12MB7875.namprd12.prod.outlook.com (2603:10b6:8:14d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Thu, 15 Oct 2026 15:13:59 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 15:13:59 +0000
Date: Thu, 15 Oct 2026 11:13:48 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Eirik =?iso-8859-1?B?Qvhl?= <contact@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] x86/mce: Reset stale per-bank state between bank scans
Message-ID: <20261015151348.GA5279@yaz-khff2.amd.com>
References: <kUFp15ffSyDl005h7gLuz1YQ_jDrCgR96A_Q5mxzpXl2BmMNfFHo8hivkv7Qx6NZ6M__9iM0s2nFwDnjcBO_wcJ9-jHHIp8IrgfylJ0av6k=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kUFp15ffSyDl005h7gLuz1YQ_jDrCgR96A_Q5mxzpXl2BmMNfFHo8hivkv7Qx6NZ6M__9iM0s2nFwDnjcBO_wcJ9-jHHIp8IrgfylJ0av6k=@optocloud.no>
X-ClientProxiedBy: MN2PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:208:23c::22) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS0PR12MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e5c6ba-16a1-4360-7a34-08df2aceeff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YHEPRPs/VM5w0l4mpY3Vr39jFn+Fk/yYtL/EKLnapNjqAhjOWIgYPH2efZ5SjCjoTeCrWutXhwunIrFIOFSL3QXXz5gbdbbG4LeXHPNtY/FPK7N+ZcP/cgGlWSb2AbpEG5ujYpqLXBLhpd2Syq+ypbmuYY0OdMuzymQwxM7wrpag0o+Zxa1dGSDMONDp3QonCguT6oEKhRSCpevI+CYTuBHDqRLXlZwaJV/PWjrzq7NkeuKBuyTfHLa1U9yek2vkFS0zUGrDFZUiRQrcziduDNLgJTuIZeLd31InGnighkLo1pqoVSYaH+OwC+NpKOWLCdfCGZ2TxYekdbNTs0J9g0ngjIFFmBSFQfuO/tPr5i3TKiiKrGUL8JAyEcRYlu2b2uTufW7IKp1e2GOt1YYgd5fFrmJUzbXOZRCFc7t3unIbeguldWB7tppkrEu+ImXNm52E/wMhEzYLPQhk6v3Cr99dajtzjob4iyAxwxAouNCIJ7RhAU2HgjZvspoJH2+f7dwTMndLKiuVF/WyMP8ggRPydSCvn8OCsevMXJp/4rY1UW9UIS68trT+LR1sRXJg7LhVKnYiM039xVDzk9lmplL9/MrEnYxSvmi760gHFMOfLorG5CMGrX+F1zu50/pXVB0TYeQ4JtEg+gR01CKLDVtXI6XJvK91IkrqYCD3Kbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?b5p12iNMznzY/AGqQHS5Cxj3Rtpqpy1s4THDzoLb6isNP9rcuJVN6fFNVf?=
 =?iso-8859-1?Q?qghojShgzsA3jowwgWZwM1S8ygAmsAz0CbrG0Tl7xYPXHS4ibsf+rTruAI?=
 =?iso-8859-1?Q?84+LDJt+8udeZ5cQNgaac1kzDHybvRcfgeCoidFuhI6otWhTq4sHd1PUwm?=
 =?iso-8859-1?Q?PIIIorGgBuylTLriw97PwsAflA3D25CKbZb2RjrV7T4Bo75lKONPg6qc7/?=
 =?iso-8859-1?Q?FY2Uuz72qtC8h3k7hF8MnXvhdEJNsIChb3EiQZjeHjXFP2HDHGvNMMOR16?=
 =?iso-8859-1?Q?YBb2PEMaSWxuR5+z5odmxqk+H4Omv0zCe+P2cjrFqNaUZ3X4gRyzbN3Rmv?=
 =?iso-8859-1?Q?OlT27Kopjtl7tM5bMdT4ohPBmTBefbTm1igyVbKf0RVNHvQXrIh2LsIrST?=
 =?iso-8859-1?Q?eSLzL81ZRSGNoQcwZUm7f0bCewJC+K+pU9ngDkNH9mEifCNCJRaLz3P7VG?=
 =?iso-8859-1?Q?i1TC9ucHYUJjDfMShIBC6ruSyDuzHHyD0qyV8oFxI4OrWrzWSnr7ArrDNG?=
 =?iso-8859-1?Q?HxjTNiLsRAc37gAmMCSwilE5x/Th4uvkq0FxWwA+Ca7xHO3lRvz8cm4+WJ?=
 =?iso-8859-1?Q?ZkWFYaXZ8uuSHi0BB6IijrkwrCQ/akDflXEpw07hzG71feGUNx5oEl8T0Z?=
 =?iso-8859-1?Q?Ht5pqiAbpSeE9ywWOCFzcIShwM5sG/B4amAq2spimgoehWzLauXWVPTzYZ?=
 =?iso-8859-1?Q?TXnqARH2cZjZXHzdJjsLjbefm+v2XH9BfW3oy7i08yxKDHgCuFaBWO1W2V?=
 =?iso-8859-1?Q?kBKkHG+CObzqCrNQWxCKC3fdZWCfdSD9jxqgrt6rV1eJ9Ipc21H5yp4NxT?=
 =?iso-8859-1?Q?SXN4jKVK8oUyFIzfis3tvJln2yj9eGM+Fuv7WRGL6G/uFjL9PXmUfRbwWi?=
 =?iso-8859-1?Q?NlkzZrsy/XakqMjdKkIsKilEuBnIJszLmDJ2To72kypHVHbL1w1BMogF1c?=
 =?iso-8859-1?Q?cMUV0T86r3knsRy5Bhvv1dK4eG32deW4UOxOkcwHtwJr6rN1zJ5FKNlI6A?=
 =?iso-8859-1?Q?Al3pBdTD7i6HiLUtuXwiS9lRAsyzXn727NrfECd/AzxwX3DUjqkUb+3jpn?=
 =?iso-8859-1?Q?g6eoEs9TQK+IpTOAvgGMYSX++3UZs1qaZmiBsr2Sggc7svGXbateSRNX87?=
 =?iso-8859-1?Q?pn/BOY8tqCmCAuVLq/ZvP+Cr4hPd6YjlghEU9uIw5umwHqjCrs5EOGRUlP?=
 =?iso-8859-1?Q?laSECIAIBkvpPJdDgljPgGV+JPgmUC4k+nz65PpsRMgnbyOIm2qTW2L54Y?=
 =?iso-8859-1?Q?JUj9GTnc0vnMsrNLn1b3GA+i3JsUOPKGClnJdwqQQ/imcDAhjVuyzkv6av?=
 =?iso-8859-1?Q?nBCIyTqYy2DOkG0LFvyPemjKn/dj6j8FwbekOMJM3LxP4OQkbjS2n0WjCs?=
 =?iso-8859-1?Q?tJ8h8CFCQ91d3Pe2vUa2JBjnOOaVJsYlIqp8WcLVDivyIwBNQGYx3yRCYf?=
 =?iso-8859-1?Q?yX5rCvoCuYiNwaKiBqa4XVat6s4C6tTV4QcBnxyoliMwVlnyb13++ePwmo?=
 =?iso-8859-1?Q?tDIgj/Tjn4QYIZOgFnrUZgH1r0IPnQNy89aNnX8m3dZitkhZlYRgBPNtMN?=
 =?iso-8859-1?Q?i6j8M/7cD7oIyHDpbKHla/Lrc1cJhnxXL/NasE9AT6ZKBwEz+zkl08jBVL?=
 =?iso-8859-1?Q?/n81ladXn7YnEleOqxguGH/hnBa68OmENG3Fw/AeTUSzjTi4wo7f81JFbu?=
 =?iso-8859-1?Q?egAZF3UECoCPTKCWE518unlegR7DzTsBrlXU9jrovbGBDGeH7YytX09Vf4?=
 =?iso-8859-1?Q?YEuA6YqiWLvZAxeyTvPjVDcRXgIHd5EBIf20Niz7NFbJRM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e5c6ba-16a1-4360-7a34-08df2aceeff4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:13:58.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puE8eXLVagQsceq5SzGsrZEgQh9hbm3/mntu+eHPwnrZu2pU0B6KPUbEtzNLWCS7s+HxA72i96sCny6TiKU+2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875

On Wed, Oct 14, 2026 at 01:01:39PM +0000, Eirik Bøe wrote:
> From: Eirik Bøe <git@optocloud.no>
> 
> machine_check_poll() and __mc_scan_banks() reuse a single
> struct mce_hw_err across the whole bank scan. The record is zeroed
> once before the loop; each iteration then resets only MISC and ADDR.
> Four more fields are written conditionally inside the loop and never
> cleared again, so a later bank inherits them.
> 
> On SMCA, mce_read_aux() writes SYND and synd1/synd2 only when
> MCI_STATUS_SYNDV is set, so a bank without SYNDV is printed with the
> syndromes of an earlier bank in the same scan. Decoders are expected
> to ignore them when SYNDV is clear, so the stale values are cosmetic.
> 
> A stale m->kflags has two effects on a later bank:
> 
>   - smca_should_log_poll_error() sets MCE_CHECK_DFR_REGS when an
>     error was taken from MCA_DESTAT. A later bank with ADDRV then
>     reads MCx_DEADDR instead of MCA_ADDR, and amd_clear_bank()
>     returns before clearing MCA_STATUS, so that bank is logged a
>     second time.
> 
>   - mce_default_notifier() prints only when m->kflags is empty, so
>     unless print_all is set, a bank that inherits the bit is not
>     printed by the notifier chain.
> 
> Factor the per-bank clearing into mce_clear_hw_err_fields() and call
> it from both loops. Reset the vendor union as a whole so later
> additions are covered.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
> Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} registers")
> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Eirik Bøe <git@optocloud.no>
> ---
> 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
