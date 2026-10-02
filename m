Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1B14A3D47
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956002; cv=pass; b=sILmkuWQz49pdedjs8cV71cF9ALA58oiK879W6ynQt3Xf4tS5+sZJ3idJ9fMI4uXIomrvxB8VvbOwVUlpW4ayGytCHfcBzv94h7K6vLu3uXp3DZH1i/Sar+dydqn9Bb5H0lcF7//kEoABKugTiDdzEp6GTcyCph1eDO1qxNU88E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956002; c=relaxed/simple;
	bh=SRGBxMUuQUFxmxIoae/z6NBAxRAfM3VcFMPgWibQppc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svnrlF2vY7g8jynIoqVBWcX5OGHijqR7PSpwC4cc8T3eddL7IUNEornDWlq6ySbYqnAHRG9OfXYfACItG66d4IcdYKnomXnS4ZG+IdLIon2QrixHHoKkfFe7O2+zyUyIEZZhrTGtvFI0nwwIKTxgr4wQhfmuaMcbMaLpkaC9hco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AW4QpbqB; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AW4QpbqB"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so36405a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790955999; cv=none;
        d=google.com; s=arc-20260327;
        b=cYI+hP4ZkTRIbbnKmO1vd96SXEvRiCfkg2XadxjC/PCNC4BmqIcajA6M/tOUA6g2Ix
         tiqdhvyMXLp7ziwC48i+oTjM6g3x8fDOWgN9ORXSHotWKBK+4eW7c4OJJh4/6DOM2IzQ
         uh5QHKlyWXJ9IE8u3oaryLKoF4YzLhRKKn+UwCndtEPh1ZjjiaZc6EHvyqZNoJ9n9HnX
         LJArcmwAL3q+W+Ny7JuON10l7k6egqVfBOvU1Le0jVmERqNHWfk7P6XR5DzrdMUfaTJh
         W5w6JWZbnED+NFgC71TT7bhJh0Nlo2fYugKsA0FzC4vPqBaUEw8FmhXcofUQSBLhLEpO
         o/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hsoBMNazjAeXHB1zUI67fmAX8wcq08zFjpmCq7EhTx4=;
        fh=+vfD2K/PHjJ/jQxvmB9/AkktdNr5O+DEQvmkFIh3aR4=;
        b=I6RkMzq/z0BPH043+NrOZx/+fWjN2No7w64xFc+yk80X8OWzzxqH+YVLREgL6Zk44f
         vS5owsxvxMDw+5P4u9XSXYwbgmQYPU4r0CA8trbT14NYe5v6fkvQJxUXpY20FjpssME1
         hVCC9dmavEOuxK9YmoHb1KDLvqV1/uEDVhUc8+8xj8vnFpHYmRcOh2s+o3XktrY7Ikdn
         CXRPk/xaIclnvn15o260prlznMoggIIs2VvjZH/O/eILtzGLPsZmz+BwHfZV5FKfZwhT
         s8/En49JdpBetgfSyKuzOsdRD2xP8ROu+jyx+EDn/cMlNseCl+CijGuUvcY9SOo8LROD
         15fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955999; x=1791560799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsoBMNazjAeXHB1zUI67fmAX8wcq08zFjpmCq7EhTx4=;
        b=AW4QpbqBC/YiyMgjhAw926kyLpIy5QzKv72UhKXmz9Lc6iUGqOrrI27jli36CXfEMI
         mFc87ObEh85n190v1cTWG0/0goELQKOeqItbYnzHJZi9ydFJBYidE136DGpPqYXzGEgV
         EN1yGxZLX1DoWLvi28/lZRrMR/kwoKVeW8ymDPl8Hy1z9TdoUGiyrAqeyekmig7CganT
         /Eo6CSkQ07bioEyzE0X0wQfYuCADc7wVxFCGhMvdabEY+Bstt6E29a0BFbx9ovmRiOaP
         HeR7WaPHf7eoS7jLcXgN5+COaP8n/ub68HTZe7VbZqmpzpDpjiS9AOxPGkp/V5qPbk/o
         mYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955999; x=1791560799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hsoBMNazjAeXHB1zUI67fmAX8wcq08zFjpmCq7EhTx4=;
        b=clzrBzAuyGTAoJuPLUVSnHDlP6f3eN3vSUdFmMBx5aVpGCbePdJFMh4O378BfBk5Lu
         3IslmDtumfHIweayyg4b8u1Ou5xLNhlEX61npHRUYmA8rvoRF9pSL3PZV4BklWKzR4Mp
         l87D5FDXcufFYSFoIOuBC+CmJlNeQU1k39uHIuhmg8bmYSkryeClIRmjRfGCLpqe5PpQ
         hlmVrIgAsniupivMr/8bm1hWHUoaytoq2D3E0uH5CF12ps8y7qufFK+Kh+7RChZBosYe
         JxHGpHQkLVb9Y0mtHPqUwjax9GA7kscnCQwIDC9CtYhHvNefU7bDLQdWrj0rzcn52fsJ
         vqVg==
