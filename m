Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148674EA394
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451870; cv=none; b=Vwk3PcR5tj/3GmFXAY5owF2h1ETDIxbr9vpPxmN9nlhOeMqbWpqPo4PuIRC2tS7ihNgx4vGeEceQj4O75wL4H7IwFGqH8aee91xOXJB9HbA4j0n/1shSTcBbyjhnJwq2M1E6TG3uSCw9XpprvSpv0Au0vbV+JhsA4mZtP+tCGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451870; c=relaxed/simple;
	bh=yhq9mMGLjV9UfUHyvbb9Ko4VH3mQNNAPehyJiBjawpI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XuWcZhyEPG96gX+1D5OUwXppH5golArTLr2fwPgA+ZWlNcbbKdWCYNKFE/6CVp53HYlLnxFgU9vHZhnE+MlftncRSfL91tw241UumEEdtbseEu9qCsWAkdcBSarhZVJazoSNLTG6Mb8pqFwHSkxO5SCFrrouCA2wrM6cDfGNFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3ZN+Kh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ZN+Kh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8907B1F00A3D;
	Thu,  3 Sep 2026 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451867;
	bh=szYR7Ma1mbriTcSwoUhkTC/Hc9tKuWEAhNgqLZbdKx8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P3ZN+Kh+TV6V9T6HxFv960PkRoA3O+xcpyTu+eRwp1Pp9woU/C69bl1RZCHf6rSA3
	 ywAU4y3wHlrqPCORpmVrqM39S1BTnZR3Xbb42j9upHN9ZB265yCTHmefzb3bz6S5yM
	 FRlV4ukx3VfY+ozAftsnKHoZpdhz+ZDHZ60YrynMtePXSlG6oleI/j6IvGvRpPmFgn
	 oSSbOJvl+g+xWd2A8d5baz7SB+y1aIIUCm1qLusz8YltGpHW538xxHuUj/mhjIZRi5
	 BVjjbUgQV8WZCwPWe9eNk3+gljIDmEQLNdvnhfsqdanyn5FOHuRTaAKEsZHJdfixEg
	 FWC7L5/49CQYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199E838119CB;
	Thu,  3 Sep 2026 16:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: wait for inode record work before
 clearing ino bitmaps
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178845180865.3423963.18175372043780250753.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 16:10:08 +0000
References: <20260902090611.564876-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260902090611.564876-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  2 Sep 2026 17:06:11 +0800 you wrote:
> APPEND/UPDATE inode state recording was moved to the inode eviction
> workqueue. These entries were later converted to bitmap values stored in
> XArrays, but the workqueue drain was left behind in the list cleanup loop
> where it is now a no-op.
> 
> During unmount, inode eviction work can therefore remain queued when
> f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
> repopulate them before the workqueue is finally destroyed, leaking newly
> allocated XArray nodes when the F2FS superblock is freed.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: wait for inode record work before clearing ino bitmaps
    https://git.kernel.org/jaegeuk/f2fs/c/56bcda97b38a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


