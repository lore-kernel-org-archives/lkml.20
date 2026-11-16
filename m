Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871813;
	b=REtnsAAkqe/xQ72CA3POQxoWkdflsLEDafDQoKuUf/ecphibnW7yblObaXnGcH1ANSag
	 C0gfmpkVyaM7XyeH0zEvRW/xnX77NxYuOqjmeMBMR8edDFELeTPErJr8mUk6wIDkYV9Ai
	 DqmlHJMRstWObCCqv2ij64kBKVDPF+QQLcqNckfYIl00vjZOQBIlIVRWcJJZ+ek0YJAJ1
	 yQXWnxbfMoF1LQUSO/6zkqNU3NZX/2wErExcwiQuTUxOAdK7ru8/q4CZXaIovBntqi/Jk
	 2qAIChuiHeQYtPzd1aeBehkWZqnfiiLlkfO8f3VjiQuZuJGzdI3LRpmlXoWVVKEozVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871813;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=iw4kciL6uZi8vCQoxpw1qYLyfcPUtc+yptZ3Ejy0mj4=;
	b=igZfJFPrFP3qNT0CaBYcDSLYZLIF+PMFYM0rFzregLDUmA+My6Hb0x3MkvgP/T6rHwlQ
	 VDE0Glm1HbobOpCEiSm170zb7qW4lAzUtff/Jm+qRUckZ/xLUgVT3RbjBq4h3thyYPfhZ
	 d7WRkFiBOYX90dcVnheE1oaogW66Ni78UZUdRl+Z6UsQrCR24xhGtEVl9e6c5E/fm8VBS
	 B/m0bea30+Zh4ktmz8WCT5cyd8+GmXbiQhQOWobEh0xR2Dz9sWJv1tYUDHDKPngMDUxAC
	 gaeTVSARlRHXNWVabiR0LnVeINKoKCJ6uzIKCTiChzmrF3/i2R4bdGftR8Y5DFMn1tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiafTEl9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39D3606A333;
	Mon, 16 Nov 2026 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiafTEl9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC041F000C4;
	Mon, 16 Nov 2026 23:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871812;
	bh=iw4kciL6uZi8vCQoxpw1qYLyfcPUtc+yptZ3Ejy0mj4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fiafTEl9cMY6DrG+a3Rb0L6sltWoVTlz19ygAl0LWArWLCLIrwgVwbMHSgWu2ZIv0
	 6XKZLbJz49uFhQH/esac/j+wIGumFajoZI+nSAHgac1rShYYLhpDTPeYjBY46A4ws7
	 hyA5aMff/EF0xNhGk/qdOH4Ma3ggTPgx2sbTXV5S6pb+oCMaWNDoDa7OuNiDT41KI/
	 jQtrcIm8m3TnHukefnYfCcStVjZUFRuf+RiBcjnxS0v6gB2BGBOSyzhy7/kmvINZI0
	 M7DJ+G4saecS6RlMFFl9hreBU/HfN8XqJjMDQwx0RNREXFmGBupNgcnBle7w6L0T3c
	 0pYz9X7fl0MNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4448391B059;
	Mon, 16 Nov 2026 23:30:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next 1/2] net: phy: use const char * const for
 phylink_an_mode_str
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487181127.238365.9845225429843133556.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:30:11 +0000
References: <20261112131358.106442-1-ansuelsmth@gmail.com>
In-Reply-To: <20261112131358.106442-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 14:13:56 +0100 you wrote:
> The local string array should use const char * const as reported by
> checkpatch.pl. Use the correct type as to mute checkpatch warning.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/phy/phylink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next,1/2] net: phy: use const char * const for phylink_an_mode_str
    https://git.kernel.org/netdev/net-next/c/5a71c5cfb6ea
  - [net-next,2/2] net: phy: fix trivial whitespace/format issue
    https://git.kernel.org/netdev/net-next/c/0b2309c0e6ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


