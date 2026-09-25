Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0E391E54;
	Fri, 25 Sep 2026 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348656; cv=none; b=KliyyRa325yFFEpAwGPllOaho9tYRwBmuEHAIELaienpvS6QLlr3odjPznFiIPt4xRdOuSOaKSkUKWHgb9IsUkiDunM9sCIVY1tn9mDfjZ2QVxQSznAbdKSONR02nuRK1wVgzAAGDXfztMuAij1jcNMV8P2GeuMX6KwO8OoQlnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348656; c=relaxed/simple;
	bh=NFO2IrDj51OkYh6rZEo9PN1EJTr9OcjgBR74qqKvmZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI1YbS4sGqmFny9WEUXBBSouyJyMkMNuIDAh2mCCO4GqXUKLbbRy3QZZoU0J2Z7wDat1bcCDNlci0rgKv2Wsr20joXcpN1916Ec4o5t6OubhkMmaUuha7P6UBir8hw5SQw8VC/vqvlgF6UWHYlLk49HZFPjUjCKNuv+51LSjj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVPJUkGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVPJUkGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1531F000FF;
	Fri, 25 Sep 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348644;
	bh=l2SDWCsHYFrvIREGP6cx9hyzH4stUb0S6c0BY2sWpDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kVPJUkGTlWahtyA1YCJ26vKU1mSrF4CSF/uN3ZhqdW+7tU0OR27sSsLW06T1px1Ws
	 zEnrQWYpR1X4Ty1zGp3+NlKSCQfBEHhOtpW2/LmNSbklUNsvQ4dwQS3jRSO7zUkr8Y
	 A3Sx0Sza7k9boZJOvF3zFe3oYydDlU7LLSwp37mJ6xjGtTU1L2MnxVnUY2FDMeWnic
	 IlRiAUpjlrcLRhkoJ2FsqP8/pgHDAaTliPTbSVfhXGeoKEhfYKGj6QmHlgWE2AuNZs
	 wpHwwxaWP2/u0IoDsLuqFkSzYD3d2wzmSbMbILcaqq0LDb1kXnz1rr0t7pZlMyhjug
	 LW6P6Ucdnej2Q==
Date: Fri, 25 Sep 2026 17:03:58 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
 <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>

On Fri, Sep 25, 2026 at 02:11:28PM +0100, Mark Brown wrote:
> On Fri, Sep 25, 2026 at 02:26:25PM +0200, Carlos Maiolino wrote:
> > On Thu, Sep 24, 2026 at 01:09:09PM +0100, Mark Brown wrote:
> 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> 
> > Do you mean non-trivial conflicts with linux-next? I always attempt a
> 
> With other trees in linux-next.
> 
> > merge against Linus's tree before sending a pull-request to check and
> > annotate any possible conflict, but I have never done that for
> > linux-next. I can do that, no problems. Where should I send a
> > notification to? linux-next@vger?
> 
> If there's anything interesting it can be helpful for me to get a heads
> up on the resolution but the main thing (and half the point of having
> -next) is to coordinate with other trees that you're colliding with.
> You don't specifically need to check, I'll tell you if I notice
> something, but OTOH if you know your work is going to be colliding with
> someone else's it's good to coordinate.

Ok, that sounds fair Mark. I honestly didn't expect this patch to
collide with Andrew's tree. The submitter sent both of them initially,
Andrew picked one, and I asked the submitter to send the second one
individually for me to pick up. But I didn't expect it to cause a
collision. Next time it happens I'll try to keep an eye on the ending
result.
