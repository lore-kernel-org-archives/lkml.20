Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611368;
	b=3Omcph+ZXuQ4mAqqQYTDcTYdXNH4nfyZEjg2JuybbGy+B0XOfktlx0dE03bDbB0tP2Uk
	 23h0oAvlif3SIR43jksUrPGe6Y3To6BEUo0pnRRBCeDN49h3CF20QGR+ecYCrW2dF395x
	 8cQvupqGgul1E7VJXkNTgjeU7lhIRAGJcwzy86HGpyUtWBLeBS091F1v4iA8tu7miBBFE
	 Qq238jPAWiI7o524JMNNoaih3a6PhvZNwhEepzBVSCIoSd4pfDbVZ7Vh3He2c3UucoHzq
	 lFVYOuOdoZxEcJCJjUjO83q5yF/2S3BjcXRaScHaJFUSVplAUcIA8Kl23pP1dTpJOLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fB0t+BHdm8gquUsqjkMApis458GyXNfzybJEV2rTreg=;
	b=n9Pd10eo8EOxHsqlfE2gG3qk0ta74kBvjtmc22h5XnB2DPNiqrjbiPDbFW4ZVGVOsmu/
	 4aBmHPmlV4cfQw5LXSd/DylEn0cPAblXYcBFe79Dzk1gR0kKgnm6H9N1rUS6ns3y/DN6K
	 BneDWuzumhbS+SNOfq1Ym5s9TKYPMQHPSlecBT10cuIzjC6vXczeJjr77ZsqDOYw35XTu
	 pt/Y8VXpnWW0F7NXCaIHDcBEheRFmi0qnCFkV5ze2c+kPuB83iRqUpXJAW5dTgihwWR8w
	 bmjn+4le4grn+xr7G41lrvS9NGKH4o59ncQnFmCyokE3epPPw3cJiHdDWgUTqen0tsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K7YvMn41;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E57606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E57606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K7YvMn41
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48eee44b908so1675331fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794611366; x=1795216166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB0t+BHdm8gquUsqjkMApis458GyXNfzybJEV2rTreg=;
        b=K7YvMn41KR6tVPwBeJl91RFDq29ZYp/ZlzDyqPQCS2X+nfer5MYiNrnPHp1Z58Jd9r
         3Q0xPLOugNSX3jQfPiiF2UnhssorwnbShaj20/BFNP+Dj9emq9QAB+h9RI7Jr+qRNIj7
         KjpCq6QmkuLc/bFVP9TJduftQv+0z4nyf/N2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611366; x=1795216166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB0t+BHdm8gquUsqjkMApis458GyXNfzybJEV2rTreg=;
        b=XqMWetlYiYotDx2ymOZWYUksUn8oZ8oL/wmGfwcb54YMU30GEfeEL4Z6WikhLkE9z6
         mecIkHwGybcNTKCxlcFE/Wqr8P4+IkOCdVJdpZ+1V0ax27ANfz74Bfrs0Lvugf+9XvYK
         FXx0mqpcMb8ALvPsO0m8tciugnSpaglypig2OxeDo8Zw+5sYAFAVE/WqM0F5PbcdWIey
         OiogYQ/cSf9db5EUvnPe4/o0xlnHMcXuRGsXtcWggkw7BmWxlu7O6FM3lyGE+Y1rxhzb
         iICwQ8DJQSWS9kZ4qTSpNFZZNtCH8nvvMt7Tzo8gkW5gcE2E9ODRbE9fWRQymNNxdeKf
         czNw==
X-Forwarded-Encrypted: i=1; AL+hErEXwgfCB6FzussncmnH7EG/RNE9+GMxRD4beOM6QlC3g6uOh2eiFZhq+tqoE0hQNGkDMCWcXXOGSNeLmYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TTFArERgD3B/l122jPXYpOqQKc/KpuI/wBT9V4uVETGO43FGc
	7K64G9G8EDSornxxE0KRe7hRx72kTe7i472lu7JOWtU81KZ7y5qFfGBtIp8EPaAgREM=
