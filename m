Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B34756C0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129964; cv=pass; b=WTMsnLJnqIU1BC2YoSLSixOJLuMy5mHzKbhji6G6nPLJ/RLFpJxo8EMfjN3l6DLlf6/mstVinXaiLxxBhqAJsvw0ljzhutHANBkFiyEK8vG9Ta48yjX2NVSBoV4mrWaTaX+n1ZNeq+hyA0JZ277KHMjxFr8JzbosipkDv080Nts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129964; c=relaxed/simple;
	bh=s1lcJX+wp0vVbXUUAs5avPDLZ1EsiakRHR4cT+AsasY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/vesalm/stritj7EqtRj1V7CD4gtX3fz8E0HsncAfK/ovoCoooq+9IRcZHsSFUedHnx2QdMvU9dEnFBlf4bz0cbP1Z/RNT8eiW07A0rgV5anIE9UNK1zZx08DJ5rKUn9PLcaRjdlHUDX56BZV31a2yEXSP4oAChpjH8qy0GI3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2RB/vHi; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2RB/vHi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c294a71c377so114248666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129957; cv=none;
        d=google.com; s=arc-20260327;
        b=mAiYRyvPIdIkXFRYy2Ru89scto0DqlC4sd/cZ0ytZGP6tEM94GybHJelTdQgeHgFYb
         GJyot8hpbJur642iHdafuhPvncBkh8FhzkwmwWA2sYHFNCSiJWRoR5p14DCWjUvtLAmg
         eSWuDbRICBTE5VqM8t9rqcEUeh/DdB+Jm78amRusx9BGZvfnl5NirTsvvhuCrS0ZKQJ0
         poCzBggRy4uUCl0WRMwQmVgalXETKx6HSGmRxKOCQ1gsRwD1w307AlBOhHOKFLZCBne9
         U+4Gaabt4DiwIM3TikWWU4my4pkTJFbq0ei+20i44Wb4g07zIHp5YHGoW84rbFJIsquZ
         gaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VXWoKfG8YqkeEwfoPvx2qLHtQyDekPWfCPr5OIiNrY4=;
        fh=JJ2p6BanE9strrafez5Pu6J1SIo6vlYlbMyXB0geyQw=;
        b=lPQm+taa/gWqzlqrUgqcOsPp2zGoRL399Iew9vqC355N9Su+eJuwI6FRla1U6GJXQO
         mJJ7rf4pQBxBfNVskRWt7ycZaTzBClFpQupvPmZxjTo8cPAxuKm0AJnzXqW8Ry2zxH57
         mGX1g01Rm+BufudIbK+C9p1X23WP/7nJG84Kp35tu5Cu8zesto9GKs2D4FIH7/pUtgTm
         v7E5m+JIs8+6bg+I9QkTlPS4rMscZ/BC0o9FlBVidR50XrO5+1VSZK9RUBbm+uOXILyT
         SXrJfYipMlynQErsuJdpHSAyYyn+Di1Dk+aE6QbgOVAnoCChgrYvg7ogBaQ6VW3ACj+X
         pFKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789129957; x=1789734757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXWoKfG8YqkeEwfoPvx2qLHtQyDekPWfCPr5OIiNrY4=;
        b=t2RB/vHiB7JCTwt0RqEDN1oq1jIvkbQ6Je1C1eKjZkifHaPBrlmzKvAqWldTbtI9Fg
         vhJWYDGiyfBQuhnrSQuI8s/rXtL1RYfJrRKfg5IB9+URx5M7SM5qiupfPkuFQdZDnxtz
         Qs2WZ63L/6zsllkY/Ohys/8Mwx+KBbVStCkWQdXh7wfTA3f2ii89OOiqdmnJ8S0hgsyl
         UyTwB36p2Jlvph8FgF3psxGNolikcvPpgdyo8Ksdt0O84AXQHXkizAvmOGrPrDLfaaq0
         08pwIhQOli2NrQbl7Ax/+KbcDzJj8BusnrFTiXJm29oWKhyAbuLvO7KL8XFly8cH8ziV
         zWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129957; x=1789734757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VXWoKfG8YqkeEwfoPvx2qLHtQyDekPWfCPr5OIiNrY4=;
        b=tWXCOQOvYH+mfPDPqcTTgNNqqFYJA63MdK6MwTruuo2SY0F12gYWcegxAsYYqZTRQc
         nEsnJL6DZPoVKmdyzOIBdGsHzX405NS9T1CGxCgN7HqEQ6atGsay0r8ZWvuYLSCl153G
         /zR0Iv+fa9NnwY3JXifCPaGiozBn7J6n8sG0GnG/4+FnFS0v4TcmRp6+elWUjPZbHMR0
         PJUtozez5b93lbXJBRXzPZtx9rBXngmcs60UHS2ylYa3fwQKBdxZRfIUyTZ1VywCYod4
         vikHECXgsJNO9EdT5Gcnx+VgaHoAcqr8Xm8h9S47n2nwv8uOv+kOdrTCXzVr5DrlBY8w
         od9Q==
