Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B21376466
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788240075; cv=pass; b=H0DubXbgzDc53MQH3l7mBKbL0CzvMoM10nIwJsinuca/SKEtF4ItEoWP5IDf/mLa5VW3oSnTkekjByMHrwkdUUYzsqr9I1MeObNUzpbXk5xWldBj/tmDoXPJygntA6sA5V0yIpm2McXH2dp001VVS2rEU6CO6GxDZcfHwk55y0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788240075; c=relaxed/simple;
	bh=9z10EeSNeIlyZFnhXWLzQdFpOPihH3ow6K97VqCgdXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YudZyx5TMJq9k4MLerpwf1x7O7ypUFn5UO2nhiJCwo+mhaH7/pBXU0fLl9EBhQoXX4/t3Shi7z6iCAk+dyZZRcKyYp7Y4rzLkPbMujBgnh2UBttU4qq8bI6gCQxvNSoyDlBiJPmWaMl6B8DWYzaFxU+xnUMdK1BPKkg4/sXXFP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSRZ0cX2; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSRZ0cX2"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1600d040e4so119132466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788240071; cv=none;
        d=google.com; s=arc-20260327;
        b=W4k3IN6CydPUwpT7X8OYfOpJjcmGvT03xREHbd8XNzG0/NrV9MLCmWJZmNme7riyGa
         KEC1a6F0psKkKy2sasT9LXh3XXs9FvyNr9y9WZs7QzF8+bc3s7tZq345FfafV49eYrLk
         54XfPFznI3wmsAostjnE8D1JCiVfTjSHZ45GokurddZV5NanFnJkwRo2R9EegeShuZhp
         Xbr9OwIHOXyXWwHB7IGssbsZjmmSAGZnf7R6emHrGZdNCJCbIiRVLOVyl9ivW7KwATTk
         Tm9Mvi49FjqD54EGkL1kRVX441hiQq9TZNdhjGGppLcTRDXTinuDAnf8nRVHbuTSptXV
         /OMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9z10EeSNeIlyZFnhXWLzQdFpOPihH3ow6K97VqCgdXo=;
        fh=DVvbZM7AMcXDCt08UdEcV61HGC7OyUV8XrEpCf8Akq4=;
        b=IBShU9OJ7FJ+OkrvoZ8daAYQ7HZd9rABpguRsr+HBlWFaIo9Mn2F7SMjVBIrdhqKpm
         OVbY3Ob5uQnuFuLLW0TX2NaQCFrSGlAPOs4wuyEPmz907VvoWCdagzUJMaqvm2VjIwbT
         6GNPrKZ/ty93Lz3SZ9h7wgeJNyA0rQIQafsnLwr2wLPLwU/O+Ph1/XKs+untkVmQveeY
         48fkMbcbvgA3PWGRmLjfxYgoPUt5kQJth5nL9liA8zPRr+tFlqg9kadvHF/6uq9W8bMK
         G3lwl3pr7GivW/GXt2MPyPzgXwu8T8cQ6roI3whMGou5hSKgOjpVvfA8wYjlRU+sx8G4
         sLpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788240071; x=1788844871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9z10EeSNeIlyZFnhXWLzQdFpOPihH3ow6K97VqCgdXo=;
        b=hSRZ0cX2n2XYuA8QMqvBY52tMuKiGcFMAoM3o//btJbG5Svbmt+4O5ZX4lMcSCXslr
         js45OzI8PadyU1zGB4tCOCegu6pWIJGBvCYgbUDYpUvVSSj+Z+86gZ+Bj+sVyfokG5pl
         XLCcxH2mgRUfNPov0WPGpRnWHj10sl7e4mOipvzzDBdzKY/FW+X4LyZMoHY5x9/zfi14
         Lp43D8vS0KILtzFIAB6Qwa6s2fiStyKaRM7xQHelj1FipJjZWYtYGoXOnAbe8E7VNYxM
         c+em3XbhFgR0Zx9s0C5OBtB2Ean1ElQd96ZhxiHVUzGSUhFjJk/NVCQyTLD/j+AVKN3D
         4rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788240071; x=1788844871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9z10EeSNeIlyZFnhXWLzQdFpOPihH3ow6K97VqCgdXo=;
        b=Rr7JFIql/Dje0MuZGnoLlCub1lTPVRL+UYTQiUBD0jgWL7Jt6HnoBbvBKS141dIuJN
         gCEmiFl9uxWI9tdq5TxrnwVK466MMilWG445DacgV8gc3zITvgheQq4ANF0laV+K6ppL
         V4RzOhKfpxCRcNSIlYIwK8f+3TseOavLt4AwqDd6vxeRAMv6p02qHgSYeMUPHxt0iwWH
         dM9PPfhpD6WqJn31ynw6amooBYW7Y0hv2omWMwQaI89UXFv8R6wP0wEjciVf3SxK27qB
         Ir2jPWbo5JpX5w8qmmXUi6oDVllvjHkBcgnehqYMUhZvUK4Jrs3ov8oPHFY7z1tRc4DI
         V7UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqERkRn72gTag2VYQI3y/oBeHzrK7Gpar/1NbiAg6vUNpLItmyj6q1wDj3ZbkwcNiR/tYXNvkfY8UK8C+I=@vger.kernel.org
X-Gm-Message-State: AFuF++mO6CaXUV7rG5sZ4++v4+KJaiHbYRoIP0ZKS8FeSeXGFMvlaLOA
	ZHAfYXMLELVGxcXnOPIVE5dKzKOAPYAYTIfRP7J6M29Wu1s2M598TkG77FQIt5V9s96HhxEe6uz
	1dzhjlnr2jfw6eWxeq6eZMDhzGIgPyfY=
