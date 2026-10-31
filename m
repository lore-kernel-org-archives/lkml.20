Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793414576;
	b=JGfxB9zFqlLaHo3uKGvlCewzbnfu5VjuxlsRC8/7hz1BDM7OkvqchE67xkz5SmHyqAHs
	 UIXFQ3hjAhBEJ3XYLSC+mZWj0q0OUN/XLDCZ1E0Q+NL9fP06wDUv7BTMjKgldSlDqcXw2
	 QQHlazll9ArAlDAablxedkjSkLdmhm6ZOD6F1wWXevlJoihFIxFxiTIpExqVRDVIY4F0+
	 5FcVvASNULvXNdMW54MmBVIK/M3c4kdIpLV2VE8Ta7i2z5PW6baPN5/d0nnSganIceRQ3
	 MaOuig6O3sTI3SLLfY2pSdFsLQT67iYYRa69RilVcht5fOSLQluZoV/e+JobF/zwxMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793414576;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XbvjHIncb8G+BYsmpLe0PUSaotGhY48mcOIF6+E1fiA=;
	b=j+Nb7Xw/CkjX1lhlfL8nIwHemGZhYf8k19rHFBuiaKog0XJbqFnYj+hz4dpk03cjl/Jr
	 sajsREPuYbbuDY6NncYQIswVsKF4mCzUk+U2G0iGfhSzZj5+UbA0lsL9OhQLg+T2HT993
	 4HwOSp5Za5OARkd9F+hKlPlMoLyI9UwELV/zdPKftX18bnUd+D2owNUZpIGZ0tqopxWuZ
	 D2BNwgkaqx/+whmDfl/TuU4/7SNqRE6ZuiVl8LCqeZ0vHNuaeeLdSIr9yX16jBjZDjL0T
	 G84k4FnwrMqvMrFFTEc3opPUDXkRKq9UPBze8mwR5KXi5Z/RRKV+dFe+RQFf1/rryag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQUtdKcr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B971606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQUtdKcr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAE21F00A15
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793414575;
	bh=XbvjHIncb8G+BYsmpLe0PUSaotGhY48mcOIF6+E1fiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZQUtdKcrS6RDP3uE5pAO0mfK3gPkgf3kTf1CXS5kTnnOqP0hRgEdNUeC7QYUH5O+T
	 jY6284N1dSZONlv9RR5zpkHT5XhWxgnla/CPrxYLDjL3UGvQAVPK6JVcH2FMQY55Js
	 UpFO8bsCGzez+m7ir0msUKVwZ2pKhjKE3yvzR3RoWneih1OgDKUw3qPKYVgh+7eXlG
	 2ZZdpRRCXwNPHr7tVdC3HoNZ3n0t8CbGrFPKmf5edGLXI7q/7X6yrZPpQstbM2FsVg
	 Vh+XT3MO9ifEFsm5iMU2+UIByb1ZH96aMlKdkhG8ARBg0nRGNB2E8z7eLjh0m00WsV
	 Z7BLZvp74Go1Q==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c7a706b1fso34485816d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwnPdzZ6a0IThP8awj46iD8AJVwkInvNDxjDgaYoFLg6AV6hyfl6B3lw6wX4JRgAE8x6+Kyh2SQsUJN5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeaIvLQIL4NnYy0TXsccR0p2vfHofhY32RUM+6Z82eSGC0c7v9
	xoY42rFQtly67hE6aeGtxPpsIyxq/8jecOebhl01XfjLPuTHDMSZEV1RNlbYz5zJJw6Vi5Re0S+
	6jaG7oKc7NhM1C4x6AycBxi8H2EI531g=
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id
 af79cd13be357-944133ab8aemr1157540585a.26.1793414575057; Fri, 30 Oct 2026
 19:42:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026084035.535989-1-hui.zhu@linux.dev> <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
In-Reply-To: <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 31 Oct 2026 10:42:44 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
X-Gm-Features: AclHuK8OP7DyMs9ASLJHmA1rKTTTWsz_2q-gGMGDEWgbxTqGh_WEH7YWpp83KIg
Message-ID: <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Kairui Song <ryncsn@gmail.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:40=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Mon, Oct 26, 2026 at 4:41=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote=
:
> >
> > From: Hui Zhu <zhuhui@kylinos.cn>
> >
> > lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
> > lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen(=
)
> > returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check withou=
t
> > clearing the refs or PG_workingset.
> >
> > A MADV_FREE folio therefore keeps the state it had before madvise(2),
> > even though madvise_free_pte_range() has already cleared the accessed a=
nd
> > dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
> > younger, and PG_workingset puts it in the last tier, so sort_folio()
> > promotes and protects it instead of evicting it and charges it to
> > lrugen->protected[], which read_ctrl_pos() uses to balance anon against
> > file reclaim.  __folio_inc_gen() clears the refs but not PG_workingset,
> > so this repeats every time the folio reaches the oldest generation.  If
> > the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
> > lru_gen_eviction() packs the stale state into the shadow entry, so a
> > later refault is promoted to the youngest generation.
> >
> > Call lru_gen_clear_refs() while the folio is still on the generation
> > list, as deactivate_file_folio() and folio_deactivate() already do.  It=
s
> > return value only says whether the folio is in the oldest generation,
> > which lru_lazyfree() does not need because it re-adds the folio below.
> > Keep folio_clear_referenced() unconditional: the classic LRU needs it,
> > and it also covers the folios that lru_gen_clear_refs() skips.
> >
> > Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > ---
> > Changelog:
> > v2:
> > Call lru_gen_clear_refs() before lruvec_del_folio() instead of
> > open-coding the flag clears; drop the lru_gen_enabled() branch and
> > the comment (Barry Song).
> >
> >  mm/folio.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/folio.c b/mm/folio.c
> > index 35e242b48870..ea3adb6a89d7 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, s=
truct folio *folio)
> >             folio_test_swapcache(folio) || folio_test_unevictable(folio=
))
> >                 return;
> >
> > +       lru_gen_clear_refs(folio);
> >         lruvec_del_folio(lruvec, folio);
> >         folio_clear_active(folio);
> > -       if (lru_gen_enabled())
> > -               lru_gen_clear_refs(folio);
> > -       else
> > -               folio_clear_referenced(folio);
> > +       folio_clear_referenced(folio);
>
> Why can't we just call folio_set_lru_refs(.., 0), and should we clear
> PG_workingset? Keeping it helps PSI on refualt / redirty tracking (not
> sure if meaningful but CLRU does this), clearing it makes eviction
> better, but the eviction issue is MGLRU-only, CLRU keeps it.

I recall that in v1 [1], Hui mentioned:

"Use folio_clear_referenced() rather than
folio_set_lru_refs(), which is not defined without
CONFIG_LRU_GEN."

I assume we can support this, but doesn't the code below
also look a bit weird?


diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 829977d399e6..66ed805a48f5 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -431,6 +431,15 @@ static inline void folio_migrate_lru_refs(struct
folio *new, const struct folio
        if (folio_test_referenced(old))
                folio_set_referenced(new);
 }
+
+static inline void folio_set_lru_refs(struct folio *folio, unsigned int re=
fs)
+{
+       if (!refs)
+               folio_clear_referenced(folio);
+       else if (refs =3D=3D 1)
+               folio_set_referenced(folio);
+}
+
 #endif /* CONFIG_LRU_GEN */

[1] https://lore.kernel.org/linux-mm/20261023080430.465305-1-hui.zhu@linux.=
dev/

Best,
Barry
