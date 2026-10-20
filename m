Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532330;
	b=MH6zmY9rnPvw2ytIXgRn0tbEIEmbvLPyxjXkyGlWphq2K8rPnaB3cV7ECblxRzlSCWtl
	 TzBG9t65arUURUceBQALbX7vUp9GWddUpIwembkp9Vvk83iTqTuXghlrRFcrn6JUB4fk5
	 EcD3UucCyzNNsnc6kNTMfahUibEOtFOc0L1apzrFzo1PKel2WBU3lUBTrmcgB7s7pKeKD
	 dVcpYevFOQ2v+5f8acdjqZgMVQZrHZcHiEHlr8no9b+h/zQD+HUqFO/WJeMPuCodImPW+
	 L04+qlUCdodFw+7xx8OJ8MKAROZqwGKgeScZwySPkyGYPIaqLyqqKFOw+3LoZLt+23A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532330;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=i4y7KqpEnaFvXdw7AKKPqls45t7Iu4p+lTqis5OxYDo=;
	b=UEuFGwS9Hfai2soYp82iXgAmRKcC1CjNpLbMBWuHVJMKs6oa9E1ljEMg3vpUTSh6K5xm
	 lbeS/4zx6HCoV51yUqjVnH2q6yOrVUAoi+azqoMhtyq5ZetrTHezDH30/9/sQm5gyTWXB
	 n0c2LL6reVYsReWHYDR/PkAa8WRh01D11wjuPfWgafVRwEDrkRqgPh1dgU7DhgijQMAfg
	 MuIpSE6dClLwyIJRg4DXkZKzmOLtwys+U23wLTYtQ9oQkWuz6LDaOVRSd6Ro4nnW+F5Ok
	 PqV/YbhiH9GcmL07ByNpDToQjlCcVJPFWtaWegIfFqWXqpFJQ0UN9K3tuMgMtLSip0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcofddMp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29B606A336
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcofddMp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441071F000CB;
	Tue, 20 Oct 2026 21:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532330;
	bh=i4y7KqpEnaFvXdw7AKKPqls45t7Iu4p+lTqis5OxYDo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FcofddMpkc6gAJ5HaBsptlu6errd1cSNQM/ZmQs0KRnej2VOpm6IIOg5hoth0Mq0f
	 zRQmJPFBWi9FipaCpheC0IeythaiNHK0ZCGVt9Dcv0hKydaydk+JbNRgZppNSXQTfu
	 LDERRu2Zyjy+fHWLpWnejs2x2e57RtOg5y3O2Lrg01WeGMsYKSNjVaIB4JfCQOBWgJ
	 ENwi3Tey6/oXCkLoczJ7rwrVb3j0Ac5MAd5YSR6dNSVQXYd0zacU5yafkpE5ZwPIff
	 +ubRyclQ3mdY8nzfnmeEoXK9ql9IcgWZdfh9W6M6kW+NUXMr4fWpvvQwrzi+U8OHFq
	 qFBBtJkw8Owaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2723809A09;
	Tue, 20 Oct 2026 21:38:50 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cpu for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020040417.GAatboQRu2kKhkvhPz@fat_crate.local>
References: <20261020040417.GAatboQRu2kKhkvhPz@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020040417.GAatboQRu2kKhkvhPz@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cpu_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 2711d67bc3a776abcfc651ad87be5d29ada19166
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42e6e6a6ffdf0d8ffeafc6fb868bd8522f31b4a9
Message-Id: <179253232876.225072.10948143488090560710.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:48 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 21:04:17 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cpu_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42e6e6a6ffdf0d8ffeafc6fb868bd8522f31b4a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
