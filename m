Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22E372058
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761016; cv=none; b=fMMtxOj4KA4W6kOaCw2myFc2ADlUS8lpUWSh0IPxjcUc+N3xxNf49IMQ4I4SOacvb847LcKF4wD3cVskfQH2t1pMEfr1gEuTvztEEL1OGHZGPe8YJRYYy1F6QYNBPQjeqTcHBaL2Sub1rhm4QF+kuYSMVXfXpxGERAMBri6EOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761016; c=relaxed/simple;
	bh=Y7J4iThQC9ZaIZCy5ZKRTGIqwrRmd8Bp09H5OpdgjfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quiZ2yHfyKwmYIEhnHUuu/Rq2uEBjeMBMVVco8RVnuJUPRpK1rY6qsxJ8govifcxnA0/rsV5Dh2MXiGKo2J2HjWD7mOk96cd0IQxBTjR7qt1OpOrg6wEa7SY6FxgKenzib+pI4RnisSHd/H3QKdwNDFoPvj9v40UKrlgPPq/d4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIPJIqcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIPJIqcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8080E1F00A3A;
	Mon,  7 Sep 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761015;
	bh=KWBg4m2wDtJRgYbxKBLwGfw2dBRi+ov6pvH3X93gXJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIPJIqcnFHP0Lub1MpXj6uRKUv0FSKOwY+sKSOczIkurDFVg8DJ/zw7OLg5EB1ma2
	 4f0nD1HaGoa20C0MK76SEYuvFrXMDliytjO0IYEiTMoFIOq+M5I138pybc42UHA94d
	 FOCqIBC6kJ76AIN2jWAkgAIjdaufr79vdXXUWUzVc+bl6XxXw5qNChplpmxaw0oQIt
	 64JewSBIMk61QWyocXlPGeqiA5+54lMnNUrXjwqq2CMadvw+trfiqKrzs+JZxbVx1D
	 czt5lT+NJ/uSVNKO9dDRZFe50OVsDUXIcboFdDYOzOx2mjo5h5nLUzUCYAY0hL7gnx
	 asXnfjRtMbFSw==
Date: Mon, 7 Sep 2026 09:03:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <ap5Tqu5yswJrj5UM@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org>
 <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>

Hi Xueyuan,

On Mon, Sep 07, 2026 at 09:11:14AM +0800, Xueyuan Chen wrote:
> On Sun, Sep 6, 2026 at 6:00 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > > > +
> > > > > +     /* Highmem folios have no permanent direct-map mapping to protect. */
> > > > > +     if (!folio_test_highmem(huge_zero_folio))
> > > > > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
> > > >
> > > > Sorry, I don't remember if it was discussed previously, but why can't we
> > > > use the existing set_memory_ro() here?
> > >
> > > Hi Mike,
> > >
> > > We want to change the linear map here, but arm64 set_memory_ro() only
> > > works on vmalloc addresses.
> >
> > I believe this is an historical artifact. change_memory_common() already
> > updates the linear map when a vmalloc mapping switches to RO and the system
> > supports it.
> 
> On x86, set_memory_ro() does work on direct-map addresses.
> 
> >
> > I believe arm64::set_memory_ro() can change the linear map in the general
> > case as well as long as can_set_direct_map() is true.
> >
> 
> On arm64, I'm reading arch/arm64/mm/pageattr.c, and the linear-map
> update in change_memory_common() is only reachable for vmalloc
> addresses:
> 
>   set_memory_ro
>     change_memory_common
>        area = find_vm_area((void *)addr);
>        if (!area || ...)
>           return -EINVAL;
> 
> So set_memory_ro() on a linear-map address returns -EINVAL on arm64.

And I believe this is an historical artifact rather than necessity. For
configurations that allow set_direct_map on arm64, change_memory_common can
update direct map too, it just need to be implemented there.

-- 
Sincerely yours,
Mike.
