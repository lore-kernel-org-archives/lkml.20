Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65E4AA403
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472267; cv=none; b=HJrCNWKR2nXn8jWdzLGMn5WdjM1GwinKlhJ5pri1knywgDT5zVqNhkUvYtFUTw3Syp/RPKgE6lacWegEuSHKLRfxfwrZtoLPpyfvl6t4D8051RzPmPnFbBDm2Fg4vDVpQJ8gsqsO2+a9P2X6cpAnM7sNGHNwT78tB7pz34DxKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472267; c=relaxed/simple;
	bh=7mH3tmo6yrtLabzwmF24JdC7d3E4QCsXblCMkg+x6y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2/xrExdOF0hch/q/6rfb7mleWSPifFiiZNBl+Avk27vqbKZPQNPLO0JkpaeaJukXLiectqvyANPQkRozSb9ShaWYnGILPgeo6xoRGc2xUoGqZEb3flg+1MZPtgIOGDfQTshiY3Zj4dtVhZRJrauh8rgYTEl7hrZnuVfnajov+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WFT5qIyz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WFT5qIyz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p9M7b7AHCpTAPYzsDYQKYoyoigl+4AeCYwJ+dhL9PO4=; b=WFT5qIyzAYZHBD3OFXYhbXbIpt
	+vx5Wzxl2wOdkzUS71UWF/LaX8WsAF214aqHh1W4sECacTo1HdWs1yup5YBUD5LepWx9tYgZz/59b
	XosHtPQtOPnvaegdbuVxDbPQRbB19aQuz3LueBUoL167jU3vqvLSbmIsiIg1gVGeMGz3KJzjsdVhL
	6LUfWlmoT75Kj0mF4Iz2lTT9QCUs+mVeRE7IH4HsbhNzEbYqt3n4KxqCHTk/RIXmrQMl0fl46Inw1
	oEJiuEecUMYHRkRPCDO5BMVQyh7n/gnWmEFLMQrDAnjWk1m3B9kjZTnZ+lbl6v2dDNo76779YH8iw
	pUuIzUBg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RTj-0000000FsKY-24oV;
	Tue, 15 Sep 2026 11:37:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68113300969; Tue, 15 Sep 2026 13:37:34 +0200 (CEST)
Date: Tue, 15 Sep 2026 13:37:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jann Horn <jannh@google.com>, Hyunwoo Kim <imv4bel@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
Message-ID: <20260915113734.GA2009045@noisy.programming.kicks-ass.net>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
 <20260911090447.GT788244@noisy.programming.kicks-ass.net>
 <20260915110619.Zp_jM61a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915110619.Zp_jM61a@linutronix.de>

On Tue, Sep 15, 2026 at 01:06:19PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-11 11:04:47 [+0200], Peter Zijlstra wrote:
> > So I can confirm that the below does in fact cure your testcase.
> > 
> > Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private default hash alloc")
> > the reason for excluding vfork() was performance and thinking this
> > would/could not matter, which you've proven to be clearly false.
> > 
> > Thomas?
> 
> in v2 I moved everything struct signal because the private hash should
> live there as per review. This explains the original check in
> need_futex_hash_allocate_default(). In v3 I moved to mm while the check
> remained unchanged.
> 
> The mm is cloned on CLONE_VM. Kernel threads don't get a private hash
> due to mm == NULL check in futex_hash_allocate_default() which was added
> in v4 with auto-resize.
> 
> To get the whole magic to work, we need to create the private hash once
> the first "parallel" user is created, the first thread.
> Skipping it for CLONE_VFORK violates this. I don't see why we shouldn't
> do what you just suggested.

Thanks, I'll go write up a Changelog or something and stick it in
locking/urgent.
