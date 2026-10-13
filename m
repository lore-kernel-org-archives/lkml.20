Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F123D8121
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882893; cv=pass; b=sTdmm5qHw1WPzH8Eh6ko9oNKJJ7GWyzvaIKN7E/t4B8OiZ+Xb6F1s2k37rdFMdazkpNlyAgaImq/4hLmweqSFYzXomRvH5jlxzBqM+u28oGW5MFtzM1/TO/vJMCQ1ZntHOvnHUexr9xw1uozUb6VSFPloy2nr0f2njdPgD+zOA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882893; c=relaxed/simple;
	bh=/ZDx0qigdFSyCGhZXlqU3OErEYAQKoc8EV1Ldj229UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdFoUFEXWi8N4Tk4cLD9Kz4DmlRHsUfXaeJeS8i1uo0XTkA0Jks+bVOICyOX5WxuhWxe/Zzz4TTIDt8BR4cYDizj+yz0kVr2MS/abpDCO9DUs0wHKSxX/TisbczEOnoOHIem2JRdMVhMSJRIeMP78ym7p3anUAA3lkvFaZXh2zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZnJLfpJ; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZnJLfpJ"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67699afea08so1787420d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791882891; cv=none;
        d=google.com; s=arc-20260327;
        b=V1FFLXWenVyO6Y9dgtgNnUHPEhitjLUKntSKNKCs/xKsdFs8UwRv8aMq0232CHc6Oh
         rM2HbdPp/k5leAjuS4T/wi13zAxL+6XXiKfhfLNMDDqvbqL/bDX7Pd9zZ+0hp2xh2lVF
         mkhiV9f7w8eVBrZeehnTnCj3VGxKnOuQPgQiHht/AylXA45wESk8/ohMzRNfUmywTCPJ
         /pjFtCnbbBM+bXkt9oHSYLUaHndzBj0DuAiefJI93AqVbTKCYVOOZ5z/Z9E31rr60MZ8
         9/C1VChiaTYB1mBLQ3hQpm+pmo4/NBiBRMk7MX8fnY3xYAzOij8aDXIeH2jYBPI6drMx
         qvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=68MXMWga95CH1/6xessB7F2BXfoCEeSgQgXov6Rw+cY=;
        fh=S99HEGhiSqUgXyqlSFffE0VEgl2Q4n+EHjnPrmXiOHc=;
        b=Fv+zqV34+noTA012zGd3wyyer2kOCG63stlc+fG6W7GnKmcCR4UEXnz/OLOXkgLs9N
         4x5JIaQ6Tspr9MCPdmKGYk6UNHVRoNWIlMQXBs1ZHKDo2dDUY1x4MaeLhFlND993+TBw
         O2YV8xVqk/v6NdX6/vDarwZb66gNjLeldoRq59U6wYdDQ2o9myZqvSF92KEMwVLVk0Eb
         q78hDw2J8e/K5mA+8LhnnBy/NkjBqQl5AiyEzCYYOF/6vzpjXKb+ysu+0v2/J4o1pQ/q
         tqtXZ1I+FH5q5UZHgAPjHAc5AdsZbEw0O4AXhhLLFXvU/DKgy/S5Hf+drr3OYGmUA1J0
         TkLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882891; x=1792487691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=68MXMWga95CH1/6xessB7F2BXfoCEeSgQgXov6Rw+cY=;
        b=FZnJLfpJ8e3L/C7a9A3Pw6TbT0U3CixM1NRdnXYpbOrg/qJxUzQoq8EBkruxqmk6kg
         nN2ilGcyPiK91JQJAYktOTGw75qk7Fb/0jsEf8zZtCtmLfd2F2R3kaGq2RE6rRruPiIk
         aqEVueK46bXUhu0mFn71yHTDpnrAsE017Z+lN5OOjDSYEPciC8lRWGlxbG0Oa9/8H71O
         4ukjDJmnC4QJLGuQzlPOWYF00rDMOqPDs4hi7RCzqRlo5BG+2XFYgsKcFDJ/DOSfkcBz
         /sANET4r060IxjbT9BlvH/f1Jl91CUgFh2vB3gGI4VHZmjqvBAe7Lnf+RcPEg1L/np5Y
         JATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882891; x=1792487691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68MXMWga95CH1/6xessB7F2BXfoCEeSgQgXov6Rw+cY=;
        b=KLkl9p8CAPQFeedNdMbUSEQyrZaAV9eA7bJyE2F38TwrOvcUgKcQ0CzwmmcqYHpIQk
         tUPeXzL+BDkoKpEySPgnCXPdTDnw8HStQvZ3ZCjbNdImy7UvIIO/I/slykwi4BfIMCsG
         lgYWjxnYRtTY0jQ0QGZibnJdzAvo+3nFax/rjW6SZoVNOk5e6N2wJX3nP5oFVSxO8p15
         iJJb56Yf5/vBzj+1G8A/gbn4Bqp5fUseCvYyDGTrKnJNq9gZY+YwXuMAsccAO8ZjBoSH
         NS6KtaPWbWhEdppu5mSlNF+WBnGT+X8WgWgsmnMmVdKL89iLnUf6LKQr6xA6nP7YO/CM
         OTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0DmvSYnVe/2vDrvxjEvWasP1ED+Jrd0U1NPXVtznVAmA0S9xuI1QgJqPMthNxFdZv0YVYdcDs1LtTuTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5W2r4CsUfMNmA1/gLB9Mo65ayNnYXxkE280qAOWPkAAEAYNnl
	kskeVVqOvOn7yCvX5BFCVhoBihsBDCttkrx7DL6FwjA5nYgjuu/bUmGc5JMIPjSOZJn/RgQapz/
	y00+B1kHiVbKiPDr+3Bg3jkX5V99sKeU=
