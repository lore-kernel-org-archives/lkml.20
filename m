Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474996;
	b=IHHCQEa0+FRz/B4tEL235Wm2MvFfHjxck78bGhNLsAsnTysBjroczje0PujHccLuiH0w
	 lDmQH7G9mf5ak9qusiLIRs4tgmVhwG2Z5StwHvzP4XVsdXraTaL6GCi166ya3b+fn6wt4
	 TgXeGKO+g7+w8x5TRuRiQ4udZLGrlYevvWkU31ye9DlFwMkVvJrxQfO9m+mI6wBufRm7V
	 m/DToay10RFMYeGcmN6yWlqwYHFkBZdTCXA1dN1jDubR3RcU4LIoH67r4opNe1Q+Q/8rH
	 6Kj/JfNR9Ur+8eB/AJFMshm3bytCdDus/J8816D0TxZSXswNM1F0eDLlyza99VbLXaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474996;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TOWQDPzVYwtb3Y9VfuAlKkFOXg9wIgroexj3Hv2c5PU=;
	b=CtEZCfb2onAqcGA6qbwyfAVXOOVaY+B/1x6KkF56iivkWM3ldFn79hhAeM1/obTjlp7t
	 wNlSi1AQY0N3DTqgpxpHHZNL2QLDOc2aGkLDOp0iI+ELW6UHs4/T8JQEGqAN4x6xAtQSY
	 bmDcfWgyf57V/eDOnjhP43Or6AZCj83Y0GOuYm+XO8H6lP/GNUNq91M4SaeF+Lh9tDUAH
	 eXeZvt+gP76zrcwRZx4TtS69zV7WE2QZHnm0pySOEuGxcnDgFREB0UxrGL2kBlBRRgk1d
	 l8rceJ85Rw2orRGhNrrzmXXz9AbAyLZRf9BvdVXDuHS1869+NaM0iD4wi87KmBHKgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f70NTLHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C74606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f70NTLHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1B31F000D2
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792474996;
	bh=TOWQDPzVYwtb3Y9VfuAlKkFOXg9wIgroexj3Hv2c5PU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f70NTLHkDVN55vhVr0fufzuQdr+cLQ81mv0DoqgITqT95jr0aTO2WywORcIWEJloh
	 /GSB/0/0drt21A+Lb8Bc6sOfL96QsepyOsAZomCvIaCJqm2MNx9KlYhAhD7kKePisK
	 UA6Go+IV5NOkHcAToxd/yNIhcMwJ2PJZ+OSvG2KtmYS645eCpzleIMKPT8I03nrbPJ
	 m517j4DX4cyslRWGnWrn/3tGvbmwkIi3VfJNJ1ZLjimLOCdH0vxojYbs3mBph81q8i
	 OTKIKc1+5hSapk/o7eqREIT+qlRXorRSwc4nwd3UeuKZcnw2j6/Rw4ta4zlnxth2+4
	 5r2lyaTkp6D1w==
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ba8fcc684so28906526d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzD3YmBoBuUQzMtQ1GQH7ey6rAEE+Lecc95dW0TIOHnyb/1V0Rklv8Qe2absFqUxa2BrejdVx8q63S+UHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMu6o4HgagVWyGvtsmrUhPrIkCqT2UKu7m0SRBOYZ4h/D0Tw9d
	WCNV9v9niwit5uA5slBIlqlrP91b6nePwrqEALsmyxG96urKuQEG0jKmctEN5B7IHs8O6xM5oW3
	nKVydGR2hLTne6H44IMXQrGm1o6IeG7E=
X-Received: by 2002:a05:620a:294d:b0:93e:9508:8360 with SMTP id
 af79cd13be357-93f29ceeefemr1685050085a.27.1792474995360; Mon, 19 Oct 2026
 22:43:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
In-Reply-To: <20261020023548.3242028-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Tue, 20 Oct 2026 13:43:02 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wnuQhyCkMq1Dub8HgB+uYAjy+LkgBxCRJG_kZiwAxA8w@mail.gmail.com>
X-Gm-Features: AclHuK9hXCsPI_k_chn3M7rnq88MHnuONOxS0xCnvuuODST2TZzqbko9HA9tBaQ
Message-ID: <CAGsJ_4wnuQhyCkMq1Dub8HgB+uYAjy+LkgBxCRJG_kZiwAxA8w@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:36=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev=
> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> lru_gen_folio_seq() computes how many generations below max_seq a
> folio should be added to, but stores it in a variable named "gen".
> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> seq % MAX_NR_GENS, so reusing the name for a relative offset is
> confusing.
>
> The comment table above the code also no longer matches it. It only
> covers the PG_active and the final branch, leaving out the reclaiming
> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> although lru_gen_folio_seq() never looks at it.
>
> Rename the local variable to "age", redraw the table so that each
> branch maps to the age and seq it produces, and note that the result
> is clamped to min_seq[type].
>
> No functional change.
>
> Assisted-by: LLM
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---

Hi Ridong,

The cleanup might be right, but this part is changing rapidly
with Kairui's MGLRU-FG series. Maybe we should wait until
that series lands and then see if this cleanup is still needed?

Best Regards
Barry
