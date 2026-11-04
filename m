Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789495;
	b=EEPP8Z2UUjv0u5wOYtgI5pXya5/AbfXuEBN1cfyNKDrGYJIxHwyNh/qRgTL84CaY0FTC
	 M/ucYZAwWDT9iH1EozJDxtWQZYlNJ2cbIt4J3R2Crn8fA52eRjJbGADg6BP0kBYXkdwdp
	 Aq/QJqGOlnOqEB4ichPn0QXbGRgnBPh+FSd54ggF0qsb3g9eOwnNgS+x1DJozsLndxv9+
	 ahipYgnE72gMy9Y/TR/rMZ0OGYqqR1rb5WvgkD4W5XmcWpjQu5IUUVnm9hvnVoW/KuuEC
	 hAc10GNgSh+EVjJVrTqBu9PwJdwK3bFjWzTU8pD83+uafsi2hj43ymGmY+8H2PedkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789495;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=HCD4dUkOzOdn3Q0dQ9RVWupPj4W1Yw0m8drPOHzGd5M=;
	b=CMumQj7SsI5CCWHXHvFPWWPyIklQ4r1lzF1/HrlAO7JCz9Sjtff/192cj2h40Mr7dJek
	 Y2PChkYEpJ9eYGeAsNOgA1RkjQAlwm39IfZt/A2v7sfY9tP1upQImgfACKSwSE86Dh8X9
	 0zT7Q4XEDP0U+ZsfvOZvkDmBnk4vu+aK/BdnY4olz4cpfk/LH506TIeWs1Ukb/258TG2o
	 qQtLFY5CRnkEqrTBuPyHYQNE/75IeXa3Cy5KBDQeVBmHNZmcyF9PtNFHdQmlLhor98677
	 tm16tGjH8vuW9TbB94xYHWZlMSNYe858dM5h2iDLIae7zD5kJeP+x4Hu6vRa1TjdIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="WsRYA/NC";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KfPQTe+Z;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC47606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC47606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WsRYA/NC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KfPQTe+Z
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793789492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HCD4dUkOzOdn3Q0dQ9RVWupPj4W1Yw0m8drPOHzGd5M=;
	b=WsRYA/NCtFMjf6hHwve2jKBC7YDaB9NQmzOsC/XFAQQP0agHLzIhg2918Gn0AZC1uBU5rh
	Y4eriENy6a/q93FgwsciFgNyc6ErSrg0JDowQ+s3k1dIv5RkyVJAl2uOXMHtMZTWBAoFMT
	GXqZ/OSEDfgdIECH1G9zT9pJtcJC3or7/AAzsf+dLDqfgF7mVBbrOkCk5XHziYQdJRYIxC
	RsuHnbf41ywGup608jam4y1GbcLdsdeGV3+MlYdH4sp5FY0ea5RTky4V0ItsNPidSyeNv7
	X0wooghY7iNW1eyDhsomiKU+h8CSk8+mBJppoGPmHoy7MEFFIvzUcksecblgvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793789492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HCD4dUkOzOdn3Q0dQ9RVWupPj4W1Yw0m8drPOHzGd5M=;
	b=KfPQTe+ZYz+Khxlsv/xSOitTbzedMCidIzV65cuVrulZCE3dIOp6qjONy6VTrgrqHOxhg6
	dtCsjxt9KqHPdDBQ==
To: Breno Leitao <leitao@debian.org>, Marco Elver <elver@google.com>, Petr
 Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] kcsan: Don't flush the consoles while holding report_lock
In-Reply-To: <20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org>
References: <20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org>
Date: Wed, 04 Nov 2026 11:57:32 +0106
Message-ID: <875wycc1jf.fsf@jogness.linutronix.de>
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
> Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> splats"), print_irqtrace_events() runs inside an nbcon emergency
> section. In an emergency section, every printk() flushes all pending
> records to the nbcon consoles from the calling context (instead of the
> printk thread).
>
> With CONFIG_KCSAN_VERBOSE, print_report() calls print_irqtrace_events()
> while holding the raw report_lock with interrupts disabled, so every
> verbose report writes out the whole console backlog under report_lock,
> as consoles/UARTs are usually slow, this is not good.

I am fine with this patch, but am not happy about the motivation. You
are right that it is "not good", but it is "not good" because the CPU is
being put into an emergency state when it is not really an
emergency. Even if the report_lock was not being held, this patch would
be equally valid.

I would even say this patch fixes 59cd94ef8009 because
print_irqtrace_events() is not exclusively used for lockdep splats.

John
