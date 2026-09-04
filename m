Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D246B3C3F69
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539215; cv=none; b=ShPukuK34VZuUSv/T3FW6GkWudzprpQha58LAAXx2ehZVqojmVXjppW5bS47WH6TZYrOmDAz5Aim9Cg76bjdk/wcFtzVgwiEwy5aXhoarcikMCZQoeuCJeEx84zs/8PmMIbR7MJNJEG/7llYrRqndnOdWDCMXM748kg/yqK8Ou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539215; c=relaxed/simple;
	bh=vXimrfvlJO1+npH1HVgTU7lHPCq/URewBHD4Sxg5WHA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AviKM6dcndUtHLD82xnuNSWIs69KKO9th2m4gHsOltv770dZp0QhLYwRtyEja7AjSUFFBhjmFHVvYW8sL13Kpb4Sbi0zd5Cw7vB3Mw6y5vXODJB+/o6nVjJL8MPq/ehDg5cUaf/6J7qRqIDmwkJhKZhqeGFQelwmqNv0pGCZLKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8geMn4j; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8geMn4j"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4df360cc9so1474532a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539213; x=1789144013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BauMjs1SRuPjbFG+n0MnSau2eIvhuX4gcrdx4dJMYEY=;
        b=k8geMn4jAQA6iCExRzStf5Kpa+k0fROR+Ada4Ifua2Zxll/s+qPhMdIseDIp8NoUwC
         rbHyKgEcwFpA5umSW1/lQMq5OL+c2+vaHbMOo5QiOmSlH6Eawm0VMoWXw+2utXJvFSBE
         S+Qzwxo9LE3fCb2baA/rcP3CDEFphBIAlw4s7/VWWxGpU51a1NiFDX+U8dEPOhI2tPpB
         4NxFnZCSvSNxHs9eLysvFqC8vfr8Rp8sQikvP9/bG3pLpzmlVyciYage04R8cAGcqi8k
         OQiTu9EsU52eU+/lJxjIWww65KO+r6dGu1TgYp6nm+hlT/tX5PZBBVpj2OySpazGuge/
         9zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539213; x=1789144013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BauMjs1SRuPjbFG+n0MnSau2eIvhuX4gcrdx4dJMYEY=;
        b=X/R8fShr7OJhYHFM83/2+tJ8b0v5rvj/qHFRCyzJ3BV3QIccWIFyt5o/XiDtd5HOFV
         Mn2hJ9P7O0KpXSA8cvg6Pd/8vPq5ROFwC/F19xf4KjHEt1L3TDQcnL244chFamQXBLSy
         KqZ4bN7mas+u2QK+TUEH5uSOgb5HdtHW3pcP70a4pO12xYJnPcqNdrWqRrMo8O2yaJsL
         ziBYmRioBPClvO019xCM1YZ8pRC+QpInLz6r194A5aq7ZGicvw023H9VePBUVVs+3V9x
         XNHx36G69ZJ4ZWMQT+sETgxZXSZY7P7s3lMev4YVCOfLAOUj/5mlKCNLySWhceMoH1h2
         a9GA==
X-Forwarded-Encrypted: i=1; AKwUvBzKgKBrZB6+15n+lq7G2ZxwDn+qGo56VoO2Mu2hrX1f5fQjQjqAs2WITyn+HPXoG7VQghpnqY25zGKa6dY=@vger.kernel.org
X-Gm-Message-State: AFuF++mZfpLVXZPbL1R+Gcmsv2c0b5wqDzef5Q66g9lHzkRC+qgZN5U+
	rfa9EoJBqvqbupUttByiAlulRjZW2gxTW4dN2l3hkP3YBBRMTU6EAAlV
