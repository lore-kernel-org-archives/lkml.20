Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44834342515
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054318; cv=pass; b=VfvWxiQxipQNxOT8vYB2gxPumoDYSYvPrJZeus++8uFP/APg8O/50l8eOMJLnEc6aZ/Fq0uRBJmO3K1srteO+oMY6MTl4N/Ho2QaLDpZlAEaYzfqD1wQpEgvL7xzlUnIpLhcSnGwgRm9cwBLOTydBNfTr6g8J9KN9RrB0T0QA7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054318; c=relaxed/simple;
	bh=NNl+ipcd/pauqWHrQHo6LIKG3wFjHQ+hTv8a30TTpd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuomzGDHmQGDWplJOuIenFD7idkr/Pz4hNVIKwAVVvVSfawRt2oGlTqOgRrG/3FJgYewFIyK0v08kAUr3s1iTbCoIQFc9POZML0oVqd8TpCh2Ue8B800vuCWEKYcXhKEP+80vNOnvJdT/W4MLUsF1yp3QQFgNgjyazEMaRvu1Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OSLiL1bQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSLiL1bQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso213050366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054315; cv=none;
        d=google.com; s=arc-20260327;
        b=DlgkVtvDHCrTnfDDHGw3u3b7Cp7mUDk8vf51BVpt/7FAy4qv462cl8vfymud+aNmY6
         hamT4oSEGkSuixrMDPtOCHZRWQtIZFuFovQRUtDBw2Ds0Ms8sLnSctpXQXr8AhaPDBWh
         HICV9WZdyIU/nGXt9nr92MHLMUCRUGKyBAaq8+sjw6YW0sezJsGsG/mdvPXMPQEg0+6U
         JW16KLImYW2fCNufqBQzFs+RuGd5ENL0VRVv9yxnMu3dmlKd0i4l1X4S9wO0sZzw05bb
         oUhlBc9F1mW+DYqcUFvJwQjxGc9VgR/4nZIZnPBJ4GBpZk4sMTvuL16BMPpe2HlCHkGa
         BX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNl+ipcd/pauqWHrQHo6LIKG3wFjHQ+hTv8a30TTpd0=;
        fh=3CA4uLv9DADarCl5svSvZ2zMuzn8YMlidGNfER8bikU=;
        b=FGJlbt4j4z1OlbLh52VP/ysvTNiEqDtJwChbchtCjMXgma5lq5WWID0njSCWo8/hl4
         CxzJKzVUu39RWPGdJJxf1rHtHsM6XKP5mAUG82+r2Fkf0Pr11iaFLe3EskWCJXcDHlHW
         M4PR1p1fs9aneToqUD+Yv10je5IocryvxJuiaALtlDNQXlS01/xuEDnN7Q4/xayq9sUS
         dCYzAA6+SRnqQE2zwd9A+YxReCft8sHtPE8jga7Lj4zdb0rBuPUThG+iHPHH+JMuw038
         fBiTIo293o/QuXP3CIgtKD+XrorBx8uJVifB3Fb/6ZdfYA0hswqdC1ZnEpHV7KnN2rMK
         dF4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789054315; x=1789659115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NNl+ipcd/pauqWHrQHo6LIKG3wFjHQ+hTv8a30TTpd0=;
        b=OSLiL1bQq1gBiBD5rG1aWtSxws46SZWHYAIp6eu6brYB7m7kWShhou6Bx+rNjok3AJ
         PQOxmkbTdU/+p7DXUo9AlZjaYDW3kf1y6oKNZOnNotlEPQQGJXOCbdSWdSVG6SVqpyIG
         bu4sTXAKSGzeJGTbvkw4i6J+hdkoL+UhrRDMNbARjUfkRI3vQdtfqfibOARif/A5zXBu
         NEjL/hX2h4o7wzv5Mc8N6PBHlmX6QFXp0oCNDTkCucFVeBlDCGteLMI7BzqUrAC/tNuu
         gqgea7427CkubVm8nAXRuQklUHR5bUpBQ7mkkIjQx1LF6lUSAfBEHgw+NEDLx6xVN5tq
         5u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054315; x=1789659115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNl+ipcd/pauqWHrQHo6LIKG3wFjHQ+hTv8a30TTpd0=;
        b=QkyPQSIqWaH9c3PyP0k23gX2EytgmeEaQQ2hXkJl1NpKLyL9Siq5SldEHzE1yFUsXH
         xDnmgF4vHRpsA+54B1ItttCFkKcaBPiAhOqJj5JCoJn2z85zPmEC3cipZfCq3hrZyZRE
         OaRhWz8P+QHvmrmCP/CBhKCJ0SDgPkiH1czrmC6PrwO8Q+NJVZFdYevvAlUZqTwoUfyq
         BX5/sEhilkanp6UqWX3enrmS5VadLU291q3S0NskEvkrwEUISUlYdX9HaydjmxzZhIPN
         k8JGiFoVPoNc2W19jUuUZ5dGmU655g3p7/uZDNJBAB4wBy8V6jPnHYrf9mASeL4absQf
         OsBw==
X-Forwarded-Encrypted: i=1; AKwUvBwWB9oO0QiHxxs6+3P5vPNCB3xrBjuvQ7XL1AyQOdELD/83V47toJUgipqU+nICpV5ZgLRW5LsEtP/N4LU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3WIXTAklJ8hi1qnegTfy6so+s/P01hTfz+DYmX+0jsCy1NWSP
	GXGthHMhFvzGllRbQmjHULSfW3FRSHsVQFl+NL7IrCihsy90c9bUlx2+MOlYchWTiMpucykJK4j
	T4j+G0uLgfS1ZUjYiTMjU/HSwNgwZIZoZL7YkZV9B1w==
