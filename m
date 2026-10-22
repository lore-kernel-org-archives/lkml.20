Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658244;
	b=BtSO4zLfZvr5mHh85x5w3T8VtpfL2+ucYKZWtI8B1kExbGdzpkU6ir+C/QxRHCKZYh46
	 ma1Yt2v2paCOVQIWgpnSVwFyYzApympqSDdj8HTGeh9iwWyXpcpb4P3XiGaXZCd6TIg6w
	 KDhere6qM0xdHc7OmOnbibZEh/BgrxUarrNXndmu0r9tA0mZFwJQPyO8XW5mh0IbXs0cU
	 BoIlvxzBIYCRYgl6iNgXiVZQlr4XyvZtkIVQPz457gWO5ZQCXqp8O37IWUpZuZKAnN8h2
	 Q52PfCHqazqREutqtJggOaSs1Lf3hdhViQmlRSOLhg9hjxtYLXTq7H46IstHOQxv8uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LhQbAcxNkz86xsBgkVUi0/UOY0moEtgIwLHM48+f3Gg=;
	b=ffRrwB1iy+oRNuN8D7dK8Ll6U2enR6QObIP2qFFt+WI77XGCYs8ikRTa5Ah2+Wgvz8Ms
	 q6T3IYwKpCdiNGrO7TcU+5rHLyx2PFTVhkT/Pzx3Llcqp4Ak+eFrd/oprqhLbHeZLoJDK
	 xQD3x14xXx2MvjHL+1f5brlBwm6P58Oo5wYEGTNpvKJ9SznHcYfHm/sRFAQMJJpEJoKs3
	 sKvbNYTTda1PvrrDKVwfnq1hP0WZeq2CLUTrQIXxOzXzEpnSMY7P4rlqm/9Wfr5SvFkGF
	 e2k2Q8Oo/8k/JVZm69oJZ7OpFPUk1PBl9k+r5TulUSKUhLr5pZBArh5J0ri3+8pDjdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PAfpzSHD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832E3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PAfpzSHD
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso2411733a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792658242; cv=none;
        d=google.com; s=arc-20260327;
        b=IjRReWT3gT9z1mPB2NIq2uCbGheUJvV6lxo+IDOzrCuJApr8+kCE4cLVL8nrixv3Oh
         eOjHK9cbIu/BGna8rJu5iZZquyakQPlu4UwS169BmTgxFaB1OgKUS+vEaTcTeWY+uEca
         kFhl9QmVMcwsqmuKVbr46Ljzdmx+mj3qX6FbDYsqrMZRntSL8rSCJ11S8eGtNr/EsE28
         yo/Qqa6EquYOZwlDZFK91wXuGRARntMJX/kenpZ0eCZNzrC7S9+57kYYX2BnLZaKXLNy
         ib7AOoXtMEDW16uegdBtMAMzSz32zdqYAZTfg621nYfS8YIceQGwM8x2JI1HWPD0GeJK
         Km+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LhQbAcxNkz86xsBgkVUi0/UOY0moEtgIwLHM48+f3Gg=;
        fh=TAG+sUC1YZuWrJbCgiUkEGLhMvnLRopsIkMXtkzu3Tk=;
        b=g5RV8xhmBF38jYkE1I4bdFaLx4+12iK7dYSHcr/jmIJ5EvjBwmal30i2VvQjduO1TG
         BiLhS4InWRhoYzo4Z4Ty9PE9BZq/+svpfE2sCi5BY4Eaao8jvMXUC0iBtErcDyjfB15X
         jt389zKUHnF8lqlxC7isMH8edR+aMJqIp6Sfgbsu5ZqZn21E8M+tUs8zQBGjL0Rrf0z9
         k6KRPJVaPM9AFhIRFoPG69zxyGM4jL3rRSwAtYC6tX2OQTtca1ndLyNnqkMocihaG4Y2
         exL6WoIenKJnImJiItRXqaBG89T2cI67TdcFYcSZ9+uy4UEQtWlXCt4P126+Yb17JivT
         XDhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792658242; x=1793263042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhQbAcxNkz86xsBgkVUi0/UOY0moEtgIwLHM48+f3Gg=;
        b=PAfpzSHDOYHTfSSbb6PDHcdTMqnnYkFH2KqdLvZ+Lm+HzAqT3+/J2dG8v/YYHWgauG
         ZPt/vJO6xYkYYk4ZrIDe21mloQrySrxu0kJvfNiPwYDV+RiIhqGr40NdbG/7SesiazZ5
         BsAJd+nO+zGSicGhDW9DQ/1fNXYCZpoKC1Xg7C4jiWu9EUZmM04hJpGg7iwn1cbub5Lw
         NvUHrur1pWVQhYQ/DFj1n+zM0mhoSBEi2kN3BJOTMVoZYt1R2v7N0+y2wwCFDLDztlAN
         sStajyOpqunDJX1vkSWQUN556w5RvUbGkMCA+nTaJ8Re8lxiwByY0xGnwtabnsFwhzH+
         lDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658242; x=1793263042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhQbAcxNkz86xsBgkVUi0/UOY0moEtgIwLHM48+f3Gg=;
        b=Vbs6NmY0KFkdzrb1O19HogHsmZNy5+LZ/iWh6h0s+VMskbXR1DzZjAci49nuUMCgnS
         L7H+WFRZ4YOmu+rVqjpL/gYtnduufjprNY3MkfcuzAY4iwK95RujWiEnpqJfhIHaiMxz
         qFMhpW99meFiODmYJqs05Z497EHqBq8t9QddsJlhdLXNY3JFqnqD2C6kUrKGKo/KGWIM
         jPLy+3S4iDZsuLBTd6kD0xifLXufsBHmItcVepwDitxNLKQLE6mR2SFjlUJS+4KM+rur
         zsR8AjHDe9efKFeClQKCfEPqdP8886KyiwJccaliZf7G4ilqnTe/I7Ij/XWRK//YnFsl
         kQwA==
