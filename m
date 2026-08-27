Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE405416859
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852198; cv=pass; b=qyOvLyEr2/V9BbJrhcJh4Ayi+tUskN9vXIUjS5fjQJsGr2/s9JcTpUEsjQjszlptm8WNIsELViptXhTzZQ60k0UMiMOSRMUpa7qxS8bqMsn7FkiA754vSVCxgnQWhcx6JQ8jWHZy8mH8tr8CoAURyIRp/lJiPXVLp1ZyRiGR7CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852198; c=relaxed/simple;
	bh=kARueGusiE6vikFVSBgIU3Ldw5P4wXSUUt0Bb3uZ85Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1sUc3C3iBD0ywN9ijcsUGjthu1xZkEf/hiBkZM4odkqB8hR3mVYQIJREufWOLbvAlPpOqR9sBu8pEuSwENsDL5uMiB703zdRpgefZxpXC3CqBerFQ626w4b37k51amLZXKUl3hQ+IcTVpBoa9UdhHwltrxn8BRhOgQZFLRnC5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqJvykjT; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqJvykjT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c26d7e951so22923566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852195; cv=none;
        d=google.com; s=arc-20260327;
        b=kM8sCAU9tRBEc+f83GrEwQ9Zj8+LCYShRKCBkYwRb0VKr7wVMx3QJPlPUtMeXgi0sW
         JY5qQCea4qMEhmdxSOJEi2JBbmfmMCrdGkBHy9V1+ir93GpkdW6DbEo1PPct6GmFkD1R
         PfEd6Kb9f/rDPdd4RH8Y41/d/T7DM1clWTQEUK1dVCbcKlUfO3nKY0AUWGKTwiWvR543
         JLHiUXD/RQwtfzxKc4jObu9eXCMGxxrTh2A1wVDWOX2Y5VL6z//RNb2xgPqXU3Sc2pjr
         ZGiQ6Nvmj58OoZqSJPRh5xhSrdZQ30Z97MRiVgIK2q+uOm+qPOAuJzWOT9juh7/UWbdl
         62wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lkMm8lvYUjv5dpOxr25jt/qefHlkYagepcQl8vTMUc=;
        fh=Y4mrYa+wP6iW1VDptI1xtDrz+1q8FjB1hhbqOF3DEcQ=;
        b=ntUFJzQzitVjwvb60tJ3qYAvSJi6XiaEHePoLD3btk9xHc+BmM4H5GSVsLkZyHB4wc
         PhGpF9l7pfNEJq0bWvRU1BkmWy7F4oJEATPmg2+kdHD8lbrb3wwdgDl3Hj0m1TobeX3m
         Y5cfJIEMGGzWekSjv9ChXdseMEH8w2KrP7A3p0cww59YPMCtqBgVKQp1DN4FKWx6JvzX
         zL0XkPhPbtHbjq7Q1ecaTltd2S4VimrySCNu3TY8vbWUjrd5fX6ns7Be8eESxapT4Kg1
         3lBoHdB99EiW7I9KlqiRjJvW3qxUSxVTfeRRe1J0UP+NkM1WqohCVLIICFUy07zGL+3A
         RuTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852195; x=1788456995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lkMm8lvYUjv5dpOxr25jt/qefHlkYagepcQl8vTMUc=;
        b=RqJvykjTBic7gidQDRzyBLU0aDCop2HIWuAwmMAqT/kReV/mq5HElRvdLMs4ZWmatK
         cpKIat7REWv3VyE7ZzltxxglLBdYl6Y3e/y4ec+hQj7ciyE0LffyniYD5/Qrs5yWEyoP
         byqjGAx0J9W7FrH+Z8VtRK3HWhGGlAheWf/qskWWwNgKyTEU1oReWPQCHFIJDsJSr11P
         AxlVz96OiSY5wz6seF7p6YULAb4qYDJl3MllYxkpKf+Mji3aYNXAR/U16tUDQlnLP3eQ
         qUb6jNooqZTapX7KfP06MphwO236vyQ4wCDoELX4BPCW5icCGUu3aL7hulJ0omqfZ0Bd
         5vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852195; x=1788456995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lkMm8lvYUjv5dpOxr25jt/qefHlkYagepcQl8vTMUc=;
        b=e/imzD8hnq6rw5vIqoB9awLrB+RqLTRgms92jNd4aIAiI+f/RFkBs6cWXumCv1vzla
         XXboMknWF7sZNQr7/Ede3kuVtTAnQaXD+GiI++9668dQHv956YRCs2NzyFHG6bAmJ7a1
         ZeOckfO3LILhwfe02f/e6sCdDm2M9de6M1qW+t3LB5jkLGkqLp5fp4x7zqsDGBHAG0Ts
         w+55XWYOMOX1R2PXAUZff2yqeb7kqks+g3+/xf5Dkd9Kq7xNN9tfEQPmgX1ZyqlL0KXf
         +fWJGDuGMf86wDaKl5yPCqRJR6+DUHcRWbTKjzP2r9GrjESy/kcptjvGRF0JTVPAb9wh
         39TA==
