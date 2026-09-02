Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022141.outbound.protection.outlook.com [52.101.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5F2D2487;
	Wed,  2 Sep 2026 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309293; cv=fail; b=aJ9LURWBkyiq15+08OnM0nSyfdKUEeHdlux6fC0xIjVJRCrZyRqI1T23nC2SEKDFBTvtARz1m2a5qnjsDu/JakvC82Z/ti+9Cwce8xaVv2OCEXHIBzrmO3YyjAcdQD6993jE40X+1Hmzn8M/lUfSFTDnlonu5aeIxvoae76b958=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309293; c=relaxed/simple;
	bh=rzQCP5y7svxl8R3eGFVmULxu7HtITKJkrbMN9wVgVm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u47raqtH0iF0WB16174dy70+bxqW8Gafb6cQ76ip5p2WwhvfbVu1Qc54i16bIGRVd//yDbqLKQPbbqosKX1ROOOOEUYFGWHQyRf3G+D8zfTULs/GsS5KFgFOLiivKQiXfxgSkKFSaxXZ4ifgKB7z+oLW98nkKr/1mDoVHfYM4Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8+RYT0G/NT4FxW4WnxAWxD0ywHCokm3Vz20hCa586NLYgtCfix278hPMMsfVdmvDvnD/kZQBz7CndgGKxpcHpULEbzEBAepvYI4MMnt5MWVrT2MKst/EWT0LBQuxAXvuqJJbZyDzdriqEdiKEKrWdhbyxLfYn1GnVzgaX6C1wWifCvJ2eyRl/BStSttrGZB6FGq9HFJJrEb1sYx5PO/sURtmypErX8VM/KJ/anb/x7yase0i/as+x+roYl3tbiVVNcpjOaDoTj4fMSPFcSilCtNMcgxGIyZ1TmRsjljyADUC5oOPYS7nzAJk3hXRsy/guKnhynJNNFW/sTzwLhHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=2sEc36/pJq4BUPPpIAGCLKRc3lUYgCnu81AR5t1dnd8=;
 b=ei+dHcsm03xTDZnP9FDlCDowuvw7Yk4FibzZvk40LmTeTKnbsuv9V45/otchbvWx6O9+VcLjjiB2CZvHGMTJSV1VUM5P+2E5wY7GnIQxcff/TB6qx9xjmVktLZmxZuyJEq96cBGEJmJgyt9onDrP0OzpvxhIkHU/KXo6Td7BYgqrsqj/zIQWtaxxkipBaYJSZz9CjJZdL6uMssmmo93SFVEfeVGK0jFGng+Zb4dlg0frkTeOQ+Ej+vvpiJBsXf2p0Z7BlgtfuaaoF9CU/MvXZ6ryoGCe4pkn0kv44ZE9Ma93ZXomrBuBxYQxndhS163U2WgsatNnscVjuL4x8ywLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6822.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 00:34:46 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 00:34:46 +0000
Date: Tue, 1 Sep 2026 20:34:42 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, chjohnst@gmail.com, sean@ashe.io, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86/mce: Avoid arming periodic polling timer on
 isolated CPUs
Message-ID: <d5a2mucoiwb3ti4gfv4hchewbgu3isk3bsdpc2bz6ved6humka@gtalsjn22456>
References: <20260901151138.132950-1-atomlin@atomlin.com>
 <apcSXFCnuU3QGr_S@agluck-desk3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apcSXFCnuU3QGr_S@agluck-desk3>
X-ClientProxiedBy: BN1PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:408:e0::35) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: dce77aed-6749-4617-83a6-08df0889fd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|22082099003|18002099003|3023799007|56012099006|6133799003|4143699003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	imVzdccwglUkIwHfVNIBcBPcmJhNQzO5JyCRN2ZvtgX+25iHo95Eztz74pxQ6NSiJilSx9SDXS8WF4DXFcWqWfNTIss+SCJ7EIPUp0XKuZovsCf8GvVjaXitpckJp2lhGTgTFoQfM8NZ2PtG8hQf0zaxnOk7nwMpWkUWEYKlEuIG3z8dK3UfWy/hFgQHVQJ0OWp5tQvonCnr8GFAE1lVoliLnr/n33SLEGLxaa38Xm+eyFqYJwg+EpjRbnNymB7aTEpp/GdsdThOOjk9GgJajS3ZEEGV+WUKxBV/z6IF6bGGRIbWASAZGWHJM2SiOdQYsdjG/6ZtLikBLGCK9phK1VdIMEoNRv/6CM34QH7kV6GVSPtBeDVh9CuKfja+hKqysgEJriTSJ1rAgrOmhi6EfcO/bCfTPbXW00jhCo+HjgfKzYewieI4ur5YFNcBm1gct+NasQSX+bhcIxL2ORrt5uxQckUTIqGXBSQABEUH1Jz9R9pFzn34Ka+/acb1tEa1ujed3jLyLvmXXaxFeKbDAnKd5iGuFc/GM9TvMb8YPI/49QaK5uDCCJ2OqKjFWfsAVI2bpMVkRf/ujXzjHf3eGRpoqqOxNKq0SeY3OyD7BhfIplJ4bPZjY2pmTsWhKfkSvvChRX5g3C1PAHBsyP8haFBiK/wsXoSNjfgPldOLl+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(4143699003)(5023799004)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm5FRnVsZDdmdlB1WFYzTEJWazJEdEZ0TE41VFRZTWRaWXBTRUdzaEJMMTJW?=
 =?utf-8?B?Vm5DbkJZeVkyc0l3VDVoNjFLMjBhVXlWSHJzVW1RaWxPWXFPbk93Y29ER2g0?=
 =?utf-8?B?UkdLTkxTVzB2QU85RW52Wkp4Z1padXNYTXRIRVlKblkxUHpGMlZlc3YxZ25O?=
 =?utf-8?B?SlFlT3p0RlZSWkdIS2d4MERXNFlDdVFuOTJEaWduMkpJTjFvVUVPbDJlaTUr?=
 =?utf-8?B?Z3ZlQ2tSTmtueUhSSVFuN1ZFdEpCME8ySDJUa2VzRUROU0ZYTVFnbW1hS1ZS?=
 =?utf-8?B?SmswT3EwOG5HTW0yZHJQcURvRXNoMmV6YzYwTnNTZ0ZQZDNaZGtRRU8zMVBT?=
 =?utf-8?B?czBDQndLeG9ObW1OQzcwcWVBSUUxRUlmNFJKdXBlUUxFR3ljdnh0QlZpcXIy?=
 =?utf-8?B?ZHRLQ2tlQkM0UU44UHNJa095c3c0TzdzQytPM004YTVnQVYwTTRxdjdFNTVC?=
 =?utf-8?B?ZG93TC9ZS3ZhR2daVE9Db1U0ZE1SQi9ESmpJRkowRFVjbjIzWW51NkdaN1Yv?=
 =?utf-8?B?eklyTmpOeHpOaG54Qy83Y0tqVEQ3bmtaZHYycXd3N3gvTlZvUWp1dDV1QUdr?=
 =?utf-8?B?dXEwUzJPalN5RFJiRkYrMGUrT0lJNEV3MWwxZnJpelgwQ3hIeldTOGhXQ0Jx?=
 =?utf-8?B?ajc1anZYZC9xSEN2LzJvYWdrNERsam11TmNHREZSTDEwNE9MWENGWDF6NXo4?=
 =?utf-8?B?bmxGeFJ0T1hYQnJsUmJWaFNCSmZXS1VDV21xek5McXZadHh6cWtQdUdyV0dC?=
 =?utf-8?B?Z1Z1ZCtTYmRiaWdJNlVMdWhqaHh1MVJJeS9wMnUrQm5pWmtBZVhNbzU5K3R4?=
 =?utf-8?B?NnBZK1BhWGd2U0NjOUdaMXJKdndHMktBcHdXOUpTOEpJdThoVnpHK1RqR3c0?=
 =?utf-8?B?bXBMVERWMDlJN1RPM3c3SWxlY2lja0Z6YmNQZDRuNWExU0pGcXdsb1hCdno3?=
 =?utf-8?B?amtxZXIwbEU0Q2RFQXBEZ0cvM1JaeldMZXlqanRlM3lDYit1elFUVUlRbkRt?=
 =?utf-8?B?MlJvb1BUaXMreDdEWXpUSkxHUW1TU1N3ZUJUNTViMHAyd1hJazc4S21ZQlVO?=
 =?utf-8?B?UWtXRkpNa21OMUlybStCZ25ZYXVQNVVKK0x0cDNta2xoeTZjRVhxV1lmQ2Z5?=
 =?utf-8?B?MlJFdVZadHJsaFRpTzJ0aGQ2V09Kb0pMcXlmSGlseWdWbmNiQTBXY0c4bUlG?=
 =?utf-8?B?cW9GVTVVQnd3d1hwcFNZYnhhQk9JOXRmMmwxOEIxV1R3K3RkOW1CaGROckw5?=
 =?utf-8?B?cWxOaEIxU0JCTDBDeE42UCs5eXl0aERGb01pSlNIQStFL2hYM3NEc2MxR2FB?=
 =?utf-8?B?K2Vna0R6U2s4ZjRFUjB5L21rcDhCVzQzQ3RsZ3IwQUY5T3Rpa3RIVkNVVHlP?=
 =?utf-8?B?cjZQNHRkYUo1V092cVBkU08vdW4xUkxDZjhDZmw1ZmFhTkpZU0ZnSnpJc3hI?=
 =?utf-8?B?RjdMU1hZUzhuQlRtUGdRZE5IVFZYdXpTVyt3cFJweVg0V1NWbWhNZ2tiUmJh?=
 =?utf-8?B?M0kxUzk2WDhBR0wvVzhXTjJ0Q0JzNkJUeGFkaExieHBraXRYNktINnl0RW16?=
 =?utf-8?B?WFN6cHR6MHNzRVZKemJaNHRXdkgzWnlZRUVEWktTR1FDdXZScjhaSlEwQkY4?=
 =?utf-8?B?UzZ5bWVXTUdWLzgyQ3dmMnYvZzhkcWlILzl5eUJ5M3BacnkrSWZhOHJvcGV1?=
 =?utf-8?B?UCs2cHZYWGRKZTVHdHE5QmR5K3pUTTViYXVXYXhSbXhNNkNLVVpNSGlEZjBk?=
 =?utf-8?B?b0JMc1ZsTjhMd1VYbU0vdGdkQmEzL0MwZ2dvc2VlMjcyVjdWN2lQOGwxUzJC?=
 =?utf-8?B?Ni9qK1RMVE9ZQTc0N2Q0UXc4cytBRk9QSnJYVEdJRWFhTWdxeE1FSEpsSkhP?=
 =?utf-8?B?UXZOaVpTdVlOR0s2dkxyTFJXaVZmdWY0MEE3YzVjd0RjeUdSWDQ5aDd2OWln?=
 =?utf-8?B?WE4vQUoxQXVOekd6TENOcUhGcUxKaTExQTFNNXFTc3UrbWdmM2tFVzZCUnJU?=
 =?utf-8?B?SzZuYkJETkkyaU5WUEZFVEZjVHV3aktNdVZ6VFBOVmxaUXhueUMycEhwMTdo?=
 =?utf-8?B?N3N2dmF0N0JiQm8zQzU5YTEzbEVYVjd3QlY3cWF0RENCQThEeGhoaVV1bkNv?=
 =?utf-8?B?dDFaRWdCMnB5c3JKSDVVZytobXpJb2FoRXQxc0VsR25BL2xad1NyaVF1OHhE?=
 =?utf-8?B?dnNXRHkxRHNlNEdCNzRpOTN6c3h2ckt3N0ZhTS9uQ1NFNlBVdDNLQ3hNTmVl?=
 =?utf-8?B?c2FNajArUk1JRzZ1clhvaXA0akVhaXBrNC9yNzBBZVlRcXRkUGpEVWxMRGkx?=
 =?utf-8?B?OU5CV0hHZTNBYjhTbEMrWjhCN1dkcFd5NkQyUDBNbTBCTWpaZUsrQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce77aed-6749-4617-83a6-08df0889fd12
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 00:34:46.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbfO5kzITOlR27O4BqiUYbRBuoQ2bqw9rHQpfzcro8pxn3Su7Tvk2T4k5UBrN4D6G04ZAGM5xKUpL0obTv1new==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6822

