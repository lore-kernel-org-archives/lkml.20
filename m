Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896949;
	b=dG6mJs3XCbC79N9wkIN9C6CE5SW8sFRubXWbbbHHPv0sQ75EP9crlKDSePAitlcRYaXF
	 Rt0QgBbJmyzC08IyAf48wtS4nawroxn91h1wnrXfWrVOBXfneXc9K1nCZmGvbGTZEpwBS
	 BpbuJooIUDW4KfnEUcLUV3itwHkTJC7Zy7cSYTWKT43hFvzZluDxHjmJVju2zSsW8v4vq
	 vOMYeBJZxgLghfi0NgfP3PUshk9hkpTdl9W83HeogoU5WsYyK3J9aBMBA6b3+N8vhICrj
	 YQFKms6dZEekEBMUsrNB0a4aqeZ0Wq+KNhPjZvD+RM8etsPWKlzl8ylrsEWpXLJvq3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
	b=rQ8aowAMpKg0ROjjqtnitBqfejaHAxEH1msyPnzFTPwgd5mVD3dqKikCelQfszi9BKYl
	 pNHPZeqj3rvobD8N2XwvtlQA2+IoxsIMrR/sN1djPWggpjFj0YZ9rEjErQwpAcRz8Zybe
	 kFPu3XDVXCN85WQm6MqRDamSi8/vtun61J5axa+5vMgQ1uLF1oaDUp/jprHxq2nfqpbW5
	 aG3pYN9/F6AuoCa7Bn4MgF0H1ja0NxizXtZ7YMCCBeBYeKatsLFpNMIMipzXIjHVSeLHg
	 2Ma0TsYL3S0Kv5xUGq6BNjeunNHYqtPK5guJWnHMEKg9X4PW0FoQ1RxUoXipz7YMaCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3uaHFKF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3uaHFKF
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso24895745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896948; cv=none;
        d=google.com; s=arc-20260327;
        b=TEZfi6yCy1U7QXsIMYSeb+GdJaLsD16rC5Ovs+QSdKpjJO4/GDu/1HHIn2sN+EUJQe
         Av6TwmsUzKIiyXWVpfW4cfH2oRdL9GY2O95jxzy8XWrvXVDnw4kH7RFv5BmGeLIYmhPb
         di86OkFR+zR9h0iZUS4yuq2HeNc7qzX75AhL60kxTHS5DhlHB//xwR29PXk6HFyBLA9L
         iD8w4yqxOY4HBhXu6LdczGkC3Qu7Wfe+4jcvLsk8acd0/dwXcHRSCLT0NnyHZBFq+1oG
         0yd3mZubvjhEw/MUnv7xAirHWsVxrPSkqcNQqDEbJLTXA6H9DHzTjKiMDbHvCnYMPlSC
         VZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        fh=oTPPNDxqZjXWOgWsSyv2w86GfKSEdaU5iFqPkuFKuQs=;
        b=M4m0SD9rCMwcSXOd98AZgfQSUc9LUCjzqrP/0GTfJXH0ICgB+W89ONEmKvqJomndYu
         28b1BBWF5oDcs569N8qO047Lw88muGRgkjDWe0f6YvKEHRmZ5UipP9xNf6qOxqoxFuoq
         nay0QSOHiA1CO13OB/gYutcUqbYkfTWyguuQAl9zJEamH+pH140suKmX8nkZhWziL8EQ
         l6M6x2eoCkDW52VfEFVzoAtuLuBwjFfUFKZe2QkQ9b+sR77Wnwle26BM1XOvWTfQvkWU
         PxVzNFf1xamQ8PAuvkU3UYdcwUTnyhbJutFIUKiO7vksf1I3Uknw+dZQvNL9OeOTgJZN
         dkjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794896948; x=1795501748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        b=b3uaHFKFRmNqhgR4HFR08IC0FriEQ2Fm87S5nwb0GiRNXm4Mv2ykktFuKoqXe88p7E
         EOlRr4WxCb1NQGTzgSujdzYz6gxyavsZt254VavABpnJdfFqijDlw0Xpmrfww/Z8yu5m
         ah1034GnPxUBYajPQqRqvec0qo5LxSAswVwNXmHjrKT3eb1sK0vGspKCE7jnpEsKMnjw
         7OueI+lCjem7RIvtTX6tH465zKabqZlrzxVxbyRdsoBmS2cBhuqI4LLZZL19r0On82rt
         BtzfKduW9sT6BC2CjMTnYNt2uJ7+WO+Bm6alWy2hZM+sg4xjWw8dUhXpoWMzWtLz6vnj
         KuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896948; x=1795501748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        b=DoL9LWfBe4NXWjAwsIoK1z6SNZhCZyW7vLr+HRSQ/qrKJHOlgOywVdOuRZKVOucwDR
         p9TCO+k/yoTEeGq7rQ3NVnYBw8/V6wpFnwSidqAv28XtRwoivdx11pubZub4fJIOcPys
         r39BX8I//GuAm2/u3xOywXfojd/hq9Lg9MFFea0epABEs9kGjYjfVa/vVwfI3o5K4uxt
         sKMkV/kjdo9u0e4UVE57F3eD7lNLGv6sCV9GRKFGDvW1yFzBmKe5NiIy6y/U3QZ5xtka
         ViyhVJXYR31YiGS2s6ak4W055Bae5gTGtZmhwWZyHMxvXC2m9PWXc1D4OE0p7izfgfML
         pl/g==
