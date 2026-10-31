Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793431565;
	b=2ihGrO6MqjF31wHOnR9+sa9ogPLkRjNA3apnu4u7O4FnoOiaFqBS0zdWrcn2JTR340Jn
	 K1GCkjlYt41/KlXRTIqAKt8awUzIp7hi6034wWulyjdfSTrbQuIfo+rmxVmtH71fhGsKq
	 o8MYKtD80WRTVDOTOAzrmirSKEYAh7GnIv29md44wr4tZR4g3DhAn7cBYaVF9zo7EdwWv
	 0ghtZot+1TZMSy14Gj4cs8SZnwJYvcS3tNeL5uX0CrGk7uliIII4MQ3da8W3ykFM+wBX0
	 H5GU5eLv3mx3kzC4JqaUxcF60EK9P8dmrTMMca80Pq10FSxFMNvWVeMWyIVrKlP1+kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F6WXP+mEDBqfSXhYu5dg3hwHsbs6lkoxCd/pRdVMPPk=;
	b=a0nwbSRX4ZGbWn36wQmdFZ/Q7W4GEM1qODsP4mq/nI1W764ZyUHFF/rvuEys3+Rps3yf
	 LuBN8dP+5T1a5+fOrjwbwI2hwgkjN2ZlOMwpgazHCXty93mTXRqO4OkceWguvklu5wlHn
	 vcpozjH4oGH2NkzZu4ja91q4IRLBmhOGSLe9nLIuKbYxaHcebiCwHIvi8cg9dUa2w9Fng
	 jb/XDcf3Jb+3PSHN4RgzivkNFEyzcxqn0K9jsvD5z0NK01LgUNS8uIuwG/WAMRLWukMB2
	 oUWb/SdbuqBYllAzSzBZu2msoIYLI2nySywYEmEonTWbDW9HeXHyHFSkK0C3DmtI/RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFTZRgzn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159E606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9159E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFTZRgzn
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso177044366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793431563; cv=none;
        d=google.com; s=arc-20260327;
        b=HTexCwKEAUdp/bnvZbhMVGHWDf0oB+ri+tgQ4Ww07hfqqwpifntHG60J+4DPJRCGBs
         FSIk/4NXa24hdGNnghg474+L7YIEjT2lJB65SnDD1ITrPsFLJdReiUGLJkYiGs0aNz7Z
         H421YifTqC1QOe+Xj1xddSR8ajhgonH6BVJxa6D3ezc31ITdbfboup3aE3IBFjF7rzW5
         HaLLC3NIwP6fQXSqJeNQTW4GTSIgjlpBQzIiA4YljEqCjTpltu0y9wWm8ruQg9dJrq13
         lCr2RHnzUA4cbyJJy2udigaS4TZPHtKFFSXZJXDkiBFOy7CEInrXe840OUV/oKP4ST0u
         Sbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F6WXP+mEDBqfSXhYu5dg3hwHsbs6lkoxCd/pRdVMPPk=;
        fh=cn6hxZ9fk01VHw66pNvuy8BQvr6ARWPLhz7tAPeYoGs=;
        b=BCKwwEaw0+VInMUcmjXK0DQrRCeevAqYJpDmKE/MrQxLkfMAQIDZq9yqVShe34FXAl
         dHb5Q3adANflc2AIq04gSytf/c9R92H2VUApsOWNws5NatPjVkCC3+QJd6JkAD2fzxlr
         2lM0to8KsRz3OHUMGqCWDHuvLA5iHo1iG3tPISO2PAzYFeePM4HTF1qIae3qrpZyZAem
         hntUQF5Uwob8y6kYjA1D4sHu6hBg9ckuljwRs3973D0dEpgu0X4vM6YHVt73qQq3b4BM
         lHNTlnGYBTAyJnmTYEkabYNrVTj+trVnMtNk4XcyYJCrc8QobKokGsMqmFhB0joCOctl
         fDNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431563; x=1794036363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6WXP+mEDBqfSXhYu5dg3hwHsbs6lkoxCd/pRdVMPPk=;
        b=aFTZRgzn7tywTfqLj2Cpx5Canr7OKSOtv1sH98kSUtWjycbd9GHfaOF7h98enITtQ3
         6pnxZ4Cp2+JA/HTVSSan/8inGVEJ/3MdqUmixC5rMhAElq7zx3RaxwttY2xgSGzEKZTB
         uuQp1MpIDszExrL0RFtkzCuVFWGQm94YknzFMK1bl2HkdE1z7+t3BTOnyFnXMpBAawsf
         4v2IOeqU0++HR2TTzTKpl3u+JTnX36EGmZ7IKNB9HpnK8y2dVPmfs2MtQ7XxyMeEZ2pn
         JWL1l6T/sOa3jGrJXqCyimnn8Uof+CyCo3TtcgY5AR6qG6kjiNjWWxGj9B6IviueBOiA
         iVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431563; x=1794036363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6WXP+mEDBqfSXhYu5dg3hwHsbs6lkoxCd/pRdVMPPk=;
        b=dR3a6hitQQZcm/dCrd6OYkzJqh2q9vWJRlTPcBYTfi7a8U6WIuhqJRH/wBF+xI1RZE
         uByov4pW44r1FRMKnpgQ4WG1Lxy5R9sxV92NBJHv1VB8ApPqK8+I9dtWrlVLWKuEJI3s
         lSfquzhH5Hx+GyoOilQfm+EDI7/+X4W8eTdnyCtNvznWMWm6RtGYkfRP6ZX1VHferen2
         uPvDUJ7oCUBXTdbJKbCSPMcQ1YSkXer7W+oMPT+eqgfnLu9ojJb6uhjAVaFoJr6InFda
         pO5nOtRzCM9qAuArTuQZQyVZ+0efREZqBuGwKENGzc/65cx/DMztTl/FX1ZH/StDlbyZ
         lQFQ==
