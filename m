Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0C5632A1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930618; cv=none; b=Ex89UjzobZ+oJsMZ/PJkWU7DIMnF1zNXNymMOL48UyvRrUfcuaTtPz/Uxl+L/jGEQKyQEIDbEAIH96GJURkNxQtSs5s7xNnB6zNrKttfQJVd9sSULrYqEDPiDUP48tex4mDIJy3LtFzjFfZFpwdZ3avFP/Bs4Ue1Zo+rhi7HfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930618; c=relaxed/simple;
	bh=GsaYWpoyWbyCq0bI61KrbxA42oPDDnDOI0f17UbPFh4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B9Qs0VicmpUMUq7Wa6xEg7A28b7/nA3sTEn5MESoeJGUGMgVoTTM3PRC2wubk2MN2Ru7B9Bnn8fnVlndkRlqvuJvPmFcTleS7qy2loPNJ1rK4x70CysGTUhvbODBNDNW3RmizUxlvY9z2vw6N67/s6cVNNyPO7LTgxM17qImB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWXBrKjt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWXBrKjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220CE1F00893;
	Tue, 13 Oct 2026 22:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930615;
	bh=rj5wkGy6yTPAnHR68+j6OFWHSh6FtU7k2/bCjqeMRz8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kWXBrKjtvxhi6YY0IvpdN2nyb9wWIQjsnphueYp2DK3ZPiFt52kCoC92WSV1S1bA6
	 AzOnT0IBF9ADyvM7kbQpOG7Xm+MGZiWNdrBY9tKykPgwu4h4SZ2Y/uHOGnK3vxjTct
	 KC77zu+quIJrzFPsQQgycLynqqsRLzMSNr3Q0N6PuVwcaYyhGDRaCL3U9ZJFSfmGwx
	 NTyNuVY1Ya6ZKPHgX74F964bfbr+9N0etuMxRUgzwOWvc6ixT8Ci69yn/c2uBAaGin
	 4RMMfLAVA2R45Qy3uDxhhlzyQ4ieOV+gQuCYFPn+q0R7T4G6EDeVush4aEfroF4s2B
	 UVZy/GagqbrwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 183F639E4DBA;
	Tue, 13 Oct 2026 22:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: cache: pin cached block in
 f2fs_end_cache_writeback()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193061376.1493834.1008667944485140463.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:13 +0000
References: <20260930235435.3789910-1-chao@kernel.org>
In-Reply-To: <20260930235435.3789910-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 30 Sep 2026 23:54:34 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> Like page cache folios, writeback does not hold an active reference on
> the cached block during I/O flight, relying instead on truncation or
> shrinker callers to wait on F2FS_BLOCK_WRITEBACK before releasing the entry.
> 
> However, in f2fs_end_cache_writeback(), clear_and_wake_up_bit() executes
> two distinct steps:
> 1. clear_bit_unlock(F2FS_BLOCK_WRITEBACK, &entry->state): clears the bit.
> 2. wake_up_bit(&entry->state, F2FS_BLOCK_WRITEBACK): hashes &entry->state
>    to look up the waitqueue and wakes waiting tasks.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: cache: pin cached block in f2fs_end_cache_writeback()
    https://git.kernel.org/jaegeuk/f2fs/c/6e392158cf54
  - [f2fs-dev,2/2] f2fs: cache: pin cached block in f2fs_unlock_cache()
    https://git.kernel.org/jaegeuk/f2fs/c/61ba87b33e87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


