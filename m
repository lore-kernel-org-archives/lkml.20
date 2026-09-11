Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3B47CC80;
	Fri, 11 Sep 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134261; cv=fail; b=nz97pTp1MnhAB8uyyUpyEiCHmhYTgA7pXEIIAlXHSu2gKdTYEzSXPt6iJ5h+wFEjRy22fDHNTYm9Y4xGWjGn8nW55NmLGn4rZb+P/dv8IUpunIsJtMCChdqQRy8/Vz4vahG3Hh7C9kkY+4ajBqrw/ufoDzQiQViOLI7KQd4iSfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134261; c=relaxed/simple;
	bh=+VTKKJFxGOiNYHeHWclen/+4vMbU/b/CFH0HCOhdQks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=indjFmx+6SF9GMtCCBeTWVzzAliPP1GQBo2oh7W18hPrZBZ0skgfdped5e6nrktfdFfWBfWO/X0fnE48lHnyTxzeEJkYqqjptu4G4jmGLXPRoo359UCaGr262jm+RFONyeTTn97fGvadqlJUdhX3fgs+iJHyoidwCYamN/qtF50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=owuKd1i+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="owuKd1i+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coE8afJBv2EZ+kaNZDq0ea1NYD5I67sGQvRjwWxV6puJH8QIf1sqvV4Vz6R0kZuqft+HojaQ7mRPkedgnHD6LKfxnpLct9cOWYx9SQhJyWJB+/fbFPZZ17uuM35PC2Djts6QW59MZ7oPMo9B5nMDrLsRxOQHjUnKNpRG8Xh/we2t+RhESp+GSGLm4aeWcSQX5ehQnIYrWy34hpa3mzdIxA9WMIampsWdBagAtId08Bta4Kgojo2BlBBGdHhkAFQe8knIJ1dIgudUjsAElIUopZU6SADPlIHGlmCuuSJiEmfZMyegbntbwv2B6Xp0teiHNtpNkBgH/ULtEk148Xc+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Wa39LEORvbbN/6RbnCTjPVhkcD4VsZYpFOMR49/E5U=;
 b=I3zW60dw5Jc9ZB4lN588/8uyGBUn2J4FZ1aKz2X+0nNbG/JoL3rp3GO+ksT8wl5vYhkM5aWwJbUVcgDJqw5awoG0BhOeS1ovVkh8vwiNzIK2r4IPBqvPnSyAwsosMTNr6oj/niqmG/tIj3YKkLq51PX1gypew44hbrgw9YYnoyxci57h21gX2ggTzlhV0Fwk6GyNrtJ/ltejgWiiM3WBnOwwyals2rwvGo1SuZOG5OeagvfHNfdNgvuhS7CaSZEMiE7dR6u18ewmhDffsMwmjRcpgeTOF9zDlhw0UigK1zkWyNXNQ9kbrLxUiEU5UpTCYSfPW3UbYnFIqPIm1Xel+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Wa39LEORvbbN/6RbnCTjPVhkcD4VsZYpFOMR49/E5U=;
 b=owuKd1i+nZUrU3DrSj9TEFXsG7xLdANW+MBl1YeYehscpXRbWGjuIuJv3RBpcAIREE74jwlHEOj/fQpx18ff3JkrXBK3hL7FdL38K+hJLWiHvz2RS4bTX5rk+GH6zttNh8inhnirSJOV8zLl6i1rYcqzWmvRBmCUHWUC6m9sv6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:44:16 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:44:16 +0000
Date: Fri, 11 Sep 2026 09:44:12 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: OptoCloud <git@optocloud.no>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] x86/mce/amd: Reset deferred-register state
 between polling banks
