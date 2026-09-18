Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49139795E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712654; cv=pass; b=Oj4IP1eUuSIUNcuMHe5cRQV6bEclAsukYt8DyWyueK9Ox8+q2tZU8yglXPxxcvHjwhrTOGoYjzeyHU9Zl5lPPLxhDDponoSrzeKq/Oe6uHjq1Ij0ny2B/lYeUfYE1WpijDvYKaWxTWoSnGzPlJt5WMpuYAGRKljJhgN0AVyws40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712654; c=relaxed/simple;
	bh=gKWw9x8JTodOcnvmRxh+PRPQHGvF1rrY+vB8Pdy4+pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T30WmCP/UzE5Ucc15Pe/ujptss4f1Q1DIgYu2WCej8E1xqh/+fpueZJxRr4gFtBNmtjxZuBsVYF1+s7h7Yxp2VmIsIZeANdvD7JEAqmJwb1U9mzfLGt1e226y8+9HHryx9Mcm/dH2xHK1dhPU1ipxU+hf+uHXR5e4gwfK8VXjKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzYkELJX; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzYkELJX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so42197566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789712651; cv=none;
        d=google.com; s=arc-20260327;
        b=OBKdYIJ9zqNFUlDlezo+duq/GfKG1N4gEcjRz9nPo1Raoc5CvvT4qVQxuAI3erE1Ed
         B8bVSy7orJZaIQS1TqGYfkixYSW4MGtma2mDpK4dYkLFbCBgZywni6ynqJNrfG5pfUmM
         3nf7vNsBr9wwyqzVImc0+rxXiiBDgFgB+XrqUjP19srx3ofT7gabvwAp38l/5+i/+n5O
         cvX83ndby6dZUzQ5AuUbAxnjKqWSIONTpele0/VKQYxFJLHts2oiqyqRvpY8BANoiC9n
         1X8cNJsmtoE2Kyo6qd3O3pMCxTLGQl7Rs+mD2hyyBW8ML0Smr3ZsRo8Mkmq9euen8jSW
         ogpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        fh=MAYVedAeG8y4T8iOuRWJmRHqGa0clLzdHPpohilKhPk=;
        b=JtqISI7IHstRFpatN/q8pYiGcTLUao8PBKhvrsOGtIsQ2jCDKLOAy9NiN3Wku8TAhU
         oI5WEOVhSDKZ0kwX++ZpUfWD8UdoqqrtAeuJlujtZAhh9GpA0GDQ7TUthSGKWaZMSnfv
         5hxmWFkqyRAvH5ZygILikrRnoPWDFkblD7+kutVvEGrN7yTf/xYf/hudZ/4NllmoFX63
         cv/ymqBlm5RvhvBMhTbRZ4V8BrqWbcmlnwfnUc4DvF6XzjibfijVFhQTfsEK0bHRu/Jp
         QesS3g1KgRdMfCrnkdE5McnPD9rXK857agry1p1lwvl8zed3Qk8mbejM3XjU7bb/WSZD
         V1lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789712651; x=1790317451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        b=AzYkELJXtqynOSkGa0/V2EVsLrAPAZrtPmIJBdmZO77ekW6x8SGL+VQcQjedUrF5eo
         mNiKafs/Q61Kr+6p2YeQSXg7zchHN9OaIXNnniU4cwjKKHd00fmUgQDoaTgVK5RZ/6Cg
         fdEbFfLnhk+19zvedSOVo5DxkGvRJYzUrIwSCO8uIfpz3rwDOqXjuracyQgDsypzxLLI
         xZNJxZgJLiOU9dWZ1TVeQfHFykP7wmB1Jx5xrticS9yYNKyRa+cvyC2um0m/9ML+wtZX
         qV8CHaajkgJG5dboEbyKuPIFFfySDR9Ivp63xplp+0xvS2YdXGPWgl9xS6KwwSBnpLBk
         BjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712651; x=1790317451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        b=apfHSgPyB1q4sBjg+N7TXDVUpbFlZtOeqDxgZmBaY8t+m0eN/Vj3yUj7tv9ZJe/e8H
         GT5gQmlX6qKg39np+Yi+qGs6yGnB4oEjkvJMcx4fLVhTj07uIg9+9Z5C2SRktM/2Qw86
         O9mVNN+KW0gAha5+k0ewpra4MvgP2UshVhy3xiuBO0iaNv6g3cag4voVLawRq2jZkV8P
         Kphxw3uDCDKp7IjsHRKrWbOFF6n5JogfyXlTYOFW0VLl+bquhmo75vz3UY66ZrdhIxzl
         DlTov4GyW3g9R8KBjh5fZBYCZkKy/YJBGhWm300vuh0qhWRNkGapsIC92LyReNDy7Yac
         2NUQ==
X-Forwarded-Encrypted: i=1; AKwUvByDXAAOx7AF7YhFrhpkb/PTsK0m87EE8GYLlPjDcgFD020uyaVeFBvaPYiZ0c3OBKuhFlumyrwNfENPIPU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpfMlRL3wt+J38kj7RxzASHXzNzL4md1CEYQRW6aUfMt84aYXG
	Jk2DpHqp/v9nn78BGTHcbZSJb5iutDSwLGcklTifCGgWLIH3cx0iQpNTB+j3RwGu8KWHgDAe7ZL
	Q2zIfNE7F0fX0iqKkHwFPIA0BGapxkag4KNkWnidcFA==
