Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB884CEE51;
	Wed, 16 Sep 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577113; cv=none; b=AQicElB06Lkj6UioaYyytkjygH4GgRtVPamAM1J2G4E7rS730A6xXBXN9hqttnsXW7c/3Tv+gFZ8SBdga2IltJUJgxu8HBZduqyiymiAUhnneaeXURKOLSmjoyOEDfQOmBu6RjvfDLyhwRhtsVaOQRlt5NnbghBvWSeL8uUNk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577113; c=relaxed/simple;
	bh=lKcebEo9c1fVtSvGslGB1FEm6tkejxzydqZZz2/07FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ9lM0exrh663C5nWMgwvxSTF9sb/lBaNXTRELNKwFZoisTYDvkofcnVoSqkYk/T9qgY/1y2Uu5fwrXwBCJRXBLpmTTCF2e24KGup+HQkvOc/m9elGRCUL75S8pLF9xl+5wln7Y0gYxelKvifzmmfBk/D8ienODh9QOl/uukCwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd7BNHxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd7BNHxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770061F000FF;
	Wed, 16 Sep 2026 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577098;
	bh=3fWg49n3tDvnDx7HCJfYYRm/P8LKx19J+Y5U/c4kzqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd7BNHxF2blScprlS6jNfovJFzbT1rQfDwvBai3uicjH7CT7QH/LAvW4hroXOXhcp
	 A78X8nwpX674xFa6c2F6nKPqb7GdPXUIWSwdDqIsWQDYZ6goJJfuhzCxZ/cFbo+TuY
	 UsdBUhGWhVQcBb3wNd0bX7kWMbg6uAM2jFIJlHD0i/RlMHBNC+BoWRX570ss/pdAUb
	 kllw0sEqLXDog28lOHnzHUuqOaQzdQ9M9ZgbZMTR3LrFMzUO6JgwQRbPrl2zVUjFGh
	 eqz4+2cWi3YiRgnBkbAJ9/RhAQY7hfqcy6gklzNNST5RkQO/ZTm2y/dA/4VnD7+G+h
	 TYvf5nn5xIvnw==
Date: Wed, 16 Sep 2026 09:44:57 -0700
From: Oliver Upton <oupton@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Mark Brown <broonie@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
Message-ID: <aqrHiTfI5QjUi_UM@kernel.org>
References: <aqqap3DngKznNrSA@sirena.org.uk>
 <aqqiAbgDmfQBLPTA@google.com>
 <aqrFjUIubjzjXYV0@kernel.org>
 <aqrHIlx2F9__sLef@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqrHIlx2F9__sLef@google.com>

On Wed, Sep 16, 2026 at 09:43:14AM -0700, Sean Christopherson wrote:
> On Wed, Sep 16, 2026, Oliver Upton wrote:
> > > In case anyone cares, I'm woefully behind on sending "thanks".  These came from
> > > the prep series for enabling PPC selftests.
> > > 
> > > https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com
> > > 
> > > > interacting with commit
> > > > 
> > > >   6f182db39fb00 (KVM: arm64: selftests: Add ITS table save tests)
> > > > 
> > > > from the kvm-arm tree.  I have applied the fixup below and can carry as
> > > > needed:
> > > 
> > > Given that this is in "fixes", I assume the new test will land in 7.3?  If so,
> > > this is mostly my problem to deal with when sending Paolo the selftests pull
> > > (which, FWIW, I'm hoping to do this week so that it can be used as the base for
> > > PPC selftests support). 
> > 
> > Yeah, aim here is to have the selftest go with the fix which I'll send to
> > Paolo this week. Sorry for the churn.
> 
> LOL, why are you apoligizing?  You added one test, I reworked all of the core
> allocator APIs.  :-D

I'm pretty sure you've conditioned everyone to endure at least one
KVM-wide rework every release ;-)
