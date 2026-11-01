Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571387;
	b=aOpAXfgqaB/+MCgPUjjzUhHoVpVfpDFdC3PtvZXwyDa1ZrfV7KUn7aoZ9oSgD4Z8CA/Q
	 +Mte1GOu1i7lrLzKOm3EaJKCiw6I41HLqm+7THiIYOlUmCYgaVD+isb9f9QOvpZwrEkN7
	 /0AbJZrCim461wn8hHC0y9A41LQmxbZ1LMy+PdO//4JJjz9SEqHQf6SLsivkP1WRoABwQ
	 DNG5khuqmw1AUEb74PW+TQdvylJLnBuh3roaXn2mYGgwJWxWjWnp74fy4cyi7LOEJildV
	 f47Q6AAImlS4YPuNGbXEmi7/gv2cE85QXPMyW8ngqY0ttR/Oz1kAncrpMwmWmoEduPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571387;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=rAJ8RZ06DBUIxOai16Zk+EZsC0WH9KSq0EKHRtQp2Go=;
	b=pnc+6vb7ukNCD9tz3GYMshGUZlo/Qd0JFG8kFRcEHRy0au44kUwD7//shBBwcFCZbuMU
	 VXvGdh00QwiYlH/wW59z9Sf92gPP6BYnzIQwceV5kxfHTTTjWtO5LZHVKLgeymqGaL8HG
	 ZXz/733nP0DXtyNd3jlptWQ1tXdssdDxy8zABhc77v7uej5HjqvKFCrv3oSUEIlL+5ctb
	 1t7UYHx0yuwgYjfLtGHMVgZZmcxgQoJh7RQ+f6WW1U0pYxGMrJLVvJDJnlOc/oZia+2JB
	 i6gtBU8Ft6m+/HUZu+fNUx/3MCz/Lqq+zaoPNMzU+HT+k8kvt9F5XfD9N9j2KvH763g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XNxYgn1c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72372606D12B;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XNxYgn1c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5F71F00A24;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571387;
	bh=rAJ8RZ06DBUIxOai16Zk+EZsC0WH9KSq0EKHRtQp2Go=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XNxYgn1cUplcs7rMKZov+gVfZttekYqS9yQpibvTc0mS2GfcQ6qWF/XvEAF0BQrr9
	 78IOIiwVcitvPD3bCArlgVMVvVX8S7U31tAShHABo3SesCDuJWDNifsIDdXVK4uUH+
	 h2FEWa6InFp/DtcXtMNv4GnbPi9toKoUpfyXZPmdetpom7ggOyX3/PBjJ3VkFBPvb6
	 FXOH562IuRe9Ck6rt9dRTMD7hZTKgUTodyDzqDid1RP5KPf35gW3EWpqNJyIVwN1+v
	 yoDAuy54ujFR8gtcI7VTMGgepWJrnXj6dNDcTxPk6Fl0xpb3H4ffIZqyH0RnRVm+qs
	 hGKI/CcgZurhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 405F738003B8;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
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
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357138580.2624073.12710670293488013963.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:25 +0000
References: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
In-Reply-To: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, dlan@kernel.org,
 weijinmei@linux.spacemit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-sound@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Tue, 15 Sep 2026 11:23:16 +0800 you wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> [...]

Here is the summary with links:
  - [v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
    https://git.kernel.org/riscv/c/c37ee906b45b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


