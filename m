Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788917;
	b=jd5vjKIRq+5cVeflyUS3cqnD9C9SWFnf38ogfxs/wTOTn+wZZessFxU/jivDWvqoju6V
	 Nh5BbrfV/TSzXJzSwOAsdUdOHWWYEchBOI8FONv0CU13OmwmEmBY2wj8AWvRdl0S0aw8O
	 0sJKi5UhLQnCiZQT+s6C/IiPmwnPeeyL8i1a/QwKtAapacHpBI8V8fINKxYpXQyDq/Og7
	 Bis4bAnIS/rUt06naoFTOj5f/8mdscm0QMdVxMpLsktg6WK1oD7ekh92ook/6yljPBl8x
	 lIRzUf1DMePAnotn+bYzxHvJ023jIElJvB1nGKmk9D7xdl34ylIq0yewB8aHA+iy51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788917;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vlb7g6V4pWyOd0zO2EPUK2XD3xyvl8j1Qdxp54r/T3c=;
	b=NzvQrqKSK/gtmobTURDjty0ePPJTCM0pZrdNQsYW7MrnkDNSY3CV1m0IhKYQ+b0N27Zp
	 y0ckj6nGe5Ti1yPdnXpNgtXfsix7BTYcHyxbHAWC+ginoAjgGpuZyiu9RCkvjXtRzaQC9
	 2cNfldPFfLNrlP1cUImEQDVNjdWZuQyYkoF9aJX8kZoFTpwlUKxJe3szXP0uiqnOU4uO/
	 8p/SzAJslt4dBITjH0KYAj4SQGK/GFWpsEvKG0D7R5m88B9zqwymCgxwjLiWy2kaIipMP
	 4eLhlhPTGaCFuyhv8SdxVZwR16u2GT1oXIeBCtpkeksxNvVlVQ32OukZckOXmtpUU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AndzEtOi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DEF606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AndzEtOi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762AE1F000C4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788917;
	bh=vlb7g6V4pWyOd0zO2EPUK2XD3xyvl8j1Qdxp54r/T3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AndzEtOi7z7cZzg5NoaCCSeGXc7Aw6CARxM/9viahN7u1YCx75EsQ3oFhYCKViWaB
	 OVJ6lNQ8aE4CjAEwCl5fDsfViW9vqmSEJLR+u4yUP3X8NGxoYLvtkpQor/qmAq6Eu0
	 +p+st04SJbSnd3WEFAfw8wqbsFjUamBY+3XmM4ah9oXxT1cgCa456jvis8zml7ilJN
	 n/35Bi5/HwAwA4d0eLrIGQTcGo+B3mXFajaELi9SimK4izmoeCuYSu4YQP1IRgwe4G
	 EddrmH/ROtNglWsLLxtWMX0gWhba17bA9rb0r+h5fvSrKsfZ7u8uRpRRSp4fCalp6a
	 lVSpQG4DUku4w==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-945e6d9ceeaso319939485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:28:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFp1AQHP3Kio8oLu33Hf6lCSAePFGuGGfbMKOax0a/PGFEWUC7gyNCEouv4vzr5dOJiP/KNhb1X+6SmT0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z925Hgw/wZYzzw60xwx9SPCl02KS6BEe9H+cVwE8ZD8lJSKi42H
	EQYxq6xYX91KxzLIM5Ya2hRdTLwwESxz/BnWJ9DjY5B2EaKS+Tyyjqsu8crMZ5Ldj7MG3n0N0qN
	HPM1EqiR+B5WfOxqvDjfWYT9RyimhfGE=
X-Received: by 2002:a05:620a:6cc5:b0:93e:94f2:ada5 with SMTP id
 af79cd13be357-9494bb96c07mr1603501985a.25.1794788916691; Sun, 15 Nov 2026
 16:28:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
 <avV52J2rD19cjM2J@KASONG-MC4> <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
 <c01ec177-da44-49bc-a542-35b64554526f@linux.dev>
