Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520C4963DB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839331; cv=none; b=MhV/rpZAFa0AtB2dnCgRXdDVQLrJgtsqfNHrsQy3C5Fvube1nXZUfhqDZLansmeU/WNWUwNJgnxySrePoH197I6dxJgif9ALOT3j0dVSn3MAz69IFEnkj10UTierx/RvGNGVMtxUitsX4ft3VmVDKx7oOSC/buqhi41LF4CIfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839331; c=relaxed/simple;
	bh=SjmYf9Qdhg7oBmMt8/I2Zxl5WShz70amt7g1/v8ktCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZtpjvbPhSDyNh3BldyvYJ3AILY0Twrf2MnGwsZwR0PTSavvHy0ITCrArM/C62ovf/nVIM48WyUKvKALDMFIPLksEwNohFigAxD7jaqx12JzHncyYnQ9Jro4m6A1tIkW9uyGJZS3wT50VBkQmwHTDuktV4xTPMwPZTj/VF5Dfwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqMOrzaj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqMOrzaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62F91F000FF;
	Thu,  1 Oct 2026 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839317;
	bh=gEGoSrNeNp8LVSAih/jv9NghjCp3BZmPnibUPhtyTQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqMOrzajN1ZB666iTc/dHkzEvg7SaX7jMlegP5YIoR/fvW63b/5BoKzRBaJiIJCro
	 IuKNcv3UZOi/vmgA4dDme7QsNlOIOwqPWJO7YfBZsTT9zkrvNSfNyXFU0rUHbOi/4J
	 rKCXnRYHRF5DKJYXbTBfYNwAUMQ/fFtkZUbvI7x2x0jT/Bslu12jD9cumBxgSBcNI0
	 Z2YN9goxR0qxMSYEB6MnQ6HvPFSa9rCaLHppDidBaWb0/9jFEy5XMLUhflj3lwfmLV
	 8uApljev46DXP1RmbwRtcC/4xB54trw4BuJGAkjrGBLchcjLxPWDszrizcVFiiPxwD
	 CWBKjicZtf0iQ==
Date: Thu, 1 Oct 2026 08:21:51 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Usama Anjum <usama.anjum@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel
 sp into SP_EL0
Message-ID: <ar4KD6FTZzw2Wq6w@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=O30YiraMzpe=wd-s-ZHoiMWkXcr3B_qb_dp3TUk2A7g@mail.gmail.com>

On Wed, Sep 30, 2026 at 11:42:51PM +0200, Linus Walleij wrote:
> On Fri, Sep 18, 2026 at 6:14 PM Will Deacon <will@kernel.org> wrote:
> 
> > This is version two of the kernel stack juggling patches I previously
> > posted here:
> >
> >   https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org
> >
> > Changes since v1 include:
> >   * Fixed suspend/resume paths to handle the stack pointers properly
> >   * Fixed restoration of ptrauth keys on resume
> >   * Added tags
> 
> Overall I like what I see, but can we split it in two... like first the patches
> up to fixing the overflow handling using SP_EL0 and finalize that?

Yes, that makes sense (and thanks for going through it). The whole thing
is bisectable, so lemme go through the feedback I've got so far and send
out a prefix that we could consider merging as preparatory work.

> Hopefully Usama can test just that part and see if it has a lesser
> performance impact as well.

I'd like to see those numbers at various points during the series, tbh,
so we can rule out any stack-protector changes etc.

Will
