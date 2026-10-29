Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313963;
	b=1WZatCc8iqWvGY1EhRYG7WMSBWKVXN0b03eW2zIXDsCV2eKsr7fLhTYNZznCBL5dkYed
	 TW86n4gvkONtHaYDa8dHgIL7ohwGRoh4xRXzC8C/4yhE4DuPejqdd7+An09ouZaxNrerv
	 QNZBxRkmPp79bgCJE5JPmuXP/w28skZ2sCsmAMI+/jIYr7XMRJXQga4khlzKk983zbk5x
	 6vdn+nAJZY3chmrkiC4JglVE3/6aA2IUtbVlnbiXG1jN5F0MOaDp9IL0TAVpxj/Z0M7JW
	 kEq13JWd4PoSnNoG7VZZgSZS3kaMx9wESgLtNd8udg0JI+op8FRd8TescMfdxJZU+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313963;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=l2+cNjQ5KGeOolXRC1roOqIk3m2TZLZEQd8mGc6BiX8=;
	b=pZAZ6w0gImeLU1gNSHt049lWJ8U9E4+HepzEH+f3on8ugwD+4skz/qn4C9KpvCICCyC2
	 NaL0aTwALvVomOUtApIKX2aN5aVcmYNGheBOU53V4asRJyA1uPQtkkT7Jbv38NAvUwxwI
	 1QWEFozGJsmU9bj7uE697Mpv0egptLE06WHsw3iRXYJNEeiH65GtCDbaleREIyMyO78KI
	 Smk42jD3l6ySwMsS7wZI0FUYdU7atvaQGU//IjjMp6N/IAZ5cx1ESSK+04ZPNAD1yFBe0
	 yNxboF/tha3qUfZVkpNd9FrhS33s6Ouu6TQn0HHfPB+vC60XNU3UWnw2ixeDa7Hr4Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjNHVtZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjNHVtZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF4D1F01816;
	Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793313962;
	bh=l2+cNjQ5KGeOolXRC1roOqIk3m2TZLZEQd8mGc6BiX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SjNHVtZMc3O3hrFPHqnCPFHvuKJUR3t/uksDTfgzawCAGoHjBKSnmVeAcWplMyiUg
	 SW5TRtRlisvikRKO7kEa7UPDxheP3cFkgwDxZXPcgwf+L8ZLzyumb+Q6PjSZsJEth8
	 3EKZroHiC0M2wk4wuVK3MM5O+fp46RuBSXtgNPeJuXyP92nrAfwQzh7rQKi+KoCkTU
	 pN7rZhRflaX6q4TiwTpOkeXr+CjPIIYEIYRCBiR5CkhfAb0hX8ohH6mHY+QZIUBgzw
	 pRORyquHTwV6vhXYtc8t/ZyQvpMEZ2svxIV4dbt2JL7gOpLcxgzxcOs75oGb+o1n2X
	 tEchI6Pot/UGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7ED0F38007D2;
	Thu, 29 Oct 2026 22:46:02 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
References: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-mw1
X-PR-Tracked-Commit-Id: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b8b67503725fa6deb3a4f00ea61f982bd00c152
Message-Id: <179331396117.734384.10042062120285869563.pr-tracker-bot@kernel.org>
Date: Thu, 29 Oct 2026 22:46:01 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 21:32:56 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b8b67503725fa6deb3a4f00ea61f982bd00c152

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
