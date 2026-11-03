Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720781;
	b=Psz5UW43zWErux4+/6vA5KHe7CdxDrfSjjP8m7smjDU9yAfIqN5vyCKWw20AFZTHfDAK
	 OaOpdwLnFwGuUP9FdfZVEy1eqIVRuX5nefsSvyMBRUVU3yEQ+e2nDOBCpwGB2U120Lhlx
	 ckVJpHjJ06hQGDwyUpb8eaRZSs2mzMeQUOZbFekT+gFKg31DvduKXvHRxyCcRTXsF/QxH
	 WjrVtqPaxn+tssneRpRR4DM8x6pd7DA+PoPlPX0yki+a7Rvz9Mj6U4z1VlISzx5M3r84b
	 xUmjwRCE4M3RV92YK4lE86oZk48H11KjyOIsp95dBtsx5BHPK14wDlkaScQ+3Db4GIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XqVrl/eIhgH1AW6P2fdddm80pjg0IUatGliczQKyBXo=;
	b=XY4Mr8x3de8rITbNrNbLHPunfg1xex1QHNz6m0VIxAShAXDQUcvl7I2x3wEeNqIPgtNE
	 n+uDt9IXDKGvamnAQOLjnFp+txQsPhgnWXWEeJo2amR84OMdO9SyouxxZGDm/WGKuUyKA
	 UtGM2eaovcfIyqvCP9GsDnMz9EE7SoicpvxKsyGyPXq7dW7ZILMm7E4KOXUX7+IcMLHAq
	 1SogyMuVLaYmnZyo9bapxprkk7jtrh+dwT1IGqJfoWOkZZvndiJMSSmxPeiFPx4TxxtTU
	 C90tGo+lJ1HyemSobCG9uX0uJmX3+gbemVfyfUJoTO2AQFGqYpPRZWC1lK26AiJ9p2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EVojxrJq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A2606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EVojxrJq
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso6378186a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793720779; cv=none;
        d=google.com; s=arc-20260327;
        b=XkyTO4fLqb3Kpu42qi20iYP5ecm3OAypH6odis6vw8Ki0A9UYQyAtSCPf5moGZJHvE
         6+iYxRAVyFBaFqPAGF/KYq+VS7QAQl0ACEPI6A8zM+TIlAQtgP5Uu8iKubNBDP6w2G5Q
         z0Dpz4wPUrDUigY/pqsHlC5teaiVbC4rryZZ3zq2mWJhAXoY8dw2ZcK8FOoy2Urtfr6R
         YvyNiZyZXMlAh4bZ9Jx4S4mZng/bQYIL9k2VTYj6AXtxVA5W2CaOanf3Hw6DjlcvCcy5
         ao9FAlbF2iP12Ci9qOycPr+dqmmcVJx8EWHkxFP6XhMNBypDgUsytb9afc4tp4RAZ0Vw
         yBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XqVrl/eIhgH1AW6P2fdddm80pjg0IUatGliczQKyBXo=;
        fh=YDt/z6HQA1inHjRUduwJlnIfzN4WmzHC6Qt721ONuM4=;
        b=Jd5xWhUTW4pyxX4IWav6tyJtfmj+olD7iekwshBsU8w6wvTC/se3NHG5MJYZAmrZ9D
         pT1dwrdDDbUXhY2TZDMK57R6htQ8XZZ6HuSmVvVXhaW9OZ17NPZShv0zVgp5qIWWS6hv
         FFBkbJ3mJu2RwPQyMqcFdEFa4g+ICgVlJlkAm3nH+iEbryYite2nJDMj0cEK4lj/rnuz
         f93/n2+98qKSeVacxGQacjnnoFWiNCAGdcXpYNojLPzT+WCG+QnwJAyFcaRkow8fRuBW
         +gQMhtA4n9iqrQxZrqTd34WdnWYNu8N4HcHA+uSxHqG0JkKlex/s76bwp0DgsHV4KYUe
         81Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793720779; x=1794325579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqVrl/eIhgH1AW6P2fdddm80pjg0IUatGliczQKyBXo=;
        b=EVojxrJq1nfNLZAfOB0u42NOdLqIiqAqvjLX/i9zQN5Ak3VoOyWzsD1otRUBDBLO9U
         g+oNrR9+QcRM4NsgVzz4dEKNUudKfrXart5l7JqDGfJiMMNrd8Z2uCvF2j1fe+l6HHK5
         QTJzEVWWC1Yuz5O7YcVRvGIdsSPZEQivCcW7PjXfeaqzH1joyqrU9laIUPS0zp2Se0qi
         HU9ZyjeurKVzIubOwlka59PQSXZvzP9S5uxrxbQ8mudB6f7VcHnR/zvt2bdyp1MPatwr
         /Ocy6ox1Sl0Qz/VDiXZDcEXSsMkBwP8iukIWZgFEHpewg+TyVsEnilJwx94k3Yunhd2t
         F3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720779; x=1794325579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XqVrl/eIhgH1AW6P2fdddm80pjg0IUatGliczQKyBXo=;
        b=jrZomP0dbOUUha+jg72JK3EEJiM8KmJj7oDBaNVcwuCBtiHeccJSTGeop6rF2DpbBA
         l+SpyHk2xsQhwqaYA0f3W0PT3TFNXvqEhgeJOczU+MZ8kvOC6wuxQySci0Ms4M6syF1C
         SvD6eVdruZBattkcKk+vQxy12l09AmkueqSg2315fKVm5EcIkI5A5h5676mzi4xZjo3z
         TufeMYfjB7DWY0IKYdxtlvduf1BoRmnCPV+McJVaBgKArxwfh2xdu2TOdfSwcUEun75C
         BX4BM2PBWSe+n9DarzaIVVPNUaRxGrxJBZuA06l1yWHQO1mzg0UQz0JkyNyoeQi0ryrV
         dIHA==
