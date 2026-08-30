Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DADF1F1537
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116787; cv=none; b=JfAO0OnMLXRYnQl7WUAJZifbisajWPtWvh0R9xVBmR70fFU35zPEFtqzo/NMobXxAlI6D/1k112rtyJHZ82QFp1BVibDO8BLNHeYqhfN1nv5xU0RpqBolH5AkhcG18y+qja4/KRWgdBPsn3S59+5m2QFlpbTLqhsJmAO8wJ69xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116787; c=relaxed/simple;
	bh=/ku1RleHrcoapMT1E9RjEtp6Tw/qrns0Gd7PbxZ7GQA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uKKXt+SZC8VioeE23o8p3zv/QhxAXEs8A9S6zRKZgxXXKrr8bhEkXe4mHYMl764rfKizjGS+LbosYUjklsM9vRmksMdZyOdqBMaeZEDgzHfyZjQeNbY1Tzvyj2f6nrI2eGk2rS2U5Txkr9aybCX16maC+1Flo9fZ43nfzB2hMVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lorsAj6C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lorsAj6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752C21F000E9;
	Sun, 30 Aug 2026 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788116786;
	bh=/xszlC3mc5iryX/10lu+bz06fC842TWZGgUSs/ILSio=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lorsAj6CMDi6Q+lJTleRz9MK1KzDqHkTOgl6dRaeFRX/7ukfDdM3qLxVprzcLZbRt
	 LBd0KS8+r33wR4UqWMPMqNMv70HB5J61NxIXYENj6WEgR1TyHrLzqmW2JYmj2LudKV
	 ta0F3BlG/Yh3qbEdtYxu4y4jcO9GQmnFE+bKcyqn8hI6Ft3+7rVn7Rk1KoQW2lrAPl
	 j4smG1ECUfJO9z4s89U4F3ftT/ahum3HtqywFjgiMjLEZ7tQ/pr5esbn/2iJ8aBobv
	 b4zVQ1I+F8eQoWaPpHeEPsIXGf1Sib5kgBTKtsQ3xnT2Yw5Hm3EtDSJptUAKkq7Hq2
	 gbZ2aWB8c7XYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56933380CEE4;
	Sun, 30 Aug 2026 19:05:31 +0000 (UTC)
Subject: Re: [GIT PULL] coccinelle changes for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <b81556f5-338-ea2a-6a71-5e115e66b84@inria.fr>
References: <b81556f5-338-ea2a-6a71-5e115e66b84@inria.fr>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b81556f5-338-ea2a-6a71-5e115e66b84@inria.fr>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/jlawall/linux.git tags/cocci-7.3-rc1
X-PR-Tracked-Commit-Id: ef6a1dca8de41a408019310649e6d1b7b21ac4bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eea8bdcb59e02729a33a8666f7b0b5e30e6cb736
Message-Id: <178811672996.3429557.17540924218456081634.pr-tracker-bot@kernel.org>
Date: Sun, 30 Aug 2026 19:05:29 +0000
To: Julia Lawall <julia.lawall@inria.fr>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, ekffu200098@gmail.com, akira.aiura.bj@hitachi.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Aug 2026 14:59:16 +0200 (CEST):

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/jlawall/linux.git tags/cocci-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eea8bdcb59e02729a33a8666f7b0b5e30e6cb736

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
