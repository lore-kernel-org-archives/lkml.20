Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085F4503E1;
	Fri, 16 Oct 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153495; cv=none; b=YauwGVp4cOspzhr99pDdKLuWnlyooiFjTTZIRLaRNbZrQzPld3HcqoDBq9gtNYEm1NGG1oLepEgjZ8Ah0U/ft27LYn1610nYcglYQnWh8O2m1Z8PQj681WNDWfEOZCPLImaZn7RJuL5oH0XfTbFeyJycEWBj9TY2y82BDIpLMtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153495; c=relaxed/simple;
	bh=bVpx+qqOd68LLKQas1MU9Jy8YiIbPbae1OqCwYjUiyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFdT9mI4q9TBF9ZYW6li6RlWCVQNJRaIJ2Onu2h/wxP/lUEWTu0qW23nj5w2A9Lj1ExlRHP6h5fbysV1UmRDI5s0irwvyfyCVKS9h/arRoci4xRkBN67bMvZ94pCqOu5EhwkKE0Tevjkqw0PQxFomsHHkSJWhQyX+UF9+F8MBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8F94168C4E; Fri, 16 Oct 2026 14:24:48 +0200 (CEST)
Date: Fri, 16 Oct 2026 14:24:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	John Garry <john.garry@linux.dev>, Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: linux-next: manual merge of the block tree with the
 dma-mapping tree
Message-ID: <20261016122448.GA3555@lst.de>
References: <atIV_5MZCayGDCSz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIV_5MZCayGDCSz@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 16, 2026 at 01:18:07PM +0100, Mark Brown wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yeah, basically take the block tree version and do the rename in the
dma-mapping tree.  This is probably easier to merge at this "intent"
level than down on the per-line level.

