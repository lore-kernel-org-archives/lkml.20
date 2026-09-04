Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7733D45F7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511069; cv=none; b=nQm0JjgwxZM7HvoW40IEbZSDUqA4c8Ox86irYSny6ZciusYZpvZNkNi5GbiOcLWoBx5Tf4Pjk7LxYYtZrScWlJMy3cZUsNFKSlrVxxP4YN6OW1vp5aKWEF03S/b20e3fvt2zNRci0nbWfoq9MsYFIqO/ElE6LgmYLJOjYODY9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511069; c=relaxed/simple;
	bh=JNVo3mCPeHl6ES3fr1l9fzdDZhXVPKNXb/7te67rFJA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrevOrPQY2yQrsXgnmZKCYl1AOXiF04Es6P0euf5k9nmZ9V65LlIWaBxTPA3WPkI2Zh2l/wNN3B3w5/vypBxLpQWeLxziXvDALMn/cAQp8mwC4aGSbw5P6yOsHiXK0icOXAUljxNjcxZnvOKFk4DsF+dynEKtHx9eg3WMrLZVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=It9jDnEV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It9jDnEV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so9913385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511066; x=1789115866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3s1LbH3i67Aex+XO8TqzHfYjkZ2LQ+Zdti2dOun8vp0=;
        b=It9jDnEVCbZVR9s5JO3WJcHTmGDv4Qvre+NAB3GUZs1d8/27QCs3gM890sAJAfRu0X
         QXW71DDQXO+Bm5q5BjpqOjxDgpRwnGLANq5vYPrpr5vu06y7qevH/bd+7zME9iSg2SyQ
         O9XxjOIXzdz9zr0wVl1a4UG3RPYhyIurxSFVdnb/VYMOOPXHI2vbrFupWEyr4BOoTrWk
         9yTZ5jvfCIzY002hPglb8hNKqvIW9iB+TZez5fD8kTaPwEF/k+pftgp6MvufxC546o12
         RaXRMaiJSljwTsHyFmgEWatoGmCnDkVh+cjv7zxYkAG/xQL2srka43NFz0RhyAGDTxmv
         ycYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511066; x=1789115866;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s1LbH3i67Aex+XO8TqzHfYjkZ2LQ+Zdti2dOun8vp0=;
        b=ewT902oEnMqC0u+gsSLF8XIlXYQP4DcxP8Jae63McPl1zuXFhTmTz6nVTsFmYZGXIj
         j+07iJrOeI2HDvSmFTZYShsiktBRrjhjAYOQn54IVABc287o1hZwq8CnLe23NX8RO1er
         6tyIfiLujSS5HrsDp51ugZxoW+WiQRjrMSr8s52fNIb8TK/oWpvDlAliTs/k/NATakHR
         tTUJ5oQ4XELyaIwvYfCsl2NHFrbdyxUdOsXFs5UqDvSeUkN6zDVhRFFAjHDa+pSWWqbn
         CHlNJMCM5KE8JfxinU8H3Zx0ZaKoPghW8IOKUhWja0kwIdalj21n4MD36+xztx1Dsoeg
         caUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjduy/Thb5vell87jvzXbEET2XkDf8EjqxxqbveoCVsQbu7l2Drk0JoN3AvvksF3IoN198FYBrMt4OfTs=@vger.kernel.org
X-Gm-Message-State: AFuF++m0/kXe2Xwc4G8YpGrQYjB9RrkFauOThZvj4sbFLn/1vGi2jPl+
	98TEP3nXI28IH2nKWfJky+Yjy/xxZyCnrmJTDesgk4HtkGppCKhy2kGC
X-Gm-Gg: AYBFou3vQe//MTNZevMDODuap7hcb5Bj5EvOcDg1INht9U64l1RaZ5n03TZHk2A0a1g
	X1CbJ+3GhjPi9RhevbbGFenenG9YwYN2r9i6zXooB8Ci6Mq98jb3lcS/Hner4KJnY35iLUMWoGE
	AkJ1/tandY9MWQorP/DGJRG/h7H0dMxBh4Nb+sgwBzo2zCK6dZlpebMPR/lcs5BBLB6gR5BP9gd
	/OaazIGcDV3gubafBngOWVFt3tDQy2yh6AQC1fRQC5CZqEp7+hGLT+y5vMi+RCgiS+yu2RhxAiV
	vwrGvwdLdTaBDJjSUOmhErXxBynyErbZs01QzyebRLHhfsrwJNqUnQG7YcAh0gTpbCk3dwxpZGL
	XN/mSCz9qky93A3txoUSlsolYJBmf9TjgnGJr3kmXpp5JiHMDET1EPAKSpUqMw41H0Z5rwE9wgg
	RNM5PARSVunQkxud2tKWZWR1sBPPSVRumJrB71MfC3Qiq4EVEFP61Y01gDijWVf4Rz6ZNqaiYvI
	Xj9kzf4YjrGpmuTfVza3Cmc8A==
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c85 with SMTP id 5b1f17b1804b1-49cfa211d81mr22763385e9.26.1788511065589;
        Fri, 04 Sep 2026 01:37:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm137112065e9.2.2026.09.04.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:37:45 -0700 (PDT)
