Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780458;
	b=ZMNooxk/m+wTvEUczyVMAuA9RQb4SOAMBoYfVbcX8i0kC1ok6Zhf7zxhyhY9TbxXWY23
	 fm+W4JQfrJInJ7G1t0m2EP7rgU8SYvV+RIBlvlJpcwwS3cusoQ0u6cgEj7RyLjJ7PJiFW
	 xrT7LkRZvwJGA0yZp9CHEdUgmBWoepW0XiF+9KJbZ4mXqseZR41CGcFyeIixkP+4I6/g8
	 N374/masXp0tfJ6TkPw/zTWgn/HE9sz4sSEhTCVVL8M8xbBmV2hOlzcZioY5qSBGG5Ow6
	 oPKKBswdZILw4CN9MVXeandlF1NbUUjv6RSMS79tIZDwXZ0gs6ZpYYISiECXXSpmWsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780458;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=lkIJPTF+rng+xUHUM1yRH1n6HfCu3188jQjR6cCCrnk=;
	b=VHb08p7YB3l64d/Br3G5y254h1MFqoGOyzbc2RFU7QtKQ4DAsL/ejjSUdwdYK6FBAUYZ
	 qbyzDriTRKp0ovCwQzGcBnDJjM0gmWH4SvizfZqra6GfOtIuu2c/4jeD5BoJuC5+zR7mO
	 v0j++i0o/alRXiX8rriTq/dg/brAkjnZh4HYTWnPG0xhD3B962bebP9o3341UBLdzuLdP
	 byEb6rSbwxFKMW/WbKftwCzxq2PaVXWti/rkMO+C5vZxOWG0T+8HFjMcDhV9a8YluRCvr
	 zjcfFtB1BHW6BBHgWz5Un2MpAYT3Vz/ng0GW3PbQWw9mvUWcJLcAnAn04mY+t8I3mrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ayzstiGI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0k+cdqhk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8DF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ayzstiGI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0k+cdqhk
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793780456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkIJPTF+rng+xUHUM1yRH1n6HfCu3188jQjR6cCCrnk=;
	b=ayzstiGIpHElycU48fFZd4+l/X9fW2BRInWe3HqQDotl7y2lM36wDVG8eo9kMeRbdssafZ
	eNzOjeLjses+Uot5rMmMHny4PMuIkXPNKs9rv7Mc10wUW8S/cEL5NNgtWlWxeK1ghdJXUe
	7PsSQbIWPwNxcfQYqrT205ik4eYpa5kukFVOot82And9zEb0ERimCbyYSumRvMAla4B8RH
	3FXAoVaDcUEIsZD+gNz3J7XNKa/opEJyHE6t128QHpX1+aNjlvbUm9NoPv3aTc9F66Pacq
	ekxfUL/RbDq5plGQ5da7/sS6Z52rAFCQ9rxn4GEO0HNZyDmUaSrl5Onv9t+Hgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793780456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkIJPTF+rng+xUHUM1yRH1n6HfCu3188jQjR6cCCrnk=;
	b=0k+cdqhkA+nUcKXRkIDB51+uCSF1htbzJYUalY6So/iOiac6eulsW4ceyBDXDbG8jiF0SP
	3KGlL8JUMAW/y9BQ==
To: Breno Leitao <leitao@debian.org>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Petr Mladek <pmladek@suse.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Breno Leitao <leitao@debian.org>, Toshiyuki Sato
 <fj6611ie@aa.jp.fujitsu.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] stackdepot: don't WARN when the depot runs out of pools
In-Reply-To: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
References: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
Date: Wed, 04 Nov 2026 09:26:55 +0106
Message-ID: <87wlqtxb14.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-03, Breno Leitao <leitao@debian.org> wrote:
> That deferral only applies to legacy consoles. ON nbcon WARN() puts the
> CPU in emergency mode, and in emergency mode printk() flushes all
> pending records to the nbcon consoles from the calling context.

Yes. WARN() is supposed to be for critical issues.

> With
> a slow serial console (pl011 is an nbcon console) and a backlog of
> messages, that flush can outlast the hard lockup threshold, all of it
> with pool_lock held and IRQs disabled, while every other CPU that needs
> to save a new stack trace spins on pool_lock.

Several serial drivers call touch_nmi_watchdog() (such as 8250) to avoid
this issue. Perhaps the pl011 should be doing this as well (at least for
the write_atomic() path)?

> Running out of depot space is an expected condition under heavy debug
> load, not a kernel bug, so report it with pr_warn_once() instead.

This is the key takeaway. WARN() is not appropriate here.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
