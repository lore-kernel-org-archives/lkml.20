Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304710;
	b=mnejCQGkyzB7/Z9nRFGTgz7pG76UCmeUdHLc1aamc7HTh9AZFnpbi6nf+WKx4RyPAQ5y
	 COBkituIwbT/oPv/w0xBI/y779puRP3SCCflBty+NJLLXJsZx0E8e71rXD+GG6gOePqCh
	 RUGNbXF0JP4+pkGZqtPaQxYcsILgOmn8Fl3jTX/AQ/7HIrDWNTo30VRPrULClORsD1BO+
	 bSJOIsjIoVlpJ0vfHEFGtPN7MDf/IqWZXl/Z+ib65KsbUoIAxbSHeDz4BG6CXK2UIDyps
	 D/+/RfOYkONTghlqKlnO8tgljavTpohkNBa3jl1VacuV44RGNjPUruzdWSbR8aMuyhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304710;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TlKmrMqubWGcutwYU1eLJxZAztftwteeVflHLwgBZxU=;
	b=XtiR6bphGulQLusD5LWYr+EDOmdUZ42D4QjrBzMARC758oe9o5PB/LG/fbtuEPlMMZLa
	 1fEiEsm0QlDDd5Bt1/YwWt8XDhM44OEBIVbRPaZhLH4U3LP7JJDA8UgZJNxTxF7dtUvef
	 udOAJNKMaEAHmWWThT9nhwGV9mI/DVCIb85nV2onKZoFK+hKF77/DBNvs7IUAzb6wb0Vu
	 PJKloaGW2QClD+CepzOiGCDhy4aWdg8scSqavODlyA+eVAoQ2K28RF7H8/zhar16h/XFr
	 Ky+uaBlsZ0DfA3RiEwgbzco3WSOstuPz4K5cB3B9jQ0B5sZqfXSHzdXXOp9FZX9lyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kf1SQrmK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C8E606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C8E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kf1SQrmK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EAD41516;
	Tue, 10 Nov 2026 01:58:26 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470B33F882;
	Tue, 10 Nov 2026 01:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794304709; bh=fl+3iIkJlZcywl1c+YGvuOIqwpFdKU76MjeZXGMEd7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kf1SQrmK1e0qc+QMHXjVSFZ+A5DZQ4BHKBMeWJR15j6j07DccroldNhyH+PwOr29/
	 75Ygl0XwQ8NuPANvbjMf40w1fDrvHwqV6kDFd9SkKHB+xEPzKCJBPfif5DMBglkVBV
	 q2BUtTcJqx1EkMpzURaTmwnXyUMMS8UuKX1rBcV4=
Date: Tue, 10 Nov 2026 09:58:24 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Rik van Riel <riel@surriel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
Message-ID: <avLqwIWHa5CAbHO2@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>

Hi Rik,

> On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> > This is preparatory patch to make gup_fast_pte_range() batchable.
> > 
> > Introduce gup_unshared_pages() to count consecutive pages within a
> > folio
> > that do not require unsharing, and use it to implement
> > gup_must_unshare().
> > 
> Could gup_exclusive_pages() be a better name?

Yes. This seems much better for me. I'll change it in next-spin.

> 
> The code all looks good, though.

Thanks!

> 
> > Also add a folio argument to gup_must_unshare() so callers can reuse
> > an
> > existing folio and avoid the compound_head() call implicit in
> > PageAnon().
> 
> Does that count as a functional change? ;)

Right. I think it would be better to remove below sentence.
> 
> > 
> > There is no functional change.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> Reviewed-by: Rik van Riel <riel@surriel.com>

Thanks! :)

-- 
Sincerely,
Yeoreum Yun
