Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883211;
	b=hm8KEx8WiEO7q/utybDf4sX/QK5VlTal0WPCCeuTfCK3vdXcrZ+Y/moUjxlOed4DUfEk
	 /cSwicYNTY+h8yrBLtzelu0nQ48mGS7R0+JN42x7PBGU86N6Q8NweiH9No7dGCUJXCU8z
	 aRkG5VY97K95rvM5gpNL3Yk0lcWIA/Ve4EFzXQTp+7g5J88zQ0SD4a7E6OHJKN9hLOwZe
	 tGesWwp8xYl1UTVqzlh1mvzEX1NRjnpQiN3hVkPC7+OvMiRJxYbhSZoyJiL+rR/1Bxgv9
	 QlJH4nbEoVXhvrpL/UUDhb3thMYs45541/qPvhM6N+PbOjAkLjyUZCpiUZEZQ+k5ArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883211;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=p9Z/0BbQGaDyQcSu1mdVf3G0+dswEC4x+xTDwChbKX4=;
	b=hfZ/lE7Jmyob0Ba3TzS56GgUWlzcPUm4VPocZBGiF3BlpN+GwwKQntSc9QcEslrY4RHN
	 ou0a+mhGjVs+cQREeNdTrTswCiRvAM3mNrESkMowqC7xOv6FsU+owWRPuhYCv4oBMLV0a
	 S42wZACawjYvCC1KWJx5Gjer5WdhkaIr1MeZU3NqIuUT/n1G2uAccCcpBnKxGz86BdppJ
	 fdSYXo+OaQsUPDkHh9PCTI21eEY25T5jvdgaKtJOiDIm6OrJPEIrwxK2G/Q7rycfHoJ3b
	 9j7tV0m0XAL94An384m74rYauYGOMt7MnhjEcDR8FtXAR/kNyiTeiBBuM5Wtd4XgiYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEi6DRYr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B60606A335;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEi6DRYr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463431F000CB;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883211;
	bh=p9Z/0BbQGaDyQcSu1mdVf3G0+dswEC4x+xTDwChbKX4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SEi6DRYrhBNE6Tl0Oo5WFx+6/UZ+yhSjc7VRQCI9YcG/cWn/GErLeVTtIdfQlMOM2
	 hKSC6rPIXDG/RXjHvz6cjSo3UTrLW5KA5b91YlaGIlpMTmGRW9PXs5XdCkyXzwFtLE
	 +BB/iZGPTcVblqcIx41toyP6bmfQipdsAzLv4eJl4PsmRa3PLDmFumYFfxOSDs6gvm
	 C5MkzF8O9n15ANciTKY5CTkL6UFMVr3PNOxhlLykuFaRCAHL1GoBoWIrkeqvJz8Oqy
	 aivs7VQ5bn9dQP2Uo7RHqkw4qjOoCOLbApAhuiRRXx+KPtNQEZiFU/GAa1wq3oWAPf
	 z6uVkPO7hTItQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A39F391B088;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5 00/10] net/stmmac: Add Mediatek MT8189 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488320977.300516.9034533489988553857.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:40:09 +0000
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 krzysztof.kozlowski@oss.qualcomm.com, andrew@lunn.ch

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 13:08:47 +0100 you wrote:
> This series adds the Ethernet support for Mediatek MT8189 SoC and its
> variants (MT8371, MT8391). These SoC integrate a Gigabit Ethernet MAC
> with RGMII/RMII/MII interface, with a similar design than previous SoCs
> such MT8188 or MT8195.
> 
> This series is based on net-next tree (sha1: d26955e57475).
> It has been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK
> (MT8391) boards, which both integrate an Airoha AN8801R Ethernet
> PHY, with hardware enablement series ([1]).
> It has been also tested on Mediatek Genio 510-EVK (MT8370, variant of
> MT8188) and 1200-EVK (MT8395, variant of MT8195).
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/10] dt-bindings: net: mediatek-dwmac: fix unit in rx/tx delay property description
    https://git.kernel.org/netdev/net-next/c/5fc5d2095256
  - [net-next,v5,02/10] dt-bindings: net: mediatek-dwmac: deprecate rx/tx delay vendor properties
    https://git.kernel.org/netdev/net-next/c/51c06131816a
  - [net-next,v5,03/10] dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC
    https://git.kernel.org/netdev/net-next/c/97c7a711dac1
  - [net-next,v5,04/10] net: stmmac: mediatek: simplify TX/RX delay handling in mt8195_set_delay
    https://git.kernel.org/netdev/net-next/c/8eac6d45af9c
  - [net-next,v5,05/10] net: stmmac: mediatek: simplify TX/RX delay handling in mt2712_set_delay
    https://git.kernel.org/netdev/net-next/c/c837fa3a7612
  - [net-next,v5,06/10] net: stmmac: mediatek: use standard internal delay properties
    https://git.kernel.org/netdev/net-next/c/ec09a48fdaf3
  - [net-next,v5,07/10] net: stmmac: mediatek: add RX/TX delay stage divider in platform data
    https://git.kernel.org/netdev/net-next/c/e6d6f4b67511
  - [net-next,v5,08/10] net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data
    https://git.kernel.org/netdev/net-next/c/2c0c0890f9f1
  - [net-next,v5,09/10] net: stmmac: mediatek: add support for TX clock output enable feature
    https://git.kernel.org/netdev/net-next/c/3b2120af0091
  - [net-next,v5,10/10] net: stmmac: mediatek: add support for MT8189 SoC
    https://git.kernel.org/netdev/net-next/c/46d8e770222f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


