Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543372;
	b=JtkHUhkmYYDli6pUtcYKRwUdFAa7htnX16HJ0qaTN9J7C0wO9d949LYh3R9EYwIRM0bA
	 8PUDEZymmhpig11B/ehaYP240KWaTzciDGEXzziBSWOMwXYdFszJBZbCrJmrtBqNX+0Yi
	 MAxAiYFbpvl5GLjlDmoctlnyAIBH4q8EBG/yh/aZau4pZdpel3GQmCb2tB/oIK33R2D2D
	 w21yZ1kMhoLO4BZ4UVZzng9iKXozYmPikMQjBny/h0we1GUS7SIV5J6jGj4EI6i+KE02O
	 S4DWxpiKy2+AUMuoP0VeKGM2ouB9ep7cF1fJPvBMFqpFiVKAcxhtjJ+i4H5zR0A+AVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543372;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=CtxMmSQtovKPxHIXs8GS2iJ/AJkeFnhlUBrv2lKwXrQ=;
	b=c0h8yBOu5wt7niWulY1qk3nnOfhqV4QOZ6D9X3JUw7ovys6JjUjbxlMcjDpWpT+i4l8+
	 txSoDgii5bmmoNW0P3XrHtWHJwcV1iRv81dYlH+bq681HGOTYG0R9Z+WrtnC0Pk/vY1/1
	 zZ+wlYg4XunnMuWLkN46IN0bcZpyGVHo5UfilL92V6uJ87hbCYd6eUPenQCQisnqtKwrh
	 P272N5nG5AJo5QeYKdE3yWJq9nuQIOlSCNwdzqkUGsY3c/TicEZs5gCxa4iMBqMm4tSVR
	 JIoCgDjEHJ1mw4kUkGVjaM+x6+0h/2QtrW4qYyjeeGlBCpJLAvgPOU/t1nMrUr5zzlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+wqa9EX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0853606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+wqa9EX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF941F000C9;
	Wed, 21 Oct 2026 00:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543371;
	bh=CtxMmSQtovKPxHIXs8GS2iJ/AJkeFnhlUBrv2lKwXrQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=c+wqa9EXW4j2DXoee58dzYNCwFlihJrd1PWwnrVUJoEqBIwSN5hPXxpD4BDxQFlm5
	 6A1QY/Dnts6EQV6iF4iO/ga+RT5PVDF5gnwlzy9F9aMigc4ld8BScmrFi+ivDqolhv
	 WxGGjkdjGhdCtooqjDQuTu3M+NmhnTBX6D8pCkOGLaovLsoF7UJXETm3ruhNpSlkuN
	 t3yxXQwmLUWxJgIYbt3Xfyyua9cDCzJfxMWl+eodKhI1WNdqvfw4lsaoLgIoB5HQd2
	 R/OgWVxc5yTiAQoY6kX7sfWQxoO+2UO2ICZHF8Q1sjVONMI8hVM+W3zZzvL7g8PFS3
	 UrcwEPKKKAWAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B454C3809A0C;
	Wed, 21 Oct 2026 00:42:51 +0000 (UTC)
Subject: Re: [GIT PULL] nolibc changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <b98d1155-85de-4ad5-adb3-ef77fb3f6879@t-8ch.de>
References: <b98d1155-85de-4ad5-adb3-ef77fb3f6879@t-8ch.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <b98d1155-85de-4ad5-adb3-ef77fb3f6879@t-8ch.de>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20261018-for-7.4-1
X-PR-Tracked-Commit-Id: 700ce4da6f6f172435349b687d2d916e791c6330
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 542fed2ef2ff7e580cc25efb174f5e1237e3b0eb
Message-Id: <179254337038.294156.15976508769968423937.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:42:50 +0000
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 18 Oct 2026 11:08:36 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20261018-for-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/542fed2ef2ff7e580cc25efb174f5e1237e3b0eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
