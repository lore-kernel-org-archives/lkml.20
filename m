Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792460226;
	b=wd2NKEYSe6V+/VtP0KMaRBEz3lPJMHswNQ+GAll+1sVX2bVdD4Ztwz5INPQV7rAgfUuz
	 Q7R/wY5h/8THXkGNvbEfSXDN/0NfsW4LOiYpCFbvRCF6T/yOH23ZhLMrCIDY1Y7O6iqim
	 pwFg2zX3ZnkOtnjlD/8nnD4L/VCOPG40US3cqxFkgnn7p4oFnWnGkXFGxj98FCjyruTdo
	 nX4mfs4EJFGfLwDZFQVmaboSfwVR2UTCQyuX5L8ZMW9srlNLOv5mGzRUChCxQLgw8Ej5T
	 kiKBOAmBOm6c3BHgABda44s1Ru0n3aLkIfBtg15VxplVVt8jqAuPdb8kJEjGCiJzWIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BGjAR6GJbqkB0JeXW82W/emLheBNUt2rVvKEQMHhSAc=;
	b=b5TTx5qz+pYJ42zvYpRvhTIVIIRxqoRcPbwZHTlh7dPaiPfQQhPq0M/nMJyTTHDYz74T
	 zcNTbLm/nFhJfMImJ7+vwjreeWG6201JSjPUGRqVIpbegw1oTczlSYkdzqlyovSWx2RwW
	 v0SBFtXVQh6xSO/opSve6Ep+ho4B39yTbRIjZL5VLAiz1GAznvnmV/lmg1CFdzlRkpvx9
	 qcJ9eAWTzrdkIa59bnH2A22FbHopaY3ms8bGy8xK20JoWbyBIY3omztgUYFxezTzF4Ave
	 muMelKO2WrKIYqLVKPKH1TF6bEf8FY15ZksMXp+xjF+5FAvM2M4B8vDeSaWz6lQASEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ+aPCK1;
	arc=fail smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2693606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2693606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ+aPCK1
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0e21048f8so20447397b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792460225; cv=none;
        d=google.com; s=arc-20260327;
        b=PVb3ET5cqQvb53M5TmLKi5et1CE61Yf3yUZm42KYtilyhlew7LtRIDLqcycizN6N/Q
         t6Z8fQk7QfJj1koXLJmWjE3fL57feFKURpGrqt5rqSDipFUM6q2guWMiL9txkJqXqBrr
         KJ2wbck9HCCTZqUUgcKs6hbLOcQtiRz4NTeioA+u3CaZLgPg30dNguzQMBRTl3Dl2LrE
         F95QAvx+XfzG4WiDNwu6xlobJ4OvC1AzfMqPXJkv52+RSy06dcUV+frDendL8PV7zpfY
         3DIQ8KLBnm1DjjyEZxGut14AuB1IUh5LZC3Sznea8/48KH4C2rQ6VA+jNQ3f5Ekp64DY
         57Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BGjAR6GJbqkB0JeXW82W/emLheBNUt2rVvKEQMHhSAc=;
        fh=nupETVPmq4F8pYfxr0VHjrSqdl4Ox8B+bYMPBjMzob8=;
        b=iVeqtpjwIIRpDY6V6R9uviC8VgUHpHF5mSZGNKMfLUMJF9RQ8AgzwOcEYUYeY9JNvX
         0tZPM2GAR2K03bGzTYJm/Hw94qpXAUtTgjS1ASc2nJPjQ5EQ1RenzN/oV560E5ofhaRP
         tl2/ZMWZ/WhohUK6161qfkKxVVspDvxx6GvLSs3AgdkohdbR8Q5dFADeWUMQObjCb3eT
         /HmMDmoGODKqCgmz0N9zJBnxoY7tg0Uau6Q6vmqKefv+mMQbvSMmM1Za9NYO7ngSTIwK
         N3VKI2LlCkuhHMjpyddqOwtwgLKTHiZTZ+Q1aQvS8TEm61tkfyfxslEploCrK3awpGeD
         XPNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460225; x=1793065025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGjAR6GJbqkB0JeXW82W/emLheBNUt2rVvKEQMHhSAc=;
        b=GJ+aPCK1ga+bNhn182ZfbLWSU/lIXCmJ0SPKDnpPLVopNDiMZt2z3LGvyKl1SFOiH9
         6hLcMz+i9g/EKBLhA927CUHvBtEDyo6W6sOM0TuiM45lWEN/TzZ3gvzfD29ziP5Ot7pv
         9jDqaoi8grsbjzQqv/SCXZh0cZk+RYGbKaZZRH2XP6trrbOfACONNwDNP7MZShlIh5Z8
         bA0SJWoJaePuVA7gsArnSPx8NbX0tD6BTv5U/r/fGBVcUavYSRXFGQITMwgVwbDaLxJC
         68wlfW7UPwz0TquDmdC+CbteStrP0a1sw3PyG9bC9WAu2OCqiMDenpNar8isH0+/eDUi
         dsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460225; x=1793065025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGjAR6GJbqkB0JeXW82W/emLheBNUt2rVvKEQMHhSAc=;
        b=zmuZb0A7Q5dcnjxDD7GHI+/lzxBJFc64K0gtUTFpBiq2+yyWRCLp6jNc/nWHzFI9VH
         w3KukB6UZJIUrf5xAzWOlE5N7MXcG+X6IBs3lKhI2A78UbxCAKs3lISbJiayzhxcPlb+
         0ybD9MjCP9hFN2ukSQeRcMUoocq2lwpFtQ00oAE2n7qFFNfaHrtu1g7mw6TpFL7t7dUC
         onM6nfYHtI20ju0YPbZ3gRJBR0v4FaiYDaQcdyZdnUDuW63B+TAJopZd2b0Yc8pX5flf
         jBww0L1gZyhGAJmqbrPEUlRpPBDM34Wp273j9HdVyxMM+4IoJTygBPed/fRyOsg/usWA
         8P3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0YS+FnpN94da7sn5+13mdmuYwPHYUFdAlX9tfjBWeMhnBbuiV4Iz5IspKjDLFHZle1OnPhDjeMjH06ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLILCjxkSX7O7sfRx3I5CKoSt1kkjuNUQkjGQLzRuYfSKpI+iPx
	Uw7ek3Fi2p9pXMBBzx/h1WIkVaav78/mg4AyzczPaTOGsrsT2rnY2SMeub58qyljrcUAEis/tJI
	LUCqHUv4kDujDFE32yGeq7Gk/MyJaACs=
