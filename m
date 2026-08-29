Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BF3C1412
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037334; cv=none; b=WGOoym7tyTHAq0xbhxH1spRt+pIXux/190fRPFD+fw9VzkHnsPikcpjTp6ALswQ5dD/cDS0ynJaLpKtBaLbiWweL6wUPBgRfSR7OX+M/MQLj3qENgUK6Q2GiWyV7ITiz4VOAYvDegwXdwxeYIJgK7jOW++LV+hzg1OY/Tp74/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037334; c=relaxed/simple;
	bh=hvzuxqHgfGmIRgSIcRCW+5UopEY1wnVLKdL60h93pvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IDE6TmsfymU4MoA4y7mjAzwk49EGEl6Z5aAy5+YeNTBIFEjPkTS09AMfkno9fmQd+s8Yc5bjH2KonqiMzc1pJEiE29peCsui7gzC/idpYf3QvS+X85PiOgNSVo5NKWYONw67KCxCg0VBITDsMA5QVhFfnbVc1O7gW4mlGBso4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbupArtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbupArtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACC91F000E9;
	Sat, 29 Aug 2026 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788037333;
	bh=+UL151QUzzTff2jOjVTBzE39JZhThLDGVNAm23KMxm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mbupArtDALysAa+5T7moUFeboWCkRkDslTbWP1NDQnBI8+/IyxTm+wfTOSFa3qkZa
	 ZBnUyxKTbKKQja/XRRLX4SYxZAaSpDWyXkhXG4ENuSE6+s2zfb3n4kVt3bGJMYUV2r
	 Mea1TprRG19X+cUJ//qgYIg3BqEFiezyyD2EZAZs9IeHMt5NaGIEqsp1OJNtLVNVwz
	 BUVXmtuxf9zbllnV4VxKiADYg2zTGPjiVuPpmNdq1su/gZxskl+7z9fgiXDvjjAotr
	 geULgC6QGGreOpELqkdwO/T3m8hp2P3mPcVnN0Kkutc3nMFRLtGZErHwQaFDaGmsM5
	 717Ygm2WonNxQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interrupt: Disable interrupt before modifying
 hardirq_disable counter
In-Reply-To: <20260827181106.30090-1-boqun@kernel.org>
References: <20260827181106.30090-1-boqun@kernel.org>
Date: Sat, 29 Aug 2026 23:02:10 +0200
Message-ID: <87ecfgej3h.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 11:10, Boqun Feng wrote:
> Currently a softirq may be pending longer then expected if the
> triggering interrupt happens in-between hardirq_disable_enter() and
> _local_interrupt_disable() in local_interrupt_disable():
>
>     local_interrupt_disable():
>       hardirq_disable_enter();
>       <interrupt>
>       ...
>       __irq_exit_rcu():
>         // false because hardirq_disable_count() is not 0
>         if (.. && !hardirq_disable_count() && ..) {
> 	  invoke_softirq();
> 	}
>       _local_interrupt_disable();
>
> , it'll defer the softirq to the next interrupt which can be forever.
>
> The order between hardirq_disable_enter() and _local_interrupt_disable()
> is to optimize re-disabling interrupts if they are already disabled, but
> as 1) local_interrupt_disable() is not widely used yet and 2) the proper
> way to achieve this optimization may need fixing up the counter at
> entry/exit time [1], so reverse the order for now to avoid the softirq
> pending issue.
>
> Since we are doing this, the part of saving the current state is
> separated from irq disabling, and we basically do the following in
> local_interrupt_disable():

We do nothing. See

https://docs.kernel.org/process/maintainer-tip.html#changelog

>     local_irq_save(flags);
>     if (counter++ == 0) {
>       this_cpu(local_interrupt_disable_state) = flags;
>     }
>
> Change _local_interrupt_disable() to _local_interrupt_save_state().
>
> Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]

  https://lore.kernel.org/lkml/87jypbfu1t.ffs@fw13/

is the mail where I explained that softirq issue.

