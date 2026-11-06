Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962177;
	b=1CNaxA6phX25LqFu6fnDJPAmOldsYBu/12j46TsnIwPOixebLRPnAAhsbDvq+JV5LssZ
	 hl3gFTEXt6Hzo4ScfobzCnWESMMFsxDn1BW4pb9iasXyqpaAJ2tNoaE8s1iqh+m4yjARy
	 ZQG3g28N4m3UReOhTfrpXol5AE0VppUy/CDeOfd7ZuinqodGi++5zO2cGj4Rr1v00lCNO
	 sTRc2dVss+AuY0ysLT5Y6vOIty9kZuZfBC8uTLOq/vM578nk+9dVhP5q888/IcDGNfaYJ
	 R2vmH2sMKji8mghJiKd1BthAz+QtUhlV3C9AxWvCbuIuLeSzvhkyFBL8ZKX6nbJTyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962177;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mvQ15e3g/AD8lbRjQ6JUAGFsFKFusEgK6jSCW/w75+w=;
	b=4nchvrpJ/KxBWcyU7wCz9Bs0pepL8oiqGXn5WdrQ08C5Aag37NKGd9Lg3rdTyfqZWKuj
	 56jZqtlOkaBkJkMmHNK3Kh1kIl3ClJ3iEgOnfo2zWRzDIjiZgEF9S7HPqQ8/rR2CaxWHu
	 Rt1IAW/PERi/OGA/qJKV9Qpa8e+xLqhQxL8A5py8vgGKGhYroEMkSU/AuTie7gFginnDH
	 kEcnVpx5xTT8aVn09HR7v0l5zEBU7/iE8iUQWzSb+4KNh4CY9+L3bfq0urrLxvdWW9D0M
	 pqbw/CtR1QBS92nJ4Q54uP36lWHn9ghCSbI7hRDu4GaGCZoAhmZPc86MhlOyqxER3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTARwSug;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA4606D811
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTARwSug
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165E1F0089F;
	Fri,  6 Nov 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962176;
	bh=mvQ15e3g/AD8lbRjQ6JUAGFsFKFusEgK6jSCW/w75+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTARwSugKACzchwI9R+JjOROV4b+HroR1chp7uSPikfui18Gfvfu+dEapvGjm2sfT
	 ZJJ1rBeztIqrZhw0OnqUbqbKI3Q7hz+Lww5ww1p/MLaw3/3Gahrb/ZOE5ieP98K3UQ
	 Y+dnYA8WW3ggbFrwgAD6tRWgjpk8iJvBf4Q0EnOZVVJYz2BgmjJV5GdPVQNjREy3Gu
	 ENZk5WkUZhdgklr/rwtQL60aQDa+N/X5jz6SHCXmlpBlboNel56RCNgQmVJru7OO0a
	 UxRP2GVwUWrBD9BxXkERJ99Tryg4zcvnQ7zJ6Pxc2bckJKjSvvsOBBFEAdfDFCClGC
	 mIQpIRrRmQO1Q==
Date: Fri, 6 Nov 2026 10:49:31 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au2wjPw7PMD5veiV@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <257ab860-b408-4897-838b-e7b68f981d6c@gmail.com>
 <b48e1b6d-0286-489c-a688-cf751fb74fe6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b48e1b6d-0286-489c-a688-cf751fb74fe6@gmail.com>

On Fri, Nov 06, 2026 at 05:29:45PM +0800, Vernon Yang wrote:
> On Fri, Nov 06, 2026 at 10:12:46AM +0800, Vernon Yang wrote:
> > On Thu, Nov 05, 2026 at 08:57:24PM +0000, Lorenzo Stoakes (ARM) wrote:
> > >  		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
> > > -			/* Unable to collapse, skip to the next candidate. */
> > > -			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > > +			const unsigned long next =
> > > +				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > > +
> > >  			cc->progress++;
> > > +			/* Check for overflow. */
> > > +			if (unlikely(next < vma->vm_end)) {
> >
> > I think you want it to be like that.
> >
> > 			if (unlikely(next >= vma->vm_end)) {
> > 					  ^^
>
> Don’t read this comment please. Your code is right.
>
> The VMA at the top of mm, after aligning the end values according to the
> PMD, may overflow to 0.
>
> It might be easier to understand if this coding is used.
>
> 			if (unlikely(next == 0)) {

I'd rather keep < as it's the general form used for overflow checks and I don't
want to bake in assumptions about the nature of the overflow or make somebody
have to reason about that :)

>
> --
> Cheers,
> Vernon

--
Cheers, Lorenzo
