Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663451A729
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577561; cv=none; b=k1E9bhadil01eK5pB73jCtOlXOhgaz9jIB4k/8k60nvZcfHi1S2A/TAIOE+va+azPa8yAqlCqK2+F3mITuFMbImAqLs9am/2poLuYDyTMwW+BbF/3zETdo9HiGNtcZNWx4Whw20dPNPukzPYQCJSgXkaLq9xnV/PUrL3259Tpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577561; c=relaxed/simple;
	bh=3hb2s1nE8GbWF4nFX41LjIjY6GWkRYkXDkCPa4Nu+74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9gVHyolSg+o3a0GD0hwfHfIWrQBnwXFXM+xW8TkwS2woLBE1hLR4ectLOsmVGW2MEUuL0epeWChvLzpeszt22EvXpL1rrhUJcJDA5iP4Hwyelz1YhtCUqXAu18gqLtx9x+XkjxwqIrjBXNQLiHjwDyinErkfiY7VGobe6mdfAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgNvJxP1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgNvJxP1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so13054615ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577550; x=1790182350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=AgNvJxP1DMnYNwLESwxLzqy4FJq6Ru0Y+xKhQl4JZTnJ/oEz3AzyUkNtjQZDk75+lL
         NbTXNnUUCJCWMYlYMrLpq5bwqwh6oQQHF7rfrqYw8/5ttFFRYwaJiGWGxJvSPnp/eKNv
         L8M1dSHegANyE7VSneb3fqA7UUKsAP5Y6h69JS+y1rhxR+VHbZlaOqR8HOguTY9xYjJ1
         I8HZKcNKd+nzU7ElY80D6ehaRCjRJYcR7X6iB14S+9So0KyI0zyaEzspsqNLTijuG0e+
         /QF8wtGdsbs1uWTRcT7w073idLupnKJ4cT7dlAYyehm9Bl16qRpZohfnrqfiThkslabm
         9X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577550; x=1790182350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=2IiSamO8X7rtIiVY80JYI2HGTfLD/JfK7vGCIjyDjIrDOQ5uUp7U7ocVPQO6nCUbIi
         4HIZA8wgwrOpOIQ4UBKqQ8Fn1jqEWZvoDU7rMjVG7I3Tb7HgtX982+pKc2bfFZ93qiU+
         sHx50u2l7nX+PxjAEWMgAZ64CrEUvMW/IIOxhBJztSyM/3ywLxM/7fbHp1w3w2mnzfrk
         6HnQL0Yq8+Jq/DCTS4rLgRkxnJxYiwE0Z9UJS/uJRx2E1YNd5PObNuwiG6GTUpjlwPd2
         pyJ0b1j7OdKAtfBl1EBDnIzpQU6sUE0lmDK17BxBKuok1JVNoYoj5SA9Bram5Y37zu6B
         Wh6g==
X-Forwarded-Encrypted: i=1; AKwUvByLn4lpRLe7MLD0mxjJlKxbfg6R42Y0WJ+g4Ef0wKPyt5SbdAgKvNfpk3AlBgLzCnGAgnXUXDpcik57Hno=@vger.kernel.org
X-Gm-Message-State: AFuF++mO0KmffKHTaJA/bK1CdvwIINGu9K9ZwB6BOaGtaWNvaVXzrJIe
	KXOwbFiNEu6F7zGZi1txpCgawkEGRwS8MVSyLjTUA1viHj1TPZiFD0mJ
X-Gm-Gg: AYBFou1PwLumYW67OfHXCsMvCqnWgzEjcKRF1vPF+e2yyxZdm5FGmbVQp5/7GwvZ3fQ
	+b9jI1M5haaFr4+33k5iaI2Yqy6dIDZF6PSJRhHa7mW6Cqv8yaElNRMGOk7tmjDQdto3NLgVXf5
	3tUJJDXuWiLDtMQ7YYwjonXCiG58OVU9tltRsLainTutdsQYYKazwZgeari8xKdikdbCYuzQwc/
	FrLd/BitDFlktx3EBPshS/5P4rbvgMV3wAv5lga77/66K7pA2l06DNFTbO2id/Dd0/q+8xiQSAq
	/mvwW4pfKPjyw4nh6dl9WaogGwj875A10fSYbVIotmJIJMqwrXEJXXcUHnmxV6i/mclZo2ju4mN
	YIYW8XID2F1+2tCSbLHbAEO71QlZoWOXD3xHyduEqaFiGFgssbwlknpUVImIbar/KXrVelakdB0
	WNYftNuWEiZd258n3caNFBV5fkaJotBMruqmzGV58EE3epZxJPFvvBOQHizloiz2QVF5IGRMeJf
	izBU0HR3akUng9PlnT572u5wOerB4ZTJWw71BWiYea5p5jw2g==
X-Received: by 2002:a17:902:c40d:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd8e6368a5mr67941175ad.18.1789577549942;
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd90c7b215sm12866435ad.72.2026.09.16.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Message-ID: <ce80af4b-5d4d-4fdd-a4ca-3c361c542eeb@gmail.com>
Date: Wed, 16 Sep 2026 22:22:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14-09-2026 20:31, Ulf Hansson wrote:
> At the point when the PM domain and the topology are registered through the
> genpd subsystem, it's not really known whether corresponding CPUs are
> online and thus if the PM domain should be initialized as powered on or
> not. Instead this information becomes available when the CPU devices gets
> attached to their respective PM domain through dt_idle_attach_cpu().
> 
> This is a problem when using PSCI OS-initiated mode, as we may end up with
> a PM domain that has the genpd's status indicating it to be powered on,
> while it in fact may not be the case. In the less severe scenario, this
> leads to selecting a shallower domain idle state for the PM domain than
> necessary. A more critical problem is when a non-CPU device shares the PM
> domain, leading to their corresponding drivers not being able to trust the
> status of it.
> 
> Let's fix these problems by initializing the state for the genpd's to be
> powered off and in the deepest possible domain idle state, when using
> OS-initiated mode. The support for ->sync_state() is maintained by setting
> the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v4:
> 	- Drop GENPD_FLAG_RPM_ALWAYS_ON.

Thanks, Looks good.
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Fix a bug in the call to pm_genpd_init().
> 
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3..5722365b943e 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -68,9 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	 */
>  	if (use_osi) {
>  		pd->power_off = psci_pd_power_off;
> -		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> -		if (IS_ENABLED(CONFIG_PREEMPT_RT))
> -			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
> +		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
> +		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
>  	} else {
>  		pd->flags |= GENPD_FLAG_ALWAYS_ON;
>  	}
> @@ -78,7 +77,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	/* Use governor for CPU PM domains if it has some states to manage. */
>  	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
>  
> -	ret = pm_genpd_init(pd, pd_gov, false);
> +	ret = pm_genpd_init(pd, pd_gov, use_osi);
>  	if (ret)
>  		goto free_pd_prov;
>  