X-Forwarded-Encrypted: i=1; AKwUvByvXDQl608xxdW8Y+FLJgZ6e8f3ZA2MlvbjvmtjJeb351m6+4aU+okhO+rfLAsyEhXoUWBBqI0pCd4JFKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2CMsJMz8hGd394a4O1NZLUrh9tmlvSEEBmCpQwgzKEyt0GI/O
	Tkq6QknW+FUxhtwCMqmsZrdGR1y2fNVIePqgQIynjd3/6qS0vrEmyl53VOjCw4kNGZoyLOcryaf
	sO9SGq1Tx+Okc71AHMzDLGv7VClmYQEEl4MDxnas4Ng==
X-Gm-Gg: AYBFou3AdEProh8TUBx2GhefnYglVPVhA2YNmWZyA9rElUsitg3yTm8uOEqf9qpraEz
	Kd1JVFpZGJN9pDvb/CMFI2a74rJ32Q3nZpGDbZjbFO1Lbsww3PTagyxc1SBiqykD9ADH/X/5ZhO
	32+8x4zFNLoPjdLkoWyA1PP/+HYxPJ6TdS+tlZgj29JQrrtZrIoh8wt7rccLl1h9y0rEi7t6bxk
	UAhh+5CyV0FqXBcgb5wQdi1OV0mdN0LaR0AxheuHJkSq+m4jFS5vbyDma7KAdOlKZ1w2kiwBdVU
	nSgXH+z6/ADUxZsiodZqXy5UcDAurAhzYFy+aql1pUHhrzc+n5qqDL4QqhVBoZu83iQ/BfjxIl8
	iSOKSZ4loMo1ER7Z49/H2tNdZeT3NJwYg0X0IQUOAMyf3an+ADZu+vA6F6sfQ8IG+c6vRJg==
X-Received: by 2002:a17:907:cbc7:b0:c40:19dc:a248 with SMTP id
 a640c23a62f3a-c4ca7a42046mr356741566b.15.1793431562780; Sat, 31 Oct 2026
 00:26:02 -0700 (PDT)
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
 <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
