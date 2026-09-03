Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86F4137AD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429714; cv=none; b=NL1z9hYVn4vQIP0UCqVL1PiItiEj1bAx4g40LhOzt2pOItbnlIZ+Cu3jrsDzQeG6z1roTZM7LRPSSeH4OdigTaWnPB3sPtaniys7smJrQ7z18bD+XhAkAwl375hohoKY2fBLKv4FZriAfugUgRgAfWatz484jVl2cL47MBaZKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429714; c=relaxed/simple;
	bh=eVvi+oZ7zm88Ak3ECTPd8lI8OZXgbUS6E+jFC1A/eAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5UNWsQGhaGeihpgFUd9z9j7Tl6Fo49qqD5uqM/lN7On5GN1vTMKx/GBfMsNKqGgQzaUo8M9tF3eLxyGLr238xjFTECBRIX0RD72iFXj5KeQnyDj994ZNjyzUG9BYfkayaVELnGm/FPnGKezEHzbBPwrIW/J07Zm6QwCTFnTTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QY6QSZ0s; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QY6QSZ0s"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1887765a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429712; x=1789034512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ce8M/7qhkjbYOloNei8s08cubgJ3TDWZ5Dcu7749Xg=;
        b=QY6QSZ0sHTL8yz9B4MF6wHI+j+VZNO/a4VAS3sVZHsuN2C6RBZC/Dp67vQAQY7EoTR
         tXC2ZrgirvQMViYy4EJHGoI3BJR0hVS5bMSCj0DBB/Ree3clrWHa6oSAPEIe9YRvjIVD
         MIKgxfGpyMGPetHR+IED4St5NvGHZZgbfBKB9J9xvLZJ/lLD+tzVqOYddN7QTEoQxnXU
         YS/0YMRnoeA21hlWatP5UyvzJT0XWY+AjeEkwQGQdkBr7ubqJE4QFaQ5dO12S48ZBm90
         jMJGZ/5Ry1cJFIR1Kl68ldSP78AjTCpdcjADhavlNKFs0hcoLw6go+fyjqY1VS9jF+Wa
         uqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429712; x=1789034512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ce8M/7qhkjbYOloNei8s08cubgJ3TDWZ5Dcu7749Xg=;
        b=iNSli8FSm3WRzDOXPFPlu/tp+F3f+v7xbm9FEsLiEFYXtTNFs+V6ar85QbNwJFSclX
         An4EfLY7JPo/E2IL5LI+YOSIk9Qvff0KTVkVkQTS+agDAEQsUSswNOmFBLIbYFCQ8alP
         tSQ2BFtgxlbCEgWPVdLK5Os7NMC4tg8kHoBN53vLiLe3J7usa0vunebyzGSek+1PM3Mu
         JbvowOp6rNn8jLS4kV1iOad34KvqBLBwDWDSkJm9YUs1eMPEqP80ecNal/qfPkpf+gaT
         /lxeHLsqwuJjCOfsunw8leyi3IGbrSbfLe+iiDhngOGS61kvbeyl9PXMB/09OqBIdRuq
         +h/A==
X-Forwarded-Encrypted: i=1; AKwUvBzMH1ZVcPT1hgx+xCTzrJosGEuRETrnab9idVtV8sI2QUzmi5MCP5+IGjo891rV4+q3qxMQVFbdzH3RYPw=@vger.kernel.org
X-Gm-Message-State: AFuF++ldr9szd8vnufyux45U3E/N9SRiqLc/xn0+JrzWiLpcV0n7ec0k
	oEjXjBlfdNOV/HPpF+C+kPLYw7CoHM6Br61kB/PnVKOhhAnduh0l9o1zYchyTAIMeQI=
X-Gm-Gg: AYBFou3Lp76mTxyaiirXCz26xc9p4sk2tDLJ3OGuDYlrr0cLzgN5FxvvZz4idnIW22V
	nuc4XAWBR8eclrzonSZ2XHslJGpzcdiE4WpRO04hR5QU/4nWw7JzWtgZPJXsdRF27v5DGoOHf+t
	AysFLQcYCUvioU6Z5bknI6j1QTYvlSJ4L0WdKxGc+FnYoOTvJj9n5dWRYm9qrcwX8GaqFIlionC
	Jjsfrp+FQ4tS9XrewaghE9Ly98hpghUc745s3OyzNloA0Oazqu5QveFRg1YX0y+sM+pe2SBOb7k
	vgjkPlY2hG+RmLpnl9veVsugGRAo86pXrXa+rdQ1hvjGmAjCGdKs7XcaqVZenOIlkBc6MptlaDF
	ZYEiQIZ/XI/9W2bNwK8aetpOKAHqT1PMaNn7vD6Jz2opSc5+r4I/dnmtjOVNej0MJ3hJJOdD/IA
	Q0vnoe2PJQQqHhcV36J9uyUCskjrRw2QEQ6smWAd4lc987vkcf6bSaKcnR5Vc=