X-Gm-Gg: AYBFou2hyyTftfSFEy6kcseCOhuiPmGgpR19gvNrzAnvJBcWmhz87arA0cVpANfgmyV
	JF5jgMMTrLeTs4s0mfVnOt9/W+LpgI3UBv2deyso4X+fnvPNRcJE6VTEXPq9SFGo6izWFKQDzw2
	j9s3/rj9CPi1WwpY3kWxF1ygFrgH8kXq7/Xhdzs+fMbK46IXMZfUR7KdxVkbRYtPtLg2cXNThVW
	ya+ZK/JgF5N0wIXdEpz/x+6RWLtWaCVrgCNrw2YoAjlbP4bfvBT+y2p91VejC7FFZF1vLYoiGAf
	ZHYej1nk8jjnyqULXxEq/ebm9lFVyJSA+oOMv6Bo/+359Hk7RfSgnHo7jlC0R6wRQ62iW19iS3a
	e4RMcbn1pthlQ2C6fM8whaePrlx9TI5RMRFsOkGPMhsKw9PgqawsGeEgB3fz7bnzkyNFCdLfdyp
	ypdPkWbJwFO7rm79z9NWf7N1FWD/geKHHdnC0k9RgsPOiNtYmVsGlScOtwQGx62jXemyyBPv0C5
	ITAPc7Onc0QTDXS4mBR+uPN6QwRu/j4R/DI+ctXRU3IBNkzbSLiOxMK/PoJtMjy6WN80w1NVgBI
	z4FlWI/OSYd6OcGN+rM8wWWdAw6fcaRSEl6p4Q==
X-Received: by 2002:a05:6808:3505:b0:536:611a:7fd9 with SMTP id 5614622812f47-56e6015e8cfmr3238393b6e.7.1794611366089;
        Fri, 13 Nov 2026 15:09:26 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6dcfcf4esm3285492b6e.2.2026.11.13.15.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 15:09:25 -0800 (PST)
Message-ID: <1bb7b407-0e69-421d-8ee3-81489abd1dda@linuxfoundation.org>
Date: Fri, 13 Nov 2026 16:09:23 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: fix use-after-free and stale limits in
 frequency-set
To: Lukas Beckmann <lbckmnn@mailbox.org>, Thomas Renninger <trenn@suse.com>,
 Shuah Khan <shuah@kernel.org>, "John B. Wyatt IV" <jwyatt@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261112-cpupower-freq-set-use-after-free-v1-1-4e0034927b3f@mailbox.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261112-cpupower-freq-set-use-after-free-v1-1-4e0034927b3f@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 12:49, Lukas Beckmann wrote:
> cmd_freq_set() currently has two issues:
> 
> 1. use-after-free
> 
> When cmd_freq_set() is invoked with --max and --min, it eventually calls
> do_new_policy() for every selected CPU with the same cpufreq_policy
> struct. do_new_policy() first retrieves the current policy and copies
> the governor pointer to new_pol.governor. After that the policy is
> applied and cur_pol (including the string to which new_pol.governor is
> pointing) is freed. For the next CPU, cpufreq_set_policy() reads that
> already freed memory leading to an error message (because verify_gov()
> fails).
> 

> 2. max/min is not retrieved for each individual CPU:
> 
> If cmd_freq_set() is invoked with e.g. --min and --governor, max is set
> by do_new_policy() on the first selected CPU by retrieving it from the
> current policy. Since the same struct is passed to the next selected
> CPU, it is not retrieved again, resulting in writing the first CPU's
> max to all selected CPUs.
> 
> Fix both issues by using a local copy in do_new_policy().

Good find. The change log is rather long and confusing to follow.

