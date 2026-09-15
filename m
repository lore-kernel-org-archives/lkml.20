Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AC544E66B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508578; cv=pass; b=OwnsrwKk8PjTRy4VH3oLIo06tGlZsrWh5QyA/Y9573xP4IajUZK4IlyuqBWzI6FDlYM3vUg76i7BtFFx4pwu9iyjc/QeEf6QLHtVYMU0/20GcixU5vpE1iCMPCA96nf0TQNk1lMczZl9IEVRnugHXE4jm5+ntd+1smPV8Ozfp6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508578; c=relaxed/simple;
	bh=7FPuBKqfc5+V+XudiWfGUwcGgOF3XEWZ0MgBewJ876s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsFToTKc6XURWIQIgYLk+3W4of6I/pG5N4vYqJ8RGhHmkLaWIvTo2deInCeXj73Bk/QWnFgyAFo9cFJndJMmxSACY8GrvIlfj7llSOubnO8G/iTtvEF0h5xi1DyIM50jhuB7YLm+gP9aMCgBGmcNO4ZVnQM+hFXwbscdQKa2Aow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nvjLsVGg; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nvjLsVGg"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso32581cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508576; cv=none;
        d=google.com; s=arc-20260327;
        b=iBz7YbGJ965JCxAIeo0kLg4FetvJU7jxKnvG+g0O7He4e2pd36FEZMjtGUUlfXRFAz
         1MKz0ubvhg/DtK5B/BpdmHhPDUBB9o+jOjGKY6af0xmBaoelIe4iSlmzhJsiVjlJZ/KV
         vvsDUi0U7t/cMS1QPcgrDDR34x6EpYrwoKfMdCuFUqqO47V7NGkfimN2IuuTijq/c3vN
         4Fqa8DyEtIk3kzPrzoX+r3wR5dnLMzHGPjiZHi9SOKj8C1j3xVlpjAHUk9ELJsCWS9t3
         k+KaD+RKGEovBWZMuwK1HOxlRK4QcYqLeRVDYoS4XrQ0MCHCuC1mvl8FagMypojhdpUp
         hCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aD5DtmrQU1XAAN2n47o7245dkYOoODedHBlENsGW6Jo=;
        fh=SYmUPOnrIxburhqjpaJswGhtHB5yS44OXawOsKCaYw4=;
        b=HQGmgLk56NzgWC6jPNOTR9QB6K8cxrw0xMfduCF20naA/USadP6wfb9bUJkx0hFwme
         YFB/K9h4ZevXDuGYdo+Z6M8EKuyWe7PVZUwYEXzwZA2pATacmYNSyF6LVRsapHTT3ByO
         WkpqGqFUJERlvFPFHXUqFbk0UAkT6cpl73GUvaRqTvy2Abg2l04+IfN9N7c8uT8KPuNb
         zP4OrzV0ORwcWNgVR0hhh5dB4AHITpoPZgXbh3fXhc70kBV8Hh1Z302RNUCIICmTdmt3
         W1qK5LXjvEf0Z1KS05VwMqd6wRDd4srq9KRilAafJahg0lGW0hVd/N31uCn+aWNjfVqI
         +DgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508576; x=1790113376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aD5DtmrQU1XAAN2n47o7245dkYOoODedHBlENsGW6Jo=;
        b=nvjLsVGgRj0yMKuH2ZW853ibeWabA+JxD/OqUDRpdbXU8+rvn6D4qQPVdjhzkouMbY
         wsEIS306ZkSuh6KXf0XQHKsKByyJJfwQJvd8tshcsB9C+3E6+2y07HQvDfwAeu8liueV
         pm251xUmcAfqM9DldAzZXxASE3N7GSOex7/cE4kXfqSr99Rm7ozyqzsqKFZsLPBNCziZ
         x49WGmFvduSUAF0fHjYOZI6/RaxcbTJqfhcqtmH+Pjia03Xsr2Yo3IdpnywuyepAVlV8
         myfW/wFz8QX+I61Q0D2fvcJcxCT3b5DO05GZWvAAbpFlIKesKvO+GBaRkJG+BDKKc51T
         RBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508576; x=1790113376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD5DtmrQU1XAAN2n47o7245dkYOoODedHBlENsGW6Jo=;
        b=HO2kkq3EG5FmZCy3MkHt53W83Y73SA7pPAwbTMr/ePjeRqDaSnkSfB18Mat17xDmV7
         nnGTO1E2PgNH4ZHfU24vI4frSPK+x/nbVk9tDND1wqh+OUyVKzdWXtpMIKxnjv/6yH0e
         KljaO07ix9S0dysKs3Iw0DNN5QdW/JwAGagWBJegTEwJ5eWIibRver/DWFxFwPPzJQtl
         udFMy2qtUapLN9AtiIcFFTiDsfq9Vy1UMo0Dp3KABpHGvVlkdbVUpBuZ3Ns+ONfPQF1c
         QrtfA5KXk4MG4YCUO/O/NsKSuFOeKLeXkw0/CGCDJliKiEjhwEPi5lSbLAZWM1/hHqS2
         xvOw==
