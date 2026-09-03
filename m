Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9304EE850;
	Thu,  3 Sep 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471038; cv=fail; b=QMSiNHFG5NoA3KjH7mxGe06xuft6fKAOZoxBRKsVJpSxp89Cichjg7UtL6bD6GWM+ZoMWuq7Ym74dLE1/5Bweq1xwiasumMMQ63LM6o96W9gduKh8beeFKPt55cOXBMVDlK9vqCz++ZY+Ad/mzHGykX06EVusgKNmdGlhEWKL9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471038; c=relaxed/simple;
	bh=nvuiefBCN1FjVXRuuP5r4KbCLkIwGS1si/+Te5NVRe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4CYzCnPKHITIdO0P5YA2LR/gdo1ERTki/pGaZ6VUJGTjBYL/zcmGtJoImvFEfhIKgE6BSDR/mDqivQnSShkwJ0vdABxHjcTJ3rXROv7TNFXkpHRJM94tkMfYWWEcR1VeZGvUfRa3htNsNMv+z7iDKopUBlznzFc8lTQV/KJ/bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVJ4pRsCJv7pHDpr854M9VBIET1p+IJ6Z3doAVgYlFA2C4WC9faR5UpnGtYS6e2WDF9xqITnDmDWwYNbW6J08an5KV3LwYjEU/ZnNYqgeJSKIpW1ragynRM0gDBXx/V5/muNXvCWIDIVciWOuOINEd0KEDisfAcSGO7M9CKcfYQouPLhhZLQZ2gB3Ent0OEAI+S9llKQbXNlagxpIi0sdfaXMFg9WO89gAkzIU2rAxdD0uyy+ziERraYZ+wzYUn7jhnFpH6h4dszsiCv7yi0UuGonwHQunFvITatSj6RF1h78+kXwrQA1EhLWQV9bY+pbw2KdXslk4YLU6b5GoCU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=34Nz1I/SfraQkr/mP38ig7+KA/mrWvwCecGxjUDxX4U=;
 b=vVU4qleF1pJl9iHL6g9ucp7qqloHXdc3HKzGyj4wcOB2nVdfuuha86YIOhdaGfapjL/57hdgc549OfsoQNSAL3uK5qUNxgsD8X+Oyk7E1toK5KmF3aPv7jKyjqizbpSQvJWVVZg8JUfhric7mWglQgs3x62QIkzrzOhqxFND4PYOJwlLw4VhSuw6pv5y05s7bJaZ0vPsHonCyEwv6eFxsS9oMCwXw2Vsc7GaxqN2ZJqdaEvFwID32qJ/IRpo09kQa8Tkl2qZrhoj130jjTXyu0s4ZqRsIfjZ17d6hUNjJfbCeLSCVzGDEFw4UmXqGWydFJcqpelo7ujgErUsm0GqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB3231.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 21:30:32 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 21:30:31 +0000
