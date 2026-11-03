Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667008;
	b=GIVIx5hDuiQwZvESYqLW+LBKc3Qn8MLCSR3W0sEQl7E6EQGgILfnutHZDOApuVkQhwr9
	 pXlYuONBXg035D5IhVrD+qGONHo9v95XBsoOV1uu+n1Qo7SxEZ+1APNv6oX2FV8773lSG
	 yV0e8kdG8NQODE3/6jz7RAqqjlNZIqFmbWvLUFvwehC4V0MYzaYIJz6HdZZIsY10cnRi5
	 vvG+XKs90WwqixxeY4yMW/uYAvaMok/ZgM1qDgiRLlri2TETIxjt3unX2n52q1uwMJXTd
	 bvqmJ6xefAfi6kJsNl2ETdywV7kNE3BdlYPCnR7C5k8Z7Xk6BqqY/gEtc8kQUMxgqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667008;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=eBRs5G89h5Rrtmr9y8DK6nRgz/nS5TcDOrUBQMk99ws=;
	b=YykriV+VCAeaTp5lk035LN+CRGYMrU9Fv135Vj4JuSyQ4VknkrehhDSjYNM9N5NLezWl
	 i5BdSDY33gN9jCQx5kA/TC8MqZTPt+pYl/axfUO1znrFFjmE87UqAvYcsTFofcZM1xlk9
	 vU+0avEV8xTuwUODyPw4JhMCdDARxlliiZHsJma6PE0NH11POKEnDwri03i0GCmYzmsZt
	 HfM8cwm/+gD0egdBS/7EQIE0P5dlZRcheQUKQCPHZDd9UecRG/gKO+OPq83YI4fPV/Ccq
	 JLgxhV3KkuKrsOCTOzJEujMul1R/+ftInIdsjhm3GwhGflpTr/U9P5Sd5Sq0B3vDZeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCQ2xNTB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E766606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCQ2xNTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE281F000C1;
	Tue,  3 Nov 2026 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793667008;
	bh=eBRs5G89h5Rrtmr9y8DK6nRgz/nS5TcDOrUBQMk99ws=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TCQ2xNTB3/VYbcrWaJ/Dd98YcjLIHe+Xx5g55nWDr2tEHFJbAvcpZ181egHhdKsVe
	 cm0vwg4+qaxmKeSzjms97mFKnp7qS0PLnUYUpoFenA3ZxyYJAWWu/p5mTZkNGSEIk9
	 m0AzfySfEvqPX4ftqls8uIl56vegNYUZ33diMyAqMBdYAEbbDGrzDdAGvwsWHkxq+L
	 1LX7xKd4UZISqZC644/gcEmMTtaYGohJdbn54ppC394b5HOQSx5KSEY16RJjyDn51e
	 c9k8uqbIuBnrxJ4ii4yCr3epVWafeUcqdF3cokSEK2TfPI4uqdzvK3FmNfetDpfo9r
	 PCNlo8mWzJhYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03069380821F;
	Tue,  3 Nov 2026 00:50:08 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: update inode ctime on exchange rename
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179366700663.755181.16969065523229248918.git-patchwork-notify@kernel.org>
Date: Tue, 03 Nov 2026 00:50:06 +0000
References: <20261102004742.55105-1-dennylin0707@gmail.com>
In-Reply-To: <20261102004742.55105-1-dennylin0707@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  2 Nov 2026 00:47:41 +0000 you wrote:
> When two regular files are exchanged with renameat2(RENAME_EXCHANGE),
> their ctimes remain unchanged. f2fs_cross_rename() applies its explicit
> ctime updates and dirty marking to old_dir and new_dir, which have
> already been updated by f2fs_set_link().
> 
> Update old_inode and new_inode instead, matching the ordinary rename
> path. Keep the existing parent link-count handling, which dirties the
> parents through f2fs_i_links_write().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: update inode ctime on exchange rename
    https://git.kernel.org/jaegeuk/f2fs/c/f842dd9251dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