X-Gm-Gg: AYBFou0W5gVmGwNfM7Yx3Ce2qlmoygpP1N/Ql5FuLcEq6RQxUq0ptVBFrcsEETaCaaA
	HXwCCmo/Sa3bptZsppcEO0u7kf1WzfRRyK4p20QUbBO+2BRHZURqrgz2cMNcgkLSyhf8s2K3FAh
	IDajf97qDME2FATmDCu43vgb7nsI5J6ZI0ybX16hsgezdKYdrlFrOAYQ2QqcOl2VDRKpsDkuuPF
	4Al05VK7bK9k87QPOJ4uwEYkNB43mVMa/Z6nVCOWdEKE37XUk9emHRXoo+fj1xmoeeyY+3qfUuT
	9NvpZDrLeo3EwaQy4PhYlwAe+Bzh6dPgY0Q+nIxCsRqdecJd5bgAWdNdoDRPv/qz8Zo7BkmSgV7
	U99lXzsGLRbhQ
X-Received: by 2002:a17:907:198d:b0:c25:5a7:87f with SMTP id
 a640c23a62f3a-c2941676ba1mr377220266b.0.1789054315143; Thu, 10 Sep 2026
 08:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtAmB8pQms38CWoXPmG7bL64mY8L7Gyd=_LvNoM7wvEgdA@mail.gmail.com>
 <20260910143907.1992715-1-jackzxcui1989@163.com>
In-Reply-To: <20260910143907.1992715-1-jackzxcui1989@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 10 Sep 2026 17:31:43 +0200
X-Gm-Features: AcwNN1VNWxt0_gt49JU72qH4vk_ws-2jVNcv80PioylZ3R-4Lixhh1svLbm30JI
Message-ID: <CAKfTPtD1NZ=AOdW7z5KyVHqaoEPso-7yqsicj=9t4zM20qJ_eQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce
 select_task_rq_fair_thin() to select rq when LB_PROMOTE
To: Xin Zhao <jackzxcui1989@163.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sept 2026 at 16:39, Xin Zhao <jackzxcui1989@163.com> wrote:
>
> On Thu, 10 Sep 2026 10:19:13 +0200 Vincent Guittot <vincent.guittot@linar=
o.org> wrote:
>
> > > +/*
> > > + * A streamlined version of select_task_rq_fair().
> > > + * It runs faster than select_task_rq_fair, especially when there ar=
e not
> > > + * many CPUs. It will prioritize selecting an idle CPU in the follow=
ing order:
> > > + * 1. prev_cpu
> > > + * 2. recent_used_cpu
> > > + * 3. cpu belongs to intersection of sd_llc and cpus_ptr
> > > + * 4. cpu belongs to cpus_ptr but not belongs to sd_llc
> > > + * If there is no idle CPU in cpus_ptr, it will select prev_cpu.
> > > + */
> > > +static int select_task_rq_fair_thin(struct task_struct *p, int prev_=
cpu, int wake_flags)
> >
> > We don't want yet another select idle cpu function.
> > The only reason select_idle_sibling() would not select an idle cpu in
> > your llc is nr_idle_scan which will abort the loop before checking all
> > CPUs. You should look at why nr_idle_scan doesn't keep all CPUs in
> > your small size use cases
>
> Adding such a function to the mainline code is indeed not a good idea. Wh=
at I
> actually want is to prioritize selecting idle CPUs within the LLC first, =
and
> then select idle CPUs outside the LLC. However, once the fast path taken,=
 if
> I=E2=80=99m not mistaken, it only selects CPUs within the LLC, which is n=
ot very
> friendly for machines on embedded platforms, as it becomes difficult to b=
ind
> tasks without crossing LLC boundaries when the number of CPUs is small.

Ok, I didn't notice that you were looking at all CPUs, not only the
last LLC. Do you have more details about your cpu topology to share
with us?

we have sched_balance_find_dst_cpu() which looks wider but needs
SD_BALANCE_WAKE to be set in your sched domain topology

>
> I=E2=80=99m considering I can modify it as follows:
> want_affine =3D !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr) && !s=
ched_feat(LB_PROMOTE);
> to force the slow path for core selection whenLB_PROMOTE` is enabled.
>
> BTW,
> Regarding nr_idle_scan, I have derived some data and the analysis is as f=
ollows:
>
> If nr_idle_scan is 2, then: y must be at least 512, tmp must be <=3D512, =
and tmp
> must be <=3D 512 * 10000 * 1024. This leads to tmp <=3D sqrt(512 * 10000 =
* 1024 / 117 / 117),
> which is the square of 382,999.488, resulting in approximately 618.8695 a=
fter
> taking the square root.
>
> Multiplying this by 4 gives us 2476, so if the estimated utilization of C=
FS
> tasks exceeds 60.54%,nr_idle_scan` must be less than 3 and becomes 2, whi=
ch
> may result in missing idle CPUs within the LLC.

nr_idle_scan has been design with large llc in mind where scanning
hundreds of CPU is significant but when you have only few cores, we
could be more relax in the number of cpu to scan

>
>
> --
> Xin Zhao
>
