Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C124537D10E;
	Sun, 13 Sep 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321121; cv=none; b=oVqA/vebqXg0wn3uMotnqQ/tSTFSUy/ipuVRyCsJbQX7x/Tnzgsh/BJH04eQzEILEVJIvlVvqqdMfMfAXYtnt0/UYL6H7FU+e3OMaqLsa/jR4r2+5FDc3mRPrRgcGG9nGbwjX+6RduZOtldWPFofbYD+qXSFdNkxxHHd71TX6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321121; c=relaxed/simple;
	bh=nInK3+Hg1UXtvtUI/2JlfNgDEvXLvtAjJGpkQVEjqoY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jfrMRWzKkU5Gq5DEKSWCFMxZVr5ZcqlSh0xhPCn/Q1H5tI6Esm4JyYlL1QIb61S5rNR9SDbiHhQN1r51QHiTsBhvEacXQ2OXHjJWef2TuYTVP6ZRwJPNtXNDBuDBtDK+tCEuTAm9kv6KQHxQuZW/1/Weo7hNHIeKrQWMPsu80iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss7YGwbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss7YGwbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F351F000FF;
	Sun, 13 Sep 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321120;
	bh=r/rv6HFtErE946mAaiIBZN+nxhdLMiCAa0+p2hM3pMU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ss7YGwbDs2fZlIIKg3AFvMLk1t3RibbG0FoHjHC4gm2CvmPo79RzpfcyyMbSETE4n
	 BZnYhL4K8P9iZm32vkkdvacAk8VloexCuq5Smc3j9iqHqzBHRQFfiblzkd9OYpJSiv
	 PJmksEE/+aZHAxcV1R9umLwX7WGO2X2o5i0dg/J9J/mBjuI7uESqSPke0JYmNJYHa3
	 3JdGn7f9a79pm16rX7fV5N6otv3EH1p5IzQuPnJVARfr19qI8QFSIdyNFpInMjbgl5
	 OJA6kh243w5Kq6efR2VNsT8CmiNmKum2NU2p2CPW1ZKySNz+iNv+r8U7b9xqCSjwUY
	 YaHESEYN/RyUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B82380A957;
	Sun, 13 Sep 2026 17:37:37 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC/urgent for v7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260913002317.GAaqXs9SdEYi-p0K2g@fat_crate.local>
References: <20260913002317.GAaqXs9SdEYi-p0K2g@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260913002317.GAaqXs9SdEYi-p0K2g@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc3
X-PR-Tracked-Commit-Id: 9868f5c077dfe0b606331f2e782484f91a5789a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff4b61e3b7b338a92cbea555013937e69c25fa52
Message-Id: <178932105610.3902938.10179328546581033554.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:36 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Sep 2026 17:23:17 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff4b61e3b7b338a92cbea555013937e69c25fa52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
