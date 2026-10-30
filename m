Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362525;
	b=Wc+qd/67+nqA0SzKysRGUHTswbpB1jBcgKOvctzD97HkxrG7zD01UlFhiNDm6lOhDh1U
	 rX9OCblQCMLx2lel78aw+fTPxg9sMYnYuO+FCmGQyg5eqDsy8FAAipTDL2tUlB8EUWDIj
	 TLka0iAO23Nx+tDRvz+aUjPzOws0LyzvSnm/kL9RD7kOfnMgOCX3nxB87JMzhGdsIVgvV
	 nrY/xBYU4KnhBDGUXCbQ46fxh6A6XFCHXZ2C7oSHvwEVoYjqk7s6Rw/ZokOIqLF6dh/zd
	 uVQ7hg4H/mUzvaNUkXsAszS99eGKg2RKBciJ0XbLsPDt0Fim++xulpQPA3M7JCp/aqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362525;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=M6vrpTbfwaCimuJf7xEfcbD93enR29jER9mfIcBXf4o=;
	b=IBP1146mZcozpKPJDL9FUsKJ26gLlcQsU0ORScIUUPP/jlZ+Zo0CxnNoXCTYa6nBEmYF
	 3eZ+SaYCK79qjBElwfxSyrsPKfqFrxm6BgSJ8wvA61SlAzndVwL10OTEFfUj++xDJ9XeU
	 pKHSx4Bv+IAisDJb8MymIr5AG5Q/sk8KIZ5OY5iWasjPVrNn8kdy+sXFVpvMFdIQ231ID
	 kwqZ6xyn0x5ms5hE0fqXP0j5btkCjlDMN/bU7vxBn3GP46hOyNNovl0D9696Fjo+61KCC
	 9ykeLezuaq+4zvv2dS+7/8eH+CcLPvQ1468e251sHxumF11hcpoFmOBt29+Yf7QX8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iuKGw6pv;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C707606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C707606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iuKGw6pv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M6vrpTbfwaCimuJf7xEfcbD93enR29jER9mfIcBXf4o=; b=iuKGw6pvyPH0U/Wm1hYpuMNVEZ
	r2ReXV3Ir/s0akOOyvBxVkQYgGDeAxx0TCy3uAzN+G86zYduTzrhhviKIzcQ2oLsYHpDNjoqWjFqK
	T8UdxtrfBa+T+B8svIVhhtgg30UWa6wThD7vQ0M+JswT5nqZExh/An8nRrV7ZW+I8xYEobeuKB1aP
	F2vpDN6QZOqqiN1QpK2m8fzL8XQnZ1uJBGn/Tq0xlo2la6q5wFf1ZsJDRIYxL6HbbGDfoPZfZEjOx
	bCmofoNpLwmCTTedWHPS3C86aUQrc9OqoW/8we9nenEr32PkPelA2wvD2eSoqGhtwtTqrH5nSxJm2
	FHtbg1nA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlVw-00000005tvF-06Y2;
	Fri, 30 Oct 2026 12:15:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ACE30300578; Fri, 30 Oct 2026 13:15:18 +0100 (CET)
Date: Fri, 30 Oct 2026 13:15:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261030121518.GE1813469@noisy.programming.kicks-ass.net>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
 <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
 <20261030112825.z7k57twgua27p2vu@airbuntu>
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
In-Reply-To: <20261030112825.z7k57twgua27p2vu@airbuntu>

On Fri, Oct 30, 2026 at 11:28:25AM +0000, Qais Yousef wrote:

> Peter/Vincent, what do you think? It seems we have a schrodenger task that is
> both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
> this be fixed? If yes, any thoughts on the right approach? Should we throttle
> if there are no other tasks on the rq too? I didn't realize the semantics are
> that strong for enforcing the quota.

Urgh, nothing is ever straight forward is it ...

Bah, so this is because the core does uclamp (for classes that have it
on) but then the class does the throttle without going through the core
{en,de}queue.

Does it make sense to have throttle_Cfs_rq_work() and tg_unthrottle_up()
do uclamp_rq_{dec,inc}() respectively, along with the
{de,en}queue_task_fair() they're already doing?
