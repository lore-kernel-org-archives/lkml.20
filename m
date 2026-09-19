Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDD23A564
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796321; cv=none; b=dwVP7DpOIYAINlUGJQHQLm32t7AmdtaDVRsTnDR1cNAjdrzfP93iTvQICO8lWSmQTmAF4fnztrdoUYRYW3i6StQZPlAx1D26N9Ue8QTzzpVVEAUf1Ogt3dZ8aCYSb4Wtsmi/W4U21f+RJtmU+77G5kEzfb/o4VqbQk/K574QEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796321; c=relaxed/simple;
	bh=qFlN53gcyRs6QIJQMB295Rz0zEvqHZJc5Zy3Fn6Gusw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9qK5S7gSAAEhu/lnlzAaeavCbHvsZ7BTHlruH+zqAjOPi9iXAep1DVdRwRwcx0mz5kQ6JEfKBr80P2YXO5eS0bU+/cs5/wx0cFuz/Groc0RzhxmVbXJX2YbBeFjEb7qDC2Wb3Fn4M5yitlwr1hzmmr5rc/ev+t3wW08I59DeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=nXMmlJt/; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="nXMmlJt/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ENQeUofgSvdXsG20SUWKPC4j+he5hd9gfMYMd3+pFYM=; 
	b=nXMmlJt/yRy/p5gfjTs8ZIH6BkdvbOctDHQOIF2mQvcw2Ys6PGkjYi7s3VNUBirUgYPbdkD5AWl
	wZVudOLbbKXzdVJoqtySzfWEBknpSRLglUK7NTAfdN7O1nHV6aYIA9d8ervnZAmQuk6lhQaGkSFOz
	K5tw9z31f1MMl4g9un7GnHZiKwGHwsOVSjhF+6Pirk+Z4QuQ0kcGyigSoEp/w6rBuMTfvRJDZ6LgG
	DoJyiEnvaDTCi4tQ5q5KtLusWQAgq4HrY5A7L9FVx+/91px/lcDXl0s7aK8GxoJ5L4bCrbdhwVFgR
	NF/zyQ6/LapgD8qd+UcT+Sotn01W7yT+nlSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7nmB-0000000FeCb-3pqT;
	Sat, 19 Sep 2026 13:38:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 19 Sep 2026 15:38:15 +1000
Date: Sat, 19 Sep 2026 15:38:15 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Yosry Ahmed <yosry@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>,
	Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, hannes@cmpxchg.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev, ljs@kernel.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/zswap: flush dcache in the compressed decompression
 path
Message-ID: <aq4fxxoaX0jjUWUM@gondor.apana.org.au>
References: <CAO9r8zN4ig_GGP4a=NLZ9PUW+jFmSfY1yBLrkPA9azvDCrGSvQ@mail.gmail.com>
 <20260710184052.3614560-1-joshua.hahnjy@gmail.com>
 <CAO9r8zOuRFcYnLGUcRYyg9_nAk1TvCxUvV_0101msKL0Mx0P6A@mail.gmail.com>
 <133c3c19-22ae-4de5-98e0-6970b707bf37@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133c3c19-22ae-4de5-98e0-6970b707bf37@linux.dev>

On Sat, Jul 11, 2026 at 08:25:31AM +0800, Zenghui Yu wrote:
> [+Cc Herbert, in case you missed that]
> 
> On 7/11/26 2:43 AM, Yosry Ahmed wrote:
> > On Fri, Jul 10, 2026 at 11:40 AM Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> > >
> > > On Fri, 10 Jul 2026 11:22:43 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
> > >
> > > > On Fri, Jul 10, 2026 at 1:28 AM Song Hu <husong@kylinos.cn> wrote:
> > > > >
> > > > > Both branches of zswap_decompress() write the destination folio through a
> > > > > kernel mapping: the incompressible branch via kmap_local_folio() and the
> > > > > compressed branch via the crypto scatterwalk. Yet only the incompressible
> > > > > branch calls flush_dcache_folio(); the compressed branch was missed. On
> > > > > aliasing D-cache architectures this can leave stale cache lines visible to
> > > > > userland after a zswap load.
> > > >
> > > > Adding Herbert here.
> > > >
> > > > Doesn't the Crypto API take care of this for the decompression path?
> > > > Maybe in scomp_acomp_comp_decomp()?
> > >
> > > This is what I think too. Actually if you use something like
> > > zstd_decompress() as well, it ends up calling:
> > > acomp_walk_done_dst() --> scatterwalk_done_dst()
> > >                       --> __scatterwalk_flush_dcache_pages()
> > >                       --> flush_dcache_page()
> > > over all the pages in the loop.
> > >
> > > Maybe I'm missing a path here that would require us to manually flush
> > > from zswap? But even still, I think that should be handled by the
> > > path that is repsonsible for doing the actual decompression, not
> > > zswap.
> > >
> > > What do you think?
> > 
> > Yeah I am hoping Herbert will help us out here.

Sorry for the late response.  But yes the Crypto API will definitely
do a flush if the page was written to.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
