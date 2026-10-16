Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3275326BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167844; cv=none; b=t/eRAsodh1GePWChOJa+K2LWZZGS1fBPOtHH0V+8PhaKfJqMldpNhAZHJ9l+BjsnBP0ncJ2NtmmHk9BQ1iIxIss/zJ+6flUPNoz/W3sM4fQB1UKUo139n//3t6NIX39Yha7pWaUUrWj7Jm/Def+/tlTUBODg+OHKe36E1A58Obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167844; c=relaxed/simple;
	bh=klHXWdaX6otqMnaSii+EHKB/5dl9+lLwjTjIXf1+q64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H10Pzr9KcAIdlVUso+uZUDFZINMYJ9gjWTwvZvgZTC3+nMMngo2ulJfig1nVljPxj0txdcQBQYndfV3j3slAXIStt/HuIM6LU6oclp06MG0V8sjUpvaV7S2wRGrg/+ppsWlFV1W0Jmf9KC68hkZcROMOFEk/FI+Cyd9shQvbwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DKozTNJE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qYj/q64n; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DKozTNJE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qYj/q64n"
Date: Fri, 16 Oct 2026 18:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792167838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=;
	b=DKozTNJEW2AwvZQuAgQg2+mTJJGqe+kkw/MO1d4Yqtn+W9a/xKdX3KFkLlnxMvjL2+pQg8
	dbyE11B6RrL1FCd2fRh4+97Ce5LXbqRmzoasHYW1ZD11taY+6lc56+dnqdpvZCHvu58aMK
	LcdH6V8qt8R9XEBaTR7+jhsH4xa26S/l2heU/8P1OiKbMUsMFmJVj3TBbjBpMU0i45hY+J
	i62t/yY5DOV9iYt265DWMnjMwGlPVrY0xgLrB6lVpB2w8STHezLO8cFe4y7qQrxvI63BvL
	0+G3pQaRkxI2+I5D2BubbY8CohV3UtJbdWjwKtnR6ZsE4h6V4Pa9mGZI02mPOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792167838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9qidRa2FBgCR2y0sBJPJyGy5f82k6s8UrQ9M/kGZ7II=;
	b=qYj/q64n/vggtFXpYq0P7zeGT3FC4Vf5ih14OTPFnqEExbJEnVjqq8Ol4VxNbQt+7y26aT
	89OYe8ZEwBZ4vgCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tanmay.shah@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261016162356.m2X9jbCa@linutronix.de>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>

On 2026-10-16 11:10:29 [-0500], Shah, Tanmay wrote:
> Hello,
Hello,

> Thank you for your email, please find my response below:

Thank you for your email, too.

> > So is this SGI-IPI a thing or not?
> > 
> 
> Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
> interrupt is used by the TF-A and the expectation is that Linux mailbox
> work on the same IPI (because all other IPIs are busy) then the work
> around is, TF-A will generate SGI for the linux mbox driver, and the
> mbox driver will use that SGI via device-tree.
> 
> It is a vendor specific use case. So the dt-node for this use case, may
> not be available in the usptream kernel, but can be enabled if correct
> SGI is configured via the device-tree.

And it has to be a per-CPU interrupt? It can't become a regular
interrupt which is not per-CPU? Does the driver at some point access
per-CPU registers?

> Thank you,
> Tanmay
> 
Sebastian
