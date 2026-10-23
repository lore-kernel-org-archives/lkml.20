Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794369;
	b=JsP0N51Iou0PsaFiWpBWSFn1PGJ3jshtOmrCd4jlwjCd/c6VzMlUmF1ulupJpV45BI9S
	 M7qi/kqB789HqzOgzWAJiq5rTZWTs7Rj3LyCNn6Ab1CA5oa754VNfL+mPpi7YiBaXgOuV
	 KhnLW2AcDs95ALsKlDLEuCJqSkEMSvpENO4yfev6xYjicuorMYRac7btAcYFFiMZXrZEB
	 cYozPKyhqLrym63MTsJlEX/upT0eu0bp72q6ZMed8UpB8Up+gHWm2DSmefRWMlWKRoX4X
	 j38nmDlq0sgjUoD10UVkWMRh+t10qEcs45KWm9SwvI3YzlEapoAIz8CPaOKbbNAImtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794369;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Wz8KnqbFvL6+YRUSIOE/3Wcduy/jX2GGiGv4ZjxYKY0=;
	b=jM64cLbPHTEG6GbT5JRH9PTr8BWwaBe3vzdvXYXrwsTLBiYSwi/V7gRTDQU0yoMaDPGn
	 Glt2IlT/bWPNehCs9GGnfvr5LUqXNYgEllN+TOQWsCZq/U836wlP/2C9zr4XaIr6F9yb+
	 i0htx3IonKcxQYlVEcg+2Zc3MWm8zSCEKTB4D1KhXgPkPhuY4n1sUycIDK7YMP6TmSiFw
	 2fXXZ0SfvAxlaIYBuOfQalZu0Df7ZFA8LgA00AJYbZMiDNx4an9l3Ys8Z8YXuGvqxlHZ3
	 h7gZjTfLqsih8JFNX9QGF1q0TS7n7dDOsqkCF88vDRYEmNwaxhVHKjudPxSNPamQrvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="beC2wA7/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E571606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beC2wA7/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1AE1F031E0;
	Fri, 23 Oct 2026 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794368;
	bh=Wz8KnqbFvL6+YRUSIOE/3Wcduy/jX2GGiGv4ZjxYKY0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=beC2wA7/Vf5fziAgK15dkJCp/XjR5CecSxq/TQQmOEoI/9RlkZSVrR0mY4v2aqd78
	 +v13tU+8edIlapVW+lcdMUpLpN0DLW2obstOq8BvPtuL90LAt457GnopCvXrkhDsOC
	 MH3fzRo6cq+PAPnS9V6ZXXmQf/CEZeqDkMUQX5qs5XNkTwrFmlXsWrW0b97YsX5MRV
	 Xc3G/sMyxBVwF+OqbF3uJOyepQZk0DSNqmReHOezgTMHcNioE6KbZaYvhDQ4TrH1sl
	 O3YwON9enMumYfQe9flMpylxAHXEpybF4bIzSTrmYqQpC4f4j1f9e4S9sgnvq1CiWG
	 wKjMd0DgXukZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444E8391B158;
	Fri, 23 Oct 2026 22:26:08 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1792628079992901620-26cbf02f9abd66d6@undined.local>
References: <undine-1792628079992901620-26cbf02f9abd66d6@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1792628079992901620-26cbf02f9abd66d6@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-v7.4
X-PR-Tracked-Commit-Id: d4d028a7ae6401ce70825a3eb663f0a2dfc49db6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f942403bbad36a120432be69445154891b65398
Message-Id: <179279436685.1300063.2936324288642442062.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:06 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Bradley Morgan <include@grrlz.net>, Kees Cook <kees+treewide@kernel.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 09:14:39 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f942403bbad36a120432be69445154891b65398

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
