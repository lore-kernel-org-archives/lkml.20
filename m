Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413836A03F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046742; cv=none; b=PVs2GAY+nd/FQfZLSyxIg4KlIWtBSTfdpct8JX+ydvlj8vBzb/b38dq9+ZEp7FKsl2gKnzoX8lvA9ndQjPgCSgCDdW1n01za/XNB0n7FHMKGm9a9HzYCCsBu8l04xuQh+OZy41GWcdTgZyuMXv5nqZTbTQJq8Gf7iFr8ZBL26dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046742; c=relaxed/simple;
	bh=m3MImKhlHnhCv5xSfcKTiMIncefsPB3WrAQGAXXBe/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G67s6FUYTecrLRjZZhLixw5aI62u9TaF8osi35e58w5HTt2K/oIB31eCVgrHbihbiWNhxHltcPOaV7qwXYG84iGtu6iC4r3ncydbDzGU0PMpJ6NXs+uGVAnmRL0jPjLLwC1SZSPY/RXMdgqh/OCyh1L8++MOwxO7aQQUEOjje3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcA1zmyf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcA1zmyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4A61F000CE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792046740;
	bh=yUUb4aUA8pdKeJRIw+VsCp+sINCbCIsBC+z37Mf9fQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XcA1zmyfS9BftenEXmDqZGSMBPZ1gCM6B9qxBVH++lmXx893J1krgl1rnhryVyUm+
	 6eMLrGOGOdRx5WZVgj07DCDy3N7ZfqjO7Ca+vQEMXqlLM/RRRYZhKjpsehdNitTD9P
	 MWHtlbwAifZ01lKx9DpvoghRTpEfSFZimvccOuQYB86UGeOl7h4/+8SUXcSAmUMRTS
	 KbVzFY1kSuJW4FV+P33Jc5xttGPz0fqApOazmvvIudtG8cEuq9d555Ctz51q7sMiN7
	 4BtntSkbehq6MTDgEc59wYTnuTQK23rgmku56j5bO9purOoQsLMnk36iCFcNavsiY3
	 W2pnvx3KRCaHw==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e6f83f0bbso451646585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBye3gmcRY2Wh4Pecc+fZD2lfnjvur+qY/Q8N72fCte7R9R1t8nY4+9kYoB0AAkdh2jycbVdoOgIhiIkn5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9enJ8IWiILdP4BlQ+jajlpvWm07fmeAjuS2xVZhdWvLG/m4aB
	z8PT2/ueqPno589GivjtC/gBj29ZhDLn3szu7J+p5S2pKljkrMptSaRfCwEr/t/285gWI27L8Tv
	6Ylp9pVBg6Rm3PM7qTtrhF62W0cZMO8A=
X-Received: by 2002:a05:620a:261a:b0:93e:3824:4123 with SMTP id
 af79cd13be357-93ebd279c8dmr2991150685a.65.1792046739772; Wed, 14 Oct 2026
 23:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791968227.git.zhuhui@kylinos.cn> <20261014160910.eeaa24697b614d1b94806d0d@linux-foundation.org>
In-Reply-To: <20261014160910.eeaa24697b614d1b94806d0d@linux-foundation.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 15 Oct 2026 14:45:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zHz+o1MOvPjGsRJ2FnunJVRZb0=-p7Wr6Ow7Zrob5tyA@mail.gmail.com>
X-Gm-Features: AclHuK-Fc_kAdjk8wA-fg2GpyoQ84w7GpgMGZ8lA6hoeDLQdLpN79cquhXGAthE
Message-ID: <CAGsJ_4zHz+o1MOvPjGsRJ2FnunJVRZb0=-p7Wr6Ow7Zrob5tyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] mm/vmscan: fix NR_ISOLATED accounting and throttle
 MGLRU eviction
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:09=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 14 Oct 2026 17:00:22 +0800 Hui Zhu <hui.zhu@linux.dev> wrote:
>
> > The legacy reclaim path has two mechanisms around isolated folios that
> > MGLRU lacks:
> >
> > 1. NR_ISOLATED_ANON/FILE counters are updated when folios are isolated
> >    from the inactive lists. Compaction's too_many_isolated() relies on
> >    them to decide when to back off. The MGLRU reclaim path never
> >    updates them, so compaction cannot see MGLRU's in-flight isolation.
> >
> > 2. shrink_inactive_list() throttles direct reclaim via
> >    too_many_isolated() when isolated folios pile up. MGLRU's
> >    evict_folios() isolates folios without any such check, so many
> >    concurrent reclaimers can over-isolate the same (oldest) generation,
> >    leading to unnecessary swapping, thrashing and premature memcg OOM.
> >
> > Patch 1 fixes the counter accounting in the MGLRU isolation path.
> > Patch 2 adds a per-lruvec throttle, mirroring the legacy behavior but
> > adapted to MGLRU's per-lruvec contention and its dynamic type
> > selection/fallback.
>
> Thanks.  Questions for yourself and maintainers:
>
> [1/2] is nice and simple and reviewed.  How about I queue this for
> second week of the upcoming merge window?
>

+1 for this.

> [2/2] is much more code, isn't reviewed and has a Sashiko whine[*].  So
> I'm thinking this is 7.4-rcX material.
>
>
> [*] https://sashiko.dev/#/patchset/cover.1791968227.git.zhuhui@kylinos.cn

Best Regards
Barry
