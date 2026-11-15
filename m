Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767803;
	b=Cytx1BtoHK/tWhNM3XxHZw6V6+ykrBbvQX7lIkVHjfZ1sEIZagU4p8RW7iyGILlGQ8Ao
	 DLMBOzpDdKEzW0N1vi6Y1sHUk5rtGEpYxWPZ3sXkSsMFfBRzySGEnmbNzl1/LjieE1vFi
	 Ug0LauMUkXcy8uMAgrQt3GtC8hDbEGYmD1sZKvf/OTmOEQX2v4pAoK0q4x83q9HmzuJer
	 FAjsAhs5qPfXu+talxvTdLu6xWSvJm7hAf8g1gJQfA8HIHnux0tTc/T1DMxLlD4i6M1My
	 CSOjudtSctBOKwAHbTnVs4FJULVc8KIvuWpQWX3zohTXs+h3BcLOSjDwd+h7ZUjgchQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767803;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ilGG0RMkFXLGKbF9FiUvL3zhDt0KfLv2usn2xMQDlf4=;
	b=sCtzKQc+7KG/IZsNiH2m6kuSkztj7IESic0VQOaV+nVsHA5MV2an3/31sw4ESEwEZFuq
	 TNmiEKraoTgDZ7oBMMdGLF2Rcu3LzDUSrZH12kjjcNzS+FqjFCdrX49qDSWSL9jVkf64p
	 x5b0CN+tdEliWt4TZOPmJR/IAq6uohMXeRMw1m39OzqHjGSSEOxiH8xG/vzHS05JT4TTn
	 9klASRxE0GZ47u6R3EEEHZ9dv9PXjM5TfuQcqlnZYBtUPnJjQ5qP+lxz1zKOfoyUnuQda
	 Jr1efZZruCbOjA/1ZCuy42kxxHXZzzm39A7dZUrwed2Jn6JXBYMoW7dU8X61mWnu43g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OslCaRU7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9BB606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OslCaRU7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A611F000CC;
	Sun, 15 Nov 2026 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767803;
	bh=ilGG0RMkFXLGKbF9FiUvL3zhDt0KfLv2usn2xMQDlf4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OslCaRU7nEmD3rj1JEbmvJERI9WspzJOCjDMHqL5FcPDhGnc70PSM4zTzD5G/Kcy9
	 p+6OTFtknS7miw4Lx/OYD6JBW+06NfBc7wMNasP0Pa95HuUbzg1Pi/+beJRN+gYqTy
	 g+ywto2do4iMKsuUGxMwqP4vfpejyD84dzEzP5dYtSJoCggEXktob8rieO2mNwhSF8
	 81Mcc6T7Jc8FCMKNZa3P5iL+dAyRLxikH8vDu2wVWeCFZl/NNzvuuTi+6XCLfcWkOj
	 ZfeidbSjoGYEXKwZE0ZBrVeuQuqMZnMlRaRvj3ZZGnUw1Y7bWhCKtc33ExOhBiQEs1
	 wZIgkFJblIxBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2063808232;
	Sun, 15 Nov 2026 18:36:43 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avmlusPLXMDbcBfq@gmail.com>
References: <avmlusPLXMDbcBfq@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avmlusPLXMDbcBfq@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-15
X-PR-Tracked-Commit-Id: 0dc2a4dac3d04e9e4479aeb0b46172feab1cca0a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
Message-Id: <179476780173.2691368.9408260399994677232.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:41 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 13:29:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa2933aac170dd19c6a7f0d7b81a8f537e40915c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
