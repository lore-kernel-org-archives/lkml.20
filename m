Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913604;
	b=HofzcPNmypulHYcYQc0J5Op5EKMKceGbevwpyPW3B19PQroUaLYWSw5eOgUp0aqH1RB3
	 Aux7J31iACJUg3aPkZGFXccBWJ/u5mCMtiN1StHNWlmvp8Q2CVRhiqqzHEV+gr/ZpbV5w
	 tLQg09yi5MwHCk6ixpOS2SDkR52aJUmvbZTSKOPxyEreQdCwhqUhopaSsjrlCBxu6Sp7R
	 3gXJJ6d41QNlgoMv9t3Fdu+F3SbOokZ+ZHTINN0Pm0MfmqDEgnKA/yXE7fJbb3v0rdbQY
	 td8hCI9WAMWH1ZHMvdjTaogufAn/+JTmhABR9KhxAsZE2DHHVL6q1eCiWZ/e7b8KlAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
	b=JpdmH2qX7vM/djCZV5rBtNglIp4gciZo+FDZBzcWc/eKM5kCtNWYDQ/WE4JpwNczn8If
	 KBL0J8WPioSjBUuwr1lgGCuoSBpxGG1iCJLxAwUj90hxLvp7qjFn51IatPJqH1RmaMo9x
	 futJKnxpirWIrdCjip8bCAlDJS/Gat2e7mIfSJ9oOKu5abZ2sDJKt+fw8gCts/h1H8R7y
	 3DJQq56ZxeqZsiBGM/F1jq/ocgwKYEJqbWdX7q/uI4o+CPNIIgwHp5Q9ZoXEy11eZh9YJ
	 un0VVXGw1FN+FJtIVTaHFWC7YVvfnscEZtoVFF9BgX+jedqUXUQU0TosbRW2lUFoghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fZGLg0sl;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fZGLg0sl
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3655939c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794913602; x=1795518402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=fZGLg0slbOqiT/LgH+j+6JL3838bVPAZoUKYPPR5vYSOWvED3b6bDzIquyykaT1Qt9
         qzL9aHijplMBTNi2OHnkxnadG0EjX178DfCzHuh/SK+NOn3HKTIeU9nfMJh/6Y4EPHni
         TCC7eKQIZ4lalbs6xnkiO5YYdzm6e5vCLLy9LwPHc6oWTnrfY0lGrv4FB/xLEEQciJQy
         3VO/z4yzqoulFpi7H02jGqebsvBXp60V0EBEVyl4i8b+CazGVgBJOCihUwOVTgqszfsZ
         rim7Jdpe748KgiWtnsG5GLdr7ao869tjNHgOGaKyf10CGcBr0uMr8KgYWvV+mUYWI/4v
         IQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913602; x=1795518402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4s7yJbpQX8syBD03XjGhRC32jwUYZoWTRv+UwUgeKs=;
        b=Bnstub45dekR84NIbiK+yFKH1UMLwVCqXsDgrSEsdXgfw3t0XkmVFvIYndxV6YJQ36
         c8I5NnO83mFjgdirDRlRNmwM2Op+qB0gKMhH3Bo9cBm4DkoURVJHbMiZ0j1YGCa+YUlb
         cWJfn5qIvTKh9aqg2/w6Zy4rC82NJJ6ymsRwnKmMxd37bmULBlnLgmpByNwpArZzdVN+
         K+ppooy2uWn2tAZsHL8lhKMjCgOIYps+DjuYIlVUntJt+HCk0PikTnYWjqkQe+4HXtzg
         vWvwOxsp89C5os/CATjvV7B1aEVVy/yPg629Nt9NrYzQjCc+erlxr3unZmxE4IikLMeA
         Ef2g==
X-Forwarded-Encrypted: i=1; AL+hErFpGIZzldUg1PUr2WP9Is0u/QTv7PmyJBX1aO3yROJXbIwhz+F3XrZ3cG81h/d0d9ikY+F66Ph7Uob4fJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tp/oMCiNdtObz0iDgyyuHbQqVA5ll2+UY+y1nvRDZ0TQJKSDs
	LCzvh9z/sznf9UAmdwAWvGVK5V8GfdJuD/9ui30Cg/45DgOI1hr1Th8YqIX/tg71ABo=
X-Gm-Gg: AYBFou1B/ms2aeWlb0499jkF8SB6FRzbwoCRyNmWUkk9HUuyr1NMoFaPFo4CEyaXH4x
	1k6o123V0k0GLZxGdD7vI/PnOyaAjDaRZi4hVYv/2QF8xv8LqYVuKs4xgLQFOE90IgUjkC+yUVA
	7rO/WZ830APjqc+EYRIkXbnj1B5K6pMf9H3qURDcWGJ/b9eBLdjQhU/bqYnkG959bBwXc0sHNF4
	BZKet4cL1ONbqgaDCY5hsr+da5t2BMLE7tH4otu5ilxSYdv9fYlZWb0aIgnJIa2jgEQvIgd2qm8
	KFKyn9IfDT6ADqOmI3TZ+lvdG7Wlm5Gp0Uc47htjHNubQGUAvNAgELimI6ydRdUOasx9f98siVy
	oUWLfa0JNFcyiFIQ5XBehtOXbWwOLX1HBP3E+OMl6sUBs9FyySiaEmGE0FKcbl6T+1Jc4c56Jw4
	J/U8YLvWN5UPC6Ek7nnASU8Q+aEZuYXBgbvYZ55Xd9qw3kJyaVRqGrvVtofLRUrWZCaJxCOvI8o
	/I8tU7/XkGe6NqJIv4YpiuwxARuYA1+eR4jhWRWFVUxkLildEhH3mbXOAEQfMHBDvMa5q5sixZk
	g0YwVPhVUlCAFzufj/GPYs2d+EGIfA==
X-Received: by 2002:a05:701b:4188:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b5030fb7f2mr12989338c88.37.1794913602124;
        Tue, 17 Nov 2026 03:06:42 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm39194951c88.2.2026.11.17.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:41 -0800 (PST)
Date: Tue, 17 Nov 2026 16:36:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Natanael Copa <ncopa@alpinelinux.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Milan P =?utf-8?B?LiBTdGFuacSH?= <mps@arvanta.net>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
Message-ID: <avw1Pos5Je8piwvU@vireshk-B250M-D3H>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>

On 11-11-26, 14:04, Natanael Copa wrote:
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>  	.suspend = cpufreq_generic_suspend,
>  };
>  
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */

I think the problem is valid and must be solved somewhere.

> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);

I think this works accidentally for now as OPP core could have
rejected a switch to the same OPP in this case too.

- We should add a new flag to `struct cpufreq_dt_platform_data` to run
  this code only for the affected platforms and not everyone.

- Perhaps we need a new OPP API, which configures the hardware,
  forcefully, to the current OPP.

-- 
viresh
