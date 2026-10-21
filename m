Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589676;
	b=gj4/8/E7yI6DKmVc2cJDuSw8/n02/wGjWXRWaM11f1gug5BbxwrfGXUx3ccVs8u/dGDN
	 Q12CsQ6tUBa+5jY1YZLzgkezByl5Ftrkez8VWGC7otBuNM+Iv0bUjBbUZlwc6oTfuk0jY
	 T2ozJOp1VOKG5/5CtpcQLjTkQcZFVuonV0AC783x2WyfyL3bNVLoYKjsV99CKBpA0ISe7
	 l2ryDRvKXPL8X9Hx1/PUjCRjvXZ39WOYeVNhrDom4es362eBpizqq4RX3WuLVNpP6596D
	 cP4sd7g7jtgot7pOdavqCdxr3zBERrXZkQwXGISBIIsOHcI+mmyOBrcTes+GTZBhzcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589676;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SXsRnV1jsu/GcHVG1pY488t6BVspAFhP9QRmoB/86Mw=;
	b=xLtxX7HDpJVO2pT25VsTN702p0VuQM0uFl2/R/Jh/+WdTJmZ4sXuDBsc8I8ctrCca3Bk
	 JbLCXTtowJHLRHsM0r7XdTZDnG2BHmNbbjL4jaXio6znotmEshYIvioSlGfz6ud96N1pQ
	 MoG8x8ns7rRxtXG3ndt7hfcEGEbvTwUpwG0+c4JZ/0ot+EQyr1b+6ELjeH+piKoHDni5t
	 cpSWR8qZ1Wix869Kt5TbO1nihTLObvlSs0yiXZwvra08slUpZZKRe6ThZAVSKiZ76l6g3
	 xmpNqrFfhdJpc2SScfkb8NLjwpYDI7x6ePMjhP45NiIECCxDtvqBsPZwECRFBzE3PyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bY0p+l3w;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bY0p+l3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SXsRnV1jsu/GcHVG1pY488t6BVspAFhP9QRmoB/86Mw=; b=bY0p+l3wUScaWEiJAU3l0yYvDA
	XKHg30hcdYt7GCvndMiRG0F0ILzIkdMuaSJDCMfeTNONfdY7/7fzOkC2yO1MqsbnDKHfInJcHzrVd
	i/aYTmjt7ITaok+x9wJakOKBEH6GosTuezz1wvcAYBIR48kuo0m/050uaSKVAHV5BL0O84i6fKLO7
	PIe7Vz6Wak8s9zpUVYLEyMl2Ve08ky49Sdr1+Wy/VvmGdp2HdV1IOCLPKNL29r6QSiE7wqOnFUWZc
	rw0BKeTHWtOTPxx3uwXUJprT8Q8uo73nJ5puCFo25FIcfTH7yxUJWyLbkjDLlFWK3RUfjbIlc6pFA
	V1rlPFFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWSd-00000009WsC-0dDX;
	Wed, 21 Oct 2026 13:34:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B41F33008E2; Wed, 21 Oct 2026 15:34:30 +0200 (CEST)
Date: Wed, 21 Oct 2026 15:34:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: John Stultz <jstultz@google.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Qais Yousef <qyousef@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Wei Wang <wvw@google.com>,
	Patrick Bellasi <patrick.bellasi@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021133430.GP2823843@noisy.programming.kicks-ass.net>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021092136.249e2d19@gandalf.local.home>
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
In-Reply-To: <20261021092136.249e2d19@gandalf.local.home>

On Wed, Oct 21, 2026 at 09:21:36AM -0400, Steven Rostedt wrote:

> > And yeah, its always been the case that jump_labels (and static_branch)
> > updates are non-atomic. Most of them are init time, and don't care.
> > 
> > Now, I'm sure we've ran into this particular problem before, and it
> > always requires care.
> > 


Read this part:

> > Also note that a simple global boolean has the exact same problem.
> > Adding runtime conditionals isn't going to fix this.

again, and then consider your response..

> 
> Another idea for "atomic static branch" is to have two static branches at
> each location. One that switches to a "check this variable and do a normal
> test and branch" and "we are now in sync and can use the original static
> branch".
> 
> Something like:
> 
> 	if (static_branch_unlikely(&foo_use_variable.key)) {
> 		return static_key_enabled(&foo->key);
> 	} else {
> 		if (static_branch_unlikely(&foo->key))
> 			return true;
> 		else
> 			return false;
> 	}
> 
> And then in between updates of foo, the foo_use_variable gets set making
> all the branches use the key, which will be updated "atomically" (maybe
> some memory barriers needs to be added). After the updates of all the
> static keys are complete, the foo_use_variable gets unset.
> 
> The non-atomic portion of "foo_use_variable" is OK because the foo->key
> will match whatever the static_branch version it has.

That simply doesn't work.

Even *IF* memory stores would propagate instantly (they don't) you can
still have the boolean swap while in the middle of this state.

---

B = true;

CPU0			CPU1

 enqueue
   if (B)
     something++;

     			B = false;

 dequeue
   if (B)
     something--;


---

Will still be left with something unbalanced, even if everything is
super duper magically atomic.
