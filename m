Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571431;
	b=oetMS2oWmZqFJtmltPkDJwjrWG0EsOU4XpBTUDcj9O+1H0fDb+LF54e4lUlfREnUHTxJ
	 g+rY14a2xY7EVJF2OChVSv/0c+mVVohgz3KscKL97pbMlgw2ExpLzjYNtcbouFzNwZknA
	 uWmPc7XEfmVmuaJYVlJz8ssbn68box8VUQoXtuLXgJo0fnLJDnJEE9MWtfxX9THxymV1O
	 OaW/OFaeO/fbOgislP0Hn8iC0t8PDdXyAAb0w9ZT1RsLnJpgDX0YSFBvm9+h+bZPjJNbS
	 YH92rEQE3rFGjvz2+kQIZb7PnuL4lhxcu/8T5amXWEBMi7cAQl01GhsPUhopaWs7oiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571431;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=z6WmWsGkP7B3vEQH9vudiLJJb6lZ4nLw+ZctscqAZ6o=;
	b=RvlUQlKHgeDQPGUS9FOqbAurEVrnSCAlCvR4AleD2ve5gM3y6AV/3UbFWrXTMCEoVFp2
	 I8ky8JxWJHh5umJN6YLARnWBHKBJZ9R2yr3j5zImfxI24Gaqs7Bg7F8Bu61T7C6UlibC3
	 DDE3J5rZlldWECAN6tTfuv3HP6npVQ9anAimL1SFs8GdEkGvVht31E+Snq72HcuH+cjEh
	 4kB7j4GeezvF3C0pAzbfy60Dei2HtSFDrc64p9rVjRx7LEcygX92NZooXJj+ylnHCUNCD
	 1+J4LxuKhy9qi55sqQkG1wORqpHR22UrRuY4Oyoj7ouGc6p0fTw+ylcT8R4DgqNBmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+ppPjbL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFB46074B78
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+ppPjbL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3021F00A1A;
	Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571431;
	bh=z6WmWsGkP7B3vEQH9vudiLJJb6lZ4nLw+ZctscqAZ6o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B+ppPjbLR3m0KChrwzNHgrHStujRlV3kj3jydHfOGJx++Zw1FtEQ6AqvNZGQK1lb3
	 Yvh7S0GfPbFAxVwmb2/Sx3zNxW+8xUNPK8Jur8sAC5RUM2SXOc3DFwyTMna9ZZmfNc
	 ILJjUtUQnvw/RJGq74RnToldg4tzDq8UQeWV5v5gRdnmSpzItgHRXh1nOGjTW5rJ4g
	 5+FZO0/Xbg5/s2t25b/6Xzs7Lu3nvaJ7IC3wgt0Fm1fL4Uhcy48Q9WqFWKdECik6bt
	 YqyOuZUkueoD+TPyU3ABO//00sLfj5FFK4WPFIkSaNzkYtTFye2E9AypcbDQHZXJOT
	 Ng6Rkg9dipULQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4017D38003B8;
	Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
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
Subject: Re: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357142979.2624073.6945468592724595893.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:09 +0000
References: <20261007121743.192486-1-lgs201920130244@gmail.com>
In-Reply-To: <20261007121743.192486-1-lgs201920130244@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, ustc.gu@gmail.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Wed,  7 Oct 2026 20:17:43 +0800 you wrote:
> After kref_init(), the device_get_match_data() failure path frees the
> mailbox channel and sys_controller directly, bypassing the matching
> kref_put() for the initial reference.
> 
> Use mpfs_sys_controller_put() on this path so that the initial
> reference established by kref_init() is released through the existing
> kref release callback.
> 
> [...]

Here is the summary with links:
  - [v2] soc: mpfs: use kref cleanup on probe failure
    https://git.kernel.org/riscv/c/6f77194e1147

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