X-Gm-Gg: AYBFou0o3j2Zwx/gcjoD4+Fo9i3tCjpIZgDOE8Ca/INrACHZ6wr+MgbYpJctHeBz8CG
	MrJBs3UwntN30v4GHRvDELMwM2sbzNuINh+plS6uxZNs+NRMf4Hi99E0iuKlLLohQmjbCPTBZwM
	XRB4fVSDCl/IgjPTKMlkO2jP9Z4usoQZR9gZhawroILBGMXBIg9kqNLSCm+3B6SK3jsefyqHI8l
	538My7/Qxdjt8JPbGU7JbDL5ageuItaguooI9K+wk32Y6FqsacYWErsx96S6ln4p8EcV86Z82xO
	wrYfLnkFjXeERQApc9KN88VlF6JpMiwzw2yTc5bo0zR+WNUx7ZU9XfU0O9yrDXHYzSxfoi2GJ/L
	WHjKzydJ9O60m9MbcR9Va2pF0HsEH+21zRVU/fR5dkTPCFjShmXU8l+8cSPdd+S4gPL5dv4WCYD
	OYwpYDr6YVPlsnSctrnUXXdT1dsuT0Riqw9SpNe0KjVebCyV5MFMNWSct6zQdmuQoJF0loD7KIc
	XldoI+cSakCYjM0JBllVukmvJ0+VccVEUPfjDXznQ7VCD2dGA==
X-Received: by 2002:a05:6830:a20a:10b0:7f4:3f10:7843 with SMTP id 46e09a7af769-7f89bc593b4mr4528909a34.10.1788539212476;
        Fri, 04 Sep 2026 09:26:52 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa888f614dsm1849437a34.15.2026.09.04.09.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:26:51 -0700 (PDT)
Message-ID: <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
Date: Fri, 4 Sep 2026 21:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dhruva G <goledhruva@gmail.com>
Subject: Re: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
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
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01-09-2026 16:44, Ulf Hansson wrote:
> A driver for a non-CPU device that is attached to a CPU PM domain (the
> genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
> able to power on the PM domain. More precisely, to power on a CPU PM domain
> one of its corresponding CPUs needs to be woken up if they are idle.
> 
> The current support for a non-CPU device is that its driver can only
> prevent an already powered on CPU PM domain from being powered off. This
> leads to problems for a driver while probing its device or when it needs to
> call pm_runtime_get_sync() to turn on the power for it. From the driver
> point of view it looks like it all works fine, but when accessing the
> device it may end up with various errors as the device may not be fully
> powered on.
> 
> To fix the behavior for these types of devices, let's adjust the behaviour
> in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
> when it's needed.
> 
> Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v2:
> 	- Rename a function according to Abel's suggestion.
> 
> ---
>  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6ac1ce18fda3..97273ed2f825 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -10,6 +10,7 @@
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> @@ -19,11 +20,14 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/sched.h>
> +#include <linux/smp.h>
>  #include <linux/suspend.h>
>  #include <linux/export.h>
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  
> +#include <trace/events/ipi.h>
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>  
> @@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
>  	.name		= "genpd_provider",
>  };
>  
> -#define GENPD_RETRY_MAX_MS	250		/* Approximate */
> +#define GENPD_RETRY_MAX_MS		250		/* Approximate */
> +#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
> +#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
>  
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
>  ({								\
> @@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	}
>  }
>  
> +static bool genpd_status_on(struct generic_pm_domain *genpd)
> +{
> +	bool is_on;
> +
> +	genpd_lock(genpd);
> +	is_on = genpd_status_on_unlocked(genpd);
> +	genpd_unlock(genpd);
> +
> +	return is_on;
> +}
> +
> +static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
> +{
> +	unsigned int cpu;
> +	bool is_on;
> +	int ret;
> +
> +	/* Find the first online CPU in the genpd's cpumask. */
> +	cpu = cpumask_first_and(genpd->cpus, cpu_online_mask);
> +	if (cpu >= nr_cpu_ids)
> +		return -EAGAIN;
> +
> +	genpd_unlock(genpd);
> +
> +	/* Send a IPI to wakeup the selected CPU. */
> +	smp_send_reschedule(cpu);
> +
> +	/* Poll to wait for it to complete the power on sequence. */
> +	ret = readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
> +				 GENPD_CPU_ON_POLL_PERIOD_US,
> +				 GENPD_CPU_ON_TIMEOUT_US);

