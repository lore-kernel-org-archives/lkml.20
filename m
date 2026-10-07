Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A93446A6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382832; cv=none; b=B4PrpP5OZArwkXetJR7tjNztA9/dy2qg5SGCrYI0cC9gt6JuQVgeUTq5SL2OScboxDIVoxGBxiGAfkaAyz9IcPVZbvtmUxfXxnswctGrMN5pMiWUt359gk+ViWiUvmXTaV7bCke6OGSv+X+dwKOV66uvIOI7h5lBvv74omKbm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382832; c=relaxed/simple;
	bh=8K+8662bBOkmDucnReVwJpxMPEHl2ANKxhadjx950ks=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LJ2QVagcTY5ee8v3X61kwkt+iLMo8Qe0eU64aFW0JT2qcxLFeEC7ucGwxT+P4lQJSvHPKBNNNeI1tKfmkDCPO6WhII8U7t2vf8Ppr7Y8haAS6r5HX6981C/SOwCWSwgeR73SsHHIhKJbWNiP5Zrfs1jqM+Cf7cTybuf1MWu+TYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLIeWLZQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLIeWLZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059341F0089B;
	Wed,  7 Oct 2026 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382824;
	bh=kavN39jozoxAFeQQgnZ+m2rZbsC8+K29xHzjh0azB4k=;
	h=Date:From:List-Id:To:cc:Subject:In-Reply-To:References;
	b=cLIeWLZQsv3p8WDNzkrqV/m1YxkI+zIAUZS3iwoCn3iY+5LntbJM9/NN4/5Iu+krl
	 ociCq/R35FX9zNHv5P+7fy68abHzhPnl0f4MlipqJ9Es8XIDvh1D/2OefqO3wxSWL8
	 ShoNydlm3pJX6ahZhZ4gi+YtlM7fbw3ovPIAXlzS3bE2SVWF5Y2MyYwkA8jIv2Lynf
	 5+Ddv2fAoygxH3BBIYTqNBMU0a7gnolJc6KiBee/jPGh9CsWBsD5RRry8YXsiESM+s
	 LcHs3oKbjAdl2Gx52nT9ABT7AWY4lNSyrBy+Uo+JT1g5azHgEX4ttQjQr1ryXe6cEK
	 2e9lJNBUFdPSg==
Date: Wed, 7 Oct 2026 08:20:18 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
cc: Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
    pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    andybnac@gmail.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
In-Reply-To: <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
Message-ID: <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Oct 2026, patchwork-bot+linux-riscv@kernel.org wrote:

> Hello:
> 
> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:
> 

[ ... ]

> Here is the summary with links:
>   - [v6,1/8] riscv: do not read csr in vector context switch
>     https://git.kernel.org/riscv/c/5fd018c630e2
>   - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
>     https://git.kernel.org/riscv/c/4740b934ebe7
>   - [v6,3/8] selftest: riscv: test vectorized user copy
>     https://git.kernel.org/riscv/c/52318cf0fa6e
>   - [v6,4/8] riscv: vector: refactor vector context operations
>     https://git.kernel.org/riscv/c/1a5c75ee3d09
>   - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
>     https://git.kernel.org/riscv/c/cc12e55016ba
>   - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
>     https://git.kernel.org/riscv/c/0d4b43a7734d
>   - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
>     https://git.kernel.org/riscv/c/6740ec489dd7
>   - [v6,8/8] riscv: vector: optimize vstate operations
>     (no matching commit)

Just to clarify, I only applied the first three patches, for the reason
mentioned earlier.


- Paul
