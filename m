Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794478148;
	b=bRwpi/jDh/gcJwR0pumt3iP3W4a5zli7j0chHnPkiyjsvbqofJxEWCelu9WUqL9fc9D9
	 RU4eS3eCysKQFe59ULic4iyvkcglLfA/vU3VEWtY4EjNimVHJtaavylESSUtPRgDPTlIN
	 aoGnfnKtvEiceaEgBEDag0rbML4OX0xRaXzh0a/ukEk0jS8QRHE8Lqz5Ni/0afL6Eog2A
	 Q+1x5yA+xHizharAKHC8sFZD6V8Ejs44Amj041eY/WErA4g84ZWb9EclW5ZT6X0yEAcGB
	 eGLCqakZw3mDHjOhE8MOuLJLKKJm9NxysAXbCHayqcuvr2jx+Ll5IL/MIJGcJLhcn2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nyI0YNmkDe3Ovq4VJ0OX6Rv0IY+aEcmTuWGLZNsGLYI=;
	b=b87va8cUHHT4qx71aMlRZseBo0B2VQBCzIE868JXFDdWcbM+KWmigB7lArEy1xwtl9kq
	 74FaEqEhDNQ+kJu6y5SifXjML556wOR3FTrbEI1XP10QM8cDeO6CCU77EJdMvDtgrZ+68
	 8kxmU8lrb1RGyu2niRzkQf55rigGlp2eRNV9qIvq/2qg3+KvC+totOHCc12qzSoGYpWIz
	 w1ti2JUjGHQ6Wfz0q4RAWCNMMEA8tHXCqzxz2Ftqy8BD945FBru+/o1ZQQqr1axUDZUoN
	 QAAe7Mrpggq1w7pHHGUjstKA55miSgE9Np2/YYrc9Np7s8k6JZjkfInkG45UoJBVC8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bWnGd1bE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AD606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bWnGd1bE
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5067a2411bso245244466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794478146; cv=none;
        d=google.com; s=arc-20260327;
        b=bBjkdatulfCuksGjea6dJdN8AJAMk0ULN9yY80tpjt/XGW0nb3cHdm0plvHV3ROXue
         XFcvsXvdtCazfTrI+w5dVjuqHv1Np//s60mhs9GdTNIHN4rYa7rKzfby0jkfOYYEdhEK
         hBNZjwl1J7Tr7VhHuedVhqFRobWdKZus5FudNc/9aLmuiLUXx4/1qg4XEd7mLgnT53PX
         V5PHvWIrBTD9Ufljiz7Fj730LhEx/g/KMc2v0KzT9bLrAq/PSbvOaDTBjsII+cb1h226
         dIyi1En/rxBOlf/1Inx0olSGJlIybQmkSLgThtBIoTsfC2TSuv+req+/zuRvbRkUxwY8
         6GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyI0YNmkDe3Ovq4VJ0OX6Rv0IY+aEcmTuWGLZNsGLYI=;
        fh=/uRQ3lkjaq+SJtrmP1zBRIv5704QH40uF231fsWaEnk=;
        b=NjKnVh1M3E8dOQsjeOp0XK2RD446zVFAo1fsxKQN6bmL3LkLstt0PmKOzV7AEOkJmH
         tzY0Oef7N8YqL/z+A+gA3MUK90kkHUfbRqlcqY152QNBlTB98XC5MDdyV293SXlPoFxw
         exz4ZUmDDIai3st8q/QUcc1cgrs27eWWxSE6KQCz4ijpIuzEqiyy/4wmTDIzwsIANYTD
         ZmILQDvyE5L+sRAHmaShhGJQDZNQdXkeqZ1FEKWpmOPc/L5Ydhi5Ti40LsQLveln7Jw+
         j6JFl1JXFYHbfvDmKeZHH4t3SRy5lOtbD3JgI7uRkL54k8sPzhxSpctdOrizy1NGYUHT
         9v/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794478146; x=1795082946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyI0YNmkDe3Ovq4VJ0OX6Rv0IY+aEcmTuWGLZNsGLYI=;
        b=bWnGd1bEiXbVqhMqF/jQOnNp7ztS6a8arjsKLzGhxZiqwT4QOppLAZnAk3TfBE+ElX
         4Snkx9dXaBy7jxuMbmdLC/A07EfW9N6QIqO6UugZ1Hf9QlT3tMNo27IeHUokhySB3Ktw
         uQar6b8fu+XM4Py1a/Xz+9iiXgkm12nvwxuiiT4GqjaPN+L63n+Vx6GIRXZ1+EHDCCuQ
         UPozOrCt6LGiFZvQpu7zXNmIn0y0WWWsqnS21sgnxb3LKEmbymzXPy1v8jpMkFyr36oX
         1V/yMiOzMe9UzTdk7aoty2XPNnOVIO65SzidX4nQpHtvsLlXvgK3Pyx2+a/PcAcRCl4q
         Pj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478146; x=1795082946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyI0YNmkDe3Ovq4VJ0OX6Rv0IY+aEcmTuWGLZNsGLYI=;
        b=FuttkSphzbSIH4dx4Wdg0QQTNf+TAIyzXHXk05xixB2jRubHTpJ0OA6hVVO+7e/Ckz
         8MQ0bNzSUNgnuW/+6Hchytu6DO/TLTDQKoeRiEjadeXYIZ1XbBeHGC08or7K/a1r6RC/
         KqvA/xzeM/fDGH9TAkNMoG6IPWcjpv0W165VaC3GVqMvgIvu9Q1vWS74kKPstuc1bMpT
         62c7qQoAShPmiMW1ZN/bBSsyemKioRPEm5msmrYxJSdqFWRDXchW9SLZF1SIkqTEwHGt
         lI6Z7OuOJfhj6r4jbpu9fI6VaTW00XLcaxh3I+vji+v6CfR0sDdRyP1BSFXay+khV4yu
         zTSQ==
