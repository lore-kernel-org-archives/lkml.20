Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CBD55820E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091084; cv=none; b=ZS2/yWx1BFhFnQEiF091LfZteYF/+algWfPbGP+HobPZDIu4cS0usGc0CruYRz4mrGLRliBYyAGbPoWpRF2bJRKf9ng+qxLa1SbJlWneFGuzeTqZfdRtn1/fEerrzZZKHKtriIJ2awmBWP/rjjrWl8mvpyUDMbaULLdujS839UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091084; c=relaxed/simple;
	bh=4vTdclODXHAEOI/HQmW2ONrmZ46Q6ifZig7IWsAzGyw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Fo+Z1wsuu3PiN70pwBt+kFPtdoapRExGruoSwJsgvky9qoFaNc6QwO7nkpXG5zarnODhR8vVU7jNqqREwDwa8u76DHuAaVL5/zGlLiAW2cbi9FPU9njZnvCO5vqwbEqEJrow5C2pwRmRF/E26ttJUQMDZ9/+/wygot5gymLQASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi/njdkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi/njdkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A641F000FF;
	Tue, 22 Sep 2026 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091082;
	bh=jkdJbMj60D1Bl882A7vHpFfPJNELDfahplewLii3Ijg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Vi/njdkn2USvYJKew9JTFF5TSsmnwql5fvmu4Ad2UqPTqeK/fWJzuw16x77AmLBNb
	 979TgeKn9aH3q8ep7zPjKH+HQ0SYoXkzP3vthI5PTxirHQkWQV8f7kxlLWOx/CSTyk
	 VJ9lF1FPdb+1Mj1Kzfl+qawnzk1xU8sA06pGSoDU8dXUUS7WPxD7Zt0AUldsx1wy8E
	 tQP1bXSdKXFVpLBEahxDalN5qPvYtIfh6H9BDkGBnYAqlHQwm6Wnd92eZ5yk4WRyxU
	 I6aXuenmljmDOmoJsr/Qgdi7+MK1D1lY2HJ+SYHlrww8MSQTJKiHywNezLl3vV2xAw
	 Tpv+PyNQ7CS5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939073811A4B;
	Tue, 22 Sep 2026 15:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: rename page_count with cache_count
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179009101314.4140645.13210408538473891144.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 15:30:13 +0000
References: <20260911232510.1816298-1-chao@kernel.org>
In-Reply-To: <20260911232510.1816298-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 12 Sep 2026 07:25:09 +0800 you wrote:
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> The count does not indicate the number of pages anymore.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/cache.c      |  4 ++--
>  fs/f2fs/checkpoint.c | 30 ++++++++++++-------------
>  fs/f2fs/compress.c   |  8 +++----
>  fs/f2fs/data.c       | 32 +++++++++++++--------------
>  fs/f2fs/debug.c      | 26 +++++++++++-----------
>  fs/f2fs/f2fs.h       | 41 ++++++++++++++++++----------------
>  fs/f2fs/file.c       | 14 ++++++------
>  fs/f2fs/gc.c         | 14 ++++++------
>  fs/f2fs/node.c       | 10 ++++-----
>  fs/f2fs/segment.c    | 10 ++++-----
>  fs/f2fs/segment.h    | 10 ++++-----
>  fs/f2fs/super.c      | 52 ++++++++++++++++++++++----------------------
>  12 files changed, 127 insertions(+), 124 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: rename page_count with cache_count
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: rename nr_pages_to_skip with nr_caches_to_skip
    https://git.kernel.org/jaegeuk/f2fs/c/a4b9fb9e6911

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