X-Gm-Gg: AYBFou2xQgzgeHDYK6QedT71edIZppuhrYSZ5JMYrqw5FZP/ypKmgzHOlITx9otYcWX
	D/88CWd8p2EN27SQmieUFGpk9Ijo2UyFyvc+ia/GR3ix4r8/vExTnp8YVc3C674B94HrGLT6zDv
	Pyd0jt6DbtudvOky5Dv7PKc9fme1gthaVK5RxM9doy4RORKiwuzclk6BSxaF9k4WafWy61a1dIv
	IoPg6MhmCxlJt2VvfW+nPK9PR+GZurHQ9MgkXUkD+oes/KMke7d3DwusYJoXgXAq2xhL1BgTudW
	z5CfwmOAJC8yRviQQa53W98+DIP3nRM/LvI0rfRma+1lEZFWQehZ41lH5qHxkJJj7xaQiKLhbx2
	tMc05GNqaGtW8RgtNtspfSCCehBLtawoeV6v6vAEXsmdxyiCsxjiUGD+w5x+aQuYhewKOqpoKjL
	PhLEGB2Uh3GezgVwqhtkFseQe8cT6AuvtMd6a8JQJtor2n4sUEt1iAxCDdLDictd3aI3aNrnGKt
	wF7l6nv
X-Received: by 2002:a05:690c:f8c:b0:8b0:a957:80bc with SMTP id
 00721157ae682-8b0f2196dc2mr38396937b3.40.1792460224531; Mon, 19 Oct 2026
 18:37:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
 <20261017050928.128582-2-sidchintamaneni@gmail.com> <CAGsJ_4wGq9oc05=-g4aWptLdCbTwUjMjXk4Rd6KjJ6x=tzMm+g@mail.gmail.com>
 <CAE5sdEhGFtGF6LC4xNkMwGj3vTxLOW=GNBXnk3-JmsgjntXx0Q@mail.gmail.com>
 <CAGsJ_4wmvBvEn_vXu8-c6BRAnRewYmTs8iUd8T7KRx7_svZrwg@mail.gmail.com>
 <CAE5sdEiq3bY1kgMUQ6x7RRJCx0JH4sQ9Z_a9_YQSM5FKNwpk8A@mail.gmail.com>
 <CAGsJ_4yZ3rueVMaRJ_+25Nnab0WH5ZLQeLjporWAFj7xJnJFHA@mail.gmail.com>
 <CAE5sdEjFgVoQbWw12=+AKdCOB9cWm-akxzbX7hJzvyO3vpCtgw@mail.gmail.com> <CAGsJ_4yrAosgxnxqc18qXyeJQHszYOdTxJw4TzSJqp10YQWjag@mail.gmail.com>
In-Reply-To: <CAGsJ_4yrAosgxnxqc18qXyeJQHszYOdTxJw4TzSJqp10YQWjag@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 19 Oct 2026 18:36:53 -0700
X-Gm-Features: AclHuK8ck52zGHHnsy_oDpaMPdyA6LZuDR7CHNRNZa81ymtH366yW7A4g5vgegE
Message-ID: <CAE5sdEj9biuOuXp7aej7pV1Zyjc0kqcH12Oi6gLyJCeuihF6Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref in get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 18:20, Barry Song <baohua@kernel.org> wrote:
>
> On Tue, Oct 20, 2026 at 9:02=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> [...]
> > >
> > > Thanks!
> > > I guess you mean the following:
> > >
> > > -module_init(kswapd_init)
> > > +//module_init(kswapd_init)
> > >
> > > Yes, I can reproduce it with the above as well.
> > >
> > > But kswapd_init() is definitely called before we enter userspace,
> > > so this doesn't seem to be an issue here?
> > >
> >
> > Looking at the callee sites of get_lruvec, all of them happen after
> > boot. So it should be fine. Anyway code clean up will address the
> > issue.
> >
> > > So I feel there is no bug here, but this cleanup is still welcome.
> >
> > Are you ok with the patch as is, or would you recommend  changing the
> > callsite of get_lruvec to mem_cgroup_lruvec?
>
> Overall, I'd be happy to see MGLRU-specific code being removed.
>
> If possible, could we split this into a two-patch series? The
> first patch would be this one, and the second would drop
> get_lruvec().
>
> In any case, if this isn't a bug fix, there's no need for a Fixes tag or
> a stable backport.
>

If that is the case, do we still need this patch?

> BTW, I've been struggling to understand why MGLRU introduced
> its own version in the first place. Maybe your follow-up
> patchset will help clarify that :-)
>

I have a theory -
when MGLRU was introduced lru_vec also returns NULL
https://elixir.bootlin.com/linux/v6.1.190/source/mm/vmscan.c#L3163
that is not the case anymore. I haven't looked at the refactoring that
happened later around it yet.
That might be the reason but I could be wrong.

> Best Regards
> Barry
