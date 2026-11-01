Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576889;
	b=rLVi9SbUnUt94dDjIFQiRYZW2w4EyRWgkMdKLA32sVvIbPxDWp8c5fHErD1MICAsawnn
	 WZ6POk+SKd26tN7KuVmUp6fF5iZcx+uLWRxNinViyzj43P6lBM65qvOiJl7lz4Wh2RqFc
	 ZJwpKWMGTDFY6XmgzG6+8C1+AGgQf5ZoHD8xo7Yj1fbuH5mb6BoAnSEHh8kPcCEbfPUnY
	 FU0WWZ1zo7cQLS88GQtANYYjtQtV/cvrOacxtNpO6wL6Cr9F6tG/cLUuZWKzb++JbmJjo
	 VGoXwSkUcqyLLZElF0iXiFjo3lelUdieGeBGhwBq8+NkOkNoUvyF6PSh812lI47o5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V1PNsriSOXNXk9F4i3pS/7KJmz2B+6Azrj9cQd9O7UM=;
	b=nDu2mU9uwUU+x7L+xTeu9O/R+jCXGUt0u17SR4GzY7MZXoZMxOvqyi+aPCb4HEvKFyoX
	 L7hM27DZe6WmCkipxiigKHJLfajFvEhrIlcjgCHgejDUGG4uS29ZLvzjd5iumsmv7f4Vo
	 Y2o34VxJCK8ld8vWlJoF2pFz2wjsZYEzNITuoBQK0pXKCfSzGsR8oL2AW5Phx6fVFnxPx
	 Hgave2oUS2b7BMXtceD0F+aRt6QsLZEx3+nKvDQTlo2Wlpfe8fA+rnPCupp9NZCRUgB+z
	 s2BLKT9qZoxxIHhs8+7bM7yVKrZnpvbuTTVGWs3Mk0xdKSsocCWlziYtRQZRg3x+xsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acxkjQ3o;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acxkjQ3o
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so26012085e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793576887; x=1794181687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1PNsriSOXNXk9F4i3pS/7KJmz2B+6Azrj9cQd9O7UM=;
        b=acxkjQ3oMg6V0fHID+GEQE22KSpnzDq6lGlXzvoo1Ip1YJY5ZRScWheQuoRu+wHryQ
         9QtJXkKYYP/ijrouQZBRIz+Oz9Wa/hqzuSJCv3pB1wuz4cbICKCtzjmrUH2+oVRwZOI7
         VMpZvtDkC8RLHVh7bQ4cfKIHjsV5abw+Jn86gnvH4Q+ejyjdrjXVDs5L8f4LaMyk73Ph
         /Q7BkgJ1YGGVLUVR9MIQR6SceKM5iYNjdlcI57Lpm6VBIZqMT8ybrWnb6TzakPlYbjOp
         xM+bz0icHH1KmDdYuNkNmFNay+JdSEQmIlVWv12hBToInwS4mgC5Uurv4IRE/Wx4NveX
         m/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576887; x=1794181687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V1PNsriSOXNXk9F4i3pS/7KJmz2B+6Azrj9cQd9O7UM=;
        b=nLfDklN/HZeK20ygXmqq9rdsTLn2fQqNjamNzlyWc51JW+ojgpCYnkvhyEokdH7CPE
         J+MZ/K1lHqp1AV33bXvw/xjM0TKTIhlMlCwBvgGgWFMqaO7wX8dye06FtCBhO/F5x3p5
         m4sMAY82sPtAH7cYkzp+V+nhrpw28plBHZhOL7A43S8RVpkqpr+ZxqmgGPp/4K/mjiCs
         qfN1Ri6t3SzmavYIa5arN5m4mF5OmfjBYfXEPUfPQdK4wxmu+rQFBxknzuDETI3Al0pg
         gKzFk5ugNWu/CrS/sm5LzS08ki0qnRoNCd9hqu/5Qaugt6uCrv0aQ0rQ3YxyVYDFKOh8
         Vfdg==
X-Forwarded-Encrypted: i=1; AKwUvBwUa8yCB5gnMbyoDfgVCtkFZ2FJy0VF/hamslc7GD7lLN+AvCa5nso/J9TmUg4+l/Uv6CdtC692mJhZDy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS2tclQj+73u7CCZmHW6/sjr/sErsCv/6oUJkBDvfqDkoSzZ5X
	hC+AzbSb2D+mQkIsKa/y/mug23d4aiGNM9hPZ4Ixjpzj9Qup8pXeCmEk0n4x++5mb0A=
