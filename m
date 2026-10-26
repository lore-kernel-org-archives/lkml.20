Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987149;
	b=NAIUmaiK88Ja7P1H3odGFTxu2mNVzUrqfdlVxjec4MVb4tmrbj1dQE6outlRbnICTCjl
	 P5Y3Gsx9S2TQQbrQS0kEKRguOe+Q0gyslCu6WcIsOJGY9Ed099YVBym6MXMhZJGOdUWfV
	 O56fZAukl+fQrwNb+hRt1dzj+U0mF6tVV3sRulABf69mKi5OuYTtk+V3/lCxvinvqKnDL
	 NnyWapde3nzq7WoKO++GMLmJwmG5ErXmHBMPxUWqcpElaLnWFma8ro+J84TvK0qyOHFli
	 Jn7DrG5MZ34BBJI2DhOvVVQ3Pl4+Yc2f34kni4R80w3aD0jBFIxWw2rnw/5qYzkK1PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987149;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=vMJuWRHAZge96tVLPX5L3bpCS6X7Z0kTQZkM65ybiQU=;
	b=CSpCMpUWD8B+vvckphy4Sd9js+QtQuZWp7VokKuivxgmCLY8rPeIBeZ8PY2gPhriJCdq
	 maWqqxDbZnqhy+02Cdh7sxmZhZHANxa9qEugmSMdC1NRvBnVjGRq/KbVm6MbkPe3cnjoO
	 S6gkKzm7HumxNwxFg+P347tkFA38GuBmi5tLx+RWX5lh+7v3N+DP9/6EBhUxjCXQ2Yzq0
	 gFkEKxs43GZoxNFxHQnLgRnsKcJsbeTu2h4VJf4TAUodeepTdzrXgEZ2GSeVcw2g9640s
	 hcK938s1UuGVWR8MCjurpGEtABggxBAqAXo73cZ6cx4C5jznddth6NdTYhEG22sEVZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRFWv63+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6DD606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRFWv63+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D691F01825;
	Mon, 26 Oct 2026 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987148;
	bh=vMJuWRHAZge96tVLPX5L3bpCS6X7Z0kTQZkM65ybiQU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MRFWv63+CSIyJxnohYaXYcY4Y5Leh/F99iv93KWR3AcokZuOGDhNMoOUPsN8EAZYh
	 gGti1+EbfoMfv/hilVox4guaAmDnMa0EMCZJ5r7PNLbj13q3P1YVWfM+49Zc7Azqmh
	 Oop32aAmxtZSk23iZmcM4+yFv8v0HrXaWRtE+BiM1LvfKWxEgXwge90la5xwRtZ87A
	 qBRVhZ9EqR32agNVTtvNaTS2HbR/ybauFYi97Zmtw3LJm/v3qr3pg32MTVdGapfsuo
	 oKumpMZGJMGSw3hwIzQMB2kgxPOTDe1O8f+h2OjE/3ghInuDE2u0x1cJflxRvih1bX
	 fGIkcwDt9ZdBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE49B39EA761;
	Mon, 26 Oct 2026 03:59:08 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <at3j_7MnLGPhhHDJ@gmail.com>
References: <at3j_7MnLGPhhHDJ@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <at3j_7MnLGPhhHDJ@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-25
X-PR-Tracked-Commit-Id: d095321349222961813333277881b3c74f10b17b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dc7be96c1cac85cc172b90a47f80e23d847c9203
Message-Id: <179298714750.2448250.11813260752343424722.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 03:59:07 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 12:11:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dc7be96c1cac85cc172b90a47f80e23d847c9203

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
