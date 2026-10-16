Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23C539782
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169826; cv=none; b=Xsj4FcnvFp8735e2AfZqU4+m8hdIJN3Dn6M2HEWW0Si/u4lJAhpS1jvgpdcndm22rsUgKkvxKlbgWUP2gLkzX70dfWrn1nAFQ2gWdt2f8heaKPrCVNek7jyOZc94HrlCRpY9vFQMm4MET+UV1mDsa8nZieZwvW6cPiY1tVNBu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169826; c=relaxed/simple;
	bh=bBkmz7uE0yLaR97Ryy9rJ7gKZAvFQe/0tueYrYgEy9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjuLP9H6ndWp9kBDTIMAZ5tCSPUVV5M91DcEdygdOl4BFo3G4bD7UeSm4hbNTxRdxxHnpia9eGpBZH+fHh5b/7/k2rAIkNm8T2VgsyxR+WU0/Y6b1i9APVAWjq/FQt+RDRGeNVhbO6MqqXkjw+r3yDa1x22xplvw38k9kWTMUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZdt5w6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZdt5w6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D251F000C7;
	Fri, 16 Oct 2026 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792169825;
	bh=mB1lyDJtxnoLmeurhPWzLVLDYob9XndoNmsaP9fWeJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZdt5w6p84jWf0riEkOHuE+a1YOcGugk9zO9Qs04Z0U5I3Gy9Tlqyafp0CiDc58mW
	 aJ34Xu6nFizWsQTooGld+Csg88R63a+GiODdERTP+MWl3vTh8fhFcF96JImhNAbKuE
	 Nhv41ulBpmHzkY6GoAgF2n/S2Sb0O6J1Pu8mE95mYExYmLTjaPDUFip60WJZh8D0H4
	 40EDBIE899wHulZOncMsz20d5rEv4/ia+q7VIJh3MsVNeT91YK+oOM3shKJ+1ty8Rg
	 GZ9ZvYzJ8hobHy4U0qOza4HqXWYL5a5WZlSsZTB2XD3PTRMSvVaEJ+73PD2IyGJCnd
	 VNqIePe69G4wA==
Date: Fri, 16 Oct 2026 10:57:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <atJXYHJa4jkUWJmP@kbusch-mbp>
References: <20261016141208.2641974-1-e.velu@criteo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016141208.2641974-1-e.velu@criteo.com>

On Fri, Oct 16, 2026 at 04:12:08PM +0200, Erwan Velu wrote:
>   job                   | cache   |   IOPS | fsync avg | flushes |  gain
>   ----------------------+---------+--------+-----------+---------+------
>   psync buffered, QD1   | back    |   3885 |   247.6us |  116552 |
>                         | through |  48325 |    15.7us |       0 | x12.4
>   ----------------------+---------+--------+-----------+---------+------
>   io_uring direct, QD1  | back    |   3886 |   238.2us |  116593 |
>                         | through |  41924 |     5.7us |       0 | x10.8
>   ----------------------+---------+--------+-----------+---------+------
>   io_uring direct, QD32 | back    |   5088 |  6173.5us |  117793 |
>                         | through | 140196 |   107.0us |       0 | x27.6
> 
> From NVMe 1.4c (sections 5.21.1.6 and 6.8) up to the NVMe Base
> Specification 2.4 (sections 5.2.30.1.4 and 7.2), a Flush command has no
> effect if the volatile write cache is not enabled.

Yeah, the NVMe Flush operation should be a no-op in the device, so the
dramatic performance difference is a bit alarming. Surely the block
stack's flush machinery is not the reason for the difference, right?

If the device's flush handling is this bad when VWC is disabled, what
happens when you have it enabled? Can you re-run the same test with that
setting?

I'm not necessarily against what you're proposing here, but your numbers
are unexpected.
