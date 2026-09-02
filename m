Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3247CC99;
	Wed,  2 Sep 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350786; cv=none; b=F3zsL5+RgwSHYdak4puM+IexwKYjky4WAzyXxo4cf5W+jhDltaQkXvOPgrwX6cYr6G1uJEHgwsC1lohJmPo1JHaLo0pdD1Yz5XT8ejOrfgmcYAGxoK7k7r3siWRHWYHksaybdDhZSzOR/aXKbVC15SkRtLBkfiZVRaIcrTE3DHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350786; c=relaxed/simple;
	bh=xs9bjvvOt6oGhHLtmqfCpEIeN2LYlqBLb0R+6rLJv9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcfylfXznmIl5qfqxlRdjlCZUzY4YKKhziliwSsxb3h6Xe3kO1Zi9JBuyhgutRncJc+czGd1q+tIjOmChPd9u2blgCdTJiur9tyFb4hrg3wEeRQg9g7cKKXP4JZBjBHn8n6JztE0SAh8SpDoUdJIvj0l4VZQSL5beVzxmAR5RUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gsb55AJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsb55AJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFAF1F00A3A;
	Wed,  2 Sep 2026 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350774;
	bh=h6jI+2pEuVnTlqYVcD3a2kQzHMNf+Qllh+Pp0JldYqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gsb55AJzT2NqHLtuANiNbhQd9yMJEXyXAUyVfsc/W3HaUvBD+9qGYAIvk2L55D7gx
	 huyS7BEzquV8lNzKxBzwRNOPHC1XRJH3frANb/jFGNEC/2FQBn7zMtQBiMdPKPQi6O
	 zYN8i34Sp/cuLE+DOrP/hANGdBNLumqJnHiJb+5JcuqVarkuC2nZS/VB+1maq5lk2h
	 H2MZRKGj2nxCb7oExBO6g3jdS2s9fTxhUztcDndkDlAcZbhdTm9iU0T/3USqVH2dO9
	 lvoF3mMFGeV7FL0JKEN6h9/veIQHOT35zwSqnlqAoca/NcMjUxZd0JpTQqUuqoSW2J
	 /IX2wtKOMEzQQ==
Date: Wed, 2 Sep 2026 15:06:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <apgRMUMN6DVFmJ8u@kernel.org>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apf4WaZ8D0P6W-FX@sirena.org.uk>

On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   mm/secretmem.c
> 
> between commits:
> 
>   0d171c47f2be6 ("mm/secretmem: properly account locked pages")
>   a31a4988ca3e8 ("set_memory: add number of pages parameter to set_direct_map APIs")
> 
> from the mm,mm-fixes tree and commit:
> 
>   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")
> 
> from the mm-nonmm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, Mark!
 
-- 
Sincerely yours,
Mike.
