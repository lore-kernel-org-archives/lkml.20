Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021079.outbound.protection.outlook.com [52.101.100.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91C23D7C2;
	Thu,  3 Sep 2026 03:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406639; cv=fail; b=SPW/i1sFym+Fz5Vtb+/1eS10Fs3aBnjn4Ncqhw5fHHT/OB6SYouup7D3yBiBZUQMFhcdVGsWDi3wjvOEz3uJRY8oqNUVXta3YWvHcwM815f6QWntd00T0SsghPggOs1sttfRShAsguiKprHLhzE3dGB8BijjCHZ4Kb2lwTQidJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406639; c=relaxed/simple;
	bh=RK53ZPkvmHxdE2tgy2HE71XBuomfdXcWiP097Hgg2ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ihvl9Q2gm/RxvKI8zSnUou9L62NGlRSFEtlmHWQhDP3dmohX5fJgMXlzFRjWrOfJEKwKCbT+PfSdJduRWNsKdSWL99GTvnlVdlCOLkQ3WcM+tCXJmoyf49Ew973Dg00wHzx9TG/otLZuz2+N0hTY+yLcZ1F9wkt3F+gCqtD92MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atUkzFL5q4dT2fOMp8zIiGY4KUQT7unMcn9ZDwG3nfTG5FE0QEe/BmKnPXHOJIaeklZuKa1zaMOYHc5d27mHvkccgA3Fsu0ecVg145dEVG5urTkDUkn38c+OZ0s4ukpLgElaV14dIT0z5IWKhLLjvmuiK85wGOId2AN6MqmTCTcyxEc9QolMh/H3XyZLYps0pYof/VumaS6KLejZzdFtu2fymn2KvVkCkbNKH9L0EFzVSuqSDTt8LEzE2L5suxFHfu5IE3coJ6xd67Rjdfs5V6Pu52nOq+XEUzgThZc/dOvq3OkAtxvvKdu0M0X+wy7in2YRjTSotjDs3YgZPRjQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=RvuE02q/WgQf7mqJP5BYaYAHu9OyovCSldoy7fk7eEs=;
 b=cLbMtSdL2/HOLVOLpNxupBsp12EEmGv9I6lW8BiSwCrxKv+IBRTSDTvzs/Pmem35k3V2JNiwt3PvP6Wh+TK7sYf9/2l5DxYL1wE4mDHU0NXtG1lGzBj81CJgY4LgTK7jj/JAXO3Ts1GyOpvFzYakSdkDcoxRdTzX/n1/Wne1aP9YO0l/SQzvMNzWOj8uim/kTnsbAKwQ7T/h7p6fA5gCt5BYrV7C2WtxkKLRDP9CqOWyCm4/1GZ/ZSpjfOQtzEMY79gstzbg8CgBdMQmFqMmuQUB4WKQiB5n3flPQmjQtM6cWdqYzWL0FbUPHtsChZaEB9pTmxuA1QxS5zWUsH/4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7817.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:248::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 03:37:13 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:37:12 +0000
Date: Wed, 2 Sep 2026 23:37:09 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, sean@ashe.io, chjohnst@gmail.com, mproche@gmail.com, 
	nick.lange@gmail.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Message-ID: <i4wsspcxs7rmn4dancu7khltsozvttjb5je46tivqcddp23snk@5p2vtwlh4pee>
References: <20260903013933.172063-1-atomlin@atomlin.com>
 <20260903013933.172063-3-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903013933.172063-3-atomlin@atomlin.com>
X-ClientProxiedBy: BN9PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:408:f9::17) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6271740e-4397-465f-25c7-08df096ca436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|5023799004|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lm5D7/gDWskoM6IDPgI/a+187nh17S+Qu5984nqk/XZrjdsaHge4WwjHBkh8xKs4LAI/gFtP1ltiHTSgS9DIexJt084tHBL2p56CFervr0wMV8+Q/vI+VZnz01OsbxiRbrsHkf9pxHRoT13z8D9l2sDXQ/f7BAalJxGMuIk3DPh9dEyLp2Ydep2pTSwTZ2IOU6IdcYXvnUsh+lg/jCxFSNTdpWQ2k0DAk5QNKFKniT0ngNRPixaW7PMAh2cNuTykaQcfwnBvef6x7yl92TGBH2leSfZKfHb9/uUXbQ2fep5AIg5CpHA52wGiov2iJ8hdupkFn76F8dxM0Q+JkTMZeAlDyJUkG6GgmXFwzE/e0L8Egkrd5mnNH2O+HGjFGLLi4QvDEC/gWMrxHT2oZgFDZG94EU2UPFXNDuumGkq0tdNpBvijTSj7CJu285jSnVKJ5z1vONbgEL9CW1tStiix0+vSoInZCYyfs2G/7PDqo6uqHLKHRG9sJh+X7wiH2PMIH75a/SAc7YVl3IGtRGmeCoMAyWirq/Ixie0MU71m8DqaDXnivOQryThngLTIemy+b8n283lVYODSR5hsh9mp5uaYk9rGtleyN8AUiJzQB3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdhTGtvVmRwRUJUQkNlKzFreDN6MmgveTJQSTNocTBPRVV1OEFScXBMbmtR?=
 =?utf-8?B?bDIrV0d2aHRvaDZJdFdQd21RY3V5T09VRkpMU1QxeW92dVRieEJuS2Joci9r?=
 =?utf-8?B?Nnd5M1g3a3VUb1hZOUprdzJHZnJkSTFCdmtJNVA2TXNNRGlkRTJ3R0cyd3JJ?=
 =?utf-8?B?VzlZWmVzTHF1SEVYREwxN3hROG1UMW44TGRSakE2VVM3bVVxLzAvVHB1djdT?=
 =?utf-8?B?eGtkM2dmeG1EejdPWG9RdFJRVlBOUHJMdVVndHFJNHdNanpUakdEM2FtZ080?=
 =?utf-8?B?MEpNWkhWMDR2dW45NlJvU1ZTdE9DMjYyTzNRaHQxL3lUcm10MHR1blVsZGFq?=
 =?utf-8?B?Q1Nscm9hQkduUEZJUS9wbk9EZy9jVDdwTEZSUWU1ZzNrNjk4eXR3R3lrdjdM?=
 =?utf-8?B?Y1B1clBaNlBnWVI0R21jUnV3dzZkTGFobllYSmRpZG1WdkdMYjdHWk04KzRH?=
 =?utf-8?B?eGhyYnBHNUN2VER3LzhTWFArckd3a2gwTnUwOGdXOG1oZ3RZdE52Y3ErNjhi?=
 =?utf-8?B?T21qNTE1L1ZNYUp1U3EwWUV5QVBHR3FLc1poUTU2WUhtTGVQSk9rS012TnRQ?=
 =?utf-8?B?R3JzNDlJSmZEejI5WlJ5aDRNdlAxQW9qZ2t0MEhJU2gybmJTcGNnWktLc3Rv?=
 =?utf-8?B?NEVaYWo2bVp4bWxaZEluYThXV0JDWmZyYnZUT1J5eUdidWJ4Uzl5aEJkV0Q5?=
 =?utf-8?B?RTU1c3pSSEprTGRFZXZ3R3kyL1R2TUpESERnSmJSclhCbXhKMEpFREdrYmdx?=
 =?utf-8?B?eEZzYUhOM2tLa1RBZlE0UGU2ZElETkMwOTExU2R2Q2toSkpPRWl3RitKd3Z1?=
 =?utf-8?B?QW1mOVVERi9yeGtYZWh4bE5LNDl5Um03MDdUcVA3ME90QmUzemV6ZXNiOW9S?=
 =?utf-8?B?a1kxZlNuRVNYZVRoemJaRTE0V3NlVXJzRkFEckdEQll5a2g1TFFjOTArNDla?=
 =?utf-8?B?YS9jZ1I2b3BLN2duR0FOMU83L2s0Ry9jclVkQVJNMEtacDlENEVpdzVObWZI?=
 =?utf-8?B?ay8zT3BiUFpkYk5TRHVMdHlpSHFyR0loOTdTdnQxdTZCbnUxMWhsZkdBVXkw?=
 =?utf-8?B?UWFJVGFHK3FNTmdnT0toaFVoOU5MNExPa1ZJZkJDTmpQV3liVGFjUlFqMmR0?=
 =?utf-8?B?T210UzVPWS80TVRLc0ZGTlIzZ3dLMkIrYVd6bUxCVCtqczRCZkFBUjZZTk93?=
 =?utf-8?B?RG9kTE5iMUFmcXhRemNkU3F3K0lxRGpvQ3ZTWjk0MDdFWHdCa2FhcWJyQkJF?=
 =?utf-8?B?eXAwdjRuS0VhdzBMLzFNQmlLWWFPNXoxaC94MlZYcnVVQkhUSVpLZGRPdXBT?=
 =?utf-8?B?TjRBV01UdE9HZEpyNVNCdWcrcGZFS2hmeVpvM3E4RXpwa3J6QURKVERXWGgx?=
 =?utf-8?B?UjY5TlRHellBZ0I1cm9PTzFNV1N0M3o4SmdGblA3cTRMREpObWsyQjFxRmc1?=
 =?utf-8?B?OTEwbDRrWnNYTWlhMjVpTWw1YnhpbHdwZGZ2VnNzSEFZeEJ1UVVrZzdZdnZP?=
 =?utf-8?B?eGgweVQ2ODV3WEZ5dDF0dVhQcy9iU21FNUFGSDhWdVVtTmQvNHBIRndjdU5F?=
 =?utf-8?B?RWtqTTVySE4wS205ZDd4SVcyZUtkTDgyRGk1dWNtUHZIWjlING1weW93OVlB?=
 =?utf-8?B?ZFZUZHJqa3NCVHhWLzJLKzVRS3JkV044YlRBVUVheVJpaUZac2swRklkL01k?=
 =?utf-8?B?WkltZEhKZDhHSDd3QjZoSVF4cmRtKzdFMlRWU0M1SHFWU2s1UEdNKytJbDVJ?=
 =?utf-8?B?NGZEdWNSNU5uZ1hyTTZ3V0RpVHU5MVpPZGViQ0xXVG5Cbm12OWcxakszcEp4?=
 =?utf-8?B?ZTRXQlJYTXE0VmtzSzF3N0lhZHAwbHJNMW1HSmQybnZFemZpVDVGMzB6QVVy?=
 =?utf-8?B?Z2VFUnVIN21sbXFOWEtpTjV5bGo1MWpaNFhGWVMvNGhCaU1ES01jeEd3SEJj?=
 =?utf-8?B?NzV0dCtXSUN0azZrN1g4QTFOdTU3UzFSZENnM0NYaThwc05Ebnp6ZlZsOE80?=
 =?utf-8?B?T0xFbXVQNjNCMlFNenc4UDZHN1lsY3VoSmRPaWdqZWxkdEdOcHpYbzYvY2N2?=
 =?utf-8?B?V2JUNjZ2UWYvQUdUV3VxUlpJUVV5c0tDa3o5WktQUkduV2t6RG1jSW9vZi81?=
 =?utf-8?B?M3FyTk50Q3BSTTNORGJnMmFNSWV0QjdjZ015amJmd0lPWHB5QkFwdTlUd2ly?=
 =?utf-8?B?amI1TGJkSklZdGI0dlFlb1VEMnUvNGNkeUZOK3QrL1hmRGRqbS9tMVRYUm1I?=
 =?utf-8?B?MGNJN0lWdHoyQWdwc2Q4MnlPTUJWSDYrbmtRRTZ6ZTlkTlp5QkQrZmlrYVg5?=
 =?utf-8?B?N1hTanlKM2NsRFdDd2RJMTBkejBaTExiY3RMaVU2R2FmWUczK2RJQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6271740e-4397-465f-25c7-08df096ca436
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:37:12.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPO5hIRE/lODK7BZVcrR45RJ3GgTzkJyuqRNIM79eBXilKdHVosIzd8cyHjReeKzmL4CokMkV59B2LILJP+pTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7817

