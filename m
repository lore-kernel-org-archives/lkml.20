Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861756;
	b=YNFl9W3a8W9757I2kSEBgFCQjMNzqkEsTbojOPf52fHF9JWRwsXOFM1g6DS37pWGSE9z
	 /LAzD1SfcONw/Dh3+pJdaHj2UbotOGWRw9LT0fsxl36+RVhMImluqte1K6IraQn3pHBt3
	 fHZsRJ4vw5g3353N6v5IZrqZ22OxIntt+xcwcC6mpbAuDqfJVm02pIH85qhG6/16GEZo/
	 nKyD1E8XSe6jB70oss1acEazaYxH55tRPpa4dNXxmkaMae/k2z46FAnlBx7XPunPuBrdL
	 LRoDj7vtiW8GPR9GWJqz06IV9THwxVBzyVZsA+NVMqmxxy2G60J7vNXW/j+Iw7eCE3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
	b=lBjfdH2XdHiLfHQ0IREM0yrniwWYtnfmeymoisgXFVDEMmtyYgeyLYezvwO9M7pTaL9n
	 Piahjti2W0XH05nb/5tqPe2BmW9RWGf7ZnT1Abzf7gmsnOMOoY2B8BQRqdhwQt4fr+W6E
	 6BdtUwef7ZinH4q+TvRDIivK4yLW23vT/JDN2Zl7Qt1fZX1V8dM1nOoXCGAuLNRMLfZKk
	 bR9lx3BwtL4LH3S1g9kjS8ua/kyRhkRLW5Pv5SlYt6yInDSk1SUznl2EYnYYryhWgLRdn
	 6Jr65fP9bssa3jqS/d1CvFlEo/gY4iKVYz4Ug9msHG2QS6FQ6JJ+NYfWTAc72GE4jhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH1BUmHd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH1BUmHd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15675585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861754; cv=none;
        d=google.com; s=arc-20260327;
        b=HmtFW0X3ZDGWzQqa2tdRT97lq0qG87bu04RYMoRqerPh0whlgn0xZ9dzRW78TWfHCL
         Po4NF60WwyTMGgXs6AB7AOMZH+1tJVDPjlmr6XC8IrZ8spnpaWN1r7YGUSwwdn41lgqj
         arKl1Z9/opAhEQWZScxqdAkx94/qoN6GYWTu+6i6YxCfYbEKA9BMcnijSAHaifO6YTtW
         p5jZzcO0+MGox+Dnk+fHWHMVzQBE5NRiGrvqNzad94WfydNdh/XsWmIOWv8MhYQAVM9s
         qtFhIP4BTsqQ4NJ+7GU6qu+tcZu6IabJdZVgk5uAcywgvg5uaNRNrY27/xWha5kfJjWY
         5n+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        fh=Qjh/k1/MQmTbJnd+dooULWEoQEUwioXXTfVgBXWW6Do=;
        b=RSTXSoKL9CvHUYgVeBFNYzw85durfC7lFsA4NqlpypeAuUCizskRrp92e/2R1sgPfE
         tSApmQaualcQHZ5aA40RxeV0Xy1rwCvDwb8UbkOOqNOSfTsH2Z4PvT3sIGAB8CIE4XVp
         sh4PD8tR0Ui1OOCQ/tScjHuR5mMidOUDfl3AlXn5us9zTlM1b8Z5WiVqqFiZoqJuO6GK
         SB73nBMRLqyXp4ZyXu5E3R9vIFggnZzh0q/AgrDG5O48H0TVZVySjzDrcBfF5QGGAd2D
         LpFniNSFuG+KTb6Diaog6bZfpNhMBm2aV+Ea6BRtm2M2Ns+OE3MKzOzA1DtEit/+H7GH
         wg5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861754; x=1795466554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        b=OH1BUmHdkLVvo5XqEhrxPrfinhRJCfHDY1Ua7J137Jymq0ov1k98UfeqrH98bSmMk/
         l9prjLcCD2f/CMQtMRY3T8XpEh7Q2XBigRGpf9kONp1ztl+XCk36TgtgvFZ8q0doH6/u
         IsIJ6t+TJ50L1z476FiVSvkw13iceswQlBRjSVvQGI+vrTVCz2StTytHEsIqm1iRigos
         NuNDnm/mMHuSvxgtkZ1lPfE+2QJZU+5ClgF2ZdAkYPVnqKnuIROoKuTQMHU99DzCeI7c
         zSMlQQtHNJFONlKnMN7vVYPDTY+5tJGA0J4kVVNQ0ZChtFvFdJggsx0ZRzl3Vyw/BH7Q
         egOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861754; x=1795466554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        b=c7Lp+676QIzaij0KpjUmAV9yPT978/bvsG840lG9kPuJcuDHdoZm/UM7RRvtewKAkB
         X/7JLAIra7V9gMM3dPX8quUo8Dssg5vf4J+CJOIMFaIwMMLsrqvFJCBiG/C72MEYci5I
         IA1Szwxj6iePUkPuqxR1oadfsUrYkf8wBLjexWFyG9cTWIxgTcD8CPRnblxRH7HPm1x7
         yfhBx3jCxoPCh9lsDjAZTleK3q8drXWaXg0wJ9i95yXWx08vvIxsk542zqZniqVhpZTB
         5z/fhuF+mqaOPjz9yiIy3rFYPpyZA/fvsnZCdByF6t+GueLBLfA7CVapBysM56SZRyu+
         bUHw==
