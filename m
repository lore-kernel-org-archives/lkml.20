Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6339023A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048151; cv=none; b=qpiXOoNe9+no+jay9X8optc1vIpHHE0mm3MlTEQ6oLbkKGZFW0HVFG8vGO0JCRYk9q4+HmycaoRNKcj79epa7tGOACn0uDnXk0ZtmheMU5AyIo3OfVofXcuDNgVhVjdZ0MHapB3UIE4/VoZJ194zb4fka2bq997z2R+6m+5zAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048151; c=relaxed/simple;
	bh=SInxWx3tkrmyHp0bwB6l/yKqRIt1o4L0IWu1/WASAbc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqKeemQiwNKuuD0Ws3vRQvHl8jw86Dqj6d69tOjTvopqJlJwUB77EoHEyCPE9QEhaE/GXYEnntHUifkai1wPmlBiXv3EUmehry86uWQyCEg0WnTAzEEHlO+oHh5EKK5vvxWfoV9KS8Kgd/hcbJwQwC8v7QFHQ53x/0UbsgeZsKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIr8rQLI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIr8rQLI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a166199820so1931835e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048146; x=1791652946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nTRjVXony/HFc+7g3Thxno/weq0zK7fY6ESErYGxU0w=;
        b=NIr8rQLIakfGnzb922K02mQGdhSVJ25kg4jiDrsvGDNYErwGb9yTBVS1b9XtM9hQEr
         wleJdfbcN3ug6gaLyB2LzIagzIBbRG+OBeoK2xsYZYR87ipAoyKfCexdpOKdWHhaRbyp
         JrJBlg6YKYRXvJ3GnHQKOpWl7lqDbR9U+G96sZAF2kOaXanG0Z2CAA/BYl1gCo+9jLpp
         jQtZ4KN/kIvZGtFn7+MIRYA9ZhyIWmCx9PDC9rLPQu1MSve+HDszpFKCo+//ZJOpg4Ye
         4u7ofLagV+NQdtH5/Tcs4nkIEj0bV9CRTWB/WzjW8VQ/9rTJYePSLlOiMTC/bmiXwUcw
         Nesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048146; x=1791652946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTRjVXony/HFc+7g3Thxno/weq0zK7fY6ESErYGxU0w=;
        b=0QT2iSEtP52rE55jhFYv6mfI3n4auFdgd6lk4r/mifi+hXmNdl7aEMr7+f0Q1a5WWK
         dK8lpgSl3Zn7aIPhPmU3Qj1S2zHkBagTVyrDQ1YgDJalWIfXrScqA2C3a68roQYg9W+T
         8GHdla9rUorxQjUSNcfAUEZ/gfYGrxdg6nhBT42CeaS2ysGAV4QYzTfeDAVdDv/TQea3
         9Tl0Oo/Jj+En4ZgfIb6nJpVEVTQg2CsbfaZnevDjCGcdQUueXEsOAF5Icc1aLI6NVKtK
         88Mj2M0uQVGzUtIiaAPRhpP66h1EVLRo7SbPUwUOGwCLGGr/VUBdehF8lcCZvwQJjknU
         y9+A==
X-Forwarded-Encrypted: i=1; AKwUvByajpgDqgOVwfNyKADrlrN/1nV7+KLfHUvR7SsvvoJ6mcCwecBs3QAniixCoVyL4AI1TmsUYPJuNABaqBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kdiAK37tlECZMTvpkua4huibjvB3yKe6jjoHBkW79PrUKd/edH
	tm5Co/YyIZ4QrW88jVCxXP2lwwssqcemo5XfkshR3sariOYDlUgSjNBj
X-Gm-Gg: AYBFou1BsIvA3PcyQoOLH4jxdh5qLb0zumLHwJjoVYzdUKS4DPgK68CLOPVoQcT+08W
	P11sui3LAbZhNACEqCHPT826Bmcl9U4YaBPuRrCmbLvEsrRuW5CR+O9EqDvjBS/XeQdvPTL4y2t
	0ZvjLUYi2VHuvScR3mPoqUNX9lJ7dIoCZGDqSTBQ7l6o3DFxQm0lSMakdKLR7GP9T+6psRJ5VIB
	vZvtDNAPBA9PTvtHwgekSL200l7HhaI/ypSgnmr0ZOUuXOyZBeGRomE3nMATxo/kK2skm5KkoyY
	09sTMnsouwzBQzDdy7jiStwLAgYYEa5b0nss/gUh0nsQq17rk9DYj5V0C1BtZlgyL48Sb4bT3Ph
	uFweHmJ/wIHh1m85FjcO/FE/w49krB4XZ5F5whL6cecnKHpQHU+BjToGvKHva2M6ULQpzthWcJD
	Qd9jwzVz9rqvAEshB+wiPL80GEZcXCW8E+S4L2QT3/lS+IGjyQMC+dj+7MgFeW140pVwqH0CxQ9
	zaFkZVlGX/wncK14UjLf8EvZNlBHTfBiuM=
X-Received: by 2002:a05:600c:190c:b0:49f:fe89:efca with SMTP id 5b1f17b1804b1-4a165f934a3mr72638835e9.19.1791048145671;
        Sat, 03 Oct 2026 10:22:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm14387423f8f.37.2026.10.03.10.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:22:25 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:22:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <20261003182224.2171b574@pumpkin>
In-Reply-To: <20261002012141.7-1-bbnpreetsingh@gmail.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 01:21:41 +0000
Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:

> KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
> under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
> WRITE_ONCE() are enough.

I just looked at change_pid() - isn't it completely broken?
__change_pid() uses hlist_del_rcu() to remove the item from a list.
IIUC this leaves the 'next' pointer valid to allow for concurrent readers.
I thought that had to stay valid until the end of the rcu period.
But the following attach_pid() adds the item to another list.
I think that means that a concurrent reader can switch lists and thus
fail to find an item.
This could be (mostly) mitigated by using the 'nulls' variant which
lets the reading code detect the crossed lists and rescan.

(I've not checked the history...)

David


> 
> Reported-by: syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c382ee653fd70f5cf1bb
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> Compile tested only (gcc W=1 and the KCSAN instrumentation diff); I
> could not reproduce the race in QEMU.
> 
>  include/linux/pid.h | 2 +-
>  kernel/pid.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pid.h b/include/linux/pid.h
> index ddaef0bbc8ba3..05a0084dc9537 100644
> --- a/include/linux/pid.h
> +++ b/include/linux/pid.h
> @@ -264,7 +264,7 @@ static inline pid_t task_tgid_nr(struct task_struct *tsk)
>   */
>  static inline int pid_alive(const struct task_struct *p)
>  {
> -	return p->thread_pid != NULL;
> +	return READ_ONCE(p->thread_pid) != NULL;
>  }
>  
>  static inline pid_t task_pgrp_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 95b8ccfa82690..adf7216067684 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -411,7 +411,7 @@ static void __change_pid(struct pid **pids, struct task_struct *task,
>  	pid = *pid_ptr;
>  
>  	hlist_del_rcu(&task->pid_links[type]);
> -	*pid_ptr = new;
> +	WRITE_ONCE(*pid_ptr, new);
>  
>  	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
>  		if (pid_has_task(pid, tmp))
> 
> base-commit: ed14a591175bb5f56c2936b082cffb9e4b935e6d

