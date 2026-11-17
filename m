Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918006;
	b=BjABsHzs6axZKYnoLxt6L5Ou9pApz+4z3es6UmzLijsFN6bHVfa4p/f8ODJZ45J+gHHZ
	 B2njRN2jahWuqTLUx6qBiTPbByhKCZbfXdeRd/zbsCaKZmFA0Oe+ALjxqwBcsvQTylI3Y
	 gbivp1VSe1NQbqp7g+XlfvRwQ9PVyJ5Qrkb4yNvsapIaRAo17GbKiv6+eilVyKBOuJpDU
	 X/pqTGudNC6Pg5thNK/o9WZOQMgYDH1IKQGIUYeDYs+rR7prJodSjrZ7ounsSef2gIj2G
	 ufL6+lUDIr4rFVvFTagv/TuLPiX1cspeBYxJEb7rZcnww6sjqRPZNeko5JKkHZVuwGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=dIC6GQqXVKLou+U/WOVLQXBv5bHNyz9EKKHU7Lxe6T0=;
	b=4l3Pq5QoZ4Pv6LmTKwOAsf3Z/bvSlmBh7NaQxt9nlOBCcG3+RbL51+/51Xg69Lg+1Wiu
	 y4sGw0bj8D2vzA3JthdMe2Ig73g1qOCw9ltdeGenj39/bsmzXW/RoEzNRMFRW0Xx4lHFl
	 eL0f3nZAsb1Jl0ek4X/RDxrrsrXFf+ymMyHFwh58P3k+PtmNFzftJXb65L59yT4gQhlF5
	 RUz/sijrPiQsPA5rtpSImODRfpBP1TDq+Bh1MJV8hlU5fJuROM2BeCGzMpRFhunRK/8YK
	 Zbfb9wm+S3OHP0x0dU6jE4GAsVnjxwwu/w+gxXf26rU8i/AJUr9aM3RFGRxXHqVVNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYeD63pM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86182606A886;
	Tue, 17 Nov 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYeD63pM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441D61F000C5;
	Tue, 17 Nov 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794918006;
	bh=dIC6GQqXVKLou+U/WOVLQXBv5bHNyz9EKKHU7Lxe6T0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MYeD63pMBd9xh5S7aUc0BYCmO1CGmHRYmkr+CjTke6T+UFMvMoQIvTwF6hgjKY9PU
	 3prV+CK2pJOXfPuR++Ajya073aGgFgPO5KfY79rx3cvoCL0fGID4yBd5zpEOREt3F5
	 M+lf/ttsLytRAAzmkMLercG9R/wplUepwHUzkedklMvEBVUHRfTyynIF7TuJLJz0TW
	 oMGY8JN+epKpHpE0JRqXM12ZujS6VyLObtN7+zyOEpovNcm45pkihMVzNcmyCDCr2o
	 F0N8C/iY6aRW7kZhLbiBB5cr9qb1OKzop4Io9E0rci0i+kWlSeuCGXIF5hhIQcpO+s
	 LH1NaOXj3zbQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A47D3926663;
	Tue, 17 Nov 2026 12:20:06 +0000 (UTC)
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
Subject: Re: [PATCH net v3] net: usb: cdc_ncm: fix out-of-bounds read of
 chained
 NDP32 offset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179491800478.546052.18043881095735155809.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 12:20:04 +0000
References: <20261112082022.995351-1-rc4d5a@protonmail.com>
In-Reply-To: <20261112082022.995351-1-rc4d5a@protonmail.com>
To: Ryan Prinz <rc4d5a@protonmail.com>
Cc: oliver@neukum.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 08:22:09 +0000 you wrote:
> The NDP offset read from dwNextNdpIndex on the 32-bit NTB (NDP32)
> path is not checked for a negative value before use. A
> device-supplied dwNextNdpIndex in the 0xFFFFFFF0-0xFFFFFFFF range
> sign-converts to a small negative int. cdc_ncm_rx_verify_ndp32()'s
> existing bounds check then double-wraps: promoting the negative int
> to size_t first produces a huge value, and adding
> sizeof(struct usb_cdc_ncm_ndp32) to that wraps it back down to a
> small value that passes the "> skb_in->len" check, causing an
> out-of-bounds read of up to 16 bytes before the skb's data buffer.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: usb: cdc_ncm: fix out-of-bounds read of chained NDP32 offset
    https://git.kernel.org/netdev/net-next/c/c1824744b3b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


