Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211037;
	b=BxbzdTL0zYKutHRUMWmxv/4CpnwdNUf2gWVSPKxCnfR9F0FIHYQtJcUaDos/M7xfZnWD
	 lk5gl6UDvpeIoQq8PBFJ6L5i/4EirPNWTJ6c78XZAMGSztYdjMQsnkxfNOUGWS0CXpi3T
	 iWVRcIMaG8Sw/LjIwLHPj5iYEDUHoFGdHxu6QWoiVW97hHXOtESnrvQ4mltgOg0MWJasu
	 BI5gUZrraWqaQit0qv3G1g2zxMX14HD/Be1O8a+rmOHg2piiAkIT1qB1LubF7beST/AtR
	 j/asXWAxpYz6hfJe9U3a3Jdul+s4PIiITcuyCmJCBGxvIR4CCkh0F70q6UDpWCqAvXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211037;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=so4c5Zqo0n5wHwIZX6DlbfK2cojFIxrOO7C50mF94SE=;
	b=r16O4u9k1RdQvYZfj25y3yTfMkNmmH7FQYdN2A6ZaL0d6OfEhWlYMCMDC4xHSOf6L9yh
	 M47oIfJailZok+Dj8CbU0M8cZDmoYBN+aMd+zZ8tLV0/iQ9xU78/46kRvGzjFtyTET6ze
	 yEH8plbaGSfKG/M199kK3V91olJxrGNXQZ9NIpJ4cV/CaLfU7wVIOt8aswvkC8BL7RQnd
	 REsegUhgGZbmCrK6vY0/VPjda5UOpLoUrSnLYYHIyLu1Kfa2V8HUSFuNrr+RcphZfG4e6
	 GnZ/WeEsv2SdXNyNUu7zW1wnu8ahOVEfQDIg+KumcUp7M5jZTS0bf18G/kLCMXKw3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKG3QB+J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63510606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKG3QB+J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF631F01828;
	Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793211037;
	bh=so4c5Zqo0n5wHwIZX6DlbfK2cojFIxrOO7C50mF94SE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NKG3QB+JuCyBa2QRBm4jS2r4SmY2EIm4hQvf37PGXLBVyhqfHRobrmw9kDvBjQ06O
	 zICBYHJrAXZMOcipy/eFhkARtoYFZZ9Bj6C27fVt3YVpukRkwXk2LYMbT/dx9YZYYp
	 yThZNN90m7/ymY2jc9vkKianOp1uwHynf/dYBFDYSofhxAlKZudgOUsyAJehblNeLd
	 pVz+YlvRsmQ5+TC346CfaRCxDoGF4MPlj+/6KFExdIhkdJ0RqeoCCtI3obq5N3kieU
	 onvKmMzVitKj76HCORiJjmh2yG0xAdT00l25gvbxxEadoO3IantTHfFPpvw0Q2iQkF
	 VkBx8c6SMok3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4455A3AA9F6C;
	Wed, 28 Oct 2026 18:10:37 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261028101259ce32989d@mail.local>
References: <20261028101259ce32989d@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261028101259ce32989d@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4
X-PR-Tracked-Commit-Id: fc5eb1b0631aa3b34c530ae962d01699ed22a0ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ad1536d831a104b4134924d418b072b3f175e81
Message-Id: <179321103602.1342141.16862667773691083133.pr-tracker-bot@kernel.org>
Date: Wed, 28 Oct 2026 18:10:36 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 28 Oct 2026 11:12:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ad1536d831a104b4134924d418b072b3f175e81

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
