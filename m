Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571367;
	b=g47Uq3GVWwQ4zo/MbzX84eY/cUDcBMx5J3Fnoq4ovIzFT0v4ZDbC9TBIJga1pJTt9c73
	 WpvFFbqO3nWUzF/HQCUgXybJowz9VW8nlv4wcoZCCz85CFV67ChEU5kyMF9JdtfujwKwS
	 R4SOdfCY3BgQOhqzY0qT1CH8kohROYY5J27D4ptDGGEiKUo/1OUDvm/uw+RwPWjyKzhcb
	 SRn+tWonDDeEa4KOYTpkt1CILOux8fzHFNDrNAxnAiP2ozEos6R9USRc9Uhw6wxTT5MAs
	 +Wm82b7apRpAT1HRESTUy3g6PxXdpN/KyeHPvxYK7SYBYSL2GYM88/a1fd0BStW+yng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571367;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=yOwhJ8iDL21N2rFwqgTxPabO0jpqD6bOtJ0oq4rMTEY=;
	b=ZhXvBunfW7jzqkbEP9N46zwUYqp6JSeJXcNMVrIxpMLKi3mLpgRLcPfMDUuUxTvN/AKF
	 rLOkX05iqBNKgiH25VDArFQAL69JUO7N/GRj2aqBq7EqUuSCy5jQxmIDHWbvcTy2GhfIo
	 yJW+e4qwXlorarOG2vnZxxLFjN7Y1QN4wXY+mwh2PQjKhc/GRpWVpC/y9ixckMHeBA7Fj
	 CSa5ATKIEvzN1qKc0vLM3u7nQ0nm/9Go2mBKsWBzZX/MtsfYcPbK0XLsrFnhcWhW0mOcH
	 cWRD/HtFdM0ykvup1ZimGevNl3mhvMRmUj+n+zA0u2Bdc8oPmTwce/kVbW6cU4n0yyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0LE7Vcw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132260A2621
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0LE7Vcw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CD31F00A1A;
	Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571366;
	bh=yOwhJ8iDL21N2rFwqgTxPabO0jpqD6bOtJ0oq4rMTEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q0LE7VcwB0OXK/2Y6z32l5qP7D/ewhp+oWwewGqagBkD7PA3oBQEfvIAFSIg0j0Hm
	 YwanWNzZMBC2YMXUDPJ+xa/rIhgppb+7fmRQATIZWZMKSfCDr90GE1TkQs1SvJAwuW
	 BLtcRrtwquF1DU2Y0/QIxvAA8JAZhBDTyXKvDPm87PAgQPRatk2uz0Si9f4C5Ht7LH
	 a8fYyF3qPbauZcAZwd2htXK3GZk/fAYy/yCkMCwCmfqDR1mwFieGqtn/HM3d0l/BZk
	 rJpovg0xI5deH3U7urjuBM5a3GSiFdwOH9b1RTXB8f63s+Cjgx68nWhP1BbRAW4d/t
	 7dXIE8mxGhQFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D29D38003B8;
	Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt
 enable mask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357136504.2624073.16513286116615894552.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:05 +0000
References: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
In-Reply-To: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-riscv@lists.infradead.org, radu@rendec.net, tglx@kernel.org,
 cmirabil@redhat.com, linux-kernel@vger.kernel.org, lzampier@redhat.com,
 pjw@kernel.org, samuel.holland@sifive.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Sun, 20 Sep 2026 21:06:53 +0800 you wrote:
> __plic_toggle() builds a 32-bit interrupt enable mask using a signed
> integer literal. A valid interrupt selecting bit 31 evaluates 1 << 31,
> which shifts a signed int into its sign bit.
> 
> Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
> The resulting mask remains representable in u32 on both RV32 and RV64.
> 
> [...]

Here is the summary with links:
  - [v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
    https://git.kernel.org/riscv/c/0f214e5bbee5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


