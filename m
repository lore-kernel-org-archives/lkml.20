Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965280;
	b=VkhD0XNF8mAvEZfrAGQDbugV3gU3BQ27bNvFZ7p7rtAgGjTLwLl1tnDI0khpLjYhhXOu
	 CftD9uofIGmcqa02PiObxA/EgDLAVTXZuGopO/eV66RXecD8AoDH2HJ8zI8D56B6z4vgu
	 XpuW8+FlHSBpct8xmD6PTrNUAUs1sv96pyT0kPWI8NsuegXclf4xtrqNWWxSYc8wHkrnW
	 wlhAXkLMHb5HHLoi6Ro4tRZWOmD9IeQmjAhPupxFz0pKtiuAF0MmbBYUtjzAKP77yDDxI
	 xNofGilQOKzO6g1JXOso+rnwD1AhibQDPQEHB9tP8lLKIh57XvlBK9haktzF4GIDGrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965280;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=yz1OlKipJzZhhHij999Ss6EXl7hHqu9Dxb92ULgABy4=;
	b=U7NiKtiNuL0aL4tl6k9sMTljeWNelcCXlSGw4gHic/qlh8N2K097Mywz3Edef32RmmYa
	 D1v1oB34V3NkN8AAntNra6Db6eVyl3U4izkcsKu+OcEy8gTwO7+nThF8AJuBg3BkEV2fc
	 CfdMmJSuO5l2ZyADocLaG0jRrYMTt9v2I2+KO44q3EDsjfC7goKt4CUi+fmQldVh16n+e
	 6AprJJ+jIrOCUUf7P+cejf08GCl+LFTjaM6uptih9t4JGlEhCeMqr33XbKtaHlN1ugkN9
	 LJxiX0HG/fxaqe1Lx2KyMW3oW+RreadS3KzW0YgBgKFVvnvgiRm+EBiUMFvfzQThLXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEhxH8rd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEhxH8rd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DDF1F01825;
	Sun, 25 Oct 2026 21:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792965279;
	bh=yz1OlKipJzZhhHij999Ss6EXl7hHqu9Dxb92ULgABy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AEhxH8rd88ML4kkHv6RKRTz5z5Mu1R6HrbTHcNSklxk46c+yxSGgbyuaWEwKVEm8x
	 2sxL7a0XSI9uE/wCZXUekEIEiU5aAOcA7HxlgU/X4iyrvV0ztUBGB1FE2PhOHBW2ow
	 bGyVol5gKp3agI0sBsuUtjUti2O6jFT4k0szpVyzHj/ca+O5Ks2MTuCqGSt6Nj4AKy
	 61RCUcM3uBrMLwfzTLxsZ8XtCGYXz8hKlVEpGdqFjSSsjN1QiEDrJtxIH2lkNzbZDQ
	 DWWv3Pdw4eSieYcUMoe/LdLWmnocmlX9XgSddh8SGBjVjSoYMCeo0pG1KJgNE1s6Sn
	 eEUhIYgVzlrpg==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: Watchdog remote CPU read timed out
In-Reply-To: <20260830141503.42994806.michal.pecio@gmail.com>
References: <20260830141503.42994806.michal.pecio@gmail.com>
Date: Sun, 25 Oct 2026 22:54:36 +0100
Message-ID: <871p9dzbs3.ffs@fw13>
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

On Sun, Aug 30 2026 at 14:16, Michal Pecio wrote:
> This is another warning I'm getting on recent 7.x kernels, apparently
> from new code you wrote a few months ago.
>
> Increasing WATCHDOG_DEFAULT_TIMEOUT_NS to 100us makes it go away, at
> least for a few minutes (I will try longer uptime later).
>
> With a few debug prints, I found that watchdog_wait_seq() fails every
> few seconds, usually on CPU 0 but sporadically on others too.
>
> Example output below. Is this something to worry about / fix?

Nothing to worry about. The message is mostly informal.

Thanks,

        tglx