X-Forwarded-Encrypted: i=1; AL+hErHoRqxEYIxXHROc+mZ8doHJ3RAIduhrXen0S4/omPjSjHqwvSTmaz6jukuHfxlrrNCKwsYD/eN5hyCkpHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5N8Hettxsyr6ZaHYiPUoTE20ik6CrwOTQNNbKKov7ey/Np1wN
	t7J/0YCxttklx13Rw8USfVF8BiRfHSQ6N6Fy0VVJqj/aZAkF19r/ucEIAwwUcNhWeSHoBSbJ9Mg
	iY9SUufoxrzjLbF/csknLHqTVgStMimYHlGkWwP+Cj0TG1toALV6Y9KZUTg==
X-Gm-Gg: AZFdTZdKrgBYxsElgskPsReu1/JcKKu0jT9Ymf9MxnPUcncqSf69DSu+gigej4On7Si
	JitmUbSiIZF35OyNGZrn+kDdQNnL6oNevyHbho+7O5KdN7lHzU1f1j1YaxzKbNWVYH7Y8XTPPX0
	Hz/V30AQ7FRe6X5UIq6T4hgX7xaJ/f0/aDjy12g0jtNJpTSqLr307sCKPV2gnSbTi5yH/Pg9KnH
	klftHHcJMhVnOJF9JI+RWcWIsn8P2sSkWBE16DbCWbaxc/iSStvZyQL/2saC6ds/2bLp3LgswZn
	vPV2WHPY18lB1+yr8cq1vIcFSciqD1IYeLLxWhnC8NF4PaUYfcEYO9DSup+mqp45SGr/WwZDcx6
	GcmPOTmA90cEtVZDOUqAvAWK9PzJsObEqWEuS9Z9qPWZPFZDDiAqsUy8RsOfDzncPFiZab4qlxD
	BlQ9r97SDYE6Zv/lTSXJB80NuhtWAe+i5k7y2bVD92HaX2levP7/mEfmFciJ/RHzmaRWK5pLOVE
	vKDmTZvjxb0D61iC//XNQDxwc/kcA6vASImu27Rscrwj2AcHZPw0Q==
X-Received: by 2002:a5d:588f:0:b0:48b:a4b:5a2c with SMTP id
 ffacd0b85a97d-49c6d4538fbmr30173022f8f.3.1794896947228; Mon, 16 Nov 2026
 22:29:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 22:28:54 -0800
