Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC61538D3EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947641; cv=none; b=ssoONi0P3jJPvpHB+gGlUcc23V0LU8NlOekHg6C4kx57A/TA3ZzClMh2Yw1WLJ0jSsI8P0BOzUgxrk7F9BDf0h7vU1/ZbJuRf80OxZY2iLg+guiAmf5KD1gTz2ai0sqU4W82zYhis2T0Qo+09kbw/yc4RFmnN0UeCGNmi8UaeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947641; c=relaxed/simple;
	bh=xafWGKCMJrMg4LkqDNQKwh6exjnqsIIY7f6p2ybXHl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0YiBWzSHD0D3rQTJYzPqgm3i47j9psgRL8cFq3kvo0n6teF01kPVaQqHPiBwnzTN2/29tjzbKiY8bQizote8EfCdS0jP39vQ7PIx0UMpMVpBea/S62cJBbzL41e0aEKS0REsAPZMc8GH1QtMpPHuxrzSD8UDKYd7kapzRL0U3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVK98rTK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVK98rTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742BE1F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791947640;
	bh=xafWGKCMJrMg4LkqDNQKwh6exjnqsIIY7f6p2ybXHl4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hVK98rTKP4691AQDpea0IZUehE1S5b+Kf2KdjL7u3a1Sk3+2gr8PqrwYD6U0QBwnv
	 KBlQHnd+C6n4V4hSm4B31tiZoT2KeKdd5COiBBq8weQ2op80Ltm3hOiFvHE/vnV3K7
	 rDOkDOrWlbEenUJpOCFnJomqrFCsq3mvUwiA5+OxY+XTRgtmLMbnRYxQwO9IEiWuU8
	 AQaQKIjkG7r3Hm/cpY8c+KXCBVWnjncZ0LwqHMGrbbuTHIuY4jk7rN97NUr2PmqYdX
	 kSgO/th3DoNUpJmPvdd5WhbcuK/QaFPis+XRJw9wraE/iQcHL6/LkWrCphKBSt6ydl
	 FcdFfx3kOL5Mw==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917d595138fso27688826d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:14:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzL9x/2gm9eOA2jBm32o/BRRH+YF2DG47xgqQjURYAa9JT/8RA2uHOpqF9CfQ09RYjLer2TTvRcfQbTCHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqPD3L/f6aqXOPijX0HzfkFexit//RXeh4ViiQt9iAKrQswpPa
	ftu263wsHbuF8wEXqRmD/tQFK5WtFcLLLVtO4S8qaRT6P2jN9hJh2sRVauxvRKq77zeiM6KRbx1
	3axmOYyqkxgC8akZmhKCcvszyPClxIQA=
X-Received: by 2002:a05:620a:17aa:b0:93c:c162:1260 with SMTP id
 af79cd13be357-93ebd24a4camr2358972585a.38.1791947639745; Tue, 13 Oct 2026
 20:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013221307.850803-1-joannelkoong@gmail.com> <20261014030737.2102-1-lance.yang@linux.dev>
In-Reply-To: <20261014030737.2102-1-lance.yang@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Wed, 14 Oct 2026 11:13:48 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wxKQK=caM6a_AqJArGyJdBgq_=i=gSNjiVePkGBZHnpg@mail.gmail.com>
X-Gm-Features: AclHuK8lputVsSCWQ9JjCuBEuJbYAeIyTKia4Leun33uZrp9EVvPHDRnkQPzee0
Message-ID: <CAGsJ_4wxKQK=caM6a_AqJArGyJdBgq_=i=gSNjiVePkGBZHnpg@mail.gmail.com>
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec lock
To: Lance Yang <lance.yang@linux.dev>
Cc: joannelkoong@gmail.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	usama.arif@linux.dev, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:07=E2=80=AFAM Lance Yang <lance.yang@linux.dev> =
wrote:
>
>
> On Tue, Oct 13, 2026 at 03:13:07PM -0700, Joanne Koong wrote:
> >move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> >folio_unqueue_deferred_split() on folios where the refcount has dropped
> >to zero. In these paths, folio_unqueue_deferred_split() is called with
> >the lruvec lock often held (move_folios_to_lru() always holds it and
> >folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> >in the batch except the first). However, it's not needed to hold the
> >lruvec lock.
> >
> >The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> >the deferred split queue lives on folio->_deferred_list in
> >deferred_split_lru. The deferred_split_lru is a list_lru with its own
> >per-memcg per-node lock.
> >
> >There are already other existing callers that call
> >folio_unqueue_deferred_split() without holding the lruvec lock (eg
> >__folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> >
> >Add folio_batch_unqueue_deferred_split() and use it in
> >move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> >unqueue each batch of zero-refcount folios from the deferred split list
> >after the lruvec lock is released and before
> >mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> >critical sections, which run with IRQs disabled and are highly
> >contended.
>
> Nice work! Thanks!
>
> BTW, have you seen measurable overhead from unqueueing deferred split
> folios under the lruvec lock?
>
> Any before/after numbers for this change, including the cost of the extra
> pass over the batch?

I recall Joanne mentioning some data on this in the link below. Is that rig=
ht?

https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1M=
aU9bXs99w@mail.gmail.com/

Best Regards
Barry
