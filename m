Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792911538;
	b=EQ/ZYNPC6GbJePUwnW9KfetAk60FV91wRhkp9kwTSxnb7z9RCkknst9YyHRDtoR1Pzmn
	 QYKNaY4tph3JlclsRJacM07KxAzuSTUJiBWSoPd3HvfoGDIiFtiVsBGn1CcaH7yUF4KIH
	 7mNNDszq3/QGGCv8rqqzPzJyJ3BKwz6mQCK+5ICrJaJ/7+teE86JYZ4vlTG5gCkDuSBXk
	 APujgKR+lh75zFrKKa26uf6CdR29OqQJmuqf//BXDSxQzm3kY9bgVZMCS2qZBXUd8ITDX
	 FgX3mbXqPrOb9xD+Mq3cX1bjZnoVGIYYNqGBwbzHzY9PPX/Poc9tWBZ88gSeQtucFOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792911538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DEDrWhzB0JYQ+KwSldFCqmbu5IwHMjVNz3uZKpkiENY=;
	b=cSofEcZIy32azJJNz1LKJB2nXN0aT+rA/E/fkzKpucTaM4wKNhbPBDi1QS4d2Bgqd0cu
	 B6nrXzzD5RglnhWt/T6BiKZZOIoyI9ymLkYUuRz4WYG2C+T743X6ESGy2DHtDOfwVNpwu
	 GpoBM3PUqmeM9fV7k7b3GibLMbFl/Kz4IER2Uwf9C7YlKMCjUmcSUWavTGRZ9QmdWhVjh
	 nwlDNojweyImfAihr6nS5lbfbRCGSUxEYta+ZcHstPrhfuD3wT4/CKOLAhWfULxNC7kU9
	 1dbttik1MF6gChiqVZAfYAdtvAA2zKCiFB0sOjtKeXd7OPo1xblWwMFpF54WDtHJw5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mFM7X1QE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF2E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mFM7X1QE
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6774639a8a4so1713213d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792911536; cv=none;
        d=google.com; s=arc-20260327;
        b=AZPg8iT1frUHj64CbJDsn6LxL8QoOD4XmUFnpThJ5HfoWopH3Va6fZrZNY/Zz8S0ZZ
         fdMl83/0maKG5eW9ZhOukV6PwqmAkkSzx1r+q4oH4tM8BjC5IW6mmeqqdOnjVBKkywZi
         Km7uD5WgvlJ/MykDYUQfYcA835LFKI6Tzxc4SNpgfLuvGY441LNBk1Fg6X7zgNkoOWl7
         Fw3ijtShHPdQ0qamCbdyf1UEhgivLb4zLV/JE9SI7YLJ+LSDxTUmDUbko9OG8SO7oHAy
         M1TrM8auR8BwoBy3D1lzKg/S3JCnFfKKKQUHa3wTx39v1gVfumQ2im5Df/RBIwPEeGbD
         udoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DEDrWhzB0JYQ+KwSldFCqmbu5IwHMjVNz3uZKpkiENY=;
        fh=eXiWaf3p9OmeQOu6JlaIDlBg3xm3NBfTl11evpOS6qk=;
        b=ix1ThpgGWEGXo5ihWoTsvOEXqcNkYI/eI0k4daqohdjCbk7r9ea7VeOS9/56Sw3sjm
         l49v+FgJ0nOGRi4uQHCeF/8r3xHSpp187bTOy6HmhcyXX4yluZk2n8AW4S1VRTvF/goM
         sEHG+HyZafSB2TMz7GR26edDHSS8bANUJTbBV/UJz8VOEKVMAxn+nR7c/Nssp00yIXGd
         xTrS5cgVbMFhaa1ry0I5ju1h5+BTVnVc4a6Ap6giwncuqO9qRmICngL/kiZMkVhhFWJx
         xfAVVIqAHuS/ZdOdR7ULhdp2NRM78pbYHamt0Lpjcp/JoLXBMJGKxuKJOyEtbqAAlL2Y
         C9iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792911536; x=1793516336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEDrWhzB0JYQ+KwSldFCqmbu5IwHMjVNz3uZKpkiENY=;
        b=mFM7X1QEo9W6d2hQVLIpZt6ebznwNAsWmI7Bgw+OicY7jkwUHppMXR96jh0UfouvNO
         dmXJaQBux9X5HPt3qf9hTA9rjFRfq0Bu10UXnZo+tfmXnl2+E8ZCmL0Eeg3s/oZmKqCO
         vktnb6Hkhh7ZY9xo8skTotr2TAdgOHZl0L3E4GiKjJMixjT2KkJGDNMcEk/k0WdHEG/c
         1Tzhs3xdJEDmjiAf8pWyU0kODIm0X3Xi7aNhK8BrZimtaRwrx4HOjTmk1ieKDlK/K0qC
         Cn6vuV94wgyeEXwM3w+1h04qe6lFTDR755svERQlUnby5xyBSSJ7z20LSo4cxCDRNU7O
         nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792911536; x=1793516336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEDrWhzB0JYQ+KwSldFCqmbu5IwHMjVNz3uZKpkiENY=;
        b=oio4PdMb9wUmlzGJsBYYt4CJ2lFAR3XrI3Fg6r0LcfyCgCEs2k29oTZ4D5bonjaBk2
         IdNv7rwm104nEn7hdAZDsvnPDY4kAGbTWj7ccpdsSdbZFS0O8BPQ/0TrNEIz0YnajXF/
         20yuKEeX/zGp7xMQfjVMUz7LioaR0NI0rK+jP/HPWbh9BeaTugFyPZ7Kj4d7quh+sxjr
         DticLvb4c9klwlZrB1EVUlQHJjKA+y35q/2kp4WsBS8fpuZpBN+fdGaBQ21+0tVxq+wW
         +gkSXuj+aqF8EF2kLqVMMFTxFwfhXm47XKk0F+ZSx+ETE2T9SR74Hb5mj/LDvcOQxA79
         U1rw==
