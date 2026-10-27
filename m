Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126908;
	b=mjof+vwec3VkKS8HFdEaY1beqo1vRGo9FmStZTU+83ni9XJFIT8ZKLcpcbbtHla/0hLY
	 1uj5eccL980FfJzMemXIQ3JAOONSQ3XvljgJ+vetRz2axFWcpBvSADTErEhSQuBXA9S1Z
	 hC1OOsKxj0B7EdDnAblOBZQI1TsK2d+26KRCf3tuaXslhrUcqGFRuLDr/2+sLKf0w4NMH
	 HmMmYsDnVmJNqVqq1TJL91lVjhw57KNL+qJjhu3ipXPOea7w2DrUM5ZowmZWjZc2cyW94
	 I9BKw6ZgNraAhYf4hqD4ow6Q69VpIhCuu2CQzZ9jIoOo2Glby1mGae4GgZzuUMPYa4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LSFaznbuOQ+uxmdx/4va9jmv6eJhsUjrnyeRc7YdC00=;
	b=yJ5Iweok/pVCTdGGXnt4SUjL8ahnGcS5/QMY9zabD7T7BCcTAJu7QMKI5P+Iwy+R72Qq
	 yK35MbEun5GRbPR6YU5kSQZzbQhxNC1adNKnVX8vZgrJMQEReCTzBFRD5Yb+/DE+FGIgT
	 9zvnHPWKZ3Cl7UZY0jCGBFTnK8T1OF6u4wLNXqhlLoDn5agIig9d/2eQZwKO4G9FDBrcU
	 JLPJyCiJeGaDgd2jGesY4UpyA/5QXFs6ExgzG0coYeCfyble34QQhQFf9OxGOd8JTej5N
	 zYr6MmeAMDpnAcQJKgy41jiCvsedDINKzerR74xJIhghXWZUBSwvSPEhbf5r6DqLy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nw5rrMdO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074F606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7074F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nw5rrMdO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1491865e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126906; x=1793731706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LSFaznbuOQ+uxmdx/4va9jmv6eJhsUjrnyeRc7YdC00=;
        b=nw5rrMdOp0TYEl9JoKQnemMC1gMbq2N680wtMJPF/UINyy1xhTQ+raluWjIibAUI5B
         q6LzZemepo/DuXqeBqZWNHXnoIhmAUAX9SWiVbhJ4DLMLNDRFXwiC973OCYbpe6eqws8
         aHCj3srVFBes9syZDCA+HTNf0EhPz6l453dWlWqMldIYFQCSQ3IC8sAflSteWvlmfTGv
         QJVo95j9BStfCM2hovZru3ovVAX2cRBY2MOBNT6nSjPQWCcTfsiPjic1zLH1BcwFKOQQ
         wyBt3n2uFHRULjRBDdY4guxXWlrhyyR5gO01GoT4ZvrUYlIgm9BaWBvQEgDEijK+JFuK
         PXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126906; x=1793731706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSFaznbuOQ+uxmdx/4va9jmv6eJhsUjrnyeRc7YdC00=;
        b=IaEKmvemlg0VWrsMsGC05KcKmGAG/V2O1cjbXe72LSRJu/OEsqgU6zgN7wWn1Ccrmk
         2b7NS5xqNEXddSReW1PjPusYB0Xzt+YT0DJTNcbVw7WnZZdvc7nR2oNAO/2ry/5YC74D
         iXLRZ4+lmMgPTIU6jaXSqHJMvcddfMx8Ib/cN+GFLJJWy2REI+TGsopp0hFaPXTuDN7h
         r5Sve/zMaLi1EK1FyHeQClg5OVPCVoKpE3tubZtQR1GdzwOsli7YIt0mHE91yzUd5jKj
         MJYodrXCk7MnulOkFK8LSLo8NoNbuV5hw8GPqaa1BwUWUSldu2r6oU0LrPD/ssctTjk8
         l24Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/9MDVmQMLRLP2xisql/igL8RjsAvNuTQFT+wyIbzuBGmOsJ0BK59RfyBqBZk12uf/Q/f10pKKqiqRVnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEsEjrZOvk2MS7/e9sKnNJ8n+KmuJXTCANSJ6L1FxjNyc/Sy7v
	gQMqALqVm0BO16V36v+XRmcHRnPahqgDlSWgcVvys8H9YIZIdkNUbgoY
