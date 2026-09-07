Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484344398EE;
	Mon,  7 Sep 2026 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798996; cv=none; b=P44QJHXRJ64cx2227IX/OatpHgaV7M6cMxrqiuFrZphMaXzTyHzMJLUKWgORuKd9uG0rc9Gyr7GKuEcNwLoQMh24XG3Gj8ntlM6LuyOVciKoPnkBc9ddX/LrFyMsP6yifW/99ZRopAEltsAlaqzNQFM45zmBsNCdOXlju2LV9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798996; c=relaxed/simple;
	bh=oteqqPv9DuH1JXd6mdohItpzrDv3KXUeNpa+QuJgaek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EM9RJrXVpV9v+SFs5wzZtGHox1vLQMT1YNyEUv2FtDPbdQhCbwUFpNv3uKkIfhublIpBTLhB/Ldt/+KW/2nCBs2rpqW5kGYlbAQrDhOOeeiiYxyCBgpjq4REMkqiddufkdm5hlaksCRvwuuyRZq0cf12v8gaHEJQvkG0326fUvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Yg44DkR8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Yg44DkR8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4602A408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788798994; bh=OCizvl5QZ2uwcL1hN5gzlvEKTi9TSSVI3/8FfhrlEEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yg44DkR8fkqJX3epwFBwnD5BhRfOlqEtWYHqYSEOil+rYQozLfHVG+e4NN3NFMl2v
	 205QnouX0B+8Qzt1seU1Hpn6zLcJfYFPcEQmUv4A7YGCKschN6ecWP4ojoypZb6p75
	 twWb7lI91gWrq5PQDCmeoOn9BnwQoZvUMlgpvb55Le0nXqr2jJhTm6n3wEWTVes/+2
	 ECv0rRDXisIYBybLYAqvFxaV7rHtFbkRuhvgBW8rdFNE1eVrofujqu5IGc0KDrb2xz
	 OpgKDdjrwuLdx0ZqXon8Mpcyvpfx70JvxN1moaVuxEZp5M1ogLGtQDttJJuCvBhX9v
	 BqY3bOST1h6KA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4602A408FF;
	Mon,  7 Sep 2026 16:36:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, Pierre Ossman <drzeus@drzeus.cx>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: core-api: Fix the ISA DMA example
In-Reply-To: <20260905022310.82529-1-kmehltretter@gmail.com>
References: <20260905022310.82529-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 10:36:33 -0600
Message-ID: <87y0ddow6m.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The example never matched the ISA DMA API: the functions are named
> enable_dma(), disable_dma() and get_dma_residue(), clear_dma_ff() takes
> the channel number, and claim_dma_lock() returns an unsigned long.
>
> Fixes: ddb99f3d35b1 ("[PATCH] ISA DMA API documentation")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/core-api/dma-isa-lpc.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied, thanks (not that I think people are paying much attention to
ISA DMA these days).

jon
