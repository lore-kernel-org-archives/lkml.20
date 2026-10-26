Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042417;
	b=TVunz0w+ML20x+++HJiUhP6piGTB/G78kFPdAmQgbojpNWfs7Az17+2L6/69LDKv7uKI
	 2bWHx2H5qn76102apmQ6c2fCoSJStEEt3Oua9H8bGWpyMOWqDQg/SElBXRYvWMb4GCA8U
	 Jbg59WhUEH8w9wTiGVxiNpuJZtJKEQUimxtnqPA4AlDXsh9HxxZVYFDi8Snvl17remM+z
	 tVqEPiuajGqvtLOPtifvdAcKnAqdtAjF83ywwprEQhoQ1xcfchYYSm6MDmzwIfvLMQxuI
	 O+15SQYg324enpSOdQ4C1OZZWASfS4dQkE1llGmFpOX9KBKUcpkmONN1dqYAuoxhjMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042417;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=i8NFeHMzujoWbu/DKu4VYmffT5DasutGNNUYM7yo8qY=;
	b=l4eKi7dYrse0hQnLem1QfzfMD/mPYNwTve495yxANa0zvl0ikgK+lejPmftpJxRa9m9C
	 cZHidF9nJ3tZ8DqpB59Xei7I1QXVx0JVr56+cromS/mB5335hX5tCliLqnSJB1EMi6/KC
	 4hqfMuPOUim5kTeO4rVTc1BAY2uTHh/W753/Nu2O1y0C2ZY0WwYo4H3KhelGzVc1vfPC4
	 S7d+RB1mylFAjPl2znec39LKBoLIodPvotAt8l1J8k4SOwfODUOYFHK53y/7HGmfHYNbx
	 E4my4v9N++1cYDsvtcRR1s+5yDJZnTeBrJJtwbxsnqoiVNx21parvZ7Y6WhEURTOn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMgPWqcL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC409606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMgPWqcL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72431F031E1;
	Mon, 26 Oct 2026 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042416;
	bh=i8NFeHMzujoWbu/DKu4VYmffT5DasutGNNUYM7yo8qY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KMgPWqcLob352czansMl936RZWnwK31z7tEmWErDSiOnhOltcRwsA6kjXvg3Jyrk2
	 MRnb0BfTlSUNhpjL1KMOtWXF9tmwK1Gt4aUn3RIIGS04/MRGW5wSgtN8PnK6qcTHwu
	 j+TN1bVjhCfzR56DGKqTdkyolRGxIY0qgfK+JnYL6wH9Et+NjAzZO4v0t+gqERMaR4
	 ULZCye4+qPXisvabOxr7rQYrloLJAuAyEOvb3/HkdfTnwqXTwpqFTWdRCFvyKm3LXw
	 U0mQTRv+rWWw7j6fk9UNffyHvr226j71PvJaPskUdqEibqO+IeUbwgPFmEX3wbZz63
	 tpZh643LAAOTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE4263AA80D8;
	Mon, 26 Oct 2026 19:20:16 +0000 (UTC)
Subject: Re: [GIT PULL] Backlight for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261026152154.GE2195460@google.com>
References: <20261026152154.GE2195460@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261026152154.GE2195460@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-7.4
X-PR-Tracked-Commit-Id: eacfbe6f9716d00536edc229a58895405e73c2e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d135ab453a7400a34930bdda1ef4bdc8acfac80e
Message-Id: <179304241525.3342836.6163701011708895759.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 19:20:15 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Thompson <danielt@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 26 Oct 2026 15:21:54 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d135ab453a7400a34930bdda1ef4bdc8acfac80e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
