Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484963;
	b=YmSivu0llWOmo51DK74RwUDnmy272Ww4ObTHkS/yT/ajAdsMqaiK8RRKAfNHCfbQPt/p
	 u5aJbTmFV9/Mpqsg3SoCmW0XkBC8vw75dJWnipUhm3V/yxl92cmFF4IGvwmLEqXsMVxdo
	 XuptePu7iRmWqBN6Ff5GRApTh3M/eG3BAhik1afomHmC3ya0PmypWjWBLRUlVEfdL8o75
	 1wv3dSE+rQcIcz0NRgDGi41vaZgmWkHWEIicIiTLwW/Icq/Z9sk7S9tlFT+4a4EkriN1h
	 5f8kYmlDQLkZOt9naHsrIlC8jCzLSpgjwhGx1V/6THmaUVEfpTP1/im3r3uwkuZ4I+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484963;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nOSbJ7FVYKa0j5cQ1UDk8PN44WEuG/N56IbAtfMsa/Q=;
	b=x/3eBb9BQF5jUEL3f1lC15XE5yCGF+HNyeos992pergoO97mof6IrdGCotY0DBD4BF47
	 J/VV6JqJlZT34+gCuIpIoBzGCcTC6F1HHNN959IwahiGb5Iyu6Ks0BDbaerb33WZyRS5P
	 P4qylZoY5ZdXshjNZAJxLBMRRo29sfpIuxr3LESTq/BSNGVRHfLWLEGRsZvtfHf7SLnDp
	 vI89gKOypZ2U3m/UjLOWMA2emmAzu9zFPulsmAgOWAUPsuK3Ps8otLMEWH+usWjwTJ1Hw
	 XVvM9Y6iaaPBHYB21fcgTYwHxpLSZnhX35djszsJGAjIoYjZ+hKdcu3/b0lYWmCJObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFMreN2H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B309606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFMreN2H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A4A1F000C4
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484963;
	bh=nOSbJ7FVYKa0j5cQ1UDk8PN44WEuG/N56IbAtfMsa/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QFMreN2HS1XOHuvF6A9j1l6aQmhcdkY/i4iAapBFw5Kw5nl2Hi6fMI3B+mjCL0BPE
	 L1s6fj3fUpJTp9VDHomqH95JYNNoqi20MgrmJgVOFHT/C4m87ADwHj5bJJ7+ij7uiO
	 50OP5l6pHaYpxtc+krvhVHn9P48ESVxUtDNc3Og9bGVc5ylVipelcuwwnr+4gScCuH
	 y1E4eho6xF176MCjb1p3RAzDp9gHxm7hmLiz1l9MTlg1PUqkHDNvYng3W/YzNJBkAh
	 5hSUpDMsjsuoN0eOr6l7IcPqQd80TN3MVKZzhw4tIIyrwopSHmys81jCV2v2tYYDnD
	 +IkDoxKrLGJmg==
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5366463571cso20408791cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwF4im1UF5g0pUbLu+6gnbrJr8v26zmqLjZ4Cnn5qmTjdza0XY7yDrmye+5Lsld+0GdCsvJ8NlVPGhrxik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeSU42SNKmhx6l224jXx6gbA6ueZzFACyIt+7lZ5KoJ2fkyXTo
	6SBAmC8ezlsNn4Vj6OOUSHQyKlThhFNHLvM/LqZGiUmNjdkNAIjcW2IhMR1spv5ZrePGXga9Lw0
	4oahBsPSw2eOaC8feP4+IzBNDeLuIU30=
X-Received: by 2002:a05:620a:4046:b0:93c:771e:b672 with SMTP id
 af79cd13be357-93f29d31ab6mr1654736785a.54.1792484962293; Tue, 20 Oct 2026
 01:29:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020023548.3242028-1-ridong.chen@linux.dev> <CAMgjq7BonFtsvHMRYXXToqWBHTzNa52EU9B4ZqD-k-DJ2inQDg@mail.gmail.com>
