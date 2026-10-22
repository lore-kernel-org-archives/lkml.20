Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658381;
	b=qd70k/f8H8+AimezmJ3w+/GfmJ9Kt+oW+UkpsUHgTcBzvDYBunL31KGmeyGUV+rcQ5xT
	 qF93ES/tsXOPub7gF8bCxnGYPUYgnHguOFn95RimK8Kuro+h8If++fXbqnxqTjY9OsGAN
	 UFHhZNIsIFL/aYkfnXx0uLHjPz9qFjZ25ipPYIEehbn3DyXbOeiLw31/9MXjGYyAxiPaB
	 O8JKN0cvKfj7uGvmu+NU5Qc0Fw4bqV/K6w2fTRdUdTd7zLXyA+YP9gooOYYKvE3SGT4BA
	 15WHn0cF88xqe99LunAp72lEpDAZontUcoRY8g65K8YD8Cs3UXDcBHOAjDTgVHicRZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2KPZKwtR8gVUogjYFjLaVtZoRLBRnCeb8v4XzpPQbCY=;
	b=XImI1A1p5u793+3caIaL/zJwb+PDdMqYsLeVJSgW6XSJfuCIlXPUXf1yw8g+RQmjGpWr
	 +Qv4GM5kL9PRXj81JVD1KQjwEPvbzJjgRJFBbpGsVSdeuXUkXEhmZufAnlrWt5EaVbhKk
	 f0ZafB/PHvL9kiar7wvlwJV0Mb6aGub231hsWyfcH2Gt5q5XCtKrNWB+DLIuducdjMX9r
	 FSd5H4AOU2+fQuxsKOy8DiZZHzD5OibBAAV9UD02L1qZHrRe9GW2OLMfEeeom82UecaJ6
	 OWzN1z2ZQgdnFGkeHpSqtVjagCYXRDVcDYA72KyHVJnRTVPa2jyszkVsOzRB3+5nk+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwgNe1yP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAAB606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAAB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwgNe1yP
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1800047a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792658379; cv=none;
        d=google.com; s=arc-20260327;
        b=emFQLbCqbDx1sxLPK/7xRZ9JtNFQgx+DbUjM0lypCNYjkJYJmCJouWsERcJvGajKAQ
         WdNtUC8bwhyguoGw6HfMsF96WmvGwK/PDpD1MsoanYWngNjbkDqFXeYugAozTYIhFEGc
         ioqrdj2pfSShnRP5R2OxOOx+QmAjq+S7cLucSwXZLCtk3o3L2HCMeUFanOemjqd3KT1p
         Venv7AaJd7tz2iCLmfjKGzKaBd2owbWJCSLcB+Aa1oDesg0YXkSd0+9Sgg5W6Ytl4svZ
         NAqv3gLUmZjGF2l96R6WjX827Myu7YuUf/1E2YjVVfEDOYnR0wPOLQjlWTbQfwWZ69Oz
         2qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2KPZKwtR8gVUogjYFjLaVtZoRLBRnCeb8v4XzpPQbCY=;
        fh=CCYZkvZk9x7ZoqMQWt4s/BqsgH6jDPVmkFuTQ7STeKQ=;
        b=TLAfcVSkxomJmoJXr1ava/aF9kA6RHmZMvoLRjMNaBz4Hav9ZODa238Sa+OllY4rqj
         X8ikqRWrqowBeiXssgvDDcyoKFKY6nlR1LVATSUJbgxthUFclhJ/EeJoYCqjbqhZAvf9
         o86vZD7YRY6sQwsrL84nXbRMHPWsQPY+uONQu6UMiNQZCH5AZsPdsXyQMUvipA1Mkyns
         ksPG2a/mpfrdpX9S7tAkswpLZZfwQaw7y9bFFXhPsSHgywEUsxEXc6qkNIBv9x0897jb
         CqB27K+2f88nIl6Zti+G1P1zKIYVQHnV1Iudzuo8aTrkCUsPYuqceHxxsllcHZZCY3J/
         +95A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792658379; x=1793263179; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KPZKwtR8gVUogjYFjLaVtZoRLBRnCeb8v4XzpPQbCY=;
        b=IwgNe1yPf1MqsGE7n/CrAJQMA7+Zdw+zButTvfDZHlosqLH90QBB/TzJT5sZPVLA91
         Vww3t7Zduor5C8ApHggkE5jbbSpzyrtAGwOsc+WTfis5PgPxP/k442YTq1ea0/Kg2HSq
         tWQK0lKrDakdLmkhbapm9yRmZjH2PTOq5ezv62DYVkGc1RWiPOsgTwO77e/v/hHLxmJZ
         pzu7qvKTzAOz0Z03mcIIqP0MPPBgGMXgLfyFU4mQForQaduQ0lkbb454JysjzEdewa8T
         4MIx+bo5MGgWuvaiDhXQwoNQnCCesVqr4TvPtr/i3yeRZ4astwLPjmD1kyFF9n2J+aEE
         NU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658379; x=1793263179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2KPZKwtR8gVUogjYFjLaVtZoRLBRnCeb8v4XzpPQbCY=;
        b=b2KeQ4QQsmqxiKKqfah/S/pX0YVO5B/r5gVExKEnZYZibxjiVo2Z2nZeEer2YUpWyQ
         KL3Td1it4xxPh293LplTGF1An7isUZovPCpIP2uv9tX4yr3r8PJ+/xF81zTFrDoqhca1
         FP5xvuRXAm7n29z/GQ3HCrvxFqLjG+H7newyuLKRkfrin9KVi/uZ2fcPTD5voYvMC6SM
         A/8NgKlnEL2i50Ngpmwkxq0b/KmWJtDlHh/L/C0J/FznJglo8QUIG31uWp1elIbotf0Y
         lfsZ2+cD4UnhckDWaWetTlWgi98aJZTKXR06evxvlI9gKVpBwexMTbLH+/EUQ1GccNsx
         pMow==
