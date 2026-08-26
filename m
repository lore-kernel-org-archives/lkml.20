Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70C472539
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763385; cv=none; b=QChXxu+MIX2uvsI9wwXbl6/1h4OmTqT4vbUIhsOPyJfUP7bQmGmQ5MzuGeQKSGuxmQtBHhwutboUhP4FkXPSjKaP5k6Rxqbhn2MC2rWF3GiS1smv0wpjw2SDpgKKdDX2MjSFF+/ud1xFBwSBh6C9f6mRTXnmdSGzEvRdNtbiybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763385; c=relaxed/simple;
	bh=cw8m2BE3sjut1cXuyYV8gHEiQygxgYZBUFtc5w88RdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvnijaqLerZZDZ2Hhr97kXqnFso75xA6l2PeRLk6hso6WXQl7437t8s1nz9gsH6OwjOihYYV4e3/vL6S7QJKFuCx34PllIBwwdmFdYgqZZKO8+1tqX1bgavDoc1x5f/4p47f52dmjVPv6+rG+P0y34/SS3WJPWXpNrjdvkJcxlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF8joQd2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF8joQd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FB81F00A3A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787763363;
	bh=ih6zd9IyJdsKNzc7ge7Wk0lTujacAiQcltRsjQh0Wyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bF8joQd2AJJZatp5d+zQomHPdjojOKjNrJqAj/2efS+Obbro8cmhb50WK76lPgOo0
	 ZcsiJnYOfjsgWMThvTjO00ia7oQi9tQE+WwLH/T+ybTky78qz7CTFM1sorsbUmKWkk
	 zfCpywolVYDFfmnQkuq0Pg6Rh+2wwr0JjCTQbfNSB8NWbzrWYbAwMJKkknz8EOzzK1
	 pU2X4yiRBiXioQmcSGo08c8llUvijYzCiITWPvanMXTYE8RwcMdYlIzO9git3TBvid
	 sQLeTCQgOVfNc59wPfC6ZKLyuZcbV/G3XMMXEqtuIXb4sjgHANdY/nLdedAMN5X4MF
	 w5kmvR8T3Y7ZA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c26d7e951so177820366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:56:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpXya9cizRZsTK71z/NIb6LHtX/XSbdZWYwV58+2JyQbtnGeNdrFRu6++Mocq5ktgbfAJ/6uNHjBU3Myj8=@vger.kernel.org
X-Gm-Message-State: AFuF++lMGcGcJLaHBDDMssXtTiZd2lVYMWsFPNrm8R5UYGNIo24qg5F3
	NA4Y+LtS0BMs/+jSLonPm87gYwF9cPtuc72KvH88lrLgqF0ISVcCM0ShO83t7YPuhQmnmRrIEli
	J++nlUxf5G4g4Z80jmh8OAgT3CLdGJQI=
X-Received: by 2002:a17:907:3d0f:b0:c1f:983f:d8a with SMTP id
 a640c23a62f3a-c250c36b68emr1099051566b.24.1787763362320; Wed, 26 Aug 2026
 09:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-2-0171bd86a667@gmail.com>
 <CAO9r8zNFYM1bry0DwDRNtpnEL9yyXQ3h=1wcLbGsO1sFtGgvjg@mail.gmail.com> <CAJxJ_jgihBLy2mbPAN-uqup2mGq+hurKkH=W4RGo4Ad0Eki5sQ@mail.gmail.com>
In-Reply-To: <CAJxJ_jgihBLy2mbPAN-uqup2mGq+hurKkH=W4RGo4Ad0Eki5sQ@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 26 Aug 2026 09:55:48 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com>
X-Gm-Features: AcwNN1UNzh0Vl9JsLhx4eDQZm21D0NSeeRSHB0oeT-ciJDNy9lX0jJxCgAbA73g
Message-ID: <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 9:08=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> Thanks for the detailed review.
>
> > I think the reservation logic is self-explaining, the comment here is
> > not warranted. Especially the idx part, I believe we only set
> > pool->idx here to keep track of the reserved index, not really to do
> > it before publishing as publishing happens later. If anything, maybe
> > replace this with a smaller comment to the reader that we reserve the
> > slot at pool creation but only assign it when we make it the current
> > pool, with a small explanation of why that is needed (the actually
> > issue Sashiko pointed out)?
>
> Agreed.  The important part is the race from the v2 review, where
> zswap_pool_find_get() could observe a pool before it was committed as
> current.  I will shorten the comment to only explain the placeholder:
> claim the slot at creation time, publish the real pool only when it becom=
es
> current.
>
> > I think we can drop the assertion since we already have the lockdep
> > check below, especially because it uses BUG_ON().
>
> Agreed, I will drop it.
>
> > Hmm let's read this into a variable first then compare it to
> > ZSWAP_SLOT_RESERVED instead? It's not very readable.
>
> Agreed, I will read the slot into a local variable first.
>
> > I think this comment is unnecessary.
>
> Agreed, I will drop it.
>
> > Let's drop the assertion here as well since we're adding a lockdep chec=
k below.
>
> Agreed, I will drop this one too.
>
> > I would align the second parameter with the first one if it stays
> > below 100 characters.
>
> Sure, I will fix the alignment.
>
> > This doesn't really explain why. Also, does ordering really matter
> > with the lock held?
>
> Yes, the ordering matters because zswap_pools_lock only serializes the
> writers.  zswap_current_pool can be observed by RCU readers without that
> lock.  Publishing the current pointer first would let a reader observe th=
e
> new current pool while its array slot is still ZSWAP_SLOT_RESERVED.

Makes sense.

Actually, this led me to rethink the slots reservation mechanism we
came up with and the issue that Sashiko brought up initially. I
initially thought it still existed, as two racing threads setting the
compressor could try to resurrect a newly created pool. However, I
realized that's not possible because a module-wide mutex is held while
any module param is set. This also covers zswap_enabled_param_set().

So IIUC, we cannot really have any concurrency here. Pool creation
either happens through params setting (protected by a module-wide
mutex) or during initialization. Does this mean that Sashiko's review
was a false positive and we can go back to directly assigning array
slots at pool creation? If that's the case I am happy we can avoid the
complexity (but sorry I led you astray).

It also makes me wonder if we can just drop zswap_init_lock, but
that's a separate project. Most of the zswap init code needs to be
reworked imo.