X-Gm-Gg: AYBFou1z/uIdpdnJOH/XGcLNwkdkixN5ZHsdgLfZVSTNu5uPVMcQTiqZXaKkz96xh8F
	lAJk4zmF2NUlXRltwB6XhtqcVX97YuXfCEek6ubKvhtvRW+J4wIxKbEtNT3c5I75wnR2xYQj1HQ
	WfaXS4K7hRsspbPdzKbPWUmV6CAqmj/BbeDQoqd6EveP8fpXvrZ34rVD7K1TThMCDdgeQsKasEe
	VdApXBiHEYbkYsELSyX5ytr+x7SwWTwjwQlpv4vZyuOuLbFjrKTQsI3tHSgXPT9xDsh2b7NC63f
	o+JzzzfTU8Uy0C57EyvbpvTkITthEAJLa9DjzAesXBCdTFYGQW4hqD/Vvz4GpvDPqqLA6YCLK/o
	Jw3+HaV6c8g==
X-Received: by 2002:a05:690e:43c6:b0:675:3d40:3c2c with SMTP id
 956f58d0204a3-679362ba7e0mr2295954d50.81.1791882890519; Tue, 13 Oct 2026
 02:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <20261012120438.52849-2-laoar.shao@gmail.com>
 <96324eec-d307-4bbf-975e-3c9b3dd5e190@kernel.org>
In-Reply-To: <96324eec-d307-4bbf-975e-3c9b3dd5e190@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 13 Oct 2026 17:14:12 +0800
X-Gm-Features: AclHuK93g_25NJAT6wXES6RLREaNoHaav4Z0uWW89g_0G4Uh0XP2UqZ1IpTsXuI
Message-ID: <CALOAHbCOZdYe6E-_atuyT3UvOQt+j01Ru0ErknVutF8kR=L1Fg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] sched: add helpers for numa balancing
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	gourry@gourry.net, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:38=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/12/26 14:04, Yafang Shao wrote:
> > Two new helpers task_numab_enabled() and numab_mode_tiering() are
> > introduced to replace the scattered direct accesses to the
> > sched_numa_balancing static key and the sysctl_numa_balancing_mode
> > bitmask.
> >
>
> I'll only comment on the new exposed helpers. Some of these might make se=
nse
> even without the bigger series.
>
> (obviously, minus the task change)
>
> > No functional change.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  include/linux/sched/numa_balancing.h | 31 ++++++++++++++++++++++++++++
> >  kernel/sched/fair.c                  | 16 +++++++-------
> >  kernel/sched/sched.h                 |  1 -
> >  mm/memory-tiers.c                    |  3 ++-
> >  mm/migrate.c                         |  7 ++++---
> >  mm/vmscan.c                          |  6 +++---
> >  6 files changed, 48 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched=
/numa_balancing.h
> > index 52b22c5c396d..353772b49c5f 100644
> > --- a/include/linux/sched/numa_balancing.h
> > +++ b/include/linux/sched/numa_balancing.h
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <linux/sched.h>
> > +#include <linux/sched/sysctl.h>
> >
> >  #define TNF_MIGRATED 0x01
> >  #define TNF_NO_GROUP 0x02
> > @@ -32,6 +33,28 @@ extern void set_numabalancing_state(bool enabled);
> >  extern void task_numa_free(struct task_struct *p, bool final);
> >  bool should_numa_migrate_memory(struct task_struct *p, struct folio *f=
olio,
> >                               int src_nid, int dst_cpu);
> > +
> > +extern struct static_key_false sched_numa_balancing;
> > +
> > +/*
> > + * Whether NUMA balancing applies to @p.  The @p argument is unused fo=
r
> > + * now: a later patch will consult a per-cgroup BPF policy with it.
>
> Talking about later patches in a function doc is ... wrong.

Thanks for your guidance.
I will update it.

>
> > + */
> > +static inline bool task_numab_enabled(struct task_struct *p)
> > +{
> > +     return static_branch_unlikely(&sched_numa_balancing);
> > +}
> > +
> > +/*
> > + * The global sysctl state, for the system-wide tiering machinery: thi=
s
> > + * reflects kernel.numa_balancing_mode only and takes no task.
>
> The latter part doesn't make a lot of sense in this documentation.

I will update it.

>
> > + */
> > +static inline bool numab_mode_tiering(void)
>
> The function name isn't really intuitive. Should this be
>
>         numab_in_tiering_mode
>
>
>         numab_tiering_enabled
>
> or something like this.

Agreed, thanks.  I will rename it to numab_in_tiering_mode().

>
> > +{
> > +     if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> > +             return true;
> > +     return false;
>
>
> return sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING;
>
> ?

Agreed, will simplify as suggested.

>
> Both functions could directly have proper kerneldoc if we are already
> documenting these.

Sure. I will update it.

--=20
Regards
Yafang
