Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571378;
	b=Oz9RqCpW0gtrrpceKHeOfSRNc4Ejs4mrmit3FVEOm7w8qTLgJaOC0p2hMCJGvxLrSBDn
	 kD3eLKUeFZeG+1Zx0zwEura3cZCEmVqSYTuV3giUN9sOOvmSW7/855gPj7JHcfpbJVkoM
	 DQLAHZAuZ6aSopRcC7fMjyndR32jzdWd1Z0Eus9+aU/p6Wu/DKPVt7ngCeSFUp0o8bIK6
	 KUToHW+AFyYG6m2HDrYW6QiZDqdh2/qcqFGtT7j1ckai42TP9NxkX/FAMsqBzMum1XPew
	 SLJaYeJHWE5RR8mgzmlHvaVwRieC5Jc1AWv6I6GtJEA7iDTkUEiBkcc1tNgSht2NNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571378;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=M/w8YBijKICyv173+X+mvFtJwUapRf2FeO+G+UMwaco=;
	b=yLVqnBIjvbkzP89FNlVinE5Ruz8FUGF6P17e6gN3OA2g8x2iS+/i+p8nBctfFKUaKBYz
	 kau+W8nbxcturkTyeTh7/+iaG131Wys0iS7SifySxTexNboGfgvG8lsC8XhXtpAClB4Rg
	 J7ua8vBSF92HeTO6ZZ4CsejoGEvFu++A+WK7iNo7DU/gQU03IidEVHl4cV4B4u7GtOUqp
	 OYGsWRbB7VaQnwmbaAhInAjpCSpTypXEwoS7rT2+ENVqA/OTS+lawPjPXMxI7fMVjUAkT
	 hdWo2nEYHlNCmVGWYR54XazcLl1dxlD4UqXJEfAHq96fkh16BvKqlXpC9ZDMtGTvzhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMnj3hsa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71746606A6D7
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMnj3hsa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A73C1F01579;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571378;
	bh=M/w8YBijKICyv173+X+mvFtJwUapRf2FeO+G+UMwaco=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BMnj3hsa46AOqOrQT2/Y5wnpFmHLimlftjstHkzvdSw4htP6NG1zM6u+BhYbp/VSw
	 V5PrPc96aMRY3rTe9PQZsWwTmTWqR/mlfrx4McZOajiVeNk2NGFUAf1cYOQ9LM65Hf
	 XbR9n3ByPX5BH9mYn+4glr0tKySkevcoSkHXJm9jO7oIPfR8EooJzqaRfzBNoqkGSI
	 2cA0HdfDULemdO0DZjp8DSGx9LhU5cEuU2CjkjAMOcxQUf7eBKp1YIkf9orV7pRmyn
	 X5NtSU7OSuOd2h+SAf43OmCudbnuM0+XhxatsNeadDNyJQ6abRx09/ufB13bh8EdU+
	 wR+OqXJKjJTbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401E838003B8;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
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
Subject: Re: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global
 config
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137690.2624073.10590886013198507782.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:16 +0000
References: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 radu@rendec.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, prajwal.n.oss@gmail.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Fri,  2 Oct 2026 17:34:17 +0530 you wrote:
> The fwnode describes a global property of the IMSIC interrupt
> controller that is equally relevant to external consumers of
> imsic_global_config as it is to the imsic_priv itself.
> 
> Keeping it in imsic_priv forces the external drivers to access
> the private structure rather than using the already exported
> imsic_get_global_config() interface.
> 
> [...]

Here is the summary with links:
  - irqchip: riscv-imsic: Expose the fwnode via the global config
    https://git.kernel.org/riscv/c/ff6f8cd2919b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


