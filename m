Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBA214812
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788063977; cv=none; b=G1CttDhb8ZWDpv7szghTMvAbeOKsnfcKzsS4joblnWU7OEbes4zz6EW2hiRxw3uAlTvr+1z8BFjyI76otmHXWVRFiQlKDrUWNx3zxp6vjKlFKQaOa4vPGzDmrgWCiIG1PZ67b4UjigQMOaFDW1sM2KafTBv4tFJL68uyhK1wgWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788063977; c=relaxed/simple;
	bh=Nxt0+qX/9FKclhGmwb8njKMErAZPvEqCa3jB6XoEnro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWnASaoqDt6aTvIzFAO6nlkylbf0JHNVYNPy2Ck+2is292iZg/NgQoThK9YI/wSANUWkNCnGaT9nUwiLZsSa1J3oGmsRfsV9SHxeBj75xja/5Mh7M3H9mzEHCmBbmUOl7ZLdTPtl5Nzjk1yYESfacmGWKFewAEsJmpMjWEGGotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I95TTF0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I95TTF0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BED71F00A3F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788063976;
	bh=z4oyq3XNxRWjvU5KSLZ3bRN6q9YknXc+HlOna4jRbr0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I95TTF0QUvm2sKLPEjcrxd3aq353fdKMcv3SW7001GkL12ACKoyFefSQeeTGTkMd8
	 ypJirdJ2KH0hio/e+7BT3gBUP+LdlL9BR+KBVnJZniMvujaw2fZVoT/ZiN7+epiI6L
	 fcvYq31wwZ2Z3UknzLt7zCrD/fR61PAE5CRfnfUky/h+FIvob2hRkjFVfgburqe7nT
	 pu/ZzTlFjds/E6JarfSKthPs6bq1tWRBGbEKtHx2Y8umTAybEYS07p4BxrzklkKRDX
	 9yt2QCej+V97Rm97l0RyfXBhNxysNrL51AxX84WW8FFTIcOCNtjQd75waSxMrShwsf
	 DDrJNHyfggdvw==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e6a434cabso130850785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraDTXpskcDdqohNbvkcbE9Sd7fbT1deyH7uDqjAq+EuVNjlSJieXKvukd0OFLbk9sD/UCBOfQIXO4FifY=@vger.kernel.org
X-Gm-Message-State: AFuF++mILDHVgOX8O2nKaTW4O+9tsiwKdpGAUGuzg11hZV6tuwKob62G
	AZltxYvditfezO3ZY6YCVqG4YampCcF8nqw/mxlFETUX6DXknuX8QJ6fZYqmQbyEG+vjKCVUkW2
	8fS9uLV1D9z6s2u2mpCF0plRZ4Jh75OY=
X-Received: by 2002:a05:620a:1d08:b0:939:32cc:f2cd with SMTP id
 af79cd13be357-93932ccf558mr159931785a.1.1788063975448; Sat, 29 Aug 2026
 21:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827234704.63163-3-baohua@kernel.org> <20260830035843.712320-1-kunwu.chan@linux.dev>
In-Reply-To: <20260830035843.712320-1-kunwu.chan@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 30 Aug 2026 12:26:04 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y0Pz2fiyhS1X4PY+D-z-o8ycSKdFar9R5PQg-o2Kd6pQ@mail.gmail.com>
X-Gm-Features: AcwNN1VgEblGKtPauG047hZ4EFaf4rQhRNcWvgLAHvyDRFW4jMs-EL1wXwED7J8
Message-ID: <CAGsJ_4y0Pz2fiyhS1X4PY+D-z-o8ycSKdFar9R5PQg-o2Kd6pQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, akpm@linux-foundation.org, lianux.mm@gmail.com, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	chenridong@xiaomi.com, david@kernel.org, hannes@cmpxchg.org, 
	kasong@tencent.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 11:59=E2=80=AFAM Kunwu Chan <kunwu.chan@gmail.com> =
wrote:
>
> On Fri, 28 Aug 2026 07:46:59 +0800 "Barry Song (Xiaomi)" <baohua@kernel.o=
rg> wrote:
>
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
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmscan.c | 23 ++++++++++++++++++-----
[...]
> >
> >                       if (!--remaining)
> > -                             return false;
> > +                             break;
> >               }
> > +             WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> > +                        lrugen->nr_pages[old_gen][type][zone] - delta)=
;
> > +             WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> > +                        lrugen->nr_pages[target_gen][type][zone] + del=
ta);
>
> Hi Barry,
>
> One subtle point about the `remaining` handling:
> when `remaining` reaches zero, we now `break` rather than return
> so that the accumulated `delta` is applied before returning.
>
> As I understand it, this is required because `__folio_inc_gen()`
> has already changed the generation of the scanned folios,
> while `lrugen->nr_pages[]` is now updated only in batch.
>
> So the invariant is that every successful generation increment must
> have its corresponding `delta` flushed before `inc_min_seq()` returns.
>
> Is this the intended accounting invariant?

Yes, Kunwu, you're right. We can't return when `remaining =3D=3D 0`,
otherwise we will miss the chance to flush the delta.

So changing `return` to `break` is intentional. Another option would be
to duplicate the code that flushes the delta and keep the `return`, but
that would be ugly since we would have to duplicate the code below:

             WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
                       lrugen->nr_pages[old_gen][type][zone] - delta);
             WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
                        lrugen->nr_pages[target_gen][type][zone] + delta);

Thanks
Barry
