Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038D4C2251
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340132; cv=none; b=aNZsbVNWd0RnMek0wean2CtWYTsirZxBsK3Gp+lfa7afutymLOeq9YDvhqCEGknrhtaz4W1uVRe0wIw4AeDGSHLEpiMpmtQ2tjRsR5+jA5oDki/nxRejm7h5lPYqeuB//0siIlNr+TGSnw8VU4wTMnZQ7GIWdEzmbwm1gh9dZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340132; c=relaxed/simple;
	bh=JbWlJYHSEPLnwv5rFu7f3S8ntR620TmCB0sP4vN5yzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOnYRKaen9zO2qRWHA3BsVtY1KbYLb1xZsmmoWxstVa11CxgviarvUFOdMGp2vokme4Nw7rDhHyAwRj42crXCEk2MVlmsvkmtOzF8YRqI1niZDPUhabGgbcqBswZAN4s/NC9zBc0ZA502pljja2+5QqogBoszwX4PQZqi+ZsYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvcUdolp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvcUdolp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761ED1F000C4;
	Sun, 18 Oct 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340131;
	bh=rIvy1ABivVMVJ/YwrLZN2t/I+b9NdRqcsPWIXfXCV4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvcUdolp5lKHWLRUdZYggrDvIG1ph3QEtPg011D72qDX8rgyo4MXdS75i5iubiwvF
	 U1g9ahlyrvatC77Cx8Kca+U+xhKLJaYJRP2lMuSlPd7LalTDNwp3y9Nhw6JWhG+9/M
	 kzoLDgl1boM/PcglOtUBiOQkVuUwhP726U3Gx1MGP2C1+k6vf4LPhHxTSQs6ECPvjh
	 CnEwwmuWJ/yXMeu+7tRNHKvMJBnOpZJGMk0X9SiLHWx7AnILAp6sTVpMsb8LVtq/zO
	 yialxXN77Xh+Skasd2UFm7On2XXUy5xHgkmZ4hlb3pFEbQkghfgIGyr/s/dvXDE2/9
	 rm/Dhu3hZ1i7A==
Date: Sun, 18 Oct 2026 17:15:28 +0100
From: Harry Yoo <harry@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nickolai@csail.mit.edu, rientjes@google.com, 
	roman.gushchin@linux.dev, vbabka@kernel.org, vitaly.vul@partner.samsung.com
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <atTv1tg9q9n92kZv@thinkstation>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018160315.1465504-1-vitaly.wool@konsulko.se>

On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
> > > How about we take my patch [1] instead since
> > > it isn't prone to this bug and is a nice optimization to the existing
> > > mempool_resize() at the same time?
> >
> > It is not a good idea to squeeze a bug fix and an optimization
> > into one patch.
> 
> Generally speaking, yes. But that patch had been submitted before the fix
> popped up, so there was no sqeezing per se.

I mean the patch you've submitted does two things (wihch is not good).

It should be split into two patches that 1) fixes the bug and 2)
optimizes it.

(Setting aside the question of whether the optimization is worth the
 complexity)

-- 
Cheers,
Harry / Hyeonggon
