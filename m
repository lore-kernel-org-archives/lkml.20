Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854213;
	b=ZE8sKycDzaPVGpo5nCfEIxvkvPi6VC92egyvD5SEXunge1xitO0i55fsYSpiFwa5cRQF
	 cmLYouDsVCWHQmnqMs6ucTSZ4IZCObbjAgF7Kvxt6hnR+NdSpNSY1VNR8nvAxsfJ/UrcK
	 ioCXJB2aaAXOMvJWznaYnxIideasz9w7Vh/wV+19ZakA0r/KpHAGuE3W+DvJEwTRUipEp
	 vUAyaagJzUZxoorGCt8KixulczXUV+pbbM0vjnb2SzJts3YNRGMTtnNPqR44urQW357D8
	 H0meIHDHwskYB2RIWZa5nqTpVevIlgPlE6S6G9w1ffEgMYNc+HrcGbkyGI8zE4VQsIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
	b=n1Mag890XeTNRG0rraUq97XxZAmZ4e0r/vPL4E/APttExAgoItSL8glKZg6U4zUrWKp5
	 J9CxOv6Z7kScsDDk7Lp97cWCZai3ZT6/d5TFiAYS+joeww/zEkCwYlKoRLw2vOYTCX59y
	 Xnz7ZljyR45Bv5Y1ilGmbpX+U+Vi5tEGFb0ZmpfAQhqs5w4EkRDLAophQs80TzgHDcK62
	 3/xnqlZEg6E0f9gmRO46KOfV0MH7vkJv5+0gg/C0ZcWssRfpAeKqw3JDekulhrw/EZUm0
	 PRr9B79xrCIyKw3r32/rIGiEvWdp9tZaGbTZ1AAf/Dtl9MVYVW+nfuZwDEtHbciWMog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KJ+AXqZY;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E672606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E672606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KJ+AXqZY
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1815953b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794854212; x=1795459012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
        b=KJ+AXqZYM6QUTky08dH4rGMnNziYxgt+htQil+Bdh2lqFqEpNCuxYnwDXiFwm4GO4M
         dCqLszXCFm0cK5sQ5SxNU+bwOWXqrrkAyYVzpZt9QAkuZv4Its2LO7cFm2AYig9jCh4P
         IRFivHmfGd3878zoM/MK3sdmf+Y/K/cfYRsnmgEwkgtYoZMcaRBRKRzbSx1hSkbLzop1
         IXZaBeau+zZFtZGSq3G+zXfCm2GsvFCt5GROQ0dtp58oW8rQXUs/lAjEBjiFD/cXHI6j
         oKmxdd8gQQQI4dXA1GUgrvfiRJCL0ooA1j0fe6MdQZCHSaL63AGnZfyVpwoPhUbiv60o
         HdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854212; x=1795459012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
        b=h4HAZnHTxLOjAhqYBpFRRcoFMI+7CNKsywoejgC3vrbEtjplBkfZN99L8ZH/4hL46U
         HuHvAiZdh0d/grvIqhfaN7ZmCDuJpdmlG80PlUEHGHGHLnXGd7nIbiEmjOv+PTF/IalA
         0MRmDfxsH1frmrtX91VoMTzd/Wqu0CWUK13QYStbHXnXiCRNtWsW4KnKreqqYaVTskXl
         7EYO9p7p/wFvpR43vde4WFZLyUmeP8qE8CxOQmb0qSe8xeKgBBi9Rhi2zuvr6y6cqAki
         rHwdkfK03cQO+iXa8IgWJqLuL485XXzwhrFLuHtwmAUw7TjPIEaUBJRsSyDu5PCEAnII
         DmwQ==
X-Forwarded-Encrypted: i=1; AL+hErGly3YfKPfPuzOrkKJogBKovPfgMj7ZhsueOkfCQhGUYYjlA8tWabOA+hejtnEmvePQwJxNyOi0It5dFDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eLWcgQQuE8s2e+CiujeDeXOMV1qNryYrPGOqBVVzEYc+5DA4S
	G+0ZSZVq0Y897wJbgxC5CPvK5heBNvpQDWSloPArSpo/ugptcyxzMbkrRft5uR/NcA==
