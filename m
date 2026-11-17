Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794931761;
	b=OekO8U/3pknn7l8ojXwtFsOvpxV9WGezNSPzIsKyJA2GlREfSLFC8Bk7GA9Z34vIv+/0
	 lViNbF0wqp4Y7oSaVYLnDTD1LrTyoLsa2pWzbtE4CzG03dFQnk6UE7LnpM57w5XzxikNE
	 CcxIYEViKF55EbclGsJSkuxGMqWRqTRFu7aWlLYxdwC1j1snzB6iw5gWUJP9L3Yrcoqhr
	 4aQuqm6hUrq7umPZia7jsspm5XjHBmlg52MtxM9+dOU3HWIEHCsvihatyNogiUaphhKU4
	 cLHfqdKxoJxDrwiRk0HTwtlMLqLPqraGay3n2u+aT7T4G+kDUmfsu/kfRjhrci3Q4XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Duk/Ly9knZ2Qqm2htGfXJ5frjF86SD0sTzkSqrDd61U=;
	b=HiB/XNqbS0aGzNxFrAGD9kamkrr98vDrWKGZyVR2mrkFb1FSGdQsYuVZcQNeeUVQlUuD
	 LFYh/kJLQ0tJ/UrP4P50Zz3VtJzozXRBktENZRqVumEkkPk4BWu/GnaVIiXT+tWSnVdDY
	 2eZxFJ7Q5RzmVqdeuFgdHx4QduMq5aPm1cnKvcGW9gfuglbKhsPJThZkCgO8q15C27C+D
	 kK2NXgwC1JVHPdGeW+libab8iv2iSpHoNSZg9s2JVfBMDK8KGIc/fXQBXRFvxsQ4Cxzey
	 c92P8xBQFF0aCYP3QJQYC932b/gATY42NwwOdC50X+VWj2ykDkCU3ZnwwXkylsoaqpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vXYqEvUV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4518D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vXYqEvUV
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so934266a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794931759; cv=none;
        d=google.com; s=arc-20260327;
        b=iHlrI/x435n+KD4Tws+hxsKx0savQ/SUyLWjPRBXeBHmqzmbvmeZitRatUBnwtW2YJ
         a245GkcZKn7x9DdSNYdwR8Rv4PZtKgfGePsFccZjQVEwyJsS7jb76CEcesS06yMmW0wO
         uinKLYvcPke8EKpllN5WpXiNlPdmvJosONXrcijT143RpY7TL4f83TS65oN/IJnOk5t3
         EiWOjyVD3tSnurFqePNmAg7BxJkTetkOFdQZtpE0zzjup9Yx1nJWRB9NrQLKQ3b9EFj6
         PEtaa8MhKSHOi5GfkQH0WjrykluICpEFS7nHmyrLrfMiPfVuquHo7TmlGwPtSI9MHFzX
         FPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Duk/Ly9knZ2Qqm2htGfXJ5frjF86SD0sTzkSqrDd61U=;
        fh=YChnCXuJ6gGi/Bx/J3vOsQ4k26O0uNJHyqpz6zoDyuM=;
        b=qewS3LOVGkY0zTqbYZIvZKbivixQddSq2j0yHexfXATjcFNooSCas6sm86IlPFLl0o
         BAZOPANtnW49dVzPnaLtrBhCkmnbs/fFf3psUo4y1qxvnPC0ih++TJAfkbEsZOj3izUv
         6kVVcnH9T6iUZ4HBcSErM5iVMs2EYQD22wxiuY5wIusfCp129s076I1malnTDZwbdF+M
         JUk8BKcOjWRW83sreZB6j0RzjQb7NAVjLfk/PAjWz0xJcLbRaRsyEN9xeKnDlpYxkNLt
         YHPau82tS8LgvRZaX5jbkPdv2WSXI9cD5dG7Ap4KZr4Na8rpT/mYhvMRkxNsOlMfjguy
         r8Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794931759; x=1795536559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Duk/Ly9knZ2Qqm2htGfXJ5frjF86SD0sTzkSqrDd61U=;
        b=vXYqEvUVKBMa4SdlJSwubBYz03P+NhSHdW9sYlgwexeJlEvRNl1WKirdAyg6quEg7U
         tcAmsVGEUc1Pe+E89rinJ9To1AO1l7peoEQhx5tK+fKfRsjMXJq7efbTFMLqq4JIOPYY
         GZ9CiFW2njkXXdn34wwvsp6cWUr3uA91RaDp/fOe68tLjWfoi1U8X/iv+qly1BhETVDo
         gaD5En8i6FxkFP1t29xqunBYjHuOwVPAFtGba3OTyfNczfloE6FdirpCTE/zUqYTjcM7
         0+ESuRiXUNWYK5rjYkWYiZ3hFEf4ZQxOaNdlMjzNLskvuxqyKIKB1uBrUdGmffE+Yz/v
         QvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931759; x=1795536559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Duk/Ly9knZ2Qqm2htGfXJ5frjF86SD0sTzkSqrDd61U=;
        b=BmKvZvBFCrqgPN1ZNQEqbw57svCcllNJBaZu5DXfol7e89cAbmWtiT6AS24Euvw6g+
         6axxg3WpvHAKsUpeLrZ0fOKZ714sYUIuSM3RvavAGToT1qbooalXW+yqjRo5ok9x/W/X
         SbXr7zCosgJ1LGsRGXot6nd5L4n39tP9a/NHxTilbYa/RfIvGWR+rV/AiEVrX7voCbiv
         yF85/8/2qlydi1Nm8CQnPgS67bG06fxc+b8Z9V4+jo4KPsWpYqlKksaJohXMTyhLrz5r
         kNEvmGWzAwnBX8N+Z5B1jENPLZCC22hY+x7vungizATOLMPWUYB4zAxXZ9xFkk4qOqaA
         8Cwg==
