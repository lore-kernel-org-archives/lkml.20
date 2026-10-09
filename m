Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A254D9F76
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554664; cv=pass; b=EzjjE0Uyh5g1Px16nrxo9y1HFhAm/mH7Uyr7QrQ4NYRIIioI/Bw9XrEWD78CO7t5+MM+uBEtVbwWtv/g6lUI8LQZgioF/N/caywATypbYKRbqv0xsLGAE3X7043i9UI8oqnZ8pzCE/rh3q7ZMEM8ckYk+XOV6AnbFpK3cOOO8Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554664; c=relaxed/simple;
	bh=+HnSit/5/uIBAXvpoT34XbcMxm0QUvBctmOU9VDQG8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGxSt3UNxXusIHkjKQMzR9gGEl2SwPbGw9UC1Unw0OEiulS8hdp6ao/xniHhTEnzvSRSQb8y0indMWz2au4qmxJCCtWjT6MJiiyenUuJv5+TREfQqGMzTZtNRnT73WL8PrGDqIFXJ9z+UP+inKcXwmlG92v2L4UbZEmdphz8vvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwhCR56/; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwhCR56/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20ce3c118aso376341766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554662; cv=none;
        d=google.com; s=arc-20260327;
        b=YL+VPA7fgFAw1Xk+8zgZb/WIfYJ37Rz8AIJ4dqIfBfow5EZSOsAqBegu1mbQC+XsFJ
         nVeg1nV8DntknS2mhBVB0UuK6lyVyG8HKwQiEHtBBv6eKjmxFr8uxLg8/h0isP4Q906z
         AMJ4Rt5a4hfNGHZEg96kf+KLQ/hHACZdxhPM2QWp0kC2gFm2WhA2/1yzjbkdpIwKmnQZ
         zXCnC2uQC10MuJfQ2Tck4kKANFX62asfS8IlrNGDTlv/8hnGjeiJbyFQ82Mx1RAWYFMQ
         Jx6ANzuP9DS5G4a9YSXaSYesqcivuYqGnjbuz5U9ADP/EzSiFE0gpaTUx/ilpl2H4Iuw
         2OVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IeMqwdQ4R4qb72l2CyUr/K1XQPmObo/435VbGVCnIr8=;
        fh=saKg9dJkSBpgYH7Autq9Qdv0kzNC18sgobyoVX4P1Y8=;
        b=Q93fvfyzDzt8TGTb+eg6M67z6Nt+lRBx3/eV8U90aZkqsK7zlzgFqhAiazzEiF7ZRc
         swSMKr1Frd0qi6e1ziS/cERK/ktDQhUCuTEuf+U087I/oPV+HyUeKeXALtI36Fr8YurG
         V/IjR42tTg00xwJITeF8q98sXhGrVMg+JwI0lzlJa7sh07jC32VXUqqDEszzxjoAKiuK
         r7+vEtF8fbVk6IGnPwrL3u9v89joOJ/3KhMTzFL1qZW9DA1wzFA2hwtGdKS8crfrMCtZ
         wgqW99DfL3BULdA2xP9ln3Foy2UWcg2JwVz9IALX+sa8QavdG9EcClGf6oLCVlWMCqwG
         T9Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791554662; x=1792159462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeMqwdQ4R4qb72l2CyUr/K1XQPmObo/435VbGVCnIr8=;
        b=UwhCR56/4HCe/U7/N5flKGhytQ1/JkHyzbwYvLl1CHqK7HfFdYmxGfI2eyoZnO3fYx
         vy6Km0qIuY10atB4p+IijZMsjVOdhmYtprvjScxTQke2BZk/03vUwxblqe5gKmuks9Vr
         Xm0iKxD2zBYO4yfziXgssRzNdQqPIpfpzL8henl7egCMtfttSpswKzS6ba3/fWMQ3Gox
         v0n7K2c0NmEnTHLxtkzgFaCphBRczWFf9jbplBh10+GOU2l1/+v1UR9ZuL16S+133POp
         114YdIDBOuNYb0rx2dIP3BOj9cjZXG5sC2FqvE1LeWyTfn+afy6+rt9+6FApDOEo92en
         w7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554662; x=1792159462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IeMqwdQ4R4qb72l2CyUr/K1XQPmObo/435VbGVCnIr8=;
        b=IdzrOkcVm8BtjlgC/0J2qaipsH/CtRnTwLk+CXHIkeev988qVLy8oitkmn28KHy9rL
         f4VnpkTIi105rJhyW8tW6T8Fb/9jKDlOXluG/RmPUjOeLMiT7ZfYK52mEMoxpvInroOt
         aKzTl1/Uuoodcs6eDRwHN4XZPprsYGgejga3qHEyC4Ujr3Y8ns2g+TEX5uVe4nWGiT/w
         3dxhlvrdPS55dV9EkLRJ8uuGLU+BL3z7vVv2jkq3sGUad9CiMypsHChSsV1VrKtF90Cj
         S5v+68RuhiKwIKy1LX41c53PxJBKmIkWgiDtAKGBUivEdUeMEHJQZ975DwIYf35NUsf4
         jNPw==