Date: Thu, 3 Sep 2026 17:30:28 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
References: <20260903194130.186096-1-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903194130.186096-1-atomlin@atomlin.com>
X-ClientProxiedBy: BN0PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:408:eb::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB3231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e14513c-461a-4644-e08b-08df0a0294d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JtwCbu/vlSKlglmEfmTsHA6rm4++Mhx/yK7LQJgW5WLCp2dtVPQtk2da36EQTb2GNIHB9XQYDiAfBn+w3WMzmqxpAm3Br8gnSCLqV7WukF5lYIfgKp4s1so4OwuHtInbzsa0WWnBziOoUMWQ80htSpZOr4Cy8D8fb27ZKA+FpmAtFf5Mcjs6DUJdVXdVJumJ+HF5h7Gw+NPJ9U0RfWC/3N02m60CTIny6dKzQOwNK1ZSxLgMEBKcSXrTpVQ/UvL95dtphfGbwBiWC/Ri/BY4T6PfC3DY0zCAarpro+ojTVif8KDPNpbrRj52BGyYxvdlbMYqjvQUCoYrdxbJ4OR50vsC02TkXaQf8YUD4A2zVjlaR0yvEYu7zWHviaVkeN6Jr7iL8IyV2OhrudKKvEmv1jHw6FwFV7EAOkW+lzOCAgxKhYgvyrzpzs2waJWj6D8Ix/F9Je4+o6lDt+R3m5U6FfuTyZPi9BBrt67ifyKglWPF29lanJ/8t5ZiampQjKW8DtzgVsEZdbngNHB8WogsYTUPT6ffiKJnHh7y9nisHXaR8mYIaq5jYWRQ6XV4tBUDgY+X3S9S5kdXP8oVbS98M7YqkNn4XouhsEEbTsH5/NE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z243MjU3TmI2L25ZYzRCQ3ZhWkVESFYvcXlZaUtYWWtsa0lyai9QWHpzY1ZV?=
 =?utf-8?B?VzZVa0hBM0o2OGpyVHRMaHFhbnJJUDRLZHN2TUNaWGNVYjR4VE9ua2ZCNVl5?=
 =?utf-8?B?ZmhyVHR1dWRuMHJyaEM3bzg0TjZpZVArUXF1MUExSDRvN21JSlBTaVdNWDZD?=
 =?utf-8?B?WDRXdDVsWUtVVVdVRXVBaGhJSVNMMWRVWkpHUEdqVjZpcFliM0dzMW80Z1hP?=
 =?utf-8?B?QUlLU2ZybnZCUzVmdEpyUUFLYTd5SW5EVnNFbm5aZm41YmdTZ0o3NmJQZ1VJ?=
 =?utf-8?B?bzdnRHdqM0ZJdjdsU1RKbGloaXphdW96UDdSVG0vZ1lNSFVuQlZFZVJhcTRy?=
 =?utf-8?B?TkV0SWUxVGJDUzhJUjdqK29qVWRBa1U1UEx0NGxuZ2JwU0hMWDdxU1RGaEpr?=
 =?utf-8?B?MlowZXBVYzBBSlp3NCtJbU5wbVlId2YvbUNCbFZKK2I0c0cxeW5ISjdJOUN2?=
 =?utf-8?B?cXVpaDgxNDI2c05QenlKVU5VbmVWTWRHTGFRcHdQenFYVTVacmtuTk03Si9k?=
 =?utf-8?B?Z3IyY2VLSjVzaUFVbVZ3bjhvQVNWYjFtcnlJemg0QS9Va0pFQUFlQkRMUm9K?=
 =?utf-8?B?Zksvbk93N3hLN20zcEFhS0dZNUs3U2JjY3BQVFJNbytTdFFqdE9SdUY1U1cy?=
 =?utf-8?B?a053bG9uZ1NzQmNJUjc3N0NpSFN2eGpTbUp1bVVFR0tXZnQzZVp6V0xDSGxa?=
 =?utf-8?B?eDAwR2k0SysvZnJQVnU0N1d3SjBCZ2lFRUhxZkFYN3MvZ21XNTk0N0NqVFdL?=
 =?utf-8?B?VFpMVng4VVA0Z3EzTHpZWCtuWW9MZ0ZWRHl3UDlDS3kyYjJYdjdpMC9HTUlG?=
 =?utf-8?B?Y2lsM3pINjdtU2lxN3cyWUIyUVBHK3h0NEpjZHVtbHZMNUJIc2JBa2lQV2pF?=
 =?utf-8?B?RFg4TFZ0R3BtT1FoRkszczJvY1B5b2k5OStBdUNFb204V3JQQXBTcFpMakZm?=
 =?utf-8?B?bDV6OWE1azRVMXMydm90ejBCSHZiOWZFSlpIWlZWN0JGYktxUWV2NG8zZ1Z1?=
 =?utf-8?B?TmZYS1lHQTRiWXNjMEt3cjNJZE85REtYSlFQRDFsNjJLTWp2VTRsLzd1bk5G?=
 =?utf-8?B?ZU9jMVVac1k1b1ByaEtnUTRqaCtTbVpwbUxZVXByVmtXUFVnbHoxbVJGQks3?=
 =?utf-8?B?VDV5YTIyQnF3d0twUmlGWCtpcHNLbHJPeUhsOThSang2aGZmMlVCUUZ0U3BY?=
 =?utf-8?B?Q0Y0WXJsQjQybncyZHJSczNKRytETkhWKzJMdGlqeVBJRjI2cklPSitUTmhu?=
 =?utf-8?B?WUluRWdnMWpoUmJkOG5yRncyaXlWQjQ5SkMvZ0xNRXk1WGFUTDR5KzIyVmVL?=
 =?utf-8?B?MGt6WkwrdnFIeXVYTURyc2JvTjd4Um9DOE56L0Q4dmtiTGFhTTRKOFZlUVpH?=
 =?utf-8?B?UkFzK3JoamZrM1lzN3N6SXlCVENGUXhiQ2hPeVQyOVhlQjRlM2RJN1Z3a090?=
 =?utf-8?B?TGl0RFZQUm8wRXZYVTh5ZWQ4YUFBSXB0YlA5dHRhTkhWdjlaNVJCblVLY2sv?=
 =?utf-8?B?MU5RRVNMdXROV3p5V2dIMGE4eEE4SENKeTFXdUliR0x2MjhPb0Q1NkdIbmNP?=
 =?utf-8?B?U0dlN283NXIrUzUvSzUyUlFuQTk1UWc2RWRySW1RSHZ0NE4vM2ljTmRRQ2hN?=
 =?utf-8?B?SWRlUDBXR0g2QmhwTE0zT0JNT2dvSGc3RWR0SXoyY2l1UXNiTmZ0RmFHbWl0?=
 =?utf-8?B?bVlxMVIwc1U0TW1WTjJJSjB2Nk5Wb3paTUdoaWI2MVRPbFZLclhUbks0TW9k?=
 =?utf-8?B?d3I1eXg3cWI5ZU1lYWx4SE5ZV3Fjbzd2U1RsWkdtcE9uZ2k2TXRDK0lYdmx0?=
 =?utf-8?B?QXdYK0lLT3Yxa3RHcFEzQ2lsZEFxNDhlN2VrY2FzRlEzRmdNR2cwby82eGtu?=
 =?utf-8?B?aHdycXFpTDk1K1VNMzBGUEt3WjRJTHRrQ1hEMWhEVzRtUDNrTzlTSlZNdkho?=
 =?utf-8?B?eEVxUWVvM29EeXNSZjR3c2NpVzNjTHA4OGFtc3l4eksrK0w1MGdyWGRmTzk1?=
 =?utf-8?B?QWFyYWhxY2NkMmw1U2RRVWZvZmp2cEFRblVOWmluVkZTcHJKa0xjd1lkaFJq?=
 =?utf-8?B?RnJBY2lTTmdjQm9lcmlPblh6MHFqd2djb01iL1BvSm4wTE1PODdDeXlNcDN0?=
 =?utf-8?B?SEJIMU02SGJua2NKSTNaRVMzRzg4UjRPaXVTMVRlYkNnZ09NSE5WdnFIc1U0?=
 =?utf-8?B?Z1RpWEdKU0N1YTNqMHNBVTlqNjRIQ0tOZ3phcExaUUVEVzdremh0RGpnVmtK?=
 =?utf-8?B?NnRxRVh2OWVDcGxWaEdva0hUTVFxd05INlNLQng1UE5hSUUvWEk4MkNYejBE?=
 =?utf-8?B?cHJDQys0bUFuNGVTYUlmYTYxckdZSU1USis5dytqaTdMOXVyOUdPdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e14513c-461a-4644-e08b-08df0a0294d9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 21:30:31.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFJyIYla5W5O5jPKd/FSG8HSO443g1veURYny4f9PHaMAcn/39XDPVdAdDVG6+L2q5yo9yuKotT70X9n750S1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3231

