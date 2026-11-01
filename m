Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571368;
	b=S+kNUgf3QwK/0r5b3jf/r/bKdi3v6AeJn/rrjMRXQVyt5XP78LK8GxayizxvScbx04kC
	 bmT4BEHBQHhpumjB2P/Vw+79DNOQ41LCghdIE4mfzaDcCsnbe0BOAXjRR3bCioHfvEcJW
	 W4OBpOI7AIc/383p2j8csMefhqzkWObdZpDXX6FG3dg/wzsS3EQTEX5LImFzqucnyOPT0
	 xjL62+0MoJDc8XC6uY9jUigqEZfrkyIVROILlVqv66D6AzySiB01Iqj3Rr5Jg2qkPzvn8
	 JQRNIm5TEIDRLZhxgl343w2aTeX/E6Qx5roSl3pH42jT6T/uS0KEcMmJmdYN628NzMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571368;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=DTyMWj3AT6PQDRViOTg3lLSY2rCp6BBYDI+KtV9uL/I=;
	b=B5GQmkENZiQ5cqqNX7P61FfpaFPBm/+7bukrGEaEb/YMqPBhF/o0fjy2dernjstvo6y8
	 dcrB+8gItjlmyAjvmAIE6dbf4D3wXcS0NprW2c5dVCBSjjL2RcrS9uxuKkVE0YOuK4ysM
	 ys+HoDTdNrUJiaB7N1jGWBsUyfWK8S+UneK2kQIp1I/v1KHvjSwZG6n4KYnvRcVh6W5kz
	 Y/FBTbX1GHePQJOptbS7EErqSvMrd0n7Y0rGlOdOEsNkyz649YhS8wGjVMkNqXnN055ou
	 S/37d5OM68pPFORgnZ8BP71c1/A/YjDqhb1N94WXv7SBFPEubf9DvvKnjOodIoidbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvnYIKWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BC60A2617;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvnYIKWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7601F00A17;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571368;
	bh=DTyMWj3AT6PQDRViOTg3lLSY2rCp6BBYDI+KtV9uL/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TvnYIKWgK3K56H8k/lBX0xa6If+Qdq7bQM8xoOVGOkvcaM1m/O89XuHXlGFJBFKBu
	 e8JY7A+laExsLjix/LjcHXZMnuXA8l78XdI18TWfUAD27sdRQG0snyfUKSkOlHOsYd
	 06NQ94qv3lBfhpD5ug3r4k//Uzh3XwNCJBIIAsnDTD+2cSbLdDYsrUGmeWLAptJ6HU
	 mX+fGPKLnHUGiIXNay4F4UuURMKmW5DXXx9tuMBm2SmaSdzFTHEgspetliWlmeNI0k
	 OS+rhLhqhRe5/HYd8bgOu4C7Ql2zlW2/ledVaUcrxmQCt6Bz4A2Z/Di2ohAmE95OpC
	 gPTG3mFDhia4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 035F638003B8;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
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
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357136654.2624073.6255795227860356343.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:06 +0000
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@kernel.org,
 tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@kernel.org, inochiama@outlook.com, radu@rendec.net, pjw@kernel.org,
 samuel.holland@sifive.com, palmer@dabbelt.com, anup@brainfault.org,
 docular.xu@gmail.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, conor.dooley@microchip.com, ganboing@gmail.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Fri, 18 Sep 2026 00:29:32 +0800 you wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
    https://git.kernel.org/riscv/c/73329198cdc2
  - [v3,2/6] dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
    https://git.kernel.org/riscv/c/c9bae665035f
  - [v3,3/6] dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
    https://git.kernel.org/riscv/c/08257b5b3d38
  - [v3,4/6] dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
    https://git.kernel.org/riscv/c/5397ba147c28
  - [v3,5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
    https://git.kernel.org/riscv/c/b424b3b0ab92
  - [v3,6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
    https://git.kernel.org/riscv/c/cc6371a7f519

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