X-Forwarded-Encrypted: i=1; AKwUvBz2jfDRSNVdCS/Wj/3vgLBDBUWBj3vSEThQ8Ji7eZip2cMxjO+5j2p5beF0FqerbCAA9mMmJ8LazcSc0qc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOPQUees00y3tZQBjpyzcDjGhPxz3c2ICaBVhvEik1sGG/C46E
	ZCQ4GpRzgfck4QEfLYXzBirPh+5Fwnleutbzca7rjFQHiivo4fA1aRapbRFi8vT0yKLXHfwK0C4
	t2cB0qqKoICowI1+nkJe1sm7TWKwRY9aoj7cVA8uA9w==
X-Gm-Gg: AYBFou3jjJs8TvTVRE9Z/sRiwraa3hdQ+NwjSLdJH+IfbJWJ+WTHCod+5kYcaR/r5nk
	xfKThAtRAQbGmSIfxUsLDVYsfjAEcBOeRRgPO3QwZWByVSHBvsDXEidsmaIHca0nzpx4SkJRDth
	DaOEJlGPv4fq0yAkBraVQxNuMdNiRFzjz+TJpQzizzmjLpeI3MdTe13bXQ/4pgmEyOhDpBrPcze
	WbBab5OD3F629/PJDQVGlLkuWXJ0HvbAT+ipcV2CpIqeZlMVqYoZ6SLLjl2FeEFyTBj8SonsCNJ
	c8qQUvU9a2s0IztsXqtdJFSKJohilb8758V+9aB/pk94z+6UgzvN5iMbhDgu6bebjvp85+qKblF
	odhR8Kv+xc7U=
X-Received: by 2002:a17:906:d555:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c31a7006d53mr258933566b.6.1791554661604; Fri, 09 Oct 2026
 07:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-11-vincent.guittot@linaro.org> <20261009055318.29609-1-kayracizmeci@gmail.com>
In-Reply-To: <20261009055318.29609-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:04:10 +0200
X-Gm-Features: AclHuK_rHLMmKPRTiOq8naJcPCrEjVVB0YgPUjC0ODNFXpu1g2ATxHoAse5_WlY
Message-ID: <CAKfTPtBvGYp2S4P-k_SsFAXMVSSQ6j4F4LO44uUoDo5ZaUe1Bg@mail.gmail.com>
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: arighi@nvidia.com, bsegall@google.com, changwoo@igalia.com, 
	christian.loehle@arm.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, lukasz.luba@arm.com, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, pierre.gondois@arm.com, 
	qyousef@layalina.io, rafael@kernel.org, rostedt@goodmis.org, 
	sched-ext@lists.linux.dev, sshegde@linux.ibm.com, tj@kernel.org, 
	void@manifault.com, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 07:53, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> >       task_tick_cache(rq, curr);
> >
> > -     update_misfit_status(curr, rq);
> > -     check_update_overutilized_status(task_rq(curr));
> > +     if (!tick_pushable_task(curr, rq, rf)) {
> > +             update_misfit_status(curr, rq);
> > +             check_update_overutilized_status(task_rq(curr));
> > +     }
> >
> >       task_tick_core(rq, curr);
> >  }
>
> Hm.
>
> I think this mechanism added on here does not works.

Ah yes, while factorizing the code, I removed this main diff between
tick and put events

>
> Before fair_check_pushable_task() is called, we check
> if nr_running is bigger than 1. If it is we return false.
> So when we enter fair_check_pushable_task(), nr_running is
> equal or smaller than 1. We first run __check_pushable_fair_task()
> but it doesn't really matters, since it's output
> can only return false. Next block is skipped to since
> next == NULL. When we're at the check_pushable_short_task(),
> the h_nr_runnable check is always true on this path,
> so we return false.
>
> It this intentional? Or am I missing something?
>
> Thanks,
> Kayra
>
