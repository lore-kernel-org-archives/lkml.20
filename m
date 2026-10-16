Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A82D0629
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161822; cv=none; b=Nuxm5xejQjTC1KWcHJiXfoj4XmaJ68hxERmJsrE2EQmm+L1Zmjc393L2dyZFpaZvxSRXsscAzv2Wr0qwBPfF0Pln1J9R6CX8faxLxcCDE7IL/g1eFVk+BFuzN3JJzOtEHVgO4ghbWkei+QgkoFGgoux51DKBYKlR+hi1K1MAL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161822; c=relaxed/simple;
	bh=pNdXBEgtey5QskBpU8A7puCi2oaNLXY0APuCxhs8Xjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNn2QRwl9/Uxd8x7EGrTtg8MhMn1omhR1pnoTsTkCBcrzKqt2/Ij96uzXr9LzZsFy1BmkRvAzor+EdLdSE4zwEeQn6ASx+pvGlbZZ8NCGxwk2cVv+H67cODt4F/zcqIll58zQJWAQtDEpw8GRIlILWNPb+e0PLP4mJGfXWDj8Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Wt4cDLzf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PbQasFDQ; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Wt4cDLzf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PbQasFDQ"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id EA1A913802B7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:43:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 16 Oct 2026 10:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1792161819; x=
	1792169019; bh=Q7YiqwWDZQk+2n0xT60CqKD7dnGue7NdCKkacoM2NUY=; b=W
	t4cDLzfwd1JAm9iWky6dsqe1ygMvsiRilmhlchkEdz5rL1qXHKlD8RGB5fcn44I3
	YZTFc5AWeEbCw/OSotMAhzf/m1CsCFTjWrZfHBSvZuy/Z/a5HyEB+uuQoLFuDiFE
	KOzgMhOluq69GhBgVjT6g3lxqluTSIWnDvyHAbnG2bx3rDl/KIdNw+0GHtwGroh2
	3HDNxwOwZcPdtbfDUf8tvg7Z5rZDUTDsjm8tCTawwHBhY/6KoiuwoU2e1S2zmwwk
	sFQQTasOojUXpmsyWpuMQV+bnkMpR4GtdvNLAicpnmuwfhG7cuI87aunpXrKEU8D
	zzfMfBzUx/RHn3m6C/oXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792161819; x=1792169019; bh=Q7YiqwWDZQk+2n0xT60CqKD7dnGue7NdCKk
	acoM2NUY=; b=PbQasFDQyrQ+A+8cKn4D8RjfMmBlPPTeZPRRj5GPvCNZBEk3Htj
	NNl1MtIIEF450FCpPI78sMx6K9B5W2DrVbblEX8gCDAc037ZtwmDnFVFPMa1e5g1
	NtRLEoeMPDpLlLqBjXjXzxAUStpbWYSv1QY5aauQArmYQYDZQoFt3GqXvL4ZHCV4
	9PbjnFZybxpYw3dur/4VZPUY0mqmgV3mSTO3bYIV+mbbOtrIZCtayRziOSJFoKKc
	g2Smep7j1ooX8Ycb7HJYLNOoIdaa+O8iGrzH+qoaiFa6ZZcNoZz4i279OjBwo2PX
	2cn0GaSd4d/wh1vHrD9KSYkeQEyl2/s13vA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792161819; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:sNgSr+nM0DDnz0kOyCbp/a5PKi3tGDZipAxteUYjGtxF/zb
	yC4ikQCtNiB18JQ4+t1pL0+M+dnm+Xqos89cGcLdpuAC7CwGp6LqTYqtCWGBB3SL
	W6srEcdrvdNQDABz6xn0jjso0I8rJliXabaPZhGr1TUpyfEWU8ZONzDhB6trYlIt
	gkCxJZn0svwVZUveMlGVh8rKA48vi9kcm1n7tVVEgNQWcRGcczE1ei+WmOSSuOyS
	svQ8RunayrXlvJsld860UxyPXR1ce4k0BEdc0dK7Q0b2yLscNaoEFsQ0xm7tdZfC
	xWtCtJnTNoU/HjHfp6J8qh0lGg+HFx33agFibJw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Zb7vPP8S+mofmUXGssuNEJW2eqeSaoQC/gKcr2BfKcM=:pNdXBEgtey5QskBpU8A7puCi2oaNLXY0APuCxhs8Xjg=;
