Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B3565106
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930645; cv=none; b=RVY7RT5UoxT6dquFnR1ZaDE2lAuFschDC+8uV2ERToDuYocHZyWJsHCu+QChesblJKYv5l+XW5DVptFTsu4hCnYne3bPa+xVAOJI8IBSFecqNkqM7n42raTsSrNYeENmPkFglWXi22lcSEuL799QNSqA29nBVz3K1oiz9TjQ5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930645; c=relaxed/simple;
	bh=1ndks8IXnplZiidPphBNXHuvBFFuoqz9kI5oaRPM9I8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YgMm20pW4xswKGptTcOx9xryy3q2v/ybA3LDi8XwFCH7pz/k0jpJkDFLAdmd0gjaxaerS19Ktme515iCS8vmMOvFwab+h8P4kj/f6MrmB+Y3MQynpPLf5W1QW7tjhSR1LdYV3ZlCrS8q2LRjOoHFwMy/Z4+NU7rRctJPJrUhiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkHur7/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkHur7/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CB41F000FF;
	Tue, 13 Oct 2026 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930636;
	bh=yWVwpbRKYnzhxmi3juF3jFzrWHMsDiBWTp2swHsSpdE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SkHur7/UlDg+ZykQmYGGB+1biAZCirOCX/kbReHD6O9Zpq6sRnmYnplMNsvaTbqZ1
	 q88pdpyb/rH/obCTbiBC4ehwRhq9pSKjcwy/vMySo4+DJlkDIZ3Dm/SwPDtmAcAmev
	 UCFOS2eelb36QdVi5+rwmGB3AQbji3q6D72+CbN/Xgfyacu+G2zpFxUm49Dv0YXlaf
	 rcVmpfgG9L1LNLL+E1DXPF0N+SQaasYwBFfO+WFSh6uJ9NKJyT4TPJjSyCwDcITW00
	 wHTapJZy8ImBZUtGxbbbHYK1qf3mGALMgrAONVa7XHF96fI2l7oDcrJRp3Xy7tml5m
	 Dd4BZDco5mvZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773A939E4DBA;
	Tue, 13 Oct 2026 22:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check continuousness in
 f2fs_sync_meta_pages() correctly
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063501.1493834.9099224335687107412.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:35 +0000
References: <20261001000616.3824366-1-chao@kernel.org>
In-Reply-To: <20261001000616.3824366-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  1 Oct 2026 00:06:16 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> In f2fs_sync_meta_pages(), whenever i becomes zero inside while loop,
> below check may be skipped, it failed to check the continuousness:
> 
> 	if (nr_to_write != LONG_MAX && i != 0 &&
> 		folio->index != prev +
> 		folio_nr_pages(fbatch.folios[i-1])) {
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to check continuousness in f2fs_sync_meta_pages() correctly
    https://git.kernel.org/jaegeuk/f2fs/c/1383cff4ccf3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


