Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6824E1C87
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365131; cv=none; b=QvO7NZCn7vWIO7FlkKB33ARXGoizTxH4rug127T8+orOesKAX+s3ydDkzTW59lYlHNsFJOwR+aA2GzUF3TMWKol5yvrTtsbR2tdkTk5m/nDnLQPhp/zObxm3EMZQTNgZPd+4oW025fY2/VUhyVtD/sVZpOIi58dF7S74xT3Vr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365131; c=relaxed/simple;
	bh=4ANHKnRqtCKPjwILV72OTxZrPCO5cIUXS9e531EzIu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0BQdyif7S2WtdmxDaPNDz9teX+ENchqJ1I6yHDy+IGnzYqkMY+DHKu3nj15DjvExhW4GwIEoa8g0MS9Sgf2zZP+iPQekNl/g/VzxuqB4QwcOruwYb1GHDFU9i4l3gl2j1z9OuXfSG2UzqAB3v9XyPxNvAXwkektuzTfJ40apoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VkAqExSG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VkAqExSG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+2/3P/ncvXaLVl7KGX2gZTIQey7db7s4qj3v0yId24U=; b=VkAqExSGdwwYS7RFpcA/cRi79R
	YQbWo+0cBIgoiUR8+9o9npEctmtZ+cJGQ2l7QoLyaT02A2YSOFp+Hf9biGjOq3iLYzj3n4Met/nzV
	a+kEr/qfNIHmc72spr+IxYDzThNc0UGlnlUSBOEOr7uusw3JbAHrQFT7Vm2Tjp/mQflS1ajaS/pwO
	cFbP/7sGaz4mxkzT2eEcBEfMTEgG9ZJxIAn5NyJ1GNucqrR6nNR4iMM7YWlF1XeHkRnRZ7MPo8wVT
	p8T9wPZk0+9/sWmZQkE4Jm0C8PV5KZ9xxoYYv+cOJMU2nyT548trWbYvRPGSWgFCPVzJXxaHloAt5
	4racxzMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABkU-000000099jO-08nr;
	Fri, 25 Sep 2026 19:38:22 +0000
Date: Fri, 25 Sep 2026 20:38:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
	artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com,
	david@kernel.org, Liam.Howlett@oracle.com, edumazet@google.com,
	harry.yoo@oracle.com, hramamurthy@google.com, ivgorbunov@me.com,
	joshwash@google.com, kirill@shutemov.name,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
	pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
	torvalds@linuxfoundation.org, vbabka@suse.cz, yuzhao@google.com,
	ziy@nvidia.com
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
Message-ID: <arbNrVX20f2WDJjO@casper.infradead.org>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>

On Sat, Sep 12, 2026 at 10:50:10PM +0300, Ilya Gladyshev wrote:
> This patch reallocates the refcount value range:
> 
> (1) refcount < 0 means dead refcount (uninit / frozen)
> (2) refcount = 0 allowed only as a temporary state (see below)
> (3) refcount > 0 is a regular reference count
> 
> In other words, refcount is now split into "dead bit" and a 31-bit
> counter.

It seems to me that refcount overflow is now a problem.

We can deliberately increase the refcount on a page by stuffing it into
a pipe.  Over and over again.  See merge commit 6b3a70773630 and the four
commits on that branch: f958d7b528b1 88b1a17dfc3e 8fde12ca79af 15fab63e1e57

Unfortunately, I think the discussion that led to those commits was
conducted off-list because security.  I wish we had a way to declassify
thse emails after the fact.

> +/* Most significant bit in page refcount */
> +#define PAGEREF_FROZEN_BIT BIT(31)
> +
> +/* Page reference counter can be in 3 logical states,
> + * which are described below with their value representation
> + *        state              |         value
> + * (1)  safe with  owners    |   1...INT_MAX
> + * (2)  safe with no owners  |         0
> + * (3)  frozen               |  INT_MIN....-1

I think we need four states.  The first two are the same.

(3) frozen: 			0xc000'0000 - 0xffff'ffff
(4) temporarily overflown:	0x8000'0000 - 0xbfff'ffff

(we don't really need that much space for temporary overflow; we could
have something like 0x8100'0000 as the boundary if that works out better)

>  static inline bool __page_count_is_frozen(int count)
>  {
> -	return count == 0;
> +	return count & PAGEREF_FROZEN_BIT;

This probably becomes '(unsigned)count >> 30 == 3'.  If we choose a
different boundary then something like (unsigned)count >> 24 >= 0x81.

>  static inline int page_ref_count(const struct page *page)
>  {
> -	return atomic_read(&page->_refcount);
> +	int val = atomic_read(&page->_refcount);
> +
> +	if (unlikely(val & PAGEREF_FROZEN_BIT))
> +		return 0;

... use __page_count_is_frozen() here?

and you need to adjust folio_ref_zero_or_close_to_overflow().
try_get_page() can stay as it is.

(Thanks to Pedro for asking me annoying questions about mapcount
overflow which prompted me to look at this again)