X-Gm-Gg: AZFdTZeD+a7sEFmeAliYeDQ1mJT99MuiwRK1q+2wqUhjDDSmHeFWu87n9S/r5ola7Ws
	HJXzkShk9saHPkgLcy9EmIWqgYhxsWali9iijYEgXrtjWP0O6fHueGL/qDkIeSAN+mE0vsqNth6
	ouivCL7CKBVf992VKXCOrl2I3/oZW+YiwTpFARpHh0hmytEutEsDYOEtgRkvmgKDVlysBh2CGVH
	daILLSvWXFNNBftPpFJlD0L2+f0fW75rgLA4ufO0hICKr87j6jwpZXJsl4TdDLi4dESaDl1JKTf
	hkC2KzbU4yoqy+fI1hsdJWAwpGsFX+3YyV7+433WkbIRai36KXYwp0HaFmeoEI3G+JUNkgXdemW
	GX/uMf1nBjGzGKT1PJUwgzj26kINy9oO4fhTMD8oHIj/3wfuFHov3ePj94B4YFHRYUP65OdV27X
	JbbV2Bodbih6jbdpkeM9atkoxEqWjqkg5Dn45Tml3YRrymXyl4bdmWTj+XqeHzQfXB9BgxTgsIa
	rZ70HL3bimJ/Qb2JQwEsVysGhV4mKzY4XD4gHh9dYxcgSth6o5mHiT+kP181KXMa4MExIzlO5RW
	5rgXkGFbhqqyfST9vURYjvA8UdIMiTsQTH//Qcdr3+7zmjlrR9vZXOGIwqS88WqQ/IMzE0audij
	rQzpwEVPisl8fmijUKQd0DpBCVEeBytj6RbZa5ZzAnnf9dacLQklL1kGBb78Rp1cVwtIHx/QqR0
	Og9fZo8bIOSOZZWvwKjCipYU2z6Slt8s6UCw==
X-Received: by 2002:a17:90a:e550:b0:3b3:a4ef:dcce with SMTP id 98e67ed59e1d1-3b3a4efdd63mr901353a91.24.1794854211639;
        Mon, 16 Nov 2026 10:36:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2e87:6:9050:473d:cdf:7c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac606d8csm345808a91.16.2026.11.16.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:36:50 -0800 (PST)
Date: Mon, 16 Nov 2026 10:36:45 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH] sched/topology: Avoid unsequenced accesses to jiffies in
 sd_init()
Message-ID: <avtMzjJxIpFWkW-L@google.com>
References: <20261114-topology-wunsequenced-v1-1-686a36fe61f5@kernel.org>
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
In-Reply-To: <20261114-topology-wunsequenced-v1-1-686a36fe61f5@kernel.org>

On Sat, Nov 14, 2026 at 09:19:52PM -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in sd_init(), which can
> break the build with CONFIG_WERROR=y / W=e:
> 
>   In file included from kernel/sched/build_utility.c:86:
>   kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>    1998 |                 .last_balance           = jiffies,
>         |                                           ~~~~~~~
>    1999 |                 .balance_interval       = sd_weight,
>    2000 |
>    2001 |                 /* 50% success rate */
>    2002 |                 .newidle_call           = 512,
>    2003 |                 .newidle_success        = 256,
>    2004 |                 .newidle_ratio          = 512,
>    2005 |                 .newidle_stamp          = now,
>    2006 |
>    2007 |                 .max_newidle_lb_cost    = 0,
>    2008 |                 .last_decay_max_lb_cost = jiffies,
>         |                                           ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.7.9.23, the evaluation of the initialization list
> expressions in a designated initializer is indeterminately sequenced
> relative to each other, meaning any side effects in the initialization
> list are unsequenced.
> 
> Move the initialization of these fields outside the designated
> initializer to place sequence points between the accesses to jiffies,
> clearing up the warning.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2190
> Fixes: 2b4cfe64dee0 ("sched/numa: Initialize newidle balance stats in sd_numa_init()")
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/sched/topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce..f5975079f453 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1994,7 +1994,6 @@ sd_init(struct sched_domain_topology_level *tl,
>  					| sd_flags
>  					,
>  
> -		.last_balance		= jiffies,
>  		.balance_interval	= sd_weight,
>  
>  		/* 50% success rate */
> @@ -2004,10 +2003,11 @@ sd_init(struct sched_domain_topology_level *tl,
>  		.newidle_stamp		= now,
>  
>  		.max_newidle_lb_cost	= 0,
> -		.last_decay_max_lb_cost	= jiffies,
>  		.child			= child,
>  		.name			= tl->name,
>  	};
> +	sd->last_balance = jiffies;
> +	sd->last_decay_max_lb_cost = jiffies;

This pattern is going to wind up with two volatile (expensive) accesses,
(with potentially different values) rather than one access and the same
value by accessing `jiffies` once then storing the result in a temporary
local (before the designated initializer), then using that to initialize
the two fields in the designated initializer.

Example: https://godbolt.org/z/h8bvvKK6j

>  
>  	WARN_ONCE((sd->flags & (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY)) ==
>  		  (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY),
> 
> ---
> base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261114-topology-wunsequenced-18f1d3b9167c
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
