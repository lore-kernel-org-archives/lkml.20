Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2922753C3AE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175028; cv=none; b=eUOs2UTbF270tEcB1PjSWfZxCBIWQbDom7zI9iA5unuM3vyxegWdHREA6eDSSMbnXk3h6Zq0MVtQqR8inG49VAPuwuxs/jAa7unFzin277dhGB5xnTBCIW7LmmbcJ+qdQoNFZ7hww7l4gTI0vbFs9MgyYVr6x3F6+rq/dCD5YmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175028; c=relaxed/simple;
	bh=IzzL7+Nj8QonEGXWGBjAeG8r0vDLzLBNWdQVTV5ByIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qvsp8wuiVhcEf82AEXB1EYSmzpelhfnxGwXmLhdPyA2zPMHHlyNKyM6i3+T3aBP68T6xbOmbIq2FysriHPiNKQCRQxiRP5EOQOiiQCk/f6Q7R003aJD9MtMavOed4+OjZ4Woo88SDzhwoUsz2Hb6yYsDhRfQDAd8AKeOnmWS6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLBwq6vj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLBwq6vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89001F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175026;
	bh=IzzL7+Nj8QonEGXWGBjAeG8r0vDLzLBNWdQVTV5ByIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aLBwq6vj757NMxKlFJ9VT5v4iAb6Kxrpyto/A/1t+Fl9TZmhinL40xXkpv45Ljntt
	 3NdGV+3ZVzLscGmwGMu7+dMJ67L9a9Z3QBtuUYOTGXq6nN4y5gH2KPO5s0kAonvtb8
	 RWmBqdUi+nciKOu1hKmjyZ/fHw6HJr9mFqY/V0cXQktG0xloXgXctfUrQAO1GzSuRu
	 Iy4M3Ih0P8oeKtIRgR2hFElxf8oJGAiLYVwST5V3aAu+apxdLaX066SZZsfIii5XYs
	 mqAs6kaf9kvB71CrCQ2UhJS7YoR5kXiPgK126WQ1+G0gre/5I8D6rfdxx3JGKmiSO9
	 EC9egqlKLpbew==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1253774e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwn08uJwSqqlS7jDQZASuVsjhK4sGmMxvIkVe2kwK0mxjv7kVJ3SmGjJQ5XGro7ULpJPY/nFDjxE7kItns=@vger.kernel.org
X-Gm-Message-State: AFuF++kvmiM1NQ5oKstfV61l6YtBfcs9d5jMP1Z19N3Dqmupxgv7wtIT
	5EFTJr4NKRfvpfrN86nnBhBNwgjrKnMM3qSRgvEXWH2s8jlx4k6b2iucYJyZmMrelc37wbWlZh8
	97DCTgEGFul1wXiwZGmBL9fUL1pZzOss=
X-Received: by 2002:a05:6512:2205:b0:5ae:bba5:aee8 with SMTP id
 2adb3069b0e04-5b8d89695bfmr975813e87.24.1790175025051; Wed, 23 Sep 2026
 07:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12975163.O9o76ZdvQC@rafael.j.wysocki> <20260923145111.GA24137@ranerica-svr.sc.intel.com>
In-Reply-To: <20260923145111.GA24137@ranerica-svr.sc.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 23 Sep 2026 16:48:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hYU1Ky6L8Oa5ALWw3Z9gbM82oxZGv4cpXmPYwW-DM+6Q@mail.gmail.com>
X-Gm-Features: AclHuK-TH8zgxZvgw2rSng8MWTaJpTYigpy4ey8bOBKR_AfqOaoiRjhNuKNhcMw
Message-ID: <CAJZ5v0hYU1Ky6L8Oa5ALWw3Z9gbM82oxZGv4cpXmPYwW-DM+6Q@mail.gmail.com>
Subject: Re: [PATCH v1] cpufreq: intel_pstate: Fix max_freq fallback in cpufreq_update_pressure()
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, 
	Linux PM <linux-pm@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Christian Loehle <christian.loehle@arm.com>, Jianyong Wu <wujianyong@hygon.cn>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:42=E2=80=AFPM Ricardo Neri
<ricardo.neri-calderon@linux.intel.com> wrote:
>
> On Mon, Sep 21, 2026 at 09:12:00PM +0200, Rafael J. Wysocki wrote:
> > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >
> > After commit d2d5c129d07e ("cpufreq: Make cpufreq_update_pressure() fal=
l
> > back to cpuinfo.max_freq"), cpufreq pressure appears in the CPU load
> > balancer unexpectedly in some cases in which it was not present before,
> > leading to confusion and uncertainty.
> >
> > Clearly, the scheduler assumes that cpufreq pressure will not be set
> > unless the capacity reference frequency of the CPU is known, and the
> > commit mentioned above violates that assumption.
> >
> > However, in some cases the capacity reference frequency of the CPU is
> > in fact known even though arch_scale_freq_ref() returns 0 and in those
> > cases it should be possible to set cpufreq pressure as appropriate.
> >
> > For this purpose, introduce a new cpufreq driver callback returning
> > the CPU capacity reference frequency, .scale_freq_ref(), and make
> > cpufreq_update_pressure() invoke it, if present, instead of falling
> > back to cpuinfo.max_freq unconditionally.
> >
> > Add that callback to the intel_pstate driver and make it return 0 unles=
s
> > the scale-invariant capacity of the given CPU has been explicitly set,
> > in which cases its reference frequency is always cpuinfo.max_freq.
> >
> > Fixes: d2d5c129d07e ("cpufreq: Make cpufreq_update_pressure() fall back=
 to cpuinfo.max_freq")
> > Reported-by: Jianyong Wu <wujianyong@hygon.cn>
> > Closes: https://lore.kernel.org/linux-pm/20260915065747.1671965-1-wujia=
nyong@hygon.cn/
> > Tested-by: Jianyong Wu <wujianyong@hygon.cn>
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> This patch did not break anything for me. I tested this in several Intel
> processors with asymmetric capacity capacity enabled. Tasks spread as
> expected when no cpufreq pressure is applied. Tasks duly migrate away whe=
n
> this pressure is applied to a subset of CPUs. They come back when the
> pressure is removed.
>
> Tested-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com> # Intel h=
ybrid parts

Thank you!

In the absence of objections or concerns, I'll queue up this patch as
a fix for 7.3.