X-Gm-Gg: AYBFou29joWFdWtOW5xskcjyGgxsSwqJfCtqVE7edWh3gGq781LT01aAmOGmmqHyA0t
	TMJ++nYSAj3CFU2iFDjF3OaCaW80fWbRWJvpm5fn2KurWy6yIXaQUpqcPhqpg/aKBq9lQRUe7B1
	xtly/HcRJfADjpNJeXkJoiax2mJgHTWIzxbqEacLvj02ixx7ADHlyLgRZCdrYjmCpzVKZCEKvlG
	zfecs2be5f92F1I2A+MLpCf04xvksIAYoISYhq0WCwuG9yFtpBks68UDYlACphWUhq2qGpcjroF
	DbSts6mXxpUm478TfZhhw9c38dWuE0egxWXZbQmwvcUveFH9zm+vJ02uUkL5RB09tlsvrg6enZH
	hjvWLm2p1rBnSkQEQdKRb91Kb33yessdVG264/PWYlZGcvoGUOHHGjXrWtlquO/3UjmNrRoOT+T
	fy0KS3EiSkoDThZxeLR6vZW7oWVtfkDA7ltZRNSrcrhd9Br2eQg3ymPUiXDu+R1GeQLSLEhV1I4
	G5Gkx4iLkUZgEs7SBASK5tao110bOGRjo0lvWZg1gKeFZuUjReRvR8j5efusBJb8TI6DyxE7oqV
	6dcak+CvXrh/Rmpupvg=
X-Received: by 2002:a05:600c:4704:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4a35acb115cmr224336505e9.20.1793126905543;
        Tue, 27 Oct 2026 11:48:25 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9493bc4a8sm4645705e9.0.2026.10.27.11.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:48:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:48:23 +0100
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Mani Tofigh <mt4022@columbia.edu>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Mykyta Yatsenko <yatsenko@meta.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: Re: [PATCH bpf] bpf: Fix bpf_timer callback running on a freed map
Message-ID: <auDx91tmsF-aKKdz@gmail.com>
References: <20261027-bpf-timer-freed-map-v1-1-30402b0ee99b@columbia.edu>
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
In-Reply-To: <20261027-bpf-timer-freed-map-v1-1-30402b0ee99b@columbia.edu>

On Tue, Oct 27, 2026 at 01:03:42PM -0400, Mani Tofigh wrote:
> A bpf_timer in an inner map can fire after the map has been freed, and
> bpf_timer_cb() then reads the freed map:
> 
>   [   50.709520] BUG: KASAN: slab-use-after-free in bpf_timer_cb+0x249/0x290
>   [   50.709540] Read of size 4 at addr ff11000003bc1030 by task bpftimer/72
>   ...
>   [   50.710783] Freed by task 12:
>   ...
>   [   50.710826]  bpf_map_free+0x1a2/0x380
> 
> When user space closes the map, its timers are cancelled and their
> callbacks are cleared.  Since commit 1bfbc267ec91 ("bpf: Enable
> bpf_timer and bpf_wq in any context"), bpf_timer_set_callback() and
> bpf_timer_start() run without a lock, so a program that found the timer
> just before the close can still use it afterwards:
> 
>   Task A                  Task B                  Task C
>   ------                  ------                  ------
>   bpf_timer_start()
>     finds the timer
>                           bpf_timer_set_callback()
>                             finds the timer
>                                                   close(map_fd)
>                                                     clears the callback
>                                                     cancels the timer
>                             sets the callback
>     arms the timer
>                                                   deletes the map from
>                                                   the outer map
>                                                     map is freed
>   the timer fires
>     bpf_timer_cb() reads the freed map
> 
> The timer is cancelled once more when it is finally freed, but that
> happens well after the inner map is freed, so a timer started this way
> can still fire on the freed map.
> 
> Clear the timer's map pointer in bpf_async_cancel_and_free() before the
> map can be freed, and make the bpf_timer and bpf_wq callbacks return
> early when it is NULL.  The map is not freed until callbacks that are
> already running have finished, so a callback either sees the map while
> it is still valid or sees NULL.
> 
> The reproducer below calls the two helpers in a loop on two CPUs while a
> third CPU keeps creating an inner map with a timer, closing it and
> removing it from the outer map.  This bug was identified and confirmed
> with the help of a deterministic hypervisor currently under development,
> but the non-deterministic C reproducer can typically trigger it in the
> 1-50s time range.  With the fix, nothing is triggered after 600 seconds.
> 
> Fixes: 1bfbc267ec91 ("bpf: Enable bpf_timer and bpf_wq in any context")
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>

Tested-by: Mahe Tardy <mahe.tardy@gmail.com>

See below for testings details.

Review-by: Mahe Tardy <mahe.tardy@gmail.com>

For the review part, I'm not a concurency expert but this looks good to
me, bpf_timer_cb() should run within RCU protection from the softirq
context that calls it and bpf_wq_work() is explicitely calling the
rcu_rea_lock()/unlock(), thus:
- the callbacks read the pointer before the cleanup clears it: it's fine
  since it's not freed yet thanks to RCU protection (and for
  bpf_wq_work(), the read was moved in the RCU section).