On Thu, Sep 03, 2026 at 03:41:27PM -0400, Aaron Tomlin wrote:
> This series addresses two distinct issues within the x86 Machine Check
> Architecture (MCA) timer subsystem: a race condition during runtime CPU
> reconfiguration that can corrupt the kernel timer wheel, and redundant
> periodic software polling of banks that never log corrected errors.
> 
> Patch 1 fixes a concurrency race between sysfs configuration updates
> (mce_restart()) and asynchronous CMCI interrupts. When mce_restart() runs,
> a concurrent CMCI interrupt can arm mce_timer on a remote CPU before the
> restart IPI arrives. By removing the redundant timer_setup() call from
> __mcheck_cpu_init_timer(), Patch 1 ensures that mce_timer descriptors are
> not re-initialised while actively linked in the timer wheel, avoiding
> potential linked-list corruption and kernel crashes.
> 
> Patch 2 resolves a lost-update concurrency race on the per-CPU
> mce_poll_banks bitmap between timer softirqs (cmci_storm_end()) and CMCI
> hardirqs (cmci_storm_begin()). By switching to atomic set_bit() and
> clear_bit() operations, Patch 2 prevents interrupted non-atomic
> read-modify-write sequences from clobbering bank bits, ensuring banks
> entering storm mode are not permanently lost from polling telemetry.
> 
> Patch 3 implements Tony Luck's suggested approach by recognising that banks
> without CMCI support on modern Intel platforms (such as the PCU bank) never
> report corrected or UCNA errors (per Intel SDM Vol 3B 18.5). It clears
> these non-CMCI banks from mce_poll_banks and ensures mce_timer is never
> armed when mce_poll_banks is empty. Additionally, it integrates a
> housekeeping check (HK_TYPE_TIMER) so that on legacy platforms or
> polling-only configurations where mce_poll_banks is non-empty, routine
> polling is restricted to housekeeping CPUs, sparing isolated nohz_full
> cores from timer interrupts. This eliminates polling timer jitter across
> all CPUs in steady state on modern hardware while preserving full polling
> capabilities and isolation guarantees.
> 
> Thank you.
> 
> Changes since v4:
> 
>  - Added a patch to switch cmci_storm_begin() and cmci_storm_end() to use
>    set_bit() and clear_bit(), preventing lost updates on mce_poll_banks
>    when a timer softirq is interrupted by a CMCI hardirq (Marco Crivellari)
> 
>  - Switched to clear_bit() in cmci_claim_bank()
> 
>  - Link to v4: https://lore.kernel.org/lkml/20260903041320.179965-1-atomlin@atomlin.com/
> 
> Changes since v3:
> 
>  - Removed redundant code since field poll_only of struct storm_bank is no
>    longer set
> 
>  - Link to v3: https://lore.kernel.org/lkml/20260903013933.172063-1-atomlin@atomlin.com/
> 
> Changes since v2:
> 
>  - Bounded bitmap_empty() in should_enable_timer() to
>    this_cpu_read(mce_num_banks) to prevent initialised upper bits from
>    keeping the timer active (Tony Luck)
> 
>  - Clarified that on polling fallback systems, restricting mce_timer to
>    housekeeping CPUs leaves core-private banks on isolated cores exempt
>    from polling, while preserving shared platform telemetry
>    (e.g., Memory Controller ECC)
> 
>  - Link to v2: https://lore.kernel.org/lkml/20260902020234.149814-1-atomlin@atomlin.com/
> 
> Changes since v1:
> 
>  - Fixed a pre-existing race condition in mce_restart() by removing the
>    redundant timer_setup() call in __mcheck_cpu_init_timer(), preventing
>    active timer wheel linked-list corruption
> 
>  - Non-CMCI banks are cleared from mce_poll_banks in cmci_claim_bank(),
>    and should_enable_timer() verifies bitmap_empty(mce_poll_banks) before
>    checking HK_TYPE_TIMER
> 
>  - Link to v1: https://lore.kernel.org/lkml/20260901151138.132950-1-atomlin@atomlin.com/
> 
> Aaron Tomlin (3):
>   x86/mce: Do not reinitialise mce_timer structure on CPU restart
>   x86/mce/threshold: Use atomic bit operations on mce_poll_banks
>   x86/mce: Avoid arming periodic polling timer when not required
> 
>  arch/x86/kernel/cpu/mce/core.c      |  8 +++++++-
>  arch/x86/kernel/cpu/mce/intel.c     | 13 +++++++------
>  arch/x86/kernel/cpu/mce/internal.h  |  2 --
>  arch/x86/kernel/cpu/mce/threshold.c |  8 ++------
>  4 files changed, 16 insertions(+), 15 deletions(-)
> 
> -- 
> 2.55.0
> 

Hi Tony,

Sashiko [1] has correctly highlighted additional pre-existing race
conditions in this area. Should you prefer, I would be more than happy to
incorporate the fixes for these into the current series?

[1]: https://sashiko.dev/#/patchset/20260903194130.186096-1-atomlin%40atomlin.com

Kind regards,
-- 
Aaron Tomlin
