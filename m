Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D81559CAA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091081; cv=none; b=U63Itc91yPN/gHk+7X7oR0mndQsdlXSwbg2CPLSujaLlcem3iKq/y13SRP80sbudW9bmu5HfUUwLrJElWHQNKiXSlAt9yv2ky3NJlMyQNvEWIOgR9DJigMo2QSJOUJF4I2ZFdqCgYuIiOS9DdxP8QAf+UNxbnDrY0Rm/4umpV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091081; c=relaxed/simple;
	bh=w+e+YMq9XDrtWVq8mo1VWOIHqkLb15a2rZMpEEDSUCk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aZVcn9MkNYHuUnvY7pZj6ROJd4wuCGwHR4jZp++g0iz7Kw2dbM6sdW416uXMZvtStgHQUcRZVWGVQfYLJyWis1MYpbGp9/75s2XSpUFkx88+gVXpAOw+C0chNzvWwe8UQ4RXVPYzHuwiwH7hAflo85EzXON0tjiEta9mznBlIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7W9t6F7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7W9t6F7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0C11F000FF;
	Tue, 22 Sep 2026 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091079;
	bh=gLHV9+LwHObukot+dBkPuq1xcenN0BPej2dFqPlitiE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Y7W9t6F7vM5oB+0WKjEp15WYPLyHRFH4aIPF1M5Q2GuvhzusSuqwuJejdHKQRlTdm
	 iLLYEjUuWGhE+4XxaytYcQsfXenK4guCJi5AJfvz2qC8/ITEwKTUq6b+8KMIU+FVDS
	 ZYAcKg9qCVAYo3spmANKrv88bOCV7AQ4h7FH3ob0GHXAkmNNEJQE/aX8EE5CG8Cb4t
	 w3qlD1JuwzsThKAEcVoi9dvkou8ksXYQ+jyM6GH6oXzL5i8AgwkQUYrxFTb9y86zYl
	 4wOcgpGDOTCzZ7Dg5c1UAtB7KW6L7Htg2zvjxV5T0kUsZTJ9BqGp0ajmMdG6ZhFpFo
	 V6rwUJV/VlF+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939B03811A4B;
	Tue, 22 Sep 2026 15:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v9 00/12] f2fs: introduce metadata cache
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179009101040.4140645.6043365279524140950.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 15:30:10 +0000
References: <20260917073343.2823157-1-chao@kernel.org>
In-Reply-To: <20260917073343.2823157-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 17 Sep 2026 15:33:31 +0800 you wrote:
> This patchset introduces a self-managed metadata block cache in f2fs,
> decoupling meta blocks, node blocks, and compressed data blocks from
> the Linux VFS page cache and fake internal inodes.
> 
> === 1. Background & Motivation ===
> 
> Currently, F2FS uses fake VFS inodes (meta_inode, node_inode, and
> compress_inode) to manage internal block caching through the VFS page
> cache. Because of this implementation, the f2fs block size was
> historically coupled to the kernel page size.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v9,01/12] f2fs: cache: implement metadata cache
    https://git.kernel.org/jaegeuk/f2fs/c/4e80250bcfbc
  - [f2fs-dev,v9,02/12] f2fs: cache: initialize meta cache
    https://git.kernel.org/jaegeuk/f2fs/c/20fccd31926b
  - [f2fs-dev,v9,03/12] f2fs: cache: introduce shrinker
    https://git.kernel.org/jaegeuk/f2fs/c/fe1c66b4a6e1
  - [f2fs-dev,v9,04/12] f2fs: cache: introduce writeback thread
    https://git.kernel.org/jaegeuk/f2fs/c/f45afeabd5df
  - [f2fs-dev,v9,05/12] f2fs: cache: use meta cache
    https://git.kernel.org/jaegeuk/f2fs/c/7a1cf2a76b71
  - [f2fs-dev,v9,06/12] f2fs: cache: initialize node cache
    https://git.kernel.org/jaegeuk/f2fs/c/26185263c121
  - [f2fs-dev,v9,07/12] f2fs: cache: use node cache
    https://git.kernel.org/jaegeuk/f2fs/c/493b9dc8b52c
  - [f2fs-dev,v9,08/12] f2fs: cache: initialize compress cache
    https://git.kernel.org/jaegeuk/f2fs/c/bf452b33bdb6
  - [f2fs-dev,v9,09/12] f2fs: cache: use compress cache
    https://git.kernel.org/jaegeuk/f2fs/c/6a78d0488116
  - [f2fs-dev,v9,10/12] f2fs: cache: support fault injection
    https://git.kernel.org/jaegeuk/f2fs/c/4f9ad04b59c6
  - [f2fs-dev,v9,11/12] f2fs: cache: introduce tracepoints
    https://git.kernel.org/jaegeuk/f2fs/c/cc46c2e9336b
  - [f2fs-dev,v9,12/12] f2fs: cache: show per-cache usage in debugfs
    https://git.kernel.org/jaegeuk/f2fs/c/f17987c6219e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