- the callbacks read the pointer after the cleanup clears it: it's NULL
  and we have new if (!map) checks so that it returns early.

> ---
> This is a different use-after-free from the one fixed by "bpf:
> Dissociate struct_ops progs before the grace period of the map" in
> Qiliang Yuan's v6 struct_ops series [1].  There, a timer callback
> returns into the freed trampoline of a struct_ops map.  Here, the
> callback reads the freed map that holds the timer.
> 
> [1] https://lore.kernel.org/all/20261022-selftests-bpf-struct-ops-assoc-timer-v6-2-2c0f18e82582@gmail.com/
> 
> Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/bpftimer.c

I tested the reproducer and indeed on bpf-next HEAD (which was
4169c9c90532 ("powerpc/irq: Fix build with CONFIG_PROC_FS=n")), I could
reproduce the issue quickly:

	[+] bpftimer: bug: the kernel reported an error after 275 rounds, 0.5 s (taint 0 -> 32)
	LB-RESULT bug rounds=275 seconds=0.5

with: 

	[   16.088731] BUG: KASAN: slab-use-after-free in bpf_timer_cb+0x205/0x270
	[   16.088772] Read of size 4 at addr ffff888138615838 by task a.out/539

And after applying your fix:

	bpftimer: maps and programs loaded, racing for up to 600 s
	bpftimer: 17794 rounds, 30 s
	[...]
	bpftimer: 350440 rounds, 570 s
	[+] bpftimer: no bug in 369186 rounds, 600.0 s
	LB-RESULT none rounds=369186 seconds=600.0

> ---
>  kernel/bpf/helpers.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 648abe1ba63a..58e357302850 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -1221,7 +1221,7 @@ static void bpf_async_refcount_put(struct bpf_async_cb *cb);
>  static enum hrtimer_restart bpf_timer_cb(struct hrtimer *hrtimer)
>  {
>  	struct bpf_hrtimer *t = container_of(hrtimer, struct bpf_hrtimer, timer);
> -	struct bpf_map *map = t->cb.map;
> +	struct bpf_map *map = READ_ONCE(t->cb.map);
>  	void *value = t->cb.value;
>  	bpf_callback_t callback_fn;
>  	void *key;
> @@ -1229,7 +1229,7 @@ static enum hrtimer_restart bpf_timer_cb(struct hrtimer *hrtimer)
>  
>  	BTF_TYPE_EMIT(struct bpf_timer);
>  	callback_fn = rcu_dereference_check(t->cb.callback_fn, rcu_read_lock_bh_held());
> -	if (!callback_fn)
> +	if (!callback_fn || !map)
>  		goto out;
>  
>  	/* bpf_timer_cb() runs in hrtimer_run_softirq. It doesn't migrate and
> @@ -1254,7 +1254,7 @@ static void bpf_wq_work(struct work_struct *work)
>  {
>  	struct bpf_work *w = container_of(work, struct bpf_work, work);
>  	struct bpf_async_cb *cb = &w->cb;
> -	struct bpf_map *map = cb->map;
> +	struct bpf_map *map;
>  	bpf_callback_t callback_fn;
>  	void *value = cb->value;
>  	void *key;
> @@ -1265,8 +1265,9 @@ static void bpf_wq_work(struct work_struct *work)
>  	/* keeps the program that callback_fn belongs to */
>  	rcu_read_lock_trace();
>  
> +	map = READ_ONCE(cb->map);
>  	callback_fn = READ_ONCE(cb->callback_fn);
> -	if (!callback_fn)
> +	if (!callback_fn || !map)
>  		goto out;
>  
>  	key = map_key_from_value(map, value, &idx);
> @@ -1733,6 +1734,8 @@ static void bpf_async_cancel_and_free(struct bpf_async_kern *async)
>  	if (!cb)
>  		return;
>  
> +	/* Callbacks that run after this see NULL and return. */
> +	WRITE_ONCE(cb->map, NULL);
>  	bpf_async_update_prog_callback(cb, NULL, NULL);
>  	/*
>  	 * No refcount_inc_not_zero(&cb->refcnt) here. Dropping the last
> 
> ---
> base-commit: 195a3519ff27bff5575e05b5086e38ee92715776
> change-id: 20261026-bpf-timer-freed-map-ab8dbd268b51
> 
> Best regards,
> --  
> Mani Tofigh <mt4022@columbia.edu>
> 
