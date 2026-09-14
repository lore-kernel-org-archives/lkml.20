Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798C499F1A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399881; cv=none; b=BhdEkK+AviFZXxaole6CHWgfmqf4gzHGjNgVzd8wzO7wYDkNHnXENu2WchYtio2QbRGoZUlK43htvYyXPsB+CjWaNg0BCgMf2bHFS0775/VEsDhrSRL71hW6bCxPGhdcAtGyNMx1b0jFqnljkLLRqbhO7H1mVlPQQH1GFFCRp7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399881; c=relaxed/simple;
	bh=/kXwmwA0YV1caOHepPNdLGFGS+WD5lw5gPkkR5IC4IE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sBKXeluDScDUg8j8B/puqKppEhMiWrzFhME8NQ0MtmldRC+a3upCQ58DpfGq0eXr1BVd8jFVQJ17esTvzEEbaiir2Tgmrws6p5/Y215ekYoMYPywHXsAkirtzYaOgaRbUGyG+HemNogRoU/3qCYH6oXeSHzO5dT2L7ag4AoyVPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VujuA2Ki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VujuA2Ki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FAF1F00893;
	Mon, 14 Sep 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399880;
	bh=xqSWZGYuhnFlJXQSdR+kjRpbfk1iIuI1HJbA/iOa23Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VujuA2KihdFCeodvSWGo1fbwVB2MLxRvs+ISKWNyLtk1+Pw6nzvQt+WZuy/SQmSA+
	 KVuYlUBkm0YxB0aNfqfM1t2/wuKV6QL5q2fOu8IrPc4A0d9UQLV4bRVodNkusS+TBh
	 QmBpe0W/t5104bV2X1jYy4Rb8gF2TO+XCUtHoSSceL+ef2G0WuQ7JIpYUnEBrd7MJR
	 HFNHMPN5QUiE7e7vi2vmqczq4JcsDkWZcfCaaCc6yLXs9JmaCXHtgZBIrNFMlrUTCU
	 oewMycPTElaenOut9v+CIOS2XgFiM0PMh7V5Wm95n5ZtRpamm0aZHdG2A9PW5MFUIx
	 /LFsjb+NDkf/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB73924A79;
	Mon, 14 Sep 2026 15:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix livelock in syncing dirty inodes
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981537.647967.8184641811799373916.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:15 +0000
References: <20260909190636.3151580-1-daeho43@gmail.com>
In-Reply-To: <20260909190636.3151580-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  9 Sep 2026 12:06:36 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> During checkpoint, f2fs_sync_dirty_inodes() and f2fs_sync_inode_meta()
> iterate over dirty inodes in their respective lists. If igrab() fails on
> an inode (e.g. because it is in the freeing state), the loop continues
> without moving the current inode to the tail of the list. As a result,
> subsequent iterations pick the same inode repeatedly, preventing other
> ready dirty inodes in the list from making forward progress and leading
> to a livelock.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix livelock in syncing dirty inodes
    https://git.kernel.org/jaegeuk/f2fs/c/e398da0b9131

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


