Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924007;
	b=L3WZ0zlalRHFTV4HtS/DzT0aJ53CdpWfu0YyvRY7vUTWG2Cc5dKdhEZoOVV/AVMeAARq
	 I1Yr2MTgUUbtlEe3KyF3/bJwuUA/qHyxvPZOIyJPt+/pA9x/23tZXY4c5THtyUJxkbKF7
	 ehVoWcDXhwUH6rb3c+hCAxHu0pizs5ddVKIyxx27o04ls+on66xzyVByBDM7IHwuWvp7G
	 JpWC8nhvySzidzlRluB2q9gAgpM89aGgjkyi14ZQf6xflsvMudsZF5rB9RhWsk3EyrDaa
	 LJ0nGkGLs0K3ZYvs7ymmhHF11FTlDoLmAXuYI/6rItqIpTOfdSncDot0HGsYAL214YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mxdgof000Vz5ORJZP+5WXGdU/JvR5z9YICxMThMmF1s=;
	b=Tc7gqzIbeqyc2o2LVNnL+L9Ida5G4YoS22J6m/Szs/0zv5bKvZutkHvoDIzIJ6bPKX9R
	 ArY5wmgCF+I/3ivvgHomzu9Ks0+QDFziphcgbEtfhVxifBpbivrvosyggIevrxANg3oM+
	 BNBG5yP/JQrurJz9xFga6ouOY/eGSTgcertl044AuxlVIlu962BBlOng2BwcAezTXh30g
	 fdApIi+sjVPhGOPa1Zt3dCo5o2Q34XIeU7+I2TFwObERj6y1JpjXcLLB8f1IrCX8Uddeh
	 TT+BgJzJzQ6jDDsx93KTNg5Zv6xcUqQA0dNDR2L5vYNAwPY3HqqAuf6N2VWHrB3Pnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kShyJxs/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED65606A332;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kShyJxs/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC21F000C4;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924007;
	bh=mxdgof000Vz5ORJZP+5WXGdU/JvR5z9YICxMThMmF1s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kShyJxs/EqUlHzDNT15IHiB1HqUG1go8Y3siT2kTz/CrBJXG+gUCyd9qK0sM3oFY0
	 w231hLSonV/VIoO19sGVJnxxC7lZ2u9d2AjDEhAEgzfcc69QB0c1GUSoHWahkLP6zt
	 JFjk2/Ag/vo7Eq1xEXxKB85S5e8rE6os8K4CaLUkpUxN8K9DzF6oSkqr+Dr5/Qbff/
	 +4nCKW9mtoNSriRUT1hMPUYgPsuVAuMLcjjlLV4iGYznZaAzuhE4r+R0/vZNDBv3n9
	 p7k8JiTPyBOzrY5ALBB7phMDp6lyiM5fzVS2khjnjvpdTZ8oY+NZInwjc2U8G20/vz
	 +O+lOxRTl4Glg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A385392704C;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/4] net: lan969x: skew the core clock by 200 ppm
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179492400607.603902.8524686313704472023.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 14:00:06 +0000
References: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
In-Reply-To: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, p.zabel@pengutronix.de,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Nov 2026 11:19:39 +0100 you wrote:
> At its 328.125 MHz default, the lan969x core clock is too close to the
> line clock frequencies for the high accuracy phase detectors to work as
> intended, which degrades PTP accuracy. The core clock should therefore
> be skewed about 200 ppm up. The PTP time of day (TOD) increment is
> already set up for the skewed rate, but the driver leaves the core PLL
> at its default, so the TOD and the clock that drives the scheduler run
> 200 ppm apart.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: lan969x: add the core PLL registers
    https://git.kernel.org/netdev/net-next/c/5f8d69a43e72
  - [net-next,2/4] net: sparx5/lan969x: enable the switch core after clock setup
    https://git.kernel.org/netdev/net-next/c/ae590854818f
  - [net-next,3/4] net: lan969x: configure the core PLL
    https://git.kernel.org/netdev/net-next/c/39d5dff49d71
  - [net-next,4/4] net: sparx5/lan969x: scale the nominal TOD increment in adjfine
    https://git.kernel.org/netdev/net-next/c/7e8651f87504

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


