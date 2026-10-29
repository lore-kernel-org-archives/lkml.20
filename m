Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298508;
	b=tAtyB8pxbQvnwTnZMCAWv5yWIlDgwnt+fvNc4IYZyKlBo82XuoCIlI9Z+APFOTTZlnyf
	 jvdkz9GREr539013cLoG99viD4OrPxTKDIogkayP6BgRwOUSF4ja25DKqiQIAmuI3RXBj
	 r8GKt3UmUf5Bkw3hy/g8uWkBVIPmygk2WXoZU6Ec852c5ABPv5HayFQGkeM+mC04n4EN5
	 MMfPOcQo+oa18STuXRppdZJytHmpquF1DFZrqqZhruTu5/Z7oaVM6UhROLTZlAc3YfeXA
	 uqIgxWVFPUKNJf0A5897tVk6Je3BOBUbObZWzmhLIzWEDUGQuijLW4Fr4K7rEjs+aYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298508;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1hn1QP9OW6qTCLGVndYhzkQN/r6mO3yPrOfLyDwe+DI=;
	b=Qtb5WTv0fb22MLYButmiOfzVfn9aYtS6R77oj/9VEfi3BaJnxk+vaPPjMqQEhfe2cYEX
	 Y0jVKCs0ad2jx9TuwmVSEK7/pyT6CtYdfj7YfaNdoYUMN3dgDhYvIS+6OtC10dL4jzpvX
	 kzOZ6RbFrh2rafmHTuOkf0zVEo51qt5ykc81AELyKfnMyigq/Vbp1pDWJg3DTBg0rob2C
	 We0xfOMMaKfFwl64S1q88Eh03rwx2ebVR8NJ2G1CTDlzQCGstsftpw+1mSIR6fC03zqju
	 Meyel/8ebuveyRoyoIvbOoJJnU9E7eMRjxYv6iv1HVHB7vLyX8Su26aITWXn5tppiVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzFgu+Xt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7811606A32A;
	Thu, 29 Oct 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzFgu+Xt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857F01F01824;
	Thu, 29 Oct 2026 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793298508;
	bh=1hn1QP9OW6qTCLGVndYhzkQN/r6mO3yPrOfLyDwe+DI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CzFgu+XtV2osev09C4oUYm/4YnqpQ/iwvCDhKQLTEQyUhnZR4jmGqhUL/UYF+blVU
	 7j637tzOujzJsW3kjH4bHK0hmDqrCaop2HQMPdjR/saeByB7qoz8hqhWOscQFzioiQ
	 NNTTSNPOHQEZpuazXcfC8aAuIxtT7sfgzf3lZQw+rk2fjgSS2j25M2E3jfvnhrk6PJ
	 LcFjNwAWSq65yMjjryf6KmsGuE9/3zw4mKQRV97x9F5BH1sGAEShSwqlcuulZZ65KK
	 fCxbVBLsR4MAZvVUfv1xApNivGcT5eqUVa0WE5p71YdOXn84qKlqCe+i5JWaQYgQox
	 CLVygTx3O/Djg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D38D3808228;
	Thu, 29 Oct 2026 18:28:28 +0000 (UTC)
Subject: Re: [GIT PULL] More documentation for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o6cdq20s.fsf@trenco.lwn.net>
References: <87o6cdq20s.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o6cdq20s.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4-2
X-PR-Tracked-Commit-Id: 151235bf3d5d4de1a077a83c54ee651e074816ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb01c6914ed57a68b4f5d67f47208e24f9a45408
Message-Id: <179329850715.621556.4752293022286104035.pr-tracker-bot@kernel.org>
Date: Thu, 29 Oct 2026 18:28:27 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 09:26:59 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb01c6914ed57a68b4f5d67f47208e24f9a45408

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
