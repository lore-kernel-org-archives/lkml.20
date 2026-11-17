Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873613;
	b=lZEC8S3l/PXgEcG1L9MDMoFBA8bunY1SlNoD2Q8aDxhX7BcNm46o/L93jmK/kdVME5JE
	 6H0+D0i8wtxCr7JiGD6mzOD+KHSsl81t5ew01ysIul0sNlSyAZpVGLXIXM4H6AiNWciaF
	 ajTEnKCDJGszpOACfq7buRae5gHK5cZCurPWEPhhApA5F9adLd6BtlGooUEQoTNXYHnql
	 3RQGAJ3wMTJSAUycuTAJhurrh/zZ0LOqG5bwEJY9KLSRy844fYeS4CYguY4cPQVfFhPEC
	 2VLkzII9HBE0KirsC6+3SOq6o3GoZnlBWRQMyRe5OYf9NLl+CbWiMtMBj3/ObWYpdwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873613;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2wghTaLv3bd7cxoSQxpRSgUbdH9hiZjTo57P7TCO9lY=;
	b=gVICgvKKE273BECf5zhQMg73baf0gC+Z/AI85JC1IERrU1vgpsIsbkYvUwPz6wIgbBhq
	 qVzK9YEdMNb1oiegcUm9jtIrdqWd/kiBGLPlnu9PFr7VW2orpRyh3fKVx9GpgMpmDOssU
	 kncszX1S84FKc1h/BV/VNKIIfT9oLxuZEt2pKEsXbC66y44hP2OYqlDpXb7h0LiQh7Pi6
	 9hIu3fD3BLjGf4Y7jZkRi4FlBESaHy3m8xftJQRGlOPNRgTrn3lw5g0Wj1xLNLfmiyMk7
	 f2dl8/pxQqE/nt9cPXJwqfK2sJmpYP2guwcja5wpG2134IeZwwDynxlsYa8qvzlgtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UiTeGyCY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E978606A888;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UiTeGyCY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3D71F000CA;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873613;
	bh=2wghTaLv3bd7cxoSQxpRSgUbdH9hiZjTo57P7TCO9lY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UiTeGyCYpcbiQOHt/hLZ4Qfo3MvpY6j3jmb0EwgeJnBq3ZU6JiIh5gjRTeUAkyFm5
	 kk36ipkaGNEQT8lOeEtcKmLFzr7hTNKW5HqxAWJRwR+VfPQgfwT90CLP2q4gNaoYBT
	 jR8TcH9sgvhWvMmE+c43DrbxfrAgNpHbyuRHRTkkSN1b7U5mVOS+q64ES3TKkzyU+/
	 sO3Nncj5dLxNqrrGZX9DMk3bCrfPE4GfblPCAAd059sk5xxgpDWf4i6U8Msstwej/P
	 UUKdkIHZsBgiXbbeSd/Mx477ekwBkPB/RN+kQ9uV/tNK0lv4Wcy4aEMVGexayiyFsB
	 TcY6z11uoiUdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A31B391B06A;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487361177.250117.1599495795624921279.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:00:11 +0000
References: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
In-Reply-To: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ot_yanqing.wang@mediatek.com,
 brgl@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 11:51:30 +0800 you wrote:
> mtk_star_probe() gets the PHY node from the "phy-handle" property
> with of_parse_phandle(). The helper takes a reference on the node it
> returns. The node is used by of_phy_connect() each time the netdevice
> is opened.
> 
> That reference is never dropped. Every error return after the lookup
> leaks it. Unbind leaks it as well: the driver is devm-only and has no
> remove callback.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk-star-emac: fix device_node leak in mtk_star_probe()
    https://git.kernel.org/netdev/net-next/c/b78cbbb527ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


