Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235265;
	b=RDmMGq3plsi3FdGSjFlyJkuiOxGg5ziq6sf2oYFE8y+b6LC8E0o8uLu5ukX2d0lMkANW
	 GLqIAY1ytShcrdsrMQK/A/CIw+bpGf3MOZfiT+Nkq+tbQPwD2T+gbEjqgTmo3RkXtJfgD
	 nwg7aV69K0CEbcNCrArBJa+brnPhk2ETe+YahaqdJCLcunNtEZBtJ1DzCw6HwDrtgke/8
	 Il9gQD/72Or9Hxq1iR3yqLjdVahZbJzF78KUUBwP1PlL0oYw/jPJ23KB5WXZiURiMsgok
	 s/Hd0VhWUfE3GUD9wNMkTsgCYdD8/Am3I3AnSyGDNJp88Zpq/Y3tFFQh5/+CNThjHDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235265;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Bb4YiGnWy4BM1x36qZFjtxE5DebHJsBBn8AssHQWknY=;
	b=vwYyjPjdqkUq+cTojiA4nMMxZIEm79P5wNhoA8MfEB5/ZUY/XB/qHWg9t/BFDK58J43X
	 1g89O2mDckJWkkFDpU+I8vIbyoUl9SrFob8dW9jKwq7s9p5nrTdpPETIReK9zhHeVeIB8
	 Ev4xqJvWWhtnlqQPL5VeUVeIdUCwyaY/fvzfU/xyZbfwo+OzDJ3iLh+7HWH/r73JOgfdd
	 Os0zX1H4oMzJFtwvnoBkBRKz2TsoLxf3MZ3q8tSrBFCzGGamak3GsQab59Qanw4vXGdWQ
	 X8/cXOd2w9Cw9GjjmUhK4/RRirmKeOX/0KrTOYWAoxul8HPh0qgWejTo03xq1qv6vOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CF1KFL6T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D37606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CF1KFL6T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DE41F008A2;
	Mon,  9 Nov 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235265;
	bh=Bb4YiGnWy4BM1x36qZFjtxE5DebHJsBBn8AssHQWknY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CF1KFL6T33YetD69+P7GucCHukbQjGhEBH35RiH9duxGWZzk2iZIEN/tZ1ubJiEHB
	 KlOaAPqLPl7LsnaTrgQE4HJiuWzKs/d+P6iNCILhAPO37vUQc6vkKHaz16SF7h2PhP
	 FxPMx+yYubvFcdEsq8AmU0b0DTWvZduozQcBfGtDne5UGE/I4/pL1D6zIwjB8qOSxe
	 jYTWtJ31rORIv46mWJ17zcjz8Nbn8NC+QnuMMtCn4wSKKWS/vlnQp4hfbSOCKZ7Jz1
	 Z0XQ8Lwsu/ljB2iD2Y1UYmfvA21tzwYplmpFJ9zRtWFDeU4KgO/wYZ37hR2fXMUWaG
	 4qTX6KyeI3vig==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id A95A0198003A;
	Mon,  9 Nov 2026 09:40:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 09 Nov 2026 09:41:02 -0500
X-ME-Sender: <xms:e9vxav6gnDUOCTGY5iKET68F_S4Ks9C3DO2sWsFkX12FmHJd1xc2-w>
    <xme:e9vxaih7HIiWGbhyhMBLJP4QRneTjO9JikqLyDqwzXErxTyDWKSyf84uOIsmibEU3
    e8kc1iUfA_JFNAfxAGMTPotMpAoa0tfJJoF_nw9F7Hl-5VDftFlTgh2>
