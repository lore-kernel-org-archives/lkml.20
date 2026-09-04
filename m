Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022099.outbound.protection.outlook.com [52.101.101.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848B4A3D2F;
	Fri,  4 Sep 2026 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530068; cv=fail; b=qOuDCQbMEWuyBhi0N3oi+bj8MGiO78eOLb1h1BjzWJ3mw8kCegR0iG7QL2u7aE6+GYRjaFCf6M3/SQvZ1A53d+DayI98xZPW+lhw6MHXtmYKyt/+w1tEeGjruP/bqo+AUwFykdTGfbY6zkN8GsR44KVCsd/nxn8duVjMYkCCDdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530068; c=relaxed/simple;
	bh=yUBqyYkHiPl/dmMJpdiEWxVhTnvynaIZ2eoNUrgdscI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RMQ87YJU+mbYfsdbvyDle+/smCayS0+msqCYt0hEuWqxaE2AQzjv7nX1XYJaRbA7mlEwqZp7zZKqGwyhJSCJKxbdQ3OmNRMeBNTWFiNYEM0BTQV6kYh0lmo+gsEPNj8DfqTU7wFnXUiNzglHzsirUfWOZLt2u+7FaSWPY0KM2DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOWH8GhPFJHtxaWLbj1kdi+dQz11D+kzxH5N7ddrqKaDD/OI4GKeucpO8bSHN95wxe3kmVi/G0+NRw9gaoR5uhBLdHOBJ7VTYq9gAgf2UPNjBZFc8agV2JLs252yQy8B/gRuQNkkhcqnQ583xVJ2h8IkK89XXZTbPctpixg7+wBAXt+0MfFgSF688icNBhFZAhn/O/Q2F+JY+h0PGUqcncFi3iHnCKqE7CdF2NqQNZfKUAO7zcVciU3zcyONd8o6zvn+7Ixu0rPOuL+4qkpIQnMOzKNaYHKTS9cv11y+CJ/vcgKzFTR1tXS7ClpvaaZ4e+5BbS+EsZiVBIKFKEROUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=MWuG76DYSCaAAPR84Rndi79Il2BE+p3Ilnbyl/alsdA=;
 b=fKg3E8V9q0W8q+HulleHGKXnZDU2PdLcOyOYrNVDiNanSmArAwEC1cjB2v2zVm832V6Poy4qF72IrSH6sS6YzMptrPpzP0Mp67+aQV8+SEOSsbOW07UEGlfdfVU+FUTKX1o+zsHQLmrwReTPK1juqv3LeFpAGm/pUN532FsZxXpID35Y3mUcCoGyZ1N2eZl7KlLnxHdlN2+3psf/4G9iNCMoyA3sLgn4w+DZ9QCA2v6cdyMdykxtHFgEhTYW0TClBj/dJXaVDM/rj20Sj7iEncJ2lcUWqFaKq/P3A2aSeo0d75Yxp5Ser6a01yXrBzjpt+q8GXgGdf/icw3iGmbplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6354.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:54:22 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:54:22 +0000
Date: Fri, 4 Sep 2026 09:54:18 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"frederic@kernel.org" <frederic@kernel.org>, "marco.crivellari@suse.com" <marco.crivellari@suse.com>, 
	"neelx@suse.com" <neelx@suse.com>, "sean@ashe.io" <sean@ashe.io>, rishil1999@outlook.com, 
	"chjohnst@gmail.com" <chjohnst@gmail.com>, "mproche@gmail.com" <mproche@gmail.com>, 
	"nick.lange@gmail.com" <nick.lange@gmail.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <wzefzyuv6cq3ql72fee43j5e5z3zkziv2cisaln3kyai4557mc@nkhusexbckeh>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
 <SJ1PR11MB608333A92F98196EC747C75CFCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB608333A92F98196EC747C75CFCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0698.namprd03.prod.outlook.com
 (2603:10b6:408:ef::13) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6df47d-cacd-43e8-db49-08df0a8c05a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|7416014|1800799024|4143699003|6133799003|56012099006|10067099003|18002099003|22082099003|18092099006|3023799007|27256017;
X-Microsoft-Antispam-Message-Info:
	ITwr0Hu0xjhOn5FPfvpLOGDnlE4ZcVdyQSSZIChjAU0sMioPTBSzgT7d5yKQswx0FvQhsjyw6F59cAhbWb8N4kmZuLioltGE6i9S2W266zGGn1t3qC/F4nP1KJ+GscVvXpZwJHY756MEwF2Yv8DkXiLwzvdzz9pE7ePy5kczFAqxdBsIorfcviP3LFGleskJy+eMKtEedH3/oivXIrlHXZXe4bfRO658+pfDVVcWPt23YokfAoF66kFJmW+bdqDlBlpabE27FShVHwrP355/nYYqE3y/QvjVgpr/h/ILP8reqhm5tLLQliJ40NIeqjJZgKMRoMyBkjgJrCUeblMQrmXpYyF7pn+Aa94vnLCHSjzU7vFWABvF72h1n10fBhmcgPaj+yzA6ZMMVjRZ2UhgLyOp1GhMH45ggWPtvnceoxZ6ODiKEzB+4bANTFdckpbY24T0TuXfo8qlKAkGjOsgLCON9OnHrDATGJ+0NjAQtDJK6JcdYRgRX+nXkGbbdwUPnoiMFVwd9AAFjLe4vAraTL8CJd4V+rLQK0yhygYCUOPMSriHMDiPXoxZyDSQTL1ypG/FVzvwYc9gkFGY/lQC1AHZTFaJZkJZRkA5vg1BqPpDcODI2vbyTT6v7xYOlqhWSw/0O8dzNRySGvrWovWReLYX5D8OxuXrK6EOMCEzn8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(1800799024)(4143699003)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(18092099006)(3023799007)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JBNmt0TEhwK3VrdE5VS01qRHh4eC95a0pQdGZVNGFlcHI3azZSSXlSakdn?=
 =?utf-8?B?OVZ0MVk3YUp2T0FnK3h1V05IVjcvNndRdUdHQXlyZHBva2RKOTN0M2cvVmV4?=
 =?utf-8?B?MnpGRDd5WXhKRmp1RDN4YnJYL3FpbXd0L0tSZ0dLSTllcG9tUDhaZTF0blVI?=
 =?utf-8?B?K1Z6dXNnRWpDSzh1aVd1NVpFRFJ2M0ZxRlVvS09KSjQxVkE0SG9RWnM4OGIw?=
 =?utf-8?B?U3Vuc1A3ZE5hZmVhUHNnQm9GOE1hRkhtQmVSajJpRXNNQWtKb1VFanAvU1JS?=
 =?utf-8?B?RzNEOElPN1NDdVBrNG4wd2hIZ2xtazRqc0h0RHJqd3Q3MitJeTkzYkF6aGZO?=
 =?utf-8?B?RlgwQlpsVFczWTJYb2FMTFB3ejRzSEJiSlhLODdMMmQxOEkvOTRrWStwbHRa?=
 =?utf-8?B?TDR6ZjNqRzREYWkxUndjOEVVUGtrOXR4dFVrNUNadmVvZFpENzU4K0lGdkhF?=
 =?utf-8?B?NlJrZ2hGdEJFYk5MaXd2NjlIYXBERGFUYzU3UW9UajlqQjZRWkFKeWxaNFpv?=
 =?utf-8?B?SG5aampwMnhObGJKcDJPYThCV1p2V2hidFdiSkNiRyt2ZzR4RStpRHdheUVH?=
 =?utf-8?B?ajZCMzRPODhKWEYxcTQ5WGxRZ1ZpN090MEpZcHVzZnAxSTZuc2I1NHBtUjFS?=
 =?utf-8?B?S0J2aElSelRVU09TQVhSWm9xRC9nQUJjdTdLTVZKWTlTL1BrNW0zOW1FdHdR?=
 =?utf-8?B?VWN5clpvMUY2bWRDVHdPbzZKNSt5ZkRpWWV4V0JGRVNWd0JNNW1UVVFMMXJY?=
 =?utf-8?B?SENEa0x2citZalRvUkhueUdYdWhxU3NHRkF5K0JkY3RRbzdWekZPNFJPclpE?=
 =?utf-8?B?OU1EcHBPL2tkL0JtOVBYRS9IS2lHNnZWWG1sTGw0YWVJQkFCSWZHb0NiOThp?=
 =?utf-8?B?SlptRkMrSFBGTVNGM01mMmZpQWRITW8xMk9Db1V5L3JxU1BzN1FUY1ZXeHhS?=
 =?utf-8?B?Nlc3R3dZNVFqcitYL21JTllQbURZYkV5T3ZOYXBUamlGcWdnWWIvMjZjWTJV?=
 =?utf-8?B?T0hGQlVFQnFxTTJpQ1lWL1o4c2F6Rnh3b2RUTjhEZnlwWkZlYUN2dGZCNng5?=
 =?utf-8?B?QlB5bDdENWFNVEdSc1FmSGtnUktxeDdxcFo0VE5jV0F6aUhQRllXVUdiOW1x?=
 =?utf-8?B?SzZST1d2amJoNk5kUUhpb1lwQm1KWE41eGREcnJCMVNwR29pMmo0UkJtREh4?=
 =?utf-8?B?Y0w5WktXN2lDbmpLalJ1SENpeHd5WW5lL3JaSVVLRVYxL0p5SGNVN1N3QTU4?=
 =?utf-8?B?STVXSXV3VkdNeEdEdWs2NXRNN0JaZnN5dzBZeDhDWU9SZlRMVE9sa3d6MlJO?=
 =?utf-8?B?ZGdmVHdxZklmL0p4WG4zYlBJc1VkNHB4dUdqMUFhODVxTTllMmNiQy82SGN3?=
 =?utf-8?B?b3FCK2h5ejJ3OHh6UldCNzlOclJuRlNnRTRyZjdFMGZaUTRuMS9HcjNOck1L?=
 =?utf-8?B?WTFQSE5lTHhZaUVMbW9jemw2L3dJWElWZFpKTVExRWhVQmVTTnRXZjlTcHVu?=
 =?utf-8?B?Q3h1bEVEMXdubVhKUTVQaEo4VkRiNElYL3djREhCZUpzYnlNazhJUGJyb20w?=
 =?utf-8?B?NTFFUFQ1bWlMT3hZeDdldlVJVnJod0ZTRTRvdXA5QkVNaXl6WVJvYTVuOHcv?=
 =?utf-8?B?QUZSTlRVYXJ5VEJEcTFwMWhrVFJMSnFhR1JxOGxFQ1k5R2xudVNMUW5scnFo?=
 =?utf-8?B?cVV2dmNwbXlYZXRpQ2lyMmNKdnVlSDl6Ujc4a0ZaRzluN3d6aWJHRWh4eThz?=
 =?utf-8?B?Z3NtVVFIRHZSQ3VUc0hXOEs1VjRwRko4TjVDSDFSd2xreGQ2d3cwb2VsSll6?=
 =?utf-8?B?RXQ2Ym83bFZNa2VScG5lSmxCOVZhVlc4N0NTbm9qVmllRXdQSGVkTjZUTHVG?=
 =?utf-8?B?YXJJMU5UR0I0czJ6NWpKZFBpa2V5b1d2U0JRSmpWdHBXQkcrR1dDb2dtWGMr?=
 =?utf-8?B?S09weGNEY0hhdEQrUWc3T08wY3ZTNUhTOVBtVW0vOGVINzlCQ05YNE9ub3My?=
 =?utf-8?B?SE54YTk1QitlaHJrYWROSFVvRjRYclpEZlN6bk9VaHdJVzRLbDdNMGgzZ3Bs?=
 =?utf-8?B?TW5rYmhZTmlsb2V3SGVIRm92clBtRlNIYnFBaU5kVUw5cU9QbERhZTNRY1JL?=
 =?utf-8?B?S3dGMk1WelNGN256cThaQmlpdlppL0hsOGtFRXZQZVRDTFZzT3B5N054S2dZ?=
 =?utf-8?B?MHpqdEJOK3lpU1l2bVhtdXNabk5UbXlGWm1kdFFCaStMWkpOU080b3dONVJp?=
 =?utf-8?B?UmM5OU00bzNqMFAwNTFZcUpYeEozZkJFMWFJWGhoMVZreHFrbVlRalFuZFNZ?=
 =?utf-8?B?ajg4MU1qTVA4QlRxTE82amZGMTB3Z1J5NnBsWlRBUFF4a0kvQk1WUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6df47d-cacd-43e8-db49-08df0a8c05a7
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:54:21.8603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjDYQZs5DsJsYTaQcqeoaT4F4hJllA5QpAIuQkC19rYdKcnWpos7fHIvzGUNhxpsu956JLW0bq2ov0kaSJ8G4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6354

On Thu, Sep 03, 2026 at 10:02:56PM +0000, Luck, Tony wrote:
> Hi Aaron,
> 
> > Sashiko [1] has correctly highlighted additional pre-existing race
> > conditions in this area. Should you prefer, I would be more than happy to
> > incorporate the fixes for these into the current series?
> >
> > [1]: https://sashiko.dev/#/patchset/20260903194130.186096-1-atomlin%40atomlin.com
> 
> I'm not sure about the first Sashiko issue ... there is a wrong statement:
>  
>    Since the hardware threshold for a stormy bank is set to
>    CMCI_STORM_THRESHOLD and no longer generates interrupts,
> 
> Setting the storm threshold doesn't disable interrupts. It just prevents
> generation of a new interrupt from a bank until enough errors are logged
> to meet the threshold. So the user won't see logs for a while. But should
> another storm occur, then things will fix themselves without a reboot.
> 
> If you see an elegant solution to this race, then go ahead with a patch. But
> I wouldn't stress if this one isn't fixed.
> 
> The second report regarding firmware first banks does look easy to solve.
> Just change cmci_skip_banks() to clear the bit in mce_poll_banks?
> 
> -Tony

Hi Tony,

Yes, you are entirely right regarding the first report. Sashiko's assertion
that error telemetry is permanently lost until reboot is incorrect.
In arch/x86/kernel/cpu/mce/intel.c, I see:

        #define CMCI_STORM_THRESHOLD    32749

Setting the hardware threshold to 32749 merely defers further interrupts
until that count is reached; once enough errors accumulate, hardware
triggers a CMCI interrupt, and cmci_storm_begin() restores active storm
polling.

However, the preemption window I believe is real. Because cmci_storm_end()
runs in timer softirq context (via mce_timer_fn()) with local interrupts
enabled:

        void cmci_storm_end(unsigned int bank)
        {
            ...

            /* If no banks left in storm mode, stop polling. */
            if (!--storm->stormy_bank_count)
                mce_timer_kick(false);
        }

If a CMCI hardirq preempts the CPU after stormy_bank_count is decremented
to zero, but before mce_timer_kick(false) is called, the hardirq's
invocation of cmci_storm_begin() will increment stormy_bank_count to 1 and
call mce_timer_kick(true). When the softirq resumes, its delayed
mce_timer_kick(false) will erroneously override storm mode, leaving the CPU
with stormy_bank_count == 1 while the timer reverts to the 5-minute
interval.

An elegant solution is to protect the storm transitions in both
cmci_storm_begin() and cmci_storm_end() using local_irq_save() and
local_irq_restore(). This serialises the counter updates and timer kicks
against local hardirq preemption:

--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -85,29 +85,37 @@ static void mce_handle_storm(unsigned int bank, bool on)
 void cmci_storm_begin(unsigned int bank)
 {
     struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
+    unsigned long flags;

+    local_irq_save(flags);
     set_bit(bank, this_cpu_ptr(mce_poll_banks));
     storm->banks[bank].in_storm_mode = true;

     /*
      * If this is the first bank on this CPU to enter storm mode
      * start polling.
      */
     if (++storm->stormy_bank_count == 1)
         mce_timer_kick(true);
+    local_irq_restore(flags);
 }

 void cmci_storm_end(unsigned int bank)
 {
     struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
+    unsigned long flags;

+    local_irq_save(flags);
     if (!mce_flags.amd_threshold)
         clear_bit(bank, this_cpu_ptr(mce_poll_banks));
     storm->banks[bank].history = 0;
     storm->banks[bank].in_storm_mode = false;

     /* If no banks left in storm mode, stop polling. */
     if (!--storm->stormy_bank_count)
         mce_timer_kick(false);
+    local_irq_restore(flags);
 }

Now, regarding the second report, Sashiko appears to be correct. During
early boot, acpi_hest_init() -> mce_disable_bank() broadcasts via
on_each_cpu() to clear Firmware First banks from mce_poll_banks, but CPUs
that are brought online late or physically hotplugged miss this broadcast.

When those CPUs come online, cmci_skip_bank() currently bails out early
without clearing mce_poll_banks:

        /* Skip banks in firmware first mode */
        if (test_bit(bank, mce_banks_ce_disabled))
            return true;

Because mce_poll_banks is statically initialised to ~0UL, the bit remains
set, defeating bitmap_empty() on hotplugged CPUs and causing mce_timer_fn()
to periodically poll and clear Firmware First status registers.

Clearing the bit in cmci_skip_bank() resolves this cleanly:

--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -181,8 +181,10 @@ static bool cmci_skip_bank(int bank, u64 *val)
     if (test_bit(bank, owned))
         return true;

     /* Skip banks in firmware first mode */
-    if (test_bit(bank, mce_banks_ce_disabled))
+    if (test_bit(bank, mce_banks_ce_disabled)) {
+        clear_bit(bank, this_cpu_ptr(mce_poll_banks));
         return true;
+    }

     rdmsrq(MSR_IA32_MCx_CTL2(bank), *val);

If you are happy with these two changes, I will fold the local_irq_save()
fix into Patch 2/3 and the cmci_skip_bank() fix into Patch 3/3 for v6.


Kind regards,
-- 
Aaron Tomlin