X-Gm-Gg: AYBFou3zW3Fvmw9F1Zm3ksf+W+zBNb9Gmx6i/EQ8ac7AW5vo2V4DzvIPg87MV/Wvudf
	yRCBJZF5sFK2L6ls8KY/WHvg4mqFyUGnn47bXSD8ggCYwcJHhEKVWRjl4N3B6pJZFwrU5h45JGN
	8XN6bj4PHM+gtRbo9Io9VYrreqoZDwTGf8mGOauc53MORYxDb1J6nlUS3NlwG2pa9bFAZuYgzHE
	9V/goPusNzpID1Nxlz1SXf2+EDmLQnCOvBq1ieENzDCHDeMMiriC50ZtNv5H7rFr6AY3JanXOby
	tl8g1hq4CA10tUpKjAg9UDPE3ftSNPYpIQQmGXvU6CbnX2veMc9mMsrDPTc2dQ2HxlWkyQIvIGk
	Aw03s6+Ssje7LVWwFKTGwb+w=
X-Received: by 2002:a17:907:80a:b0:c29:41d1:a0d5 with SMTP id
 a640c23a62f3a-c2a157da402mr160549766b.18.1789712651224; Thu, 17 Sep 2026
 23:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 08:23:59 +0200
X-Gm-Features: AcwNN1WhgIxSpocDyghjtGrojLm9grxaZjWOAuwhdngiTrD_2aaRj1QPhPIvXvw
Message-ID: <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sept 2026 at 21:07, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Sep 8, 2026 at 10:31=E2=80=AFAM Ananthu C V <ananthu.cv@oss.qualc=
omm.com> wrote:
> >
> > capacity_freq_ref, the per-CPU frequency-invariance reference used by
> > schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> > If boost frequencies are filtered out of the frequency table because
> > boost isn't yet enabled at boot, max_freq only reflects the non-boost
> > ceiling, so capacity_freq_ref never learns about boost frequencies for
> > the policy's lifetime. Enabling boost later raises policy->max, but
> > capacity_freq_ref stays stale, leaving schedutil unable to scale
> > utilization or target a frequency above the non-boost maximum.
> >
> > Track the highest frequency in the table regardless of boost state
> > (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_freq,
> > max_table_freq), so the invariance reference is boost-aware from boot
> > regardless of whether boost is currently enabled. Runtime enforcement,
> > still handled by policy->max, is unaffected.
> >
> > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  drivers/base/arch_topology.c | 3 ++-
> >  drivers/cpufreq/freq_table.c | 6 ++++++
> >  include/linux/cpufreq.h      | 1 +
> >  3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.=
c
> > index 8c5e47c28d9a..da94f77441da 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *n=
b,
> >         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cp=
us);
> >
> >         for_each_cpu(cpu, policy->related_cpus) {
> > -               per_cpu(capacity_freq_ref, cpu) =3D policy->cpuinfo.max=
_freq;
> > +               per_cpu(capacity_freq_ref, cpu) =3D max(policy->cpuinfo=
.max_freq,
> > +                                                     policy->cpuinfo.m=
ax_table_freq);
>
> So isn't capacity_freq_ref supposed to correspond to the CPU capacity
> returned by arch_scale_cpu_capacity()?

capacity_freq_ref is the frequency that has been used when computing
the capacity at boot and it should not change at runtime wether the
boost is enabled or not, otherwise you will have some fluctuation on
the system capacity that will create issue with PELT and scheduler

>
> If that's the case and boost was disabled when the CPU capacity was
> computed, how can cpuinfo.max_table_freq correspond to that capacity?
>
> >                 freq_inv_set_max_ratio(cpu,
> >                                        per_cpu(capacity_freq_ref, cpu) =
* HZ_PER_KHZ);
> >         }
> > diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.=
c
> > index ea994647abc8..4984142dc08a 100644
> > --- a/drivers/cpufreq/freq_table.c
> > +++ b/drivers/cpufreq/freq_table.c
> > @@ -33,11 +33,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_=
policy *policy)
> >         struct cpufreq_frequency_table *pos, *table =3D policy->freq_ta=
ble;
> >         unsigned int min_freq =3D ~0;
> >         unsigned int max_freq =3D 0;
> > +       unsigned int max_table_freq =3D 0;
> >         unsigned int freq, i;
> >
> >         cpufreq_for_each_valid_entry_idx(pos, table, i) {
> >                 freq =3D pos->frequency;
> >
> > +               if (freq > max_table_freq)
> > +                       max_table_freq =3D freq;
> > +
> >                 if ((!cpufreq_boost_enabled() || !policy->boost_enabled=
)
> >                     && (pos->flags & CPUFREQ_BOOST_FREQ))
> >                         continue;
> > @@ -57,6 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_po=
licy *policy)
> >         if (policy->cpuinfo.max_freq < max_freq)
> >                 policy->cpuinfo.max_freq =3D max_freq;
> >
> > +       policy->cpuinfo.max_table_freq =3D max_table_freq;
> > +
> >         if (min_freq =3D=3D ~0)
> >                 return -EINVAL;
> >         else
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index 35ce665edfd8..3f3b1380251a 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
> >  struct cpufreq_cpuinfo {
> >         unsigned int            max_freq;
> >         unsigned int            min_freq;
> > +       unsigned int            max_table_freq; /* Highest valid freque=
ncy in the table */
> >
> >         /* in 10^(-9) s =3D nanoseconds */
> >         unsigned int            transition_latency;
> >
> > --
