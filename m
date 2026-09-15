Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3EF4B5157
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490904; cv=none; b=S3MgcK9ikDwgZvr0XZ92t0pcOCecF1M6FyVDUF2uBYStZhKAAAXBX+WqXYxfggSofjTMsdEyCgZZKEoCCouyiHwcgcOG5B+D06EEArR7Xbq1aJZEBwWs7xAqMjkVg59NQk7gfMNIBTul+f6nLcUJDLt0KQo2J577n8i/QaxmRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490904; c=relaxed/simple;
	bh=bX4qGPMXmxmQBQZYzycIlSecuAz/rQb829JPRPe8vcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfca4Gfd0TODtJSsX9suL+rF7bj90LFM2cIcavCDf0Omyjye5XXLqL70h0EbmBpPI9VM1XiD/12Z0pS/roz5L2kbGYP7f+usBYDeIlS6/UOEHHW9c2LjABch+z8DZ4md3EU6uZH7Pji8eGq5k396zRrOb9LYu19CFKlS8n4YnR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aIbYHpJG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aIbYHpJG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m/OpHS/VYS6UfWrtjjB6vKPQV7tSQbNLb+wW+QN6Edk=; b=aIbYHpJGCQkkbgGlUtWFgExpqj
	PJrQf4ZvK2dk0OZG+FgkzeZpqZ/cIaOmpgQRCq9sJGwaYqDShE5UTnQm3hnWk6dZt6YFqHXptJ1um
	a0WOZOTCRnbVD9Z78zMiyvQ7+eG8/9Rph3AbcAMlYLenreGSkMFDjho8Ky1c9ugprtbDwDm/OJbZB
	jNwXGVp49GmIOgAz4+8JQKNYyD5IgU5VW1mcwKrNzna64KWstzp8CUKEIM+hnVkVOlb40YRYEEHmw
	c4SHQZRydjemUgcObL8pU8VdTCn/aBOuLBH8UI+37skTt5HehLAmRK1OkDkhqXHNUOpS4HLH6RZEV
	o8BgDnaA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WK8-0000000Gg0s-3PXt;
	Tue, 15 Sep 2026 16:48:00 +0000
Date: Tue, 15 Sep 2026 17:48:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] mm/ksm: merge-path cleanups and folio conversion
Message-ID: <aql2wPergPKdfzU8@casper.infradead.org>
References: <20260915151236.5200-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915151236.5200-1-xialonglong2025@163.com>

On Tue, Sep 15, 2026 at 11:12:14PM +0800, Longlong Xia wrote:
> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> Clean up KSM's scan helpers, advisor naming and sysfs formatting, then
> pass folios through the merge path and update the related comments.

I'm not an expert in KSM, but it's not clear to me whether KSM should be
working in folios or pages.  That's why I stopped where I did, in the
hope that somebody with expertise would step in.  You have 17 commits
to Linux, one in KSM, so I'm not convinced you have relevant expertise.

