Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619601;
	b=enqvccJu9RI6v4xP0XBbeJZTpqyhB+T8eFPPb81ggJxQlyZcQ46OVdw7+dx9EoRKtO+u
	 F75YaCrdoQMdeCGOymdQj3uxMD7bqNk2Xq3PVs++lNiBvXw9+SIlxaybShU1c4cEwf0uB
	 gmzt0EzI71gKlkZMIWxe3DiysTTbm6ZMQrhVz8onesnly0p2Thj28hHu7GTblNrT4CKV6
	 pIvvHfDT4MahJ9UFIhTDSBUXYMkvjL4kT6qf6qtbGZK0yjtq3lkqjkLIcYPCyRWAeVJRI
	 YqG4uRga94spxixzZWwTVHiyeJe+ar+ee1W0PYLo6bRPeCxq4ky33tU0ZfE+oBsKwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619601;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zngC4Gg97840m7bkbzFdo+IOdjY9FiI3xLhgwdydC2g=;
	b=naEkQebIn7x9/Rpd2R/kzx+myx+lVKcF9L6K8VuFsmQ+Pas5LMnjyg0YvFtmeZWlnqJf
	 5OlaSwDdLqfCFbHOW5p5Fey6TjSKpdGVhdxHdN1aug9bhf7L8hVg7DGlIs68SXzZP58dr
	 hlFjYItfodJMPZB7EEtzDFajnG6g9oNgrbxyS7llc9YN7k9OCUhVlLsad78OjZi7B3gpY
	 1ik5GwwP6bsqSYLnJnRbI6bxRjuvKCw/+Vib5v2PZuIrIPywa6YAFC2YfVx21dt6outra
	 a//6AkczvP3FPt2TWTrJYBeyMUnQXj2viHAb5M/7u8l3eWxRQjbB+sF6gWDm4Grwncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dy3QrKC6;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F379E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dy3QrKC6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zngC4Gg97840m7bkbzFdo+IOdjY9FiI3xLhgwdydC2g=; b=dy3QrKC6PUEylSQeS65xJ2rp1I
	E5SeBLYHz8ANSyu9ZJalE9HOLAiSJR8j3pu53IQieJ+Be19ULOzorfG0+YX58DLiojinehO7CDk1B
	yOP/kFtDERNfOssuyn8/SwLMuMYj2O/7FnLBV1VWezJEP40hWowrRI4+vN8SAJ1XX/ykf3MjyVOCk
	aXJFO1UThRfhU33LepriTRhLTW4l+ofHtv06QVT18zeqe3i9+6Eio3n3jOX7XnU92PjgOs8TpsAi3
	3/e3Nb4/YF0yyIU16Q8SH0/Ngm9dx2o4OUvK7mtnuvRu7Z/DGryXA65tVgO9mifkNndRXBw5V28/H
	wHdBMkfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJeFG-00000006GFB-3yZp;
	Wed, 21 Oct 2026 21:53:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 30A913005AA; Wed, 21 Oct 2026 23:53:14 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:53:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Rick P <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
Message-ID: <20261021215314.GU2823843@noisy.programming.kicks-ass.net>
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
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
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>

On Wed, Oct 21, 2026 at 12:51:20PM -0700, Dave Hansen wrote:

> There are a few critical parts of the design:
>  1. A shadow stack is allocated per-thread. Space is carved out
>     in the thread_info structure, adjacent to the normal stack.
>     vmap'd stacks are leveraged. They already provide an alias of the
>     program stack with 4k pages so it is straightforward to create an
>     alias of the 4k shadow stack page with its special permissions in
>     the same area.
>  2. FRED is a required prerequisite. If someone wants to go back and
>     do an IDT implementation, I'm all for it. But FRED is way simpler
>     and it is absolutely the place to _start_.

SSS has always had FRED as a hard requirement. We're not going to
contemplate doing IDT; its an absolute trainwreck.

>  3. In addition to the per-thread stacks, there are also kernel
>     exception stacks. This is also true for shadow stacks. Leverage
>     the "CEA" infrastructure to allocate space for the exception
>     shadow stacks. (look for "x86/cea" patches).
>  4. The kernel shadow stack pointer needs per-thread storage and needs
>     to be context-switched.
>  5. Any event handling (exceptions or interrupts) that modifies the
>     "return to" instruction pointer now needs corresponding changes
>     to the shadow stack event frame.
> 
> == Warts ==
> 
> In order of things I want folks looking at.
> 
>  * The shadow stack is not used for the init_task. The most ideal
>    thing would be to find a convenient, simple time where the regular
>    stack is shallow and it is simple to create a corresponding shadow
>    stack. This is not currently done.

This; I'm thinking we should simply unwind our own stack and write the
return frames in the shadow-stack and switch. We have all the
infrastructure for this to be 'trivial'.

Trying to support non-ss tasks looks like a complete nightmare, lets not
do that.
