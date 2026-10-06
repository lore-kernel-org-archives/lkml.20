Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1568F3D8104
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279613; cv=none; b=of1wzXJagf3cnW9FAIpUit5H7AwLfjeb9L78nFTH1zS/xwlANJCSoKjAqy0A01gbua9nfjZNCkTh2KAIlBbxfunNVwNo7MoCrVg/GHYfcdKlT7kiv5582JiYfxcXF9I5DkbaWMSlGTUJJqdN91osoXHexS1F4Gpsb5YWu1kImRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279613; c=relaxed/simple;
	bh=kjKKHfSDgAnCrvhTtGSgYT9zPisssVEElm17L2bmNRM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UFW5c/0DfNzXpLWl3uihdT56WRXV4a9ppySjs32j4Bk0Rru9CQ1WXHm/OCzYZb2/z3kLuJKCuRc+UBgKx+Drs2nwy5er+1hgzIUf92imQD6gU4ci4MNRd8e/1OBtHUS78SjribH9oIAU4oP3YyhMJjd92yjXY7GmQxGdGCVUtXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy8xsc+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy8xsc+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDEE1F00893;
	Tue,  6 Oct 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279611;
	bh=bK7XBn5Ar4KTmrahMaJF7/5gSzcjPa7jKXochafzgvI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gy8xsc+Xbqko9lQlpPjponq4rMuHzWxT5aupBsoLG+veMtRMM7wLgrfWmFi4JryB2
	 /yTCVy7jvuG1/eEWCFbKhDhsv09xIS3jAJqNhZCHQ84/kl6mzBFvcfdcApOh7xsqfI
	 arh8eJ5q1mGS7jD4pdFScZMR1OB8xeoea9POg2J/rG0XntyECXcxjhMp9+71U1eZMQ
	 B9yWnpbIG1lMyg8HNSPqP0FTdR1hv3AjpgVsC3nP3SBtIcFTwTl5KYeozJhiJ5sreJ
	 tV90eD2hrvO+oivd5oO+Z/zk0FofkR2yw2tTnPKECfNexMZRBgglHiFo8n2cvYDKQ9
	 +tV0mIDrui6GQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43123927078;
	Tue,  6 Oct 2026 09:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/2] riscv: runtime enablement for native misaligned
 ucopy
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179127961027.2107992.5336345145060413081.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 09:40:10 +0000
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, olof@lixom.net

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Fri, 11 Sep 2026 13:23:58 -0500 you wrote:
> This series is the continued series for commit b94cec5761d2 ("riscv:
> skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
> makes the optimization available to distro kernels compiled without
> NONPORTABLE config. Now, the kernel can skip the software aligning code
> in ucopy after fast unaligned access is detected at runtime.
> 
> Andy Chiu (2):
>   riscv: introduce assembly version of jump table
>   riscv: optmize ucopy for has_fast_unaligned_accesses
> 
> [...]

Here is the summary with links:
  - [v1,1/2] riscv: introduce assembly version of jump table
    https://git.kernel.org/riscv/c/57ae2ff9fcec
  - [v1,2/2] riscv: optmize ucopy for has_fast_unaligned_accesses
    https://git.kernel.org/riscv/c/e76892c7ad3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


