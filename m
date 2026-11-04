Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783333;
	b=CjPjhNQL8u9oDO3xHoaYf0SObO8+5SFGGjM04aL9Jc+XY1z1PpwHtEPE+zXoLON6EUh7
	 z7YUek6+yfpTVwTELTC6t5s1NsabX9cCKhQJWwOX0yVFf7rwyB2sdgKD3xN/HH5Hb8SdU
	 g1zW0TL2AePKFx49zCGA7JtikI4WEcOZCwt9W4TJueVWL7kj5IPNDD6bba/9T3NeD9kFE
	 BM4IH5L/NhLZgy6fOuJGM5QwmV1xvoOcwHawn95K0cZ5qjgJyRvwePINXUMeA2UuS5/mE
	 7VqkH5zshzADflqSCzaz7ZqZyNFQlHkbIJEtr1HEE2ZWiuzBJw3tkLvTixERbianqLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783333;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CwbssC3IcsbRd7BqfSzfMYQRORQNQUvKDFxxlCd3lXw=;
	b=lzSoHnEi0SXWL2V/6gAqtJNZR63k9S352t3ccj5P7pRgAfa1ubuyhoPvherKgRVWvzsR
	 Nu08yxVHA7myO/3iuU2XNweDr+hyekHTooUCvDliBlV7LLoPPpotq5ow286ParKkx8tb0
	 mX9bwMsqHwzpaKdNy4bW2lcPCNF65ADLTM9N4L56ZRShBMTWLJL7+hjI/u+/NHml0Y84i
	 AKyiI9cXvWyvQIA/usR/waDf1piz6iJPFgyNscPBiQmPu1GOe7W8O+01Sc1FFXXBtquIY
	 +YmC7pXQ+WioYlRjneNxTudiZKUnQYzJgDzvRuM3MhyzH8yiUtyQkYxh7AU/mC88yEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lcmEB/R6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5880606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lcmEB/R6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D001F000C1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783333;
	bh=CwbssC3IcsbRd7BqfSzfMYQRORQNQUvKDFxxlCd3lXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lcmEB/R6akcJdDRia+T5rGWp4agY6KiX6qiYpvTJ8Fi4wSGBW+ouMzIM5xhJhtIZc
	 PQyrh00XtISp6tP5KqjmL/pDsx77Y9YjVQ0kFn7NF253J0OaGT1WoEi3v+p1ujRkn2
	 ga4TmCjxu6LdUp3QZEVh5/CpXTzkW+bLSzcwn2XnlXUC6Kk0WEBJ48IlxV2S8q6663
	 n0fHi8hMv9XYd7VYyaHE1tZehMNWE58GKgF4ego9G7B5eXG88JagfLL6trQlQEbiWG
	 YQXc+0NZsUhcha6BMuUCRFC8IzICG4U0Rmr955GgZspNXBcmXauXEJ6qCHI6wCqs3v
	 bg3pzAcT+tlxQ==
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so323142e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:08:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByjcpn/wadOzTYiHmZ/B5uvk4EVxZS+FEydXU33N425Jre3IO9TCB6Nim1J9Am30tJAUF4VgT45U4d2dmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w0Q9b99tih/K8ZTJ1iYRlC6oafvIc6ZFRpjGsNPD4RS5NiSuQ
	/bBcxrxdOd/X/fmiUdyxay4RDPGn4b6ZcF1Y/JbcsCw03pSWWpM2Nkt4+WGHCkE9LncO2lmooGA
	gQYbX0bYvt9YuviO6SpFJNcO5UzYXeSg=
X-Received: by 2002:a05:6122:3108:b0:5e7:8bd1:731f with SMTP id
 71dfb90a1353d-5ec6897757amr6563644e0c.10.1793783332317; Wed, 04 Nov 2026
 01:08:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
 <20261103113711.1832834-5-max.kellermann@ionos.com> <CAGsJ_4wpd-e+xjm5KwihVziAeVnQp3XYG=+-BKmx0SVEhmyqqw@mail.gmail.com>
 <CAKPOu+9textOydxZYng=Bo9Sf91Wq_7rv5r2pBrhXOfiex=qGA@mail.gmail.com>
