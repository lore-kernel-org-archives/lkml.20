Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934213;
	b=TUZeqR1flfrMMoDlWO1GRdWLwdVEiK/1nGVgTYcB9XKXSEqTf9BAempMrHu39l0cel23
	 vMmJYTRrt+XRoEgFKuJKno1gC+GvhmRVbej6MiN5yThUZFoacFvGYPTci6vBYkwxKL79z
	 8M8rCSVYb++h3PeFHlFzbE6DSoZmf9l2XIsdCotHGjaTzcqT6zt7VFmSD6RZia21JbBPL
	 E+j5O80GS3d4OIhAbMGWi1pnLu6aT9RgWWggnZapO2AVo3ZFXIiWNhJ3n/ss1+6knfIqe
	 gZKsux8Yc99XN9NUI1JexgixGAkB+RiZkrIQJx0tJ6ROzMbTG5gahZRY85QCeEogK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934213;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mYmFqNItA657S80cwv0+5oWCVc/8rWIHSqTpW1wpY4g=;
	b=5n4lCqPOx7aTl5YrculfH0AYTGLdot48qbsc47mWJDLxw7KjxRl+oYDNNtWjXMthaF9E
	 fCKWn1Df6R6pdvk6q8h9sRqAnvO5qz/3C4uY2rIfluQzmz2gefX2oFmr119ojE4UHoG8I
	 i1oJmQhcqqd8mJRGN1hAtv4Xu8Cg7y+geJ3be4qUaeI5EznWzqTrixq45hJXFcNDstVR2
	 HTP550hl9mfg9x+zKwCKW+CoPAk+8v1BQo+iV3LK9HxnEhaYvoLghtSCMBlhRnQH1C9eB
	 jTic04WfLvMfrx0vCfB1gEhc/KEQmB6U3HqP5LVb+B7eH9ylBQk2akdFaPMxPg2j5JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Szr7rKyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180D606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Szr7rKyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7031F000C6;
	Tue, 17 Nov 2026 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794934212;
	bh=mYmFqNItA657S80cwv0+5oWCVc/8rWIHSqTpW1wpY4g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Szr7rKyTESR1Z2xk0sYhcungVL2UV91/bOQbAuOydLUayVg7/IUG5FxuzS+F9b1ED
	 YozZ+ApBIV/XRhG2ZIpDwcEy0YbsdmDP3vCZltLBAd/oaobdukxVKqeL9XSWs7Wott
	 8TLRH4ynRI4zYF3XziS1p0MabCqDQDqwO33q1n5Ghqc6Lw0Vvtycu+qv29vqZK7o+X
	 KeG/VPSMXElyp8g85yzNCmGTv7gCkwaDoETG9thM1Z1a3DxmV0z9ndGCloT9yfpCuQ
	 4kJo3TQ2OIWcLQ1zTkjeIaieSfYDNq+Ag8PoG6oYNLmpSIsHHz3dwWjjYeXoLbZQfB
	 HCZaIol380gLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B462D392706F;
	Tue, 17 Nov 2026 16:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't BUG_ON a missing orphan inode at
 mount
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179493421127.698822.8936869244996483473.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 16:50:11 +0000
References: <20261105034419.2701443-1-zhanxusheng1024@gmail.com>
In-Reply-To: <20261105034419.2701443-1-zhanxusheng1024@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, yangguikun19@qq.com,
 stable@kernel.org, zhanxusheng@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  5 Nov 2026 11:44:19 +0800 you wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> recover_orphan_inode() treats -ENOENT from f2fs_iget() as a kernel
> bug, but the ino comes from the on-disk orphan block. An image whose
> orphan entry names an inode without a NAT entry hits the BUG_ON at
> mount with CONFIG_F2FS_CHECK_FS, or a WARN and a failed mount
> without it.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: don't BUG_ON a missing orphan inode at mount
    https://git.kernel.org/jaegeuk/f2fs/c/b61a029304bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


