Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987642;
	b=xTzvpjItGdshxl1FM4YL+EjbOyFAgyO1zbqTnL+WWpM2RzaQRxNRiK76tVZ20VQKfDX4
	 WN8MWWbSXXrkOoT/Z7Iin5i0fI1MuGkdeTRqXqjUkKuGi3pXMCcyMwKjphBSHPuVGDX/u
	 TiVU8m6rc+mHGIkpDCLWJwOw64WPjedhIyaRmVGsh6EXHH5MdsI5REnyMQ03RSAVa+CkX
	 /r5dsSba2T+u5qk6r4mYpcNiBfpAleLxUmFViGKCXs8QpLMr8yHNQrgGnFVKjkVCCYXYm
	 4xtGP/qVXBYTuWHafylWmjvq4kylpmhAmNAhMOF21mCq13aodMdgGBxWv7wMeaT5h8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987642;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=9mYJQZw9ex2z1aHfu6s/EyiuUnIPOzceltqElTfzAYo=;
	b=yZ23T7X5crUEKFRm30fMCDlUmGfiCFAMT6I/cUrYo5fOQ8eyU7F/zOw/ac+5JTaozbK4
	 l1/GIe1rXfzjZtHS/Xy/e8k2gTKAVurPrtCdZK2WxTWsz75bZh82bgU3t5/J21bXRwmR3
	 +uKNJecXicG4Hvdnb7VjPAc7oxUxG/zuGAZiI9h/elJXY6HFablKOmnwb2RdWpUVhlPLv
	 FTyfRXpZMx6sQDWt+swHgDPniG+kPHR0ydQ81pMa6MbWnUkSXdnRmPgl/MPhM6M6S8V9I
	 4LI6OpHSDp/dbhqXjnDzTbNAQBAdq97uN9PHmdGcAy+xCdjqa7DG7MhcxxRG9hvAGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3KOkTjw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28A606A322;
	Mon, 26 Oct 2026 04:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3KOkTjw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC461F031E4;
	Mon, 26 Oct 2026 04:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987642;
	bh=9mYJQZw9ex2z1aHfu6s/EyiuUnIPOzceltqElTfzAYo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=K3KOkTjwv1yaMiSMsowuOZC52S3W4QMS+V3BUAHbCVNPkW05djVhs6Lhh3HH4AYUf
	 Poy0FfNe7AkIPfBzFp4RQO8INFcqWYfoUyBBfNRRYhhKzp5SaYlGv1L7lMr95hwp6P
	 YEM0NkgxiRLkXY/sEYw3N67Wx0bL2nRU8XCcrya2eoDLCu8UySwH2hTP+WykMi7kMr
	 b8PRUUCUel9FaiRAgA/fnCYJUAo6gkNEay2Qj9oFjfeUqjL5zrVjXHCztTDf14uldn
	 RcM/tiRUZo3ax69565YnlJq6UlDtDNIYhw7ROhC/XD8CoZaX3c16I1ySSi603ttwHs
	 cq6JC+MP3d2tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444E139EA761;
	Mon, 26 Oct 2026 04:07:22 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <at5ipgQnz46TtVMC@p100>
References: <at5ipgQnz46TtVMC@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at5ipgQnz46TtVMC@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc1
X-PR-Tracked-Commit-Id: 6219ffcc60a5b4a896b95e717c4affd6dead1bde
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b4b543fa18757297ac756a6fe6e64f506b7844a
Message-Id: <179298764092.2452649.9518638602450330290.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 04:07:20 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 21:12:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b4b543fa18757297ac756a6fe6e64f506b7844a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