X-Forwarded-Encrypted: i=1; AL+hErF1TKUumvDWZ4zcHIDJCNEiHRwCRZavdkidxQCgsAm4inz1ko6YJYbGZLK2HH7KxlwNYYP0Yldlo1kfQcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qN6lKH9q+7qx+Oa49GJQ90Sq5J19SLDi+I+zMZF30x38lOASy
	KS5Bh5k+awkVenhkX2Fx9QBBk397xZd23Xy6YTVVJWLCEjvKTkD8bASyiKsujTkOOUoeJ7ekEW7
	v0HjV95LGUHZm97K/4sSLRGZnlT1mMFGX0pbDznrn4A==
X-Gm-Gg: AYBFou24ysERjR7OSrvX+4q+vWLFnKF5/0NqPZ6Pp+by2/g46wQSYeivyfKKmg3FNhT
	SRCSk50OhF7leH2GVdO0I/avS2Q57cGPPtR5OGuYyvL78qPFT4eSI8H4Rx2suA/NKZKr49rw/4J
	eMzHjuvFmBASEzqnsHZvMRTDwrAtzMDE4hjddZpVsyh2d7Zoz8/ukVtdXmpDFbADVbI5dKGCwUw
	CBpJzXHgaCJQuxZWZgi79siTdpnfXPnIRfx7BLyC84HWdh3mryvprxR/tA+wOQ+tj4d/w67jwtN
	K4plISrMwYAIUIEUrPOSAuSXEjm52HuZ7KWf/UiiOrbjHYfz1gZI8WiBBoKbQOd07MnRTN//l1g
	oh64/WdLXYqjMfjJT80ySwZ0wNFXB3r5Yr/1dJJ81HYkliYsUn3JQ3fTLSuVrLo6bM/hKqw==
X-Received: by 2002:a05:6402:3206:b0:6b7:fe9a:23fd with SMTP id
 4fb4d7f45d1cf-6b7fe9a26a4mr7562371a12.6.1794931759449; Tue, 17 Nov 2026
 08:09:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
 <20261117154656.GJ1813469@noisy.programming.kicks-ass.net> <20261117160522.GH1922751@noisy.programming.kicks-ass.net>
In-Reply-To: <20261117160522.GH1922751@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 17 Nov 2026 17:09:08 +0100
X-Gm-Features: AclHuK84cy664VjWnfDh6-UdX5daZUqtSDZj7XtuJTH6S9DhCn4EMd9YutATMcE
Message-ID: <CAKfTPtB4dKRmK5hnv_Me7CJVECKmoNw7_VywgLyuFjKDi-Pa6w@mail.gmail.com>
Subject: Re: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Wiseman <chriswiseman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 17:05, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 17, 2026 at 04:46:56PM +0100, Peter Zijlstra wrote:
> > On Tue, Nov 17, 2026 at 12:50:01PM +0000, Chris Wiseman wrote:
> >
> > > +   sa->load_avg = sa->load_sum ? div_u64(load * sa->load_sum, divider) : 0;
> > > +   sa->runnable_avg = sa->runnable_sum ?
> > > +                           div_u64(sa->runnable_sum, divider) : 0;
> > > +   WRITE_ONCE(sa->util_avg,
> > > +              sa->util_sum ? sa->util_sum / divider : 0);
> >
> > This is micro-architectural.
> >
> > Gemini is trying to sell me:
> >
> >                               IDIV latency (32/64)    Branch mispredict
> >
> > Apple P-core (M4 tested):     7                       13-15
> > AMD Zen[45]:                  10-13 / 15-20           15-20
> > Intel Golven Cove+:           12-16                   17-22
> >
> > So on these architectures it is more expensive to mispredict than to
> > just do the division.
>
> That same Gemini thing is also telling me most modern uarch should have
> an early out when dividing 0 (making it cheaper still). OTOH it also
> noted that if the prediction rate is near 100% the conditional might
> win out because of reduced port contention.

Yeah it seems that arm64 has optimized div with an early exit when the
dividend is null so it would be better to always do the div

>
> As per obvious, if your uarch sucks at divisions its most always going
> to be a win.