Message-ID: <20260911134412.GB2018031@yaz-khff2.amd.com>
References: <ZYPjnBLNLY69gIYeH-ING5IhrnA3ryhVQquuPlWhUR-WmKLUFl3z-HRWR6q3zW88Vi9L4IpFrd5WnRhVG0AptFUR4cDvCGTJ782EUQL9u0Y=@optocloud.no>
 <20260903203609.GC145182@yaz-khff2.amd.com>
 <VVPre8FwBOaDwOJsZLizBoEllya95qRDFGMnMwm_j_UOTE9L7LptaW7wFFQQNr9nBhwUYorxpQq_IZyQSsL3-IGNj6hdtcxr1HIg1xqWYPA=@optocloud.no>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VVPre8FwBOaDwOJsZLizBoEllya95qRDFGMnMwm_j_UOTE9L7LptaW7wFFQQNr9nBhwUYorxpQq_IZyQSsL3-IGNj6hdtcxr1HIg1xqWYPA=@optocloud.no>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH7PR12MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf52105-7d3f-41a0-d436-08df100ac590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	oCHG4P8iRwy/x1Fp/6IDp9r1osQKhnEunZNlNi+SrWXBvM9zSiGf6JkHV9O/40xGxHvFJtK8EaFRPd93u74663cXT7YcRP/XKQw50LaDQD9FC4hp6oFw+L+EoUXvixUrjTjLE3kKcDXtGbnkrA1nIkxx/a2LQqUPDlzxAZGT9sNdHK6Tbni3LLIyo54gRr4ePcULLp7yglrboZDflgRUJGkT4GG8BGi7L3LfhqYGztNfPnxRBqg9uqSt5TBb0uUSnH5c8PLXVQXnWuqjIBWetGJyy/r6yDD6MrdIPGHMsrrp5uXnQmmBRpjh631GZCRuRIwJsJ13bfPwIPhvWbtCwgQWEd4W2j+tlEAhM0rMJw5JfmNNbQy520JfqDWYT0/cLsVhVqj0cERN/O5XbOg/TvWplx+sGY4WRFOvRw3K1xfhBNEC43nD5y2E3cAsbHPLXZ796TtE+Ml0uSmYmvcKcLEcGHUQmGYZZh0wx2jpJiPTcvuC2Ycm4N9QYNB48cz8Pq80QeeYXP74joctdcv3/iXlHRXOY6y4mHNOfC+oI7OQ5W9sBQtDMs7/WMkRJSVJkyOj9wY+dRz8xOrLq3m4X3ywzDiFy2VCqSLCuDKqU8Zj3Y9qje+RPI0MgDRtnm6R0gh3dhA4EjPugXrFvxTc3NdwUDJcx1axXnEVeQ3Sz5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?l+m3fL/avufRAjvyqQgWZXBG3XcjHn7ZHTGeleHmh2GqjhvytoFfGr2InA?=
 =?iso-8859-1?Q?for/wkdaCWTq5K5VdE4Wampq5gBOvIrvi3qNeSmmoTdITND7IMPkQZ9Pks?=
 =?iso-8859-1?Q?YGtqcyUxSs/HMwYjVV+IozU4xmlxPbWFikVkzftIJSmszH7pI/TGAYBvjD?=
 =?iso-8859-1?Q?fV95YkKDj6T9qHX2FNnWWvp7UH2B7f69MWJD1moxn1wZ/gmw0a2WdrUsN/?=
 =?iso-8859-1?Q?tVWKONllHMHWVLYevSMl8eG6DORWvkODE1eNQMR5uqvt64U+DscYXWXeka?=
 =?iso-8859-1?Q?1nbydlan2o2sMv4pipoMFzULDh2S1jZqSbjuVhbAxtrLVYqaJCb7iWROia?=
 =?iso-8859-1?Q?T1eDqYZXCyKN+AmCuGRMjkVeCt4G8UawP1PV/cJ6x12mDuDwWvLOZ61Rub?=
 =?iso-8859-1?Q?UPPyG2ifKGab6+JKl2uxL2yn8uBLzJx1tU1ETA8XQAPxeqtuxP0Cdq1o28?=
 =?iso-8859-1?Q?PNmz5+UJhltvAKSIey6iGUZQWMZ2Z4LBxhos56AAfJtTv05+2iC/viD917?=
 =?iso-8859-1?Q?W1AlLNMgcDlMmotzYVqcIlsR3qdzYszxvbFK8yrf5fMWcEnkn/3bkg3EQC?=
 =?iso-8859-1?Q?Mv1cT1NGL1zl0TdaONMAoFcOwsGpGi/9/4DtdNBTTcpJQa7ptIccFLmHwh?=
 =?iso-8859-1?Q?yi6WtPO3YA7/jQhDFAVrDqnpjtZovTNjUu+SI2F3KNK+EDpBqnpb0eHOpC?=
 =?iso-8859-1?Q?aeXcE59qPTr121jtmDMh5oGa2axvrT4UZf7mGszRtP4VCBzuIO4O4/HwBj?=
 =?iso-8859-1?Q?IbiwxnB0tJcrYdK09Za7U7X/ef8XJ3f9DLrZffXnsIjOV9wNiAgrA8nHfF?=
 =?iso-8859-1?Q?HUu/EPXEVRGjG0LRJJpCfjkncxLK6TKyW6GLPh0GO7ZxRGhqOz5rW0uy7I?=
 =?iso-8859-1?Q?mzag6GbHwsLGNn5xNWZDBkct4Yt2QMXRriZwOLxyeMkunu7Ta2m6VDcLA9?=
 =?iso-8859-1?Q?hb0pbxEByXkOJvIUt6vhEI/sUv7UGBDwygBBWmil4ueYmnnUI9XogCYMJu?=
 =?iso-8859-1?Q?aD9Kxgwu9dgrWzGIb8bN8BFV7vWDHou2W42cgjnsL54wUq9THKAoNS/x18?=
 =?iso-8859-1?Q?FTxdl6yRUGnLKuJLyfiz4JnFG/60SPdF63xcVBVPtpef63UWRr8UAw3M30?=
 =?iso-8859-1?Q?s7JfXQ9gXbusjJQtf/BBy9FLCmEfKH+8VJZcd25Uz390rurhvOFNRDOOEZ?=
 =?iso-8859-1?Q?QWaLam5k0ZmoxDkJ7OO11Ms8Gn01mLwtPv60t/paHcv4zfcKdepX7IKkyN?=
 =?iso-8859-1?Q?FMKtfxkkQlH3hJRGkbx4S1IagOnvKQBiY616L+wCGxNND9xLxJYHPiYMv3?=
 =?iso-8859-1?Q?wPTTk3XkHThfadehgZRBFEBsQEH5GZE29VDSIyj+653WC4Z0jv1Y1D8dbl?=
 =?iso-8859-1?Q?JMETmxY8EJRKwFTkGg1zcH4nRJzOM7sCs3xsGNdum0fH6VG6JPJPhBpX5E?=
 =?iso-8859-1?Q?FpKATaWMc1APkaoghUAVeGtxiaNahLDa+5JIG4jlfwkdItSJlXGZ/aDDxS?=
 =?iso-8859-1?Q?iIFzVa8PaPoG+SR/txhKkILLo9DR3VCEZiPkin8tK33bIFPdZwZPNXkTGu?=
 =?iso-8859-1?Q?4WLHpmTzRCuWqYSmXfoGEgwCVpVmXzm9xwUHsnoBLMmOAXV5dpyhlFPFQ9?=
 =?iso-8859-1?Q?zdbGZPV/ItVcDIJteBFnY43GvIKrzrKTTPM85OT8adpuJrLH0p7LrACQUL?=
 =?iso-8859-1?Q?fe/eng4Ey3wg40xiiHgmsXBWY3NZtxGpDJ7QdjMBRANDC2hCSiI5fqzRRx?=
 =?iso-8859-1?Q?BGdDklHah9JZXAxYwabs+HuB2oMxDcee/b9wIGQ1aRwTV3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf52105-7d3f-41a0-d436-08df100ac590
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:44:16.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejw7DOdcZczB0CPfekHAv7FZsSJo1cHfbN5u8N7rlx80m4DhllvKA3JH9PRmDoC7P/NZqBlz5X/PEz19nSq7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975