X-ME-Received: <xmr:e9vxat3x3pI_x5c9_UMgLW25E3ykkt4tkrICwsizt_HlS5caKcjJhLV3UlY>
X-ME-Proxy-Cause: dmFkZTEKdBoMKgMRay4urn9/97JBWLZB/Nc7W3NNbeiTiEDJ6ec/ToiDpx48TwXgpRebBr
    do5JD+UW8FmSuDSDtHrn84fYcLhwJdWovAjzeWqs58LnXsHqTLLbRFnJH9mGU1txR7bAXk
    eHJ337LGBz7I112G150++fVYtthTJYo09fZ73Jn3ogTs2DErUqzgYChLJPKK2OPzIpAs75
    f2NTaueaOVYWzVVKult+J/8Ijul+ecXdLo1ud8dj3CauGAEv81dm/XyZOtUFy203sAiWcO
    HuTgP3MWJJpG6iTz4fTXy2cJkveYjSj7AFdxL1AjJxWPBTfh2XO3zy5pkeBnwcQmkShrII
    pbJ3tA2SqNcroRO1ayORhcIjBOuep9PCv+VbghE95w0P31wIDKFQVreqltAcwNd4IA2lU7
    2bdUB6NsC6z3VqD+S5NNWgz1FRbTTzQZHdaLIRbMu61xP4g9yCQOxdl30XiaqzE8WN36Qu
    q5iOHyGNOMkRXbBsChEqvy/q6kW5Ux2oId3BiZ+cvOifBrx4ZNYy+drauMxS5VRZlivpln
    AhnT1NJST8UnyxYPmu4GIeho7l6pkHjRtU5M5oV0Vs0TGR5gJqPKFg8JCZ2xzsxeaAhdhf
    1y4tvCbHzZvpdG5R4XNHsw12G5D+ZyB/OwvAjdGkDh/O6Y7h5oLRPoqwmCPA
X-ME-Proxy: <xmx:e9vxaoVVHUbrcPMvMG2vIp2Sy6LVHOO-jQFACerr3ZEVwaVoc4sQOA>
    <xmx:e9vxaq2f1muNPK566-Vf934CqSYxufJNAv3pxFnqN6skvoaLSKrNGQ>
    <xmx:e9vxapjr4trfH-DjcVIc3D9y7NnyFICKEug2D07u8BsrEKnHBiPtRg>
    <xmx:e9vxaqIqRx2seoKneFVUn25vlz1U7hPdco2ez1zPjDwOuSpacQshxA>
    <xmx:e9vxaiXPR-7zyf2HymLAVW-skXa7WhUscV3e0M9YsibaePzomnuU-I0_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:40:58 -0500 (EST)
Date: Mon, 9 Nov 2026 14:40:57 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 1/2] mm/memory: recheck PG_uptodate after
 ->page_mkwrite()
Message-ID: <avHaScJrO9AIgDdQ@thinkstation>
References: <20261109120403.82361-1-kas@kernel.org>
 <20261109120403.82361-2-kas@kernel.org>
 <avHULH5Irb3byJkG@pedro-suse.tail5790ac.ts.net>
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
In-Reply-To: <avHULH5Irb3byJkG@pedro-suse.tail5790ac.ts.net>

On Mon, Nov 09, 2026 at 02:11:23PM +0000, Pedro Falcato wrote:
> > diff --git a/mm/memory.c b/mm/memory.c
> > index fe72e66c9c2e..cc1d0b7d15c7 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5613,6 +5613,18 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
> >  	return VM_FAULT_OOM;
> >  }
> >  
> > +/*
> > + * A page cache folio that is not uptodate holds data that was never read in
> > + * or cleared, and mapping it leaks stale memory to userspace.
> > + */
> > +static bool file_folio_not_uptodate(struct folio *folio)
> > +{
> > +	if (likely(folio_test_uptodate(folio)))
> > +		return false;
> > +	/* Driver pages from ->fault() never get PG_uptodate */
> > +	return !folio_test_anon(folio) && folio->mapping;
> 
> FYI you can wrap this line in an unlikely() and it has the same effect as
> wrapping every call:
> 	return unlikely(!folio_test_anon(folio) && folio->mapping);

I prefer it at the call site. That is where the reader needs to see
that the retry is the rare path.

> > +}
> > +
> >  /*
> >   * Either the VMA lock or the mmap_lock must have been held on entry
> >   * (see FAULT_FLAG_VMA_LOCK) and may have been released depending on
> > @@ -6163,6 +6175,16 @@ static vm_fault_t do_shared_fault(struct vm_fault *vmf)
> >  			folio_put(folio);
> >  			return tmp;
> >  		}
> > +
> > +		/*
> > +		 * The folio was unlocked for ->page_mkwrite(). If it lost
> > +		 * PG_uptodate meanwhile, retry the fault to read it in again.
> > +		 */
> 
> The "read it in again" sounds a bit too prescriptive but, apart from that:

Okay, will drop it if respin needed.

David, could you adjust it on apply otherwise?

> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