On Tue, Sep 01, 2026 at 10:58:52AM -0700, Luck, Tony wrote:
> On Tue, Sep 01, 2026 at 11:11:38AM -0400, Aaron Tomlin wrote:
> > Latency-sensitive workloads rely on CPU isolation (i.e., configured via
> > nohz_full= or isolcpus=nohz) to guarantee deterministic execution
> > without interruption from background kernel activity.
> > 
> > On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
> > per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
> > banks for "silent" corrected machine check errors. Because mce_timer is
> > pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
> > its expiration to a housekeeping CPU. Consequently, every check_interval
> > (defaulting to five minutes, or as frequently as every 10 ms during
> > error decay), a timer tick interrupts the isolated CPU to execute
> > mce_timer_fn() and machine_check_poll(), introducing unavoidable latency
> > jitter.
> > 
> > Presently, the only mechanisms available to suppress this timer (i.e.,
> > the mce=ignore_ce boot parameter or setting check_interval=0 via sysfs)
> > are system-wide globals. Setting these attributes disables polling
> > across the entire platform, needlessly blinding non-isolated
> > housekeeping CPUs from monitoring shared memory controllers and uncore
> > error telemetry.
> > 
> > Amend should_enable_timer() to query housekeeping_cpu() for
> > HK_TYPE_TIMER (HK_TYPE_KERNEL_NOISE). When a CPU is designated as
> > isolated, the timer is neither armed at CPU online nor re-armed upon
> > timer expiration. Housekeeping CPUs continue to run their polling timers
> > unaltered, preserving routine monitoring of shared package and memory
> > controller banks.
> > 
> > On isolated CPUs, critical synchronous exceptions (#MC) remain fully
> > functional for fatal and recoverable uncorrected errors, and CMCI
> > interrupts continue to deliver asynchronous notifications where
> > supported. When CPU isolation is not configured, static branch
> > optimisations ensure zero runtime overhead.
> 
> There's a better approach which hasn't managed to get to the top of my
> priority queue.
> 
> If you look at the mce_poll_banks bitmask, you'll likely see that the
> only bit set in the range of supported banks is for bank 4 or bank 6.
> That's the "PCU" (Power Control Unit?) bank. All the other bits are
> zeroed because Linux found that CMCI was supported, so no polling is
> needed (assuming CMCI hasn't been disabled).
> 
> There was a misunderstanding about the full meaning of the CMCI_EN
> bit in the IA32_MCi_CTL2 MSR. Older versions of the Intel Software
> Developer's Manual left Linux coders with the impression that if
> CMCI_EN was not supported for a bank, then software would have to
> poll to see any corrected errors.
> 
> Newer editions update volume 3B section 18.5 "CORRECTED MACHINE CHECK ERROR INTERRUPT":
> 
>   To detect the existence of thresholding for a given bank, software writes only
>   bits 14:0 with the threshold value. If the bits persist, then thresholding
>   is available (and CMCI is available). If the bits are all 0's, then no
>   thresholding exists. To detect that CMCI signaling exists, software writes
>   a 1 to bit 30 of the MCi_CTL2 register. Upon subsequent read, if bit 30 =
>   0, no CMCI is available for this bank and no corrected or UCNA errors will
>   be reported on this bank.  If bit 30 = 1, then CMCI is available and enabled.
> 
> The addition being the "and no corrected or UCNA errors will be reported on this bank"
> 
> The PCU bank behaves this way. It doesn't support CMCI because:
> 
>   *NO CORRECTED ERRORS WILL BE REPORTED IN THE PCU BANK*
> 
> so a waste of cycles to poll it.
> 
> So Linux needs:
> 
> 1) Properly handle systems that support CMCI, but have bank(s) that don't.
>    The bit for such banks should be cleared in mce_poll_banks.
> 2) Add a check to see if mce_poll_banks is empty, don't start the timer.