X-Forwarded-Encrypted: i=1; AKwUvBzs2Ga+Djk8Jaqh/e2UD3YHGe5YqJsUXzMy+2BWa8f7VPdSLKUh9Rk0gFfkReDzK4bnLDx/dhRiMn2fiI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHte64YCDSQVi8NMQKX4nN6sniA3lpQwvI3+xPbVmoRKy0jKcF
	gREz0kwhyqzya684LXBmf6J2RdBrSZpEQE/W+jsxzd+Y4Ca6sHk+DESaEQ8zJisoTETX/7/EdBy
	wkBp0YftgUWyQwQttW/iv/bSNtCHT0Dk=
X-Gm-Gg: AYBFou0HojMPpANKis5AdJZ1gmh6ce1Ol/Icj20E1vj3QVOSmRe9k1f0K5bV569I8YM
	RGsfhp5tJlH5pW+cqVQHsu6m2+DoYClH1loa6uSaDvVfZN3+NMw/0qhw25LHN44Hh2aIpfFSvhX
	Qpk37WoZn/ELzTTJk0EfFPIEiFZet1IfH5NoAqKQ71bVc9ceOcrqqd9YzAF81SuHuwj2mzS2yFh
	nVJdRkNEPXOVSGwdyZtcBLqu7rco3rvrQDU5XrB/3dq/9s7ZLJNbfqz+f3cw/9h4tI80yAbgsOK
	abUL3PqDbpkQLLQ0B9Sy1sSoeUJLkVgW2/5gqMF6eimGpJC4DP5X8Yw7LKKQpajecY6SLEBwwP9
	YhJiSBX1UrEBw1DdzBIBNdRiMaoohsK0vL1w0ylvS5hSpD88N9FpoSnwO5/OfMeU/kZ0=
