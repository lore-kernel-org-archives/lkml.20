Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A940DB40
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856884; cv=none; b=jnBvKZncqc3z3Co2lMZlucI4UNtdFlrHbqBXY4Q+UM8Mu61Z4ai5lj0pi8dUWLURp8Rm1q8Jf3hpIj7rbf/79luVt3A1g1haw1BoiLKf3JLpuACC7YaKXghQkOUoY4I6/DUC8iFy5MijtrFj66Qk/ThxeTyWRCKfWcUhVphMF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856884; c=relaxed/simple;
	bh=n8Gm93V+fCadqSejY384v822zjcIhJm/b2aUrz+afjE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RYLe/q2mEBXPUsgngIWM+4VykFXxCDNxEuIQ+hTh3HJ+HKimSwPMXOMU1JCOiroHA3ONELC+piaYsphxP1xBUJMYOM5esVd1J4isZjEZY2JyaPqW8F1LvN+NmgFAbWr9LnToho3P1zy1XRzBuAcq+qDR/hT05kGtWQVGPUA224E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXQtTGCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXQtTGCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631381F000E9;
	Thu, 27 Aug 2026 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787856869;
	bh=+u7Qy4/nAjBa/q4rWL5hnGQ8jMIUfS+9AzPtVSE37t0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JXQtTGCyMqVyC636Apxwikt2V6VV+B5DuGvLlKrxwJlGYs6J7xbeaaCxA1k7JgN+n
	 4fCMIZdiNKuDHXE5tTkZOQcUBevZT/AGqVTItojUP8cXHH7kJfvNB/iROwhUCKkbvZ
	 Xp9k/oL/HcaiOKcd6MOlaDe///jPV/CcGgTUFjH+jERApRDH2aSQeiz/70/MfyNI6u
	 CYvsY2W6k+aLxtvQ4Ibtgq2q5CNCoapg7VKe1mzQ/U5t7e7SwLIXQH0YccV9L8meyX
	 FivyNC6sEVCTXY099Lhs+Re5DUs159CP50B3AxaKH3L/Lxp6hmxzmZMIphy9/EmaYw
	 mJEifkeync3Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A373809A8D;
	Thu, 27 Aug 2026 18:53:36 +0000 (UTC)
Subject: Re: [GIT PULL] MFD for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260827124425.GE770273@google.com>
References: <20260827124425.GE770273@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260827124425.GE770273@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-7.3
X-PR-Tracked-Commit-Id: 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79b4f3baae2fa65060c30f827e3c0e8f1db99f98
Message-Id: <178785681473.1798634.7062053418107268422.pr-tracker-bot@kernel.org>
Date: Thu, 27 Aug 2026 18:53:34 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Aug 2026 13:44:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79b4f3baae2fa65060c30f827e3c0e8f1db99f98

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
