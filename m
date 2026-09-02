Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7E483806;
	Wed,  2 Sep 2026 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350836; cv=none; b=V3XirNhzPd6+RpKxVsPq5ac0RB7crrlF/Xu4AfCIJDoKJIeCeSz0mUDR7V/BQhAjmQkLiskq/6Hwq9SsP5E2j3+YI5BONGcorgTlA0751/8EHVk+x9UhrfLaAZAyFCSFtA1eTyusmu5r8X7ZBtUvTBCH5gID8pjZv8l0osm+RCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350836; c=relaxed/simple;
	bh=eo20NXsokeOVNi4bzjTPLmC8UsSWkvEfNu6JVDhocc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQGmi5iF4u0n6UQ2dxmyqAoe6mimPSEjv12FekU4ShGW7eusWdG8SBWf2mnisZfx/v5sLUWwhlOIHOqdfL3CyIkx8aXCyvtBXRwbdWqGWj/0WBbd1/sM2lwPnl+E7W+obNSvydNsTPUrRu2hD8FI1NXf6VJx7T6/doDcHWHigCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFSwvTWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFSwvTWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B81F000E9;
	Wed,  2 Sep 2026 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350813;
	bh=lhxLYWDVF46E2X4TTKJ0yOsFaUzEL30qbTiLjDr85gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFSwvTWeLKUk4K51Q0QYMfXQ+xgTDg/YRycDJeZsVQycK14mHOp78APwSSUe6DRsS
	 s1J/HBgdJ1Wb4jl2//MhKBNQtZ6F4oHymbpXweQcMYZKIIb3yfLDhjPo0Jk+xLrUD1
	 bfTvdpjkoTmANiNZyWbCdJGVb+RPKUoKIfksZ7we6tKfuo1ShDfOk9DOyWOt6VMj5q
	 q5rVfjyweBLnGflsZrFAgcoDrNBf878XulEJ4E9XS7dRYRoLCw9vywe6qHgQHuzrBp
	 m4vtI6vFDK1tuZFHc93hr2GcZleJI/IebblQCUtaM1rGo3SNKMK9xgnkQ+gJXIwtfb
	 0pNMUa/1gRwqw==
Date: Wed, 2 Sep 2026 15:06:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <apgRWNxxf2AwTZWl@kernel.org>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
 <apgEi1GacpI4T5m2@gremlin>
 <0ba3c22c-e9bb-4a3f-b5c3-63e00a5396ee@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ba3c22c-e9bb-4a3f-b5c3-63e00a5396ee@sirena.org.uk>

On Wed, Sep 02, 2026 at 12:19:30PM +0100, Mark Brown wrote:
> On Wed, Sep 02, 2026 at 12:12:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:
> 
> > > between commits:
> > >
> > >   0d171c47f2be6 ("mm/secretmem: properly account locked pages")
> 
> > > from the mm,mm-fixes tree and commit:
> > >
> > >   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")
> > >
> > > from the mm-nonmm-unstable tree.
> 
> > LGTM, thanks!
> 
> BTW note the above duplicate commits.

This is a transition artifact :)

-- 
Sincerely yours,
Mike.