X-Forwarded-Encrypted: i=1; AKwUvBybv24tHS0JNUTVaeR4uWIq62jd2rSnduIYKJ470i7vKLXlAEeFxz4DOernrlFfTqvrNH8whfLuX/JAQpM=@vger.kernel.org
X-Gm-Message-State: AFuF++mEb2Mb7cNvQWbSarZPn9b2aTVUCh7MMLlb4t6R554UflG3VwsJ
	EEj5Pbd6LsR8R3Pl0KH9034pC7AWKZrjuze+M35xHTaxZqVLNBLFJOb05I8yDzK2b3M66ZCCY6M
	s6Iuhj+Z8LppFGD59lwcDOk0WqBNQQzoUfKFqKsAtQg==
X-Gm-Gg: AYBFou21fNJghbny7dxChM0DUwVb08wr66ntaiJcIPdFYfDiYnyqF4RVCtsj8CW0wRJ
	v9BmH/388+TRxYbqiWPwgNeI0iYuh0UePoi4AdorHTAHdEmI7Ap3+m2AKnn89tmzCuo2cSQN5bK
	3kinBNtcHZFLz6If9SRa6BzkS7DqFHCWPFfpmOCCS8V9iLDycC0xbX9fCmVjQIqA2j67maTaDU7
	Vj0HNHZFBGwSnbJ9I678JuOEWdiz/r0MHcLgLg3vNSbdXyBKUVzVsdmkn2BsXN84xdNMoZMjUb7
	fs12tgXrDYHgzvv5TvsVitaeCyUDlgTt/0Ys1oINFxz+huf/IaEPsPr91uWW1cy2otTNDDKiAva
	0QA95o9uu6JMS
X-Received: by 2002:a17:906:c141:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2966534d19mr156643166b.2.1789129956866; Fri, 11 Sep 2026
 05:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910042950.1619727-1-jackzxcui1989@163.com> <20260910042950.1619727-5-jackzxcui1989@163.com>
In-Reply-To: <20260910042950.1619727-5-jackzxcui1989@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 11 Sep 2026 14:32:25 +0200
X-Gm-Features: AcwNN1W7ERrfbH5ZkCb4ynwggj7QLLhOsm9vthhRZpMEiVoS3f1-NpsGjzOvADI
Message-ID: <CAKfTPtBRLNWu6KyLs_=uLh7fwZpc5fEsGCwcSV2dCXuf6UqucQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 04/10] sched/fair: Add LB_PROMOTE feature to
 enhance real-time performance of fair tasks
