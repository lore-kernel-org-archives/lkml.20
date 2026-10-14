Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE0542EFB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991730; cv=none; b=ZjAvk45OuxTwqX8BZoL0sNwrJXdX7Z7rTrEcaLAiKBaiHjbZJ43DlSjOi44Dmda110p6T919XPwM8Vs8e9lG0h5OWSwMuv96ilcRjasZWvvmpl+4XnOEaFgndXeokrea/ZOXLlZz/vX9GnkzXWZ85aAUU0zyBmMlfq4pCuPLty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991730; c=relaxed/simple;
	bh=rjpjGrmMDsdvGx+90ZWQS9NKc8VdfGtg6fK/DBT1G2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1G45qOmuw2JbUlza8Yfp0QqkHgmFye6pYWO7Qcv5xp5DVnorRvJsdNyLvSlEsZDh1MnTkHDo4dzWvAUxP+ayh0qGiv6I5WkGOdPuNyt2ckeOqBeXAPja0Yl0GgYjzuTClyVSrHWD8pbQsq9doZsXseiRSH2aDeIRTFx9/K4xqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HkaTxe82; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HkaTxe82"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t7CoEsDiQ1jsv+tlhphmD5A0y/E12bIMAu8++omEJbs=; b=HkaTxe82hu/bFQSTbhRkxjiCdg
	wjyuZNDWtmdTLnSjkttC3dT0SQtUvsPIWo/kKFs7Cc/Tl4o0PWlXvyPU6hwB+niy++R12oPEDZ49H
	fUlpIflEtj6ZgWkt45p/BlmRmY1Qawvk1qdmv0KFtJsCxMBkUhyzQoTOhTbcxBj+tZLkFYI8dOPBV
	YXArFtljlcMFUYLEOi3HpHl4jYsFHtIkYElhiHDU+Li6NCaVU6YimndrXML15zdWILcEY9xNCO7T8
	KVJutzjpSEPyftDW660jptFrUWhUd5a3fSqj0vwQpr18Gf/ceFxgG+W1hYHT2M6HWP8Md0YvZCp1/
	GDeIQ0Kw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0uJ-00000004ndB-0BKr;
	Wed, 14 Oct 2026 15:28:43 +0000
Date: Wed, 14 Oct 2026 16:28:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as-fqjiGj5T5NLOe@casper.infradead.org>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6vBoWQGglxXxb0@thinkstation>
 <CAHk-=wiCe2H33izZHDyDHEhcFwUr9fXZk27-WZ2vn_pn5FcZTg@mail.gmail.com>
 <as9rk-T5cedl8Myq@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as9rk-T5cedl8Myq@thinkstation>

On Wed, Oct 14, 2026 at 12:53:11PM +0100, Kiryl Shutsemau wrote:
> The uptodate check in filemap_read_rcu_can_copy() has to stay, though.
> The flag only says the folio was uptodate when it was marked. Some
> filesystems clear PG_uptodate on a folio that stays in the page cache,
> and that can happen after the folio got the flag.

Those filesystems are buggy.  We have assertions that the uptodate flag
is set on folios mapped into userspace, and filesystems going arund
clearing the uptodate bit will cause problems.  It's something I'm
working on removing, but since it's all connected to writeback errors,
it takes a lot of arguing with each filesystem maintainer.
