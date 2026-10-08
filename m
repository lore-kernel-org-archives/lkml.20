Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCC49362D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453875; cv=none; b=nmFZb/tcEoZ2kkzxkH9eUvE3h0AbriNThMdGJHZKIhykGm8WjtINeAItrLrl2YnJmSmDielA2Z8tsMzDL/DnzBGurJ2ZI3svP9YLgZoCCfc37x+YA2sGGrWc9G/oJFvty7tsm90MNghEHJtFNzWHhumjudQjCH7ZoXmteFClBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453875; c=relaxed/simple;
	bh=SPYzrbasOBn6GBXNXbxi/l1WIooFib07Dz6Lvtf/L78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNu9jN4k/H4I6FptbZUIXVeiaTdqZPHX9rvcN3+9aUhOzDzHjy+c7Q6tmvl9PFel5ocesDe0aXDLPAEb1MegTMam93o/uhlzz2bnHzXILxEbmxZ1NrHSxr3ty9JQtHQoHZlqKOR9iONC3pOjwjuRrytUKGHV/DIDFBUo1dr8yu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 346F668AFE; Thu,  8 Oct 2026 12:04:26 +0200 (CEST)
Date: Thu, 8 Oct 2026 12:04:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 0/2] mm/zswap: batch the writeback IO
Message-ID: <20261008100425.GA11357@lst.de>
References: <20261007153507.50715-1-alex@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007153507.50715-1-alex@ghiti.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Oct 07, 2026 at 05:34:42PM +0200, Alexandre Ghiti wrote:
> Since commit 8f29aa226f82 ("mm/swap: introduce struct swap_io_ctx"),
> reclaim merges the swap writes of folios with consecutive slots into a
> single bio, but zswap writeback still issues one IO per entry. Patch 1
> makes each zswap LRU walk batch its writeback IO. Patch 2 plugs the
> walk, so that the block layer can merge what the batch cannot.

No a zswap expert, but from the high-level perspective this looks
great.

