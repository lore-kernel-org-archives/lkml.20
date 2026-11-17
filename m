Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883210;
	b=tTudhQlrTscC49cnt68hkDma661QXXv/KVkDPF6wVOyuv98M6f5Mngutl89e1s6mYY25
	 XIz5clpTz9hqy2TI0c63EiiM2JfvuNICq0gfrwPjMSBgu4m3R1qZTZvQxsPfTDVxEi9/o
	 UIacni/FegHxsjIeoWTnTMfRiQoBJ2V2Ggs24B++2zWwDshS8ENNX1+b+SxwUS3RibHTR
	 VgQ7+3SrVtN9M0nLKsQeQN+CDwzzgOE0L7a1sl+bJ1nC+7fBwmEnA/anh6Hg6SxpGblyV
	 tmOAKqelrluJwUN4oag6oPRvew7KMSXtSXpXofNx9ETyzBrpcMnR8IK0gT6TVMfdApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=X8I1zifAqnwMmcW4vAwYqXWI5tPDh39vSBjGAY6Y2a0=;
	b=SMKt3+LMAgxQwgkoC2n/Jh7OiiMWAHvy7sQMInRnPDzF304Gw1lXgVJqIYUJomxfPmaN
	 weeDJwtBJFTIRg0rOdOGauTn/uGyBn0X0O3PkSyJx6u25txJOs5UN1GmgTIDU3fPTKK26
	 /nLryG62whVg0kNqJ2F+FpwTfqy76JDzCADItvCfs9WlBKrv4Yoa0A2zqfn3b97xZe63f
	 /2iQioxPypaoenkDg5e5RU/uoM57o+NVBLpQ93JCjOLsjsXncBucwjaZrRpFRcJF8vx1e
	 Ixh1GI+0a46vyVPDas/uhkhUr6EGFQ5ASRXaQcqnmLsRQFsgs3+lr8wLtl0hmE9m9JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1n8E6EK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0729E606A31C;
	Tue, 17 Nov 2026 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1n8E6EK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDFD1F000C4;
	Tue, 17 Nov 2026 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883209;
	bh=X8I1zifAqnwMmcW4vAwYqXWI5tPDh39vSBjGAY6Y2a0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E1n8E6EK2t+0wusvUhTe65yXVkODUYt535VwQBVbCPOg0jtlJ4cy1DjBny4f8bThj
	 HrWaAA5gyiifesNvnSlpZLBDYFZjJlasNuTGhJp3fsXBLlUjuTy4D/AUX3ghQIRuWO
	 iEu8Ap45zEhg3brM07FDjWC2D4RTu5KpTvOmKlBXJOyT8+FRazVrxrEO2FB3KMAcbg
	 0/efxPHEIfPMrra5U+O176Gm2JQ/+1hDJVeTSjb6+EDEYr1P5Nqa5YGJyUNvVfEAn1
	 U33C7l+abTNRpt3toz1tV8pjRYQlY5Xvt5xITLsuPwz1+5urOoaKnjcNDF0M2ViZw4
	 H4V6L+RieDFSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4436391B088;
	Tue, 17 Nov 2026 02:40:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next v8 0/3] ptp: Add driver for R-Car Gen4
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488320853.300516.15277553314484783931.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:40:08 +0000
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?se=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vadim.fedorenko@linux.dev,
 sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 09:07:24 +0100 you wrote:
> Hello,
> 
> This series is the first part cleaning up how PTP timer support is
> implemented on R-Car Gen4. Currently there is partial support for it in
> some of the Ethernet devices that can use it, but not all.
> 
> The partial support have been implemented by hacking the gPTP module
> directly into the first Ethernet device driver that used it, RTSN for
> V4H and RSWITCH for S4. This is understandable as earlier R-Car
> generations had a dedicated gPTP timer for each Ethernet device, but on
> Gen4 there is a single system-wide PTP timer shared by all.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
    https://git.kernel.org/netdev/net-next/c/4b981dcfe5a9
  - [net-next,v8,2/3] ptp: Add driver for R-Car Gen4
    https://git.kernel.org/netdev/net-next/c/dbdfe25af31d
  - [net-next,v8,3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


