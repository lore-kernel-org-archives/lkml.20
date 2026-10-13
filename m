Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910B5632B4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930639; cv=none; b=u3CnpebvOlqC/2rI0Lh5xpmznh9LOYjxOex4Guh347FzaByljo0t9dP9Hl5wqMQCD1jtIFkUJzi9EU5DJZFHqcnz6X6HuKbARG/0LC1LDD5+n38ycY7CRxhMoKfft/76LAure8arbbX9Q9yBYEQ9vNXNOCjGB+PMwtexHXfkV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930639; c=relaxed/simple;
	bh=Fix0/iIx48HjkljPrx/F0QU1Z128CIm/c2X15qaCXis=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aJ5U8DXT2cDYL9yX9FVbeHjWesq4atx7eBcACe4aKt2E5aKxEKbwCV8SMHmt0O4kvwUOZtGmDU7aP1TimDDWJLn/Ib5DhK+Lc8546i337caGsEWKSBYs0/R53mtEOTb3+dE+IC85p90cChZVtoo10hGjNoiz5kYlocFe2i2TBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwH8nB/E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwH8nB/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840331F00898;
	Tue, 13 Oct 2026 22:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930630;
	bh=V6Fzv/xwZWojt+EWhgu275zfjc+Bzu1Q3i6IRSLhWJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GwH8nB/EZWv7fu6hE4XEjf+LGHLVoEeoyGgGQ9VD5sdxkr2B3WSq+nfiN6fa0Oa8S
	 SzjvvVM2etKBOWr+Z5HrKg/ILeSSPbIiqQfvJS+5mAvsU/BImICKiz5rNkCuBjD5hV
	 n8M1u9NB/9dqVrP1VzbU36OtPg7usUno5DZvaUy90P83aNebWYIN2Vn9RocHEsnzrU
	 AGpfs4kLEYuTdUR86Y5UirVK1uiHxcw8ZfL4U5NMwXXKD9hjOHaFBdmhTniNleIOqP
	 VbMag2Pmz3/mBg9yu2jILD+Urc4b7dvNVeDTQWKIi5JtSpNCkcoUmMBtlnmYqWjZfu
	 vq/nByaXFPrSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7727D39E4DBA;
	Tue, 13 Oct 2026 22:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: cache: introduce metadata_cache
 sysfs
 node
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193062901.1493834.12835445891823777379.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:29 +0000
References: <20261007114949.2428048-1-chao@kernel.org>
In-Reply-To: <20261007114949.2428048-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  7 Oct 2026 11:49:45 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> This patch exposes a new sysfs node 'metadata_cache' under
> /sys/fs/f2fs/features/ to indicate runtime support for the in-kernel
> metadata cache infrastructure.
> 
> Userspace can check this feature entry to determine support before
> configuring metadata cache knobs (e.g., cache_wb_interval) or parsing
> per-cache memory statistics in debugfs.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/5] f2fs: cache: introduce metadata_cache sysfs node
    https://git.kernel.org/jaegeuk/f2fs/c/e881f4730f75
  - [f2fs-dev,2/5] f2fs: cache: shrink meta and node caches in f2fs_balance_fs_bg
    https://git.kernel.org/jaegeuk/f2fs/c/7f35dce566fb
  - [f2fs-dev,3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
    (no matching commit)
  - [f2fs-dev,4/5] f2fs: cache: support asynchronous write_end_io
    https://git.kernel.org/jaegeuk/f2fs/c/bd09975045fb
  - [f2fs-dev,5/5] f2fs: introduce max_atc_write_bio_entry_cnt
    https://git.kernel.org/jaegeuk/f2fs/c/f32744a8b83d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


