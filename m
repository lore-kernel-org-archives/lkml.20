Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE43A5E9F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459117; cv=pass; b=lFX0l3PQM/Jdckxv3Cvin/248PNa05Go0bcuJuzLMyXpdZ7uin+FBr7gmlfiF2S/oqQY/6VhQlS2WRb91taY/tmaSgu51gPcCWZFInMm6mjRiWdurSV/3QbNWIKoD5WSLy3I4eWwxphAc/4b0j1FAISKgufY8YvCyaZrt1lJs7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459117; c=relaxed/simple;
	bh=m+QNxznO+HXTgUeCgcEy5d2xUE+4TuNok1338BQwzsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAZcxuH6naIXAFPsuOeUVtnEGejEtGaUkdqhKS27v/YmhgHj2AjHcDo95USX6bknu8dL7fgihkYbzxRNt5sLp/F8bYodvXA3Nolimc193jctTLE68suoqS/i0ckXnUuEw0pR8lBG3f7xXvsxTK8eE87kmKy/UwRgEGquZkfMGPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxsOPk2G; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxsOPk2G"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso477238766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789459113; cv=none;
        d=google.com; s=arc-20260327;
        b=Tyuv3Ai9gDYA39lcAm0Y7S9BipTAAgatV1U4r7TOVT+8zOZb41mqMLKs2O4MBlgiuF
         T/uEafGCOPQL/aAQkbIrQcZfvm/YsdnvDIqC8yrxUSgZ1oWjyIDfaJFB/AUqGcvevanE
         aCsfqNSFRVz6nIoqv1Q/7daMgHBDv6kidqfu3YZc7heLnImF9rG+8J76jlWhiRU8l2JK
         lddeSHcWtIutpHJK4FV+XW+vQeW9vdXK2gsDJAHoQk1S02kC55p3kNBCOxMa85OQB5Ym
         Z9vfuLy6hcZ04LZpmQjYnHer+GBYqGv4YrFEYmHxWOv7hrJyVHkpxNH+x72yOwtdyCUx
         k5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        fh=yQJRz1vYsr0r0i203nWVpMu6dLVH3Y5sjIzmcup4yCw=;
        b=nuuOA6FM18ipLTnvvG0aj3/dfBJhUjLt4zWPadiTb9YXkwVTs9vJevDJW+S6AQj5XM
         kWo3waEdv8ivx+scsJ2i+rnQFc8chfJ72p7YoOYhvlnpza3iySt94rDJ6fLZDY+upAfS
         dIR1Hjap+K8PgsnVPp7JWo4u1TiGvI5Eaokz9YMrM+UlFazi2HI+trGWu1jp0rq9H9Ej
         VAXL6iBEJ9b8ZYN1mYpWoKo7bWf7Cj879ZlFHNoRdqICE6M9RdN0NUQdnuPS1yRGxeb9
         Man71bXtj6UIzAN4IEPCHxNVe9toADAwtPYXJYhyCAoq44dQhvmHZXTBEJtnjwbJMsGZ
         e3bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459113; x=1790063913; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        b=nxsOPk2GuHLsEJlZsxgDqSsCD50PnA73+U24IYITHXVBZvuRcyj8HXFKw2czJUGXIn
         BHYxof82dUaNDILbiugCPulm+KapgrrvJkMrEi38nnZaFXak9gHx756+owMg1xwo+KJo
         tuGXt+P0gII+aMywBevvzOeBEqZcxnGRXNObMP/ee9wlsY24hWMVB26S8qpytDac9LXp
         8+ISv2P0jQENdZjFMPJaQDXE+fBbX55fVliPhqrIqPOovzj93eFhcaT2vBFcmQEdIMla
         AajUTB8vvgLRTPQq3oVZYlwlSAIINcWsCekNW82gyht+TU4lfYEsh1P6e/l8xnhODYh4
         rjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459113; x=1790063913;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        b=I4XX4inZbm4z82aOq6R3xQZ4V6e0k30K2HMAUhdXG81Ve0Mjoq27TLLn7rsqVX8875
         kiNYjuQiWZ7hczkRVqfa39Hx4GyQlQx4nNmbfuk+3tH2aE6AeLK7Khr3A0xzlhiB53m2
         oD8t/tr1cldVJvnnHs4ffB+R4AEFxeFHuE4kqRwQGR2i5WI2Z5aS19goJUqti+sL4pu1
         7L0MV3yy9bS0KZ4/QhSMDn+pga3Y6JHI309vLCerC7QSl8/uzmT67VZwuMIiNjiVWFnh
         H3r6rVYgGIxTB2PEREt2QkTeaoLS0u/K43NuRTrJZClIfYb/Hp9GDO23zug8gxH4zc+v
         7odw==
X-Forwarded-Encrypted: i=1; AKwUvBy3smCDBcjWHvLmFwSDTCROtdoOcsLZ5eirPHXIbxQX2jBJ3RnOLAfbTBR9Z17DESpaJa6X/02PHtHU9TQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nuvBRGLxhi9rsjlLJEhGsqMq2vZEreXSrrkDt6zbFCF4ZgxU2N
	PQyk7DJHpCkbozdFjXeRGu5NyHTf2QC6uUkLKgw4BF0613f8msvus6BRk68z1ga5e0dZoyqAO6e
	qz6VPswl3x5YwBLdbAoizw9urDd4EuJhZrdH6u0M2yQ==