X-Forwarded-Encrypted: i=1; AKwUvBwdKpwmCnQco36peip7XaBcuF121euAfUJZptgmIgyFOoZW8G9wAb6do9Ra0HA4A3mWGo69PhSdANoX/Bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ldp9w7gXHH48o37rf+DZbdxn+Kfr4dxxievLzXhmofkLCgeYv
	+51hEJN1kgB7P1MxPkl0C7x5HnnOFt91q2uy1jQp/dHlOux1K5qPAJjDYA3IMLNVUPYEaZ/hps8
	UFI1fz/v4djft3ATxPJMgj/QiPTExL/c7qMYyLj/wRg==
X-Gm-Gg: AYBFou3UugTpw0yBqxJgfXQx0GouPxXx8SQj+r0cUSD2Daq0tZOIR+OdqEGawXzDhi+
	TtdTf7YxpKtJR/Nfmg3llur2FjZmOnGVZcq+qqwMa7GZMUsFTrC9u3OE0/kBc1/6zDuztfu9BT3
	Lcj7VhLIeJaqWc4/uGP+J52FR0hVujUsZQzhiRU8xCesp4+4bttHUiyv+o+atiFmv1/ZwUVfVdh
	7inANlHopSOuGd6mE4nO85gjtYyjyS7REfcE9ulUV4NQU2zac+bop3z3Nf2Dc+WZ7mgc6tGpMfN
	P4sxsHix4N5nR9c84kO/hLMe7MUAv1krKd1Wl6AArh8YS6F6/MAFVAMZZZTQ1IiHHHzSMgXISkY
	iPYv9qa8YSkcV570PaSKLgPBQsCepPTtjfk+GnwCKCvnmUqsSOvWONDx3W7iQNrYVZ0XZsQ==
X-Received: by 2002:a05:6402:c9:b0:6b4:21b3:a407 with SMTP id
 4fb4d7f45d1cf-6b4d468ac52mr8200092a12.22.1793720778601; Tue, 03 Nov 2026
 07:46:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102134831.243255-1-parri.andrea@gmail.com>
In-Reply-To: <20261102134831.243255-1-parri.andrea@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 3 Nov 2026 16:45:59 +0100
X-Gm-Features: AclHuK8WRN7Frxg40KVoY27kcAGJAgEvtikAelCqS42SHsjCQtD2cjtIHdvZIFg
Message-ID: <CAKfTPtBGU=nZzDSeUm9ABHTiypjqLJfAYou9=7X4qNVFJdHbNA@mail.gmail.com>
Subject: Re: [PATCH] sched/uclamp: Reject clamp values above SCHED_CAPACITY_SCALE
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Yun Hsiang <hsiang023167@gmail.com>, Hui Su <sh_def@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 14:48, Andrea Parri <parri.andrea@gmail.com> wrote:
>
> sched_setattr() accepts sched_util_min and sched_util_max values that do
> not fit in uclamp_se::value. A single thread can do:
>
>   sched_setattr(max = 800)              returns 0
>   sched_setattr(min = 0xfffffffe)       returns 0
>   sched_getattr()                       min=2046 max=800

I can reproduce this on arm64

