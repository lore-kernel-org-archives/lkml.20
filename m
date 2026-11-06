Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958984;
	b=tqglgh/OmtjPxWg94/o0+zZi4ri4sQDUhNDEXaFcruXmCMhHTXwcdhUUtlq1LmJezhRn
	 y6qzvfDEEL+2wjDQVB6Ip8kxvjCG5yVbf+wt5UsgEzav8slVEY88l4g4Uaakww/amlPdh
	 NmtP0yv1Ppj3wIYXWm/meqAAxdimxpY/JZTOxiMa9lTrz4dOgnb0R2pFZkpT9zc4ZP21p
	 g4KwqSfmhOiePdvbAejTYWwvQ7SlXm21RPz4C0H8Tyl4hGrlGRjFRWXYVXMSQw+HgJVOQ
	 c4TpODSxvqD0dwYURJuUJuvTZkDu3S1pLXDBW4Ywo4csowRx49lwzaqvRNZ3ZLABrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958984;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w8OzRqDZQKjlnkKE6E4d5qASDSC6RPN4pLC36VUFGsI=;
	b=OvrNB8PsSxBXh12OCPFZIRXYGQC9m1B5lkxmsrATU1+Xt4HTAOqOGSswUakrTcirB9Hk
	 FyFImEj4YhZC8CpIYBlWnlGXQTxnpd4tEenlgCZrIt2DieZb4TkvH8x8Me/6GG3Qf7Ad1
	 KoIrtvWA/VBUAPyy2VNok1WHg8XymYWMG2pDIgaSvpD1/HMPYaQsiuNY2MjgZMT881RsA
	 Dy37Z8Cc2XkRy/LLyb2B8RnlpepRNy1Iu07sFLPyRBVgkyqzog2NnZWrvm4EVJzCU7PjZ
	 DqB/V15DhbqC6Ym3EgLGDMj0t+lWzicLMLTC+H3rlulDSBpnytDUpSkjdAWfdqOi0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OkYMi/fF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D527606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OkYMi/fF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5421F008A1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958984;
	bh=w8OzRqDZQKjlnkKE6E4d5qASDSC6RPN4pLC36VUFGsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OkYMi/fFnOE55CJ7cd/1YEvR4T/qaVbna+FxAJ0RGz1BJOMNCz7nXthukL33Izh8v
	 Jts1gbVEXev5YDKBCendBcjZiYEO8zOcciVzOh1dc08wQlkc+hQ2Gc3LnvH7Jb1oo/
	 16/SM/BsnS4jYHVaOusWKsOTxhqbQX08f24PrL8bcCajSyn0BIF5enyZ6+Jaf5edx+
	 Q5u3ieOdb5821sqEgQ4b6L6rO9swJUiY9bN1gOkrfC4V+/3a/Tph9db/aWHHlrMtkT
	 Ges8bTP8Kn/rjXd4j7CV+Dh6BkqbGseQEJ1QIDSwOuK8m+GHPPuZKe0DsUQFT9QGa5
	 8glYSFl5V38ug==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b52ba422cso5187106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw9KI7ZtQm3brQ+94m9jGsbxCd4ofPW2CGEQkykM5FhX8m5xhIiVyDPNnhJX05wWD/IiBQI0wilu3+mcng=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qjlgA1D1xLK24+yOEYif+LwmE9a0ii6V8D7WV4YtD6qfQRnxE
	trrYjvOnrG/acqw+fQ7hgRxMeotlyjFCkFJslgmLBAco8Xf+RmHIfu+Dm0omBAeC0Iwz0tyKmV2
	pBpPhQUItWhU2puoZuH4G9nnvCp5AzuA=
X-Received: by 2002:a05:620a:294a:b0:93e:ce12:aadd with SMTP id
 af79cd13be357-945f34ef78bmr296469885a.58.1793958983724; Fri, 06 Nov 2026
 01:56:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev> <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
 <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com> <CAGsJ_4zHtv7hBCaW=wdfiM7yA4OJS7pcFomSo22bEzWHizYAXQ@mail.gmail.com>
 <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
