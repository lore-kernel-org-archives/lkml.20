Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0D4FDE50
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165306; cv=none; b=Zovv/fqFYURH238YfbXeNdCM5Je5W9KE65zKQTWbRMizNNuSFGHV6i4fMN+tde6owlihC/2XoM8MqHfbyqdox1vDlhsH174NNDAhgfRXgQA0o6IHZP62rpADmKv/4liD3FMXwxWAib/tVOFCVJAb3MjUaSNcqLnGldwyTRWIHzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165306; c=relaxed/simple;
	bh=lQdNO9ASIMt190LNwk3gfFdUkFysuLWeoiSEXfgy8Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klX9iPGT6336caR7dCLZqF8roksPh5fOairFE3JkLp0ytQL9h0JojlIE3FdkVAOzbjdek5KAoIZCNnvm+LO72wBNJHh62oIIq0/RDJCMG1VK66/lWRs/Pi+vxPB2COsAC5jV/uFJLlwsrIdRjh3H9NzysQxU5TtCJhc8SrGMdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU+O+S8w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU+O+S8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DFE1F000C4;
	Fri, 16 Oct 2026 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792165303;
	bh=NxH6DkhqLCrufeYTYEwrZTsGvgraVA141qi17FQA5/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eU+O+S8wgpGDtS96N4yUHFCa7f5OCOrTgJsoWlvmwEgFyXteoj0TjQGZIBzuBsEet
	 5+SIRDkZ5wUSpaEO40q8tFjQ0lHT5T8CYYbvT5pLfVjsnyYcSY9o5kFEgr9Yf7WD/y
	 4clKaDRRqpSOOBJgIOPOtP8pRM/1bID1pa6TfZ8rU9TLpGNDKOxKVOLzwXeIQ7g4nP
	 Rq/43UNiOvGAKfBYO0J0w2Fdcw9HTwLQNzVbkl6yvr/J9eud5z3NNu9aACbmEkFSqu
	 d8ymw1M4F/g7BXheoUDFhHda1Dcp9wuIs2DAshof3eW6pFGssek1/aTOf1iEYkPyZ7
	 fSvTuEazNprPA==
Date: Fri, 16 Oct 2026 15:41:41 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <atJFtYbWKpL2qQ-a@google.com>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
 <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
 <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
 <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
 <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>
 <atA2g8OgpiNOiVL_@google.com>
 <atI30-1q2iEFPEbR@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI30-1q2iEFPEbR@thinkstation>

On 10/16, Kiryl Shutsemau wrote:
> On Thu, Oct 15, 2026 at 02:12:19AM +0000, Jaegeuk Kim wrote:
> > Indeed, it's a bug that user can see zeros between F2FS_IOC_START_ATOMIC_REPLACE
> > and F2FS_IOC_COMMIT_ATOMIC_WRITE. I think we need to move the truncation path
> > into the commit phase and use truncate_inode_pages() instead.
> 
> What about f2fs_abort_atomic_write(inode, true)?
> 
> It calls truncate_inode_pages_final() as well. As far as I can see, it
> runs on the last writer's close (f2fs_release_file()), on flush when the
> atomic writer exits (f2fs_file_flush()), from
> F2FS_IOC_ABORT_ATOMIC_WRITE and when F2FS_IOC_COMMIT_ATOMIC_WRITE fails.
> 
> Can other processes still have the file open at those points?
> 
> AS_EXITING is never cleared. Does the inode then stay "exiting" until
> it is evicted? If so, reclaim stops leaving shadow entries for the file,
> and with the rcu-free series a hot folio of it could be freed without a
> grace period while a reader still has the file open.
> 
> Would truncate_inode_pages() work for the abort path too?

Yup, we revisited all the cases and the fix is coming.
https://lore.kernel.org/lkml/20261015161714.1586334-1-daeho43@gmail.com/

Regarding the truncated page access during the transaction, we reached out a
conclusion that the user land provides a synchronization method to prevent it.
So, I think we're fine with the above patch only.

> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