X-Gm-Gg: AYBFou2u9RN2PZNPR0h3Zxc2n0GrhIO5SMjRbAxjnWM5Ugm0dwmv7u66V8vpffVjGiE
	wbmdH3nz5xmkdg6DlCHG8JEIS9JcQk01qbW2/NTENL+a+ga+Dw+0Laivd7ILKTv2eFcuhvrhkSI
	CAwn9ulba5mnCJdq32MrPu+inlQRZRw2g+kOH/nIEOJnuE21YRNYYhSpGcAvf7HPSOqiWesNX0o
	l5bx4c5kUDj7nDrkiu8HpiwlvQ3rE9qrixkK9IXOEnoas9tEPgHnH+dVeF17wotIq31RgODLquY
	ULFCpUefqdSZExancrgCdE/MGQ/WPdVkLWY4Wqm1r+9k4XHg7w/zBDnbRo6wy3G6LeDNLPW7o7v
	W/2X5RvFQ5Wg=
X-Received: by 2002:a17:907:1ca7:b0:c24:87e3:b8b8 with SMTP id
 a640c23a62f3a-c29b85faa3bmr386122266b.17.1789459113184; Tue, 15 Sep 2026
 00:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Sep 2026 09:58:21 +0200
X-Gm-Features: AcwNN1URr28u1JIvo7rjZT7TO6K2gihzqmBU2b4Y5-nAgC1kqqegrh2tO_zRhII
Message-ID: <CAKfTPtCR8SnQwpxzE-=WXenhTU=Hv5hrf7Vz22tMipX7uP_xxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 10:31, Ananthu C V <ananthu.cv@oss.qualcomm.com> wrote:
>
> capacity_freq_ref, the per-CPU frequency-invariance reference used by
> schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> If boost frequencies are filtered out of the frequency table because
> boost isn't yet enabled at boot, max_freq only reflects the non-boost
> ceiling, so capacity_freq_ref never learns about boost frequencies for
> the policy's lifetime. Enabling boost later raises policy->max, but
> capacity_freq_ref stays stale, leaving schedutil unable to scale
> utilization or target a frequency above the non-boost maximum.
>
> Track the highest frequency in the table regardless of boost state
> (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_freq,
> max_table_freq), so the invariance reference is boost-aware from boot
> regardless of whether boost is currently enabled. Runtime enforcement,
> still handled by policy->max, is unaffected.
>
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/base/arch_topology.c | 3 ++-
>  drivers/cpufreq/freq_table.c | 6 ++++++
>  include/linux/cpufreq.h      | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..da94f77441da 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>
>         for_each_cpu(cpu, policy->related_cpus) {
> -               per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
> +               per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
> +                                                     policy->cpuinfo.max_table_freq);

I will let cpufreq maintainer comment about the need for a
policy->cpuinfo.max_table_freq field or not but otherwise you can use
something similar to [1] to find your max table freq:
[1] https://lore.kernel.org/all/CAKfTPtBji8dkr5ixhtZjkyrWLA68TF-KHLrNYWoewPWLyuUd4A@mail.gmail.com/

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index da94f77441da..92966be712d5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -405,7 +405,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,

        for_each_cpu(cpu, policy->related_cpus) {
                per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
-
policy->cpuinfo.max_table_freq);
+
cpufreq_frequency_table_max(policy));
                freq_inv_set_max_ratio(cpu,
                                       per_cpu(capacity_freq_ref, cpu)
* HZ_PER_KHZ);
        }
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 419c71ccff7c..e40f915b7119 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1109,6 +1109,17 @@ static inline int
cpufreq_frequency_table_target(struct cpufreq_policy *policy,
        return idx;
 }

+static inline unsigned int cpufreq_frequency_table_max(struct
cpufreq_policy *policy)
+{
+       int idx;
+
+       if (!policy->freq_table)
+               return policy->cpuinfo.max_freq;
+
+       idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0,
UINT_MAX, CPUFREQ_RELATION_H);
+       return policy->freq_table[idx].frequency;
+}
+
 static inline int cpufreq_table_count_valid_entries(const struct
cpufreq_policy *policy)
 {
        struct cpufreq_frequency_table *pos;

>                 freq_inv_set_max_ratio(cpu,
>                                        per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
>         }
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea994647abc8..4984142dc08a 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -33,11 +33,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>         struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>         unsigned int min_freq = ~0;
>         unsigned int max_freq = 0;
> +       unsigned int max_table_freq = 0;
>         unsigned int freq, i;
>
>         cpufreq_for_each_valid_entry_idx(pos, table, i) {
>                 freq = pos->frequency;
>
> +               if (freq > max_table_freq)
> +                       max_table_freq = freq;
> +
>                 if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>                     && (pos->flags & CPUFREQ_BOOST_FREQ))
>                         continue;
> @@ -57,6 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>         if (policy->cpuinfo.max_freq < max_freq)
>                 policy->cpuinfo.max_freq = max_freq;
>
> +       policy->cpuinfo.max_table_freq = max_table_freq;
> +
>         if (min_freq == ~0)
>                 return -EINVAL;
>         else
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 35ce665edfd8..3f3b1380251a 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
>  struct cpufreq_cpuinfo {
>         unsigned int            max_freq;
>         unsigned int            min_freq;
> +       unsigned int            max_table_freq; /* Highest valid frequency in the table */
>
>         /* in 10^(-9) s = nanoseconds */
>         unsigned int            transition_latency;
>
> --
> 2.43.0
>
