Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571437;
	b=UfqzCGMarXV1qhzK/6afm2YhcA14JEma5T3W6lj73EJpIh395k6pSGKrkvHMOsJECab3
	 YPtQfNaA4DejtwymwQdlNDlBnSw5efFNW2Vgw82LLrJTvfcvjTc9+NlxcTPMOLI4e95VL
	 YPcvKnZbZLGOwI1RPiQwuQKPt092Be1JKRQQslBQXTLYqScy3OvEdGZcJ896bBi2rJ/X3
	 X34drF1hT12duqGbn1uag1ZkkY5xJixXZW51uDBYfOu+WknX/oTGszkFo1Lr2bbNcEDWF
	 0x0JVVRe6/hQ7IatFnuTi+hNVMhd2LawYwSbJVcR/q8PzF4BvLuz2L0TVt/7owaTs3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571437;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=V96lGwQwQmY9ownZq1Q75CdhNhmGv+8yLE3JYgrASiM=;
	b=q8yFGFcJvrm5twyQ4QfpaZ7glKWtpNPGIC/Vxxh70RBplLVl69whZNZixDmEELpEBzzw
	 iglGGKCQitGHa04SuF2Ed529w9496Ryd4n/KUfWH9vZ4psVCrtezEpu3pUEkt2k7EE7ny
	 jvaFEZX81bcRs/6Tyq+WW5A0Xhh+aOzW1R4L0+4YRb7jUCa7HEZCIrFmNZEYOWP2U8nmn
	 yLxAWQcINIZVW/o5+CcEIbYamMJ2gndnCwYqApRK7tSbJWnyEfci4lux2a4E9M4eBXYd7
	 da6YTOIjleCl+v1xWfuxET1PPZvxNQ9PoCORdk1xK/exLN7dp/gpH+G+1NLsT9Og+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlwVJc2S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE46075772;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlwVJc2S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159F41F00A16;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571437;
	bh=V96lGwQwQmY9ownZq1Q75CdhNhmGv+8yLE3JYgrASiM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MlwVJc2SRLjk+rxKbOxp9tf4nzhdr9onLCTP2HLl5zTBQOiHXXA+GFydsaVMi5W2P
	 JBZ9w3HOiskfEd0RqvW648TC4LTAeoRnr0gN4lhW7JYZeWbfVgixO8rsWkmt0+uR0S
	 42G/D31sR+AI/6oma4rKjzuzBBq7YlpMKLd+zsNWQOpTXInxWl7KUOocRV68W4z5Fj
	 Wc8Qmp1gzoTlRBHnlRH4v7Yz8t/h83QJ0jDrpStFmCn7YAiNBOjP9GLbBBLQlVHpzx
	 ySzfZvJMC/w9DkTPvDwFbRM3Om4djHzgDuXhzm+inIjR+kpvU3S9cawnQfclA3HsdR
	 yHNmymPDOy74g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B96A38003B8;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
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
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi
 RV2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357143579.2624073.15759180385936074030.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:15 +0000
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
To: Jennifer Berringer <jberring@redhat.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hendrik.hamerlinck@hammernet.be,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, legoll@online.fr

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Tue, 29 Sep 2026 08:02:27 -0400 you wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
> 
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Tested-by: Vincent Legoll <legoll@online.fr>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
    https://git.kernel.org/riscv/c/789eed2d8bfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