X-Forwarded-Encrypted: i=1; AHgh+RpbtVCunwgIdaNqHacMvAIHZByMU8o2ZkFregCxlSxYRBwA6aYkMoJQSaionx2b9LKbOFaqDsJffHAPgbU=@vger.kernel.org
X-Gm-Message-State: AFuF++nV7sp42Yh7lb2h+YkL7B+wDkitkOjo1jpHaz8bh9xlPPndW24i
	PVA7+X3dLmUBlZiO3Z//g9HY8rglB+XoGxp6AYN0sC6ROdQ/rQxMysLvsyxdqT1VtamMdduKKSq
	AWFrql1KOqdflE6MCz0iUW+YDzS24RaU=
X-Gm-Gg: AR+sD12VGTC+gG6bLYbc+Ty3iXNdmHNmTsmuY4NYvsdeR19IYfS1/nPzkjmBZMkG3jZ
	sU2VoblCY+bKVoWE52jhFFmXjREbzoBJSTayjxxdYU2HRBLCrzHxQWMGY35aic7Foa9oFkSNrSU
	5uRD4kyr1GT3QTbdTzj+mzEX5yRNIhLy8Pvdt8aFc8YE+DcGozNGsANnbPvWf0cuHzzLUkNlQbg
	G+JEUgk3zD6Ho/PlTTOxeqWMQw0e74qpeUaWg1Yez+46LwYczZ/s2Kyvv+WZDwE7FogVqQduo8B
	F4UakefqBnjexnRYax/LtsJUdRoK8imYmxbrmHYtgesUop/coiw26Xi73YSwSlg/4kxKNQZLwmZ
	HUYWOhO1P09M=
X-Received: by 2002:a17:906:9fc7:b0:c20:ff26:336e with SMTP id
 a640c23a62f3a-c25570191c9mr22400166b.14.1787852195125; Thu, 27 Aug 2026
 10:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-8-9b43f5163238@tencent.com> <a7f16d6b-217e-400e-812a-528493d45134@kernel.org>
In-Reply-To: <a7f16d6b-217e-400e-812a-528493d45134@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:35:58 +0800
X-Gm-Features: AcwNN1VEQiDmkFeAKmco0RotUE5B_rZNwsXG2Mgge4ASxKJzjjIY7BucqenQtDk
Message-ID: <CAMgjq7Ay3T6BRJ2E1kGD7BNq=4bMMOpw_EKOskM-9im_fjq-MQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] mm/huge_memory: move unmap and remap into the
 split helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:32=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > To prepare for further cleanup, move the unmap/remap handling from
> > __folio_split() into the split helpers.  Only anon folios need to
> > be remapped, so remap_page() is now only called for anon splits and
> > the anon check in remap_page() is redundant and can be removed.
>
> I can understand why we would want to move the remap_page().
>
> But why the unmap_folio()?
>
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 58 ++++++++++++++++++++++++++++++------------------=
--------
> >  1 file changed, 31 insertions(+), 27 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 01c8cf428595..af9c2edd1fba 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3589,9 +3589,6 @@ static void remap_page(struct folio *folio, unsig=
ned long nr, int flags)
> >  {
> >       int i =3D 0;
> >
> > -     /* If unmap_folio() uses try_to_migrate() on file, remove this ch=
eck */
> > -     if (!folio_test_anon(folio))
> > -             return;
> >       for (;;) {
> >               remove_migration_ptes(folio, folio, TTU_RMAP_LOCKED | fla=
gs);
> >               i +=3D folio_nr_pages(folio);
>
> I think we should rename that function now to unmap_folio, but likely bet=
ter
> unmap_anon_folio().
>
> > @@ -3933,19 +3930,23 @@ static unsigned int folio_cache_ref_count(const=
 struct folio *folio)
> >       return folio_nr_pages(folio);
> >  }
> >
> > -static int __folio_freeze_split_unmapped_anon(struct folio *folio, uns=
igned int new_order,
> > -                                           struct page *split_at, bool=
 do_lru,
> > -                                           struct list_head *list, enu=
m split_type split_type)
> > +static int __folio_split_unmap_and_freeze_anon(struct folio *folio, un=
signed int new_order,
> > +                                            struct page *split_at, boo=
l do_lru, bool unmap,
> > +                                            struct list_head *list, en=
um split_type split_type)
> >  {
> >       struct folio *end_folio =3D folio_next(folio);
> >       struct swap_cluster_info *ci =3D NULL;
> >       struct folio *new_folio, *next;
> >       int old_order =3D folio_order(folio);
> > +     enum ttu_flags ttu_flags =3D 0;
> >       struct list_lru_one *lru;
> >       struct lruvec *lruvec;
> >       bool dequeue_deferred;
> >       int ret =3D 0;
> >
> > +     if (unmap)
> > +             unmap_folio(folio);
>
> I really hate that "bool unmap" parameter.
>
> folio_split_unmapped() has this VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio)=
, folio);
>
> So you can really just do
>
> if (folio_mapped())
>         unmap_folio(folio);
>
> Or have an early exit and hide it in unmap_folio().

The only special case here is device private memory, from folio_split_unmap=
ped.

Maybe I can just keep the unmap_folfio where it is, but
__folio_split_unmap_and_freeze_anon need to know if the folio need to
be remapped.

Will a "bool remap" parameter look good?
