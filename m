Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C94D179D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545407; cv=none; b=muCvFRltuKCJBCy4nGBumNAWe6Mf9/7XV2MbQZaW7v1T93MyDZHPA88L//S9ogJc93p/+qKxz0YGdrmadXKzY4XbJBqpEUoumF+5B02blG27jBT3eDUPXlqYCpcJMICa4RqLLp09pNXJjoRDrpt1r9nQIaEooZWU3qIIXPnDbH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545407; c=relaxed/simple;
	bh=iy4q9fYuwuvIGKCe7XdYXqcAN5Dor83AEgknEF3WNOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/ppXWRgFCsLzVtXlYrHiyfQjXY8xv08fSvIuNuRu95ndeexoZQNxN719mAgSEfhtW1OOIwbjZYm3iGoQQbu65yG8OmFkPOb3zyd8hWYM3VN3SNLEVz9Aqswc8jTXxsuNvFYO92eWEs4yEfONe0lH4AHSXGgfMoKqCuv9Sl9TWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/1GGXq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/1GGXq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FFA1F000FF;
	Fri,  9 Oct 2026 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791545398;
	bh=iy4q9fYuwuvIGKCe7XdYXqcAN5Dor83AEgknEF3WNOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/1GGXq9dDWhsGGVSPhOO0j4/mw3Fcd5071LUIq/IIdK0wJT15ls9ds0Udc1xXMKi
	 XIh5scCsG346Ny3fe1h2GLqz3D9Y7njVvsPyhr2pp55bL+/nQuHIfGAujMqjlEM54Y
	 t2FgLiTDlsitTB7WuAxcr3E13mX6FCVLbcvFiV6KnCSPl/9qHSq5VqC1MrV4kK5I/i
	 0HbeMsYWg5OHjmcYS+WHFjm0AeJGcrKTrd+TKxUBXzFCPOkkeuVVKDTnn8ymYLF2Ry
	 hAxvmSWbA2ss0+r1lySgr9l66xA+OuwohuEyuDKU3xxWg2ZFgQ5v7ZGh9+BjwsxJTV
	 g4kTv1QcinbHg==
Date: Fri, 9 Oct 2026 12:29:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vma: keep the unlinked VMA off the file across
 unmap on mmap hook failure
Message-ID: <asjP0A-59EN2xSsh@gremlin>
References: <20261007101800.58d50b1b20a10738e630bfd5@linux-foundation.org>
 <20261007194708.2009-1-okerixx@gmail.com>
 <20261007145329.dd944233d7986bc0f5b2d63c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007145329.dd944233d7986bc0f5b2d63c@linux-foundation.org>

-cc slopper.

Ack on there being a problem, will respin with correct fix.

--
Cheers, Lorenzo