X-Received: by 2002:a05:690e:1516:b0:679:9a1b:1f73 with SMTP id
 956f58d0204a3-67a4519e6a4mr2055322d50.9.1792911536548; Sat, 24 Oct 2026
 23:58:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023023105.28829-1-laoar.shao@gmail.com> <20261023023105.28829-3-laoar.shao@gmail.com>
 <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com>
 <179276890032.2252127.6836118712740428624.b4-reply@b4> <CAKfTPtAkN06AKxQZrTCT+_C=x7v8f+S3EC=nkcdyJpuspfop3A@mail.gmail.com>
In-Reply-To: <CAKfTPtAkN06AKxQZrTCT+_C=x7v8f+S3EC=nkcdyJpuspfop3A@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 25 Oct 2026 14:58:20 +0800
X-Gm-Features: AclHuK-MUo6kuLXbOL8Id-ZF9MQLnhulJ7KahyYB8JEZEOdIQvp8es1eXx3PZZ0
Message-ID: <CALOAHbAgUdVvvtdEjcP6otQgVmptsred+xZSLtDd9zj-bMmM1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched: use static_branch_likely() for the NUMA
 balancing tick check
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, david@kernel.org, tim.c.chen@linux.intel.com, 
	yu.c.chen@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:49=E2=80=AFPM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Fri, 23 Oct 2026 at 17:21, Gregory Price (Meta) <gourry@gourry.net> wr=
ote:
> >
> > On 2026-10-23 14:23 +0200, Vincent Guittot wrote:
> > > On Fri, 23 Oct 2026 at 04:31, Yafang Shao <laoar.shao@gmail.com> wrot=
e:
> > > >
> > > > task_tick_fair() checks sched_numa_balancing on every tick. The
> > > > static_branch_unlikely() annotation reserves the nop for the disabl=
ed case,
> > > > so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=3Dy) p=
ays a
> > > > taken jump per tick. Flip the polarity to static_branch_likely() so=
 that
> > > > the fast path matches the default.
> > > >
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> > > > ---
> > > >  kernel/sched/fair.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index 973647ad6c2d..71dc47d6114d 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, s=
truct task_struct *curr, int queued)
> > > >         if (queued)
> > > >                 return;
> > > >
> > > > -       if (static_branch_unlikely(&sched_numa_balancing))
> > > > +       if (static_branch_likely(&sched_numa_balancing))
> > >
> > > static_branch_unlikely is used by default for other static keys too
> > > like  sched_cluster_active, sched_cache_active, __sched_core_enabled
> > > sched_asym_cpucapacity and others ...
> >
> > every other instance checking sched_numa_balancing checks likely(), thi=
s
> > is the odd one out.
>
> Some other places might be behind another key but otherwise it should
> be unlikely()

Hello Vincent,

I checked the other places that use the sched_numa_balancing static
key. None of them is behind another key, and all but one also run
while the key is disabled:

  fair.c:  exceed_llc_capacity()
  fair.c:  get_pref_llc()
  fair.c:  get_scan_cpumasks()
  fair.c:  update_scan_period()
  fair.c:  migrate_degrades_locality()

The only exception is task_numa_fault(), which does not run when
NUMA balancing is disabled.

Please correct me if I'm wrong.

>
> >
> > > So systems which don't enable them don't pay a jump when not using it=
.
> > > I don't see why numa should be different
> > >
> >
> > numa balancing ships enabled by default.
>
> Others are also shipped enabled by default

sched_cluster_active, sched_cache_active, __sched_core_enabled and
sched_asym_cpucapacity are all DEFINE_STATIC_KEY_FALSE() as well,
but none of them has a config that enables it by default.
sched_numa_balancing is the only one with an explicit default policy:
NUMA_BALANCING_DEFAULT_ENABLED=3Dy enables it on every
multi-node system.

That said, Gregory is right in the other thread that I overlooked
the single-node case: with this change, a single-node system pays
one predicted jump per tick at this site, where it previously paid
none.


--
Regards
Yafang
