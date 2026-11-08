Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167186;
	b=rySxW8VYVMd8/2lV6qqSZ9BWse2bxO9rSKyJXLqJ0ZNi167QzgAuWZInVDQc51lHXhj5
	 ZT+q/ul2ZyH4Ri9okecU7W9e1zmwNA2D6UfQ0tXSBCJVm+vj+BWI0XVq9M4jUvUifls6u
	 31+Ojls2TY2mvFT1nu+2oS5DsjuWLs21kUQa1kEM5H1kLCUajCXqDTdXcnZZTze391rPb
	 I9uU9Of+KLENEjwCHf5C51q1YHfM48sHQAABjFLrunDKVN1bJWh7h+3i7s6g8KQlkrZX2
	 UMFstC0i0aTkgH1YIhrZpk4UZYz0m+BxpyUKqHK21uDTwSvS2wQUAe2piv3UNGHukkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167186;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=JL9QFT/DyaG254VuoGkZghnczSZps+NhoTb4adINF0g=;
	b=jeHMNMBp5Qi/w7gwDaBOB9nZa7F8+KJLJg9wmNK8VKOKmIuUB+9XJEBletLMHm5/nVLF
	 1pmpV2PpDAm4ynsFOIqaQa0QAaxCkB6VPppO/MHoRdPYOd40T9OJbFLcwm0Aag5pzoAkt
	 QqqocAB1GkZD77fMYvn6S17irmrJSPRSwTa8wr5IqycAMRj3lhBXDvvCBPA1f6kITglkN
	 vXFjPVIfH9ZBtuZEeoI5rtyp+KuJxJRBY2PgiNaeM0bgDb8DNMEyD780Iba8PkvyjT/zw
	 rDHyn+P3+PbJx6ahqMrhLvNhx1pw5uZy1nKoZsnquL3wtc8BmUxfIsUOyXQhrkJT1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oG/1kWKx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E3606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG/1kWKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C81F008A3;
	Sun,  8 Nov 2026 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167185;
	bh=JL9QFT/DyaG254VuoGkZghnczSZps+NhoTb4adINF0g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=oG/1kWKxmpUAMyZe957627jaRgYXuXkeHvimccxOJScajmxcC4LaNVMmQlK+UTxMI
	 SQdPC9thvWFwBXWIm4iBN6R0SUSo/C2VFbJqNej6lapAVSLirnM4EMkELgL+TVp3ev
	 x1MII8lFPfjh7QCOWv9dE90tIgJxZYFROJ3aqlRGvjQM1AOEQJsoFPlq5D0lkanV6Y
	 Ehphqk2CPsp8/Ch9kVf1tq86yn9G1J02nyQqyhjrVCrbwdx3qh/9Iasqsyawdb2b2f
	 klOQ7QgqRVVZLS3a15icot3zlypvNlnHsdsC4BN0lG1QgNccNU4hMUAnJuTu2v91nt
	 g6rUCBnDNU9Yg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B122380821F;
	Sun,  8 Nov 2026 19:46:25 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avBAPReJ7qMWur2g@gmail.com>
References: <avBAPReJ7qMWur2g@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avBAPReJ7qMWur2g@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-08
X-PR-Tracked-Commit-Id: 5cdc3746fa163fb4e8d05fa3cabf46bc6aa7df75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11b6438b9e9f30e2eead2f232a58ef3f71a206be
Message-Id: <179416718413.1685596.14102314145411531681.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:24 +0000
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

The pull request you sent on Sun, 8 Nov 2026 10:26:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11b6438b9e9f30e2eead2f232a58ef3f71a206be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
