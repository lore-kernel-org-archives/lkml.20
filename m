Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860535A39F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389367; cv=none; b=eZpsqQ6sqXsru7ny1dj3jbPWDQc7GfYs8M3jsElA0C4QUXO1qKHPnetzrD+YwXGblr7wwZlu7yLRQz+c4re2tNQxz1iHmpswHZfRsdM2ENvZd7E5pYy4rQNW4XDBx0m/WIF5pjLzZu0NI4YMgNmEwikrVfpSd8cAoR+DUw1DuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389367; c=relaxed/simple;
	bh=V1R/rxlJHtAIixzoKXTCBUmA5XYASXYQvG6Yh/D5vUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxIlKkLpSwULz3hgz1ZC0gIuuHyDnOl0ACRqtqtM0hK6fXt5Yy+Su8Aza8yLbxQcTnCNmTU6vFZJQdlPzt3v3KuxQknRnOxuPKV1Q9/9RxYdBluQhESFUYyYc0bAbDPGEmFo7Jb1wnZeimVr+AjGISPr7VHu1mzWfDhrlbZ+rDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSlGexRR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSlGexRR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822851F000C7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792389365;
	bh=V1R/rxlJHtAIixzoKXTCBUmA5XYASXYQvG6Yh/D5vUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WSlGexRRcveL3gPe8o8sNXcYcFIiLceom6L9+HzV8kU9geaAB8mZedMyFP9pUtlwF
	 V+vnhTt4gY5f+aR4Akmzo8RiAceKfB2Ollc/k4U7sBYt1tL8vaGTSmmSXevkX8uWJ5
	 LgrUvQ3Ub8V8ox+Jl9H6+jFmPOUXv2vEPvm7yR31LYBbjZeKn6zdvhkH247B4uZ6V/
	 igDLz79prmJHK5KBup7kAOLgTmu7LxbBiQwPQGYVfh2sfrZMibkZbwNaJbGMw8qS6S
	 6tbO3/9022qDbPcKwxWW8qCbVVNdDI8RcrQJMUzXq+aH+yVIb3KHO8SU5FX7o2zMKm
	 EkjjlJVpgnP0g==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e4c00d71aso171325385a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:56:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSEvM9ptpCD5DHTCteV3yQui9n7mvuNibaT7EYenGD+xCLlb9xxW7FpMhkaOiYaKE1+S6NcPKoSZ4q1M4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb6bnKcilLFQ6CnXzZxcWdoR2prLHvbLYRgeXHOtzcy8Eqk7UT
	pvDnCPH0oUx2rtx5+FRz2On2liysFO5ueeMXtMqKMtc57uipYPRu0Ckfef1Xkr7xmz7sekup+vt
	1+aG/gNW/CtsX1QNr4vm/Qq3DUNtkT+A=
X-Received: by 2002:a05:620a:28c6:b0:93f:3565:813 with SMTP id
 af79cd13be357-93f3565089bmr678706685a.9.1792389364634; Sun, 18 Oct 2026
 22:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017004555.2890038-1-joannelkoong@gmail.com> <19d5b7cc-782f-44b1-8ec9-a1764484f10f@linux.dev>
In-Reply-To: <19d5b7cc-782f-44b1-8ec9-a1764484f10f@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 19 Oct 2026 13:55:51 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yME1gdFCq4jXCK7tYiQKiV-CsRMLM7vz9L_69OkMaZ0w@mail.gmail.com>
X-Gm-Features: AclHuK_JiHk60NrX7-Usm3115HOQ01kuH7Otr6mcrw2Y29QUJab0XSsc9l_Jpxk
Message-ID: <CAGsJ_4yME1gdFCq4jXCK7tYiQKiV-CsRMLM7vz9L_69OkMaZ0w@mail.gmail.com>
Subject: Re: [PATCH v2] mm: unqueue deferred split folios outside the lruvec lock
To: Lance Yang <lance.yang@linux.dev>
Cc: Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:38=E2=80=AFPM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2026/10/17 08:45, Joanne Koong wrote:
> > move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> > folio_unqueue_deferred_split() on folios where the refcount has dropped
> > to zero. In these paths, folio_unqueue_deferred_split() is called with
> > the lruvec lock often held (move_folios_to_lru() always holds it and
> > folio_batch_move_lru()/folios_put_refs() usually hold it for every foli=
o
> > in the batch except the first). However, it's not needed to hold the
> > lruvec lock.
> >
> > The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> > the deferred split queue lives on folio->_deferred_list in
> > deferred_split_lru. The deferred_split_lru is a list_lru with its own
> > per-memcg per-node lock.
> >
> > There are already other existing callers that call
> > folio_unqueue_deferred_split() without holding the lruvec lock (eg
> > __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> >
> > Add folio_batch_unqueue_deferred_split() and use it in
> > move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> > unqueue each batch of zero-refcount folios from the deferred split list
> > after the lruvec lock is released and before
> > mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> > critical sections, which run with IRQs disabled and are highly
> > contended.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> > This patch came out of a discussion about splitting underused mTHP foli=
os [1],
> > where queueing small mTHP folios on the deferred split list was found t=
o
> > regress Barry's fault microbenchmark. The cost turned out to be the unq=
ueue
> > running under the lruvec lock rather than contention on the deferred sp=
lit
> > queue itself. Testing this patch on top of the series in [1] with the s=
ame
> > microbenchmark, queueing every 16k folio went from a 15% runtime cost t=
o
> > noise, with lruvec lock wait dropping from 491 seconds to 38 seconds (m=
ost of
> > that contention then moves to the deferred split list_lru lock, but run=
time
> > still drops back to the unqueued baseline).
>
> Looks great :) Could you also keep the benchmark results above the '---'?
> They'd be useful to have in the changelog, along with the test setup.

+1. I guess Joanne didn't include it in the changelog because the benchmark
depends on her patchset, which hasn't been merged into mainline yet. But it
should be fine to include the relevant details in the changelog since there
is already a link to Joanne's patchset.

Joanne, could you also link your patchset and explain which patchset you
used to collect the data?

>
> With that, LGTM!
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