How is sleeping here made safe for IRQ-safe consumers and child domains?

For a hypothetical example, consider an IRQ-safe SPI controller in an IRQ-safe child domain D,
whose parent P is a CPU domain. CPU A is outside P, and CPU B belongs to P. Both domains are initially off.

A runtime-resume request on CPU A follows this path in drivers/pmdomain/core.c:

genpd_runtime_resume(SPI device)
-> lock D
-> genpd_power_on(D)
-> lock parent P
-> genpd_power_on(P)
-> genpd_wakeup_cpu(P)

genpd_wakeup_cpu() drops P's lock and sends an IPI to CPU B, but D's spinlock remains held. readx_poll_timeout() 
can then reach usleep_range() while D’s spinlock is still held.

There is also a problem without the child domain: for an IRQ-safe device attached directly to P, __rpm_callback()
leaves interrupts disabled. Dropping P’s lock restores the already-disabled interrupt state, so readx_poll_timeout()
still cannot be used with a nonzero sleep interval and timeout.

I have not reproduced this on a board; this is a hypothetical configuration illustrating the paths.

Is there a restriction elsewhere that prevents either configuration? Otherwise, this wait cannot sleep,
and the parent lock needs to be reacquired with the same nesting depth used by genpd_power_on().



> +
> +	genpd_lock(genpd);
> +
> +	/* Re-check the status as we have released the lock in between. */
> +	if (ret || !genpd_status_on_unlocked(genpd))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
> +				 struct device *dev)
> +{
> +	if (!genpd_is_cpu_domain(genpd))
> +		return false;
> +
> +	/* This is not for CPU devices as those are managed differently. */
> +	if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >= 0)
> +		return false;
> +
> +	/*
> +	 * If the current CPU doesn't belong to the genpd's cpumask, we need to
> +	 * wake up one of those idle CPUs to power on the CPU domain correctly.
> +	 */
> +	return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
> +}
> +
>  /**
>   * genpd_power_on - Restore power to a given PM domain and its parents.
>   * @genpd: PM domain to power up.
> + * @dev: The device that needs the PM domain to power on.
>   * @depth: nesting count for lockdep.
>   *
>   * Restore power to @genpd and all of its parents so that it is possible to
>   * resume a device belonging to it.
>   */
> -static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
> +static int genpd_power_on(struct generic_pm_domain *genpd, struct device *dev,
> +			  unsigned int depth)
>  {
>  	struct gpd_link *link;
>  	int ret = 0;
> @@ -1043,6 +1109,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
>  	if (genpd_status_on_unlocked(genpd))
>  		return 0;
>  
> +	/* Special case for a device attached to a CPU domain. */
> +	if (genpd_need_alive_cpu(genpd, dev))
> +		return genpd_wakeup_cpu(genpd);
> +
>  	/* Reflect over the entered idle-states residency for debugfs. */
>  	genpd_reflect_residency(genpd);
>  
> @@ -1057,7 +1127,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
>  		genpd_sd_counter_inc(parent);
>  
>  		genpd_lock_nested(parent, depth + 1);
> -		ret = genpd_power_on(parent, depth + 1);
> +		ret = genpd_power_on(parent, dev, depth + 1);
>  		genpd_unlock(parent);
>  
>  		if (ret) {
> @@ -1307,7 +1377,7 @@ static int genpd_runtime_resume(struct device *dev)
>  
>  	genpd_lock(genpd);
>  	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
> -	ret = genpd_power_on(genpd, 0);
> +	ret = genpd_power_on(genpd, dev, 0);
>  	genpd_unlock(genpd);
>  
>  	if (ret)
> @@ -3411,7 +3481,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>  
>  	if (power_on) {
>  		genpd_lock(pd);
> -		ret = genpd_power_on(pd, 0);
> +		ret = genpd_power_on(pd, dev, 0);
>  		genpd_unlock(pd);
>  	}
>  