In-Reply-To: <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 6 Nov 2026 17:56:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zLiwYf6LM_BWoZyiYWxvW2H_siZ0QC7FmEHazF_fLa6g@mail.gmail.com>
X-Gm-Features: AclHuK95LDvF5ZiNBpoPTxiS2rEhGEEMq1D27yisdsMbvX4nhwqVupPOIZSeW-w
Message-ID: <CAGsJ_4zLiwYf6LM_BWoZyiYWxvW2H_siZ0QC7FmEHazF_fLa6g@mail.gmail.com>
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
	harry@kernel.org, jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:55=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
[...]
> >>> Ouch ... one thing I missed ... what about order-0 reclaim?
> >>>
> >>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we s=
till
> >>> hit the same race there?
> >>
> >> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
> >> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is se=
t,
> >> it means the caller can tolerate some racy checks.
> >>
> >> For this case, I think we should set TTU_SYNC unconditionally in
> >> shrink_folio_list(). Barry, what do you think?
> >
> > Baolin, thanks for reaching out to me. I added that flag
> > mainly for large folios.
> >
> > I observed cases where PTEs for large folios are partially
> > cleared during certain transition states, for example, when
> > PTEs are cleared before being modified:
> >
> > pte =3D ptep_get_and_clear();
> > pte modification;
> > set_pte_at();
> >
> > In such cases, page_vma_mapped_walk() skips the empty
> > entries and starts from the next valid one.
> >
> > This may result in partially unmapping PTEs for large folios
> > and trigger unexpected folio splits. At the time, I was
> > particularly concerned about unnecessary folio splitting,
> > so my focus was mainly on large folios.
>
> Thanks for the information.
>
> > However, I also noticed that a similar race can occur with
> > small folios. In that case, the folio may simply remain
> > unreclaimed by the reclamation path.
> >
> > However, my main concern at the time was avoiding
> > unnecessary folio splits.
> >
> > Your new race also seems to amplify the same situation.
> > However, I don't think this problem necessarily depends on
> > the commit you mentioned. It has been around for a long time.
>
> Agree.
>
> > If the concern is reclaim failure, I agree that there is no
> > fundamental difference between large folios and small folios.
>
> OK. And I did a quick measurement to reclaim anon and file folios via
> the memory.reclaim interface.
>
>  From test results, reclaiming 1G small anonymous folios (using zram as
> swap) shows no significant performance change. However, reclaiming 1G
> mapped clean small file folios does show an observable regression if the
> TTU_SYNC flag is set.
>
> Without TTU_SYNC for small folios:
> time echo 1G > /sys/fs/cgroup/test/memory.reclaim
> real    0m0.178s
> user    0m0.000s
> sys     0m0.178s
>
> With TTU_SYNC for small folios:
> real    0m0.315s
> user    0m0.000s
> sys     0m0.314s
>
> So for the current patch, I'd prefer to keep things as is: only sync
> when TTU_SYNC is set. Without setting the TTU_SYNC flag, keep the
> original logic, meaning the caller can tolerate some racy checks.
>
> Any other thoughts?

I'm still struggling to understand where the regression comes
from. You're doing echo 1G > /sys/fs/cgroup/test/memory.reclaim
without the concurrent CPU 1 (MADV_DONTNEED) operation that
causes the race.

so the regression actually comes from other places, maybe here?

static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
                    spinlock_t **ptlp)
{
        bool is_migration;
        pte_t ptent;

        if (pvmw->flags & PVMW_SYNC) {
                /* Use the stricter lookup */
                pvmw->pte =3D pte_offset_map_lock(pvmw->vma->vm_mm, pvmw->p=
md,
                                                pvmw->address, &pvmw->ptl);
                *ptlp =3D pvmw->ptl;
                return !!pvmw->pte;
        }
       ...
}

Am I missing something?

Best,
Barry
