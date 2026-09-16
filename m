Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FEC2C8;
	Wed, 16 Sep 2026 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522037; cv=none; b=inDKZLYRXc06T5+xRc0FhZKCwOVuoxZc/aMa9S2gg5DB3i76sq9VoPD9KkxeBrUiqQBuO5kYKGrCT3oyUZvvOMvJ201DWtT9KA/98CMucEvRvAGovRRkMTeR0kUYYf7GSi9n/DVSUCUUtLe2a5HxtjfTxx9LRCi3dUfet8+7X3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522037; c=relaxed/simple;
	bh=4BeWY3/lCJ18lcwiCg0RsGQiAFLOpFWXUPCmQG+wWx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYhJgCbVDrX5xSxTpyERb+aCN2IN1MXyIfX40x37V+VoEJiNvAKIYOZJtTMRFJsyoDWUHccOEAWazZ804ZICorzvJ73EixGYV7Up5xmyGghyPhsDd0Qpco7/OSsWuq8uE9HPl3kfMpSmqKYKBc7Cb3MyoGrboVTIy27UtAH46h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CmKOPqVm; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CmKOPqVm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6B68F40E00E5;
	Wed, 16 Sep 2026 01:27:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id w_bhACch7knO; Wed, 16 Sep 2026 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789522024; bh=3a8P+bmRFwVdSyoLtW6HkfvMhmZD3rmiK9vQnWmUzzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmKOPqVmMQZGbV4ZcI5YdQmy7J3wxG6+dsIhE0miIUYdwEpGVn7HDSEM0q7bNtqMn
	 btNUn/lk3+UXRcHbNov8TmsnoHo1Phpqsyl8W/hqRKJ2kFEXa77Z/5cKEdAU5NAVoi
	 T3DJ2lG4fZz5FSBmoTbYRHKECJzHYsI/uF1rEOSHtkUEirzU0VUukNUucdOWJIqMNS
	 5ZXEaPz1qRDe282IeWkpjCYc+K1IslWE/DKcs5sexFf4EYeDL0FijchcZRicK1ujOX
	 Io1lezYp/5kMf6hoAYz0/H5GbBpUOtjUYrktrA1ftQ03nDfWJKurJtTAt+pDQSIZZi
	 +dW8Uxs5DAPox7ZQxM+KwaIVislEYkEGsAZwqQgDmWR0cyOaMxE5EvTaT35x66KSpU
	 TfzvCLDr0os9oR5Afmnc2ctPJ1I24h9dDq1CjHcPivyfJ2+HjBkSz4bMa4K8A0B3tR
	 GmkXRPNivRi01P3jqjGOh17hGXtIRfe2k5H/iAqOIRL35eId0ROSULsLvIfdO1Rp2K
	 iQ7gBabHGOBShT3ySyW9pBgUaHim1kCN23LjLKAkWHYnFiWfWzKUxcHHk0lXDyR13P
	 N4HQKlckjBJWZJVcVxYD63bdV9q0THhWchrhCKOuw4IAZpOUxPOH0CQDj8JXNZe8tk
	 Ca8z6P0cR10MU8IG5EgScDR4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C1B3E40E015B;
	Wed, 16 Sep 2026 01:26:59 +0000 (UTC)
Date: Tue, 15 Sep 2026 18:26:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tony Luck <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] EDAC/i3000: Balance PCI device enablement
Message-ID: <20260916012657.GHaqnwYToiboyjczGA@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-3-mhun512@gmail.com>
 <20260916011556.GFaqntzIQ3jyowHNld@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916011556.GFaqntzIQ3jyowHNld@fat_crate.local>

On Tue, Sep 15, 2026 at 06:15:56PM -0700, Borislav Petkov wrote:
> Tony,
> 
> I have recently started marking obsolete EDAC drivers as orphaned because,
> well, they don't deserve the effort.
> 
> How about this one?
> 
> On Mon, Sep 14, 2026 at 09:55:18PM -0400, Myeonghun Pak wrote:
> > i3000_init_one() leaves the PCI enable reference held when probing fails
> > and when the controller is removed. Disable the device on probe failure
> > and after removing the EDAC controller. Keep explicit cleanup because
> > module initialization can call i3000_init_one() outside PCI driver binding.
> > 
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> > 
> > Fixes: 535c6a53035d ("drivers/edac: new inte 30x0 MC driver")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/edac/i3000_edac.c | 4 ++++
> >  1 file changed, 4 insertions(+)

Oh, that one is an orphan already:

./scripts/get_maintainer.pl -f drivers/edac/i3000_edac.c
EDAC-I3000 status: Orphan

You can save your energy doing fixes for it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
