Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E23A380C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791427209; cv=none; b=XGBuqonrtz0h8xlkcoEt2fF+6l4PTCliVRCX7V0FxCo3ykc6VqakcphlCgwp84V3BNq+pK6C0KdOWkwoGAe/9mVPDFOQV+PAmpbp2QD3z3jyutAL4rJ2wF0iwYPkkvYFTFvGeGW7aRG+CPzn4HyF4X3UnvtPcNxavpbfZyJq7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791427209; c=relaxed/simple;
	bh=h+2up3CSZ/uCOYqdg/6YJnLknlfhSLdNSJJwytATEVc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gijmchRqiAg407bY/TOoo2H/8m5WO15biCFJ1yA8wzCkGbEc/0DVv4cd9H6CAb4w/ps82dlvdfwspzBZ30NNxjVJTcczcGqjcqr5iyrxkS61lUQfLvlLYNNQkpaUfJHYJIhdtdEFVX/SMj7VB8y0xFqBLsTHXYTfneryClMln1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsbNX8CB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsbNX8CB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DA91F000FF;
	Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427208;
	bh=i4lOFLDXonP7XHOPVAKuyjxIsmz1UU6f/87d8eQWzd4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nsbNX8CBCxSqnDeFUNsikP4KoXyWbAmdz4Z06R82U0ZZJ8lLtbjZPTjblisM9OmD/
	 4as/NbKeRHYzu5WKLgx+MeWn3yAibBRt25lA8lBI//HzhQh95CTk1lFlGV+oo3gRY0
	 eTOMvc61wJa3fg05kQgZ6DZJhDHtmijg0i1+GFV1ic6mJ5L/ixeMwOT6oDNUQSKbp9
	 XACX9nMXMyi1JFASD70sdtzp+srsr8ByxRqOURkpOXEQMgxC/mDFDBzW27Tqrl3Du5
	 eowvWxDxv3H+KmQXap5gmKNHaNAswx+/E3q2LQUOEqkWVSsaWHXTttgg/8HPeIECvY
	 WIB3A4+HWRv9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A31C3809A09;
	Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179142720678.3779518.13917194238357828513.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 02:40:06 +0000
References: <20260907190750.26303-1-kmehltretter@gmail.com>
In-Reply-To: <20260907190750.26303-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon,  7 Sep 2026 21:07:50 +0200 you wrote:
> The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
> unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
> an 8-byte load: it rounds the address down to 8 bytes and derives the
> shift from three address bits.
> 
> On RV32, a load starting in the last three bytes of a mapped page selects
> the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
> the register width. The caller gets earlier bytes instead of the string
> tail followed by zeroes. This affects RV32 MMU kernels built with
> RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
> and lets dcache name hashing and comparison and strscpy() use this
> path.
> 
> [...]

Here is the summary with links:
  - riscv: fix load_unaligned_zeropad() fixup for RV32
    https://git.kernel.org/riscv/c/d4f25b097e46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