Date: Fri, 4 Sep 2026 09:37:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Muchun
 Song <muchun.song@linux.dev>, Kairui Song <kasong@tencent.com>, Qi Zheng
 <qi.zheng@linux.dev>, Barry Song <baohua@kernel.org>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Chris Down <chris@chrisdown.name>, Tejun Heo
 <tj@kernel.org>, Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org (open
 list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
 linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER
 (MEMCG)), linux-kernel@vger.kernel.org, Ridong Chen
 <chenridong@xiaomi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/page_counter: avoid integer overflow in
 effective_protection()
Message-ID: <20260904093743.23cde26b@pumpkin>
In-Reply-To: <20260903031952.1120321-2-ridong.chen@linux.dev>
References: <20260903031952.1120321-1-ridong.chen@linux.dev>
	<20260903031952.1120321-2-ridong.chen@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 11:19:51 +0800
Ridong Chen <ridong.chen@linux.dev> wrote:

> From: Ridong Chen <chenridong@xiaomi.com>
> 
> effective_protection() scales a parent's protection by a ratio of page
> counts, e.g. for recursive protection:
> 
> 	(parent_effective - siblings_protected) * (usage - protected)
> 		/ (parent_usage - siblings_protected)
> 
> The multiply is done at unsigned long width before dividing. On systems
> with >= 16TB RAM the product can exceed 2^64 and wrap, giving a bogus
> protection value and silently breaking memory.min/low enforcement.
> 
> Use mul_u64_u64_div_u64() to multiply in a 128-bit intermediate. Because
> usage and parent_usage are not read atomically (a child is charged
> before its parent), usage - protected can briefly exceed the divisor,
> making the quotient overflow 64 bits and trap (#DE on x86). Cap it so
> the ratio stays <= 1.
> 
> Reported by the sashiko review tool [1].
> 
> [1] https://sashiko.dev/#/patchset/20260826133054.88529-1-ridong.chen@linux.dev?part=1
> 
> Fixes: bc50bcc6e00b ("mm: memcontrol: clean up and document effective low/min calculations")
> Fixes: 8a931f801340 ("mm: memcontrol: recursive memory.low protection")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Reviewed-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  mm/page_counter.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/page_counter.c b/mm/page_counter.c
> index 661e0f2a5127..e8bd512069c5 100644
> --- a/mm/page_counter.c
> +++ b/mm/page_counter.c
> @@ -8,6 +8,7 @@
>  #include <linux/page_counter.h>
>  #include <linux/atomic.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/string.h>
>  #include <linux/sched.h>
>  #include <linux/bug.h>
> @@ -356,7 +357,8 @@ static unsigned long effective_protection(unsigned long usage,
>  	 * otherwise get a smaller chunk than what they claimed.
>  	 */
>  	if (siblings_protected > parent_effective)
> -		return protected * parent_effective / siblings_protected;
> +		return mul_u64_u64_div_u64(protected, parent_effective,
> +					   siblings_protected);

On 32bit it is only necessary to use a 64bit intermediary.
mul_u64_u64_div_u64() will drop back to the (probably faster) 64 by 64
divide (and then maybe to a 64 by 32 one).
But there is a lot of extra code before that happens.

>  
>  	/*
>  	 * Ok, utilized protection of all children is within what the
> @@ -397,13 +399,18 @@ static unsigned long effective_protection(unsigned long usage,
>  	if (parent_effective > siblings_protected &&
>  	    parent_usage > siblings_protected &&
>  	    usage > protected) {
> -		unsigned long unclaimed;
> +		unsigned long unclaimed = parent_effective - siblings_protected;
> +		unsigned long unprotected = usage - protected;
> +		unsigned long parent_unprotected = parent_usage - siblings_protected;
>  
> -		unclaimed = parent_effective - siblings_protected;
> -		unclaimed *= usage - protected;
> -		unclaimed /= parent_usage - siblings_protected;
> +		/*
> +		 * The usages aren't read atomically, so a child can transiently
> +		 * appear to use more than its parent, making the ratio exceed 1
> +		 * and the quotient overflow 64 bits (#DE on x86).  Cap it.
> +		 */
> +		unprotected = min(unprotected, parent_unprotected);
>  
> -		ep += unclaimed;
> +		ep += mul_u64_u64_div_u64(unclaimed, unprotected, parent_unprotected);

If the ratio is forced to 1 there is no point doing the scaling.
So maybe:
		if (likely(parent_unprotected > unprotected))
			unclaimed = mul_u64_u64_div_u64(unclaimed, unprotected,
							parent_unprotected);
		ep += unclaimed;
OTOH if the min() generates a cmov rather than a conditional branch
then you don't get a statically mispredicted branch in the normal case
(which is very likely with the empty 'else' branch).

David

>  	}
>  
>  	return ep;

