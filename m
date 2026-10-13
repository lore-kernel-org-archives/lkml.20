Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DE5632B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930618; cv=none; b=QwRQY3Dv++iaU5pKwxMx91BxhMIEhaek9Bz1nmGNwNXwtddcEnFtT4xqsit5wwmwLnQMYUPn8tiJUJ+YEqtKlBnGsx9IDfewiGo1NpouLNuhbyC9WeZXZGKsfbvjAE+6llowraWjzTYAlA70i0pAsc7X1w6vO8y09Sw9L5UrLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930618; c=relaxed/simple;
	bh=klBLD2ClpOiCod4OmNDxwqvn8k0a1YAe+mNDuzCGA7Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UHEgprxexg6SbX8iAF1Jvt+T3DTxzTEuN03Fa/o6U3WRvnUCatDIQBNoubLuknAMS5ddsN7x8VHbJ+7ZF5g1FqYPf4b+ro8cuxmMmBO5QWSXTQS2Uhh1wE28WFxcFUjRFFp3+XbVDgHHviSRPI/TYnh0WTcpkJb6J2rPglpRHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKO+5qAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKO+5qAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820811F000FF;
	Tue, 13 Oct 2026 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930616;
	bh=EsH3ZBvKbRUSzhUyxaPt/C67sCyerjNV3qXB+t3cBCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FKO+5qAlgmiKTADGImIXvxYXa+vOBkIBR0tBPOFXajzDi/Rxpd4bOX9i7lreYnOf7
	 2qDYzrvXIZRnrdmGM9RTPeOcbiFygBjCcS3GfoOJW0M8dHnDf0eoeqQT+mz6oV83h0
	 D4GpAN5SxlJTta84pudye+m3I+2I3ypkD4pLVsSeo1T+rTo3QFMH2YepVET6N6yNpI
	 /jog/v2gxscu3a5q9rcFX3Z725MnJoQuBFlrwHZGF20EAri7Q3GJqesXYA2Jf4YPhH
	 qU6JE6zZ23ONS5rvrhbp4zCXRisAxYl1+p/FEQOzxqXgx4lmathsxgREDZ9zSc1wyd
	 KDQD1I20vaVYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774F539E4DBA;
	Tue, 13 Oct 2026 22:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache: count the temporary pins apart
 from
 the regular references
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193061512.1493834.4792720096460143824.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:15 +0000
References: <20261005192114.1511660-1-daeho43@gmail.com>
In-Reply-To: <20261005192114.1511660-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  5 Oct 2026 19:21:13 +0000 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> f2fs_unlock_cache() and f2fs_end_cache_writeback() take a temporary
> reference on the entry around clear_and_wake_up_bit(), so that the entry
> is not freed before wake_up_bit() returns. f2fs_destroy_cache() waits
> for the LOCKED and WRITEBACK bits and then expects the refcount to be 1,
> but the bit waits can return as soon as the bit is cleared, before the
> I/O completion drops the temporary reference. When the completion runs
> in process context and is preempted there (e.g. dm-flakey in
> generic/311), umount hits:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: cache: count the temporary pins apart from the regular references
    https://git.kernel.org/jaegeuk/f2fs/c/8596baf652f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