X-Forwarded-Encrypted: i=1; AKwUvBzJMMiwx3zEmMzNcFeCzppSXE97ghRK3bVCH+bfoZ+w1e5qe7xIE5JDPH7CAfzM1OnGLAJgDujOP7hMowM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeIz7MDVfIfBZVd7zO7t8oh5lI+yaRs/AykaqVrikm9gnDBLFv
	9xuOBqPePoUqag2vcdJShw5AhGLezOOa5WnaJ62yeX+UPPA94uvb8mptEpOoj3ydvBL2hChbtzk
	xNv33VyA3aX8N0KUHjRRbZs3DALmdMK1jfVP/yQJ4hg==
X-Gm-Gg: AYBFou3YKDHeAjS0LUC/8lC53+6teq7RNKAT6P0O0CVNG//sZI5MmvpiXxnPsshxFXB
	SrOZ5rpGsG8fUTx9o83jzaClx6ozjvOtMjLfznrCjtW+00hZtDD9TcusnJ5Gwzd5FYH0j8FFYXL
	oyP9kwNwJzfWoeoZc1GS1+EEz2jVsbtLHoN3Gg8e0SkQ5ZFGthXQxKRgeFqbhpeFnLdvOvOEZ27
	/BmV2l7J0+XhDRYi6/iatl+HxUe5PWTyzzLcBg9q+Z1bCgP2zr0u5hMsdZesBIbql/zaBrbCtF4
	0ErnSySxcBjnDBo8qwwOxFFL3OvJm2ltfaEqo+1J4/be1D9hx9QNo47jExE/67MUrGxkWIIdIR2
	Xp1FZfMyR/1InL2tCkVAZKvALZhw+4wUWdPMggUps2V5ImcYiu5JJs1/ERmHGAy3GbnyQiiQ=
X-Received: by 2002:a05:6402:51cb:b0:6b1:d661:d37f with SMTP id
 4fb4d7f45d1cf-6b408e8a023mr3631901a12.9.1792658379043; Thu, 22 Oct 2026
 01:39:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022034930.225042-1-sh_def@163.com> <aa72774f-ad04-4733-8faa-0853a32c2e4c@amd.com>
In-Reply-To: <aa72774f-ad04-4733-8faa-0853a32c2e4c@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 22 Oct 2026 10:39:27 +0200
X-Gm-Features: AclHuK8P98O-t4awgDeQ5jLhEb2zvpNyr3a5E4rtkHFskJomj1mGvJaM0F9UtTI
Message-ID: <CAKfTPtAdVwjvXnLcK6b=msaTnJ6quTFeL=gt16nAoCmwQrEVVQ@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 10:35, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Hui,
>
> On 10/22/2026 9:19 AM, Hui Su wrote:
> > accumulate_sum() computes the number of elapsed PELT periods in a
> > u64 but returns u32. When the count is a multiple of 2^32, it is
>
> So at least an hour between PELT updates! I suppose it is possible
> with nohz so not too far fetched.

Period is 1ms so it's more in the range of 50 days

>
> > truncated to zero even though the PELT sums have been updated.
> >
> > The caller interprets zero as no period boundary crossed and skips
> > recomputing the averages, leaving *_avg stale relative to *_sum.
> >
> > Return only whether any period elapsed, which is all the caller
> > needs.
> >
>
> Probably needs a:
>
> Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()") # c079629862b2
>
> > Signed-off-by: Hui Su <sh_def@163.com>
> > ---
> >  kernel/sched/pelt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> > index 779eb58a4261..519bc9c40043 100644
> > --- a/kernel/sched/pelt.c
> > +++ b/kernel/sched/pelt.c
> > @@ -146,7 +146,7 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
> >       if (running)
> >               sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
> >
> > -     return periods;
> > +     return !!periods;
>
> I would actually favor changing return type to u64. Since
> accumulate_sum() is only called in one place, and that too within an
> 'if' condition, I'm sure compiler can optimize it similarly.
>
> >  }
> >
> >  /*
>
> --
> Thanks and Regards,
> Prateek
>
