Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934211;
	b=ktRUqwawidxADAoe6s+s3ThjaZ/aq/iCXwbio7SNTjYdzoXiWnchukx4+bkDS7Kxi+DX
	 TYDXnBRrfei24rn6KQYmm3FPUL9w8DdVLu5PuDsYnRSg27QjWVlLH/R0zfetHHqRSMzap
	 qPpLkc0gfoskDwbVFxGMzhwL96RY3ezHoBGkHXU4xoX+uCH4kPzqt5M5lrrKRUU0N/+vL
	 JTYRMDdDDHCtLCc/ipFeje4vCWJn/B8HG1tnRv6wYiJF6+sgM7wd2dbR1w9uipFTenF7V
	 efhZKEoqlMGnKhex3hyXzZ4XFb7ZbJWPOxBxbD581W9YTlio8YZkIrnrxle+fFWPiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934211;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Y1tk3kCxl+bAfIY0WHKT9XLzFrGBaV3u+SQyhSnfIjM=;
	b=glWwqn6FGxByjBrCVT6wZ+zIbXqh2qhTG3mN6WO8+xWdy9fwrcCccmCJyJfBdcmX+UUZ
	 CHfmCNxLk2BCtFeh1ODQaPaPhMIb8iAbkNbhnGPB+N5XZDK9DyvJLEz0Nlj2XDo+IoxXv
	 Wxoj+fvF/yay83EDR5U6O3lMYc6I/A6ANqg5cwR0rE+8PhvKD8Fi/bMEZ/bt8J8uRRzOa
	 +Ah6KRPmU4nIl8e22Vk+MhOMrpCsuwkTgqCqhpPI7hFb49uvg+Djul1XPJuD8uc0e6Dyr
	 yhwRCX2jvsVAtpMlRT6u9bRmO76DmRHsvWUS/qMH4kOCp8Lf0hUkPzonSDmYwMEuxYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apt6Xdsf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9B606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apt6Xdsf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469EB1F000C5;
	Tue, 17 Nov 2026 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794934211;
	bh=Y1tk3kCxl+bAfIY0WHKT9XLzFrGBaV3u+SQyhSnfIjM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Apt6XdsfhFdWMX0+YNkyhrfAuGlZKIAJJtuqnlsZlWPuzxc3EIOazLHNvjGQ0Q4vj
	 vpLTG72JDTXccYMj++QIR++kpuopvwyXolaS4CkoGkhpR2LLILow0xb1hqmquTFMt6
	 CV0WSLzl+N1BxSrCe+C70JXoRdtpMCKPxbHBLEHZ2L3tdldFvdc4bxzG7d32WT3G09
	 QA8WggkpWt2glHw0IGS/Zj29BgiPKd1dCFVHpUIiyZtgwexW4Oqt6DlLCkYSNIzZeE
	 dvdwp6yhy9f32QW7R9JmFlXgqT74+rrfLMf8nUgPDSEqQPTPpKDbpoWgtaC/EBXuQF
	 +GqjYVxrdZvBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A322392706F;
	Tue, 17 Nov 2026 16:50:11 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH v2 00/20] f2fs: support block size smaller than
 PAGE_SIZE
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179493421003.698822.10872235579816868645.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 16:50:10 +0000
References: <20261116040851.2849696-1-daeho43@gmail.com>
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 15 Nov 2026 20:08:31 -0800 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> F2FS has required the filesystem block size to equal PAGE_SIZE. On a
> kernel with 16KB pages, this means an existing F2FS image with 4KB
> blocks cannot be mounted, e.g. the userdata partition of an Android
> device that moves from a 4KB page kernel to a 16KB page kernel.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,01/20] f2fs: use block-based index and size calculations in more paths
    https://git.kernel.org/jaegeuk/f2fs/c/7985ae4403bd
  - [f2fs-dev,v2,02/20] f2fs: support subpage block size superblock and mount
    https://git.kernel.org/jaegeuk/f2fs/c/4677715aecb4
  - [f2fs-dev,v2,03/20] f2fs: extend f2fs_folio_state for subpage blocks
    https://git.kernel.org/jaegeuk/f2fs/c/6dad9aa2be5b
  - [f2fs-dev,v2,04/20] f2fs: support subpage blocks in directory operations
    https://git.kernel.org/jaegeuk/f2fs/c/5cf7185bf5d4
  - [f2fs-dev,v2,05/20] f2fs: convert inode dirty page counters to dirty block counters
    https://git.kernel.org/jaegeuk/f2fs/c/85d94a798481
  - [f2fs-dev,v2,06/20] f2fs: support subpage blocks in data read path and GC
    https://git.kernel.org/jaegeuk/f2fs/c/1f3fb065c53b
  - [f2fs-dev,v2,07/20] f2fs: support subpage blocks in data write path and writeback
    https://git.kernel.org/jaegeuk/f2fs/c/075eb224620a
  - [f2fs-dev,v2,08/20] f2fs: adapt range operations and mmap for subpage blocks
    https://git.kernel.org/jaegeuk/f2fs/c/b59ad45de360
  - [f2fs-dev,v2,09/20] f2fs: support subpage blocks in pinned files
    https://git.kernel.org/jaegeuk/f2fs/c/1fca7e80ab81
  - [f2fs-dev,v2,10/20] f2fs: support subpage blocks in collapse and insert range
    https://git.kernel.org/jaegeuk/f2fs/c/804fc9fc11a5
  - [f2fs-dev,v2,11/20] f2fs: support subpage blocks in move range
    https://git.kernel.org/jaegeuk/f2fs/c/b012b16ed8ad
  - [f2fs-dev,v2,12/20] f2fs: support subpage blocks in defragmentation
    https://git.kernel.org/jaegeuk/f2fs/c/a200065e07d6
  - [f2fs-dev,v2,13/20] f2fs: support subpage blocks in swapfile activation
    https://git.kernel.org/jaegeuk/f2fs/c/0ef07ef01bb5
  - [f2fs-dev,v2,14/20] f2fs: support subpage blocks in fs-verity enablement
    https://git.kernel.org/jaegeuk/f2fs/c/780f86c0f2ed
  - [f2fs-dev,v2,15/20] f2fs: support subpage blocks in atomic writes
    https://git.kernel.org/jaegeuk/f2fs/c/d848dac0ab70
  - [f2fs-dev,v2,16/20] f2fs: preserve inline data in subpage block mode
    https://git.kernel.org/jaegeuk/f2fs/c/50af3450d3b6
  - [f2fs-dev,v2,17/20] f2fs: support subpage blocks in online resize
    https://git.kernel.org/jaegeuk/f2fs/c/fa57651dbe6f
  - [f2fs-dev,v2,18/20] f2fs: support subpage blocks in compression
    https://git.kernel.org/jaegeuk/f2fs/c/b5c77585f32c
  - [f2fs-dev,v2,19/20] f2fs: count compress cache entries in pages for its memory limit
    https://git.kernel.org/jaegeuk/f2fs/c/c86146d870b3
  - [f2fs-dev,v2,20/20] f2fs: enable subpage block size support
    https://git.kernel.org/jaegeuk/f2fs/c/5d4c8a45517f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


