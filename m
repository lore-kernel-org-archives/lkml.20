Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488386;
	b=B2AdRsZYFxOrESJPgY7BFk3xrKzWSq+3I3e4FJ/lWYKsfRr/ahxHQ64ZXYkN856Z61VE
	 jpQRs8exzWAhStGgR53Hhii3J/F2ckzLb1gRr2N91g38mQwl7QntAX9haRY/u6WG1D1ta
	 A3udEyzn0OydCPZ6Kq2Gh6yl/QrSSZIxVn5bq+x5gfg3y5CoWXivKH/gwnCRQ1Wc2Ap+r
	 p6G7+UakHJyWEJFllUUDjqLkQ3Eq/cT8KZ7MgjkEpepYfLwZULwbvBEG+RHdcdtae4JF2
	 KhI9DWDlYG3X3MMjKgfL4olMntQr+bEgzou4htBld+5kkT+EpLiiD8RqRI1KmiGys+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488386;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J0+lfnK2ji54QWZAyRSEpc2tj9spaFX2qA6M89XNIoo=;
	b=P8ZKlPXklTaFVobyqru/++wFeJZQmud8BkmVYeaH2nyET+dgZeifYYKxUNWwtC8Sjrhe
	 vWyGNFln0DAo2tuFz943/rRCE4j+3y8a1k7GJedlv4A025UBeEf26xByUPm05mXAGZ38s
	 2xKFQ5YGfP6VteXRO3723f/BdcHaKw6OrMlRp+Q1KDinIukQ9GXVmkecc6vL2uLxB9sjU
	 LZrF3RZSfqe5xjqNixgZTKoH/T7VhHmkiFPKavBFmHJuh9GTGUEGG7JHewhOno/KZIeDo
	 dMx2qBJl5IN2YaRim93OpFgTmBIkiLv+x7wXqCD/4VWEvJr+CStEok4HmZHhh5k/ekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMolvZzC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMolvZzC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E701F000CF
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792488386;
	bh=J0+lfnK2ji54QWZAyRSEpc2tj9spaFX2qA6M89XNIoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AMolvZzCrE9FsqFbw4SGb9M4ZedXBvrlRBX0i+zw80ff5AI24lfl4sF8vfA1Ppbvj
	 xXdC3K7lSP+DaIoj2HeRQZ7bv7l3w6AFluyqRstiSX4orni9afwayKb8V7asA7FTTj
	 78w90EpeTQdHCeRLzNTbaTlyHx+kBB7ril6YFiYb5fcjgsbvQa1SolunQHgBBYlBPk
	 iN68dMvlow/UtqwN5bc0IY5Ipu+FRt9aTWFr2tl1BppAMR+l4RT7dNTDoe5OVPIKfg
	 fCmCkOs+oIsSPaia1EzF2YJEbd9mtCeRE15/kxVMWMeaUbZEesOLqhrCZlC4c2KEFI
	 qvYy9oQ3teAfg==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1e5d7450so295862485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwh9Af3HPyM6AOE9M6ej2Kz6cz2oMgGug5hx5cin6Md3vNg/fxfdgi/IWDGn0vmo1GvXAVDUNGxU7VjM1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQR7fFYELv8NyOFkM0hrs/k4wJxM6n8EYfsvGO9AsRIEFQqCIi
	Qik47WrYxDMG0hE0gQnXNho/jNeRfxto0wQ23uVz4aGJbAggiwPdaYy8uy3jwXZjOYfkhqKpnq4
	zJ+4HVAAkdI5wH/2b6qaWj/hTEZRYdFw=
X-Received: by 2002:a05:620a:408c:b0:93c:c162:125b with SMTP id
 af79cd13be357-93f29d1a770mr1721438885a.39.1792488385421; Tue, 20 Oct 2026
 02:26:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 20 Oct 2026 17:26:13 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xdZY2v=syWaGKFiJghE5TO5tR_4sk2-kmMdTy6SprRxg@mail.gmail.com>
X-Gm-Features: AclHuK_kJOmr_OMPMizx5puB1D5dVZqP8QzAhDuMdwUBYuNlpiHafiyq-2_jg6A
Message-ID: <CAGsJ_4xdZY2v=syWaGKFiJghE5TO5tR_4sk2-kmMdTy6SprRxg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec lock
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 7:07=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> folio_unqueue_deferred_split() on folios where the refcount has dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
>
> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> the deferred split queue lives on folio->_deferred_list in
> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> per-memcg per-node lock.
>
> There are already other existing callers that call
> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
>
> Add folio_batch_unqueue_deferred_split() and use it in
> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> unqueue each batch of zero-refcount folios from the deferred split list
> after the lruvec lock is released and before
> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> critical sections, which run with IRQs disabled and are highly
> contended.
>
> This came out of the discussion on v2 of the mTHP shrinker series [1],
> where queueing small mTHP folios on the deferred split queue was found
> to regress Barry's fault microbenchmark. With [1] applied and
> khugepaged/max_ptes_none=3D0 so that every folio is queued, perf lock
> contention showed that the extra cost came from waiting on the lruvec
> lock in the free path.
>
> Test setup: 2-socket Intel Skylake, 40 cores / 80 threads, memory bound
> to node 0 so that all threads contend on one lruvec, with each of 80
> threads faulting in and unmapping 16 MB of anonymous memory 200 times.
> With only 16K mTHP enabled, this patch reduces the queueing cost from
> 15% runtime to noise, and lruvec lock wait time (summed across threads)
> drops from 491 seconds to 38 seconds. Most of the remaining contention
> moves to the deferred split list_lru lock, but runtime still drops back
> to the unqueued baseline. This test uses a worst-case configuration ([1]
> is expected to only queue folios of 2M and larger).
>
> [1] https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+=
te8G1MaU9bXs99w@mail.gmail.com/
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