On Thu, Sep 03, 2026 at 10:39:10PM +0000, OptoCloud wrote:
> Thanks for the review, here's v2.
> 
> machine_check_poll() reuses a single struct mce_hw_err while
> iterating over the MCA banks. smca_should_log_poll_error() sets
> MCE_CHECK_DFR_REGS in m->kflags when an error was taken from
> MCA_DESTAT rather than MCA_STATUS. Nothing clears the bit again for
> the rest of the poll, including on iterations that bail out early,
> so every later bank in the same pass inherits it.
> 
> A stale MCE_CHECK_DFR_REGS has two effects on a later bank:
> 
>   - mce_read_aux() reads MCx_DEADDR instead of MCA_ADDR, so the
>     address reported for that bank is wrong.
> 
>   - amd_clear_bank() returns before writing 0 to MCA_STATUS, so the
>     bank is logged again on the next poll.
> 
> Reset m->kflags at the start of each iteration, alongside the other
> bank-local resets, rather than clearing MCE_CHECK_DFR_REGS alone.
> The only other place kflags is set to zero is once, before the loop
> starts (mce_prep_record()'s initial memset), so there's no per-loop
> state a full reset would wipe out. It also covers any future kflags
> bit that ends up set within the loop the same way MCE_CHECK_DFR_REGS
> does today.
> 
> Found by code inspection; not reproduced on hardware.
> 
> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
> Signed-off-by: Eirik Bøe <git@optocloud.no>
> ---
> Changes since v1:
> - Dropped Cc: stable (Yazen)
> - Reset the whole m->kflags field instead of just MCE_CHECK_DFR_REGS
>   (Yazen)
> 
>  arch/x86/kernel/cpu/mce/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 6fa15e19988e..16ac2418fd51 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -823,6 +823,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
>  			continue;
> 
>  		mce_clear_hw_err_fields(&err);
> +		m->kflags = 0;
>  		m->bank = i;
> 

Why not include this in the helper function? In fact, this patch could
be merged with the other.

Thanks,
Yazen
