Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544849;
	b=OZZCw8VIjuZJvNDa5iTVTEHw6GTLhgQ62NDUN+aIyINnZnG8znNqQzg9x/L10JW62lfy
	 lhWcczbMp4y0rDok3IbmsdnMCNmOUWoXb4dTDOMq2ifmK7at9ttfvy5x8+1nKqWQC9dcE
	 Tf68w3OYGPCYsacg+MWkzWCpiz55BNkrDJkvRCC6yERFNTYqUt+p79xj9FadTjLepdf7i
	 aze55egkaLyLO5yoWXg1g4w/A67HAU1i+RnSJvzk7lDPxFlEmU1FEUQuDkNkKpsX9URok
	 7Kn903HHPRVIFys+RCdQ+/rUTD73nvXQrOV5SyFwe+D+IwGRTNz9NXZYIT2nIcLq4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544849;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=g2hxKwfHis4/CRMgB8CK/NsdtY+EVAOPTn9znYfuwRM=;
	b=B+uqWd3kQTtRD6E7MhMnT6rZ3VAHYd10xBbBxlL2+TIjqY/GunxWAp4Y7EZyvfjuc1HK
	 2cJFMIFXkKFHiT+bgrOBg3R34Rfy1cxCahCGA8E4Z+m9La8dsYYxKfARGnwu3IEoR7rT2
	 9i7gmsWlI2BO30Ark4zgQCx29cshC5Mibg6kOa6r3uXbZXHvRI5GtAiLWfJhmPZf9uvbl
	 e7RrG+T8Q+6D4G/gXPc9XwYasUWaBIndxVFi4OGDPMb3B6o6IxacySMZhvvl1DaHvGbtV
	 c9iBxvoo8+0FvH4d2jKS3xeuldcnLau6clmaJ4kFDHpavZCLlJeB4AaXtAbtQl/2TUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6bXZq3p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D62606A324;
	Wed, 21 Oct 2026 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6bXZq3p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066371F000C9;
	Wed, 21 Oct 2026 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544849;
	bh=g2hxKwfHis4/CRMgB8CK/NsdtY+EVAOPTn9znYfuwRM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=l6bXZq3pvQvPk9U+wfBpEGUodUQxh7YcRzwbbOxUWr8jgENlvZlFn19vMlbm3lTZm
	 DHFt0DX0Nt1byovrm4ACDr85bEDlZJDuav4RcsP0BbpSp2TYmjHlOnbkZ/4n8mBF60
	 bG95gdkV/PkJJrQvVzvmOavLO6SrFtAWwvGlI2Ze+R/6Ev9X1lHS9U8gIA2XvbhY9f
	 EM1Lu+oUp+1TeSOrPaQ2f1H3XUhY6I1/cr/92+bp/9wSQV5TEwYaUmcdAc9VNirAAG
	 EuqqGxcMHSkCYSFWOAbsgash5NwGg1e1FTnjjhuys0Y/YPSJmOnQ1Y0LW4S5AzCJ+V
	 P95+Vt5eoHJPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F141F3809A0C;
	Wed, 21 Oct 2026 01:07:28 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atVqJsjSUkciF-hv@google.com>
References: <atVqJsjSUkciF-hv@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <atVqJsjSUkciF-hv@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.4
X-PR-Tracked-Commit-Id: f2e05ce9763feb1dd7da15afd2cc61df227ee85a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e947d96915af63e28896caae85a81b74855621b
Message-Id: <179254484753.303828.16581715673198627073.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 01:07:27 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 00:53:58 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e947d96915af63e28896caae85a81b74855621b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
