Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111601;
	b=PDG9jZS8qsW6Ml+7hKST2X76Xs9VpOQRiDxvEIFuV6HdD3EcHyW2stqoXQQYp/OZAV3P
	 th4C2MGzfSILkNwy0QnkhlsxyKxSBYUanu6yR4J1/iCJuzpe6pk0HO3sHUJmwm6aWmftJ
	 l6eAggH2Mfzub9I0Ga2d+lDrcGQDdZZEu4c6aMVLEYYnZkaDa6zQNwBHNqfuPIwVJUhHQ
	 PPkN5Yi0NOlZhw82A5Vxi9timXr6Z15Ai0VuCCFYggjL/QCursgppNjFCkZ23N/zfy6Lk
	 zeXDqDT7ByPApdW9c5IEuAAprlqi3vLMHBStGiTf5nMa3G7/hD27NkhjIy/bRBhNELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111601;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Pxqv64jRbKx43KYFVJcBjlbQu9GgnQaRPgNsGJcCI2s=;
	b=plPgOF0LfMHvEDHiQPI7r1jDb7XT7MfazjXdNpd/M7cVz6TOzEQM/oxD0JulNPf+Uxk0
	 B+tPaAwNx0F4PFzy70gfID776xIYXjw9l1FJVG4SEwcYa4PsGORCITLHhSBB8zMbLpqXv
	 J7xTuGZFGlC5pwOcFdLqnR44F9dmtXxo8+zfac32Yq4vkI3w/AonVDNc26LjPdJitTCgJ
	 1L92+9F8J81EYT2ybQxL5+5wl0DpN5kwUCgvrLhJtfo81Ak37qBtJXGKAbTBH0xt/nCK2
	 njzpf5/M150gSN1irEFKWJPkwJ6pFMjsSPvE3n+Hl4EP9A7bSd4qLtrPsGEX6IDOrDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/42o6Mg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E99606A32A;
	Tue, 27 Oct 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/42o6Mg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218031F031E2;
	Tue, 27 Oct 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111601;
	bh=Pxqv64jRbKx43KYFVJcBjlbQu9GgnQaRPgNsGJcCI2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L/42o6Mg5f2S45VxDzO15bacgo0AkxvBmJA/KV6SqumC3Y2QjNTvH1RgflJuWVS94
	 cToM/Wzeuz2TGS551b0q+ZFRczWp4ANnLAG0A9DojlzNerkDHQdeX9X0Fqa2jwlUjP
	 ueNKAhRG4LP7cO9b9WQsq67aQ1HYDHYyNEzF12XHU3i6veV3crOEjAdytXAoTWwwEX
	 pWtJpekhEbkX89z37ZJq4sNStppLUy0n0i9XDfVBVEzLO924FQbth/CKbHaZf8EpF2
	 WXrwd/1k2JymtZ/XByicDpL7gUY0xXVdu+w6ojkHhZJF12W0GpPJ1FvM7PJ17aPiKZ
	 npJmPJaMAxtVA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xLiEo-00000000Nv2-37pN;
	Tue, 27 Oct 2026 15:33:18 +0100
Date: Tue, 27 Oct 2026 15:33:18 +0100
From: Johan Hovold <johan@kernel.org>
To: linfordWu <linfordwu@163.com>
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix loopback Kconfig help
Message-ID: <auC2LiV6564Z1zFg@hovoldconsulting.com>
References: <20261027142258.1720002-1-linfordwu@163.com>
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
In-Reply-To: <20261027142258.1720002-1-linfordwu@163.com>

On Tue, Oct 27, 2026 at 10:22:58PM +0800, linfordWu wrote:
> The loopback driver help text describes the debug log class and names
> gb-log.ko. Update it to describe the loopback class and the actual
> module name, gb-loopback.ko.

How was this issue found and fixed? Did you use an LLM?

This went unnoticed for 10+ years, but a fix for this was posted just
the other week:

	https://lore.kernel.org/all/20261018172711.8013-1-sowmyatorra@gmail.com/

Johan
