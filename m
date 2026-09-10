Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4B39A7E5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016329; cv=none; b=it/x57xslUq1mFZz2mV+e3LSWepKYnluujkrATKZOgPF6DAzXiQ281Fq0evYe8jftL/6WFxQM2p4IrzN0uLDm7Ijhr2u7siaR+Op6Mnc4EuuKVRTJHJsYqW5lCk7PN1XBnHQx/H6sKPhswVvTGO/P3vqrTl5q7Aq3WCdHaLKXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016329; c=relaxed/simple;
	bh=lVXu7lXKtSCi82ldHfsEJRX31tVTSyhTWK/2yIeoNro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ht8hf3IJc0GZy5YZ1964HOIGKH7Fb9ezrT2rjdEtPfKJCmfDiMPHrDIkImtCphzxcUCbo59u5hUf3eHLszuMgy+FW/Zg6uldVkjQktk0pkLbnJI2BBS7mDKDgd9jEZ2qO2pZ/i7W4fKiZZ1w27tk8JUKbWW+VAUQ4I9+r7RMeck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwxxO40Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwxxO40Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFD21F00893
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789016327;
	bh=jaJUvdpDpUDbSBpSVuw1s5uwDKMSoFFuKQIxHId5d8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XwxxO40Quue7z7982LhM3SPoYwje4x6th5sqGFA/Uz6VWZgotsAlT7mG3AoQNMD0i
	 bQT8clEzu+K6GYeJbONdygp2lWNTbDz//oevOHta2odT40Oimh+qf5ZND4Fdsmptqu
	 uA9UZUN3TX3A5ymOjwLVItrPUBJWVlU+rp9dq0cf9ecZQNaLsW/bKViwnTHCAPTUQf
	 3i7l0pGdzcOqxLPQtjZl5gfDmSN9sSMNgRM2QpIgabuRo14IbkUgZ4Q8FbxefCLcT4
	 rnT1IX9TOghg7TCp9D71+S//r44KnM0yUUZqfejHD24MgN1WDJlsetSunZbIviFjnb
	 xDWXqZayz8QBg==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so100215585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXVn1SOAgSgQPZKkD2ettiwPIPpQdXUksfsSfiHt14i7LSv1n+RgjdbpiEZ2AMSGc9pe6tLniznEvn27E=@vger.kernel.org
X-Gm-Message-State: AFuF++lHVAXZdw7GnNC27Ldxn8cCsrGXBWfmcZeUn12S73wr39vAwr80
	6Ol5PjZFGymIyhekZY02gAIqoqFnPTxSiesW89DVuaOy4XTU30RsdjUO7l10Es2yi6utazExhOT
	4zcW8RDqs3+qEvSMH6tLaEIcTMPw6eG4=
X-Received: by 2002:a05:620a:4409:b0:939:191c:cac7 with SMTP id
 af79cd13be357-939d4953b26mr660961085a.13.1789016326635; Wed, 09 Sep 2026
 21:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-9-dev.jain@arm.com>
 <CAGsJ_4yQhafd8zoESxFza3N8kxWxpOpa1Pv-Sf+N=mCPz5or=w@mail.gmail.com> <3f1798bb-c6b9-4c1f-9a9a-fe312c1a0602@arm.com>
In-Reply-To: <3f1798bb-c6b9-4c1f-9a9a-fe312c1a0602@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 10 Sep 2026 12:58:35 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w5CFoUPLT=YiEwKm4b0CMvj4B0UFLKuGFo3Ko9jdOpRA@mail.gmail.com>
X-Gm-Features: AcwNN1UcFB_eFHPosL252Q_VZRdmuTDwcLnKb5NJr-W5J12yqfDNTHvxufJjGpw
Message-ID: <CAGsJ_4w5CFoUPLT=YiEwKm4b0CMvj4B0UFLKuGFo3Ko9jdOpRA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm/rmap: batch unmap anonymous swap-backed large folios
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, davem@davemloft.net, 
	andreas@gaisler.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:39=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
[...]
> >> +static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
> >> +               struct folio *folio, struct page *first_page,
> >> +               unsigned long address, pte_t *ptep, pte_t pteval,
> >> +               unsigned long nr_pages)
> >> +{
> >> +       unsigned long batch_idx =3D 0;
> >> +
> >> +       while (nr_pages) {
> >> +               bool anon_exclusive =3D PageAnonExclusive(first_page +=
 batch_idx);
> >> +               unsigned long len =3D page_anon_exclusive_batch(batch_=
idx,
> >> +                               nr_pages, first_page, anon_exclusive);
> >
> > `len` is really a bad name, as `len` usually describes a size.
> > Maybe `batch_pages`?
>
> I disagree here : ) I don't think someone should mistake len with size.
> len is ... "length". So in this case it is the length of pages in the
> array, starting from batch_idx, upto nr_pages, which are all exclusive
> or not. Also I would prefer short variable names.

OK, up to you :-)