In-Reply-To: <c01ec177-da44-49bc-a542-35b64554526f@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 16 Nov 2026 08:28:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xx8ivDeh1d5pvJOEgndRL8rf=CO2==T480pAm=j2X0ZQ@mail.gmail.com>
X-Gm-Features: AclHuK-MUP8ZaH_AYwjIfA2I9NeM0NJE7zPqIV9E8LCJmYdS9SrrB7NPxzl6bIY
Message-ID: <CAGsJ_4xx8ivDeh1d5pvJOEgndRL8rf=CO2==T480pAm=j2X0ZQ@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:55=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
>
>
> On 11/12/2026 4:41 PM, Barry Song wrote:
> > On Thu, Nov 12, 2026 at 4:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > [...]
> >>>   mm/folio.c | 11 ++++++++++-
> >>>   1 file changed, 10 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/mm/folio.c b/mm/folio.c
> >>> index ea3adb6a89d7..c412d9b398e4 100644
> >>> --- a/mm/folio.c
> >>> +++ b/mm/folio.c
> >>> @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec=
, struct folio *folio)
> >>>        lruvec_del_folio(lruvec, folio);
> >>>        folio_clear_active(folio);
> >>>        folio_clear_referenced(folio);
> >>> -     lruvec_add_folio(lruvec, folio);
> >>> +     /*
> >>> +      * For MGLRU, lruvec_add_folio() places anon folios that are no=
t in
> >>> +      * the swap cache into the second youngest generation, which is=
 an
> >>> +      * active one. Add the folio to the oldest generation instead, =
like
> >>> +      * lru_deactivate_file() does for clean folios.
> >>> +      */
> >>> +     if (lru_gen_enabled())
> >>> +             lruvec_add_folio_tail(lruvec, folio);
> >>> +     else
> >>> +             lruvec_add_folio(lruvec, folio);
> >>
> >> Hi Ridong,
> >>
> >> One question here, why MGLRU/CLRU have to use two different ways to
> >> add the folio back?  Will this cause over aggressive reclaim of the
> >> folio?
> >
> > I guess that is because on mglru, that is lacing a way to add the folio=
 to
> > the head of the oldest generation for anon folios while CLRU can do
> > that :-)
>
> Hi Kairui, Barry,
>
> Thanks for taking a look.
>
> Barry is right about the reason. With the classic LRU,
> lruvec_add_folio() adds the deactivated folio to the head of the
> inactive list. With MGLRU, lruvec_add_folio() can't put an anon folio
> into the oldest generation at all: lru_gen_folio_seq() places a
> swap-backed folio that is not in the swap cache into max_seq - 1,
> regardless of its refs. The only way to reach the oldest generation is
> the reclaiming path of lruvec_add_folio_tail(), and that path adds the
> folio to the tail.
>
> And you are right that this makes it more aggressive than the classic
> LRU. With this patch, a deactivated folio is evicted before the folios
> already in the oldest generation, while the classic LRU puts it behind
> the folios already on the inactive list. It also changes file folios:
> before this patch they are added to the head of the oldest generation,
> the same as the classic LRU, and now they go to the tail.
>
> So the problem in the current code is that a deactivated anon folio is
> promoted into an active generation, and with this patch it goes one
> step further than the classic LRU in the other direction.

I think MADV_COLD is fundamentally broken for anonymous folios
under MGLRU!

An anonymous folio may already be in an older generation, but
lru_deactivate() can actually promote it to the second-youngest
generation, effectively making it hotter instead of colder!

Right. For anonymous folios, we have no way to insert them at the
head of the oldest generation without introducing a new flag like
PG_cold, which is unlikely to be accepted.

If we instead insert them at the tail of the oldest generation,
I'm not sure whether that would be consistent with the historical
semantics of MADV_COLD.

But I've been thinking about how to insert a folio at the head
of the oldest generation. Why can't we simply move the folio
directly from its current generation to the head of the oldest
generation in lru_gen_deactivate_folio()?

For example, something along these lines:

lru_gen_deactivate_folio()
{
        int type =3D folio_is_file_lru(folio);
        int zone =3D folio_zonenum(folio);
        int gen =3D lru_gen_from_seq(lrugen->min_seq[type]);

        if (folio_lru_gen(folio) < 0)
                return false;

        folio_clear_active(folio);
        folio_clear_referenced(folio);

        list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
}

Right now, lru_deactivate() seems unnecessarily complicated,
incurring additional CPU overhead and LRU lock contention:

1. Remove the folio from the LRU list.
2. Add the folio to the LRU cache.
3. Drain the LRU cache.
4. Add the folio back to the LRU list.

Why do we need all these intermediate steps instead of moving
the folio directly in a single operation, given that we're
already manipulating the LRU list?

Am I missing something?

Thanks,
Barry