X-Forwarded-Encrypted: i=1; AKwUvBwora4L1zMwbZ5AVMi0YALJB89WakvCwbrRq1OVWbllzDNJ88KhfVKDNpF2aLdSNp53gQxyuhYGUCEtq/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kR542OJ8lNzm5KJ1VKHoPoeUhqSnsoQGiSt5EqFhgleD60Ui3M
	u3snavrMi2LnVFOktT+Wowlzo3vm7JMA0//FBnAddxRSp1Kcfe1DZ+QM10knmT965XCNllSdJN2
	5w/gDytSmAd0P6eLYSivbvqPCg8Xk01SrCLR2U2Ng
X-Gm-Gg: AYBFou3dFUQifVeMqT3hVQErty0A4w/kn3hxg3clocMDeiopEv2y5/1szr5TkHlbart
	lpsX8lKF7KPsMf4odw9gKUvCrdz3RlQ6M1Ht0WiyhyrtXSCWVSHEnNGIbLxu7wMaD3SAdvvIfLe
	INVwnFdxT/shHgTQ0y+MHVfCrrKFjya5h3rBBDB+mDxQdwXXS1bWZH+cavKdghNymsfe1Z9N6st
	EodXrJjo4gk9jFZ2jbr9MmAwTiGLN34xYftqeHeYBvvtib7nu+wDB4uAPrR5VNn28QB1bMrU5AD
	C0R2KfeqA/xZi0d3Q9/6EUq2HhyrD9T7pZzFVXsLbIix6iN0khr7OYmtzfusGv+3fZ9l3RCqLu6
	NEiewxYVWpshxyOEdY8rgmw==
X-Received: by 2002:a05:622a:4d8c:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-5327ed8004emr1067291cf.4.1789508575206; Tue, 15 Sep 2026
 14:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224062531.96304-1-yunbolyu@smu.edu.sg>
In-Reply-To: <20260224062531.96304-1-yunbolyu@smu.edu.sg>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 14:42:43 -0700
X-Gm-Features: AcwNN1UXqi6h2JzlCIpIEM2PA8kElM-vlezQ38Lvvbn2yCoDh4fdAvu3ovmKIo8
Message-ID: <CAP-5=fWHGZteCwCga6x09hzAECmc8wMWxHbD27pq+vefVCeNgA@mail.gmail.com>
Subject: Re: [PATCH] alpha/perf: Clean up stale comments referencing old
 hw_perf_* APIs
To: Yunbo Lyu <yunbolv@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, richard.henderson@linaro.org, mattst88@gmail.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	julia.lawall@inria.fr, ratnadiraw@smu.edu.sg, xutong.ma@inria.fr, 
	kexinsun@smail.nju.edu.cn, Yunbo Lyu <yunbolyu@smu.edu.sg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 10:25=E2=80=AFPM Yunbo Lyu <yunbolv@gmail.com> wrot=
e:
>
> Two outdated comments in arch/alpha/kernel/perf_event.c referred to
> functions from the deprecated hw_perf_* APIs that were removed more
> than a decade ago:
>
> 1. hw_perf_disable():
>    This was superseded by per-PMU disable APIs such as
>    alpha_pmu_disable(), after commit 33696fc0d141 ("perf: Per PMU
>    disable"). The comment has been updated to reflect the correct
>    function name.
>
> 2. hw_perf_group_sched_in():
>    This function was removed in commit a13c3afd9b62 ("perf, sparc:
>    Implement group scheduling transactional APIs"). The corresponding
>    comment mentioning it has been removed. The if (n_ev =3D=3D 0) check i=
n
>    alpha_check_constraints() has also been removed, as this condition is
>    never true. The alpha_check_constraints() function is only called
>    from two places:
>
>    - alpha_pmu_add(), which calls alpha_check_constraints() with
>      n0 + 1, where n0 is the number of existing events (>=3D 0).
>    - __hw_perf_event_init(), which calls it with n + 1, where n is the
>      number of events in the group (>=3D 0).
>
>    In both cases, the n_ev argument is guaranteed to be at least 1.
>    Therefore, the check is redundant.
>
> No functional changes; comments and dead code cleanup.
>
> Fixes: 33696fc0d141 ("perf: Per PMU disable")
> Fixes: a13c3afd9b62 ("perf, sparc: Implement group scheduling transaction=
al APIs")
>
> Signed-off-by: Yunbo Lyu <yunbolyu@smu.edu.sg>

Thanks for the cleanup! A nit: the commit message mentions comments
but there is also the dead code clean up. Someone bisecting may
struggle to attribute this change if the commit message suggests it
only impacts comments. Could we either do 2 patches (comments + dead
code) or change the commit title to mention dead code?

Thanks,
Ian

> ---
>  arch/alpha/kernel/perf_event.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..2f57626ffcfb 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -35,7 +35,7 @@ struct cpu_hw_events {
>         int                     enabled;
>         /* Number of events scheduled; also number entries valid in array=
s below. */
>         int                     n_events;
> -       /* Number events added since last hw_perf_disable(). */
> +       /* Number of events added since last alpha_pmu_disable(). */
>         int                     n_added;
>         /* Events currently scheduled. */
>         struct perf_event       *event[MAX_HWEVENTS];
> @@ -372,10 +372,6 @@ static int alpha_check_constraints(struct perf_event=
 **events,
>                                    unsigned long *evtypes, int n_ev)
>  {
>
> -       /* No HW events is possible from hw_perf_group_sched_in(). */
> -       if (n_ev =3D=3D 0)
> -               return 0;
> -
>         if (n_ev > alpha_pmu->num_pmcs)
>                 return -1;
>
> --
> 2.25.1
>
