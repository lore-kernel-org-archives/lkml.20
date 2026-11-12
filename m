Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472928;
	b=OVItl1fHZ3sUn7YZ/mZa0hq5XvldVHRxo5E7+VQDgldfUC8KYlk1ZHHuxdLhnNUzQAXe
	 xwhgW2x3NddHUSC76PUBiwWCPe02eJGm29rHgGRHgr9cFaG4VWQGp1hb7hZi8lc37+RkY
	 n0IsNKmM+UUTkIak3mdDf5ZTsVi/l4FhS5Fv1eOylLrbUW/9OCQgzEyyvP0Nm3TIPUFRG
	 oGo14dx+NM75K2Gil0/ap342b5lF+VXZuFRaMUKJjBu4XxBA6wYcd8XtVQMbJBQjT0KWi
	 69wAd7e1AjWyC3jzdJXNoBb9+lmYwuFKtnjVUz/DrZ62amEQFYkcLr1HZfzRZXgNbdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472928;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yX/snQhfs/qWZHLfhiGp0UkDR56azxtXVdV6DTHRemA=;
	b=kTBrB5vNWTcBW3A4bOtY0cm1mQLb0DW1Fid12N0OgUh6hr1h3G630eezUJWShRuGb3a4
	 B9D/Wu1Ve/T80/CwQ7NZalMspZgGVRsiVxB9PGixV2wUDvPZoQWLAOvYAKcC8Ps+fjwsJ
	 xx9aNFBZQTtyIRElt/SiCYtRsnxZbxm0+/uJ58273ainKQTZtNDv+9cf5kKfA5Y76JTL1
	 4yoZaAL3HIQf90TPp4GPbwFbiM992MxDY67tyt77qANOTRHxooedk7KXfvtYercrONb1o
	 N5GX3FT3+ylCQOFoKnEpF8RPImRT/loPs8LFMLWZ8l4//qugSylu9aH/0CHcKdj1gHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKfCprWW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3F9606C82D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKfCprWW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A00D1F00A06
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472928;
	bh=yX/snQhfs/qWZHLfhiGp0UkDR56azxtXVdV6DTHRemA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iKfCprWWielEa8qWCAy8ZrFTAc9sYEdp2d95dZ0fP3WMdBuinjhFwKaMeL1kcGwq5
	 kjBb7O2pDIFZI8HBnKfmJiy1UncxHnZgbqg+GnjCutPiaLw0x3h+s4d7JU/+PatuzJ
	 uzcxXSvU7PVH7J9Im2Q8BbhNVkiBXcPnPPodD5HKlQLMh7U9zlTdgIKzqTK7n28ADM
	 M3K9XuTWJeD2m1Jzd2hwY7DuJgUmidG4HGB9S2KRhkbLL6M3rCAG8i4EZyjnf2l8am
	 R7w+Yl3OQheaghiuYRRtcLfQ3f4dPIt5wky/FHmlA3wkSQcxZs8+FJTZkUof8SmWd8
	 MXqvpDS0XYsjA==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f3c89594cso308696385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBmkDTQW3U9BvN1kibO3hnlgPH84vRfxobQk/vrsJwUBjXfh7kJBo0F1/ucHxJBEoy2M4yjLE8Y2+lOwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xkdwq641aDmJ6/BWBLZjypif/vJjnYaecla1RXyXRR3InVA+n
	7utT2KF/aJRj5HQYE1hbwyR5TdjeRpVHyJxgJSoGKo17IB77DsFEXt8vZ7UYvwqluegxMMKgoEC
	0pGF/fLIb21qMyScQ1mNDxPNkRMWjQj4=
X-Received: by 2002:a05:620a:4629:b0:93e:c12c:9dd2 with SMTP id
 af79cd13be357-947b000dc62mr804392285a.82.1794472927557; Thu, 12 Nov 2026
 00:42:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112081928.3014946-1-ridong.chen@linux.dev> <avV52J2rD19cjM2J@KASONG-MC4>
In-Reply-To: <avV52J2rD19cjM2J@KASONG-MC4>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 16:41:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
X-Gm-Features: AclHuK_9uCBjHclHvkB2UW2bzSTSpgTVr4bRNegOOsiNxjGaC7AtEWcvW_r0__E
Message-ID: <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
To: Kairui Song <ryncsn@gmail.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, David Hildenbrand <david@kernel.org>, 
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

On Thu, Nov 12, 2026 at 4:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
[...]
> >  mm/folio.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/folio.c b/mm/folio.c
> > index ea3adb6a89d7..c412d9b398e4 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec, =
struct folio *folio)
> >       lruvec_del_folio(lruvec, folio);
> >       folio_clear_active(folio);
> >       folio_clear_referenced(folio);
> > -     lruvec_add_folio(lruvec, folio);
> > +     /*
> > +      * For MGLRU, lruvec_add_folio() places anon folios that are not =
in
> > +      * the swap cache into the second youngest generation, which is a=
n
> > +      * active one. Add the folio to the oldest generation instead, li=
ke
> > +      * lru_deactivate_file() does for clean folios.
> > +      */
> > +     if (lru_gen_enabled())
> > +             lruvec_add_folio_tail(lruvec, folio);
> > +     else
> > +             lruvec_add_folio(lruvec, folio);
>
> Hi Ridong,
>
> One question here, why MGLRU/CLRU have to use two different ways to
> add the folio back?  Will this cause over aggressive reclaim of the
> folio?

I guess that is because on mglru, that is lacing a way to add the folio to
the head of the oldest generation for anon folios while CLRU can do
that :-)
