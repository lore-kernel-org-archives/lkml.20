Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021075.outbound.protection.outlook.com [52.101.95.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30D84ADD91;
	Fri, 11 Sep 2026 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149393; cv=fail; b=NTxsjsoD89kJnRM/PhF5WxZvRvhqJAUCrymq8SEGPD7JZG2ggQ1gFCnfJhsIviCbS9CDkw2oMmRRo6vcvWkxHxT1+1tgpPBSg8Mvs40x7YevTMrTS5dXUo9RJ6Awh1cwMzlfWxBSSR9/aaW2R78uq2imtRBE6aEiSxpnQQ8A1Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149393; c=relaxed/simple;
	bh=1NJKblO0pb84xsLJT58F/i4bRZVlmh/v5fAC/BNqUMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i/elzrMtjmh6/2RwMLw12YmBtYIgM/XpBspnJ1v5p4MELnfqpckabHcEMXCUixQ/39fguWc07GMNKV3mmAA3w+EOfrYeWSHIxszKo8l4eJiq3iQSe69U46UFELPSQr3R4JejKMBK00jaY1phss9+vF279tkzAcHABjOXj2NUBXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhwNRkfox2TofdoegooqofVTQO91GC3ipETbVb+BQvzqur/ZoON+Ui3jwEHEd7jR7WYwfVMgmE6fsEnTfLzsPC4i2ixTTeG6FkP9Mg1OifU/CRwoRTln/Qcv0OkrCqP2Cd7g+NfDkGcIYTGWUxKd265X229Zts2FFEJLXiOIPVu/w9Xi2U+FUczzlQLUbraLeCLADlD43WlulbQePknJj5IzMg6owT/oDdxqIkf3/Ko6iWZtS/QkZOoJet9KmknyYr07dv+GDugt8tQo5iky05Hu/+X/O4TWoTI3TRhPb4YdFCueeHPIGDfyhIREHMa8+llD1nQGzXsktXWvK2G0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=rNssNbsx16hROONx4UXzhGSiEv30o/IfrIPSvvqNpLo=;
 b=EOeyobNv+LkunK2m7Mp5WhzXNGvtabZ4b0Vw53uO+VowGP0XZrjq6wJhT1i8yd1vVVkMlGYMteAdlej8O3jcqzGTxpRk49XuvxiMWEpNIK7NDKtGcHgsQn653zjcRKA6ys9Xofj63yKLhqyXGfoAqyS0G0A8Zt7xNOpyAn89bOYk1CvkVH5VGhM1ufPklLG0uVeRjL7ydv4wgDyL+Y85vQMavGrNT3IloQaMXmW0MavboHmAvBkPpfMUEw6k9zndUwMcCwTHgu9S7CNMJfvwHHALaAsMES52M7oW0gPJ84OmsXWRanOnYprEIOHxz1NzcmI8TcI2EG5GS9SUdM5wRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6531.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:27a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 17:56:27 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 17:56:25 +0000
Date: Fri, 11 Sep 2026 13:56:21 -0400
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
Message-ID: <inwa45pkpxv5fcdbd2poe5opbornm4mv7zfmn6jcdzaco7l6mh@altckgebocee>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
 <SJ1PR11MB608333A92F98196EC747C75CFCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <wzefzyuv6cq3ql72fee43j5e5z3zkziv2cisaln3kyai4557mc@nkhusexbckeh>
 <aps9bi_M1p_Adwkg@agluck-desk3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aps9bi_M1p_Adwkg@agluck-desk3>
X-ClientProxiedBy: MN2PR20CA0052.namprd20.prod.outlook.com
 (2603:10b6:208:235::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e613f6-a210-43b8-5ff1-08df102dff0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|4143699003|6133799003|18002099003|22082099003|56012099006|10067099003|27256017;
X-Microsoft-Antispam-Message-Info:
	GBLywz5IPH/kbguKzD+S8AzpEXjmlhTmzhenxcPrmBcs0N7uRro0FfMhJVMnh/5hVh4khgSeOBzqa5vkFiHu6+I3jFBOIZySgBp9LqwYlWTi54jFzU+4O5b3/925kQG9ulSHKUhNlk+LwtCedKh+NeVIYQiXkXy5WYl1F0lxsBViIfWoocVUUb3SigvDsh62NE4gWyNlvZM2Wih/+wkxwxec6jmPS5JgCu6YStbm7jMfH0bMOVnQdbsYM9pChmsljwqJe5wmOS9pi283qsviu0aQhWVwV3B0ii0JoZZ7+BDPnyGvYluYorywOIEJUkevNhTYQB1qf7B/hAc+G/ywA4iy4REg3I2IWsoF4AthdyDAZK8iBg20ZO7YpRy4jSriR4OQ2mBch0BEKkoj7iQdAxkVI81Mwgm30MT3u1z3FxIXIWuffDWYCd6DIadjjuY523vHLI2CEZXrQZNujS8gJomNMOW9kSgzuVRxM2Bq2Se+vsnur0kGjyG8nABkjrQLZYKRjECo+q8G8cJZYe1XKSl2qjjXUOHoFqvFp9pPl+X59gWIKMwc2Jvmc+tbSL5IKizLMhsSv+Af+gP+fqu/Xl8o6RHDbpgOhdcrIJQYKBRG8WkEPuaTvRaXMmjIg3159+zQLbEpw2qI4HSZ6VH4ln4BA4cdyE76Yg8YgAAivGTwVC4LsM9TqQPjbUHmjOWKoMdKU0QJmZ4V1NZBeEYzbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNDNDFCRm85d05XanJIYzlLUTNsc3hsWHRtMXZWdmpGMlV6Um40UzQ3VU1H?=
 =?utf-8?B?SzBaOERENURaNXFhOFdVbDRTb3ptTy8wbnhub09zTDlrK0FxUFI3cU55Q2tW?=
 =?utf-8?B?L1d3cWFrVllXc1RZZ2UvcTBzSlZMS0NtTk1lUjNGSDVNZGFTYUZSdFJzeFFq?=
 =?utf-8?B?UGM4UUdJZEE0M05kcG9BNVRnc0EvZ0l6cTVVUWZ4cGVydVdYd0c4aVpOV1Fa?=
 =?utf-8?B?V3hRR1lmWFZ6dUFnY3ZqUm9UQUxpT1NqbXNmUWhjMW9ZV2FKRktyZ0g0WXVv?=
 =?utf-8?B?M2pkN0EzOW1LUUlSZkNBNkxWSmkxaEkzb3dmZWpmYXg0Vlg3MGg3RW94S1VZ?=
 =?utf-8?B?ZVM5TUhCNEpVWVJYZVM5cUFLTHFtcEs4MWJPL24yNGtPR2VOZ0pjRE9OVG9L?=
 =?utf-8?B?R21HQnVGWXIvVXQ1MDBRYlU4ZUZRY3NrSEx3VncrdnduMi9ybW53Yi85U0Zy?=
 =?utf-8?B?V21mWldEMGdpa3BtUlpaWUUrZXVwWmtTN1JrTUZJL25MU1FoM2JIanA4YnZh?=
 =?utf-8?B?dko4YllRWW1XVXVoaVcwK1ZncTA1cGZpaXNuZWNHQVJ5bWVDd1VSUTRLUENp?=
 =?utf-8?B?d3Rtd2J3UDhTbzB4aDU3Q0htcFRZdkpjZmVoQmhLSkQxRW15K2VkMndxd0xh?=
 =?utf-8?B?NGJyWklseldJM0VFLzBDZlV2ZHhDV2M5dzBDRnRwMFp5QTQ5MG1NcEcrOW9W?=
 =?utf-8?B?THhnV3NJcllsbTZqUk5IcWkwU2dES25GTHRpMWZXbXV5REtTemJocE5RWVBM?=
 =?utf-8?B?b0NzeHFYYVEyVjcraXRhd2haWnV1M1EyL0gzVStxOWFkeDRMNFd3MFZDOVgx?=
 =?utf-8?B?R3U4V2tQNWJaOGNvb0lJbCtldWp4U0ViaVVEQmxVN081MWYrcG1XNnRNVXpt?=
 =?utf-8?B?bjUyaCtIUm5VZGcrS1VqQjNDRWJDY3F3d3ZzemQreXRJdnJvbXNyT3NxMVNy?=
 =?utf-8?B?MzQzT2FoTnUxYWoxTGhEUWIzaEhBZmkwaWJSS2EyYkZzWWEwQUl2Yllnclph?=
 =?utf-8?B?eUhxemt3SE9YNHh3bVFuN1BoV1lNRWFDZTFlSWxJTUZqVVFPSGxIS0FRQzk3?=
 =?utf-8?B?NW83dEpPSkg2bDcxalJwa1UvNkZEdU9xNnNUcThLZXYwOU1Na2ZHT1E2bnhr?=
 =?utf-8?B?Q0RKeHFobDhkdldoQkZtbWg0ZlRqTnV3Mk11YjZ4VTdYSU00aUlSZTR1dGlt?=
 =?utf-8?B?a2E0bTZLbkJyTE5sK0NhZDBjYitvV25OV1FwaDlxQ2NxaXBFV1hMNlk3anE3?=
 =?utf-8?B?TXhxR2gvQjJFcWpkN3FZWXFISm9ZT2ZhaW1TK0ZOKytOMHJlOXdSVFV5NHVw?=
 =?utf-8?B?R3VvT216cnQraXJZTWdYbzkxaGtBd0syQURwR2J6MVl0U1RIOGViQkhqOXhK?=
 =?utf-8?B?VytEVmhBU3A3NGhlVFBtS08xMVRqMzYzd0RCMlhmL3lJNmhNTkNWbmtUZFNR?=
 =?utf-8?B?c1ZpQXRoYTU5WmJZTnk3cTl1MTZoaVpIVXBPU1pEKzMzeHAzMGFFUEhLRXd2?=
 =?utf-8?B?eDduVGw2amlmOG9GcDEzeUt4aXVROVc2UythSm5oZzZDSC9nRGlYRnFYd3JJ?=
 =?utf-8?B?VWVEek5jcUNGZG80aHR3MlQyRWVabGxGSHk4M3VhNjMyMUxwaVlMS3pOMDMw?=
 =?utf-8?B?b1gwVnhCNi9ydFVJQkhoUlFQdi93MG15ZGM4WnhzMlZzZHB6VXNLRFluSU1T?=
 =?utf-8?B?UFA5dUREQ1ErQnM4S1BvZjVjRkxEdjgwbnV3Mjk5S3pUdXBWS3krcTNVdXNl?=
 =?utf-8?B?WURDYlNLWkVYUEtqcThTc2J3V1FLWjE4RGtCZEN3Z1FXRytZcVpSbFZvci9C?=
 =?utf-8?B?M1VONHJaeUhhS2JVNXYzVFJFbFpoNUc5SGdrMW9VNERxV1pFbVZqdzJ1NWF6?=
 =?utf-8?B?MnR6TnplbWUzaDdiSXVwLzlpaGV0MmEyS1pscDVsSWVNckpwSW0zZXFEL1hT?=
 =?utf-8?B?eW9COTNObmtTd2NtRitCZkVBL2lUSTJ1dU5yN3R2eWRoaWlhUW9CNzNlTVo2?=
 =?utf-8?B?a1BKbkZxNXR0QzkyR2NuWkdIZDhSWFNWMWgrd2ZnK1E0WUZQaUN1UnBOU0dm?=
 =?utf-8?B?Z05GQTZpTHE0VTRyY1pDTmljR1ZoQmRuVVhUYnBIT2NySC9yTzRpQkM5bzhk?=
 =?utf-8?B?ck9iK05xMUNGQ045K3VrZzl3Y3NveE01ek1IUTZuTFRRUEREck1vOW03U2pC?=
 =?utf-8?B?WUlvL0dUbmNGYWh6MnY0bDFqQTJweTJlVnJwS2x4YUZ3bU1lK2NXamRnM2kz?=
 =?utf-8?B?YWhYb2xvZG5LZnFjOFB0RHFSdXlKSUIzWXd1ZG8xYTd0ZUxTemt6SjdSdUpJ?=
 =?utf-8?B?SUdvQTNkSEd4Nnd0emVuSkttNlZHU1dSZlo2emg1cXp6anc4UnpKdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e613f6-a210-43b8-5ff1-08df102dff0b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 17:56:25.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vws5kTOOWhp2h6SoDV/mkiH3j9Dx8Ji7AAA86dbTjkqZeSvM/LVqT5Y2LT8Fot6ePArH+N5fP4faLzrmpzwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6531

On Fri, Sep 04, 2026 at 02:51:42PM -0700, Luck, Tony wrote:
> On Fri, Sep 04, 2026 at 09:54:18AM -0400, Aaron Tomlin wrote:
> > An elegant solution is to protect the storm transitions in both
> > cmci_storm_begin() and cmci_storm_end() using local_irq_save() and
> > local_irq_restore(). This serialises the counter updates and timer kicks
> > against local hardirq preemption:
> > 
> > --- a/arch/x86/kernel/cpu/mce/threshold.c
> > +++ b/arch/x86/kernel/cpu/mce/threshold.c
> > @@ -85,29 +85,37 @@ static void mce_handle_storm(unsigned int bank, bool on)
> >  void cmci_storm_begin(unsigned int bank)
> >  {
> >      struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> > +    unsigned long flags;
> > 
> > +    local_irq_save(flags);
> >      set_bit(bank, this_cpu_ptr(mce_poll_banks));
> >      storm->banks[bank].in_storm_mode = true;
> > 
> >      /*
> >       * If this is the first bank on this CPU to enter storm mode
> >       * start polling.
> >       */
> >      if (++storm->stormy_bank_count == 1)
> >          mce_timer_kick(true);
> > +    local_irq_restore(flags);
> >  }
> > 
> >  void cmci_storm_end(unsigned int bank)
> >  {
> >      struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> > +    unsigned long flags;
> > 
> > +    local_irq_save(flags);
> >      if (!mce_flags.amd_threshold)
> >          clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> >      storm->banks[bank].history = 0;
> >      storm->banks[bank].in_storm_mode = false;
> > 
> >      /* If no banks left in storm mode, stop polling. */
> >      if (!--storm->stormy_bank_count)
> >          mce_timer_kick(false);
> > +    local_irq_restore(flags);
> >  }
> 
> I ran this past an internal AI, and it said there was still a race in
> mce_track_storm(). This test:
> 
> 	if (storm->banks[mce->bank].in_storm_mode) {
> 
> is made with interrupts enabled, so another CMCI immediately after
> picking which of the if/else paths to take could change the value of
> in_storm_mode which then leads to corruption of the storm state machine.
> 
> > Now, regarding the second report, Sashiko appears to be correct. During
> > early boot, acpi_hest_init() -> mce_disable_bank() broadcasts via
> > on_each_cpu() to clear Firmware First banks from mce_poll_banks, but CPUs
> > that are brought online late or physically hotplugged miss this broadcast.
> > 
> > When those CPUs come online, cmci_skip_bank() currently bails out early
> > without clearing mce_poll_banks:
> > 
> >         /* Skip banks in firmware first mode */
> >         if (test_bit(bank, mce_banks_ce_disabled))
> >             return true;
> > 
> > Because mce_poll_banks is statically initialised to ~0UL, the bit remains
> > set, defeating bitmap_empty() on hotplugged CPUs and causing mce_timer_fn()
> > to periodically poll and clear Firmware First status registers.
> > 
> > Clearing the bit in cmci_skip_bank() resolves this cleanly:
> > 
> > --- a/arch/x86/kernel/cpu/mce/intel.c
> > +++ b/arch/x86/kernel/cpu/mce/intel.c
> > @@ -181,8 +181,10 @@ static bool cmci_skip_bank(int bank, u64 *val)
> >      if (test_bit(bank, owned))
> >          return true;
> > 
> >      /* Skip banks in firmware first mode */
> > -    if (test_bit(bank, mce_banks_ce_disabled))
> > +    if (test_bit(bank, mce_banks_ce_disabled)) {
> > +        clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> >          return true;
> > +    }
> 
> This looks right.
> 
> >      rdmsrq(MSR_IA32_MCx_CTL2(bank), *val);
> > 
> > If you are happy with these two changes, I will fold the local_irq_save()
> > fix into Patch 2/3 and the cmci_skip_bank() fix into Patch 3/3 for v6.
> > 
> 
> I don't think these fixes should be folded into existing patches in this
> series. They are distinct changes fixing specific long standing issues.
> They deserve their own patches under the "one change per patch" doctrine.
> 
> Also we still have:
> 
> static void __mce_disable_bank(void *arg)
> {
>         int bank = *((int *)arg);
>         __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>         cmci_disable_bank(bank);
> }
> 
> That should switch over to the atomic clear_bank() or there should
> be a comment on why non-atomic is OK here and bad everywhere else.
> 
> -Tony

Hi Tony,

Thank you and apologies for the delay.

Yes, you are correct about mce_track_storm(). Since mce_track_storm() can
be called from timer softirq context with interrupts enabled, a CMCI
hardirq on the same CPU can re-entrantly execute mce_track_storm(), racing
on in_storm_mode and corrupting the bank's history and storm state.

Rather than only protecting the helper functions cmci_storm_begin() and
cmci_storm_end(), the proper solution is to enclose mce_track_storm() with
local_irq_save() and local_irq_restore(). This serialises the entire storm
state evaluation, counter transitions, and timer kicks against hardirq
preemption.

I also agree with the "one change per patch" doctrine. As such:
    1.  I will split the firmware-first cmci_skip_bank() fix into its own
        separate patch.

    2.  I will convert __mce_disable_bank() to atomic clear_bit() as part
        of the atomic bitops/concurrency fix so that mce_poll_banks updates
        are uniformly atomic throughout the subsystem.

    3.  The final patch will remain solely focused on the core polling
        optimisation (non-CMCI banks, bitmap_empty, and isolation checks).

I will prepare and send version 6 structured as a 4-patch series
accordingly.

-- 
Aaron Tomlin
