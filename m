Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD3492E42
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.214.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149085; cv=none; b=AWh2l+IP5MqGidqQ+AUNf/wOE2IleTACXbWi0plhVeMq7DAU+go/i4slLtafl8pN1EulMxb0/nHyGVrJrAoyxaXtmNP7mQojAwYHoO4eMngdwlQzU9l9WDdoGYLB+TsSYO/Je2RWVM8n2Bh5DqnTrJA5zzSlsXRqa/5Q+D2kH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149085; c=relaxed/simple;
	bh=hu4Sa56FzXnuyYacfMclRh8TSzHw2VGAXBCK2cfBrFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCPKpe0lo/37i0tnc5Mj5jADi6zEvFQBaJ8QMlcPZANpPpU41965anXhRXXt0/eJYXYkaXKgMY+OMd0AG/e+gs/ifoABh2auKVE7QcSe2FzekcML0NVd3zWXfSF8WqaT3XW8cgWt+2SPBcSJZlBhZtEuFmyTI2EoKiFgK0jb5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=I2giDbQP; arc=none smtp.client-ip=23.83.214.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="I2giDbQP"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AF46742ECE;
	Fri, 11 Sep 2026 17:51:17 +0000 (UTC)
Received: from pdx1-sub0-mail-a202.dreamhost.com (trex-green-2.trex.outbound.svc.cluster.local [100.100.63.247])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4D6E542F15;
	Fri, 11 Sep 2026 17:51:17 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Slimy-Decisive: 15dbbf43322d0d79_1789149077547_3495921215
X-MC-Loop-Signature: 1789149077547:3526077312
X-MC-Ingress-Time: 1789149077547
Received: from pdx1-sub0-mail-a202.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.63.247 (trex/8.0.2);
	Fri, 11 Sep 2026 17:51:17 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a202.dreamhost.com (Postfix) with ESMTPSA id 4hhMY04f8Hz16;
	Fri, 11 Sep 2026 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1789149077;
	bh=yFz6X6S7pMgCsGxT7uVtuAc//EXiEID6680Y4q/z2rs=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=I2giDbQPEIjQP4Ky0LH9Scb9vOU0oMtncUfUhKVGFHRaWZRdW0ZD43ERpsF0aUpp6
	 oJa3pM9O8js04OfFmnEZmfSu/xnJ/9tpLIwfha6zCeyFbuImWAQE3LSHjRsCOh+4Z5
	 xWH/TZnTOxliD2FrUJt9NJ8hISxsR2d1JadEz29vScraQwEBi4nkkv0MnLsUVmkcJ2
	 8vDZ5hYJ+q5oSph1Juub3LnfN/gODPNu8aOqO4vcMl+9Nc67WqOAd7gIQIBiR7+Scc
	 E1iLtJcgugoMrsHoy0PBI22Q4GoP/UUUNxihqUtFHwXWWz2D0qwOgoF/JJsLdQ3YPZ
	 +KXFc4T2N7Kug==
Date: Fri, 11 Sep 2026 10:51:12 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jann Horn <jannh@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	=?utf-8?B?QW5kcsOvwr/CvQ==?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
Message-ID: <20260911175112.uipptpp545u5v5qp@offworld>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
 <20260911090447.GT788244@noisy.programming.kicks-ass.net>
 <87cxukypiz.ffs@fw13>
 <CAG48ez3Rsgzva+45hNrBjxwEONvNrDdq8W7vyzuhkXfehBHc4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAG48ez3Rsgzva+45hNrBjxwEONvNrDdq8W7vyzuhkXfehBHc4w@mail.gmail.com>
User-Agent: NeoMutt/20220429

On Fri, 11 Sep 2026, Jann Horn wrote:

>On Fri, Sep 11, 2026 at 1:51???PM Thomas Gleixner <tglx@kernel.org> wrote:
>> On Fri, Sep 11 2026 at 11:04, Peter Zijlstra wrote:
>> > Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private default hash alloc")
>> > the reason for excluding vfork() was performance and thinking this
>> > would/could not matter, which you've proven to be clearly false.
>> >
>> > Thomas?
>>
>> I don't remember why we excluded VFORK in the first place. Sebastian?
>
>That was introduced in commit ee9dce44362b ("futex: Drop CLONE_THREAD
>requirement for private default hash alloc"), and the commit message
>says:
>
>| Loosen the check to cover any CLONE_VM clone, except vfork().  Excluding
>| vfork keeps the existing paths untouched (no overhead), and we can't
>| race in the first place: either the parent is suspended and the child
>| runs alone, or mm->futex_ref is already allocated from an earlier
>| CLONE_VM.
>
>So I think that was purely supposed to be a performance optimization
>for single-threaded processes that do vfork()+exec()?

Right, but didn't really measure anything and am certainly fine with
Peter's fixlet. Sorry for breaking things.

Thanks,
Davidlohr
