Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3C30B50D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219616; cv=none; b=ScjCVGZLGsu4CQHORuK4++Q2PK0sUjD5CiRWU1Zrn3YSZ7uBBN4o9j/H3kEJqP71dsdVc9vj4j2LTCp7rAS34yDO+r+98ZRNmu1N9yorlGywXuF+MPWLAHGxV2jCgil11BpLn7M/gFDSDgPDMAhfU7RxkZ/8tqJ4pbgzUTQhDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219616; c=relaxed/simple;
	bh=ewT1hesdv4MkSQGzg+V0stzJylVbS26L4l46syapVA4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i53txEGegBQCFfco7+QGRisH0gpQXGknZ+16dzp02kuGpZMWrKMvcMxWkon/5fzfYLytvpS5WPbifjH6egsRXBVCx8PSrKLfAnHnsO66bPkccK9Q4MbqCpAsh6YrshSP8eFmreO1cGe9ckGIARrlh6nzmNPrJVtz8hTn1TAtWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld8axjVZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld8axjVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF96A1F000FF;
	Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219614;
	bh=oL863QUbr2KktNxa4NPcahhyRHUXYgpw83Q5ivTFq2o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ld8axjVZXiUSSE4/o9p/XlQcYQL+VbWMJYUTt6NjSI1Smh2KDFfVxuCQzUubGVUgp
	 XSRKDFcrEg8eySCKyoSMeJRq1kSE4BAEabbujrqli3Latd6ZyauM9hFu/C9dIIFVW2
	 ttJcrRhijJaL5PQp2lL8RHSnUUcyopV/KeSeGopIMsg/FnEWzYXDo2RS5+g1o6sdKE
	 5Tx181pfwLUX3Vczcc4vuiw8jnOA1YNA18ZllGxYXxCsFDhC6NJL2P8hyVwl8pIQnS
	 0PP4qEhbVzZWVmLEJBsZtcNNq+p4yXtkq96QEGdFwjs9by1TiLPahxMTfZ6R2wmWQq
	 lyS15sevi9GhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43CC39263B5;
	Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re:
 =?utf-8?q?=5BPATCH_v4=5D_riscv=3A_lib=3A_Fix_ZBB_strnlen_wrap-aroun?=
	=?utf-8?q?d_regression_on=C2=A0huge_counts?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179121961336.1813719.13062784666984813861.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 17:00:13 +0000
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
To:  <shao.mingyin@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, mikey@neuling.org,
 jiangfeng@kylinos.cn, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn,
 david.laight.linux@gmail.com, qingfang.deng@linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 15 Sep 2026 15:26:56 +0800 (CST) you wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
> 
> [...]

Here is the summary with links:
  - [v4] riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts
    https://git.kernel.org/riscv/c/d3b055d5d168

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