X-Forwarded-Encrypted: i=1; AL+hErEEciNjBSSpDCjQXHT/wFfEstmQcqDzxbIwhkXRXqdhCA0Fx4S9JBUVSK+5hKehpeIgDA+nMus8hmqwNYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rnn+/OXE8Pd/xJR+GuzYC+g+RtNWSV0EbbSh00xgQ4fWC3chb
	IgGNDuY1IqqKC1NtHDLHGRgyAiforci/NxlDwN5G+H3/CYyJ4t6BErfWRFP61rNGJlL8tDsbzL7
	BLS2T1h66QNzfkyc4/WdwP3H7r/3JrIIn+rs5ESM=
X-Gm-Gg: AYBFou3D+osn/oZNjeqyTTE3mO/JXRJqDzg7XRT3JmiHedXX0JqY6lRkOIs0FZxpZmE
	d3Mf/6Q4StXcNFTv/ajwbAdjLd6LWo3k2Q3dGnGuaMXU/wOHwYFqZh5taPPMXmoFquVXeLOEFlv
	n092zOWtvu0v/liytWk5te5Bz/Jgy1FLagLqChAie0p4y+75tmcbYMPkKCKw88psHeJZKmbiknX
	+iJXyTXm2d/jy+CzJ87ZTRi6dy7+pY/FN0JK3VViRYaF1LbeoW1UP+HwUva7CqCFvVT/IpgxMe7
	NSVlGt60kbugmTbUvnwdPgEsVrsrE3vXI9MooWPyJzUSnaXZ5nO3a6GbSaWw34FqXV3F9A289dy
	F3uf14UwwY1dNYoSy1vVYKJOFFc0wCe3WNpj5Wq+ruY2oyHhHzevPMz/MOsNaUKPA2r95yHRVck
	gy3UNmhA988bTktyNBp/Ot2voKYC0K7AKclX2FwM9NWBx/r6QIDwSYhFs78wj0DA8AK0Q5EpHGd
	V4T/EySyThB4kLRCBPX7dzX0wHH4uiUoAZyMA1DxnonD4+nVGJEJQ==
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id
 5b1f17b1804b1-4bb6cefd40dmr114558095e9.2.1794861753742; Mon, 16 Nov 2026
 12:42:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:42:21 -0800
