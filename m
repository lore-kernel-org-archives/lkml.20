Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302B2110E;
	Sun, 11 Oct 2026 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677035; cv=none; b=DqnQ9uXTKDj9mfxjwlFLIcfi1pRj+EZIFxHKFF4/Lo8BC2TGiljNf1YA9xocEC3BDlGGVIC0X3zmkwv1+EMWqWQry4QDgYY5biAy5DK6P0dj3Yzq0dBkNzB8bqmYqHvi3Bhnf0/L1eB3I3hz0foQYyhwDh57L3DGiXzCuMyXyYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677035; c=relaxed/simple;
	bh=Vs5QintMIJsNvxNRo82xHkxcwHspP9XYwNyH+iwUpE8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=smLoCkKG5Nhwt4ThSQ12Bt+m7YX3yx172vgTXtjEehEaRYwGg6/LFK7M9FEhIq5J53fxGoJ/1I3QgprJg8AFc/MZWdwr41n5/c1Mb1EImg9oS8gr1I+GRfmPdWJxcV5/VYRkgva28mXL04BX2+CYSsWuB47lea0wmDJitxITTcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNUa+o2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNUa+o2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6E91F000FF;
	Sun, 11 Oct 2026 00:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791677033;
	bh=GWyKNJmnGdwIyKs2iE93He1dVU/UOvK+shtKrbpI4Zg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GNUa+o2NCKbfSzaRGaIPycYw3IiB8OmdTjuZMOPQQBjhOJEiN/fAaWkV80SBZhxiH
	 /02ZikudB8KbtfDZTDpNTFOxQG81DRalbgXEQZyLn0ZoODb+uunSmgXsWWHR0itX7d
	 EDJvL6QQaQ8+/+jvDoF5UKL5WI2RGjyaDenw7lcurdXQHMOVmkegj9mZLzONaFPWWJ
	 VAxJplWnlzHEJtfLzlAPkEhqoGnlfg9GHNrTPE8m/hZRtzH3rNLDcTK0+tcZu22Wd+
	 gdgbJGP/bFbjD9XB62YuJwB8AIjzM5aYYJTCgTwXqmZ9+BFowGR31KyGHu82V9ZPDL
	 kzep9lueQ0moQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B422C381195E;
	Sun, 11 Oct 2026 00:03:53 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC urgent for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261010223954.GAasq-unx3IIBs4zTh@fat_crate.local>
References: <20261010223954.GAasq-unx3IIBs4zTh@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261010223954.GAasq-unx3IIBs4zTh@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc7
X-PR-Tracked-Commit-Id: 7484bc43ba6b8e189b482db5b75e7842890a82b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
Message-Id: <179167703238.1871243.486835002708363094.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 00:03:52 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 Oct 2026 15:39:54 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5ebb76233b79db01e82e061173cb73c6d2b5c6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