Hi Tony,

Thank you for your feedback.

I see. Addressing the root cause by not polling banks that will never log
corrected/Uncorrected No Action Required (UCNA) errors, and subsequently
eliding mce_timer whenever mce_poll_banks is empty, is indeed a far cleaner
and more elegant solution. It eliminates the polling overhead across the
entire system rather than merely masking it on isolated cores.

Based on your suggestions, the implementation would look like:

    1.  When CMCI is supported on the CPU but a given bank does not support
        setting MCI_CTL2_CMCI_EN (i.e., the PCU bank), clear that bank's
        bit from mce_poll_banks instead of leaving it set and flagging it
        as poll_only.

    2.  Add a check (e.g., bitmap_empty(this_cpu_ptr(mce_poll_banks),
        MAX_NR_BANKS)) so that the timer is never armed or re-armed when no
        banks require polling.

This also integrates cleanly with the existing storm tracking logic. When a
storm begins, cmci_storm_begin() sets the bank's bit in mce_poll_banks and
kicks the timer; once the storm concludes, cmci_storm_end() clears the bit
and the timer ceases re-arming. Legacy systems lacking CMCI (or systems
booted with mce=no_cmci) will continue to retain bits in mce_poll_banks and
poll as expected.

I will prepare a v2 patch implementing this approach and post it shortly
for review.


Kind regards,
-- 
Aaron Tomlin
