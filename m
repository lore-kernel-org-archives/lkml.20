Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF83932E6;
	Sat, 10 Oct 2026 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626493; cv=none; b=qbkm8S5YukASPJayhRZXTlCJC2EYYe4mHEpYvpBnbVvGEUhaI9yv9ok+LslyfGvzWqaXEuXqhHwPAEFwlyE3VUMhmprW/EHkLj78dzAXBHknRWlgdGGN+AlPgN2o9NgXYfQW1gFPK+ezDWclAxvol94TyXz9GtNUbtbud8pRfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626493; c=relaxed/simple;
	bh=ZYRlipbPY8RAWD8fBo6czk6TDpS55BrQGDnKoUlam78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CA/1qkj7ltZ6lIQsQYxSrrgQSv+20zrqfRsog6lmLnSFBHde7Oz8P4LTs59ei0DLL3pGHsahvRsZ6S62yp8gWb1MlrPJnxNfC1zpLTi6jfMJVtDbqfr/bMUpbEpJai2kTcvGbshS69K1IbtCH2rVa8DFPrJi78tnlp/pF7Oz4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXv0u/LL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXv0u/LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3A51F000FF;
	Sat, 10 Oct 2026 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626492;
	bh=yxghfkk9ZcOzzHrH4POV+dHpr3b3+ZDhOKp5XX6zWMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CXv0u/LLebHMF6g/2GK3TvCGBelT7PPH0HIRnflCf6AZ0lVwkZgTWwxvuQI+s9qMo
	 ft7jV7D8Qxva2ItzH/MkbLDHDEbO0hANLYn5fxEXZ55ukUHdB0mGreeyNQb0gRBVoX
	 GvDcmGzAlIjOGHFlErUh2IZlaV8eljjni7igTE2vwGw9kUGtTtHVU7D7lYZifyzzve
	 4z5Diw9TikIM7l4mmswNF7YEcDdBlTEZfcWirr61J0mPjYl9O4asyE/fZMh9ABnACS
	 hQuaEnLI0zSjN74PdduIr5wdHA9UxKRrDlhcwOf6tR/zJArMSWXwVbnieyTVkKv2i+
	 bB5D41vN0Gm3w==
Date: Sat, 10 Oct 2026 12:01:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
Message-ID: <asoM9sKML-7BIEOY@kernel.org>
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
 <CGME20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea@eucas1p1.samsung.com>
 <20261008094125.3197971-3-m.szyprowski@samsung.com>
 <20261008140515.GB183998-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008140515.GB183998-robh@kernel.org>

On Thu, Oct 08, 2026 at 09:05:15AM -0500, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 11:41:23AM +0200, Marek Szyprowski wrote:
> > Get rid of the static, limited-size reserved_mem array and replace it
> > with array allocated by memblock_alloc_raw() and accessed through a
> > temporary early_memremap() mapping. Such mapping is needed for some
> > architectures (like ARM64), where linear map is not yet available during
> > early boot scan. Having a single, writeable array with all reserved
> > regions removes the need to perform two step initialization introduced
> > by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
> > memory regions are processed"), so all regions can be processed
> > directly during the early scan again.
> > 
> > Suggested-by: Mike Rapoport <rppt@kernel.org>
> > Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> > Assisted-By: Claude Opus 5.5 <noreply@anthropic.com>
> 
> Assisted-by: LLM
> 
> is the new way...

Probably not any more :)

https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/of/fdt.c             |   3 -
> >  drivers/of/of_private.h      |   2 -
> >  drivers/of/of_reserved_mem.c | 251 ++++++++++++++---------------------
> >  3 files changed, 96 insertions(+), 160 deletions(-)

-- 
Sincerely yours,
Mike.
