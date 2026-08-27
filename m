Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67A442B10
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829705; cv=none; b=SJZIQGEwKBDOzFUH7kfpr7/WZ08wvqyPtOS73F+gGvzd4WsL5bqic0YVl9/zVsxyRi+B3l7BFHQzOBbQVAG31VrVC/m14osMdjazNuSODl9+uW+RCcnG2/MzhydhcSYJdb11rIrcfPbOAtOMZLWzqYxKMNHNqEQ2mXs8Ap26Uc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829705; c=relaxed/simple;
	bh=hZojfrBXhXNQGWoCuaBeqrPbG5tWmRusyDbxj30vlUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFP+4yNkVEIXOryGKEyRvf2w1EU4icke3/WT+jQUOivPmZWczk4qXYXEo3GezL+cyc5VTztI4xO+DCY7cGZWgcSaUzSGEsk5Cm7DkYZCO1Fr9VZtqgnlbO7vksSwtYRdWZ3DHBhLwcRAre0r7LKtt58uk144GHcxG97LkMI303I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1LHCRVA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1LHCRVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505351F00A3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787829701;
	bh=0UIgM9wZ4RI/8wrWJM1FMTtmf/qGX7io7Fd5Y0z2gPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f1LHCRVAF0p7WV1uJK9MuRI7poMNWprYq8VQhdMPLaiNA1JpsbYvcGhkmPdy287bN
	 dXv5RTxSbqiTw0DB5Sohqd9Hp6y+Tq7qC/NngZdMVdQPGdCQwQQkpNutMcvuAZ+lOv
	 UIbFBABcSIlEgXW/LQi33OHwRK8JgsxgJM/pXdDw/O0SScLqwEBX35LVHE4j8/uhmQ
	 0ElbhxNh61iQBRebTGRcljtthxtK5++74ZLJoi4SMaNUJDMN2NfbW0oqXJlwlNQAA0
	 laeY1aqOFndAh1VnKDinpy4wIrtqvvMNFwi0HSwStga0e10SEcT9y0VuguHSvB6+7C
	 NavCRzQl330Mg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9377f717879so111698185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoM0D3SI+a4bDmVYZPhAdJwxAZxJqA3WtA6+r2ZHvkqnrmNfbfFSX6c7hecba/6O4HqV8zKk6W/eAzLbzU=@vger.kernel.org
X-Gm-Message-State: AFuF++kC7dEQ4z/l4ZrYlkR3PU37Q1CCbwYzbS3upiq6reJQ7DNZAUXl
	NwDM3099M1kG+OxfUiobZabORQwWrU++5lJarT3CDFXkyalLqqii64VBRrKJR0Uth1YfhM5ESRq
	7rzHe0/fpW9KMVdWZ4M1pblLEYbCG+DU=
X-Received: by 2002:a05:620a:aa0e:b0:934:970a:beb2 with SMTP id
 af79cd13be357-93780490d8emr1295635785a.26.1787829700622; Thu, 27 Aug 2026
 04:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-2-baohua@kernel.org>
 <CAMgjq7AZtqdu-yJ3TSa9Zq=Cwuqv-NY+ptz3Qpive-iFXR6e0w@mail.gmail.com>
In-Reply-To: <CAMgjq7AZtqdu-yJ3TSa9Zq=Cwuqv-NY+ptz3Qpive-iFXR6e0w@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 19:21:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x1ckY2uFoOYq=Vw=d167u+-yVpt-TSWxju41ivth2iLw@mail.gmail.com>
X-Gm-Features: AcwNN1VUXhvl5pivnqOcuFtVFnj2RfhRRiUYKbPKlJdZakv6BIoplbtIqVZG-RU
Message-ID: <CAGsJ_4x1ckY2uFoOYq=Vw=d167u+-yVpt-TSWxju41ivth2iLw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, chenridong@xiaomi.com, 
	david@kernel.org, hannes@cmpxchg.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:21=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Aug 21, 2026 at 7:09=E2=80=AFPM Barry Song (Xiaomi) <baohua@kerne=
l.org> wrote:
> >
> > Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> > as it advances generations. Instead, accumulate the size changes
> > and update lrugen->nr_pages in a batch after scanning the entire
> > oldest generation, or when the scan stops because remaining reaches
> > zero.
> >
> > Since we only move folios from the oldest generation to the second
> > oldest generation, the active/inactive state cannot change. We can
> > therefore skip __lru_update_size().
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmscan.c | 46 +++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 35 insertions(+), 11 deletions(-)
>
> Hello Barry
>
> Thanks for the patch!
>
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index c1404a59523d..0d74fc00abd3 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3296,20 +3296,21 @@ static int folio_update_gen(struct folio *folio=
, int gen, const vma_flags_t *vma
> >  }
> >
> >  /* protect pages accessed multiple times through file descriptors */
> > -static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
> > +static int __folio_inc_gen(struct folio *folio, int old_gen, bool *inc=
reased)
>
> I feel the naming is a bit confusing, the __ prefix doesn't tell how
> it differs from folio_inc_gen very well, maybe just name one
> folio_inc_gen (the old gen could be any gen), another one is
> folio_inc_min_gen (the old gen can only be min_seq), and with sanity
> check in folio_inc_min_gen that expects get_nr_gens =3D=3D 4, and
> lru_gen_is_active(min_seq) =3D=3D lru_gen_is_active(min_seq + 1)? This
> could be a build-time sanity check instead of a runtime debug check.

Thanks very much for your suggestion, Kairui.

I tried splitting this into two functions, folio_inc_min_gen() and
folio_inc_gen(). I tried a couple of approaches, but I think I=E2=80=99ll g=
ive up
on this direction.
folio_inc_min_gen() and folio_inc_gen() share some common code while
also having some differences. It=E2=80=99s hard to avoid ugly code duplicat=
ion
because folio_inc_gen() cannot call folio_inc_min_gen(). However,
folio_inc_gen() can call __folio_inc_gen().

The __ prefix currently indicates that we don=E2=80=99t update the LRU size=
s in
this case. The sizes can either be updated in a batch later or updated once
by folio_inc_gen().
Maybe we could add a comment to make this easier to read, or use a better
name for __folio_inc_gen()?

>
> I saw baoquan also mentioned the debug check on
> lru_gen_is_active(min_seq) =3D=3D lru_gen_is_active(min_seq + 1), which I
> agree.
>

Agreed. But I feel we only need to do this once in inc_min_seq(),
rather than for each folio.

Best Regards
Barry
