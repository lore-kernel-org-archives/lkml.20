Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730540;
	b=FSFrcZF2jOiw35a4PkmHjmX3z5H9MoN1OQZBK1MwOj8TzwpJTNqbp2+pfYaqP10j5xx5
	 4qwS0UVihu7SCX0Q4n4sC7tO9QcrIGjPsdnz6bOTUtY8SkuvmdyxTaObKtjDkmRiyyziq
	 u12/HPkYADG3miDdNIrqzfYPgPbJzFS307iMKTDPfE4DaS1zvjgtcIedUtzxtdVHl9R6v
	 70BZmxlTxCz5nBzZNE9QU1Nle9msuqle5BUSllVu2ryiPmjafgRIAqQkQwjqhw0YlfPQ/
	 dAA4eLWwp1bzOqAaCKaVEFCgTSWa47ArzPQLOMpVcorp5iW22BHFkh3oXdTgsB2Ic5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730540;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A2SxbtdInviKmhuZ6qhITPKihTTKCU8zqlv1zCWXFFY=;
	b=5dtx1Tf+3rPiAAWtR6stf7SjFRmdL3p4d3m9fSgAzGXFHzJTk0xH2A9Qlts3lGPy8wsD
	 WiqGlm4dwWOwa4dndRzqd3ljctDn/ilN+CS9ZUunIFDtESNoW/MsjvVtGhJYx99jC2ug/
	 vV3xsyKnZZQzd/rp6AZOt/7+ajx+wtH/bYnm57k8LGnLUcuYqQ5/xh7cD8oJRT+hMeSL7
	 +MQgskNKVTqEy2ZVO0FPDDUCJDtidWqs/ItP2sP+cS/yiKa1XCyLU5qWzba9hyOvg1qak
	 nLsHNgpcaXylo0aMlD/nPHzQErr7W3MXuxT2LKswiDrWfNDYbzyzOn2rDdI355wysow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWTqrsFV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWTqrsFV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F31F1F00A16
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730540;
	bh=A2SxbtdInviKmhuZ6qhITPKihTTKCU8zqlv1zCWXFFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eWTqrsFVSCOoYkWO6JKwgxZuZbuyGCUqOjMv2hJ+fgZhXiUMArt90EvcdZH0kBsPm
	 SKpH4PJpntYX3RqET8dHhFZdjNDDCbJ2M2SKJjhf8Q2JAgYkrkte9awr31Hr44qSmq
	 ubysmm8JJKzmgJ3UPwM7S90X8doOeOlcejbs0IeS5W4D/ZU/sgpni+vTjlGPegD2sU
	 d9k5eaYNOJe5pu9tVWan1knYixg7QPfXH61E56pEmGWzVHyXLGd5KgOdGznJvs/1G6
	 +6jPHvaHyZ9aGhQJGPKTO8xZ4TItOjfrAMsZcvKEld2ozllOt+Z2Vc1GeUupBwhDQ1
	 BpcAZvVx6btBQ==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93cb9e9405fso235031485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:29:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw4w4f2XtMHoreN+fqXmXckX0t9mhMnz3VOOSKob826J9gKJsbbm/Epsg/GuhbjosLa32XC+jj1WzWTL4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0S9AokXZbN4ZvIpfpdsRbjStLDF2bPgspX0imLe9BLUfQjr0N
	KoLvz/nJl3LhWZu4cXv7XNZEufUZJDArOSjji5mu1vODF6XP73oiepoUpsm0GjbArffTvQ3LcKH
	yOx+EEGMLo/+Ii5vZ9CB9kxRCW9qLKcw=
X-Received: by 2002:a05:620a:3196:b0:93a:824:ac8d with SMTP id
 af79cd13be357-944216b1afemr2371370885a.27.1793730539153; Tue, 03 Nov 2026
 10:28:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103025610.3738894-1-ridong.chen@linux.dev>
 <20261103025610.3738894-8-ridong.chen@linux.dev> <CAGsJ_4xCTSctcPcC7X6Dx4zYaOycaPqs0DG7AaxB55wx1Afwpg@mail.gmail.com>
 <9cabcddf-d807-4a36-84f1-5bb06ea72aac@linux.dev> <CAGsJ_4xXDZjhN+NkvtN+vAp8Bokack_JdNgP=nGPQtHUX8_rqg@mail.gmail.com>
 <f5137dbb-b0ed-44ea-a23f-5c848315a68a@linux.dev>
In-Reply-To: <f5137dbb-b0ed-44ea-a23f-5c848315a68a@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 02:28:46 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zNZynkZn1mb+nT1n6dq4n399VC8Lbo5Sv92gioDfPxUg@mail.gmail.com>
X-Gm-Features: AclHuK8ocj8au7qeT_BVvieNJJ4o0s2vwCrhyBoxk-38BXmuY8mPvZOfmLABhGE
Message-ID: <CAGsJ_4zNZynkZn1mb+nT1n6dq4n399VC8Lbo5Sv92gioDfPxUg@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] mm/mglru: add tracepoint for inc_max_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, 
	"open list:BPF [MISC]:Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 8:23=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev> =
wrote:
[...]
>
> Hi Barry,
>
> Agreed, I'll go with option 2. Two things I'd like to confirm first:
>
> 1) To report the reason, should_run_aging() would need to return it
>   instead of a bool, e.g. an enum like:
>
>    enum lru_gen_aging_reason {
>         AGING_NONE,
>         AGING_NO_EVICTABLE,     /* eviction is not possible anymore */
>         AGING_MIN_GENS,         /* better to age, eviction still possible=
 */
>    };
>
> Or just report sc->priority, swappiness, max_seq/min_seq and the
> per-generation nr_pages, and let users derive the reason from them?
> The former is more direct, the latter keeps should_run_aging()
> unchanged.

Right. We can let users infer the reason from max_seq,
min_seq, and nr_pages in each generation. This shouldn't
be difficult, especially since should_run_aging() may
change. We don't need to spell out the exact reason.
Just present users with the overall state of the lru_gen.

>
> 2) try_to_shrink_lruvec() has changed quite a lot recently, e.g.
> Kairui's reclaim loop rework, and your swappiness series also touches it,
> including the aging part. Is it stable enough now to carry a tracepoint t=
here?
>

Yes, I think aging will always be needed, regardless of how
we change the code, so this should remain stable.

Best,
Barry
