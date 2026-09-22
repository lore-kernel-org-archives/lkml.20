Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03455C1B2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091082; cv=none; b=TrFSXpbHscnxTyxAPtoa20m2Z+M4bDFcwupxSLIAhMOtNFFum4M0S0uQPaNW8vH8aMUu+dHh60EPTLxlbXI8Qw+DYWhbtXkBugnvHuzC+Qm5Kk0xZE/CTJyYLK2uz8sW4EzsPtIcGWx5GXky8sR8ei9uO30Ldsh+cVCvLSS/xFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091082; c=relaxed/simple;
	bh=Cqxnx0kW6eP+yLTx0wmgRvPFWxXxJb77imu4mzWRqBc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tpe0rrZ9aCMyDryVNhNvZcRRS7wXGLnttuk8l1MWXM9xv9IUlmFIenjwwn2zE+bQxd739QZP7DWdr+P/b42A2TQmMDUPArVRiApRh0MD7pMR13K3+W4V7C0LBTo1YdU50yBvNYlWWBrPAaM1GL88pslxTluk3RZqR1xzb2Ht9jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geI/AhwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geI/AhwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72111F00893;
	Tue, 22 Sep 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091080;
	bh=ii+FXWj2maJ1KVWfzU+rbs1qaenM7FRCrs6mK6PHqHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=geI/AhwQpa5ZoGGG3Z4RM74XkERwtMo6CQkvCGFSx3tbC14qaQSU9y20dqTaVNjam
	 aH23kumN4tPwFu9XN1346HaMk2qaeIZBYQ/e//fL4eDta5vsUo1UlObnahS4XuxpIX
	 E3mHVa1yiCFpLzsToGIUR21YTGtC/I2z7cUc6NclcviCjFQV+FhkEH/XgZLZK4Qxpy
	 Sva6LZOPxWrLdIcW/aftctH500YI+K+LerimuPJmpD4o2RMfr7K63kyU86L9aVY6Wj
	 ZOFEaDYwQWZiCW3jvTqKcR9Oqd8NrkaeiSMs+TsV7HvznwiDa0SggzKxEk8ja9DUOq
	 tutKpF7wS941g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198A63811A4B;
	Tue, 22 Sep 2026 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 01/12] f2fs: cache: implement metadata cache
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179009101165.4140645.13020875128862950856.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 15:30:11 +0000
References: <20260824134731.3704352-2-chao@kernel.org>
In-Reply-To: <20260824134731.3704352-2-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 24 Aug 2026 21:47:20 +0800 you wrote:
> This patch introduces the core metadata block caching infrastructure to
> manage f2fs metadata independently of the page cache.
> 
> It implements:
> - core cache APIs: get, create, put, drop, backed by a radix tree and
>   a single global LRU list.
> - support multiple status of cached block: LOCKED, UPTODATE, DIRTY,
>   WRITEBACK, INLINE.
> - internal bio based read/write helpers with adjacent block vector merging.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,01/12] f2fs: cache: implement metadata cache
    (no matching commit)
  - [f2fs-dev,v2,02/12] f2fs: cache: initialize meta cache
    (no matching commit)
  - [f2fs-dev,v2,03/12] f2fs: cache: introduce shrinker
    (no matching commit)
  - [f2fs-dev,v2,04/12] f2fs: cache: introduce writeback thread
    (no matching commit)
  - [f2fs-dev,v2,05/12] f2fs: cache: use meta cache
    (no matching commit)
  - [f2fs-dev,v2,06/12] f2fs: cache: initialize node cache
    (no matching commit)
  - [f2fs-dev,v2,07/12] f2fs: cache: use node cache
    (no matching commit)
  - [f2fs-dev,v2,08/12] f2fs: cache: initialize compress cache
    (no matching commit)
  - [f2fs-dev,v2,09/12] f2fs: cache: use compress cache
    (no matching commit)
  - [f2fs-dev,v2,10/12] f2fs: cache: support fault injection
    (no matching commit)
  - [f2fs-dev,v2,11/12] f2fs: cache: introduce tracepoints
    (no matching commit)
  - [f2fs-dev,v2,12/12] f2fs: cache: show per-cache usage in debugfs
    https://git.kernel.org/jaegeuk/f2fs/c/f17987c6219e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


