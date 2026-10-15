Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349295476EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081698; cv=none; b=ZfiWCHmT48w+RUD79cx7y2skUoGGFuDDGpqWHQ/S6wyv+Woed5eAlXVHbpYC7zHFTKcOiYS9aV1nm+K0UWzrCJFfoy+ib8Zw/Dzmf7HtCdqqzWPKlKOyltqrT1CcWSy6IGMVmkFYZFe9p53VdvqReGe10M2ct7e3dxXEnATGb14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081698; c=relaxed/simple;
	bh=XLnWwWNMPSm6y57bf4F4xUjaAeFj35H0VYjcsc11Jog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXc97WT4+mD/jBcOq5seNRHiZ48M0N5o+P7XROfwXOwj3LdRpY1UF2BuM50CfdTuWE+GfOOUNSle0IBb3y7BzT81w7R39QL9y/rJ/a7CFHfkrTGRFhmsRcRhbr/0ttsYeHV/n/l0AQb7cnnKrmAHjmQst0bDnQfj74RwaNblZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoDoNgJY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoDoNgJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6661F000C4;
	Thu, 15 Oct 2026 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081686;
	bh=XLnWwWNMPSm6y57bf4F4xUjaAeFj35H0VYjcsc11Jog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XoDoNgJYJMqr9vyGRiW3ypkgKBopgiUuSRDg6wNPKmdgpfrW11xHPPaLdEyhNhDW2
	 YUWvLh5ZV6hNwVJOcu38x0CgKFxpxvreAHI/1jqpxTxcGmC5sFaPZJYCcY0CmpkzNb
	 JWi4NEC9MyrEPpInNFS8cqXGiLyHLtLA6k7Phsjfs8vDXr+ddqa90jgGpwSoINykgE
	 xJo88GhhHwORpaTZvHUTgfYQIK8eg6DnI28n27yzbJ468Gs3XIn2Nkc4xJeM3R3GXg
	 zLKQFLzJJxiYcXKBjL7TsHfAYCFyKYddxGlaniCrm3xPQJye5eaISd4aI8RSy6mnXN
	 AHqD8M4tv4JVg==
Date: Thu, 15 Oct 2026 17:28:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R . Howlett" <liam@infradead.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Jann Horn <jannh@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: prevent VMA generation reuse from skipping readers
Message-ID: <atD8jesRoc38xF0J@gremlin>
References: <20261015143735.1630957-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015143735.1630957-1-4ncienth@gmail.com>

NAK.

You're making VMAs a cache line bigger.

Since this is the second time you've done this - stop sending patches to mm, we
don't want your AI slop, thanks.

(In future you'll likely be ignored.)

On Thu, Oct 15, 2026 at 11:37:35PM +0900, Daehyeon Ko wrote:
> Both values are 32-bit. After 2^31 complete mmap write-lock acquisitions,
> an old VMA stamp can alias the live odd generation. vma_start_write() then
> returns without waiting for an existing reader.

This is really unclear, I guess, as before, a member of the core team (likely
me) will assess this to see if there's anything actually valid here.

--
Cheers, Lorenzo
