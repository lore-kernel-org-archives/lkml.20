Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871816;
	b=GDssH5y/sBufpw+fWj+2AH7C4XjskIAIBc1t+I5lBKrM04EnzBfCFS4Ja3f9NcsuwQz8
	 wZfnAXBJIx4Pw6c2ov1Rhm2VPO7jcL1BcJIFZSilgykLgZW55dOXS/5eyQkVObLCQwMDL
	 GFaxmoaHtKu9wPGDH0FMXQX8vobd6uqRUud79Y3exR2V1s/mqI2NuLtR+mLqy4GKpRb/I
	 haggpGFfLNd06XXCPXYcMDlxYylu1GiZXawYjmIqc2sImumBoaiyWmIfmSucU/HZDUjBW
	 P5jjVAAQzulu3XK37Lk0jkAxbJbbGBAxoTquRtU5dJsgaYjlLiCgoxnB1UH91oQPMWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8Jvac7JX9KkPIGhfc6fkFsKH/kz8/M9SpUKhnHGt+uw=;
	b=On7FUu0YFbT2+4kyh6UFRXd6/ATDu4kjSnLZOPSqAw498ALDIyAEpuweOlBBBdFeB6Gy
	 bhp6Zrx2q1ZtMk6/mqZWhD9dwN+IZE5/S2lYyNtZNRCNP8ZsyM/cAKdIsyGxwFP2OO28Z
	 qrUJTORj4pRLZvE7iwgNSVLPOTY6DlzRtAsF+VzlAJCwFfj3+jdeXH3T7uYhU57WUi4Vh
	 xy+dnLmkJMZEoLhcxhbM929DnTXOfA/1AWSFZnNWUD4VY1QoLnAPm4gDQVaeO7A4FXG8Y
	 3pfqP6OMdR9Y14uyRMhmmLM/qkDqbKwMnV6D9i4tVbz2WUGMWug8uzNgGepLHZtrhLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OBqfboG8;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE0606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DE0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OBqfboG8
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-49429181ce9so3080080fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794871814; x=1795476614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jvac7JX9KkPIGhfc6fkFsKH/kz8/M9SpUKhnHGt+uw=;
        b=OBqfboG8yfgrjuTaEKrp2coI9OBrM/b6NybUkYZSEaanNfbvkjungjo6R+ITq7MkWq
         POiKAO+st9W9FJs++7oRlJuiU8VQBoh3JG5Qd/qiHP492Us+8Nzm5Nh/wy6GTQFcUMAJ
         s8rJoQuTHyoBxxue3mjfxIbQ4AXN49lnfNTlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871814; x=1795476614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jvac7JX9KkPIGhfc6fkFsKH/kz8/M9SpUKhnHGt+uw=;
        b=cWJcifh/EWEF8ip7gHh1oUIK3Xnj827MqdXmkE9oGTuuciyvcJNYp8kqGMJuq5E5IT
         UyBC888jJRWlWfsVY2SSAJxZ6o1vIRKbuytsb3M0VTj4eoSpZCTSfvyMCz3uDRcx0v8f
         09r6JFqzcSM4kAB532z6tZyvnwcuyC4bDtp+mMhovYSH5+GZOXwAxtuPrB1/nNSzdV/h
         G35ssb5xAhAgZ+MUewGPwrl+GwFBNFitcndL8OtirDBWuvHyz4WO+eAR9Rog93FlzOB0
         Pks3DWZmRK8Wig4tdxHd80Bxss5fpBkkX99HwvlrBvuzUF9b5/dh0PMBQbvosNwTKBXZ
         WmsQ==
X-Forwarded-Encrypted: i=1; AL+hErEoQsGjsyWbNVoV7Vc9D8tNAFQqfxqFz5I32LERPJqiXT+qL0yZQ6NL26Ya7mP4ANWCFaLLqZKQuddFFRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ByEVnSWBvuZDkQ7M5h64sFeBw+xLOXzcPA9IoFYN9PNyI5/fK
	9lj6SuFIt5IVhQf8sYDiS+EYEfxK7kPwye9P+cofioK16cz8/nm+1KsWAgs8AKEXOO8=
X-Gm-Gg: AYBFou1iApoOevFuInYtDvHF9JS9eU9sECF3k4e+7RLfnquAo7Zmrw9/iGL+dQ7YoZu
	mT1Dmvk/PpjFGCu/bBbsyL6TWDzvLRKXM8JHJwqg5hrPbHAHIr5yDkxxRs4AEyqVr7EIanBQgYD
	qR0d1L1dghJ7I31yi1x6Um7tuJKNQmOLXNj2GOjQkqJ29H2YoZw4TBCZxqQDCYi2EseWczlINuf
	aIrPjM9H4TxjCYG7COBOo9fEjgofg5UZLy0616G8/d581MnwKfPWnN7/a3eeItY0Iy0yhIu9f3h
	+naEOsnKHfF44Rk4YoqsNz4AoxK5Sca8s0UEEmke23TzoGmYDELI7cvK55j1dfKnTXgkX+rl/pr
	O17XTXK9YAu41UBZhBsA2s8TjOaXitWILd41fZFjznQJMn9z/AEe4r1WyDp4wKWmX41VL3N+lCR
	pK/RqpZjiyli6WR/EkA2v/F9yxNhmh9PYdfvVqa5Zefz3fgMAzjTOP4GBDdk0hrMnj2Gw91FBXa
	tlITV+sEz//Q2352MGJjBZdta3COiI0LyOF8MrNkdCu1kUpWaE6Fkfw7+oDUNeUuHc75vWW808u
	3bgduBPl9kc26yu/Ar+b47Nikgj03aV25P96Yg==
