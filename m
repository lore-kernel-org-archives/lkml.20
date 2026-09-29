Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4FF3AC0D5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690682; cv=none; b=acIHkXxJI8qJUJB8iUJTKTjtPuvBI7Pt3jTbxJRW8TL/e7X19iiiorO7GxqZoGgO1J0LIg/ziaJvuwjbqTeiv1S1OPmsq3MLvR46C5/v2BGTfixeJnalG8mpF/thnulsZP1kaxIvJWTlcOcY4jDz8Cf6pgqQO/LvxalKgIZFZng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690682; c=relaxed/simple;
	bh=RAtVjGI/Vb8hQhwjC88DUK3cpVwBXtc6/x2dZWEwF0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWmaxXB2RJ6gNhXB2/9B5q1EeDjWPCTQBBBC5q/w6oob0uO9cCWZXvIsbkQ2j3EjYCl1TIjhM2wuKAyL/4G7+F/GaSjDKVYwj59PzjUWzLtfAFthY+lAoEdpXdMaE6/6xz94pjiYDq6LY4P4pXtiSr0KsiOq5LJcT9bv/psQkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YPfrQsz3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YPfrQsz3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5EDE1476;
	Tue, 29 Sep 2026 07:04:36 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5873F86F;
	Tue, 29 Sep 2026 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790690680; bh=RAtVjGI/Vb8hQhwjC88DUK3cpVwBXtc6/x2dZWEwF0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPfrQsz3Mdo9IfN+12z6J07vTX7zV21SP9VGoYGyQLz9IZnF7blGrLx0RbJpQeLrn
	 U/zHioaI9LSacoxSgCMfMqY3aBzFq+POqHE8rZz2hbD9qDLtg5JjDdhABVCkzNlAyn
	 +AbFsF1QF5CySeHJBa3gkA1OleN+S08nzeS2gQg0=
Date: Tue, 29 Sep 2026 16:04:31 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, catalin.marinas@arm.com,
	will@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] cpufreq: Use hardware feedback for cpuinfo_avg_freq
Message-ID: <arvFb8kJoWT98Suj@arm.com>
References: <20260916142623.359336-1-zhouchuyi@bytedance.com>
 <20260916142623.359336-3-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916142623.359336-3-zhouchuyi@bytedance.com>

Hello Chuyi,

On Wed, Sep 16, 2026 at 10:26:22PM +0800, Chuyi Zhou wrote:
> cpuinfo_avg_freq is documented as a frequency derived from hardware
> feedback, but it uses arch_freq_get_on_cpu(), which supplies a fallback
> on x86 when the cached sample is unavailable. Userspace cannot distinguish
> that value from a measurement. With amd-pstate-epp, for example, the
> fallback is policy->min even under the performance policy. A fallback
> based on the requested frequency also does not establish the frequency
> at which the hardware actually ran.
> 
> Use arch_freq_get_avg() for cpuinfo_avg_freq reads and support detection.
> On x86, unavailable samples then return -EAGAIN instead of a fallback
> frequency, and the attribute is omitted when APERF/MPERF is unsupported.
> 
> Provide a weak default returning -EOPNOTSUPP and reuse the existing ARM64
> AMU implementation. Preserve the behavior of ARM64, scaling_cur_freq
> and /proc/cpuinfo.
> 
> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
> ---
>  Documentation/admin-guide/pm/cpufreq.rst | 11 +++++++++--
>  arch/arm64/kernel/topology.c             |  7 ++++++-
>  drivers/cpufreq/cpufreq.c                | 19 +++++++++++++++++--
>  3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index 34baf20cc202..3057829b01bd 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -255,12 +255,19 @@ are the following:
>  
>          This is expected to be based on the frequency the hardware actually runs
>          at and, as such, might require specialised hardware support (such as AMU
> -        extension on ARM). If one cannot be determined, this attribute should
> -        not be present.
> +        extension on ARM or APERF/MPERF on x86). This attribute is not present
> +        when hardware feedback is unsupported.
>  
>          Note that failed attempt to retrieve current frequency for a given
>          CPU(s) will result in an appropriate error, i.e.: EAGAIN for CPU that
>          remains idle (raised on ARM).
> +        The attribute remains present during temporary sampling gaps.
That's bit ambigous - what are 'temporary sampling gaps' ?
Sampling did not take place, samples were outdated or somewhat invalid ?
Also, isn't that implied by the sentence above.
> +
> +        On x86, reads use cached APERF/MPERF samples without waking the target
Is there a case when the target is woken up for this particular attribute
readings ?
> +        CPU to collect new samples. An expired sample or a zero MPERF delta
> +        results in ``EAGAIN`` instead of a fallback to a policy or reference
> +        frequency. A CPU that has just entered idle can still have a usable
> +        sample, while a busy CPU excluded from periodic sampling can lack one.
>  
>  ``cpuinfo_max_freq``
>  	Maximum possible operating frequency the CPUs belonging to this policy
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..939d3e4ce5d2 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -181,7 +181,7 @@ void arch_cpu_idle_enter(void)
>  
>  #define AMU_SAMPLE_EXP_MS	20
>  
> -int arch_freq_get_on_cpu(int cpu)
> +int arch_freq_get_avg(int cpu)
>  {
>  	struct amu_cntr_sample *amu_sample;
>  	unsigned int start_cpu = cpu;
> @@ -250,6 +250,11 @@ int arch_freq_get_on_cpu(int cpu)
>  	return freq;
>  }
>  
> +int arch_freq_get_on_cpu(int cpu)
> +{
> +	return arch_freq_get_avg(cpu);
> +}
> +
I do not think this is needed.

---
BR
Beata
>  static void amu_fie_setup(const struct cpumask *cpus)
>  {
>  	int cpu;
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d0df986fa3d..21bec6b7f538 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -705,9 +705,24 @@ __weak int arch_freq_get_on_cpu(int cpu)
>  	return -EOPNOTSUPP;
>  }
>  
> +/**
> + * arch_freq_get_avg() - Get an average frequency from hardware feedback
> + * @cpu: CPU to read.
> + *
> + * Provide cpuinfo_avg_freq with an average operating frequency derived
> + * from recent hardware feedback for @cpu or its frequency domain.
> + *
> + * Return: Frequency in kHz, -EOPNOTSUPP if feedback is unsupported for the
> + * CPU or policy under the current configuration.
> + */
> +__weak int arch_freq_get_avg(int cpu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
>  {
> -	return arch_freq_get_on_cpu(policy->cpu) != -EOPNOTSUPP;
> +	return arch_freq_get_avg(policy->cpu) != -EOPNOTSUPP;
>  }
>  
>  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> @@ -769,7 +784,7 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_policy *policy,
>  static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
>  				     char *buf)
>  {
> -	int avg_freq = arch_freq_get_on_cpu(policy->cpu);
> +	int avg_freq = arch_freq_get_avg(policy->cpu);
>  
>  	if (avg_freq > 0)
>  		return sysfs_emit(buf, "%u\n", avg_freq);
> -- 
> 2.20.1