X-Received: by 2002:a17:90b:4c4c:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39aedfc9616mr16315183a91.11.1788429711355;
        Thu, 03 Sep 2026 03:01:51 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08766a2dsm4456658a91.15.2026.09.03.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:01:50 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	Quanmin Yan <yanquanmin1@huawei.com>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 4/4] mm/damon/sysfs: set next refresh jiffies per sysfs context
Date: Thu,  3 Sep 2026 18:01:41 +0800
Message-ID: <20260903100142.106449-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002725.108635-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 17:27:23 -0700 SJ Park <sj@kernel.org> wrote:

> When 'refresh_ms' is set, DAMON sysfs interface periodically updates
> auto-tuned parameters and DAMOS stats.  The timestamp for the next
> refresh is initialized when a DAMON context starts, and updated in its
> damon_call() callback function.  That is, each DAMON context updates it.
> However, the timestamp is a global variable that is shared with all the
> contexts.  When there are multiple DAMON contexts having different
> refresh_ms, the update frequency will be changed, depending on the order
> of the contexts.  When there are multiple kdamonds, it will be even more
> chaotic.  Fix the problem by having the timestamp per each context.
> 
> The user impact is not very critical.  It does not leak, corrupt or
> crash.  The update will not be faster or slower than the lowest and
> largest refresh_ms values of the contexts, respectively.  The user can
> also manually ask the updates on demand using kdamond state commands.
> That said, clearly this is a bug and can easily be reproduced.
> 
> Fixes: 9fd7bb5083d1 ("mm/damon/sysfs: change next_update_jiffies to a global variable")
> Cc: <stable@vger.kernel.org> # 6.18.x
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/sysfs.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
> index 3c81b4c91ac0d..dcb739ce0a729 100644
> --- a/mm/damon/sysfs.c
> +++ b/mm/damon/sysfs.c
> @@ -1788,6 +1788,7 @@ struct damon_sysfs_kdamond {
>  	struct damon_sysfs_contexts *contexts;
>  	struct damon_ctx *damon_ctx;
>  	unsigned int refresh_ms;
> +	unsigned long next_refresh_jiffies;
>  };
>  
>  static struct damon_sysfs_kdamond *damon_sysfs_kdamond_alloc(void)
> @@ -2213,17 +2214,15 @@ static struct damon_ctx *damon_sysfs_build_ctx(
>  	return ctx;
>  }
>  
> -static unsigned long damon_sysfs_next_update_jiffies;
> -
>  static int damon_sysfs_repeat_call_fn(void *data)
>  {
>  	struct damon_sysfs_kdamond *sysfs_kdamond = data;
>  
>  	if (!sysfs_kdamond->refresh_ms)
>  		return 0;
> -	if (time_before(jiffies, damon_sysfs_next_update_jiffies))
> +	if (time_before(jiffies, sysfs_kdamond->next_refresh_jiffies))
>  		return 0;
> -	damon_sysfs_next_update_jiffies = jiffies +
> +	sysfs_kdamond->next_refresh_jiffies = jiffies +
>  		msecs_to_jiffies(sysfs_kdamond->refresh_ms);
>  
>  	if (!mutex_trylock(&damon_sysfs_lock))
> @@ -2271,8 +2270,8 @@ static int damon_sysfs_turn_damon_on(struct damon_sysfs_kdamond *kdamond)
>  	}
>  	kdamond->damon_ctx = ctx;
>  
> -	damon_sysfs_next_update_jiffies =
> -		jiffies + msecs_to_jiffies(kdamond->refresh_ms);
> +	kdamond->next_refresh_jiffies = jiffies +
> +		msecs_to_jiffies(kdamond->refresh_ms);

The fix looks correct to me.

Moving next_refresh_jiffies into struct damon_sysfs_kdamond gives 
each kdamond ownership of its refresh schedule, so refresh activity 
from one kdamond can no longer interfere with another.

I also checked the initialization path: the new field is zero-initialized 
by kzalloc_obj(), and damon_sysfs_turn_damon_on() sets it to 
jiffies + refresh_ms before registering the callback via damon_call().

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

>  
>  	repeat_call_control->fn = damon_sysfs_repeat_call_fn;
>  	repeat_call_control->data = kdamond;
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
