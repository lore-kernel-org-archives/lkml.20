Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87935E1A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936022; cv=none; b=SIx96c6kfAEGhTJpzBpwF/tzzGpGOM6EKsMXBx00uNYKS1lA19z2CLiP2QtM8KWG6apl254RqqPjqA1BqbjQKZ8ipuYGEXbrvMzGqNLnseL5wyoQ5RhpIBb5T7PWostdYlUC904cs07Gc7sPBROnPw3z19R9GPNxCs0GbewUO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936022; c=relaxed/simple;
	bh=qUw3nUc1OVsOPX+nR/7pEzuAQxXoIkSn0R7ToufWBlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2dlW+K0n1VxMdJNYr4agbJhSFFv9hjwcaqvhZ8Px7GnJxjD6qKLG9NjCIyFJsCMRWsoqld1T3/qHSYVD8Q9qFnu/WROJCmj/SVJ1N1lmLUFWiYGnYfetyMyzJ4vvfUfyonsHI/g1MIKzA/AMoNECxJbjiF0GDvCPrau9kK5Bxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0VDz1/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0VDz1/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD6E1F00ACF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788936020;
	bh=DUIpC49PUmusVJC7vwQlTM5YfwPWfFaooGvwBV89sWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=o0VDz1/7rM0Im/lxV/YZau9LSuB0uPu8jQBnwrfvMJqkUgAL+S0xX8hFbN5Q8TzJ9
	 VQ3Ug4pxTNhNOVXqP9Aq0Z+P6KSHtystcvJQo6ZDV3VOooC5se5xSZpPGt8FPbX8Gs
	 StzNw/+yCEAVnu+ca6LwOgxk0lZbsijkR6+MQyddgd3f1TliYvfyDZ8zSTYVMf/LgI
	 sVYOaSahigxgzd0GJ7I6/4BkxCZXmM3Ql2ehWzXmgrNzPDcqhayirEX/HdyCPmsZZQ
	 Hahu3Dn2HRYae60uhC8USHRp8FDlD/e4e6zTmpVLmF+eLE/EpwNEvBA6qUpLrYLLZX
	 RO3+ckDsquM0w==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9397e2994dcso454843985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0NL3dnHFYc+QiWqJc1mRxcFE6WEJ/3HMNlnedqwc3ZB+pqCkgp73nmRR7qVpJ09X3i/CTQ5SeE9OzI5E=@vger.kernel.org
X-Gm-Message-State: AFuF++kQAecPnzFJTT7td7pfNPMWwly5pIZu64we2HqNwxvnaQtbQcw8
	pnRNpR2TfeXJRCdb4wwAQ7kgpgvgtx7bklPL9Yjcf/86LV5Ql/6N3LT9z7A91MA8oTKtX80vUG+
	7kcruOy3Jlq7PgNAozcZu73Eu1hXfx+I=
X-Received: by 2002:a05:620a:9502:b0:939:6de8:43d8 with SMTP id
 af79cd13be357-9398048ebcdmr2825220685a.44.1788936020200; Tue, 08 Sep 2026
 23:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907042447.2450663-1-ridong.chen@linux.dev> <20260907042447.2450663-2-ridong.chen@linux.dev>
In-Reply-To: <20260907042447.2450663-2-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Wed, 9 Sep 2026 14:40:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zT0HcbkQjdPFPBeaqbGcYp4WE6sghDzz=0evhhupCs3g@mail.gmail.com>
X-Gm-Features: AcwNN1XF81pARNfV8NupKBE8bmsecrn-XPHu6HZ3n4QG9cW4OnnnSsqVFmMC4Qw
Message-ID: <CAGsJ_4zT0HcbkQjdPFPBeaqbGcYp4WE6sghDzz=0evhhupCs3g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] mm/mglru: add tracepoint for folio isolation
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:25=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> MGLRU's scan_folios() and evict_folios() emit the classic-LRU
> tracepoints trace_mm_vmscan_lru_isolate() and
> trace_mm_vmscan_lru_shrink_inactive(). Those predate MGLRU and are
> indistinguishable from the classic-LRU path: they carry no generation,
> sequence, memcg or swappiness context, so a trace of an MGLRU run cannot
> tell which memcg a given scan/evict belongs to, nor how far reclaim has
> progressed through the generations.
>
> Add mm_mglru_isolate_folios, emitted once per isolate_folios() call with
> the memcg id, the type actually scanned, the effective swappiness, the
> scanned/isolated counts, and the anon/file min_seq and max_seq. The
> min_seq/max_seq triplet ties each isolation to the generation layout it
> ran against, which the classic-LRU tracepoints cannot express.
>
> This is emitted at the isolate_folios() layer, which is MGLRU-specific
> and has no classic-LRU counterpart, so it neither changes nor duplicates
> the existing scan/evict tracepoints.
>

I have no objection to MGLRU having some tracepoints. However, one
major concern is that the code is changing rapidly, so the tracepoints
may not be stable. We would need to maintain them as the code evolves.

> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  include/trace/events/vmscan.h | 47 +++++++++++++++++++++++++++++++++++
>  mm/vmscan.c                   |  9 ++++++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>
[...]
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 8409ea4bbf37..771fe6827939 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
[...]
> @@ -4876,6 +4877,12 @@ static int isolate_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
>                 goto retry;
>         }
>
> +done:
> +       trace_mm_mglru_isolate_folios(mem_cgroup_id(lruvec_memcg(lruvec))=
,
> +                                     type, swappiness, total_scanned, *i=
solated,
> +                                     lrugen->min_seq[LRU_GEN_ANON],
> +                                     lrugen->min_seq[LRU_GEN_FILE],
> +                                     lrugen->max_seq);

Maybe `scan_folios()` would be a better place for this, as it can more
directly reflect what we're doing for each type.


>         return total_scanned;
>  }
>

Best Regards
Barry