To: Xin Zhao <jackzxcui1989@163.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 06:30, Xin Zhao <jackzxcui1989@163.com> wrote:
>
> Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed
> that there are numerous instances of unreasonable CPU idle events on such
> platforms. Unreasonable CPU idle refers to situations where the CPU enters
> an idle state for a duration of time (t), while there are tasks that can
> run on the idle CPU and are not limited by cgroup constraints, yet these
> tasks remain unscheduled for a duration greater than (t), t > 2.5 ms.

Which looks reasonable with a 4ms tick

The ILB fixes this at next tick and we have a similar version for slow
path wake up

Also you might want to look at the newly idle load balance path

>
> Testing has shown that over 95% of these events last less than 4 ms, but
> there are still some instances of longer durations between 4-5ms, even
> occasionally between 5-10 ms. For a real-time system, scheduling delays
> greater than 4 ms can lead to performance spikes.

For a real-time system, use the real-time scheduler but you might want
to refer interactive systems

>
> Enabling this option can effectively reduce the occurrence of unreasonable
> CPU idle events on low HZ systems like CONFIG_HZ_250, and completely
> eliminate events exceeding 4 ms. Note that the feature only affects fair
> tasks.
>
> Note that enabling this feature will increase sys%, as it uses CPU time
> that would have been idle to expedite the scheduling of tasks. There will
> also be some CPU overhead involved in searching for suitable tasks.
>
> This feature has been split into several smaller patches, which will be
> elaborated on one by one later. Below are some test data:
>
> Test one compares the number of unreasonable CPU idle events and their
> distribution when this feature is enabled versus when it is not, under
> the same fillback scenario. The test duration was 60 seconds.
>
>       LB_PROMOTE(on/off) 2.5-3ms 3-4ms  4ms+
> index 0               on       0     0     0
> index 1              off       4    13     1
> index 2               on       0     0     0
> index 3              off       6     3     0
> index 4               on       0     0     0
> index 5              off       1     1     0
>
> Test two compares the performance of the system with and without the
> feature enabled, based on the same fillback scenario. Each test lasts for
> 25 minutes, and a total of 15 comparative tests were conducted. The
> results include a comparison of the maximum and median values of
> end-to-end latency and sys%.
>
> LB_PROMOTE(on/off)                    on        off
> end-to-end latency(max)              172        180
> end-to-end latency(median of avg)    166     167.68
> sys%(max)                           9.68       9.35
> sys%(median of avg)                 8.81       8.55
>
> Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> ---
>  kernel/sched/features.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> index 8f0dee8fc475..4916a4b89ab3 100644
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -142,3 +142,27 @@ SCHED_FEAT(LATENCY_WARN, false)
>   */
>  SCHED_FEAT(NI_RANDOM, true)
>  SCHED_FEAT(NI_RATE, true)
> +
> +/*
> + * Embedded platforms commonly use CONFIG_HZ_250, and testing has revealed that
> + * there are numerous instances of unreasonable CPU idle events on such
> + * platforms. Unreasonable CPU idle refers to situations where the CPU enters
> + * an idle state for a duration of time (t), while there are tasks that can run
> + * on the idle CPU and are not limited by cgroup constraints, yet these tasks
> + * remain unscheduled for a duration greater than (t), t > 2.5 ms.
> + *
> + * Testing has shown that over 95% of these events last less than 4 ms, but
> + * there are still some instances of longer durations between 4-5ms, even
> + * occasionally between 5-10 ms. For a real-time system, scheduling delays
> + * greater than 4 ms can lead to performance spikes.
> + *
> + * Enabling this option can effectively reduce the occurrence of unreasonable
> + * CPU idle events on low HZ systems like CONFIG_HZ_250, and completely
> + * eliminate events exceeding 4 ms. Note that the feature only affects fair
> + * tasks.
> + *
> + * Note that enabling this feature will increase sys%, as it uses CPU time that
> + * would have been idle to expedite the scheduling of tasks. There will also be
> + * some CPU overhead involved in searching for suitable tasks.
> + */
> +SCHED_FEAT(LB_PROMOTE, false)
> --
> 2.34.1
>
