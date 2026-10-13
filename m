Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD135519B9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930636; cv=none; b=pY3/VaKVtyJfkiY4iHgc1AwAVffqFdb6fPpBVXiIu6yUdDzfJcU1Nu2vcwsEmtj6HqMFc3iggZi1E+hG4J2i5dRuSe7i/u6WbNF1HQgQQVUxvRoBPA0cRsTcFNBAQdVb61vLUKGHSvse3XzpUFVFBvqtpgrf1SWCZjIQuKxliGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930636; c=relaxed/simple;
	bh=iM7pDNUxUh0NLnLT6vy56MlB+KJgN3gHG+iYR9kIFWs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c8zrKImrxWQLAzcKfOubePWDBYrrLV4GvJ8EeEi1qeN1n1w//f/SY+Md0bAAL3WS0AtaaWmXmgLmW72vd/+ctcV4we9mcDujG2OXO81R6/NE+9oEdjvc7/OLvKzCcnnPKUzgFjo2CyjmTGrQD2Ph/9x3X7BlpEkdGBEp0U5LoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNpPozLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNpPozLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0676D1F000FF;
	Tue, 13 Oct 2026 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930632;
	bh=iL7Mf6jIc8YTauuGWv6Ut98w5FF51kZZTIY2cvT79XI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DNpPozLZKc6pFvSsAg0QcucRF6uiPN9VJxr3LvufM9qKP/5BzoQ0Y63q3BJ7d38rr
	 QOK3ZTgaEijosE7OXe/x8z5gFHsmtHTHYB35G2sV1u6ZedzLhEguKoBPUN17qnMSYU
	 XRGrkQLBuBWK1WSsYF3zne0JufJkV0dFG88Dy+QN9F3EwoXBEB4pNZ7kOisTVxJNnb
	 /V39V2Td4T/UQfjCBQYFTDzQS0bXy8vzSM2X0TEkxQyW4l1EJx8Gh82qeCGJDcBAyL
	 gIxuttHNUzN2S7bmWlx0rNFNEgFIzfHMFLxAI8IrfnWa/pWACI4ClfrH6UUX2xqGqm
	 Fi3V+7P29TA6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14AD39E4DBA;
	Tue, 13 Oct 2026 22:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: f2fs: add dev branch to git tree
 entry
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063051.1493834.11557943978794677204.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:30 +0000
References: <20261010065946.1763794-1-chao@kernel.org>
In-Reply-To: <20261010065946.1763794-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 10 Oct 2026 14:59:46 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> The F2FS entry lists the git tree without a branch, so tools that
> derive a baseline from MAINTAINERS, e.g. sashiko, fall back to the
> remote HEAD, which points to master. master only moves at -rc1, so
> series developed against the dev branch fail to apply there.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] MAINTAINERS: f2fs: add dev branch to git tree entry
    https://git.kernel.org/jaegeuk/f2fs/c/beafa2721b63

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


