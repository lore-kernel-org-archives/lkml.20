Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8137701A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734992; cv=pass; b=MJXYfYNRigURwNF2mAWdDm6cFD18ayYgLcm5ncEB9eT8fRhFNbkH2oyt6EFSv0D0c1LOP6XJOknxHiTDUlDfilGD9zItjp7nsH7u6Kj9tdoWCUOsNEeA/DDnLI166Z+5jlAGw24PpyLQ6ZfSiT/e3b4uP8Qql8wAIabosbgZ1w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734992; c=relaxed/simple;
	bh=ysnMiBH8a51PedUXUP+ET751iYcNEGGXFcUmatH4p/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4fTSVdDUFosl3w1VGdRVB1DWZDr0aUsw6ip1Xb2GyB6cvxjKBSSaLNdJu8H8p+lGa6KlwuMESMBmHKWBIYRmiwP7UCIR7Vr8uMkpR7RJwzh0tStzA9czYzj2ZgGI8Uhr5JTDjqr0EdZEqMDqfMlUI2nfWA1WxgfSlCGsFC49PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHnRMvlR; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHnRMvlR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso79453266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789734989; cv=none;
        d=google.com; s=arc-20260327;
        b=APQdquMzTidaHINRRs2/nJSmEgIlZezBWcg0sL3NHFVpZjtjTbZxrkkNe2fcrWmxZZ
         iRLu9xDK23oxv2ZSdeshJaGgzCI1Jm9S0zRjimO+fnXuua5fgtK1v9OxM7mmMt0E7Rwg
         gOZ0FQVt1Gr4m3qyxcZmkweq6MHV1bPNs1/9amtzckouQJyv1bDXK2ndobrykzFLmsbb
         Xjp2wFUOGZ77bPn8PeSQaQqSr69euZdoTcGSbp3Mdb439zpW8qKVBH49ciES2hECnkd4
         uSbf7Ql75Y+VXbO8Ouo4SVuFgYpr18Fprcy0NFQMCd1P35vi+uiTWt17rrz+mNvjR4jP
         qLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        fh=YLvsARuOMSnRx+qxUh537RKu/VHRYsORUwRB9Yr9sjY=;
        b=mFvVkuPAdakpsAZm2ucJYT/Hk2wHTmW0iBzshdBgK4zNYfhipnUn4qBEbNHb6wGLIQ
         awA2On64PTwFVZABVdSU8x884YazdrFRUFsinteqs3yfHBWBpubzs8aNX1JA+Ehqj1T5
         IBqd868rxjfGOBlnIT4Nckf+lwLX+u95+069ms2IWwGGdlcXdCVkFHH+9dhOKNX7aM74
         Wjpww12fFfgYhXeDunYONxUmk9W3XFLZyeLV71c2+YyglBkyxubObOWKKTa0BjFl0Nzp
         df+S6L6OZuNK1SZm4I5mjydN3KAnaJwfyV5g61WtskVcUByEA/YJDkrEE6oyudUepu6N
         wnNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789734989; x=1790339789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        b=IHnRMvlRUhcxMd+as1RG51JqHG02A1pi+oT22Wg98qDmLmehrPscBKdNddnl62tTI6
         qyOf6b8ltD3YWWUaaMJvDOemBE7E5Dyphq07rk+3AiNMSE89A6ILBCTvAQI2GLARuCvW
         ig3OVsD2QaVWaJ0YEMTbTi7Jyh2TGCRyiG+Sixk4Bh5qsQVgq7WR6l1Uf4TrpsLA4o4k
         LMjFevVyR4aghoMDsRv/wf4KQ7eMpwOSCPYZVXSlAhfYiYiZDo9niN0CXJ8WzI82IFHj
         JvM+O1bLO5AXomo8QikNffMKnqNPJhkA1enGglXMg1pka6k8fulr+tN7MVSy2rI57wrJ
         R4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734989; x=1790339789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        b=fD6AJCYbtSEJUW7/NuJHCUWopSY6hreGNVY+fNPWcOKKTGFa0xUODODVO33LhHmRim
         y38sjksIv4xJc9LOo5U/9bHxU+UwUJVDy3ibO8aif824psyRb3Jk30/gHu5i2dUmxg3p
         eH7D5GhfOj66lexADpok2y+JAurRxTGPvBCShfacppkX6Ejky0kzWHj3HLt2rS+fUtOX
         XBLIpu6PReHmf80qgdSzzfadeMokpLsws1zjHzR5E2CS5lVQvS7YrJEwqAwI7yJeBnJQ
         vYft1lm+SUNONGQS0jT80GdYalSvC2XLNqp3oJarI/wHs50EfrXTNH8kLv2f+be8XHly
         /HHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz554Dou1EnykKP+ifKbvUhVW4h33Zvg5pyFyLS088iGj4A3duxCjYJ+jxSVHySUr7hkVDNMmZAFxcvfnc=@vger.kernel.org
X-Gm-Message-State: AFuF++lQyC5uNKyFz/CcHYJW8zo7vWWGsd8MX9+iUcdyIdCxy3IrIDsY
	xgp387Fwg9yWbBgksWOgHZ/Tvsl+N5NEj3ql81EVPJaZTuMlTgq97e/0mtI5C9lbaGRAnI+R5O4
	kqGq5rbuikWlM2xELIB7WXs5hhMC56lR8zkmsY9jG4A==
