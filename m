Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3885921E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654149; cv=pass; b=pMwCvOrmSOmhdaWGf3LbtUqaYiil/yZ1fteC3VSrf2H+WgoYw82kyZrJX8cjXY7EQf4hxxfMEZvun7vCAbdThyI4G77J530aaLZOU4rDFRS8QZTac7snueVJXdJ0bOp4wemYi3MhVDGOvoXBpBe+sHyR18vrxEookjmqVcAmMPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654149; c=relaxed/simple;
	bh=0I6B89QE1lGTpfyUcvsPV7lAaYiJyveAKjUIGfshr3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXUgxJ9uaUEYY5L9L11DZ5IGs3r3sRn8zTBPnPrM7ltizRyldbFNDNgrT67uwPamXjvnfDRkxzkphdNwWef+nGzU9xvmuaGmf+BuMa54E60azwFm6AY+QPRJJSvfoXN/lMi7HPbXRTevtYIXvUMQDt3z9zbH26PmS+3j6Zc8RhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHTJYWM2; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHTJYWM2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so1205541a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789654139; cv=none;
        d=google.com; s=arc-20260327;
        b=iEuo0yn9KxOPPJNl0buicQ5KMXbcdKiZoc75LZFBHyYo+Xgh+PVXYSSFgrYEhce6ms
         t3YKAqmrr/uhiib63znCwBMnbovLmauLcFF7w1BRdIJFYfPY0IdZ/5WJkzsUrLwivyZj
         9Z7a9IDCCXNBU0usIl9CpQXgn6kU0Irfa4E/wRq0oQQU23l7BbqPTyF9+2mgOyv9UhS+
         ku5mPz433Kkj14XjRATGLSP3nFDaXOy/mXcfJ5y7N42hx8WGOwwnHuEKSDLbLGHfcKUC
         xNQFhuw4vlgOzlZ7PVxwrAEO4Yq+4zwZWrSdqy+Ti4KPrmaNzm50hX1IkltN1J6kS6rC
         ao5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fuwZyOKS0xThCnh60yYa8+8i54h/f9HpMrDJGJMC0k8=;
        fh=CoIrzdZWXBDhZyViIstjWlfIygBXBCAeBnDGsuHIFCk=;
        b=pvPJxVbSX1yT+PFgqpVeT42F6ErnGkVx6D5IcVywBkQGOA74veRqGfxVFzLqC7icEk
         RWtVPMB4JeN0bW1Ftw3vt3gWKZO4afoG5SCdmOOwmS5t9+8tjvKrG1zUHApvZz5mHTfC
         qh2Cax2Y9U1jHALw9vOboyeFaBJouixOGPEbsppN44v69Q4N407bjK0L6ooWpN7Meqj4
         zEIQ+kLkymilv64T/Eai/LxLf5bmTQJYvnwnYGBvwFdGcs2PtpG6Vd9A5ffxbr4CVr1E
         XE7vhfmLL7AYoDJBvTtBLsxnsDohM7im05Ymv+YDLft3URbAfDQQ9XzD4F/rNhajTsWz
         aaCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789654138; x=1790258938; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuwZyOKS0xThCnh60yYa8+8i54h/f9HpMrDJGJMC0k8=;
        b=lHTJYWM2lwL9tigrIeLJaQOOVoueTKntY/fmYr6sOIYghODvE6HbSzpJz30DBVc6Ap
         l6/DxykEqrPGWZuxPLZGfwNr/ZTUUgp46j32S42+lWShtRPC9Eqc981E1pHu4cEAxVIL
         ZjFmwj/u+N28oP9nMczdFEVzGajYWvdJzmWZm6ITht7HUthq0b+qjXpCy8tCqYgrs4Tz
         zkrSnWV95Z2AhHAyWJUp2jnD46L/kenzQoDQxv+NT2uQQh2e+zwxhi1m4vQQjQiwL2Sz
         n66p9EddVLIdw7bKe3hbAd/5aeFjss4Hz7GKhjNOFEej4eMqYH2Sfl2AJ2XBr9dnxnLt
         51HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654139; x=1790258939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fuwZyOKS0xThCnh60yYa8+8i54h/f9HpMrDJGJMC0k8=;
        b=Jx4wynr7Mii3kY8Mo/9kniP9rWgceddmRMOakY4kw7koAlIcORUH/+5/eMFGLrVf53
         2ffO+cYrw1WqNwmbflIgjk0LMQzEhk1bt1jC7dxli1LryLmnYf6R+3p+ZgY5BC4J/vA3
         /V5Z4O+igm1fcqUOG0SBrrC3sJYYmM6A72FWtcAsh/qALKakXoNlN50ySR4g6yvTzc1w
         4oUyMCiBfoa7TbPXjKkp0xo85Xl6nJ7GnYx9os+kSxQXqnh+5V2hYclEmN8vwN9xMn/i
         eretc7EzvlrWhngj0EMFMGCof9s4+vZD+1tL3YdXPfe4qwXFGn7NKn9nS7lvS0I2LLFb
         +XZg==