X-Gm-Message-State: APuU4Z8D5Er07eRReeYldpGFaKzAdPYJ2rdsF93gHssj4wQ1Aniww0mS
	NwlWhlgD0Ol+l+gjui8SuyG2Y/1TSsb1ZXKlOFaufoS6AJbSWmBtZ72kv9tcmogvOpy4xi/5qOp
	vH34iBzKJGnZ97LH0B51DOc7bNTiUQMIXTAy95RBgvQ==
X-Gm-Gg: AYBFou0QscDxeTzsFz5XR7BbKn2LwfkWG9rbz/gjQwZo6T32T4+BSBk3TEZ9aNkJmlI
	nTxnRsoSotPCucYekXvzkn8bnNf/KwU/c3yLr87hP7DjgxVYsqf3Y+kLg3JVL/NRjmJlHqjVolb
	B8fn3jlq6IQDmR83jIH52bY8aCPgrHOyxRaHThoKhljer2rqez54k9pjEFDJC84guVKP9WQfb9/
	OS/oW9DGgnbhqtSbi+M22SXE28YjH7Gd9KIdvkqV9ys2NPV7wlJvFUA11UH5m+6s8/r2CQjp36u
	qU6/bJvuQ8iJ/mNDLsgov/OZ0MbUlZZCJ5cYJCoa9r2lccCAkDW40TunNblbKE3jdsJ4ifD0H8v
	+VhNPvFkRZdlOgbpulk2fhm483lzz22KdfBjIiFbR/UqNgVEOcxhvAf71AeYR0dB7+iHICw==
X-Received: by 2002:a17:907:3f8a:b0:c50:5bba:3462 with SMTP id
 a640c23a62f3a-c5066b304dfmr394687666b.20.1794478145976; Thu, 12 Nov 2026
 02:09:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-3-marco.crivellari@suse.com> <5c8f7574-d480-45fe-b658-c705511fde61@amd.com>
In-Reply-To: <5c8f7574-d480-45fe-b658-c705511fde61@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 12 Nov 2026 11:08:53 +0100
X-Gm-Features: AclHuK_bKJJoNNgeYVFUV4pZviqQpliLqXeojLATcSxXAjnaN-q1VODj3CQpLQE
Message-ID: <CAAofZF4gTxqAwSVxqtCTKiTjfTkjMufo98JApCoF5D7O8qBMgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks idle
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Prateek,

On Thu, Nov 12, 2026 at 4:28=E2=80=AFAM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
>
> Hello Marco,
>
> On 11/11/2026 5:13 PM, Marco Crivellari wrote:
> >  void tick_nohz_idle_exit(void)
> >  {
> >         struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
> > +       unsigned long flags;
> >         ktime_t now;
> >
> > -       local_irq_disable();
> > +       local_irq_save(flags);
>
> nit.
>
> Use:
>         guard(irqsave)();

Good point, I will change it to use guard().

> and you can directly return for below condition. No "flags" or
> "out" label needed.
>
> > +
> > +       if (!tick_sched_flag_test(ts, TS_FLAG_INIDLE))
> > +               goto out;
> >
> > -       WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_INIDLE));
> >         WARN_ON_ONCE(ts->timer_expires_base);
> >
> >         tick_sched_flag_clear(ts, TS_FLAG_INIDLE);

Oh right, way more cleaner.

Thanks!

--=20

Marco Crivellari

SUSE Labs
