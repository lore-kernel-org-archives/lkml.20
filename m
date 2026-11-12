Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473448;
	b=aUYsA61qnfz3c7BD2DWh2bOMvo4zF9MNuvLx8st20/vZx1NOpUjVGMKJG12dWWd42dow
	 a+rkeW1Ok/6sLtRmMkjgR9OkTtjL4N+ltvLOCeEwSYB8HoIaMYtoXDjSSOocAkeRKbxQe
	 A8oc2J94H6+Cu1JomnOJOTzGjgbH6ZDQ8X7y2R5cvrfw8yPYjKQ3c80nraNu0ucy242j9
	 i5gKAzjSEIjuA9fqxDlw2D2cRKsyT81usBTSaC8LZLA7Obb9x8piR5b4yoeOWnGuaEBuW
	 huzbniS1NqLeIfSggjEkzXZMYFlzuXCXLZbkQvF+6HwDGfPqkgiOJKimpzQBbSJMeZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473448;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TgmgKd/DyKlf9Jtf2sOIeUuR+eT0nZJ9AmuIRwu4FJg=;
	b=cNed+TarX8OAjOp+YMq2fuJso3SHa/PWhZ/TsW9p6mL9AtN9sCoamdvwVIgL2WXD9UI4
	 83T6xvxj8KaY+6feQI/xSkUBnywkeKaEYK4r3eLwVllkRaJX/owgq1RE0nEnz1iuznODn
	 XNMgmcKDNPkVMxbzu6XpJNYUfXodX39UcInqCjc4DVrifmx7Etb51fhsdpAs/LaxBb9s0
	 CxY4ksFFSph3rkvOOVoHqd69YLJkhv++SKNhAl81cYDVESax1zY5X/dTR0wdhZqHKB/tk
	 RcQ0IBZT4J9WUFtreLxY+GaOvi3v1ig6gWpqPBZ1h0hOWtlXtSfLejfzqn6dc3nTSiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5xXhGcP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C8606A889
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5xXhGcP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0EA1F00A10
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473448;
	bh=TgmgKd/DyKlf9Jtf2sOIeUuR+eT0nZJ9AmuIRwu4FJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j5xXhGcPvIioCturQTJcBFChT91tq0mZ8srQmggLxlI14nbEL5pCIMk4nbjJoxVco
	 iZde+72CtGI1BY8Rr1NcspVQJqB7/msEossP2/KK8qFeZ49EQoOfkVwcDFBcblXJIz
	 /u0he6NfCx8xsZ3qzKFEEWU9PEoHCTwAmHstCMup3SeF+6+I+UfbzeQzifnNK/hcsy
	 Oz0P4d9K3xYKm+eDR5IY++/2x7ycbsOe8Vz1052nYjdYuuYtAstqpOFoGtVq1Jdzaj
	 hK7wASCRmbR5One4EkZsxpVs0jVCsisFYqQOl2iHaNGt38l+8wDEGxCVk26Z84cEov
	 r/gUqJXQ68FVA==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93a40a9a01aso83415285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:50:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQuE/OYHukfOGgCZl61TbKVjktJhqrVQJJIF76RdcOQgsBdCazhCiA+TkAdJ8cLKRIncsibeDMZqdHFdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z++am4muqhJvNjXZsplG1S7iLevR4jnZjedtuiprdgfpTnc8Fo9
	PtrEfURj8X8vVPkFV3n/5DikPo/Rji7FMV7Xe9p3r6h/RvxPzdyctr0vf2ZWnOwV7G3B6m0rBp5
	qiv49qEfjh/LDP+k/NvApk7v6dQeSuek=
X-Received: by 2002:a05:620a:2a01:b0:93f:231:9ff with SMTP id
 af79cd13be357-949330d5136mr338513285a.27.1794473447348; Thu, 12 Nov 2026
 00:50:47 -0800 (PST)
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
 <CAMgjq7Disoabm_4yyp60=AdaEH1RWfUpawc8vckV2e6c7g2RmA@mail.gmail.com>
In-Reply-To: <CAMgjq7Disoabm_4yyp60=AdaEH1RWfUpawc8vckV2e6c7g2RmA@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 16:50:36 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z85u66MuK1ior30sQG4FjyAsZTwO+DCuLpD_DoXgRGtQ@mail.gmail.com>
X-Gm-Features: AclHuK_JbBbTc7uJJnjqDd7xtYHR6W7Z1uxUQ58zOfeU92Ldv0UBDEv_UNuetu8
Message-ID: <CAGsJ_4z85u66MuK1ior30sQG4FjyAsZTwO+DCuLpD_DoXgRGtQ@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
To: Kairui Song <ryncsn@gmail.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:47=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Thu, Nov 12, 2026 at 4:42=E2=80=AFPM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > On Thu, Nov 12, 2026 at 4:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > [...]
> > > >  mm/folio.c | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/mm/folio.c b/mm/folio.c
> > > > index ea3adb6a89d7..c412d9b398e4 100644
> > > > --- a/mm/folio.c
> > > > +++ b/mm/folio.c
> > > > @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruv=
ec, struct folio *folio)
> > > >       lruvec_del_folio(lruvec, folio);
> > > >       folio_clear_active(folio);
> > > >       folio_clear_referenced(folio);
> > > > -     lruvec_add_folio(lruvec, folio);
> > > > +     /*
> > > > +      * For MGLRU, lruvec_add_folio() places anon folios that are =
not in
> > > > +      * the swap cache into the second youngest generation, which =
is an
> > > > +      * active one. Add the folio to the oldest generation instead=
, like
> > > > +      * lru_deactivate_file() does for clean folios.
> > > > +      */
> > > > +     if (lru_gen_enabled())
> > > > +             lruvec_add_folio_tail(lruvec, folio);
> > > > +     else
> > > > +             lruvec_add_folio(lruvec, folio);
> > >
> > > Hi Ridong,
> > >
> > > One question here, why MGLRU/CLRU have to use two different ways to
> > > add the folio back?  Will this cause over aggressive reclaim of the
> > > folio?
> >
> > I guess that is because on mglru, that is lacing a way to add the folio=
 to
> > the head of the oldest generation for anon folios while CLRU can do
> > that :-)
>
> Right, but lruvec_add_folio_tail also added the folio to the very tail
> of the inactive / oldest list, could it be a gain or problem if we do
> that too for CLRU?

My gut feeling is that MADV_COLD says the memory is cold. it seems to
make sense to do it all the same for both mglru and clru - to the tail
of inactive(CLRU) or oldest gen(MGLRU).

not quite sure if userspace is expecting things like this. I feel it should
expect this if it says it is cold?
