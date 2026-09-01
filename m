Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6638D3E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224714; cv=pass; b=W2GOR5JkzxuO1UMQMHRVkvA57EyYmIioGmSfwQnZ95ru2pC1Rm5nW14BCAO8EiJOerKQfI/qPzIFLeKvtRSPNFTqKMv12bRXfYw5LUpFemoklB6Lu/TqzB/mVOUYLYNv/ZIRkf+oyU4rbxBRDURCzkKY5vtT2rbQoD7+uQNUvEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224714; c=relaxed/simple;
	bh=rCXar17b9Zfs8+JbBMEwMyfXf7r3W/8xbeDNprk7fJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir6fdyHnkz2gArStOzjoAH1CSogXCwMcVk9BmkMiLtU9UB5VysdjGBtFblahoFmVfVtcuuYgTva/c3oDM7Jls7u71fY9FYLxL5k3+LAkE9ltO24i8lJ6pATTK2qx17Os0Vxxw+ZuJ235W4lZaZENFWXSPWn9XfNeKl4rYBK4okg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfuu/kbN; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfuu/kbN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499add6348fso11355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788224709; cv=none;
        d=google.com; s=arc-20260327;
        b=sjuz37hLX40j/lbo6LgH19tzkY2mfhQeS0CT+WeEs6umdJK7/x5cJfPNWtUtksFPDz
         SPPMHUwL5hLOqJ/La14U7PdD7Dla/sIHJKT8chn9gOqy0JrN2TnTitZcmNbgKR5XqxzU
         nOHqK740uysYSfBDDs77Q8g9DB+8zvrorlI3pMYS2KnxuV0wVGhLxMcp2/7HkPsbIS7w
         bw52uA7HtYhYPgbJ09WSJh79IWGZwZuD2MSgJ9waC1AM1zqVBHXmkQsHs9Ek5yjB2Xel
         /+3GKT7S3Ff/Ksj4YQ1jstBl53HACvA7Ei9WWWdTs6N6YrIquh1RNAcepDtTxuFsI+D+
         /AlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mFR8aYSnOaVLnjgwM+vo5O2WKxjAzys+M0VrDg9dEOw=;
        fh=tTDq1Cqj+X4J+oxAX1vbd/1BVM6HrK6h26wb75pExAQ=;
        b=QfU6+oJbIduh+6hsZjDJzYxHXY8Y0KtUsVUw4ZXjeLiQp9EMHe9UaLtkT/oKT37Zrp
         F08QOpWzFl5e3SdF8qfuKZmazjXQ95mjtui6Xv4iUTXAJsEFmg0+YszYKMGiOQs+tCiG
         GOcq3qy6AzTITXCmqv6i8YYbyca9X4qYHEoef1qzX3EF0OkfsDJJxnIEOJ1ea7dJB5D0
         TZMNMb2G4U2BhG6I21G5egZK0hWgCB0898Oke7njKLddCXZ+RVNHTq+9LPXUPaeC2NjD
         tt+ByeXxQotzNjlJiblTphweP64V9tQiVMfL897CEoiq19hh0jzxaVX6bdrXetMG8fpQ
         qvPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788224709; x=1788829509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFR8aYSnOaVLnjgwM+vo5O2WKxjAzys+M0VrDg9dEOw=;
        b=cfuu/kbNiiHChyxAPhsjcDeOOX0SY9zZzOw9+6+wMMoonHk82+31sB6EQpIRXn4JOv
         hhFsWmK93uF3LBX5rstp9oaIgw+1HYEqcCxfXMtdFa7taZrIdWhl/McZvri46trtZHzp
         tWY+CQpYmPbnFTo8NIJipfqO6ULoEOnEP3Fmj6RHKMmaRlqpkE3PLDF4GoERHuf1Wyye
         xmWdwg3tR9Pe3kM7Q8QUJdEKWfEYYnSIzz/C9/wEkSYeujR6OCdzOfPSnsglghjQIQo2
         Ix89W7ubMPM5isfbr7kapi6nnQnuSGinehhXuMvOpDdiw6XUml3+rLz+Nul8A6xN1KK8
         RDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224709; x=1788829509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFR8aYSnOaVLnjgwM+vo5O2WKxjAzys+M0VrDg9dEOw=;
        b=VrD0echIuovlvAz8Al67+JebgbcKBefSaSnIgE9mAdfHSvIwMWvnXxzpZRZrhgdnRr
         5r6y7XbQ14tVSEyBTkGSQ1O4VU4cRWQyX6AroerCD9EZ5c4eMeDWmM9C9+DNp+DccscD
         vF19Vut5OVBxLhgLhMTrv6pmOkhdP+OoN2/JGpugryI9ElaN4yCYwHW/gSyR7lKlMEOs
         IeCrRtit35Zyy82GmljPNE27+70mu40/RyjesrdCts+WMbWY/W7y+St2KJ9yrdpYmh8m
         VEZ2/9xSeV/bWOJ79Jc3sictGZOUqlMbLP7bi6AYgxRKMrroPTYVT9bG33pPefW2yqI6
         LODA==