> 
> Fixes: 7fe2f6399a84 ("cpupowerutils - cpufrequtils extended with quite some features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
> ---
> Testing:
> 
> Issue 1:
> ASAN run of the (unpatched) cpupower example:
> 
> ./cpupower frequency-set -d 2500MHz -u 2500MHz
> Setting cpu: 0
> Setting cpu: 1
> =================================================================
> ==386949==ERROR: AddressSanitizer: heap-use-after-free on address 0x7c17340e0350 at pc 0x7ff73559241c bp 0x7fff5d8114a0 sp 0x7fff5d810c58
> READ of size 2 at 0x7c17340e0350 thread T0
>      #0 0x7ff73559241b  (/usr/lib/libasan.so.8+0x8841b) (BuildId: b8a4241051a1621937fdc46e867ba7ecb56d96ea)
>      #1 0x7ff7353cb475 in verify_gov lib/cpufreq.c:585
>      #2 0x7ff7353cc0dd in cpufreq_set_policy lib/cpufreq.c:631
>      #3 0x55f590fb79ab in do_new_policy utils/cpufreq-set.c:163
>      #4 0x55f590fb79ab in do_one_cpu utils/cpufreq-set.c:192
>      #5 0x55f590fb79ab in cmd_freq_set utils/cpufreq-set.c:327
>      #6 0x55f590fb3ee6 in main utils/cpupower.c:235
>      ...
> 
> 0x7c17340e0350 is located 0 bytes inside of 11-byte region [0x7c17340e0350,0x7c17340e035b)
> freed by thread T0 here:
>      #0 0x7ff735634e91  (/usr/lib/libasan.so.8+0x12ae91) (BuildId: b8a4241051a1621937fdc46e867ba7ecb56d96ea)
>      #1 0x7ff7353cb8ef in cpufreq_put_policy lib/cpufreq.c:283
>      #2 0x55f590fb79b6 in do_new_policy utils/cpufreq-set.c:165
>      #3 0x55f590fb79b6 in do_one_cpu utils/cpufreq-set.c:192
>      #4 0x55f590fb79b6 in cmd_freq_set utils/cpufreq-set.c:327
> 
> previously allocated by thread T0 here:
>      #0 0x7ff73562efce in strdup (/usr/lib/libasan.so.8+0x124fce) (BuildId: b8a4241051a1621937fdc46e867ba7ecb56d96ea)
>      #1 0x7ff7353cb1c8 in sysfs_cpufreq_get_one_string lib/cpufreq.c:156
>      #2 0x7ff7353cb845 in cpufreq_get_policy lib/cpufreq.c:262
>      #3 0x55f590fb7a4f in do_new_policy utils/cpufreq-set.c:146
>      #4 0x55f590fb7a4f in do_one_cpu utils/cpufreq-set.c:192
>      #5 0x55f590fb7a4f in cmd_freq_set utils/cpufreq-set.c:327
> 
> Running ASAN with the patch shows only an unrelated memory leak which
> was already reported in [1]. I can fix that in another patch if needed.
> 
> Issue 2:
> Minimal example without the patch:
> 
>      echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
>      echo 3000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
>      2000000
>      3000000
> 
>      ./cpupower -c 0,1 frequency-set --min 1GHz -g performance
>      Setting cpu: 0
>      Setting cpu: 1
> 
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
>      2000000
>      2000000
> 
> The maximum of CPU1 is set to the one of CPU0.
> 

The real issue here is not that the maximum of CPU1 is set to
the one of CPU0.

The real problem is that stale new_pol is used for all cpus
from do_one_cpu() slow path when more than one policy value
changes.

Please re-write this in your own words in a simplifies way
describing what lead to the problem.


> Minimal example with the patch:
> 
>      echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
>      echo 3000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
>      2000000
>      3000000
> 
>      ./cpupower -c 0,1 frequency-set --min 1GHz -g performance
>      Setting cpu: 0
>      Setting cpu: 1
> 
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
>      2000000
>      3000000
> 
> The maximum of CPU1 is no longer set to the maximum of CPU0.
> 
> [1] https://lore.kernel.org/all/20250827-power-memoryleak-v1-1-e4baf7b59a41@uniontech.com/

The above patch doesn't make sense. I need more information
to determine, if it is needed.

> ---
>   tools/power/cpupower/utils/cpufreq-set.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/cpufreq-set.c b/tools/power/cpupower/utils/cpufreq-set.c
> index 06cd4b280132..d9f6ca522fe5 100644
> --- a/tools/power/cpupower/utils/cpufreq-set.c
> +++ b/tools/power/cpupower/utils/cpufreq-set.c
> @@ -141,9 +141,10 @@ static unsigned long string_to_frequency(const char *str)
>   	}
>   }
>   
> -static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
> +static int do_new_policy(unsigned int cpu, const struct cpufreq_policy *new_pol)
>   {
>   	struct cpufreq_policy *cur_pol = cpufreq_get_policy(cpu);
> +	struct cpufreq_policy pol = *new_pol;

Don't assign new_pol to pol.


>   	int ret;
>   
>   	if (!cur_pol) {
> @@ -151,16 +152,16 @@ static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
>   		return -EINVAL;
>   	}
>   
> -	if (!new_pol->min)
> -		new_pol->min = cur_pol->min;
		pol->min = cur_pol->min;

Use new_pol in the if logic using pol as temp - changing
pol to temp_pol

> +	if (!pol.min)
> +		pol.min = cur_pol->min;
>   
> -	if (!new_pol->max)
> -		new_pol->max = cur_pol->max;
> +	if (!pol.max)
> +		pol.max = cur_pol->max;
>   
> -	if (!new_pol->governor)
> -		new_pol->governor = cur_pol->governor;
> +	if (!pol.governor)
> +		pol.governor = cur_pol->governor;
>   
> -	ret = cpufreq_set_policy(cpu, new_pol);
> +	ret = cpufreq_set_policy(cpu, &pol);
>   
>   	cpufreq_put_policy(cur_pol);
>   


thanks,
-- Shuah
