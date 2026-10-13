Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD355563285
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930626; cv=none; b=pT/Fyz4d2Df/TEMyaB4nbFzNwsnTZaqJdojN/4w0znYREhha2Mucv9UCOHysd6VZyAbqHgUfLRdhMgsspLpC68Ahb1THPwCIiqrYtgKLCB5p01zG2eX6llw0f9O1fX8I3oe1bmH5wowVHKG8oHpBIu+W9KHNRVpZtXGfiGTbHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930626; c=relaxed/simple;
	bh=uUhrUR9bczmt0hZYjxOiVmlAgXb1pWlFlEox5m/zGPk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kwJUpP+I3W4sWoxYAaOP87CE5GeWgDd94yklbdjcNEoKZNBcak4iNudWVL5OS2XuY6/h+K9lpq/LLVdUBCaD31WORaqCGnAugEwWc04Y7bCIkJsr2geQb478sN2IpE06BixfFOD7H2RR8ZzM2ERettPddiSJOcfZLwZcK80RsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di+yxQHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di+yxQHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D241F00893;
	Tue, 13 Oct 2026 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930621;
	bh=Z7koH2y0BTGH8zmggvnZ8uRcI1N0rUKHZJp7eUeYBVo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Di+yxQHLzuhB2FlSKW1Qs30YUTePeMkcVUwDhVbngaMj8yMvjKoYDCKMzUQ3DFScH
	 abibWO/XWKYvoDaY9aL0m8pikuBrclR5a4gVhUdQWssuuPxkcoK8vu8BIZs2xXg6fx
	 Rnlxcepglv5Xx3CqFGAVROzBiK7ShPmnCAyR6YWbAYL5TlHGERXMUF4dB/y55n+a9Q
	 ztSeMgOSs3ttlBI+njh9d3ipCU+vU+7zm/V/lmH53CEE/+gxl/XkH5HfoJxvCl6zmo
	 cvx8Maxyw+LXuNTo2ceKW7OgjJgnLtI4zANAdZpqfJl4k/kGMTmcTtthSBfXpUq1KK
	 Mb1qsgwIkYL8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14D239E4DBA;
	Tue, 13 Oct 2026 22:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: skip node_change lock for inline
 data writes"
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193061951.1493834.15484105620575468215.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:19 +0000
References: <20261007101738.2348038-1-chao@kernel.org>
In-Reply-To: <20261007101738.2348038-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  7 Oct 2026 10:17:38 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> This reverts commit 66eec36c2421383e5b32e9c1740f656474c80df8.
> 
> Fault injection + shutdown stress test reports inconsistent inline
> data after "f2fs_io shutdown 2" (mode=lfs, nonzone, segs=1):
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: skip node_change lock for inline data writes"
    https://git.kernel.org/jaegeuk/f2fs/c/5edbb590dbd7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