X-Gm-Gg: AR+sD13ZcUQS+Y7mRMCzIXRXxkJCrgd4mvp0Bu/ozL/8pwuh9NssvzXZULgZdkNKQq1
	O5+zXUAaW1M32UrW/tANNz3o+SU0NVH4zeMt4C+mJuR/4L/6Vb/v+zkQuVFoupCshqZERLBXY3y
	5OneUSbPdhBvdSSKSFmRR08AhyJYOJycMOs3YsqL3VliiK+LJWsyt9vpoMBx6opjik6D+Q4hnEx
	E2JzB1+z5xpRivTjw/7fxN9fUJ2B8NfSFMz233NVQNB1Rm/R1duXryRT8nu3RQYRlg2rA6tYyn7
	Z4zKmCHUJYhRjkCNw8sceqyBAglf1yO3QCtOZLOylQSD/i7b67w2oXFhh2ilOQEEIJLjv+T1ErZ
	r
X-Received: by 2002:a17:907:7253:b0:c25:8bf0:36e2 with SMTP id
 a640c23a62f3a-c25b91a2114mr161539966b.10.1788240071158; Mon, 31 Aug 2026
 22:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-mglru-flags-cleanup-v4-0-2d15dde0d7ee@tencent.com>
 <20260831-mglru-flags-cleanup-v4-1-2d15dde0d7ee@tencent.com> <apZVe8UHZ1CNo4r1@linux.dev>
In-Reply-To: <apZVe8UHZ1CNo4r1@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 1 Sep 2026 13:20:33 +0800
X-Gm-Features: AcwNN1XYYZEVuDsFVysPBXGQM2_96ZhDLvR26kiyIMr2QMBACwffo8RrchKnu5k
Message-ID: <CAMgjq7D6V4eTZJ1Q1Xf2J6yTCq=JjvzT-W-HHX6EnMfzm3BK1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] mm/memcontrol: make lru_zone_size atomic and
 simplify sanity check
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Ridong Chen <ridong.chen@linux.dev>, Lian Wang <lianux.mm@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:38=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Mon, Aug 31, 2026 at 02:43:31AM +0800, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > commit ca707239e8a7 ("mm: update_lru_size warn and reset bad lru_size")
> > introduced a sanity check to catch memcg counter underflow, which was
> > more of a workaround for another bug: lru_zone_size is unsigned, so
> > underflow wraps it around and returns an enormously large number, then
> > the memcg shrinker loops almost forever as the calculated number of
> > folios to shrink is huge. That commit also checked if a zero value
> > matches the empty LRU list, so we have to hold the LRU lock, and
> > handle the positive and negative deltas separately.
> >
> > But later commit b4536f0c829c ("mm, memcg: fix the active list aging
> > for lowmem requests when memcg is enabled") already removed the LRU
> > emptiness check, so handling the deltas separately is no longer
> > needed. And if we just turn it into an atomic long, underflow isn't a
> > big issue either,
>
> Why atomic long and not just long?

Long is fine too; I was just trying to be defensive. The original
check was a defensive design for leaks or races, and atomic long is
more immune to race conditions. See below for the other conditions.

> > So let's turn the counter into an atomic long and check at the reader
> > side instead, which has a smaller overhead. The underflow correction
> > is removed: a massive leak of the LRU size counter would indicate
> > that something else has gone very wrong, and one should fix that
> > leaking site instead. Besides, the updater-side sanity check is
> > unlikely to catch the leaking site anyway: if a folio was removed
> > without updating the counter while other folios remain on the LRU,
> > the WARN only triggers much later, from a likely innocent callsite.
>
> Do you have any data to support your claim that updater-side sanity check=
 is not
> that useful? Also can you explain the motivation to move the check from t=
he
> update side to reader side?

I think I described that in the commit message. Commit ca707239e8a7
introduced the original emptiness check. The goal was to fix an
over-busy reclaim scenario: upon underflow, an unsigned long returns
an extremely large value. The reclaimer calculates the page number to
scan based on that value, and thus enters a busy loop trying to
reclaim much more than the actual usage. It's really a defensive
design or workaround.

And later commit b4536f0c829c just removed that emptiness check,
leaving only the underflow check. So at this point we are just
defending against underflow. Currently, I don't believe there are any
known leaks or underflow issues in mainline, still purely a defensive
design.

Reading these counters (mem_cgroup_get_zone_lru_size()) is much rare
than updating them: the only readers are reclaimer - per loop, each
loop will scan a large chunk of folios. Or during reparenting - per
child.

Writers, however, operate on every LRU folio.

So checking it in the reader side is much lighter and cleaner code-wise.

Checking in the reader side also tolerates deferred accounting false
positives: if a folio is added to / removed from LRU but have the
accounting happens later, that's fine, but might cause a temporary
underflow (there shouldn't be such usage right now, but cleanly the
oldest commit I mentioned is trying to catch something). It should
just proceed without performing extra operations on the counter or
raising a warning on the updater side.

The underflow won't affect anything besides the two readers mentioned
above (reclaimer and reparenting).

Besides, I don't think warning on the writer side will help catch the
real leak either, it just adds overhead to a busy path. The folio
triggering the underflow is very unlikely to be the one leaking the
count. And if that leak is actually caused by a race, the atomic long
change should cure it.