X-Gm-Gg: AYBFou1HbrfcrRhi3kUQLV7dObKA2XAkczSQWBdhv0er0UzlwK9fHA7wbX/3lADF3X/
	siqQ7mORHR0Kkk93onRNjQOOsru4jcK+kQUy2BfJcwJwojKzbopKNxlG2h44L/qMRWiKJfQm+/t
	lQIbwfd00D6JsZcDM4couBtzEJ2wpLI421AjAqcvqjLLI/iD6zIJioE6uGegE46ntfVT2I6AGBP
	RXAy2lk1WD7qKgVjR2NpTEYSuuIYauOyYep1gIqZ3ofO5L8RnP9bBseJ8EeXcYnSohnssfyU/Xn
	AryWtv6Vz3dMKvt5cuQ5o1bdmkyhHIB+060TBtc3bPchaYasrZ/ZLi2TnfGynS3CY3wB54M1Gnj
	IZ6i729t0SyMQ
X-Received: by 2002:a17:907:a88f:b0:c29:f0a4:a4f8 with SMTP id
 a640c23a62f3a-c2a1547f700mr254964066b.0.1789734989460; Fri, 18 Sep 2026
 05:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
 <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com> <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
In-Reply-To: <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 14:36:17 +0200
X-Gm-Features: AcwNN1X-haI5NlBDtJXpiUSlIDI7Ing7knQH9apUE4h3FDeBzBoyuWxWIfi5Cts
Message-ID: <CAKfTPtATz-aToAVh4sGsTRKM+0sOoVW4AC6gjufAjrFyZg1zFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sept 2026 at 14:05, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Sep 18, 2026 at 8:24=E2=80=AFAM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Thu, 17 Sept 2026 at 21:07, Rafael J. Wysocki (Intel)
> > <rafael@kernel.org> wrote:
> > >
> > > On Tue, Sep 8, 2026 at 10:31=E2=80=AFAM Ananthu C V <ananthu.cv@oss.q=
ualcomm.com> wrote:
> > > >
> > > > capacity_freq_ref, the per-CPU frequency-invariance reference used =
by
> > > > schedutil, is seeded from policy->cpuinfo.max_freq at policy creati=
on.
> > > > If boost frequencies are filtered out of the frequency table becaus=
e
> > > > boost isn't yet enabled at boot, max_freq only reflects the non-boo=
st
> > > > ceiling, so capacity_freq_ref never learns about boost frequencies =
for
> > > > the policy's lifetime. Enabling boost later raises policy->max, but
> > > > capacity_freq_ref stays stale, leaving schedutil unable to scale
> > > > utilization or target a frequency above the non-boost maximum.
> > > >
> > > > Track the highest frequency in the table regardless of boost state
> > > > (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_fr=
eq,
> > > > max_table_freq), so the invariance reference is boost-aware from bo=
ot
> > > > regardless of whether boost is currently enabled. Runtime enforceme=
nt,
> > > > still handled by policy->max, is unaffected.
> > > >
> > > > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > > > ---
> > > >  drivers/base/arch_topology.c | 3 ++-
> > > >  drivers/cpufreq/freq_table.c | 6 ++++++
> > > >  include/linux/cpufreq.h      | 1 +
> > > >  3 files changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topol=
ogy.c
> > > > index 8c5e47c28d9a..da94f77441da 100644
> > > > --- a/drivers/base/arch_topology.c
> > > > +++ b/drivers/base/arch_topology.c
> > > > @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_bloc=
k *nb,
> > > >         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->relate=
d_cpus);
> > > >
> > > >         for_each_cpu(cpu, policy->related_cpus) {
> > > > -               per_cpu(capacity_freq_ref, cpu) =3D policy->cpuinfo=
.max_freq;
> > > > +               per_cpu(capacity_freq_ref, cpu) =3D max(policy->cpu=
info.max_freq,
> > > > +                                                     policy->cpuin=
fo.max_table_freq);
> > >
> > > So isn't capacity_freq_ref supposed to correspond to the CPU capacity
> > > returned by arch_scale_cpu_capacity()?
> >
> > capacity_freq_ref is the frequency that has been used when computing
> > the capacity at boot
>
> I get it, and so it is what I wrote above: The frequency of the CPU
> when running at the arch_scale_cpu_capacity() performance level.
> Isn't it?

Original it was not strictly tight to arch_scale_cpu_capacity but to a
ref capacity but it ended up being arch_scale_cpu_capacity

>
> > and it should not change at runtime wether the
> > boost is enabled or not, otherwise you will have some fluctuation on
> > the system capacity that will create issue with PELT and scheduler
>
> So the capacity should be constant and consequently, capacity_freq_ref
> should be constant.
>
> Also, if boost is not enabled when capacity_freq_ref is set and there
> are frequency levels marked as "boost" in the table, it cannot be the
> maximum frequency in the table because that's not what is used for
> computing the capacity.

I'm not sure I follow your last point above. It's not because boost
isn't enabled at boot time that we can't the highest boost OPP in the
table as a ref freq to compute  arch_scale_cpu_capacity. In this case,
the CPU will have a pressure on its capacity until the boost is
enabled. Do I miss somethign ? Can the boost OPP be added later? We
keep taking the max between freq table and cpuinfo.max_freq fo the
case where the boost freq is not listed is the freq table or there
isno freq table. Or there is another way to get teh boost freq in thsi
later case ?