>
> which leaves the minimum above both SCHED_CAPACITY_SCALE and the task's own
> maximum.
>
> The range check in uclamp_validate() relies on the + 1 wrapping -1, the
> reset value, to 0:
>
>         if (util_min + 1 > SCHED_CAPACITY_SCALE + 1)
>
> That only works for an unsigned type. util_min and util_max are int and
> SCHED_CAPACITY_SCALE is a long, so every negative value passes the check,
> and so does INT_MAX, whose + 1 wraps.
>
> uclamp_se_set() then truncates what got through to the 11 bits of
> uclamp_se::value, but computes the bucket from the full value. A minimum
> of 0xfffff800 is stored as 0 in the top bucket, where uclamp_rq_max_value()
> takes it for the highest active clamp once a higher value leaves the rq.
> The rq clamp falls below what the remaining tasks requested, and emptying
> their bucket trips the WARN_ON_ONCE() in uclamp_rq_dec_id(), without any
> privilege:
>
>   WARNING: kernel/sched/core.c:1862 at dequeue_task+0x2a3/0x2b0, CPU#0: repro/126
>   Call Trace:
>    __schedule+0x933/0x1320
>    schedule+0x36/0x100
>    do_nanosleep+0x61/0x190
>    hrtimer_nanosleep+0xb5/0x1d0

and this as well

>
> Make util_min and util_max unsigned int, so that -1 is the only value that
> wraps. The pair check below is unaffected, since it skips -1 explicitly and
> anything else is at most SCHED_CAPACITY_SCALE by then.
>
> Requests that were only accepted because of this now fail with -EINVAL.
>
> The following program triggers the warning when run by any user outside
> a child cpu cgroup. With this applied, its 0xfffff800 request fails with
> -EINVAL and the warning no longer appears:
>
>   #define _GNU_SOURCE
>   #include <pthread.h>
>   #include <sched.h>
>   #include <stdint.h>
>   #include <sys/syscall.h>
>   #include <time.h>
>   #include <unistd.h>
>
>   struct attr {
>       uint32_t size, policy;
>       uint64_t flags;
>       int32_t nice;
>       uint32_t prio;
>       uint64_t runtime, deadline, period;
>       uint32_t util_min, util_max;
>   };
>
>   static volatile int stop;
>
>   static void set_min(uint32_t v)
>   {
>       /* KEEP_POLICY | KEEP_PARAMS | UTIL_CLAMP_MIN */
>       struct attr a = { .size = sizeof(a), .flags = 0x38, .util_min = v };
>
>       syscall(SYS_sched_setattr, 0, &a, 0);
>   }
>
>   static void burn(long us)
>   {
>       struct timespec s, n;
>
>       clock_gettime(CLOCK_MONOTONIC, &s);
>       do
>           clock_gettime(CLOCK_MONOTONIC, &n);
>       while ((n.tv_sec - s.tv_sec) * 1000000 +
>              (n.tv_nsec - s.tv_nsec) / 1000 < us);
>   }
>
>   static void *bogus(void *arg)
>   {
>       set_min(0xfffff800);
>       while (!stop)
>           burn(1000);
>       return arg;
>   }
>
>   static void *worker(void *arg)
>   {
>       long v = (long)arg;
>
>       set_min(v);
>       while (!stop) {
>           burn(v == 800 ? 300 : 1500);
>           usleep(100);
>       }
>       return arg;
>   }
>
>   int main(void)
>   {
>       pthread_t t[3];
>       cpu_set_t c;
>       int i;
>
>       CPU_ZERO(&c);
>       CPU_SET(0, &c);
>       sched_setaffinity(0, sizeof(c), &c);
>       pthread_create(&t[0], NULL, bogus, NULL);
>       usleep(50000);
>       pthread_create(&t[1], NULL, worker, (void *)500L);
>       pthread_create(&t[2], NULL, worker, (void *)800L);
>       sleep(15);
>       stop = 1;
>       for (i = 0; i < 3; i++)
>           pthread_join(t[i], NULL);
>       return 0;
>   }
>
> An LLM helped find the warning and write this patch and its tests.
>
> Fixes: 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp constraint value")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> This textually conflicts with [1], which rewrites these declarations and
> keeps them int. Whichever goes second needs to keep them unsigned.
>
> Tested on x86_64: 0xfffffffe, 0x80000000 and 0x7fffffff now fail with
> -EINVAL and -1 still resets. Not run on a 32-bit kernel.
>
> [1] https://lore.kernel.org/20261016062629.2102883-1-sh_def@163.com/
>
>  kernel/sched/syscalls.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 45a127deeadd9..abe5ea6b3e36d 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -318,8 +318,8 @@ static inline void __setscheduler_dl_pi(int newprio, int policy,
>  static int uclamp_validate(struct task_struct *p,
>                            const struct sched_attr *attr)
>  {
> -       int util_min = p->uclamp_req[UCLAMP_MIN].value;
> -       int util_max = p->uclamp_req[UCLAMP_MAX].value;
> +       unsigned int util_min = p->uclamp_req[UCLAMP_MIN].value;
> +       unsigned int util_max = p->uclamp_req[UCLAMP_MAX].value;
>
>         if (attr->sched_flags & SCHED_FLAG_UTIL_CLAMP_MIN) {
>                 util_min = attr->sched_util_min;
> --
> 2.53.0
>
