Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8A288C2D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279611; cv=none; b=XETIUCwqNANUhuGhuQrqthlfSOx+16Jul+nQJorZYFPyw2tivvcTi6NC/Dubp93mIbLMzkU2mxO6SWJ4jqMBD2th3FFMNN9RibnesEl54zg+l4gqzIK9+h+dB5NC2qckXcFHBf0d6tFGU+lzsjzX17J+4NBloutmnO7EmVSr/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279611; c=relaxed/simple;
	bh=47AOKgfQlGomhBEanvGQF/lHYeTLHCT25l6OOJKXbVQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ea8pr8bY2kJvnBeBjgHp5fnBXI8KoE3w5E9j5CQ+CCPGSCnzlHhtpXTAv6391huqapjXfFh+wAjqKd5//3BOql83CayGhpfsd95TDAlp06YzkaXSrtA075lx5LYvEgsN5+cPzg8dRmYRAHBi8HGVmlCEfkzjuQ+UjNp+g5MOz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbHnaY6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbHnaY6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D591F000FF;
	Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279610;
	bh=6R8RMOkwV0EymoYmXscl5Br2ZuN1oYC1fXv6El8aBW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IbHnaY6EVS3ghVCrRzhMIgUe+eh0bxn1lifep1QqXUOz7qs4qdbjUsKFWd8tb6+FO
	 u+R+z8/Bw39bM58TNAMSpPmO6UU8jUYW3xN1vBnQ2gD3Y0bJ3fUhZr6KZldUvsZtcg
	 LTuQyD7qMV6yIb7gCkEXiX2GPh3jsWeAArR3+y/4TgSum5o5MK3Jh3eHqacEvSG+rp
	 kDjaRIiWMwWQfCWj4RdjTj9nY5P/vuVvjEiQFNsCOvQEqcE8f4KGPScXYJEm1ihveH
	 zNnajBdORx1S0xfFN/faMvY5IFOS1ynH3gnc/SaXd5MpqKkS3CayW0Yi/raH8hW/Vd
	 nwwKWDD4eGd7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2D23927078;
	Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 09:40:08 +0000
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, olof@lixom.net

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Fri, 18 Sep 2026 16:51:14 -0500 you wrote:
> This series provide several optimizations targeting system call latency
> regarding vector context management. Before the series, the kernel
> handled user's vector context in an conservative way, where registers
> were null out and VS is tracked as DIRTY. This introduce excess context
> saving and restoring when there is a context swicth.  Also, the kernel
> turned off Vector at the exception entry, making all in-kernel vector
> usecase take the serialization cost, which includes context switch and
> user copies. The cost is not easy to hide as vector code are usually sit
> right after enabling V.
> 
> [...]

Here is the summary with links:
  - [v6,1/8] riscv: do not read csr in vector context switch
    https://git.kernel.org/riscv/c/5fd018c630e2
  - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
    https://git.kernel.org/riscv/c/4740b934ebe7
  - [v6,3/8] selftest: riscv: test vectorized user copy
    https://git.kernel.org/riscv/c/52318cf0fa6e
  - [v6,4/8] riscv: vector: refactor vector context operations
    https://git.kernel.org/riscv/c/1a5c75ee3d09
  - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
    https://git.kernel.org/riscv/c/cc12e55016ba
  - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
    https://git.kernel.org/riscv/c/0d4b43a7734d
  - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
    https://git.kernel.org/riscv/c/6740ec489dd7
  - [v6,8/8] riscv: vector: optimize vstate operations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