In-Reply-To: <CAKPOu+9textOydxZYng=Bo9Sf91Wq_7rv5r2pBrhXOfiex=qGA@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 17:08:40 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zzZZSaAwG=VLhuMvoD0YcAFdqyUr-8zRSibNw28j8wzQ@mail.gmail.com>
X-Gm-Features: AclHuK8306bVpFSltXAI1ZXaA68bWTketiXOy1YGPxl8Unk8QhQOKTXLATnYAlc
Message-ID: <CAGsJ_4zzZZSaAwG=VLhuMvoD0YcAFdqyUr-8zRSibNw28j8wzQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mm/mglru: avoid redundant rotations of young memcgs
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:27=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> On Wed, Nov 4, 2026 at 6:18=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
> > > In my micro benchmark, this increases the request rate by 36% and
> > > reduces the average duration of each write request by 27%.
> >
> > Could you share your microbenchmark somewhere (or post it here
> > if it's not too lengthy), perhaps on GitHub, so others can
> > reproduce it? You could then refer to it in your changelog.
>
> Will do.  A note of warning: it's ugly LLM slop, and if I had written
> it manually, probably 99% of it could be removed because it's
> pointless garbage.  The LLM wrote it for me before I had any clue
> where the problem could be.  It helped me find the problem, but
> uploading this garbage triggers a bit of shame in me ;-)

Thanks!

>
> > I think this is a correct change. I wonder if we can
> > reproduce the issue even without concurrent reclaimers.
> > In other words, can a single thread running in a
> > memory-limited memcg trigger it as well?
>
> Your question is not really related to this [4/5] patch, is it?
> Because this one is just an incremental optimization on top of the
> real linked list scalability issue.

I think it is related. Although lock contention isn't a concern
with a single thread, the early goto unlock could still save
some CPU cycles.

I can imagine a scenario on a system with a large amount
of memory, where a single memcg (e.g. one running a kernel
build) is limited to 1 GB. If this is the only memcg
constantly being aged and rotated, it should remain in
YOUNG most of the time.

We could still skip things like:

        hlist_nulls_del_rcu(&lruvec->lrugen.list);
        hlist_nulls_add_tail_rcu(&lruvec->lrugen.list,
&pgdat->memcg_lru.fifo[new][bin]);

>
> A single thread means there is no spinlock contention and the linked
> list is only walked once.  I don't think the problem is visible then.
>
> > One thing I noticed is that you may not need to call
> > get_random_u32_below(MEMCG_NR_BINS) upfront. Could you
> > defer generating the random number until you actually need
> > to rotate the memcg? I wonder if this could further improve
> > your microbenchmark results.
>
> Good idea, optimization added for the v3 patch.  I don't think it
> makes much of a difference, but it really makes sense.
>
> (And I still hate that the Linux coding style requires having all
> variable declarations at the top.  Code would be simpler by
> declaring+initializing variables where you need them, and additionally
> it opens more opportunities for compiler optimizations, but... it's
> the way it is.)
>
> > Anyway, the compiler might be able to defer it for you.
> > I'm not sure, though. Could you take a look?
>
> The compiler is not allowed to because it is not allowed to make
> assumptions on what get_random_u8() does, therefore it must not
> reorder the call.
>
> (I wish C had a way to express a promise like "this function call
> won't modify global state reachable by the caller's pointers", there's
> just GCC's "pure" attribute which is too strong here.)
>
> Minor note: deferring the PRNG call will move it inside spinlock
> protection.  I think that's okay, but it can theoretically have a
> performance impact, and I'm not expert enough on this part of the
> kernel.

Thanks for pointing this out. I missed it.

It might be a problem, as it could increase lock contention
by holding the spinlock for longer.
Only testing can tell for sure. If it does increase lock
contention, I think we can simply keep the redundant
random number generation.

Best,
Barry
