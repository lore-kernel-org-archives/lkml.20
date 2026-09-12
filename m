Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CD31AF1F;
	Sat, 12 Sep 2026 02:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789179701; cv=fail; b=lhtzieEYuRPlBXWkNIoUveuWWyaxKNMzyYeOkxQABm4Oo0AwbwDNeikPDOHe6eMm735hl5VFYFCiBVUGyCwxsboQHrBb+MVHe9stUYGCtTMbYsfUSxHoKlK9e518qNL/4qSJ6gf4LLX/xEtZsddoNKxKG/OcqaV6J625tpRs/d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789179701; c=relaxed/simple;
	bh=KK2J1lji/Ttq9v/I6hf7INqAxBi8uOHSw4YvhadOoIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XVLJ+aOijAqMrEDabF41cyyTP6LPjMOUEGk90g2UxBlWVV+MuYJdrFiHjPzpZDhhqw2r6BwYdB9DiDKf8gTL4Q3zBGoxK8yRu6loDWmw5OEYZNBO7cHqS7QMigGofhoiEHnfayAAAzqRk4UTIWg+YDF9hwYQVpjQbnJsndIdI3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyblC19JLESmbVwKVlYNigDmmkGwNAwQMBlJ/htAP6tv+g1GiPGf3Oqpn0rEx33fYycgJQyB6sErtYfraY5rYLdDUCaamdB7FkLEf74ZpaV92m2RFwdEH/OzCJbUg6NrHQFElkgYyZU/omiOAeRnXnOaRE0+pnFqoW8Rs03R2iWel7WZUpjCb7wjCwP4CQDCKCsWhYqlA5QcnuAjdvRoV9tJ+J6ReJDkF9Fh7g4RdEcw6SBlD5QW45RLoC3wC2pcyWS19rPeQ+yL+qFoQixu3WW1S0ZuaHBIHfZ3BTGp/YZ1ij0ET1tUKrbQgLFagBIxrnAFf1D+dE7cbEB/rG+6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=cIqVuAeWkV6T6/BeKBf0RK/Uv4ADQCMuWnspJ9arR0g=;
 b=Hj5fsmpp7ZGxLBI9223uzq4GUOszU1X1a0a07I2vMqoTb6UgHnS1hehYAuw7sSINtUJtdYfxfANv0gboe5Rl7K4G40qITvMrtlgdbeJPjaSoL8hNDs8rp3oZ/5mHtg2/LP28lEQLHRIo2wD40WzpKkmoDTxYUuuubcsDdCP1F6vljZTvFcFAxXodiVn5Y3T1Tmyi1w8DfvP+cJxjiEg9HjaDZMZQTl/NB69axwVXam4WiApArIVu2vLjJcSDXHApabdxkl5n0JMtg7eQTDzpjveAp2eu72V0W8PYui8A3NX3SVEC58nrYpKMxZPWnvVidAqKZ6JQstxAYkRYDbdrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7102.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:337::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 02:21:35 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 02:21:35 +0000
Date: Fri, 11 Sep 2026 22:21:30 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] x86/mce/threshold: Fix concurrency races in storm
 tracking
Message-ID: <pk2l3bi6w7sb7mvazvd275dc6sazo6z44o3vyl3zuqbe3rn5if@lucvlilvsyqb>
References: <20260911201206.532113-1-atomlin@atomlin.com>
 <20260911201206.532113-3-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911201206.532113-3-atomlin@atomlin.com>
