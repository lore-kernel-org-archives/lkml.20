Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C831E844
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791583417; cv=none; b=bdyHmhLzUYB8V+gi/XZ7NnuP5f+FItNGWX3te3PHuA0rQUwnePys9jjIWLq5UgvhUf0rTX2xpkMkxjuGIqJGNzhcX4kiYMQKWLMd+cXtbzW9kLIfg18pz8ocfq965+G89Ln/FOdVHymzCrA+0Lf3pdaRQJUJDbeVCvQYvwDxKuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791583417; c=relaxed/simple;
	bh=DmMs77Qu6b1UdLi+mHPw8LdmDfcD2hLszGS0VwHVoHA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bvjULiGutNc5cSf4VE+kJV1TsRm40vaI+Fa77HDvXZeA3eMcwQLc81j/BeGjR+/+xwAQ04nlqNC0RgcsNh9X+hOS3lDqXKcl1IaHeml5IU5wUlpW9r2lJOL4VgBYVC0clKA0mheF1g55v3mPXR4WuHt/ftYmXkL21RDks66wHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCxs/7FQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCxs/7FQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445871F000FF;
	Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791583416;
	bh=A/9F/B5Ss3zaf0W3INpg/gGeL+VhwhM/ai/5mapCrH4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nCxs/7FQFsy+yY82EtxBv875G/btrLx0jYz3i9WTE5GXWjBLK+tOYf1irwIEVwdX/
	 8VbkfQSsiMps/JWr7IJ8vMHiNz5/dgbwVz/2/2qkab5emd/BeS+0x3BXZ6mzwm0/ad
	 U6OK0+l7oqblLbhBunt9z0SdQYaxxUtsjXU70DrQo/YX0fIsRHiyrBpNOuAMjtYsoW
	 Nr/pwxIFGAoeCtQ2m/6hOB9+FHDanAne6NxcChAULDkiR1ANpzKNxh59IgUZ4CtQ1y
	 dzlrJjFa0kd8FsBklGhNky8RmCEaTyiiqYLzTnIcATi9F6SYht4ZHcd1UkQkvhfipD
	 EZ9Yb67wUedfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A6973926392;
	Fri,  9 Oct 2026 22:03:36 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <asid3RY1C6mbTvh9@willie-the-truck>
References: <asid3RY1C6mbTvh9@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <asid3RY1C6mbTvh9@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: a9cd14bfb0c113f1cd77be4349784663bec71bb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9515f634dbed2bb8928fbb3b01102dd4e64f4aeb
Message-Id: <179158341481.1020838.3566467573333418134.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2026 22:03:34 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 9 Oct 2026 08:55:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9515f634dbed2bb8928fbb3b01102dd4e64f4aeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
