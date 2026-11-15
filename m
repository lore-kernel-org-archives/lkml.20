Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767797;
	b=47lOYtpy7IcBoFElFzbqvErc6nY69Jh6QkxgtVEBSZlgqCBzyph1VBiBuDE8jP3v63yW
	 cfIivUyYxN5mSsHG9IbqvqGdt2y0s0EUKsl4hkI0RE1/9xE6p0Knd/Upn0zaq6VsR/8Ue
	 W+7raEUW4jN94VbZv4gj6EaApwFQU4z2BKNiEOUhV94RqaOyVLcLziGGvQddd8yCnSK3n
	 4a4j9HNwwwa13cP87Y8dYk7jick7TErwiqHcD/UtHLBEe4wYxmEefUaGT9HqwG5RwWTR1
	 E5X3q8/HwSP5z6GJBd0ASZC8Me+oeEaKpFq6i6rRQM+z0jVKxIczUkOO/yKfamKFD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767797;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=zDPZpEXK+Q/N7ErF9qR4Fa236+Gyo1nF4+y5mlwvICA=;
	b=bVJumdFw4FqsT9Xk8ySZURbkFneWLsHeq5B6JabaHhzyWsVOuUJMAyaqF8I9i1o5y8Az
	 z2MctBOeEXIEc+nBYqZaviimCfCYheyPXqARAw7cNnkKKhkBAghyM47UDnWpb8dezx4IL
	 yzR5bEVSDDKDH+7WOL72uI+wAuyiyagoH92hAhiKfRLXg3oAKHhsog5XxFpwY5YrCpn97
	 ZnL343Uq0AH8voC0vHDOpG2teC69epkPIUtAcQQZz7Bstwy0g/LElByvEh3G3Eaxib5HI
	 igevjRvKoYoMnhm7l5nMnL+M4G4zWPy6Epyu1/Vjnssop3PyL3hTWIF3/2XWpd5slOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h0CwWh5A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A7606A337
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h0CwWh5A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FA31F000C7;
	Sun, 15 Nov 2026 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767797;
	bh=zDPZpEXK+Q/N7ErF9qR4Fa236+Gyo1nF4+y5mlwvICA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h0CwWh5AYvQaNt1gDQehazMHoDslGbLsFWOjI/5QAUSNq4u7xTQAhIkDNv0mU6k9f
	 VKNaDHHcQ69Verrast9tKnFxHuf+Dc6q1dzTFWZUspumKN8R2EEFCeoKuPlApi2E2O
	 GD7aplSk5T0QAsvAOejGy1bkXLAd70wk0s1WkxJwDUQXBEw4Z1kWxvA6P2vzxW8o0c
	 eVlrlY9PbtCTLkGvgShLRBkNiXCmrpuw1n31EEEOdsSFDd5KjDFvc74y7LkJclGC9e
	 0UbxeBU9oFD9F6QsX7MZPVCxfruERJU1flxufzPYthRZxJ7d3UuEaR3KQHjYdrahql
	 kbtiOn2ByNkYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14DB3808232;
	Sun, 15 Nov 2026 18:36:36 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avmhJk_EjYcCvAZF@gmail.com>
References: <avmhJk_EjYcCvAZF@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avmhJk_EjYcCvAZF@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-15
X-PR-Tracked-Commit-Id: 59f1398140869432c7171b9a2a279ca315467c4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca6709295ae5420d1a391f32e6a7f23b7fda14b3
Message-Id: <179476779547.2691368.6367089384008461822.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:36:35 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 13:10:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca6709295ae5420d1a391f32e6a7f23b7fda14b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
