Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8162282F15
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993007; cv=none; b=lO0GzV5tpKAHqaXD+viKvpo3r85ILcf/76B7+qBuBxx94RF6ZpFPBChSHDlE6D46waFcIue37NNP/ZDzTGllO9nVdIXAlngpczHphBvL8Y9PQ1V/nSnQDRC75fR9/ozeTK/aoceIoTmOUw/UZaidC7Ic/qbvxqdsXyNJK+lKkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993007; c=relaxed/simple;
	bh=yWArJLl/sWwEjyuw9IpfsZcUwt+nH61u8iLpi1EMf/Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e2mcBscoBaJUsvWx0zKGjCWnFONnp6leTWsZR9f/dApvRt0tzzyeAU/Yl+ybxvMuBrBenuE5vXF8M+huHGW7Pxn/49bPRVtYqkVY17oD55ii7d4Wid5Qy/PFXDeIRXE5dQjWwzdMDGu2Ii/fTcZMCTruSxZZH7r5AIWfFvLqPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozD2Zc0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozD2Zc0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4330C1F000C4;
	Wed, 14 Oct 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993006;
	bh=pyl6fsjlALOtsNftcws3Dg1M1c+Tu/Aj6kAH2+RiKxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ozD2Zc0ev8bDoszabx2g6KdltOxzlkP94jNgr2EhArBDPMeEnPnKmBZtE9Mc79v8d
	 bj9fiekU/9mTTo9rXubaLhyRVcHI1olZBHABfyyhX9AYdmg9JQLffeDGYIMsRTNFH7
	 cwZ/Xs6PdW+S/eB3rBHRCCNYPH0LLubo2GwqQlg68zXI7/ZodfX+JA2kyPdR8dIIqM
	 mjP1uK2h6MUx8sE1XU8aqdP2EWrU1m8S4233vrs9d1zrxMip0ip6mN08qzTSz8v4Ur
	 TLBzFuqGLsfhuGw1s7NlUm+HaPzt55oR88DJ712UMrLIPweQgb5fnh52nGZqbQy5tY
	 ft8DOKvoskDJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A46339EDE30;
	Wed, 14 Oct 2026 15:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unnecessary reads in
 f2fs_update_meta_block()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179199300502.2827562.13039187494751093723.git-patchwork-notify@kernel.org>
Date: Wed, 14 Oct 2026 15:50:05 +0000
References: <20261002064853.37782-1-jsjlee1020@gmail.com>
In-Reply-To: <20261002064853.37782-1-jsjlee1020@gmail.com>
To: Seongjae Jeong <jsjlee1020@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  2 Oct 2026 06:48:53 +0000 you wrote:
> When the packed SSA feature is enabled, f2fs_update_meta_block()
> uses f2fs_get_meta_cache_retry(), which reads the target block from
> disk if the cache entry is not uptodate.
> 
> However, f2fs_update_meta_block() overwrites the entire filesystem
> block with memcpy(), so the existing contents are not needed.
> Partial updates to packed SSA blocks are handled separately in
> write_sum_block().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: avoid unnecessary reads in f2fs_update_meta_block()
    https://git.kernel.org/jaegeuk/f2fs/c/e8bc653c0d50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


