Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873610;
	b=BqXHe7JL84kE2+Lc1dHlyQUurK8Ht6+hFSKYEqziunyOWy2Sf+oxrZghWUyXRbx7A1WS
	 PqaEMV7HdxTftDY3hA4KTbKFqozxSOenKAroTCbqyol3tQv1yDJ3YM46na+hsjFgHQafn
	 QAxfaFlhX/HXhU17D+qXbk87BFpRh38gRaVr4KtRXPg/N8CV7uYTCiD2J54AT1GoYmFm8
	 etcIoD0VK93oxVRQbS7DzYxEcZdZfSsPfRsnqrrzUV6eb/RzaqdEBlAVS/lleGJoG+c8w
	 xHZI20Ch0h+BG17Xj1GbJi+H3PWvQPDwVzxByj0d2NIi/4g7uyQ2sEqOE1MS8D95tzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873610;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=OdZQQt6syitoBc9C2HEDvAOoOewrXacI5OUEL4JbqQY=;
	b=HxHDCi3ThrudLgDhyTeqzyBFvnVWrtljBCYTR2c7/GYRgAcmsafajnllXFsS7qboOgCA
	 Q3xqftO8LoVICKJN7YHLRFQgN6Fs6+0nRk1khnmpfcRtg3RDjVRProRUBs4BP6ihoU0OL
	 al6sKKdQsyba+9hiR0DNHX6qL7bgts+yZfT33pqi3b3OIwKU8afLKuMRsoMzS0314dWLm
	 rOfVBNAQ9tn4D5K4lHVUk0QO0PKyImqJStvt3q18qZLUsxvSeJC862QRAd7zf18e+yTaZ
	 4CrKlEFG5tjEW5L7brgcXNa0/2G4nstEvRyJgT/V0ddLN4Eak8fh1/TlIDVtk7thMcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nw2+AGag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E6606A884;
	Tue, 17 Nov 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nw2+AGag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D09D1F000C7;
	Tue, 17 Nov 2026 00:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873610;
	bh=OdZQQt6syitoBc9C2HEDvAOoOewrXacI5OUEL4JbqQY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nw2+AGag5DMdSS05Miu0Qc/9mj4DJiULdGBeKA5tF1K0AB7XsvuJv8ayR46JaTYBj
	 jOsY4G7p5wElgK15r0JJFVTwRKcMOxuWT+9O4N4S7IwMv1iV19MMdCP5BdRspMsUOn
	 Z8zo86io6CcGydNJWr3+nacH88mhLF/J9Zdj5riAcabcSsTqzSbslp3m/x6mzZ5E1E
	 Ur0DgCmyxV3uUlZ4Db78HhG+d9LfnTpWHhQOF9rCR79rkKPQMMLwkuJliKQMPLQvj7
	 6Dz4oxM3uN2CGwLMqrDN0rLptSrZ2XglWlMkL7DV+RNm/9W5vuayCTfAn1olgEKDqE
	 vVzDpc7Jyd+8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0221391B06A;
	Tue, 17 Nov 2026 00:00:09 +0000 (UTC)
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
Subject: Re: [PATCH] net: kunit: move struct net_devmem_dmabuf_binding off
 stack
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487360852.250117.8355978177760085009.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:00:08 +0000
References: <20261113101109.3227815-1-arnd@kernel.org>
In-Reply-To: <20261113101109.3227815-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, aleksandr.loktionov@intel.com, sdf@fomichev.me,
 almasrymina@google.com, arnd@arndb.de, horms@kernel.org, willemb@google.com,
 josef@toxicpanda.com, wang.zhan@smartx.com, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 11:11:00 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The net_devmem_dmabuf_binding structure is really way too big to
> live on the stack, and causes warnings on my randconfig build machine
> with a reasonable per-function limit:
> 
> net/core/net_test.c: In function 'netmem_ref_test_tcp_devmem_recv':
> net/core/net_test.c:1720:1: error: the frame size of 1744 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>  1720 | }
>       | ^
> net/core/net_test.c: In function 'netmem_ref_test_skb_segment':
> net/core/net_test.c:1477:1: error: the frame size of 1584 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> [...]

Here is the summary with links:
  - net: kunit: move struct net_devmem_dmabuf_binding off stack
    https://git.kernel.org/netdev/net/c/271884902742

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


