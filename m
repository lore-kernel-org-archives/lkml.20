Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34156E075
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171630; cv=none; b=B7DkHjTZvwrYkJniwG61vXAXCG5yEB1YgSXdtGSAWRfY5lp1dE8lVS/FBNLPxAiC236YNvZkgvpA4GGnS+Bt0gbAM+9B/FUaiE1UFyl882plXk4TbKu3Nre171Hl8RrsfNvAagXXfDNMLMdWAvIVw+kE1AwCO/BmA4np3S9jPoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171630; c=relaxed/simple;
	bh=M6y25uchHd3aFk6BqQyUpNdCKs6UPwOw3X1Wzcxltv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm8jQfhr81VemWjGIL0CIkN14YL2jIrh3ReQjbHOT+5839+LEGiI1SiioPzfXwsVjUSqisGWia1Dd70HEef1VBXggyaf0UlfwS6dahVrNbc1U77CNrYaF6zFEAFXMu6ifDc5Q/bfMDYL9ydpfT7uKhdF1XCTglzcFE0F5ts1Ud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnyCjP78; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnyCjP78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315231F000C5;
	Fri, 16 Oct 2026 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171629;
	bh=KBEGJr9zQZy95V5Zr1A1ig2Oaq2yE9CW2KUEvun7wpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KnyCjP78vlFuxveebZ9MofPRrsYmdol4uKYwfMmoiuiHuM+wbJ8/YceLl6b6b4r1s
	 XP59RMcjHLCO9sACz7vfhn0nAqdRgKm15yCQ1Oakt5D7Zy4w64V5ETAUN/JeNOe0uQ
	 KNMZCR/vVn4+BSVbHFGy3EqlEb+YKal89csVJTirWnfnBDxB/c8cAqX4SUEGigostS
	 ifGzr+0u/3HODTylWhsY4UmgLfx+TWMQr83gjwI5ihsnPNC/2oqlxtyMOos5yYHsnD
	 wrduJ4vdPCS5itMFeKxZvM2xSykFoY4tkVSWMOlI1BIzYAreDsUzXN0WwmK21W8D9C
	 i1Dok6Nf1el1g==
Date: Fri, 16 Oct 2026 11:27:07 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <atJeazM_rJ0uj3vt@kbusch-mbp>
References: <20261016141208.2641974-1-e.velu@criteo.com>
 <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>

On Fri, Oct 16, 2026 at 07:15:20PM +0200, Erwan Velu wrote:
> Le ven. 16 oct. 2026 à 18:57, Keith Busch <kbusch@kernel.org> a écrit :
> >
> > On Fri, Oct 16, 2026 at 04:12:08PM +0200, Erwan Velu wrote:
> > >   job                   | cache   |   IOPS | fsync avg | flushes |  gain
> > >   ----------------------+---------+--------+-----------+---------+------
> > >   psync buffered, QD1   | back    |   3885 |   247.6us |  116552 |
> > >                         | through |  48325 |    15.7us |       0 | x12.4
> > >   ----------------------+---------+--------+-----------+---------+------
> > >   io_uring direct, QD1  | back    |   3886 |   238.2us |  116593 |
> > >                         | through |  41924 |     5.7us |       0 | x10.8
> > >   ----------------------+---------+--------+-----------+---------+------
> > >   io_uring direct, QD32 | back    |   5088 |  6173.5us |  117793 |
> > >                         | through | 140196 |   107.0us |       0 | x27.6
> > >
> > > From NVMe 1.4c (sections 5.21.1.6 and 6.8) up to the NVMe Base
> > > Specification 2.4 (sections 5.2.30.1.4 and 7.2), a Flush command has no
> > > effect if the volatile write cache is not enabled.
> >
> > Yeah, the NVMe Flush operation should be a no-op in the device, so the
> > dramatic performance difference is a bit alarming. Surely the block
> > stack's flush machinery is not the reason for the difference, right?
> >
> > If the device's flush handling is this bad when VWC is disabled, what
> > happens when you have it enabled? Can you re-run the same test with that
> > setting?
> >
> > I'm not necessarily against what you're proposing here, but your numbers
> > are unexpected.
> 
> Maybe my table here isn't probably clear enough.
> The numbers shown in the  "write back" mode were done with VWC enabled.

But you said the table came from tests "with WCE cleared" in the VWC
feature. ?
