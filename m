Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767799;
	b=vDopSnZKehHBTJH6UpAI6wj8Y+K16Rk4X0KwAdhUspEMnE2Lcgqy1prtvi2K+At936or
	 LZKzyVD88reGPSE6lNlwbRzrfNt4dibimQdgf9zDvKq82tvN0VfsxPOFmwLbubLYslJEn
	 JnlV/YTzfMj3zu88Gk2Fexrica+tbINOZYf3/3ZpSv3FB2nLVqRLYET0zekospWiCD1rw
	 44ND6iuyEWBBGcwh/a8bJtQXCRFXO4zrwILXls9swp6LLnvB1SYIqf3KU0tuOqvWlj4xn
	 8xkRkywLOyIcbTMpNYBiknpM4uXQ3ORKSNKDK/2UdJM9jtArr2d1KWabyvBrUwtURvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767799;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=TDNREYkznsZICUq/Ny4V/4Pmn9yyhx7+Z4ENfkgAAuM=;
	b=Am8Pwp0wNoUAgl4Y0Yr39r8BAMh1YMZI5/bt46Z3upULkRooPwl7fLEZzHy/0SrNQ0/v
	 goDCKqe9CuxmdmEa5bEGFnRCkKfSRe1gjtUDVuANBD9dgkjDyBGlCx6UkC8hZPMLNCVW0
	 GAh36BzXVXzXp+eLew2l2e7UbvS26IaZF5CytFKm26UTNTXjzV7xfwXKbsV/8KycTNCKt
	 /FH9n6dp1VVseC/xQhhHv9r8BSRkv1NDupz/+nLitAbInwelSEPnFkB1phAkMQMHXakfN
	 5biy3oq7YNcjsutT0GLbiz41wCQOCTDrOTnLetyMmOjKWIDSLRI2cJO3BmADX7IEVXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9K5gsOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB9C606A886
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9K5gsOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086061F000C8;
	Sun, 15 Nov 2026 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767799;
	bh=TDNREYkznsZICUq/Ny4V/4Pmn9yyhx7+Z4ENfkgAAuM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Y9K5gsORaDqILHcAvmR9mA3VpSCcD3AU2SK0dmkJNkMotEJ4FNgqZoUN7c5XBMiyN
	 TDubPemYM7gn4VE+EELmRQMrH0LNGgWin64nlbkH4YLJIXsW1mtnKJHPTgC2GGKqg9
	 tEEdwlqULzFmCR+2nORalANz820wYMTttKf9qVLJvXarMZW1ZNYwugvYX+/zrb4LJu
	 RQgwHiaNUcZ6BZNZ+i+025syCJ31ucTbdll++FkMfNgaqDY7Ew/BecdQFkqQ3fgmV7
	 PcskHFSnJvzeHbVHigkSbfzCBJxA8dz1HxiNrhcnvThZPXegt6YJpEpPbhLOeJZygW
	 KINS/MgBC3JAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15733808232;
	Sun, 15 Nov 2026 18:36:38 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avmi5linMgdLjgsD@gmail.com>
References: <avmi5linMgdLjgsD@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avmi5linMgdLjgsD@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-15
X-PR-Tracked-Commit-Id: ec6f6731538e0d45872eb279fdeb477bed152d6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc28723faec6c5eda0263b46e23dd89d5c29f464
Message-Id: <179476779748.2691368.8317744602065710288.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:37 +0000
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

The pull request you sent on Sun, 15 Nov 2026 13:17:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc28723faec6c5eda0263b46e23dd89d5c29f464

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