X-ClientProxiedBy: BN9PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:408:f4::29) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bea807-a431-459f-7e08-08df10749126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|3023799007|18002099003|18092099006|22082099003|56012099006|6133799003|5023799004|4143699003|27256017;
X-Microsoft-Antispam-Message-Info:
	vEi5a+CcMb1GxQiK1gyE0khGJHlsJutpd8JZPO8aAkhoPqfPdwkfOCR44uRWeoKK0QDXgmBRhrOtEyDGtFx220IkBNM5iEcdJsvka15wrA0Qr7/2WkBexxQYmA5UEMSVkvrMfVYz3RhQmPpePULaWH3BYFTw5dg+XQe5ASk8V28/eI+5YSqcZrlR6AsxUq3fDGuN5gBJR6N+6Bz38kZiYcSUQZQvTvIumPLwpO2yQtSkL/VkYs8kMRJwMXTEBssHs14K2Jjss95NriL9NzqxigluOno0kiOw0CCmNmvJ2xZTWfhArfaH4IJ/3+bNMLKpntXES/3XEYdz2bVIZZ3zbW4RjKXyCurFGZdjHtRRasm+Qu3Ei+LmUnmjOzMZP+QFN4XTvCDsbD0sVHMg/baAphSi6CSnkiW1iY59IzGrVP8e/qF42jbhpv7j5GUVz0DeYAVn6ijo5Tct3jsNR72p1D8aygzCMy3NlpmJ59fko09R/8WygTa40QMlR52nWVSvApNL+vdo6odkXPrXk3FARyuewPX4GxlGaYxG8TI7DbjakAWA7uG/sjenPWNWzVML7OGa95DZE8onpZoziWKHFVIJKhpJ6slBw60L37AhBkpp5L2OrIshl/MgsXUvnoK94YPvNmXYO6i9a5/8iOj/lOjhoAvQ127RUKdrpV/i7tnI+7WReWfYoVV9oCzC07oz3oyecXKF1V675iqE3SbcBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(18002099003)(18092099006)(22082099003)(56012099006)(6133799003)(5023799004)(4143699003)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWIyWGdPL3I1T2t5ODFlU081eUdOTlFaSmNwbi90b002TUF3QVhEZ2EwbmxS?=
 =?utf-8?B?OFFBMnRNU0RxczBjb1llalI3YXN0YjhMYjFUS2ZFMWNVRlRjcnJjdEFleWVO?=
 =?utf-8?B?TmtLOEV5UUV0QU5Xd0liZmJpMkVoREw2R3Jxb0tMbTFiZjlXQXkxRjVqWXQ5?=
 =?utf-8?B?VTRjcTJ6STJSd0JZeWJpSGdORWcxSWs4SFRZRTRZb3NibXZYT25hMzlHZ3NC?=
 =?utf-8?B?ZTc1djJ5Yk5Lemc0OUVDMkREUUFveGxtK25mVk0wOEM5c2hWamZhMXNlUTZT?=
 =?utf-8?B?c2VvOUJTajVhUnFhY2ZQUFE2cDdhcFF2eU96SmhZSkk1RlI0dVZtek5HSlNR?=
 =?utf-8?B?TnlvYnlWU1J5VHRmQ1JsMUJWaE00VTlTdzRNM2tWQjlRVmpreSt0NnVpMVEx?=
 =?utf-8?B?WGRHM1doSGUvWlVGMndwSGV6aXpqTmdlVURYRTZJb3RibEExWXYyTXg3bzNs?=
 =?utf-8?B?SDNZZUNRVk9taUtuMVpPMVlxNEJ3UkhpUVJmOXcyK1J5R0QzSVd3MmMxYVRh?=
 =?utf-8?B?eTNyTnBmelVoVU02ZmNDZjFwQ0FmTndWVWE5TWdkcyszZDNWYWw5NlRjajdo?=
 =?utf-8?B?Mm1FcGVZclJieFBFdFZIcnBwNlVjandjejh4S243L2pWTEJ2TFAwRGlQZEUv?=
 =?utf-8?B?bDJlR3pkUXB3S2hUVTBGOGRKOUl3OVVzNXZtWTlad2VibGhDeXc0THNWVTJs?=
 =?utf-8?B?NUt5dTJ4UHFsRmh4eW83cjR6YlFxaGFpbzE0aXZxN2ZzZm1VakFZdUNJdllx?=
 =?utf-8?B?Zm1BM0JXS3UrWTgrUlU0alFHemYzNllieHNDMDdrcHNBbmZDSFYwQXRZL0x2?=
 =?utf-8?B?dmg2ei9yY3I3cVJ4Yk1uRkJ4bWxBVmU5VzZwc3pncy9lSXJEQnJWVHlBdk54?=
 =?utf-8?B?VzkzOTNwS2NaOWw4QmQ3QnN4TVFBOUVoMUkvQ1pNRFJLbHhOc25wQjdXblcr?=
 =?utf-8?B?Z1pmVmZNbnEvV0tjNzRyMS9HMThmdW9WdENMb3kvcjlkb3I2VUlBTEloaHpm?=
 =?utf-8?B?RTdOTFI5ZTVnYjZWYzBobk5wZnJ5eVBUWGlNSFFhMS9NQmZmRjJDdUc3YVZQ?=
 =?utf-8?B?NXpWcGZ2K0E2MmZIN0hVQ25OL0Z1SE9sMThEbkIyN2I5RXgxNkpyNGxVUk55?=
 =?utf-8?B?SnlRNnd6VHRpQzFlVEVrY282OTRjTGN0UnhLemw3WVVnc3pRRlNuZTJ0MGI5?=
 =?utf-8?B?VWZEb2FYbWxFRUxxczFEL09RZzB6VUo5ZWtEQy9PNXdIYjZ0am1pTTV4czRh?=
 =?utf-8?B?WWZMSUpxNTVDL2NVT0dycjFGcEpMaisybTk2VnVQdFhZTnI2c0xWR0czUXI2?=
 =?utf-8?B?L2Q1R0lWcGFkKytJNGVtMGNBcVpmcVVzcGxFTElLWS9xUjZmeHVWOTAwRVNH?=
 =?utf-8?B?cmgxNVVtL0dzNzNvdDZuNXU3N2ZyRktONGh2SjBhbVpEdFdmUzZqa01uRjlX?=
 =?utf-8?B?K2Y2NHlxRi9XdVRMSGlhVWZ0Y043RXloT0p0ZVN2UDBNdUNRWUV5VEJzNUY4?=
 =?utf-8?B?L3ZvenlUZHlSZUNieFZzRVpqeDhFTzM4VS8rNC9BS2thVkdJTC9ta2VWcytp?=
 =?utf-8?B?YXg5eW9ha2lNUjVieWIvSlYyUXJSSHJnS3pnVDdad0FqWHJvWkpEdHJlakRD?=
 =?utf-8?B?L3Fzc2JHMmRpY1NTN2FMcDYxMmIzcE9OcXpEZGZ4MjhaL0pIUis5TVZYL05n?=
 =?utf-8?B?VDd0LzBFcVhLcnNQZzVSQmFCMHl5LytEckhMcERraUhxYk5tNDhscWwxc2NB?=
 =?utf-8?B?ekJCR3pQZWRIdDNXWmtlTzJPL3hCTjFIandUNXNJbndyaFp5WS9uNkpEYndj?=
 =?utf-8?B?MTB4c0JVZGU2KzlXQXh6eS8vQXFYRFZUblZHcVZrcTdjUGtoUnJXcWY3VlNX?=
 =?utf-8?B?bFpYbThwdzI0clU0VDRaSDFVbUxOOGg5TnlIZUNtOWZGbi9NbDdDeGpmV24y?=
 =?utf-8?B?c01LMHFnY3Q5QXlTblZ2UEpJMmxtWkpWNldBTUx0N2xhNDdUejVndG9uTmly?=
 =?utf-8?B?M3NJRGdMbWtOSXJWY3Jxb2xpT2I0b2I4OGFOZVoydkxBK1hDcTFjbEl3V29C?=
 =?utf-8?B?ZDlDc21DR04vVGUwQ3hVZDJUb3d4eWhHYjZXUlA4WU1la3NrYjRxREhIeDRa?=
 =?utf-8?B?QVF6aTJZbHA4ZjRaWXFpWnZQN2JZYlhQT3JKZXBackNpOUs5WDVtVUtaTDd1?=
 =?utf-8?B?UEpOS3FvcEcvSk9ySUFvVzZHbFgxbTNkem1lY1JDa1lVOS90TVhhaC93NndL?=
 =?utf-8?B?ZjIzamVhVDQ5bExSMDJuelc3R1BJdUVVbUxteFhZMGJxRW9sRStjZEkvWE1v?=
 =?utf-8?B?RGV2elMxcTZLNHBzazVLUTVOOUNJRVVvNWJ6NWtwODFVNWRQemtoUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bea807-a431-459f-7e08-08df10749126
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 02:21:35.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKJKF9nbevJw6aPqOP8ISRNLwDZCrATzyglepj8sBvHlTkP1O+zXPqT0GcgPRnDZ21/EAHTQd7potAvNPP14CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7102

