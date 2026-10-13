Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EDA563293
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930631; cv=none; b=FTLLO+9Fi6Nty6Wvx8a1NjwbcfP5XHap4D6Zxu67qbjf+zLx2+D8GnIHEjreWqmyqqHW6tCmiQPsV+bngo7DoujGk2bFY3RgvuVpKzG6kx7fiEX2h8EWe0wBeSwogWddYhqrkcp1FsCoABkqmwVhmk5XdaEQN1MJJn0Dee2/gCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930631; c=relaxed/simple;
	bh=FaQOFr9tM7IKuqQOMbjjoykObyvO59iquMsA09sOR38=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=otmy/Eh7GK+RQpoWYNdCf7rc3yJ+UL4b4I3elj0YniB2W9wBoZvKIlaZdbH4pGDuASnL5rEGTEbmP9sK/RWlZCUJiorky1Dh2mM9t1xlPocrzV3Ww+cbVpzp3aoO1HXv8ZqPJpa2EZh6urK04uWEe8uCDjcFm2j3akydEBo5Bng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN2sUvzu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN2sUvzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F241F000FF;
	Tue, 13 Oct 2026 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930619;
	bh=V1dhIG9s+dfvyv5FGLs5xco/ge7mxdT0ebSHp2TKX8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dN2sUvzuTi5/yd7b5Aq1aotqHPIIQV3TBvZR0ThXZLnqPodw9S4mkUxshNdHF+Vip
	 UQQIIgbdJUYdDDQUztnJj7bLc5L8LgjnsJsVvdzd6pgnY76pHOnUo6XZmaHjicYZnn
	 AH5n/55lgbdM762TfpVTHQgjuFfNj4bm7mw87svGgFHje0sFNcREdf6Hxft0gZ0qFT
	 M515oFtM2kUYnXNZyp+DORowuTe3rTzzz+JvCcRnoZviXoWZtr86wx6F3ONPl/18gy
	 McefdDpIoo62HMgQMTN1PtJxUhDMOVHc1VShTRwastOSc7KCP+oDgrHB5/EV/7+Sse
	 5hgTuMzGZq9MA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7729839E4DBA;
	Tue, 13 Oct 2026 22:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to invalidate curseg if
 change_curseg() fails
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179193061801.1493834.16888070301853963484.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 22:30:18 +0000
References: <20261013105538.3636822-1-chao@kernel.org>
In-Reply-To: <20261013105538.3636822-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Oct 2026 10:55:38 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> Our consistency stress test (fsstress + fio + atomic write workers +
> "f2fs_io shutdown 1") triggers below kernel BUG:
> 
>  F2FS-fs (vdd): Stopped filesystem due to reason: 0
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to invalidate curseg if change_curseg() fails
    https://git.kernel.org/jaegeuk/f2fs/c/e74476ad8162

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


