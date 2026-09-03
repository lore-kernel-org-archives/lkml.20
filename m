Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021133.outbound.protection.outlook.com [52.101.95.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61303358AD;
	Thu,  3 Sep 2026 19:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463129; cv=fail; b=CwH2vG1zN3b2RQ3kqfq2NZLzWO0NBA1WvvSkSZ66gnfsKQfS5ZP4z+WrjuB+whiU7+pWPSZGCKWOK1/pDoV86kZTiAOn31eprwNYsOTNs+ZO90vFqIyl4Hws3EsG6uQ7BcWj/NAxRJxawqdPCGdtvF0HCAkDXeBPMXHY2sETFCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463129; c=relaxed/simple;
	bh=ORZlGBCZswQcFZWd6zqZhWCy9maAZlYfX1c7zsVAiAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z3T5QXTzYoxLHxx99Gtn5CzqTW/sR+NeQla7S7l731epoiTBYnMuU6OX0rKxO21KslFbrZetukpV8S3Nug3D9RTPfRwZThtEIsEhXAzAwID7744BYxFlSTL6vqXmZ4kG5x7kEXbdTAStEZNJ1GPIXciu39spV8yheR8FcZJppOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT1T12lMhzSiwcnGYY81LA1FI1QeOp8XkiGHC2RSd1w3lhzOJA4lkxe2Ps4sdsQqS++6O/G8Ew+iu6GV8QD3G8ytiTqEF3dWKwwWn3CrKvG4Xrz0pGRgDigmtxCAVpozc0aYC2MXHxY+46zuQT69bzGMH9+GOFimS44a0V+46JkBLXJ/1ilLQPOd4QZ6EaxszpcDd5lniuuBT9vk8GYHwTgIZRqX6JYYdfTJ2js13VkZoDxrGwy4SbZk1iIh+T3Mj83JZYGvo5Bn3sw+2vAPFTBigZG3hbZBrljW5kqU8u1eStXyu2c1J4mFSYlk9t/6UB45xfgfHE4ySRmWpO7Tzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=oPxzzG7T7Lev/SNXHcqgh63Rno3QDOnHVGO5ssSvbAQ=;
 b=X+1D5zmVwP7kcp+sfTIU/Y+XCUIAZkOQrqOdXyHiiDwIIE/OzSMG3HLEhOnnotfVSbi/REInqv/u8UrVn1SzTforSNNEpQZ+M23aFhqiVL0Y0VN5H9lZCv4W0ROBDX3sx/sVyKuZBhJQAZuai+xraLNi77+uREeui/S37F6FxOyDYjIrQ2sXLznh/Kcb2juyk4SYFvA2608qTLZ4/sY+HbO2ZeBZEqs4lqI6bvDOWYfG/j5HsFo2JJRPDFsY+yEv5DYhua7pJKdnhEdsEA8MjWSfWLAVhNyGrzHBvRqJnjcCUExguBUyuq6E2+uuF9/ZZiouJrMjQmSdoZtzGk03dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6726.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:18:33 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:18:33 +0000
Date: Thu, 3 Sep 2026 15:18:30 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, mproche@gmail.com, 
	nick.lange@gmail.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Message-ID: <meco6huj6tnwozht5h3zrp22f5ljtvyulphesu7csou7y64uoz@4zkit3wvrtea>
References: <20260903041320.179965-1-atomlin@atomlin.com>
 <20260903041320.179965-3-atomlin@atomlin.com>
 <CAAofZF7rNbEZuiGJXyjn+wwtdF0Y9vDEo2hGhJak6CCkP8YB-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF7rNbEZuiGJXyjn+wwtdF0Y9vDEo2hGhJak6CCkP8YB-g@mail.gmail.com>
X-ClientProxiedBy: BN8PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:408:d4::20) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc241c1-cc48-439d-fd60-08df09f0255c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|13003099007|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	8GKoeV53Wgrrr2HmpqkNcDVlxrK6wgoettN/0XjezgIyOpObqxrRhNBxWzobL7G2rgqnj+LZEYeEadxUiXdYJgZclDJR+YMuVGHtMwIA4SmqoAEXoM+ibcYXXB26E/Ubl0M1Wm2cDztZe81VQ5V/Ak2guu8kzcKf4QTFv8PF1W61EkU80HSagQmkF3M0vYzgztn6Xw6jI1MX50MMnpBctUOC6KY9VVBtbsXU6nro4TFZprqwaKs3rDanuCrCTQ7YHToDbOyI5vqCEw3qk2xNjAdW89m/OSEqopKrZUJwEzu7zzUfLynPGEoSYZucsjuSe3hdsFvdu00f3/rN7pr3FLDijpkZOt/IB+rNm9CsZLj3r87BhTpvGPbujyFnawJ3nPJ5RV0oS1wTF2EjxEuYWW5iOn9cQTTyvoQg4mq3F7sMUD9Zodv5oqE4bHc6/Nj9sNVRoX2MWdw/X3PXwGHig02dJCMGU6F4uFlicolfgQClcPCkClJrzY9vcsdYuWGRm723XBtd7fT0XJlRtnzHHJq6GgbiphxXFHY6qmpcnILWE2ifqR3rXRN5qSyRRnZm4O/M8J2BXrKL4NXsDl87MIxjFBMunZds1SU2I48atDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlDeGpMU2FoTjU1dFpKSldwa2JFUjJPc1NMMGh4T0FvelF6YW50a0x2NjJ2?=
 =?utf-8?B?b2d6b3gveDkrR1JXOHJYYzh3TlVsVUx3bFJNVlk2Q2xhUTYvS0ljS3FxM2x1?=
 =?utf-8?B?dE5WYm5sNmNINlRVZ0ZkcmI2NmR4MTlQK2dYRDQ2ZlQ2RURIUXIwNjBBdVEx?=
 =?utf-8?B?S2xqMUtudnRoZHVIb0wwRkhtOHR5MkNlMWxjZGlMZkVhN0NuZmtaQlVoZDBv?=
 =?utf-8?B?ZzNWYmo2RTlRNHZZbFdmTHAycHNEWFp6Wk9WSE9PVzlRVDNJWXAwTHVKcXN0?=
 =?utf-8?B?NlJKWW5kYSs4UGpnbWt3ejRtWEpWRDdvMUovYlYvWXZMUWlPZmRtYllzc2VK?=
 =?utf-8?B?eVNuQ0UveU9qa3l1WElPZmpqcnFhZ2l4aUlRTjgyM29RRmdJZFVhNlB3S2NY?=
 =?utf-8?B?enVKa20yQWlPQVcwak5vY0owdTM0dmZob1FTOEJtK050Zlp1bTloQ04zQTlE?=
 =?utf-8?B?dzlUTDc4c0FLL2x2ZWdSaFQ4Yno2TWR5WjBLb09DM0cwc3FKVUZpWFdVTVVW?=
 =?utf-8?B?bkM4QXNWM29SNGNIdEpMWDh0ZlhzYmNrMEJuYngreWdsY2VmTmNieFdRaDdP?=
 =?utf-8?B?QlJRUXl5Q3FTOFJwZFB3YWJ3NzNRZGQvTDZMdmxQV2pmRUxJZFdwSEdWSjVJ?=
 =?utf-8?B?WFgxZzVNaWVReTl1NU1oZWM2T29ITVI1NGxUdC9nYkZmN1BYTkRLNUdlWGVJ?=
 =?utf-8?B?cjdjaUFmUnFrOHNENHExRVpDZktISGYvR08yVFRkMThLN3QxT1hBcDIySWs2?=
 =?utf-8?B?NFlPc3JYQnUvb1h5OUdxdVllWlMyY3h3MlZUYm5RZTFZZldKQzQ1M21xNk9M?=
 =?utf-8?B?cUppTTlibWJRa081aGlISkZld05TbG1OWDhHWS8xcGJFcGwydmR6ZnRjMVJU?=
 =?utf-8?B?SW1kbjVhRDVhNHFLMWo0TlBWbHBteHpDKzBwVFF5ZmljNHVDUnRJaGpiR2E3?=
 =?utf-8?B?OUNVNFRFVUVnYXJna1RMUDVkTCt1anBJbzRETWp6QllDRmVNWDdubFZPOVpK?=
 =?utf-8?B?UEthTWxqYmdmV21NWkJ5dzVseGU4Q0hKVHp5V0RjMXlSQnVyY3FqMXN0Sm9F?=
 =?utf-8?B?VEV5bTd5RGxxUWRka082M0lNWmgrSWhtTkpjTDRSb3lwY205Nm9CODFyQk5Y?=
 =?utf-8?B?b082NmlkaTNOeXZCT1R2NEUwdFRQR3NBSjZlUlZwa3pDOGpMZUc3ZkFqN1Ew?=
 =?utf-8?B?R1NkT2pueFBoQ2lKb3RiV1JsZGsvaGZBdXNSNGRXaFI2SWtkV29BMzRseTFm?=
 =?utf-8?B?czh6NmNyMnFwM09WZW5QdVdWR3NiYjA0WHFhMjdTaE43bno5T0NlTmc1UW5C?=
 =?utf-8?B?WlpkYVFScjN3aEZQQzkyTTk1QkZwa0xkcUhWZzBlL0RKVWM2ZFBUOG4xNFkw?=
 =?utf-8?B?aU94R0kvZXBxYjJ5MFFGZno2ZXVYMUhkN0Y2bHhrL1JEakN2Q2RpWk1EbStu?=
 =?utf-8?B?QVRnRmZ3MDJFTm5ieGQrRyt3Wjljc0JkSHFKTDJlQVRlc3luSVQ2c3JTYURT?=
 =?utf-8?B?WDV3L1dhVGlmc0pzNFExTDBYRWRFT1dlTjZPeDdwOWVlYkVzaXBlTTZzSEZr?=
 =?utf-8?B?SkczWEQ4MGNsZ1lEK3R2aFFRNlVBNlRDcGdTcWc5Skg1czF2dFpPRWdtUSt6?=
 =?utf-8?B?N1Vhb0JIVE1zKzM4elNZVWdpejZ1dlJsTGpBM2hCQWNZTmM1UW1aVmdacXd5?=
 =?utf-8?B?TmxNKzBsQnpJRXdhZzF2dnFqbFlOTEl5VW9iR3lkajN6M3ZoYzdHR2hFTlVy?=
 =?utf-8?B?d1NkbGVBc0tad2NBeGEvcVY0NkFZRkczM2E5T3BMUVAwSm0zS0lMMXBSMDM2?=
 =?utf-8?B?VjNzQVduZ0djWWRncXdUenZoa0V2eU5Wa3ZWZ3hBb0hnVndnM1ByRlU0VVFj?=
 =?utf-8?B?VVcydkhreFpudEphR2hHRTgvcmhwRWJpaU1VQVRVNlY3RjBNTWM2akFOUVhN?=
 =?utf-8?B?bVBqcEx6WUlpOFpYeDNQYUlydEk1eU5tN2xQZDEySUlTenBNdzFCOVk0aHJT?=
 =?utf-8?B?UFp3SDFpQnROMTVxekNTR3lMaWhla015dzk3MnFoYytPa2k0cGFBWjN6Y2pw?=
 =?utf-8?B?ODY2RmxIVlVLZW1zRFN5MnJJTkFiRUNZRUtwNUlER01MamFBdzVlbkFCdFNl?=
 =?utf-8?B?bGRMUitRUUpaRUswR1NLR3lsNHk4TExadUE0SHRHK2kxV0hjZWZaM3JCb3Ba?=
 =?utf-8?B?UW1JWWVieE4yK0U4V0dNYnNWQWpDKzZtNDI1Vjg5QVVkRFNCanBoZ3FlNEdl?=
 =?utf-8?B?U3puNmx1a0ZRWkpZUG9NMXRCeDdqcEpYVFNrNXM5cDVmQzlidGNFVnB0SlUv?=
 =?utf-8?B?RWhBTzg0ck40di9aclJCNmV3NFR3MXMvZDJ6YjlRWkVBRCtOSXRBUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc241c1-cc48-439d-fd60-08df09f0255c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:18:33.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwxbMEJxAK2Uxw/HpOshLbn4nC0/nrjOAzHiQmYvoTk+MAf/xHmWKLQDbXT86xNXV0bUGWBRbaEVdhJPoHdvlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6726