On Fri, Sep 11, 2026 at 04:12:04PM -0400, Aaron Tomlin wrote:
> Functions cmci_storm_begin(), cmci_storm_end(), and __mce_disable_bank()
> modify the per-CPU bitmap mce_poll_banks using non-atomic __set_bit()
> and __clear_bit(). In addition, mce_track_storm(), cmci_storm_begin(),
> and cmci_storm_end() manipulate per-CPU storm descriptors and invoke
> mce_timer_kick() without synchronisation against local interrupts.
> 
> While mce_poll_banks and storm_desc are per-CPU, mce_track_storm() and
> cmci_storm_end() execute in timer softirq context (via mce_timer_fn())
> with local hardirqs enabled, whereas cmci_storm_begin() can be invoked
> from CMCI hardirq context (via intel_threshold_interrupt()).
> 
> This introduces multiple concurrency races between softirq and hardirq
> contexts on the same CPU:
>     1.  A hardirq interrupting a softirq's non-atomic read-modify-write
>         on mce_poll_banks will have its bit update clobbered when the
>         softirq resumes, dropping a stormy bank from polling.
> 
>     2.  An incoming CMCI hardirq during mce_track_storm() re-entrantly
>         executes mce_track_storm() on the same CPU, racing on
>         in_storm_mode, history, and timestamps, which can corrupt the
>         bank's storm state machine.
> 
>     3.  If a hardirq fires after cmci_storm_end() decrements
>         stormy_bank_count to zero, but before mce_timer_kick(false) is
>         called, the hardirq's cmci_storm_begin() will increment
>         stormy_bank_count to 1 and call mce_timer_kick(true). When the
>         softirq resumes, its delayed mce_timer_kick(false) will
>         erroneously override storm mode, leaving the CPU with
>         stormy_bank_count == 1 whilst the timer reverts to the default
>         polling interval.
> 
> Resolve these issues by switching to atomic set_bit() and clear_bit()
> operations on mce_poll_banks and __mce_disable_bank(). Finally, enclose
> mce_track_storm(), cmci_storm_begin(), and cmci_storm_end() with
> local_irq_save() and local_irq_restore().
> 
> Fixes: 7eae17c4add5 ("x86/mce: Add per-bank CMCI storm mitigation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c      |  2 +-
>  arch/x86/kernel/cpu/mce/threshold.c | 23 +++++++++++++++++------
>  2 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 765e8103b0d2..aa604d981358 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -2294,7 +2294,7 @@ void mcheck_cpu_clear(struct cpuinfo_x86 *c)
>  static void __mce_disable_bank(void *arg)
>  {
>  	int bank = *((int *)arg);
> -	__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> +	clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>  	cmci_disable_bank(bank);
>  }
>  

Hi Tony,

This was an artifact. Sorry about that.

Indeed, the atomic bit operations became completely redundant the moment
local_irq_save() was introduced to enclose mce_track_storm(); the use of
non-atomic __clear_bit(bank, this_cpu_ptr(mce_poll_banks)) is fine.

    mce_track_storm
    {
      local_irq_save(flags)

      if (storm->banks[mce->bank].in_storm_mode)

        cmci_storm_end(mce->bank)
        {

          local_irq_save(flags)

          if (!mce_flags.amd_threshold)
              clear_bit(bank, this_cpu_ptr(mce_poll_banks))


> diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
> index 6c370d5af5bd..83f3e2250ae2 100644
> --- a/arch/x86/kernel/cpu/mce/threshold.c
> +++ b/arch/x86/kernel/cpu/mce/threshold.c
> @@ -85,8 +85,10 @@ static void mce_handle_storm(unsigned int bank, bool on)
>  void cmci_storm_begin(unsigned int bank)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> +	unsigned long flags;
>  
> -	__set_bit(bank, this_cpu_ptr(mce_poll_banks));
> +	local_irq_save(flags);
> +	set_bit(bank, this_cpu_ptr(mce_poll_banks));
>  	storm->banks[bank].in_storm_mode = true;
>  
>  	/*
> @@ -95,32 +97,38 @@ void cmci_storm_begin(unsigned int bank)
>  	 */
>  	if (++storm->stormy_bank_count == 1)
>  		mce_timer_kick(true);
> +	local_irq_restore(flags);
>  }
>  
>  void cmci_storm_end(unsigned int bank)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> +	unsigned long flags;
>  
> +	local_irq_save(flags);
>  	if (!mce_flags.amd_threshold)
> -		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> +		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>  	storm->banks[bank].history = 0;
>  	storm->banks[bank].in_storm_mode = false;
>  
>  	/* If no banks left in storm mode, stop polling. */
>  	if (!--storm->stormy_bank_count)
>  		mce_timer_kick(false);
> +	local_irq_restore(flags);
>  }
>  
>  void mce_track_storm(struct mce *mce)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> -	unsigned long now = jiffies, delta;
> +	unsigned long flags, now = jiffies, delta;
>  	unsigned int shift = 1;
>  	u64 history = 0;
>  
> +	local_irq_save(flags);
> +
>  	/* No tracking needed for banks that do not support CMCI */
>  	if (storm->banks[mce->bank].poll_only)
> -		return;
> +		goto out;
>  
>  	/*
>  	 * When a bank is in storm mode it is polled once per second and
> @@ -149,15 +157,18 @@ void mce_track_storm(struct mce *mce)
>  
>  	if (storm->banks[mce->bank].in_storm_mode) {
>  		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
> -			return;
> +			goto out;
>  		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, false);
>  		cmci_storm_end(mce->bank);
>  	} else {
>  		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
> -			return;
> +			goto out;
>  		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
>  		mce_handle_storm(mce->bank, true);
>  		cmci_storm_begin(mce->bank);
>  	}
> +
> +out:
> +	local_irq_restore(flags);
>  }
> -- 
> 2.55.0
> 

-- 
Aaron Tomlin