X-Forwarded-Encrypted: i=1; AHgh+RqUtUFXI7e41dlP0l4D15TYUsvZ6GWwY3XRIoFJgyChVNc8XAULSeS8843N2zdAOnnT109YuJ+e7tbGojw=@vger.kernel.org
X-Gm-Message-State: AFuF++kYglgqdg+3Z3VAKzKRaamHTTH+2dMH0h0VPxywmk0sBbUgAWLU
	LLU5Ej0S3ZNSEnmlsrg0p1OLAXYFAQ9GDiTRwSp1ypsihQiV9v6WcnDBXgqTrsC/Ev4ApIHYnoJ
	nTMz0uA4kTibmKXvIpM9QAWByPTL0745GWVWwJ49CWAeILSAatoh0Px7cH4ApYg==
X-Gm-Gg: AR+sD11FNJkF62gXEW5FsQzcdgvD/Yt8P3xXMCRLR/3SRwSpXQdck47RqVcCfbtdnHa
	OiZasX0mNqd0Tx7L6NhbPBXQh//KqDk3j4M/EVULSu5QdA4CJpGjxCzsDWuYL1X4yNd23p57cP4
	b6aowIzRzG+tR8HhxlYKG6t2i/CNx14MjiDrhoj2PSPbwbsOWg9MQOYOO0UTtbBPEIQ5Pfg0cGV
	VYCHxAfKVowOFymKKuvaqc4x+PPMebl1K8mHEhX0L5SM+INF2bA2oHZKc2WiH7oICVtTB5tb8zS
	iA2J1m0jzX15cCBsborHklRUbpjkDOVq9xF7S+OSvKDgp/iiJSMViqBV67kmQS00A9IPJE3MQKE
	=
X-Received: by 2002:a05:600c:c088:b0:499:c4db:2ea9 with SMTP id
 5b1f17b1804b1-49cde7bdfaamr142075e9.9.1788224708321; Mon, 31 Aug 2026
 18:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831234339.280376-1-stevensd@google.com> <apYXCL_GJs9Ovu0v@linux.dev>
In-Reply-To: <apYXCL_GJs9Ovu0v@linux.dev>
From: David Stevens <stevensd@google.com>
Date: Mon, 31 Aug 2026 18:04:57 -0700
X-Gm-Features: AcwNN1UUQ5wS7WM0_atlL1tQIeuhEAKnPM1Hr-Z68q5Q2CNXNYgeVFoYiElXs7Y
Message-ID: <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com>
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is allowed
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:10=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Mon, Aug 31, 2026 at 04:43:39PM -0700, David Stevens wrote:
> > Memcg charging can be done from any context, but calling schedule_work(=
)
> > isn't safe from an NMI. If memory.high is breached from a context where
> > spinning isn't allowed, use irq_work to schedule the reclaim work.
> >
> > Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> > Signed-off-by: David Stevens <stevensd@google.com>
>
> Did you hit this issue or just code inspection? I assume this is the
> done_restock code path.

I just found this via code inspection. I spent a little bit trying to
trigger it for real, but the only way I managed was by writing a hacky
driver absuing alloc_pages_nolock().

> > ---
> >  include/linux/memcontrol.h |  1 +
> >  mm/memcontrol.c            | 12 +++++++++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 8170bb8066a2..036d973ceca6 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -219,6 +219,7 @@ struct mem_cgroup {
> >       spinlock_t       peaks_lock;
> >
> >       /* Range enforcement for interrupt charges */
> > +     struct irq_work high_irq_work;
>
> Instead of adding more complexity, let's just return if we can not spin o=
n
> done_restock path.
>

There would be no guarantee that memcg reclaim would ever be
triggered, which also would also stop MEMCG_HIGH events from being
generated. Overall that seems a more serious than just dropping
userspace notifications like is done for MEMCG_MAX.

That said, it is very much an edge case. I can send a patch with the
simpler fix if dropping the events is preferred.

-David