In-Reply-To: <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 Oct 2026 15:25:26 +0800
X-Gm-Features: AclHuK-oRALqKn1jruGeRVlQNoYATQG78_2fhoUKQoQ-rHK8DD3zymOGsb6Ve4o
Message-ID: <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Barry Song <baohua@kernel.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 10:42=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Tue, Oct 27, 2026 at 7:40=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > On Mon, Oct 26, 2026 at 4:41=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wro=
te:
> > >
> > > From: Hui Zhu <zhuhui@kylinos.cn>
> > >
> > > lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), b=
ut
> > > lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_ge=
n()
> > > returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check with=
out
> > > clearing the refs or PG_workingset.
> > >
> > > A MADV_FREE folio therefore keeps the state it had before madvise(2),
> > > even though madvise_free_pte_range() has already cleared the accessed=
 and
> > > dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
> > > younger, and PG_workingset puts it in the last tier, so sort_folio()
> > > promotes and protects it instead of evicting it and charges it to
> > > lrugen->protected[], which read_ctrl_pos() uses to balance anon again=
st
> > > file reclaim.  __folio_inc_gen() clears the refs but not PG_workingse=
t,
> > > so this repeats every time the folio reaches the oldest generation.  =
If
> > > the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
> > > lru_gen_eviction() packs the stale state into the shadow entry, so a
> > > later refault is promoted to the youngest generation.
> > >
> > > Call lru_gen_clear_refs() while the folio is still on the generation
> > > list, as deactivate_file_folio() and folio_deactivate() already do.  =
Its
> > > return value only says whether the folio is in the oldest generation,
> > > which lru_lazyfree() does not need because it re-adds the folio below=
.
> > > Keep folio_clear_referenced() unconditional: the classic LRU needs it=
,
> > > and it also covers the folios that lru_gen_clear_refs() skips.
> > >
> > > Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> > > Suggested-by: Barry Song <baohua@kernel.org>
> > > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > > ---
> > > Changelog:
> > > v2:
> > > Call lru_gen_clear_refs() before lruvec_del_folio() instead of
> > > open-coding the flag clears; drop the lru_gen_enabled() branch and
> > > the comment (Barry Song).
> > >
> > >  mm/folio.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/folio.c b/mm/folio.c
> > > index 35e242b48870..ea3adb6a89d7 100644
> > > --- a/mm/folio.c
> > > +++ b/mm/folio.c
> > > @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec,=
 struct folio *folio)
> > >             folio_test_swapcache(folio) || folio_test_unevictable(fol=
io))
> > >                 return;
> > >
> > > +       lru_gen_clear_refs(folio);
> > >         lruvec_del_folio(lruvec, folio);
> > >         folio_clear_active(folio);
> > > -       if (lru_gen_enabled())
> > > -               lru_gen_clear_refs(folio);
> > > -       else
> > > -               folio_clear_referenced(folio);
> > > +       folio_clear_referenced(folio);
> >
> > Why can't we just call folio_set_lru_refs(.., 0), and should we clear
> > PG_workingset? Keeping it helps PSI on refualt / redirty tracking (not
> > sure if meaningful but CLRU does this), clearing it makes eviction
> > better, but the eviction issue is MGLRU-only, CLRU keeps it.
>
> I recall that in v1 [1], Hui mentioned:
>
> "Use folio_clear_referenced() rather than
> folio_set_lru_refs(), which is not defined without
> CONFIG_LRU_GEN."
>

Or prehaps we can have a folio_clear_lru_refs() do in a unified way
for For both CLRU / MGLRU? (Just like folio_migrate_lru_refs).

PG_workingseet gets cleaned too, but if we thing carefully, it might
be actually the right move, even for CLRU. Stepping back: what
PG_referenced/PG_workingset encode is "this data has been accessed
repeatedly, so protect it". MADV_FREE is the caller saying those bytes
are garbage, the allocation that produced those accesses is gone, and
whoever gets the memory next, could be a different owner with a
different access pattern.
