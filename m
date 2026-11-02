Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637014;
	b=4JTL6MQLqVA/3FrE4XFXvBEhIEUSqVHp22sWQ+w2jP+t4YZAR9tWo1eFiabyR0eXrX0h
	 3yxSSe3TlXsy5xEHWrtu3h8BxE72mEvV4FsrKTyf1le0EONMnAhNWv/8Xr6ZsIiqIqihH
	 NdTxZodxQ30/5qELqTM4VMITZqx98cB1OAZ6Lz06yIcldhSxwRJcnQSwl15kc8AL0OZkw
	 i6RGVRa+m54gFJdBkg/ZqFojl7T2fK2wRmZUEgwFsihm8UItYr996Onk+n11KfLvw4PVs
	 kXXGusCuAx/tQbx3AkJsgD7S8SGOOrmhTrIpt+4SQqABowV/SxvhnL7iKBfbEbERbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637014;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5SF/q8pr/2pIISxjfoSE04GDV9J/4diNi7cS9BtLTyo=;
	b=EhIbqTeU3pwxtnyLPq4LKibz0bhrkjyq/KldXGAon26p3tEbpnQsicyW97F4IJ12x+tO
	 xj8Ns8hFl3y04BOE0az1NAQSuE+7cFgdz1KxXumOOaNagIwmMIZEzVaxcognvtK20Bboa
	 ruYTK3E94QE4auqMyhVa03E0xL167MP2U3pQZ+vJvwtLMQgmPetP9S+6iAKCcHqN9iN1R
	 OkPnwrN8FIWUshh9knalsTTmmjw5KrDFYpLvaPO9cBWXOeeCXwRdk64v+j7TKKHHYG/FC
	 Oq1lpMEGnxSHENtWE0ffMDilC25URMZwC9CQK4FsC3/vpRh1gBLQw1yFmev7JSf435Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciznAjsp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BA6072ED4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciznAjsp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3001F00A17;
	Mon,  2 Nov 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637014;
	bh=5SF/q8pr/2pIISxjfoSE04GDV9J/4diNi7cS9BtLTyo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ciznAjspHmO4moOwJm6immabK8shiofklXsWTDE1+bx2tjLWwSLXCegPdzIGbmpUv
	 4N8lgAz//ShZfHI411NOlMVHsKeZT2ZOX3ZTUlIJzd5UaqlXayldAIN5/y6BkcmrqQ
	 ojaz4WrLshfrtK9nTyJEayS0UCus4FDlJQkiQtEnsIkzQlMDA1LgoNtAwdS8EYlhPt
	 i/IYjcQMGmht1rw/RSXGV+jxKQJwyqYv6cke2XS3eiTDF51ky7ypHTkcTdLeRBcoKc
	 bcBGjOs/8b22m5dS+SWd1kJwmIsSDsWo8eIXHzhutxnq2nRYn3qccEqu/800bn4cdO
	 Hkizi7T2F3fkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03116380821F;
	Mon,  2 Nov 2026 16:30:14 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH v8 00/15] f2fs: support & optimize large folios
 for writable files
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179363701254.39295.10495634103077499993.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 16:30:12 +0000
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 chao@kernel.org, baohua@kernel.org, jyescas@google.com,
 daehojeong@google.com, linux-kernel@vger.kernel.org, Dev.Jain@arm.com,
 David.Hildenbrand@arm.com, lipengfei28@xiaomi.com, zhangbo56@xiaomi.com,
 kaleshsingh@google.com, nzzhao@126.com, zhaonanzhe@xiaomi.com,
 Ryan.Roberts@arm.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 28 Oct 2026 23:43:51 +0800 you wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v8,01/15] f2fs: extend folio state for large folio write path
    (no matching commit)
  - [f2fs-dev,v8,02/15] f2fs: carry subpage offset and count in write IO
    (no matching commit)
  - [f2fs-dev,v8,03/15] f2fs: support regular file buffered writes on large folios
    https://git.kernel.org/jaegeuk/f2fs/c/97c64ba5ddb7
  - [f2fs-dev,v8,04/15] f2fs: support atomic file large folios buffered write
    https://git.kernel.org/jaegeuk/f2fs/c/8ac2add73d76
  - [f2fs-dev,v8,05/15] f2fs: support large folio writeback
    (no matching commit)
  - [f2fs-dev,v8,06/15] f2fs: account large folio dirty data at block granularity
    (no matching commit)
  - [f2fs-dev,v8,07/15] f2fs: prepare mmap write faults for large folios
    https://git.kernel.org/jaegeuk/f2fs/c/ef600b86fa0d
  - [f2fs-dev,v8,08/15] f2fs: make GC migration large-folio aware
    (no matching commit)
  - [f2fs-dev,v8,09/15] f2fs: optimize small block size large folio read
    https://git.kernel.org/jaegeuk/f2fs/c/3db2859c36ab
  - [f2fs-dev,v8,10/15] f2fs: support partial uptodate large folio read
    https://git.kernel.org/jaegeuk/f2fs/c/3a54a923164e
  - [f2fs-dev,v8,11/15] f2fs: handle partial truncate of large folio dirty subpages
    https://git.kernel.org/jaegeuk/f2fs/c/a17b730b74d2
  - [f2fs-dev,v8,12/15] f2fs: fix zeroing paths for large folios
    https://git.kernel.org/jaegeuk/f2fs/c/feb4f88c369a
  - [f2fs-dev,v8,13/15] f2fs: handle block cloning within the same large folio
    https://git.kernel.org/jaegeuk/f2fs/c/25076e575f0e
  - [f2fs-dev,v8,14/15] f2fs: allow large folio support to writeable files
    https://git.kernel.org/jaegeuk/f2fs/c/987f5d0098a6
  - [f2fs-dev,v8,15/15] f2fs: make compressed files compatible with large folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


