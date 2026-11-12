Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479798;
	b=u9q+3PbG5+wQ837GpUrLRS1OgRan/239a/+dFuv9dVFH7PqB0htl2gGevsPKb8Ny0Rd/
	 /vwpf/sOQxFW9kAiBR/prfnWrJPZV6sM/B69nWYOO5FRA4UfHhPT5JtM713wW/Q+FArTe
	 lH7TqWpdo48+FHQoH4dbUQ1j1AcFtrwpsV4xvEELuK7S3GiQpEpFrPluPRMeqoF0OjasL
	 7Be5JpisbHAD8vjHfCsvB2o+8yUd7Jf4/Gg1UF/K5QNTTXQnLmB3kfV5mSpn9wBPJ1eEJ
	 ZUs3utHNp/UlB1mQRM6s4tA40PWCb4ZTdlMan7OYUYLw7fZjNKNVStloT41mFJWuNTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=j8TXjn212HmJS+yU0/Mfz+TCWclY/CgGPZrsyXk+y64=;
	b=vKL4AAhlOt6hPdLilTSBclYw74HWagTNLVtbjlQjSqzguSzdeGHotxXXK9sIRpCCji+o
	 qkz90mOyad/Smr/w8tI1j/Rh3Xy8NNzX15A8AEjkhKukUAuG61Ovrmf61sXWSGn7u2NuS
	 9yfRReq1N2LwoCeauhWHeLdr+8Fb5GtKZA4v5Ts0UvCB6eEaJErf+GVEvaIYFOl1MTkS/
	 kiBkZI1eVNcTTQpwV2ZOLVqvms9Bostl2AVK+QPaqOsX2ZXJcmaHx/tPfcjN8WfgrCA5h
	 7jwc6oT9irOlsnRaHdQIyq5tfkdlXhZos23yFJrAVsYOST4BFbZ8JKimp28Qy3W1lIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=afF8WvUi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0101606A8B4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0101606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=afF8WvUi
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c468bd799ecso598768566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794479796; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0NYYsRSMEVUsa540K7G7yaIrfJlvXOfhQiw11j/7Vp22rFonwof3qLOM2VG3bp8D3
         qzC4Hh2UtwL2BGlLNzEvwGD03xholmaCQcusVMZiCteB4JVxuCJQ3O3UEro4MvlV0UoI
         75vUEqEvEGC4LPC1HQLMJ6yruwtXfApt8WKb9q5OK7RUKa/4OCCC36MPuVq0i5jtsSLm
         G4QIS6aZR7+GLCI2ffCgwqc54fZvMRvAnbCtYzoP7kGZ0HfCNcfmkCHCojPu1pV/7P2i
         tEWe5orQ8KKyVrA6VpRJu7ReuFCiMVaLWnBa/FntgjAjXvF0fYRU/qOXR0qgfH6W8k4C
         nYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8TXjn212HmJS+yU0/Mfz+TCWclY/CgGPZrsyXk+y64=;
        fh=WLC8mFZhqupHmXvWzZigRFuyMEU9Kfq0nME/CIyQtjM=;
        b=KQ2JfMwt0GJ4MeCqbIGUJY5uWLbDoUDNKcei6rJML3PC2hCyKKkAQwOjeWn4AmkA7h
         Kl4JafuOVBYYEMjqNb4sc4Q8vSo9+AztcwcJ7i34tJEckp7BCc6wUu6thEfkDf2WohQF
         yJYaij+YHg9gqVmXoAqRu3jDZmxW5K2JaE7iwbIrPCgb0UhenJQ8PHZfvyF1GVVgy5lX
         NsYjSJF4Y/ta/48KB9UPsq6WnU8d0WdJiTVyqzfjuTBQ66me75+pIooiddPBit3oLTFp
         UCJSOAq3PWsLRVwMPmizdJkX0kuvo2ylAAqiYO9kJKwSabEuqDg6ZQBryC4o7tNPQHbO
         1+6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794479796; x=1795084596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8TXjn212HmJS+yU0/Mfz+TCWclY/CgGPZrsyXk+y64=;
        b=afF8WvUiV2pcheYTK7MsSvYgOKH9kEP+Z5oByFZ3BdHVmxvr3ECp1CGsGGlo0C0qrY
         vFOuH5QIz49S92TDsZoNPXae7s1a9RWdgwd75bUcjfjAd592qWTnlKU42MPDt14ZqsGf
         pXHOfjyjKZV1IDoarjGNrYWphY6i/2j6UE18BdtAuT6r9wn8z2n0+QvJcOxNcXUAjmyE
         3AgMJLJucU4sbgRfg85ZMfs3yPBCdreiF+I/C6H6rMEUKCNWnYsg3y5chbuH/SoOSv7l
         ywYW4ChFPr9bgGx9XJbzA0qt54+OcCIYi9GD13BhOqqcIS77VT9CmegFhkHAJkp6u5Wo
         Z4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479796; x=1795084596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8TXjn212HmJS+yU0/Mfz+TCWclY/CgGPZrsyXk+y64=;
        b=WID4j75fIU9UAUR8aYLFCec7g5HXoUfCFCX0FAbxVDOZ5NkSsvXTQinWyoOEcjK2fu
         D+Qq4ohmXlZLemDKVtGEjy38MhMHiKx9Z9PN6gX4XL+Gk7WJLx8gj7L5D8J2gcip/mSG
         J3TZYWSxh5GGr+xbpeP2McLqsP9qAhYikzbS2cOgzp0Gxh+tN/eRzmd7GRFw+8oHrICV
         kSROwJPKT/vBIjo/5fReTGZNT5ZuM2Cys2NHiGbzqETfynJEpqc/YQg1X1UL2XjawmKY
         jh1kUB1//Tv+50k4n8dlWSK51AlHOUoXZ6KJPwoqlqWn2L4/bcLiA76vxshu2gvCLnxB
         VdVg==
