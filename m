Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886209;
	b=1Pv1T7PJMFR0l10VL8MYWPLNySGxw5p81YxJUsow3e1iEBTV5TbAjmmbNw1XQxEdJNHX
	 dg/VeQ/JQVh8E0AnyP7+5RvcIKi/znSVExj5ZLMeCWz4qQF/XxrD62kQdNp9EfhQZ2wqS
	 p4RwsEZ5c8wUM07xYYYfo1DgZTM/UtIhR9Jbcqcs/RL+GXjPL7FzmtB/P70UORElgXFkM
	 sk/U9hQjTGL/1elHKzK3Doirb4oI70yXAgfMTW+wYdn21toFu5vqYTxKqL5RhWjcAIt1n
	 EoOgB5fo43jSH1rdLQtwoumgr4d7pIXvxmytJyRiQK9zp78gHL1gIHqxGW+CqF3K/mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886209;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=obpM36XFo9K+MAU1yMUOR/8rhFIiIQkcZVYvkSvSupE=;
	b=oiRCYg+6C7XwQh7vdCI9H1D7Bt9JvHIV0yy3YRUVQDDd3TX7/Ief2xty6Nr+BoXQmdQ8
	 y+8KXJin7hs4yGbHFMkcmw6Krw8Ia/Gr/3eRC/YVmiM8XAeoo7/Ol+PbIzkyYuoD0sGSY
	 Vlnm24qkOsAA9ttoj75yYM73GzyOk50+PBWU06ervBU3cjH9uebN6bD2UkbDvy+Ok46L6
	 DR60qYBq6RCZWrKLFU6FFaijhitRvngEX5hEvLjoRfGSIxw7gO8d03dcSGMfvSN7ulmh+
	 QqmuLzaR3NNknmdvEB7Nv9qorGfISK1D+kOqeEEkVnZZ8SE9Sz9BH+9ie3H3KQp09RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THl+hBAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F060A263E;
	Tue, 17 Nov 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THl+hBAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449281F000C8;
	Tue, 17 Nov 2026 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794886209;
	bh=obpM36XFo9K+MAU1yMUOR/8rhFIiIQkcZVYvkSvSupE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=THl+hBAyFz8CC3Z9eNdmq+iXKjeWCcJwwzi+QqjnpAuBGkpPvzXoLkfJ2thdXfPh8
	 p5QqvN9v2FOzNFYpX+pkQITwrS2v+vA1eaaptO5tOWKQDYv11sLis3yJWSlLSqqHPR
	 KgEK2MJayW+uEiCWtsBXGz5xwXUD/SrNkxPDPstpt8sWZmambXGoT6Th5pca1pOZ4N
	 YTb04nBAxrAkN0DAP3O9zMQZt7n9/QD9Iuwh9rkg+yNRJtYS/+6JBWaO3s6IyAu5jr
	 SuFUFgrpP2X6OsmSN2AntBu2G71urQnAvwMPNgFDuvkJaGQaGOl5DF9FXoJnczcrDD
	 1ni6/Sv0NawWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2FF391B0A1;
	Tue, 17 Nov 2026 03:30:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/2] net: macb: add some missing caps
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488620777.319349.13405973639311258100.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 03:30:07 +0000
References: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
In-Reply-To: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun_=3Ctheo=2Elebrun=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, nb@tipi-net.de,
 pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 16:59:27 +0100 you wrote:
> Out of all the compatibles modified, I only could test on Mobileye
> EyeQ5. The rest is information pulled from public datasheets.
> 
>  - QUEUE_DISABLE is important for suspend WoL (avoiding tieoff
>    descriptors) and will allow ethtool -L support for those platforms.
> 
>    The QUEUE_DISABLE patch was sent once as part of the set_channels
>    series [0]. Comments from Nicolai were addressed. Split to keep the
>    series small.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: macb: add QUEUE_DISABLE capability to 3 compatibles
    https://git.kernel.org/netdev/net-next/c/7175eb0400c7
  - [net-next,2/2] net: macb: add QBV capability to 4 compatibles
    https://git.kernel.org/netdev/net-next/c/3515d06ef5a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