X-Forwarded-Encrypted: i=1; AKwUvBzPv5hHxdziLY1gN5YHTYZ9NHuMMnTEh+UWHlBQl2xxd5qEn/kS+SgHVvpzTZ0jPhgmpPqHp1GAmPCJpVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD4XiLIu7MDI5PXqza3dJLDi/gjgPlFqpoa+m6pRds/CgUXtut
	UC3Ntg1GSKXjMcSnOxVknTgVoZil+0s+75Tk8fmSS0HH6IAyYCKRhMQOomuMzMiqLyLNN+Psmvx
	KaJoV7oicGnePL48+QNpoEV3VYAM0WgXDYePgc2URjw==
X-Gm-Gg: AYBFou1dc3bv0pla4dKgQo3dRka0aiL3rhIBBMNd2cKJG2y6xDPsH8sbwjWGQedas3h
	8M0M5d24V+x7Ej/kXIknYOoChF+s2LIBAkVUiLURBuqGcBK7Rbf5pnJW0Kf1mTYtAH2xAftIo0n
	tjE1Mu1NBw9y8u+JfITS9DcsD8newkMIbEJgasrGJFGM56opazmgyI57nKDFAvbQa0EZvyks7Jj
	Y5Mycye0t/LpneHvalbVIOEywQ8jD699SUgqyRCapUm3Zx2MknhPv+fSqnGCVQBgKqhkHQDahQQ
	PaM5bS7NmQGMESE9cDkTQ+aHBt9lfXLi3I54zDi3lxASwyjqc6J+C7RGJU2OtY01wFgnCnNPoUZ
	d6E0E2fQRl537
X-Received: by 2002:a05:6402:304f:b0:6ac:70ce:ba8 with SMTP id
 4fb4d7f45d1cf-6af9e35a2b5mr1569759a12.35.1790955999382; Fri, 02 Oct 2026
 08:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-9-vincent.guittot@linaro.org> <b37e8f1c-0cc7-4ca1-9e40-620d908464bf@arm.com>
In-Reply-To: <b37e8f1c-0cc7-4ca1-9e40-620d908464bf@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 2 Oct 2026 17:46:27 +0200
X-Gm-Features: AclHuK-piDLEc3bB9N71ZMnegoNHNTTmEK_VQy7oLjnvL3YExo2_PR2NPcT66Cc
Message-ID: <CAKfTPtCh0+8YWsiSeKR3ZGMAz4b+u95jVAs4kNtKjcUBVnQpBQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 17:15, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 9/21/26 16:22, Vincent Guittot wrote:
> > Add a new level for selecting CPU when select_task_rq_fair() fails to find
> > an idle CPU. This last level will compare the slice to select a CPU where
> > the task could run 1st.
> > This helps a waking task to select a CPU where a longer slice runs
> > instead of one where a task with the same or shorter slice already runs.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 63 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 62 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 452da94289fe..5c9add3e853c 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9023,6 +9023,59 @@ static inline bool asym_fits_cpu(unsigned long util,
> >       return true;
> >  }
> >
> > +static int select_slice_cpu(struct task_struct *p, struct sched_domain *sd, int target)
> > +{
> > +     unsigned long task_util, util_min, util_max;
> > +     int cpu, nr = INT_MAX;
> > +     u64 slice = p->se.slice;
> > +     struct cpumask *cpus;
> > +
> > +     if (sched_feat(SIS_UTIL) && sd->shared) {
> > +             /*
> > +              * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > +              * the scan when not preferring an idle core.
> > +              */
> > +             nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > +             /* overloaded domain is unlikely to have idle cpu/core */
> > +             if (nr == 1)
> > +                     return -1;
> > +     }
> > +
> > +     cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> > +     cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> > +
> > +     if (sched_asym_cpucap_active()) {
> > +             task_util = task_util_est(p);
> > +             util_min = uclamp_eff_value(p, UCLAMP_MIN);
> > +             util_max = uclamp_eff_value(p, UCLAMP_MAX);
> > +     }
> > +
> > +     /* Those CPUs have been tested not being idle and fiting */
> > +     for_each_cpu_wrap(cpu, cpus, target) {
> > +             /*
> > +              * Stop when the nr_idle_scan is exhausted (mirrors
> > +              * select_idle_cpu() logic).
> > +              */
> > +             if (--nr <= 0)
> > +                     return -1;
> > +
> > +             if (slice >= get_rq_min_slice(cpu_rq(cpu)))
> > +                     continue;
>
> Maybe even additionally look for the rq with smallest
> current->vprot - current->vruntime?

We don't take any lock so can't use current->vprot or current->vruntime directly

I have merged select_slice_cpu() in select_idle_capacity and
select_idle_cpu() in the next version that I just sent



>
> It's an interesting approach, OTOH of course it disincentivizes longer slice
> tasks again. I'd be interested what this looks like on a full workload
> with different slice lengths.
