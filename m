Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD2563FC4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930639; cv=none; b=iYcfIJSgMUcAvcJKJEYSz0radW3soiWbc+ZrxI8gM2xvs4I+PlOYPxfkshSB7S6cxncNK6SYm4LlftHnzk9vzZSYJR+BmgK9AxeueyGfMzt25d6qdiQdZWVUhP32EQAl+pFIhS+BxMMhLBHZaURpm5ople/4vOfioIl6AjnOoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930639; c=relaxed/simple;
	bh=BaEKBUOKEzQ5b8e/VRsPffHdnf2rXelLGXnVE8WqR8o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XnYf4XN47P17YV5XRGFauB5RxEtAj8ItSZeMBXc7/cRn16ZHQI5hlXHCW0jHPoJMLvtItoXIzseve2W3Ocnh2YlC9gG+xLDfOvPy9cAPIIYiCgaQJjo8U+cgvOTL4S1cxdXWhnDNiRHI/BsTzUm0NBCINlJKN2PmZ8m+qPkctb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqRYlEbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqRYlEbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BCC1F0089A;
	Tue, 13 Oct 2026 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930633;
	bh=u+fnW1tPmbxu40oKMWMwFjVwadZ8TEhMJgUbBD5hFcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gqRYlEbgl30iolJJRxI04b5/+vX2vDUf+gvmTH3AeTOOKftub8TF6ePRgQ1cR2+QQ
	 Wbsn8pH1VfjK7UartKfdhwrDGiSTiIkwmWyWC4S2D5yPLA8YnXKY7sIXGXyJ//6D0u
	 NIQxN652R8bmUqYvcwldzYIik0VfvPXl3lArPuovl3VFxYjmIc4l5C9WFv7U1vIIRK
	 NS6Nq6jL4w8bg897dQF8+ERTCcV1cKPkwJDz9fOf1pIjz+NYVODSE4brQGInR+7CDi
	 B/3p3E6ypRdsQeBSwEEC8/++3KHYtvybi9gLbSw4m+ryr2SVcZdu4gUCpHvERXCrg+
	 /DqKbkxAolHgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773CD39E4DBA;
	Tue, 13 Oct 2026 22:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3 00/17] f2fs: support & optimize large folios
 for writable files
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063201.1493834.2435628094776916750.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:32 +0000
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 chao@kernel.org, baohua@kernel.org, jyescas@google.com,
 daehojeong@google.com, Dev.Jain@arm.com, David.Hildenbrand@arm.com,
 linux-kernel@vger.kernel.org, zhangbo56@xiaomi.com, kaleshsingh@google.com,
 nzzhao@126.com, lipengfei28@xiaomi.com, Ryan.Roberts@arm.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 10 Oct 2026 00:12:07 +0800 you wrote:
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> It also extends f2fs_folio_state to coexist with f2fs page-private
> flags and to handle large folio write path and partial truncate of
> large folios correctly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,01/17] f2fs: extend folio state for large folio write path
    (no matching commit)
  - [f2fs-dev,v3,02/17] f2fs: carry subpage offset and count in write IO
    (no matching commit)
  - [f2fs-dev,v3,03/17] f2fs: support regular file buffered writes on large folios
    (no matching commit)
  - [f2fs-dev,v3,04/17] f2fs: support atomic file large folios buffered write
    (no matching commit)
  - [f2fs-dev,v3,05/17] f2fs: support large folio writeback
    (no matching commit)
  - [f2fs-dev,v3,06/17] f2fs: account large folio dirty data at block granularity
    (no matching commit)
  - [f2fs-dev,v3,07/17] f2fs: remove mappedtodisk flag usage in mmap write path
    https://git.kernel.org/jaegeuk/f2fs/c/b3c984358925
  - [f2fs-dev,v3,08/17] f2fs: prepare mmap write faults for large folios
    (no matching commit)
  - [f2fs-dev,v3,09/17] f2fs: make GC migration large-folio aware
    (no matching commit)
  - [f2fs-dev,v3,10/17] f2fs: optimize small block size large folio read
    (no matching commit)
  - [f2fs-dev,v3,11/17] f2fs: support partial uptodate large folio read
    (no matching commit)
  - [f2fs-dev,v3,12/17] f2fs: handle partial truncate of large folio dirty subpages
    (no matching commit)
  - [f2fs-dev,v3,13/17] f2fs: wait for folio writeback before ffs_detach_free
    (no matching commit)
  - [f2fs-dev,v3,14/17] f2fs: fix zeroing paths for large folios
    (no matching commit)
  - [f2fs-dev,v3,15/17] f2fs: handle block cloning within the same large folio
    (no matching commit)
  - [f2fs-dev,v3,16/17] f2fs: allow large folio support to writeable files
    (no matching commit)
  - [f2fs-dev,v3,17/17] f2fs: make compressed files compatible with large folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