X-Gm-Features: Aa3M54raYIy1g-9GeSnu5j_oFGcUIQnF4PF3c5nPsw_P6oUqhgerrCyZAxXvPIY
Message-ID: <CANDhNCruzSQ3r3WKPz9J6J5-DEm+L4hC8g6PvnuYnx9SiBTKhA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with selftests
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
> Hi John, Peter,
>
> This series fixes six problems of proxy execution, and adds a test
> module and a selftest for them. I found them while I looked at how
> SCHED_DEADLINE priority inheritance could move to proxy execution.
>
> It applies on top of v6 of my deadline series (link below). Patches 4
> and 6 need it: they change code that v6 adds to the deadline bandwidth
> accounting. Patches 1, 2, 3 and 5 do not.
>

Just following up again after playing with your tests and patches:

So I picked up your test-driver and kselftest patches first. Initially
with my tree, only tests 5 & 8 passed (with sched_proxy_exec enabled,
with it disabled all but 6 pass).

Now, I know this series is dependent on your deadline series, but I
figured I'd try to pull the independent changes first.

> The fixes:
>
>  1  Reschedule when a blocked task is woken under a proxy, so that the
>     old owner stops running on the donor's context.

With a variation of this one, tests  1, 2, 3, 5 & 8 passed.

>  2  Wake blocked RT and deadline tasks through the full wake-up path, so
>     that they are pushable and another CPU can take them.

With a variation of this one (basically dropping the shortcut rather
then special casing dl/rt tasks), tests 1-5 & 8 pass.

>  3  Stop the chain walk when the blocked_on chain is a cycle, so that a
>     mutex deadlock no longer locks up the CPU.

Already have a fix for this.

>  4  Tell the class about a proxy migration, so that the load of a fair
>     donor is attached to the runqueue it moves to. The bandwidth of a
>     deadline donor stays in its root domain.

Have a partial fix for this already, but the deadline donor bit is
dependent on your other series.

>  5  Clear blocked_donor when the donor stops donating, so that the
>     unlock path does not use a task that can be freed.

I've taken a varient of this (only clearing on proxy_needs_return() -
happy to expand that but I want to understand your reasons more) and
have some related changes to clearing blockd_donor in other cases, but
as you mentioned there's no test case in your test for this logic.

>  6  Check and admit a proxy-migrated deadline task in its own root
>     domain, so that sched_setattr() no longer fails with EPERM.

This one I couldn't take as it was dependent on your other series.

Basically after the first two patches tests 6, and 7 continue to fail.
Interestingly, 7 does pass with proxy-exec off, so I need to look
closer to understand what is happening in that case that isn't
dependent on your other DL patch series.


> Points I would like your opinion on:
> - Patch 2 sends RT and deadline tasks through the full wake-up again. Tha=
t
>   undoes part of commit 7918cf369361 ("sched/proxy: Only return migrate
>   when needed") for these classes. Putting the woken task on the pushable
>   list in place would keep the optimization, but it needs a hook into
>   the classes.

I'm not opposed to dropping the optimization for now, but Peter added
it so he may feel more strongly and I'd defer to him :)

> - Patch 1 reschedules for any blocked task woken on a runqueue that runs
>   a proxy. A fair task woken from a delayed dequeue there also triggers
>   it. That is harmless, but not free.

Agreed.  Would adding the resched_curr() logic to an else statement
for the if (p->se.sched_delayed) check avoid some of this? As I
replied to the patch it also catches cases where the we're proxying
but the woken task is not part of the current chain.

> - Patch 3 also stops the donation on a ww_mutex cycle that the wound or
>   die path is about to break. The donor then sleeps on its mutex.

Is this a concern or did you verify this occurs? I thought we
wound/kill tasks before the cycle gets created (see
__mutex_lock_common(), before we call set_task_blocked_on()). Maybe
I'm forgetting something?

> - Patch 4 repeats in proxy_set_task_cpu() what set_task_cpu() does
>   around __set_task_cpu(). A helper shared by both would keep them from
>   drifting apart. I left it out to keep the fix small.

I've already done this in my version.

Thanks again for the extra testing and sending these patches out. I'll
include the one's I've picked up in my next patch series iteration on
the list, and hopefully we can sort out the deadline bits once your DL
series has landed.

thanks
-john
