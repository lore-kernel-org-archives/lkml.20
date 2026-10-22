Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693862;
	b=NWoq+n0Qww9Kx86doAwj+JtloZEt5izpWzs+zYO5AYLVG5SKsp3jnF2ZAhMRBhWXF7Xx
	 wUMo/btL0nDHV0nfl2/rukTK9XRg/Rnjbwl8+JlEVNmssGHwrKq/K5Ylm2s1LqyZOZFdt
	 xzCdW/hlzyru5f4qtMtAPzbgBHYB1cy6bUgj9wQo0NfUNygdqK5+uiw0jkk1kHLGs4wjS
	 jd7r0oeSelT45I0YoPo708HUGb113iDn+JhhIeiM6ddg6wXUFRKD9YuEfmx1BbTU0LB/c
	 cXx/4DXxeA2CoGUM4UbfGpl2hrDhVb5HX5ZnfD8GHwjMmTTIl9fiSamKUu97hsdM7bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693862;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=4MVFPG77efEuUosYVbWjoLZ15gxtGuDgaawKIFeyJUs=;
	b=Npj5cOVKQRyNqfXRU/APK6+4AugdjEE64BN174tMCf+yHp9RlPJ2i8OeKxjtWC2pVMsl
	 uSFfYOu5poTCgmkR1wMMr/K1az7ybLuWVpYhXvcLrD2uweokIrqF0ZaOnCERsWwY3fP5j
	 qFZf9QGgfuafTwCfA3bUtRVHH8bcLRocvxOTSgRLk1nD4n9xjfK38tCRco9w53B2z2M+a
	 anW4zGu3/2ivnA7nnHUwyqhLQHF35Gmzfc2FSiapImhDfQ28e1Gg/8VxrymxzKtNV8NEL
	 +Hb+lgX4Bz93B/DXlDKPqXTOXGsNdUSZyfCQpt1Z/o26EdGBeYTSB/lg8YZxZbld+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdLYAn4c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC69606A32E;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdLYAn4c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990121F031E2;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693861;
	bh=4MVFPG77efEuUosYVbWjoLZ15gxtGuDgaawKIFeyJUs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fdLYAn4cONUgTs6pjw69eIQKGsfydeEJRTo/QBCCqp7FOK3UQipj6C9iPWaxYmt4I
	 Gl/dcww5O3yeOEZwJufEG7svsGFycHqdLaaam665vUYwhBRx4fSzmtQEu8Q6Efdc2u
	 8CL0LGN+eHaVQmqRS3VJn9J6Twq+t0NXOzLxBuRxyxMJCem4gO+ua34iPvVUyCU2ty
	 Gvir2bQFOVrPlDkxEiuPUL+XfjORY/+nKkn79F5nIYwpj736zUgg1LCK+mYxYFzhQD
	 1O7pV35K20PfzGQh8zDHggZLULi/5N1l0mo0OffNGbxL3MQOJx+boaRKsKWZ3TPe0n
	 dbu1W60rKruFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 814A53808222;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.4
X-PR-Tracked-Commit-Id: 0045cd6b8ab2319e9d8de46e5e329cdc35ce6d05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e51c645fee243dbcb5cee3eb063b5713317444c
Message-Id: <179269386032.87271.2135463394048502814.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:00 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:51:33 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e51c645fee243dbcb5cee3eb063b5713317444c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