X-ME-Sender: <xms:GzjSar-Y6JCeXGT6Huo2WILtsWHa7904jsurZ4DRN8aeOgJ9h2g8Tg>
    <xme:GzjSasmWqSBlrS43RLvc5V-LGAJE0NLE6vtPm_VJYxENPemSq_4AQmJ4IPwWZVpbP
    OiJcOnKdLqYnVYnfPONbV9eLaXTeSTaEKBrrDGFCFNkOnQyJ_1oZIYu>
X-ME-Received: <xmr:GzjSamnaJe19cukq5f3SeX7NLQ043stsfCZNBKmsZLZIZVzstwwE285Sz18>
X-ME-Proxy-Cause: dmFkZTGPCwNLlIreOA8d/FUYkTGC+HHrYcO9/o1KThzMkoChb947LgMAYu6dAGmTNWyiri
    Rz7sk3NorietT7VJbAz/9bYwJ7ebwYatXcyTZIhsmGzgJAEog3F5mvpcw2wtCMDP0s87kD
    7G4Wr7Qz5MO5JKN+als71og6ex1cpr0AGL/3D3N+/lIPTTy/rki+kL8DvA7SVvSrdyr2IJ
    pvrqI4Q6KxfSOOzun2NE6+zs++YlosAPx8a10GtjyisOYVmdso4hVVxElXTQPnxZAzfgg0
    rOLrmw/KNpWVBQ20YDQqeQsPZBQM/xGUZP6xODuxvGCs10JRBZIZB8E2xK2gIrrtgVnEaL
    vWzddWLyXsghBiq4MvB8Qjyjbcb63PddmiEFM+Y0ZPEXWDXLPmer2ZeEIUniPerz5JrbAd
    QsMB/J9ahY5WTkFRKQhFngpecixgjgTSmNZ0dmWVO1m/TdI3KySbBO2BeGodg1ZIxXhOTX
    SI4TvIf0A4MsuieMbWwGzY/UQKZhp+XwKcEEHmuMFz75RVr6WFYQKKvZ/yQlEhwrmZKcEG
    8uapbHf/m4fNtm5Nl9susNBmOzhrlkNy5zNFx2S2E5etMFhMd8N+jVS4UgWLJNpXi0h6iF
    PCjxNQ1Yn3DJATMrR2PkPdwQ29HO3Lavjy+RivU/ogtSNHGvQM8N/5ShmeaQ
X-ME-Proxy: <xmx:GzjSapgkx26g_AiG54qvD69YL378c4oNk0EU-73UJDDTMe7d0Suqdw>
    <xmx:GzjSavV9Ez4XjQvO1WHp5NH-wFab5uWmkOKC8Qlwp4yMl4nu-hUiJw>
    <xmx:GzjSargGfVMMmEz5SdUPlQFfOmkA0i_9l9N6ovTrhkR_UJnRvKyDrQ>
    <xmx:GzjSaj5soupLuMsVHj3TPzWqMsytwQwbeXYvZvnr21x-kZdK9qyt6A>
    <xmx:GzjSaussv_3R8BX44BJXCqD5NLcEzX9RUw7Zdqdo7QjmBwe7HEH9MT7N>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 10:43:38 -0400 (EDT)
Date: Fri, 16 Oct 2026 15:43:36 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <atI30-1q2iEFPEbR@thinkstation>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
 <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
 <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
 <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
 <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>
 <atA2g8OgpiNOiVL_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atA2g8OgpiNOiVL_@google.com>

On Thu, Oct 15, 2026 at 02:12:19AM +0000, Jaegeuk Kim wrote:
> Indeed, it's a bug that user can see zeros between F2FS_IOC_START_ATOMIC_REPLACE
> and F2FS_IOC_COMMIT_ATOMIC_WRITE. I think we need to move the truncation path
> into the commit phase and use truncate_inode_pages() instead.

What about f2fs_abort_atomic_write(inode, true)?

It calls truncate_inode_pages_final() as well. As far as I can see, it
runs on the last writer's close (f2fs_release_file()), on flush when the
atomic writer exits (f2fs_file_flush()), from
F2FS_IOC_ABORT_ATOMIC_WRITE and when F2FS_IOC_COMMIT_ATOMIC_WRITE fails.

Can other processes still have the file open at those points?

AS_EXITING is never cleared. Does the inode then stay "exiting" until
it is evicted? If so, reclaim stops leaving shadow entries for the file,
and with the rcu-free series a hot folio of it could be freed without a
grace period while a reader still has the file open.

Would truncate_inode_pages() work for the abort path too?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