X-Gm-Gg: AYBFou1S2xCMfPwS0mB0Tk9MoiRUMOz6ip6bs7coxR2U0+x2OEweHIoUT9d5CF1m+ms
	pa2RH++t1Eh6Gzjc4rkf6+fcPqmbsYctUkDwyLyzQIPkJrPFTlc30dvOw32CI2Cw8zcKdrOraQz
	SBW1i3AaQjSBduPEXxwD9uEumKtxNowpHLjxRAlj0FhxBu4zNCgmliAhZEMM97w246qQfs4zPLP
	VnT2q+MXwNlO+tN+nmZ+kPeoOmfpkfXCexW4M+0kEmC9fi8cB/E6rJs5EAPGTGyWWHaau+u4OUY
	W4ZWNa5aisc9keBRrdqAr7SihBw1aY/AW3eptgDtbzyrhRl995S/XnaYJQHP/cE4aA4eX1zf8UX
	uTih6Jr9P0JhBdWGdJnR5FbdMoiPyKy3njRHoS3lrqPOuIgHgR2a0uQjxZBqtBwlJpAWN3juRhC
	1HC9laQGrkbP6B/q67KUvHOmaAtGomZ+aYM+3dY+2G6KGlLgvWN6Pui2kPxDG5v73qkFt9hypWE
	/mu4cwZjznk9/CChR+ZWAArngTmTDpdU+Zuledy/lJ/Ivxp6ZUzP7DbLr2bXXPr6ntRcaH9QxF6
	kFUnZzrbjvBZlPjWLWTNi+GPKingb/q2uL/exB06OzFbVK5F/quxiz9qpEiXLyHxb/fWcuzl1VK
	qC8ZcoTYTeuoz
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr204281285e9.9.1793576886582;
        Sun, 01 Nov 2026 15:48:06 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm300812595e9.3.2026.11.01.15.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:48:05 -0800 (PST)
Message-ID: <3228e523-3819-4c59-a523-49b6d381e533@layalina.io>
Date: Sun, 1 Nov 2026 23:48:03 +0000
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
Subject: Re: [PATCH v2 04/13] sched/fair: Remove magic hardcoded margin in
 fits_capacity()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Juri Lelli <juri.lelli@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260504020003.71306-1-qyousef@layalina.io>
 <20260504020003.71306-5-qyousef@layalina.io>
 <20260923065407.3451520-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <20260923065407.3451520-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 07:54, Zhan Xusheng wrote:
> On 05/04/26 02:59, Qais Yousef wrote:
>> -#define fits_capacity(cap, max)	((cap) * 1280 < (max) * 1024)
>> +static inline bool fits_capacity(unsigned long util, int cpu)
>> +{
>> +	return util < cpu_rq(cpu)->fits_capacity_threshold;
>> +}
> 
> This does not hold on current tip anymore: fits_capacity() has picked up
> a second caller that does not pass a capacity, and the new signature
> accepts it silently.
> 
> kernel/sched/fair.c, invalid_llc_nr():
> 
> 	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> 			(scale * per_cpu(sd_llc_size, cpu)));
> 
> The second argument is a scaled count of the CPUs in an LLC. sd_llc_size
> is a per-CPU int and scale is an int, so the product binds to the new @cpu
> parameter with no conversion and no warning, and the test becomes
> 
> 	cpu_rq(scale * per_cpu(sd_llc_size, cpu))->fits_capacity_threshold
> 
> With the defaults (CONFIG_SCHED_CACHE=y, sysctl_sched_cache_user=1,
> llc_aggr_tolerance=1) scale is 1, so this is cpu_rq(sd_llc_size), which is
> not a valid CPU id on a machine with a single LLC. invalid_llc_nr() is
> called from account_mm_sched(), task_cache_work() and
> can_migrate_llc_task().
> 
> Separating the two uses first makes 04/13 safe to apply. Something like
> the below, against tip/sched/urgent (3cb0243767fd, where the cache-aware
> fixes have just landed; sched/core still has the older mm->sc_stat form).
> It is a no functional change, since x * 1280 < y * 1024 is equivalent to
> x * 100 < y * 80. Built with CONFIG_SCHED_CACHE=y and =n, no new warnings.
> 
> I can post it as a standalone patch if you would rather not carry it in
> the series.

Thanks for catching this and reporting it. I am preparing an updated version and
would have missed this tbh.

I'm happy for them to be split; but not happy we have a new user with magic
numbers :( I am trying to remove these numbers, so seeing more added is unfortunate.

If you don't mind posting a patch to split and discuss the details that'd be great.

Thanks!

--
Qais Yousef

> 
> ---
>  kernel/sched/fair.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..97ce56fcaf85 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1526,6 +1526,21 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  	return false;
>  }
>  
> +/*
> + * The margin used when comparing the number of a process' active threads
> + * with the number of CPUs in an LLC.
> + *
> + * Mirrors the ~20% margin of fits_capacity(), but is kept separate because
> + * fits_capacity() describes a utilization versus CPU capacity relation,
> + * which this is not.
> + *
> + * (default: ~80% of the LLC's CPUs)
> + */
> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 100 < (u64)nr_cpus * 80;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  			   int cpu)
>  {
> @@ -1542,8 +1557,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  	if (scale == INT_MAX)
>  		return false;
>  
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
>  
>  /*

