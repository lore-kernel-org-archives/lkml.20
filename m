Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B83AFD0E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714992; cv=none; b=i/lPNdbqnMCx/RBiWjP5No0NVpopfBHedRxek4ZVKg3y505u3x3nk+MHpcxb0Bj7+UyJcLxvhPmR5P2A4sTYmYqTLYjkMSeNY8IDCdNlvTuBoqyoy4GIfD7va1lOzRboZ2XbmQhHXXpCu9NEys2Tmn0Lu3zUcmzefKHZR4FWZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714992; c=relaxed/simple;
	bh=xA10BMWc3zXmNV3fmXtoCJGZihM/x8a2jQFanuDiAlI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SXd7mWsc0zIHW7n/WAMB8sXo/43O5lNFbpuxkv8T0nFXTSurok3L/hRpK8PRLWWdVftyN+RpJNORBeHcJFUffJhlp8C/2h/TVGwI+jfaaeWbDmRmXNZOKyxfJTPnrVw3oN1p7hQeKky5kvL4kDcnIYpPwqB7bhUsOXb4S0K8F2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvgGtbCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvgGtbCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A8D1F000FF;
	Tue, 29 Sep 2026 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714991;
	bh=1iOSNWKYRhkt3pH/BWmpiyn0/pgZfn49qCHlZfv04Hs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CvgGtbCmlne+dr0BaABZeoAVTIf+jpJF9Oveg73lvL+1W/Or0yk9v2sudbdulNS63
	 qW7RpvV8T02Oa8cKM7ggOMUsp/kOAuEqZ63enYMnAH3ziVZoWB7+KPIdvpX1wBeICV
	 TgSK3GtKwiaWo939DClU+gr3pLTriQgRZCm6MdjxfoC3qNzSbG3I2gr07mRgt+OOpL
	 cMRDlHJ0laG5RT23SiMR5eux6cKaqLsQKcFjns9T/Gn1WaTIMLPs7B/mj/vqCRrC76
	 eWyaoE3EnjQY2VhHtIte9zlw1cd2DTV8y/e6ZXbtupnL3EEhgDl5D2otgjeIWU1VX/
	 ecx7IHClUjL6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F172139D237E;
	Tue, 29 Sep 2026 20:49:50 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
References: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.3
X-PR-Tracked-Commit-Id: f050c3e61d2a1aaece3170d459e4ce5fa2486c12
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b004c4b1c4180fc7f2326de4ac941d5edfe16076
Message-Id: <179071498945.1114410.5170593329342914503.pr-tracker-bot@kernel.org>
Date: Tue, 29 Sep 2026 20:49:49 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Bradley Morgan <brads@mainlining.org>, blaze <1466528493@qq.com>, Anthony Iliopoulos <ailiop@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 29 Sep 2026 10:58:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b004c4b1c4180fc7f2326de4ac941d5edfe16076

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
