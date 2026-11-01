Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571436;
	b=3UpPkgsXZ2az22Vd+xbGnlr8YE3bTfnoJVJ956FyfqE5sqPuqMSTo8ixVZz526HC6Yzp
	 zJI0C10qHiPBb2+aRXqgbY9LDBCvvjttQfwFYZnpWahVYNyqMqDoRgkd7oED2NRDgEtQQ
	 SS5OyMvv3MDI1FzACXHubeo89p6B+HvMV2Wh6vX0uuez/4CliIVrPJefr4Gf8nZswlqxy
	 D61CjtWmjj2mPGcenHebJlnZKZqh7d8/K3zp82TtnpoOzozWOmNYAPgcggi96JmjPf5kO
	 5en3HFo6P8CTPa50z19e9E1kDqFhfC4kCA1gVewMo7PyphGBxq1QIeCzbdLotExccJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571436;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=W3SseAUw1Adaw7R24q7ka5OACCTvGj4w3HZoU07C3lM=;
	b=IeH4Rh/gk0fIMLgx7WWXCOx6dDX8uDZFnDKGlcyHJ+kO8v+qX5vGiSq5aLKoQkdqkW2K
	 P/tVFV9iWdxSFER0/qMhIit5ZgChpyZO85UD6qHZWoEB22SIub/7eGFKk4biM2z1lydvv
	 euCmx+CTOcP0/eJ6b3qfNuQWpKdoTVlU7B4jFxbVqrn74c6WK/69pPfljKLB5Y7NidJ68
	 9T2CRBGsth+EOioDwON7ExnbhgTW3aVSd7pkbDg9vv0aLir5jfTXKyFMUZS6nBLlNCSzc
	 B6mqXdqPa9gkTfqHEHsy5D6FKtEWH0M7hHo9OcgeOIUnXDIJno2xu1drB1CT9MYEcBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU2smauH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A36075760
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU2smauH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D91F000C1;
	Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571435;
	bh=W3SseAUw1Adaw7R24q7ka5OACCTvGj4w3HZoU07C3lM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mU2smauHsTpSk4e8o5VKlerWwdMjuW2RmdR8AA+TXE/q8eg2LBHimTGFzN+bxJWlF
	 k1bkTo89sPzE5TbPsJzPK3mhefVdXN4tiDH8cHAZpDwp4trNnwoRf66/XiGfVmJpwC
	 s3FuzrojyaL2b2uP62vOSTQd+4TqGoon2EIkdmJ/DIgzCjuikMm4iZU7A8taIufZAa
	 N01ab3ILH0PGIjJ4Mdar7ihYBy8vUwmsGmbKTgipSbuuljgnYErIeQJNZKrQB2iU5r
	 JjXniizbRhbYDeCQ1+jOWUNY1MKLKwokkcdJwAfDMFedOaRs9IWoD8nlMMQIqTzYZv
	 pcASdvIycRRyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA38438003B8;
	Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
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
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357143430.2624073.14407284284401354103.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:14 +0000
References: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
In-Reply-To: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 28 Oct 2026 21:32:56 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.4.  These are mostly
> optimizations, fixes, and preparation for work that we're planning for
> v7.5 - there's not much in terms of new features this time.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.4
    https://git.kernel.org/riscv/c/1b8b67503725

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


