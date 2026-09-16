Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5453C09E7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580734; cv=pass; b=kU5BjqdK51CcmCbbRqfUoCjELbl6ii5ZFYoYfWuXt8fjTov8+5bGBbpggJgYmPk/2sMBet8rr8TJPoIeeyR1+1hh0GkBmGBn7T9PEOKyyi3fTYM3h2KK22dcZPl5vl6zAZ+0eADUInEmh1+oN41Pah56dOejJvXpBlGrSxNd8Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580734; c=relaxed/simple;
	bh=SKN0JL7GkBBUQJS84eZq1re1jMJyNZPMoGLiDdoauHY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYtWFREGSAsp/NywhwWq05UUMMqdce6Ic+q1dwS4mT+1JPlOV8sc+iwiywLaWNxrb3HqyUy2LptRykAFQ9pARs1xFur+eM2RkLB7sMkn8BrFf1gIU08ry86yMD4BtVVY/cexNdv3+d5EotytERhj6VMhol2Ah/wqI6lNqdwVta8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StjrCAR8; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StjrCAR8"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66d20c35ffcso180406d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789580725; cv=none;
        d=google.com; s=arc-20260327;
        b=UXsNbN6MHy1zqPoqF6z2FQaJW8hEqzl1P9ojgwVQ/GDP364P8Gw0PEm3U9ZWwiHogq
         YZYjC/UEUcN+xEyVByMWYtv2P0WR77eUnqJ5qzfLzl2UatkD0UOIhlyIN8GK82NHIinF
         eGkHXKC3YGSvpcDBLYFvehqcghbssdQMkXpDsqi0vf+CgtTYJVYH1/4yAac9mfbOFggg
         HSFFDsojr1BqtBkJ8r53wNsNAvQXMnolSE7c6HwLC5vGWkoZsKv5kDpCYOAQfyICv+my
         o65fzQng0v8ZQpL9UiX8vAMIMwngWbi6aJklZauXq1hf1ZvXhJbq2Xj+0fp2C1GSB+BT
         OcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=IOYv3QgMRUMifmGGTF2BeO7ylrbnq7wWgArM3pERBA8=;
        fh=Ev34olU8AhqVg4gjT7Q6HZOXp7QUSpDFVCIJYl2A6fY=;
        b=a5MIGbvzrDMeHzMFd7Q7mPgwcyovzBkjy/KCPAn+F9Z4zJlzzIgFE0I5mcY4rDIghI
         t5aP9CcgGCq6u7fmfHqDjGv72jLm1od9erB6r6EAALGaEWNCvdCkWVe6u/oQexuXPs3f
         W1gD2hldjBNZXHyxhBhfVGfeWnEQExUhAi4GthsLuEag2LU0871PVLmos0Rv5Objul2U
         ohFdZUgaHJdxGcpVDp0LJ50PAWBFdqNmQG2m2lUcw8Wq7j+CrnMqkJGSoQ99HYCqDOjq
         ezVZ5GVAVCAp4CEt/IVep2hpOvLkcaq1eQ4IHOejS6Z7HehZo6VuAu2O6tbacx2KWabj
         T3KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580725; x=1790185525; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOYv3QgMRUMifmGGTF2BeO7ylrbnq7wWgArM3pERBA8=;
        b=StjrCAR8Jl5RSTFyh4QuL5amrtJkTOzgd33RzpB1w+STDKpB3iczSykGpXYumB9aeC
         xD1vmSgRnCFr5RYxOMTuKqHRMLI09IburwSEAcrwgyyCwlZQ3KdJvvNQmHtXAy9mrYSN
         9Ans5DSo3i0ZIVso01xarLR/6alZgaldnHQQ7wz9bo4IIT42x8BVC0Sh/EvryuRvgBeM
         IR5IZT/QqKtWbhM4dfrZ5ada7rUSULNjRYIq+LgLulCfpMRLGrKFigqWL1pH4Bvk0Q2M
         1Vx3cFigBUpLDXqKaJTjaX5I4aBjFhmNmrC9IygLwKHIxp2JpKsfeXbXjEeGWA8keKI5
         UlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580725; x=1790185525;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOYv3QgMRUMifmGGTF2BeO7ylrbnq7wWgArM3pERBA8=;
        b=OPOsFViqfeIp+74X0Z5KfipbZl0O8e2muZHMziHwSwp6y/y+OANMsAIShxjjhY/blq
         K5uTHeK/y5opMCys776QV0rkMfHcfiYVoiFB04/S1ZrzQ4zpoBUQQoFSKyCptdwQShfj
         C8GwnEecF9CfrgXmxMwHiLVsWtAbDoihpM9eSoXtNGvanIwASURwpcRxVp3UEucP8JTi
         oaLoVPvrdhyEj4JophVp1erxhgAcWUQ49QiJxn0EeUfBJYNpGrGGfQBdSl87ByDV/Lzd
         cWw3qhwKj/ndbVJGBEBYlpEbdV2bFiCzScOfke6ZQPPEJhL74HHfozJXRz0X2Wb+W422
         55kA==
X-Forwarded-Encrypted: i=1; AKwUvBxWlNIOWyVqZ8rchCsi2YZfRFDB9LAO1tkw5AUPGchP25FOik6/8k5tfRkqKcTJl4X0eVkoLlAcMbGi75s=@vger.kernel.org
X-Gm-Message-State: AFuF++mRN3l3Qx48R0IlrytpIcUNeGPOfwIg2HO09oPN5xVKx39DShsu
	5ApVgmLBIP9LD6Kd5D/lv0cfhYTrktLO42x8HTvigy4355H+jquZcHYrioS76Yiuhm7bmACuLn6
	Va81HyJA9F0eQb4WvPmV3Vwyboi9MFLw=