X-Gm-Message-State: APuU4Z8ARniFhJPIIWCoG2puQl9En4yPHJ1VubnqIx8tiH0h+Ig3V2h3
	XjK2gg3kLKLyMQOZYvFTvvO5czzXEIZQzVwBikKX2XcZQAMns/ufoVzqazZLLTn+I6zwsdgP//k
	syTOGV/JzdGu9sPteDwGAfnKyl6L3hEEwt/ta7HPItw==
X-Gm-Gg: AYBFou1x4l/M/da23Lsepofm7rf4Tk5x0Dtu/RAOuzj0FnVaWOJVzJwd4nV+8NIAkKw
	227bIEsgV1mtEZeWi4J6ZNslrL0yECidspFwmpDIaTHYMmAjqCiMe1IFjBg9rTcVytzHji/uVnB
	gOTr3cgWsVIJKhj8sEgty9QJAvkHPB3seEOj2hhmnACavUJbIF/rAunVhAWuxVBHK+q3Fqt4TR5
	mKDNFUsYsujE17dWp7ESmB9ekddbOwK24B7CIgsm2MdJjjb3OSPSUP+tEIdr1/1IObQQ5hqvvoK
	FxrugZo/GgVl0791dV0zQZX4at5TBLGdoAj8JKMWupsbXo3/LvswjUFjzY3TPDwCuJ1ArbQcd9C
	yjr0g9fP3RqHBnld1in9R2a95U/xYHyl8R91fmDEQLo9XkNO02uNXghp5cvwlwx8gNe4gmw==
X-Received: by 2002:a17:906:4fc8:b0:c50:5d6f:df2 with SMTP id
 a640c23a62f3a-c5066d1c9eemr425945566b.45.1794479796223; Thu, 12 Nov 2026
 02:36:36 -0800 (PST)
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
 <20261111114406.346953-2-marco.crivellari@suse.com> <avSW3VBwd1Mym6rJ@localhost.localdomain>
In-Reply-To: <avSW3VBwd1Mym6rJ@localhost.localdomain>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 12 Nov 2026 11:36:24 +0100
X-Gm-Features: AclHuK_HgN9EpkZcp4mdQ1YmUkMDqlNPj63wf_KZ4e4lHTcT6CBYvHBdepOLFRQ
Message-ID: <CAAofZF4WH7-pMYYX-qgY8-2qR5JtAmQAXHQMv4FeAEPZm-6Tgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] tick/nohz: Re-evaluate the tick on return to user space
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:25=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
> [...]
> > --- a/kernel/context_tracking.c
> > +++ b/kernel/context_tracking.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/export.h>
> >  #include <linux/kprobes.h>
> >  #include <trace/events/rcu.h>
> > +#include <linux/tick.h>
> >
> >
> >  DEFINE_PER_CPU(struct context_tracking, context_tracking) =3D {
> > @@ -466,6 +467,13 @@ void noinstr __ct_user_enter(enum ctx_state state)
> >                        */
> >                       if (state =3D=3D CT_STATE_USER) {
> >                               instrumentation_begin();
> > +                             /*
> > +                              * On nohz_full CPUs the tick may have be=
en left running in the
> > +                              * kernel, e.g. kept by a tick dependency=
 that is now gone.
> > +                              * Stop it now rather than let it interru=
pt userspace once
> > +                              * more before the next IRQ exit notices.
> > +                              */
> > +                             tick_nohz_user_enter();
>
> You can move that a little bit further, outside "state =3D=3D CT_STATE_US=
ER", right
> before rcu_irq_work_resched(). This will need a new pair of
> instrumentation_begin()/end().
>
> This way it also applies before switching to guest.
>
>
> >                               trace_user_enter(0);
> >                               vtime_user_enter(current);
> >                               instrumentation_end();
> > diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> > index c6d86e4da8a9..645dba919386 100644
> > --- a/kernel/time/tick-sched.c
> > +++ b/kernel/time/tick-sched.c
> > @@ -1071,6 +1071,30 @@ static void tick_nohz_full_update_tick(struct ti=
ck_sched *ts)
> >       __tick_nohz_full_update_tick(ts, ktime_get());
> >  }
> >
> > +#ifdef CONFIG_NO_HZ_FULL
> > +void __tick_nohz_user_enter(void)
> > +{
> > +     struct tick_sched *ts;
> > +     int cpu;
> > +
> > +     lockdep_assert_irqs_disabled();
> > +
> > +     cpu =3D smp_processor_id();
> > +     if (!tick_nohz_full_cpu(cpu))
> > +             return;
> > +
> > +     ts =3D this_cpu_ptr(&tick_cpu_sched);
> > +     if (!tick_sched_flag_test(ts, TS_FLAG_NOHZ))
> > +             return;
> > +
> > +     if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
> > +             return;
> > +
> > +     if (can_stop_full_tick(cpu, ts))
> > +             tick_nohz_full_stop_tick(ts, cpu);
> > +}
> > +#endif
>
> Looks like this can move right below the definition of
> tick_nohz_full_stop_tick() to avoid more ifdef blocks.

Perfect, I will, thanks for your feedback!

--=20

Marco Crivellari

SUSE Labs
