Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167183;
	b=kAyxmip3mod+NhUysu1RIiCRXV1HESp/Yw0mBQFgfORQ31kK5L+LalTflDPFx0u9LCNj
	 Y1TqL6seFcvgPtbbbRjGHtiNB65qhs+hZXtgHU3wj2mCkyYdJPSTOFUvwxb+65s0TsXJF
	 YANs32pcC1aybqwhbP3OkLUH0FXgxmNvnglVKKst60mToKsLyizZAniSFCKMOm2dI/1QV
	 evuNtgHTUM25eKI6zDJM/FwGSWQFge1mXyKg9ANpIzrj/4yl+sNxLq9RWa8AIExGOpdr3
	 FrV8AUHOGMj3nYoRWmWmFlMg2ySqSlItC4661m7gRrQn7EOZyU68nedAGvcNJfrZgDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167183;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=oSFXoKebbcSzGXFfTszandbEV0MRewn9UO7q8eguoME=;
	b=trk6HoQDj33qsOOP6dxAe4Cm5gjCjzNKRdhrvjIFiCzp6aIKf50oS4Exm7hGDLas1QI6
	 s0M81b1ifRbTNEe4LMG1iIiXD/ftQbmP1a71gmhdBT+3vY8gEFdI2J71c3bRV5CEfLtoz
	 SM2eGEZSUbHu6SWMt6TuDVIaINDcJYBpx4vLKLbMtqDuSWfDIqEl97YEeGYZ3vuSOZdYu
	 MMsu7TcdO+AyIihnE0tRjtalzVHOBUP7lETFd0f21+UW+9580NqFqaSDYpwMtbU4SRG3T
	 IU9b6Sdj98R19H5b7XjBnRklma2PrOSQ8w5AFi3uE1KSU2UNedfXj9EiHAmq4HC8aaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i/RqEcUA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8E606A33C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i/RqEcUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691A01F0089F;
	Sun,  8 Nov 2026 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167183;
	bh=oSFXoKebbcSzGXFfTszandbEV0MRewn9UO7q8eguoME=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=i/RqEcUADh00a+hrZU7qlKQxIcMHkm3O96sQR/ZCOPsG8DlIqDLuVpCXc5WTkmqoe
	 gIj7jMwuvB3hRT0NiDuHDW80cULKIBjgr+s+R1MsxcK2R6J6E4IFxwqa9nQ1GsZDht
	 pBGyYQ4me6xBKBbIT9InN8WUyr6BlaFkmE/iltxava3FVEB302xnSV7dROK7Yyj5cc
	 WGzMYISLZbECJdLlUZIeE5PLaKIhGonfds46PanLhiwdP0HLzTw0x6WXVcR/PP8iwY
	 wCOUYMJiGLacRb5aG3b962SH1NVmhXJyu06sMk9I8SnJdg4vPL0oQJujyweLGJnTZ9
	 pQRItb1nsFk5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E1F3380821F;
	Sun,  8 Nov 2026 19:46:23 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avA9aDPBDzVlUqcF@gmail.com>
References: <avA9aDPBDzVlUqcF@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avA9aDPBDzVlUqcF@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-08
X-PR-Tracked-Commit-Id: 006991aa89974378ee579416dba87adc22cd60fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ebb9de23bbd942b1a2431384e4a62908c31bb2a
Message-Id: <179416718186.1685596.17704035444438293464.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 8 Nov 2026 10:14:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ebb9de23bbd942b1a2431384e4a62908c31bb2a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