X-Received: by 2002:a05:6870:c08:b0:4a6:f705:25a with SMTP id 586e51a60fabf-4afdf497cfcmr9471729fac.21.1794871814468;
        Mon, 16 Nov 2026 15:30:14 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2288f59sm7859996fac.9.2026.11.16.15.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:30:13 -0800 (PST)
Message-ID: <94e8f3c9-5162-4717-8063-f5c2b4828456@linuxfoundation.org>
Date: Mon, 16 Nov 2026 16:30:10 -0700
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
Subject: Re: [PATCH v2] cpupower: fix use-after-free and stale limits in
 frequency-set
To: Lukas Beckmann <lbckmnn@mailbox.org>, Thomas Renninger <trenn@suse.com>,
 Shuah Khan <shuah@kernel.org>, "John B. Wyatt IV" <jwyatt@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261115-cpupower-freq-set-use-after-free-v2-1-6b91f1630165@mailbox.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261115-cpupower-freq-set-use-after-free-v2-1-6b91f1630165@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 03:03, Lukas Beckmann wrote:
> do_new_policy() directly fills the unset fields of new_pol from the
> current CPU's policy. This is problematic because do_new_policy() is
> called with the same new_pol for multiple CPUs by do_one_cpu() in the
> slow path. This results in stale values in new_pol being applied
> (starting from the second CPU that should be changed), and even a
> use-after-free (for the governor string).
> 
> Fix this by building the target policy from new_pol and the current
> policy in do_new_policy() instead of filling the missing values into
> new_pol.
> 
> Fixes: 7fe2f6399a84 ("cpupowerutils - cpufrequtils extended with quite some features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
> ---
> Testing and minimal reproducer:
> 
> Running the command
> 
>      ./cpupower frequency-set --max 2500MHz --min 2500MHz
> 
> with ASAN reports the use-after-free before, but not after the patch.
> 
> Run the following commands:
> 
>      # set CPU 0 to a different maximum than CPU 1
>      echo 2000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
>      echo 3000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
> 
>      # Change min and governor (but not max) of CPU 0 and 1
>      ./cpupower -c 0,1 frequency-set --min 1GHz -g performance
> 
>      # See if max got changed
>      cat /sys/devices/system/cpu/cpu[0,1]/cpufreq/scaling_max_freq
> 
> This shows that the stale maximum of CPU0 is used for CPU1 before the
> patch, but not after the patch.
> ---
> Changes in v2:
> - use a shorter changelog and testing section
> - build temp_pol from new_pol and cur_pol instead of copying new_pol
> - Link to v1: https://patch.msgid.link/20261112-cpupower-freq-set-use-after-free-v1-1-4e0034927b3f@mailbox.org
> ---
>   tools/power/cpupower/utils/cpufreq-set.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/cpufreq-set.c b/tools/power/cpupower/utils/cpufreq-set.c
> index 06cd4b280132..674e3aabd31d 100644
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
> +	struct cpufreq_policy temp_pol;
>   	int ret;
>   
>   	if (!cur_pol) {
> @@ -151,16 +152,22 @@ static int do_new_policy(unsigned int cpu, struct cpufreq_policy *new_pol)
>   		return -EINVAL;
>   	}
>   
> -	if (!new_pol->min)
> -		new_pol->min = cur_pol->min;

Why can't you leave this logic as is and set temp_pol fieds,
  if (!new_pol->min)
	temp_pol = cur_pol->min;
  else
	temp_pol.min = new_pol->min;
> +	if (new_pol->min)
> +		temp_pol.min = new_pol->min;
> +	else
> +		temp_pol.min = cur_pol->min;
>   
> -	if (!new_pol->max)
> -		new_pol->max = cur_pol->max;
> +	if (new_pol->max)
> +		temp_pol.max = new_pol->max;
> +	else
> +		temp_pol.max = cur_pol->max;
>   
> -	if (!new_pol->governor)
> -		new_pol->governor = cur_pol->governor;
> +	if (new_pol->governor)
> +		temp_pol.governor = new_pol->governor;
> +	else
> +		temp_pol.governor = cur_pol->governor;

Same for all of the above. Make just the minimum changes
to fix the problem instead of changing the logic


>   
> -	ret = cpufreq_set_policy(cpu, new_pol);
> +	ret = cpufreq_set_policy(cpu, &temp_pol);
>   
>   	cpufreq_put_policy(cur_pol);
>   
> 
thanks,
-- Shuah
