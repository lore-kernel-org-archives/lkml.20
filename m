Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288C4EB869
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891112; cv=none; b=f398C2rhIAksjHMeDv1XJWXM2N1TITdTBxZsVVVyQhG5ZRKdmxwWyDUfPS/8lc+AEon+W8+1tZ4YXkxLWb4GhG7kcPswVG57HfBJoZmb/WgZZYnGZwhE63dvETQHifOWP6jH9mvFXtxog30I0wlwXlGkO0I7i+xpotaU6wXx2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891112; c=relaxed/simple;
	bh=5MztiLkG8C8Of18/XOCPFRiKCdmJGnwwdtVWbkVo86k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5oLA5E50yRg9aSq0N7fN42tJcJSxQnKVK4LyMxXSFGJWk8cuQwSgD13CoBnFnQXRHSFyw1GqmYIrErYqaXd0DW1yzOHokVGRDw3GPaACP6mw6dJTGZwSiJGUMxGXskNAcPACPP08ObA+Z4PZESjjsk5ii6LkZ/4IZdMoSjxb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XK3UVSVO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XK3UVSVO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5MztiLkG8C8Of18/XOCPFRiKCdmJGnwwdtVWbkVo86k=; b=XK3UVSVOLtyiU9zLSXFBF8AMhC
	WC1xDLrMWbx46mIpkpe2tWRcKObo/jlrUtQ15rmKd3Z6ROV1CDnhZfWTBMAejTnfdCRanLQt9k9a6
	HefUoSYB+BICTATKqG/DBwcI99XmXRnbsaZV4ermfzcveOomRDdMrzLkGcKclRg9uGZ0E0Y6DW3GR
	QEFLkQ5Zd1kieQx8zvCZM22sDRp110XEL+HfWQaDmWtWR0l65yRyEr6/6uWYw3MnIHiC/upqTQzdR
	D7QkAj7Y59z567ahbomZbdGgRbe1Lo7fR84vUDDhutbXu9DkCmWI/KAkYS6GyFoafy2I9svwR3/vc
	FzjxJs7A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGajS-0000000D1T0-0DPd;
	Tue, 13 Oct 2026 11:31:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F02BE30015F; Tue, 13 Oct 2026 13:31:44 +0200 (CEST)
Date: Tue, 13 Oct 2026 13:31:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] sched/fair: avoid redundant updates for unchanged default
 slices
Message-ID: <20261013113144.GH2009045@noisy.programming.kicks-ass.net>
References: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
 <20261012105953.GR4121339@noisy.programming.kicks-ass.net>
 <CANGjgdnmcm101FneQse==f-YQhKyoARzt20AMyWz21HLQLEFew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANGjgdnmcm101FneQse==f-YQhKyoARzt20AMyWz21HLQLEFew@mail.gmail.com>

On Tue, Oct 13, 2026 at 05:58:17PM +0800, Chengfeng Lin wrote:

> The attached default-slice-peter-v4.patch is the revision tested here,
> against unmodified v7.2. Does this look like a reasonable way to keep
> the unchanged-parameter fast path while handling these cases?

Yes, this looks reasonable.