X-Forwarded-Encrypted: i=1; AKwUvBxs+ADBmtxbZGfGMOuZte0qBRthWao18+td+2GYu3/ZGLEt+xj9BASNGDh9Q4gXV1phVg24rYbj/cAtMvE=@vger.kernel.org
X-Gm-Message-State: AFuF++m6mnlbQvuE6c0/WksGeRT6PmSH3rYo0J/jKvO9Eg9wo3eKhbB9
	BjlKrh/Ez/jaPZNE9WhdMxPZQ8ZHVqkcvDfEt2AgX6ebZq2FvC8FQmlY3D+tFo7vy9zwNz72nmi
	nF6oWsoKM8mX526cRReLSwaFIFb/Al0fkLmvyHGbcXw==
X-Gm-Gg: AYBFou1NU8dkVKsJF0PKR3EM2+P48r/Ll55N8QMH7trApBqbBXKxCHDt5qn2yV7EAvc
	DlpcvaBbLIDoYxVALQhPVaIKAGr0sbCp7QvI33XryKYnEb8f4ZjMv083UnXnzywfsYC4S2khMcp
	nXfH350TtZyUKjDcbVlNUMTy3XajVcXnGN0zpjahDh4g31wxmW4iYA44REu7cBwL93pihd5s7tA
	L+zJxpCSXitBGSRYtfXcdv8cX1aybS+DOuXCQLPOJFZ52HHJjDs+6xiVImY7V8QJ6TSNnWx/KJn
	knDCQMGl5s0TNcPziudP3PAUXNZGfDsvAgEi13n6JUAABD0435gVlw/ZPx59mKTUlAsRuogS6PI
	bwfkg3ELIY03x
X-Received: by 2002:a17:907:5c3:b0:c29:f5d5:5aa2 with SMTP id
 a640c23a62f3a-c29f5d56248mr258521666b.44.1789654138594; Thu, 17 Sep 2026
 07:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916100116.701206-1-christian.loehle@arm.com> <20260916100116.701206-3-christian.loehle@arm.com>
In-Reply-To: <20260916100116.701206-3-christian.loehle@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Sep 2026 16:08:47 +0200
X-Gm-Features: AcwNN1UJjmtR15ewJ-APy9nZbXkhGXHb95ciuePXHxxAELF263ovQ5vbCxkkXy4
Message-ID: <CAKfTPtCAaACP8A=AKGO3PdhZtA9SRM6e3ym+5d=Qfp-VpDa38g@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Beata Michalska <beata.michalska@arm.com>, 
	Elif Topuz <elif.topuz@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Shubhang Kaushik <sh@gentwo.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:01, Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
> slow-path selectors can choose the same CPU before either task is enqueued.
>
> Use reservoir sampling in the tie branch, resetting the candidate count
> when a lower advertised exit latency is found. Use the per-CPU scheduler
> PRNG and reciprocal_scale() to avoid variable division or a second scan.
>
> This reduces deterministic convergence without reserving the chosen CPU.
>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/fair.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ff5793bddc35..6836a8364440 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -24,6 +24,7 @@
>  #include <linux/mmap_lock.h>
>  #include <linux/hugetlb_inline.h>
>  #include <linux/jiffies.h>
> +#include <linux/math.h>
>  #include <linux/mm_api.h>
>  #include <linux/highmem.h>
>  #include <linux/hrtimer.h>
> @@ -8459,6 +8460,7 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>  {
>         unsigned long load, min_load = ULONG_MAX;
>         unsigned int min_exit_latency = UINT_MAX;
> +       unsigned int nr_candidates = 0;
>         int least_loaded_cpu = this_cpu;
>         int shallowest_idle_cpu = -1;
>         int i;
> @@ -8482,9 +8484,12 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>                         if (idle && idle->exit_latency < min_exit_latency) {
>                                 min_exit_latency = idle->exit_latency;
>                                 shallowest_idle_cpu = i;
> +                               nr_candidates = 1;

You clear the number of candidate when you find a lower exit_latency
but !idle CPUs that have already been checked will be cleared whereas
they still get a chance if they are checked later.

> -                       } else if ((!idle || idle->exit_latency == min_exit_latency) &&
> -                                  shallowest_idle_cpu == -1) {
> -                               shallowest_idle_cpu = i;
> +                       } else if (!idle || idle->exit_latency == min_exit_latency) {
> +                               nr_candidates++;
> +                               if (nr_candidates == 1 ||
> +                                   !reciprocal_scale(sched_rng(), nr_candidates))
> +                                       shallowest_idle_cpu = i;
>                         }
>                 } else if (shallowest_idle_cpu == -1) {
>                         load = cpu_load(cpu_rq(i));
> --
> 2.34.1
