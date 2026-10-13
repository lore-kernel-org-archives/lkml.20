Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE49566C58
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930645; cv=none; b=QAM8bgdRNxOpJxFCy1oqxVCe9oYKMqLFhFLhhnr4OY02hR6fIhBeG/COXpGJF0ZUIZhrtpcWmK4XJ3sXKtB6ZT0N7a3PuALOwcYVn7p+6/qIzr0izu6djrMvURXsLuwvRwlQYik+I4ZZa6SIU6OUxhPKVb6z7/HnDBMzCWfj3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930645; c=relaxed/simple;
	bh=OLznSpKYYKtq+uswuS8EmPmzPfhpJDcG2SC63HLhgyI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JB5cMV+dS84qURJ4t3spNxHk8RMFajpMSCj7TEjlBgWBv9Cvb9CzK3CFZm2V+dicy1DRAghHVxFWwbbxTRkfuiWrNdPLuhOqqsMHcEVUviZLKURwQ+9zmsgYCJn7coRxn7KMf5F9UPMu/g9cT+fQ6f5Ntc15CTXTjLd8SoYYe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtY6kmjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtY6kmjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084701F00898;
	Tue, 13 Oct 2026 22:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930641;
	bh=f1czPV9+k4BQL3W+Fs+3/RCZKEfLsAG7rN8tKFHt6wI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EtY6kmjFl4N/vls9nr1d/gfmeNHK45rfyWH18WTIXQ+uzLlgJt03J47QWqz9Kcug4
	 GsTEzh8sQP3zMvPhkpi6xldzj4i2pvIXP/WLdjCyyMxbLaHPnT1NRmtT1NTGSL6ecP
	 vVVbqfSJsEW/EXtBR/80+7xrpAxu4iPmPwbjA+t/6ByqF+0lCRqVYMLLlEnYYFOCvF
	 Zv/KI6fs7qt4NG+4MfM4GFlQvhIAI5II+sTBRxWYOAS+f1TZdlZqwFJzhM1iYMr1C8
	 oRiq2yNK8KsSy5CcclSt4SDv9EaA+EDRZQkiokzXrRM9xw5HJsh7J+ptZmpnmydhLR
	 H4F83aLaDrJNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F141139E4DBA;
	Tue, 13 Oct 2026 22:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set sbi->log_blocksize in advance
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193063951.1493834.17396004482002929582.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:39 +0000
References: <20261001000450.3822520-1-chao@kernel.org>
In-Reply-To: <20261001000450.3822520-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  1 Oct 2026 00:04:50 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> syzbot reported a shift-out-of-bounds in __f2fs_commit_super():
> 
> UBSAN: shift-out-of-bounds in fs/f2fs/super.c:3950:27
> shift exponent 4294967287 is too large for 64-bit type 'sector_t'
> (aka 'unsigned long long')
> CPU: 1 UID: 0 PID: 5622 Comm: syz-executor329 Not tainted
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
>  __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
>  __f2fs_commit_super+0x43e/0x4d0 fs/f2fs/super.c:3950
>  sanity_check_area_boundary+0x7c5/0xe20 fs/f2fs/super.c:4040
>  sanity_check_raw_super fs/f2fs/super.c:4215 [inline]
>  read_raw_super_block fs/f2fs/super.c:4625 [inline]
>  f2fs_fill_super+0x1920/0x7fa0 fs/f2fs/super.c:5160
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to set sbi->log_blocksize in advance
    https://git.kernel.org/jaegeuk/f2fs/c/63bb030f36b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