In-Reply-To: <CAMgjq7BonFtsvHMRYXXToqWBHTzNa52EU9B4ZqD-k-DJ2inQDg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 20 Oct 2026 16:29:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yAYMiRoJRLLt9B_+qdMhOFmizDy-PSbQ3jkMxV0zJqPA@mail.gmail.com>
X-Gm-Features: AclHuK915CznKXWfKwMDuCTMJaWaV8XDDBIH7x6_vFup2LGTi9Kuma6cm_MfalU
Message-ID: <CAGsJ_4yAYMiRoJRLLt9B_+qdMhOFmizDy-PSbQ3jkMxV0zJqPA@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
To: Kairui Song <ryncsn@gmail.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:20=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Oct 20, 2026 at 10:36=E2=80=AFAM Ridong Chen <ridong.chen@linux.d=
ev> wrote:
> >
> > From: Ridong Chen <chenridong@xiaomi.com>
> >
> > lru_gen_folio_seq() computes how many generations below max_seq a
> > folio should be added to, but stores it in a variable named "gen".
> > Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> > seq % MAX_NR_GENS, so reusing the name for a relative offset is
> > confusing.
> >
> > The comment table above the code also no longer matches it. It only
> > covers the PG_active and the final branch, leaving out the reclaiming
> > and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> > although lru_gen_folio_seq() never looks at it.
> >
> > Rename the local variable to "age", redraw the table so that each
> > branch maps to the age and seq it produces, and note that the result
> > is clamped to min_seq[type].
> >
> > No functional change.
> >
> > Assisted-by: LLM
> > Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> > ---
> >  include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index ab69b9930893..a933d8c14558 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(con=
st struct lruvec *lruvec,
> >                                               const struct folio *folio=
,
> >                                               bool reclaiming)
> >  {
> > -       int gen;
> > +       int age;
> >         int type =3D folio_is_file_lru(folio);
> >         const struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> >
> >         /*
> > -        * +-----------------------------------+-----------------------=
------------+
> > -        * | Accessed through page tables and  | Accessed through file =
descriptors |
> > -        * | promoted by folio_update_gen()    | and protected by folio=
_inc_gen()  |
> > -        * +-----------------------------------+-----------------------=
------------+
> > -        * | PG_active (set while isolated)    |                       =
            |
> > -        * +-----------------+-----------------+-----------------+-----=
------------+
> > -        * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU=
_REFS_FLAGS |
> > -        * +-----------------------------------+-----------------------=
------------+
> > -        * |<---------- MIN_NR_GENS ---------->|                       =
            |
> > -        * |<---------------------------- MAX_NR_GENS -----------------=
----------->|
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * age        |        1        |        2        |        3   =
     |        4        |
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * seq        |     max_seq     |    max_seq-1    |    max_seq-=
2    |    max_seq-3    |
>
> I think this comment update is not beneficial, we might have more than
> 4 gens in the furture, so hardcoding a number is not a good idea.
>
> > +        *            +-----------------------------------+------------=
-----------------------+
> > +        *            |<---------- MIN_NR_GENS ---------->|            =
                       |
> > +        *            |<---------------------------- MAX_NR_GENS ------=
---------------------->|
> > +        *            +-----------------------------------+------------=
-----------------------+
> > +        *            | Accessed through page tables and  | Accessed th=
rough file descriptors |
> > +        *            | promoted by folio_update_gen()    | and protect=
ed by folio_inc_gen()  |
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * PG_active  |  PG_workingset  | !PG_workingset  |            =
     |                 |
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * reclaiming |                 |                 |            =
     |     always      |
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * can't      |                 |  anon && not in |            =
     |                 |
> > +        * evict yet  |                 |  swapcache, or  |            =
     |                 |
> > +        *            |                 |  PG_reclaim &&  |            =
     |                 |
> > +        *            |                 | dirty/writeback |            =
     |                 |
>
> I think it's better not to describe too many details in the comment as
> it actually easier to just look at the code.
>
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        * else       |                 |                 |  PG_working=
set  | !PG_workingset  |
> > +        *            |                 |                 |       or   =
     |       &&        |
> > +        *            |                 |                 |  PG_referen=
ced  | !PG_referenced  |
> > +        *            +-----------------+-----------------+------------=
-----+-----------------+
> > +        *
> > +        * The resulting seq is clamped to min_seq[type].
> >          */
> >         if (folio_test_active(folio))
> > -               gen =3D MIN_NR_GENS - folio_test_workingset(folio);
> > +               age =3D MIN_NR_GENS - folio_test_workingset(folio);
>
> That's a very nice rename, the `gen` variable is so confusing to me
> for a long time, I thought about renaming it to `gap`, `age` looks
> much better. Thanks!

Agreed with the rename part. Maybe this doesn't conflict much
with MGLRU-FG either. It could be cherry-picked before
MGLRU-FG or included as part of the MGLRU-FG series.
I'd vote for the latter.
