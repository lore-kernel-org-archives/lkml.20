Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883810;
	b=bXfgsXiU4K6wZkBFdw//NWjuhTH2M7qcYn4qPB49jQ1ApW0GwvvhZ8U2SWFdL4SoMIAw
	 HZ6DwSHru7/2yPjFSERNUlbrxcGq2AC8uusj1+C5obk9sFqaee5lomTHN6RTgjGcPm3Ey
	 JzTkJGJ/g6vwMjlL7Hmrhbe7S1dtCEyyR4W9Z9VY/vmcmxv67QyE2m+xRoh5SYtEDzf/3
	 myTIqi4OSn/ccDp4ELDD8Q9Te7bbQpwoebXEyl6pHU/9yqBeUT5qcyLjMorHY/aoVDgnD
	 n51K3sJaCQuGFb8bDKlspZ2UIyjRAbCS+v7VLnsb3r/bJ6CLWHNX/dOdXzCwB9jRwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883810;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=WyecgbeBs166spSfCyzCfTX6lVhKElsoYgGJBq1WKyM=;
	b=l1A3zvjThb6zjdogybFa1fBUTHuhrNYjXwCoLdpjrIYoiReiz9tlvlwKmTYkma5VnFQu
	 GcDdAgrfBzk1y5XTDaDFc1wXIGbgeU9cIlPcOjmWY9DHufhyPxXT297vGwRP/p+bv57Q8
	 D8/tPLO/xB8fnhRSEWrtvLaUhKi650ydfU3p+vO1pBomZAZMN9R0ln0ymrcGKx2WCd2JW
	 G0p7mdy3trU6G55XCfcMeUkwTXGEDZaqThdyXQbLPwnC/XScLHj7lBDYWJbbvfKFF5+Pc
	 2qllPy6/vymfOvXkmoAWoyXtY2FX0W2SFZFg5mCPLEatiNnrYgJXhM8hbrx+TzD0HFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJ2bvX7J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92409606A323;
	Tue, 17 Nov 2026 02:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJ2bvX7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0391F000C4;
	Tue, 17 Nov 2026 02:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883809;
	bh=WyecgbeBs166spSfCyzCfTX6lVhKElsoYgGJBq1WKyM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CJ2bvX7JgcN/MBJLhYWGlN9xnEwvrPcMMFYXSRFSyv6wZmeq0agesMH5F4IR6QbvS
	 +bEzhP049C4L/42MXWRh3UUILOVO+8reeu92bRR7I0FW0Pje8EVuIfa2KlPaon9qUi
	 y/ScD8g5MkYlJ3Zu45WDV6kcHN66PrOL17xzCKyTk3gN2wGBxOhO5JRtan5kgO6x+2
	 vAtZonvHDMU7j5oEyopmoZaHwWEm2XtLQLPCZu1RoNySz3LnI/7IrXLFtMsA4b/Rfk
	 Q1mbb7Rw3SylUUU4K6HoUSwVUdsVh+98qAA529wCdlnhZZTYByIoWngzpwgo1YO/RG
	 PuyE9B92oDR/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4348391B088;
	Tue, 17 Nov 2026 02:50:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next] dt-bindings: net: airoha: add AN7589 MDIO
 controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488380827.305876.10550611081255055586.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:50:08 +0000
References: <20261112190928.1318743-1-john@phrozen.org>
In-Reply-To: <20261112190928.1318743-1-john@phrozen.org>
To: John Crispin <john@phrozen.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ansuelsmth@gmail.com, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Rajeev.kumar@airoha.com, upstream@airoha.com,
 Weifeng.xu@airoha.com, zhengping.zhang@airoha.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 20:09:28 +0100 you wrote:
> The AN7589 carries the AN7583 SCU MDIO controller three times, the
> third one at offset 0xd8. Document it as a fallback pair on the AN7583
> compatible. Allow the new offset for the AN7589 only.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../bindings/net/airoha,an7583-mdio.yaml      | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: airoha: add AN7589 MDIO controller
    https://git.kernel.org/netdev/net-next/c/7f2ae640555a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