X-Gm-Features: Aa3M54p9MomemKYMLSYPkFUiZv-e1UrVLPxsl86D1ig5CGhfzaTiBH_yWzJWZKs
Message-ID: <CANDhNCpQ-fyUJRCy_6twENoAy+1yGHaWN8dHw7VbUz6Qn7wqhw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/8] sched/proxy: Tell the class about a proxy migration
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> find_proxy_task() moves a blocked donor to the runqueue of the mutex
> owner. proxy_set_task_cpu() does this with __set_task_cpu(), so that it
> can keep p->wake_cpu, the CPU the donor returns to.
>
> But __set_task_cpu() skips what set_task_cpu() does around it:
> - the migrate_task_rq() method of the class;
> - the migration count and the perf event;
> - the sched_migrate_task tracepoint.
>
> For a fair task, the dequeue on the old runqueue detaches its load.
> migrate_task_rq_fair() would then reset last_update_time, which makes
> the enqueue on the new runqueue attach the load. Without that call, the
> load is attached nowhere. When the donor is woken, the return migration
> goes through set_task_cpu(). It removes that load from the owner's
> runqueue, which never got it.
>
> So each round trip of a donor lowers the load and the utilization of
> the owner's runqueue. In a test, a CPU with two tasks that never sleep
> showed a mean util_avg of 195, where 1024 is expected. schedutil would
> then pick a low frequency for a CPU that is fully busy, and the load
> balancer would see that CPU as nearly idle.
>
> Fix this by doing in proxy_set_task_cpu() what set_task_cpu() does
> around __set_task_cpu(). Tracers and perf now see a proxy migration as
> a migration, and nr_migrations counts it.
>
> migrate_task_rq_dl() moves the bandwidth of a task that migrates to
> another root domain. "sched/deadline: Move a task's bandwidth to the
> root domain it runs in" added that. A proxy migration must not do it:
> the task does not run where it is queued. So make migrate_task_rq_dl()
> leave the bandwidth of such a task in its root domain. If its wake-up
> then picks a CPU of another root domain, the bandwidth moves at that
> time.
>
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return =
migration)")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c     | 13 +++++++++++++
>  kernel/sched/deadline.c |  8 +++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 24105eeeb3c7..5d82c343662f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6967,6 +6967,19 @@ static inline void proxy_set_task_cpu(struct task_=
struct *p, int cpu)
>          * was previously runnable.
>          */
>         wake_cpu =3D p->wake_cpu;
> +       /*
> +        * Tell the class and the tracers about the migration, as
> +        * set_task_cpu() does. The fair class then attaches the load of =
@p
> +        * to the new runqueue. Without that, the return migration remove=
s
> +        * load that the runqueue never got.
> +        */
> +       trace_sched_migrate_task(p, cpu);
> +       if (task_cpu(p) !=3D cpu) {
> +               if (p->sched_class->migrate_task_rq)
> +                       p->sched_class->migrate_task_rq(p, cpu);
> +               p->se.nr_migrations++;
> +               perf_event_task_migrate(p);
> +       }
>         __set_task_cpu(p, cpu);
>         p->wake_cpu =3D wake_cpu;
>  }

So I've got a pending fix from Yu-Ting in my tree (apologies for the
gerrit link, I've not cleaned up and pushed my tree out yet) that I
believe duplicates the bit above:
  https://r.android.com/4410518


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 3b62ee43c209..d14ce3615ba6 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3030,8 +3030,14 @@ static void migrate_task_rq_dl(struct task_struct =
*p, int new_cpu)
>          * the bandwidth. A mask can hold CPUs of two root domains, and
>          * select_fallback_rq() can widen it. Move the bandwidth there, a=
s
>          * dl_task_offline_migration() does for a throttled task.
> +        *
> +        * Not for a task that is blocked on a mutex and only queued for
> +        * proxy execution. It does not run on the new CPU, so its bandwi=
dth
> +        * stays in its root domain. If its wake-up then picks a CPU of a=
nother
> +        * root domain, the bandwidth moves at that time.
>          */
> -       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)))
> +       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)) &&
> +           !(p->is_blocked && task_on_rq_migrating(p)))
>                 dl_task_move_bw(p, new_cpu);
>
>         if (READ_ONCE(p->__state) !=3D TASK_WAKING)

I may need to pull this bit in separately.

thanks!
-john
