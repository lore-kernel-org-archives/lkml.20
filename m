Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D435A3BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244081; cv=none; b=ZUmC1fe7BLiqeLuo/vindX3TlYhwXf5SD0HXuswp0HSQcynAjT0u56nduNRXsc7Lx2Js3G31VPWnAxsb+cFXC1M9LmScI53eFQ9XX8fltrMtYSIZ8Z1NC+s7ZBfLRMAnsGYEM+pgacg7u+zL50X9qlafNbky/H9QSGREcZSm7P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244081; c=relaxed/simple;
	bh=bVL4cUIeWTZ4qeLv3Tfh0/RYVIyU0ulqvxElOnqv/SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/YHXEo2aXMku1te2tBnBp2saFKHku0zLZx6IWArMbBAmAe0K6ZXAuo5oB+iIkK5gPew0xkYy7Bav5nT287DNTXrmotlktcgxslaz8B19U23fpzX3+2IY5OL46N6SbtZLCQqMPzPoo1sjxnXpPx9Mg9Cf3goCYOnal4tb4ZNFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSsf3AHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSsf3AHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74F01F000E9;
	Tue,  1 Sep 2026 06:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788244079;
	bh=QIJ9WnD/mIUV7NkTxdiSuUPVKAHvvjtPu+au55/iZio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GSsf3AHsu9HSL2zagjPF2vAc+Fn16ULqmVlE4aK3n1ZtU1MRzfxXt1BfMmgJYJg9h
	 OeGoWxLiB3NzysWXngOnJRx6LML8YWteJDEy/H5oAz4Xv1vuPdHBhv7BCj6RUg9YTo
	 HEWbi/o5BdEjqcLggfg+7uX7+pE+oN/MXqad966PkVTGuPRAvgP+KyGis01nCJswDT
	 VpT66ikYzckXnQFJiZOEjhfMmddYYPti5NP5hqyPPAda5oCTipX5bzmTQhOS4HkRHn
	 aSv+ihiYh4GXNxxhc7KbgNsuYTqF5tbVmKfc+BaU/8KOxhtOHh/LX9zrOfY6RXA5PA
	 75le3IEYnh66w==
Date: Tue, 1 Sep 2026 09:27:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/mm_init: remove zone_absent_pages_in_node()
Message-ID: <apZwagtACFXu5vev@kernel.org>
References: <20260827144151.486192-1-ekffu200098@gmail.com>
 <178816183737.3691663.7482057515031348878.b4-review@b4>
 <CABFDxMHQjXUhbkUs_5Ki7Q6ZpQkF6Y-fDCS+LfxERFv09UgOrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFDxMHQjXUhbkUs_5Ki7Q6ZpQkF6Y-fDCS+LfxERFv09UgOrA@mail.gmail.com>

On Mon, Aug 31, 2026 at 08:30:40PM +0900, Sang-Heon Jeon wrote:
> Hi,
> 
> On Mon, Aug 31, 2026 at 4:37 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > zone_absent_pages_in_node() returns 0 when the zone is empty and
> > > otherwise calls __absent_pages_in_range(), which already returns 0 for
> > > an empty range.
> >
> > Right, but it loops over memblock memory for an empty zone to get that 0
> 
> Indeed. How about adding an early return in __absent_pages_in_range()
> to avoid unnecessary iteration? I just want to remove the wrapper,
> which never uses its zone_type argument since eb0e5b61369f
> ("mm/mm_init: don't overlap NORMAL and MOVABLE zones with
> kernelcore=mirror")
> 
>         unsigned long nr_absent = range_end_pfn - range_start_pfn;
>         unsigned long start_pfn, end_pfn;
>         int i;
> 
> +       if (!nr_absent)

Yes, just please add a comment:
	
	/* range is empty, nothing to do */

> +               return 0;
> +
>         for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>                 start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
>                 end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
> 
> > --
> > Sincerely yours,
> > Mike.
> >

-- 
Sincerely yours,
Mike.
