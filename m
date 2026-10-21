Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619027;
	b=oiaHkuYFUT+0xZngcVV4OCSWV9wzby+VIAXnC7hgbf+OL5DRyo72odmquriqKsKbkmQd
	 5U5XT0p358XvUkmw0JH9zSfR3+saNiWrVui2OWDzREU0WZpSzQjL4aeQz8s+KkTdao/8H
	 wV2vgxqtsM3advTCnMHvENflxd8vosTtf4eo386N8QmuyzMK247LvvcNq/NC3lZuhsbHT
	 X/uJ/3hbwZK2UjA6j/NENmw3RYMsF1S0bk7mNIasiKLnzCzoR1QizVyTc8MXO5vqcgj2L
	 YfopqfyOptNVdT+v8Rz4utSMymUTb/1A0GZ0mjCFNpevPX+Fwy+OO8JSbEO9rwACgGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619027;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=wD8f/ZaRsI9tjBjcXGRnrfrSDGIHo/ED4pzke/ELr4w=;
	b=nd3ehxcQllRHT2k6KAINnLWnj3umy3obS8jpEV+p3kwC0eeAeuM9MkSXHVQqlQDt2ctY
	 2GMBr7T8Y/Ai8cDmkgYnlbdwylJxhqo5SItrkJOCwzh3SSZyZWUIYVtKpYx2ay2qTG2SW
	 g2bBwgt5GbVa9I8bfJ6/x+kGjwiJ0Vu8hLAvsCXkwofkzKWIHhcFBDUMfbjmkSmpIhVcU
	 8Ib/Rlk3BMF2KCWWLerOtY2/kPWxVHdEppQel+zM8dMyxJkzv+XJtYkn1PjwVrezmdYqw
	 xSc882lI+EiXW4tYW9Huz5f07GlleXa5iB2LWhL0RD4TZD94bwKmJKiql3aX/MxL54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IQluRWM/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3935606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQluRWM/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815681F000C7;
	Wed, 21 Oct 2026 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619027;
	bh=wD8f/ZaRsI9tjBjcXGRnrfrSDGIHo/ED4pzke/ELr4w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IQluRWM/zyEbZid9QUpY6RXiO25awpo4USCZ5zCYYiRTmq94WePR8EXq7FSCRmtHP
	 URte5hwnQPfpcXs4juWV+2l+202rpMsa6aTZGttFFrKhqllsUSAPJCxpn1QHgYUujo
	 B4u/3q3q7myY8iCurmIrIU831SMBewYGHxP+cRpihaxE+/kXTG6uh004K1mQUuSiBt
	 4zhzs2N/OFrV4iyj/HT7J82Io4D3+dopeqSNWYMajo7SGIY3EJsLodMZRi0hfSORE/
	 /Yo81nvw0vKi6TakPJBxbbVl77b0T+S7+lic7urPZPvIVPvtPzL/9q8AJjAV8iOOn/
	 QCcYbs2ZRXIQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772E6380A962;
	Wed, 21 Oct 2026 21:43:47 +0000 (UTC)
Subject: Re: [GIT pull] timers/vdso for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <179257623037.804100.424498045146929293.tglx@fw13>
References: <179257622431.804100.15107946105101279363.tglx@fw13> <179257623037.804100.424498045146929293.tglx@fw13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <179257623037.804100.424498045146929293.tglx@fw13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-vdso-2026-10-20
X-PR-Tracked-Commit-Id: 8d17190fae2caab89cd5df19257ed9dac0739e3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ccc4d9f8912a5d9f519a34c3633fe53c8f9b429e
Message-Id: <179261902606.1324168.9020601386712996331.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:43:46 +0000
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 11:51:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-vdso-2026-10-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ccc4d9f8912a5d9f519a34c3633fe53c8f9b429e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