On Thu, Sep 03, 2026 at 10:49:34AM +0200, Marco Crivellari wrote:
> Hi Aaron,
> 
> On Thu, Sep 3, 2026 at 6:13 AM Aaron Tomlin <atomlin@atomlin.com> wrote:
> >
> > +++ b/arch/x86/kernel/cpu/mce/intel.c
> > @@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_zero_thresh)
> >   */
> >  static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_wrong_thresh)
> >  {
> > -       struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> > -
> >         val |= MCI_CTL2_CMCI_EN;
> >         wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
> >         rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
> >
> > -       /* If the enable bit did not stick, this bank should be polled. */
> > +       /*
> > +        * If the enable bit did not stick, this bank does not support CMCI
> > +        * and no corrected or UCNA errors will be reported on this bank
> > +        * (SDM Vol 3B 18.5). No polling is needed.
> > +        */
> >         if (!(val & MCI_CTL2_CMCI_EN)) {
> > -               WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
> > -               storm->banks[bank].poll_only = true;
> > +               __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> >                 return;
> >         }
> 
> Not sure Sashiko's review it makes sense but to me it could make sense [1].
> In short:
> 
> > cmci_storm_begin()
> >    __set_bit(bank, this_cpu_ptr(mce_poll_banks));
> > cmci_storm_end()
> >    __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
> >
> > Since __clear_bit() and __set_bit() are non-atomic read-modify-write operations
> > and softirqs run with hardirqs enabled, will the hardirq's modification be
> > overwritten and lost when the softirq resumes and writes back its value?
> 
> Sashiko's suggestion is to use the atomic versions, "clear_bit()" and
> "set_bit()".
> 
> Thanks!
> 
> - [1] https://sashiko.dev/#/patchset/20260903041320.179965-1-atomlin%40atomlin.com
> 
> -- 
> 
> Marco Crivellari
> 
> SUSE Labs

Hi Marco,

Thank you for your review!

Yes, the per-CPU variable mce_poll_banks can indeed be modified across
different execution contexts on the same CPU.

Tony, I will address what Sashiko [1] reported in the next iteration.

[1]: https://sashiko.dev/#/patchset/20260903041320.179965-1-atomlin%40atomlin.com

Kind regards,
-- 
Aaron Tomlin
