Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454B563FA8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930640; cv=none; b=k1kt6Daw5RDxqMjYQvU4cl1OGMTKrW32epUBfPbdmBOJM7FCjVVjJaFPa82058S6gwk9OOF7p5aKS+0TohjVdS2cKforppJbVcuTV5PaBt4/CSvrkkdOxWHilKkHido/kKdnaeO4eyWstvyDif3VqOOKXXT4NWAKJijXxwjjmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930640; c=relaxed/simple;
	bh=vYv0mzOjw8X/rKFufzpxyqfE0JoTSMsLsso/Q/ZZtms=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iVGfK8rVP80j0sre26HVw7DtvkTrP7xC7uMHwD4Nrup4VQY88UVbcSBXMhnUcxWY0DAx68fFle18l1AyjPmBcg60U/O/tT0hqD0Mo24ZqNHae8Geet82yCVwzEb5cRY9nlYd5kEjdwbp0aED2rLIOaVew6E9WhiEOPv6avDIGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYNTdXRM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYNTdXRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F751F0089B;
	Tue, 13 Oct 2026 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930635;
	bh=4FFO1jOTQfYb9lMwj92EOznYJd3KapLk94/ZCQVw9MI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WYNTdXRMYYAuVdphkXmwY2/dcnGGEay2ozBP96DnaPUA+FyTCYPbP9uR3sWYno9LD
	 b6F0KJazOpgjt0jhNCioyo/oYbSKHXg021/x2+1Vjfg5HQz/Ql7MFeQvmvVksTnIXl
	 H23lsOkHAdQdbx01szYw4l6PsmalrnobqPVum+4DfY7Nj+gLHigE9iq0nTH/234vpB
	 1KUfadbw0wGx4jVIQAUlJCuaokiIytwhhVNsWRfXr3VhmHT2yrHFPItvh86Sz1ZC33
	 nFHvBzpdc95cu9d+yJh6XSTbWAL+qbbWAHGn+u79KoEnjfMSlCENW9fAYmAdowfdlK
	 KpAy53qEvQ5ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F141239E4DBA;
	Tue, 13 Oct 2026 22:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix defragment writeback range
 truncation
 on 32-bit
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063351.1493834.17419518506732604429.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:33 +0000
References: <20261005154954.2097054-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20261005154954.2097054-1-zhanxusheng@xiaomi.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, zhanxusheng@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  5 Oct 2026 23:49:54 +0800 you wrote:
> f2fs_defragment_range() flushes the range it is about to defragment:
> 
> 	filemap_write_and_wait_range(inode->i_mapping,
> 				pg_start << PAGE_SHIFT,
> 				(pg_end << PAGE_SHIFT) - 1);
> 
> pg_start and pg_end are pgoff_t, 32 bits on 32-bit kernels, so both
> shifts are evaluated in 32 bits and truncated before they are widened to
> the loff_t parameters.  pg_end is only capped by the file's page count,
> so for a file larger than 4 GiB the shift wraps.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix defragment writeback range truncation on 32-bit
    https://git.kernel.org/jaegeuk/f2fs/c/92154fe28c37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


