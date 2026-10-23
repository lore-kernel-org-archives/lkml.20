Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794366;
	b=AEBBoNli6ihH22U8lYT4RF0kQ9BZ616GD2+DQjTt+5US9+pSAhHfUG97EEUzXM/kIXlf
	 AXrK6NCUBy7hx+usn7oVpCj40/2xbGZ6Z2XSpBPnqwRPYpxZ6UrNikZyCnJp4QC2YpB/n
	 NR83wJ9wZKMhivLZrPt/gy9lPOZsOin6rUOzlOT/mOgIJAeAOYL9x6EGsHSmt+gXv2HYE
	 XeNeJ+I6vxEnTRruXSKItJuWu6cIleiXant3gBRqU/kuOZ1tC0gvOB+vXulEua7RU8P0V
	 mlga69oaipN/YmWxxjc963i+soSQ5VZCQ+lQ6fk5AZjVixIUbGx2/GKe7agN3GUgVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794366;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=/nqsA1iUfLw0IgEpf7S6ATeJcx4muOihfDGU/5vDak8=;
	b=Txj+kESW0s62vcONQl6v+/7iBAzufWmCjyCFPfRYjfb3lP33+dwrFSKqmEQrXTgfrBYN
	 M6shzw3x2LudHqX0OFjbD/gNoTLNQG303dv9lA4ICU8D5Mk3AigbVW3VFC9XSwOpDBRN8
	 G8FkaKXNO0khabD/kj7sYMwqzXjPXBQY+8YcGUqNLu//M0ckrBhxyG9/I5tqP5ohDVDJT
	 HHOb6tjL7mceanrryR5+fgittgxYRotxGfwcyl9EUxSJPQRJc9bkQQIYpA6P7yntUDW4Z
	 DVz1eucXC+038HKAqKiiAuTyo8dBaamcvbW7Um56L8KQjMwwKhcukUEXRZqCWQR2q4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS3LOkT3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D3606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS3LOkT3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DB51F01829;
	Fri, 23 Oct 2026 22:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794365;
	bh=/nqsA1iUfLw0IgEpf7S6ATeJcx4muOihfDGU/5vDak8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IS3LOkT3+/DJE494J3yHiYMtCTnAz1DwBsWTB8L2UJOJ9a78v7bFWThj+ysp8kfH8
	 k1+a7nvGcYMCgudGpxL4a901zGf99a0Ou8g3F0nF7aZeM8SW39YFMWcXg/bqEABEiT
	 qfiNte30U+v8gPrEJZqjKjk4A+jFRPr90ttbUo8Frbsp/1KCzxcfmTgNal0VmeUr3W
	 0lUiPWMDfsM4VX4KcKVYNyF9pMf1CktjNJpgG486uheR4RFDKE++L3dWs5eZUukfX7
	 7OWFIFBzVChyMU7EUsk6JCfXFLbxtDfNmVA0MfuWB//uQSVyyhM2F/XCXoqe3khm7C
	 nbGArGDIw/YEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 815B3391B158;
	Fri, 23 Oct 2026 22:26:05 +0000 (UTC)
Subject: Re: [GIT PULL] rtla: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020131811.7e70d93d@gandalf.local.home>
References: <20261020131811.7e70d93d@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020131811.7e70d93d@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v7.4
X-PR-Tracked-Commit-Id: 5ddc4497508a628b6c18653a0d5208edc6228aaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ec665e5e7a955f0f5637e420ac5075bef475e33
Message-Id: <179279436400.1300063.14007788887457350944.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:04 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Tomas Glozar <tglozar@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Crystal Wood <crwood@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 13:18:11 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ec665e5e7a955f0f5637e420ac5075bef475e33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