X-Forwarded-Encrypted: i=1; AKwUvBxRuiUITP399rFjr/Wo1s58qrVHWH4E1BVARPeX91UD2AAwMrXyucZQttxI46PbVMIzCjj2pPWCwLi3S88=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfwDcH/9kKe24gqzTenY5MQkDw+1ao+a/F7CpOEuc7KMFrJpTy
	3wM37b61+5TuKtAQgC8oFsK36QkASbKDGqkY1S6YjbCIOPtEPoApawVOsm5pTNrLEonsMvq1sKJ
	fbRN6H8W//ZiZp1a/wWgblZz4Px9Np/0Vosw2yNqKIA==
X-Gm-Gg: AYBFou12m0F5b2Qk2R114cy+0H8hANUtMR4UvyJaVbk0BMUOGJI/1bfCm5XjEydSaht
	NFVVwLpx5N6lMdtDwGLHI/FUEwedVvY9EiRRgd4KlYW/0jqRdw02hRXTeSOSTqjEuIxl0sjr7ql
	mZujRSmy//jq2XAXwQ6mEYpJ5kHqSP6Mk/ZrjhvJkXa4J/it7zva78jHrH2jAXgp5Uc+OsN61SU
	iDWjTfU3qOl7f8n8JS8qg77LN+07PsKpoe4xqZnpCT2YACkHSXF7MhV68ajqGf8weHqQnnRWIm9
	/HgZevii2G9HHbaldLCqBD8rFvXju9CWxP+1QFa7GmSu9d47GmI84ojdE0wd0Hi0NTCAGs7HGrL
	WVhiMccfRn+xiHmqKM2ArrgJCPBEiLIXGiO08xAWfk0voh7vMUEFWLAhEb/JqxlSQsQtqxkk=
X-Received: by 2002:a05:6402:449b:b0:6b2:2331:3ea9 with SMTP id
 4fb4d7f45d1cf-6b408eb5808mr3928513a12.17.1792658241764; Thu, 22 Oct 2026
 01:37:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022034930.225042-1-sh_def@163.com>
In-Reply-To: <20261022034930.225042-1-sh_def@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 22 Oct 2026 10:37:10 +0200
X-Gm-Features: AclHuK9CXM67_w3oDn7g4a4UkceOaJ-tmnbEdkYHOmv3hLfDc4qnAsB0F6f_7Z4
Message-ID: <CAKfTPtDQbNgC=gEe87v5kMnz_pB2AEU+ihp2PM5izno6pkNeZA@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 05:50, Hui Su <sh_def@163.com> wrote:
>
> accumulate_sum() computes the number of elapsed PELT periods in a
> u64 but returns u32. When the count is a multiple of 2^32, it is
> truncated to zero even though the PELT sums have been updated.

Did you face this problem, or did you find it only during a code review?

This would happen every multiple of exactly 2^32 ms (~50days) without
updating pelt whereas the latter is supposed to be updated far more
often (within second) until it reaches 0. Then such a large period
would keep it at 0 anyway

>
> The caller interprets zero as no period boundary crossed and skips
> recomputing the averages, leaving *_avg stale relative to *_sum.
>
> Return only whether any period elapsed, which is all the caller
> needs.
>
> Signed-off-by: Hui Su <sh_def@163.com>

Even if I doubt it can happen, it's better to fix it anyway

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/pelt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58a4261..519bc9c40043 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -146,7 +146,7 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
>         if (running)
>                 sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
>
> -       return periods;
> +       return !!periods;
>  }
>
>  /*
> --
> 2.55.0
>
