Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702221;
	b=XHs92VLkLzLHaeUe2Nbe6Mm3Tw+mheC75Ew5RdxdhPmbfw53HwA+CVAR1/i5mXGK9iaa
	 LYxi/QPJrP0ZYR5KUv77tSAHf3xQ+lITbngNE/1CjHEZ9lzY7cyXiZw0rE6cp0CdpbXdu
	 unXkAj893R8Uyw6PJ6TW7LxxtfTy90O12ijMeI+GKZbt3EOiA+WagDANR084phlbUXenO
	 /p4e8Ntaw6AqzJ2w7GbmhrQHt6MI2hDASkdXATOYp8GXZO5eHUPWYSD/3NV1sjtGcFaWR
	 GETvttY59TAXpgwnqOllfaew6pzUyVmGQ1TxX3SmncV9jxv5amBYBUC+qpuqMiWZFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702221;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Ss54HCOGQXVXxY8H2tgr7n/s17Vbv0Sma4uzTUPNWro=;
	b=rtSMM3xJxH9eNtP2z9RvI99cENZ7I5FxzD36B37IcxLYg8qgCOY/kDAT6N02jTn6oWLm
	 S6IRmR+LsSkRyDA9qbh0KCiLU/ErZjJCLSr7Dm0ubg8UcBRMfRwq5L76qLQAKyGD5tzJf
	 6b3/gh0MW4l1ibS8J/YJpmW3SY85f+0K+BaxZc38mS0T5cN77Dqn7jsKEuvgvSG6DOF3u
	 2NMY25t98nyGR3JGR6ZEMKOl3QEW9G1Vs6/LMenlTLtj3bACiCYZDFBE0+RPjH6fyvIWb
	 trwutEnMxT0ALiKW/4xQpIvNE84pgXAhT3KNayI2F3VLfEsywFmb4DmIMJvoGxKARbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrY8akQ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F87606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrY8akQ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2781F01828;
	Thu, 22 Oct 2026 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792702220;
	bh=Ss54HCOGQXVXxY8H2tgr7n/s17Vbv0Sma4uzTUPNWro=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lrY8akQ9R8fOG1GLfiuFr7cFS8CnyZ1k/azlwcDEHKAyDcy63qbwB8x2XfqJ47Jnd
	 PPy0dE6RpuWdGRN7DbXjlrC9xdG+6+r9TEDS6rlCyFOvAUP9j7apcmBi0XIeBKZf8R
	 MnyMIiEuRU9jt1MXVXlcgM5GbHXKfb+xE0u7hAwSsuA+VQ/iAu1OUEEaaOl3YrgeWR
	 7qzvGq9Uj8L6z1vidFuTNYntSxjjLHgtZMNNwa2xjT02MH807PClvYDDbzMPX1bkIn
	 K5Q3PErS7vPggSCXl6DVMQi7ejL7/LYaO8Ibz89UbNc2UCN5bPmNMxqbFIG8+5BAhM
	 wZhsPhXItPzAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0725D3808222;
	Thu, 22 Oct 2026 20:50:20 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <d4910dda3c8d655e1a8ccaeef64662e9@kernel.org>
References: <d4910dda3c8d655e1a8ccaeef64662e9@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d4910dda3c8d655e1a8ccaeef64662e9@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4
X-PR-Tracked-Commit-Id: bda345b3fc59f2899c50379c64a0734a3e720683
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 031cb4ccf803f15b73e153d71024d75031bef5f3
Message-Id: <179270221883.170280.15512068495271823915.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 20:50:18 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 06:19:26 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/031cb4ccf803f15b73e153d71024d75031bef5f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