X-Gm-Gg: AYBFou1AqJEkedDUZAJPezm78UDNeueXidMFCsoI0AzeIsfU1CimATIFuXpoJOFs4Mz
	53A0rftYjEn/iBfd7qUBX2qHOryMqDCDW0IAKTjbjwoR+Ff4G8Ti8RyTATf4iNdIBeXL53sk9ut
	PqBRGYqSJC5qPG7UVCAm385G2Z1kLS0uWQt7dxjO8HFNO4Ppk7uh6e/7r06f2ILvGoroqtFlFe3
	Tf5umRBDXgjVtWxSf27hJnen1Hr0WchqVDaz/5zs1O3xKRhpLDkCoKCvpB+e9An/Y2K2sMXNo7N
	Ou9DNisvoqLbfDgh0ZI69V7EufP6Z1dCM5LwIghq4MzVpUOJL9GCbA==
X-Received: by 2002:a05:690e:174d:b0:671:335c:d6b with SMTP id
 956f58d0204a3-6716344be02mr1247899d50.5.1789580724461; Wed, 16 Sep 2026
 10:45:24 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 16 Sep 2026 13:45:23 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 16 Sep 2026 13:45:23 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260914093300.100495-1-huangshaobo3@xiaomi.com>
References: <20260806123020.90869-1-huangshaobo3@xiaomi.com> <20260914093300.100495-1-huangshaobo3@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 16 Sep 2026 13:45:23 -0400
X-Gm-Features: AcwNN1UbSz9j_YK2TyroR0WvWmqVkz_Hz7gqfmErLvR7rOVGTQ8tgDgYEplJIPk
Message-ID: <CAPAsAGzVsmj4xRsJeBBBt5FvgUqWa7eyb4w=EBkm8GGeLF1EhA@mail.gmail.com>
Subject: Re: [PATCH v2] fork: reset pointer tag of vmapped thread stack before vfree
To: Shaobo Huang <huangshaobo3@xiaomi.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, kees@kernel.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Shaobo Huang <huangshaobo3@xiaomi.com> writes:

> thread_stack_free_rcu() frees the vmalloc'd thread stack via
> vfree(vm_area->addr).  In RCU callback context, vfree() routes to
> vfree_atomic(), which calls llist_add((struct llist_node *)addr, ...)
> and writes 8 bytes to the base of the region being freed.
>
> With KASAN_SW_TAGS, vm_area->addr carries a random tag.  If
> kasan_unpoison_task_stack_below() has rewritten the shadow covering
> [base, sp] to KASAN_TAG_KERNEL (0xff) -- which it does on every CPU
> resume for the current task's stack -- the llist_add store checks
> shadow[base] (0xff) against the pointer tag (random) and reports an
> invalid-access, although writing to the base of a stack queued for
> deferred free is legitimate.
>
> Reset the pointer tag to KASAN_TAG_KERNEL before vfree() so that
> kasan_check_range() short-circuits the check, the same way the task
> accesses its own stack at runtime via sp.  The vmalloc lookup is safe:
> __find_vmap_area() resets the tag before comparing against va_start.
>
> Fixes: 9f7d416c3612 ("kprobes: Unpoison stack in jprobe_return() for KASAN")

This commit merely renamed the resume helper without changing what it
unpoisons. Only generic KASAN existed back then, so it cannot have
introduced a tagged-mode problem.

The problem became visible with

  449e0b4ed5a1 ("fork: clean-up naming of vm_stack/vm_struct variables
in vmap stacks code")

which changed thread_stack_free_rcu() from vfree(vm_stack) to
vfree(vm_area->addr). vm_stack is derived from tsk->stack, whose tag
alloc_thread_stack_node() resets to 0xff. Since that commit, vfree_atomic()
gets the tagged vm_area->addr instead.

> Cc: stable@vger.kernel.org
> Assisted-by: zhipuai:glm-5.2
> Signed-off-by: Shaobo Huang <huangshaobo3@xiaomi.com>
> ---
> Changes since v1:
> - Drop the 12-line comment; keep just the one-line fix.
> - Fix the Fixes: tag to point to the commit that introduced
>   kasan_unpoison_task_stack_below (9f7d416c3612), which added
>   both the function definition and the _cpu_resume call site, not
>   the 2016 vfree_atomic commit.
> - Add Assisted-by tag per Documentation/process/coding-assistants.rst.
> - Use real name (Shaobo Huang) instead of "sparkhuang".
> - Trim the commit message; remove the full KASAN dump.
> v1:
>   https://lore.kernel.org/all/20260806123020.90869-1-huangshaobo3@xiaomi.com/
> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 45300f59cf2c..9a66b10749de 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -238,7 +238,7 @@ static void thread_stack_free_rcu(struct rcu_head *rh)
>  	if (try_release_thread_stack_to_cache(vm_stack->stack_vm_area))
>  		return;
>
> -	vfree(vm_area->addr);
> +	vfree(kasan_reset_tag(vm_area->addr));

Thanks for report the problem and the patch. NAK on the fix though.
It addresses the symptom rather than the cause.

The problem is not that vfree() is called with a tagged pointer. The
problem is the 0xff written into the shadow by
kasan_unpoison_task_stack_below().

That helper is only needed in generic mode. There the compiler expects
the stack shadow to be zero, so the redzones left behind by discarded
frames must be cleared before the stack is reused.

The tagged mode has no such requirement. The compiler fully initializes
the shadow of stack variables on function entry, so stale tags left
below the watermark are harmless.

kasan_unpoison_task_stack_below() should simply be a no-op in tagged
mode. I'll send a patch.