On Wed, Sep 02, 2026 at 09:39:33PM -0400, Aaron Tomlin wrote:
> On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
> per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
> banks for "silent" corrected machine check errors. Because mce_timer is
> pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
> its expiration to a housekeeping CPU, causing periodic latency jitter on
> isolated cores.
> 
> On Intel systems supporting Corrected Machine Check Interrupt (CMCI),
> hardware generates an interrupt for banks with CMCI enabled, clearing
> their respective bits in mce_poll_banks. However, for banks where
> MCI_CTL2_CMCI_EN does not stick (such as the Power Control Unit bank),
> Linux historically assumed software polling was required and left the
> bank flagged in mce_poll_banks.
> 
> Per the Intel SDM (Vol 3B, Section 18.5 "Corrected Machine Check Error
> Interrupt"), if bit 30 of IA32_MCi_CTL2 is zero, no CMCI is available
> for that bank and no corrected or Uncorrected No Action Required (UCNA)
> errors will be reported on that bank. Therefore, polling such banks is
> redundant and wasteful.
> 
> Clear non-CMCI banks from mce_poll_banks in cmci_claim_bank() on
> CMCI-capable CPUs, and amend should_enable_timer() to:
>     1.  Check bitmap_empty(mce_poll_banks) so that mce_timer is never
>         armed when no banks on that CPU require software polling.
> 
>     2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
>         sparing isolated nohz_full cores from periodic wakeups on
>         systems requiring mce_poll_banks polling.
> 
> On systems requiring software polling such legacy platforms lacking CMCI
> or when booted with mce=no_cmci, the mce_timer is restricted to
> housekeeping CPUs. While this intentionally leaves core-private banks
> (e.g., L1/L2 caches) on isolated cores exempt from periodic polling to
> guarantee zero timer jitter, housekeeping CPUs continue to harvest
> telemetry from their own banks as well as shared package-level
> resources. Synchronous (#MC) exceptions on isolated cores remain
> entirely unaffected.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c  |  7 +++++++
>  arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 765e8103b0d2..b01ad1a9b455 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -25,6 +25,7 @@
>  #include <linux/delay.h>
>  #include <linux/ctype.h>
>  #include <linux/sched.h>
> +#include <linux/sched/isolation.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/slab.h>
> @@ -1759,6 +1760,12 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
>  
>  static bool should_enable_timer(unsigned long iv)
>  {
> +	if (bitmap_empty(this_cpu_ptr(mce_poll_banks), this_cpu_read(mce_num_banks)))
> +		return false;
> +
> +	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
> +		return false;
> +
>  	return !mca_cfg.ignore_ce && iv;
>  }
>  
> diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
> index 4655223ba560..cc7d0dfcf9c7 100644
> --- a/arch/x86/kernel/cpu/mce/intel.c
> +++ b/arch/x86/kernel/cpu/mce/intel.c
> @@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_zero_thresh)
>   */
>  static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_wrong_thresh)
>  {
> -	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> -
>  	val |= MCI_CTL2_CMCI_EN;
>  	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
>  	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
>  
> -	/* If the enable bit did not stick, this bank should be polled. */
> +	/*
> +	 * If the enable bit did not stick, this bank does not support CMCI
> +	 * and no corrected or UCNA errors will be reported on this bank
> +	 * (SDM Vol 3B 18.5). No polling is needed.
> +	 */
>  	if (!(val & MCI_CTL2_CMCI_EN)) {
> -		WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
> -		storm->banks[bank].poll_only = true;
> +		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>  		return;
>  	}
>  
> -- 
> 2.55.0
> 

Hi Tony,

As per Sashiko [1], since poll_only field of struct storm_bank is no longer
used, it should be removed. I will send a v4 shortly.

diff --git a/arch/x86/kernel/cpu/mce/internal.h b/arch/x86/kernel/cpu/mce/internal.h
index a31cf984619c..32ae574d2ad5 100644
--- a/arch/x86/kernel/cpu/mce/internal.h
+++ b/arch/x86/kernel/cpu/mce/internal.h
@@ -84,13 +84,11 @@ static inline u32  mce_get_apei_thr_limit(void) { return 0; }
  *
  * timestamp:          Last time (in jiffies) that the bank was polled.
  * in_storm_mode:      Is this bank in storm mode?
- * poll_only:          Bank does not support CMCI, skip storm tracking.
  */
 struct storm_bank {
        u64 history;
        u64 timestamp;
        bool in_storm_mode;
-       bool poll_only;
 };
 
 #define NUM_HISTORY_BITS (sizeof(u64) * BITS_PER_BYTE)
diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd..2a82c9f6b5e4 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -118,10 +118,6 @@ void mce_track_storm(struct mce *mce)
        unsigned int shift = 1;
        u64 history = 0;
 
-       /* No tracking needed for banks that do not support CMCI */
-       if (storm->banks[mce->bank].poll_only)
-               return;
-
        /*
         * When a bank is in storm mode it is polled once per second and
         * the history mask will record about the last minute of poll results.

[1]: https://sashiko.dev/#/patchset/20260903013933.172063-1-atomlin%40atomlin.com

Kind regards,
-- 
Aaron Tomlin
