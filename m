Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34337FF75;
	Sun,  6 Sep 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718349; cv=none; b=nJRH6TUbR+R4rJPSlXqnaE64XqzEtiWC+sY0GjrT0g75kq6u1TXrsypdwZJVsdBHVWe2Ksel5vHMf+QPFPUnSASheB3wRqqnERqI21PJDCVvS8Mnai2/jydNF+l4lFsIN77miLSE6suSIx2TmIiP82Q4dKI548fouSvKk9A7/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718349; c=relaxed/simple;
	bh=Ior/yePXgg1vrQImh+GF4ZXzJd6fzZDvkiCFcXODwek=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j6b9g72qxQ3hUmNBUB0JSVEMOCCyLdfv6gIRX3X/g/v4LsPVsbxHjhtDH8X128osT7jAl37GRH+fH/apC/KNKxSJWI9MY9Ri7bNHTHzYOSMaBDIsXVxe9SP0INzkSGsVvzgInxdVjSZ4S2PVkPEZ1aVMAFqZ5JHOpCFyBUZ7Z/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRLWZV3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRLWZV3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720FC1F00A3A;
	Sun,  6 Sep 2026 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718347;
	bh=zIb5fOLpK5q6RfmMAd2JrkcxmU6dWasl1+N27wrvRHo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HRLWZV3HJ9J3/YtHFmMArenqI5gjvJWt0csL2AXsvwPSOBsMnTZNFciyOc9fU2Cx9
	 HYoknOhABQIyVDvDYtIyI0rBuF+DGLZPlOFn5gbjsD+hjHatoIL/Z2g8fFcxeZwEYY
	 U0P15bSPe90lkSz3vxRtJiIGa5NrcrGi8B4r08IPYGHgs9TghOaCLvfeRu3i1vgCiW
	 1m+YnuEZ2MgSs43PjgYFdM72605JIJil8eWmxKZJ1Kn9fVk34smoe4TDqKmuH9k294
	 A8W4KueGzq/kxvFrqlBuBWUnfmidja0za1EXAOuB/oSB9uhTaCsebF0bszDD/BMOzP
	 OQlaFYJb1Yvuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5687D3926249;
	Sun,  6 Sep 2026 18:11:28 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap00LoKqBVR5QmvM@kroah.com>
References: <ap00LoKqBVR5QmvM@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap00LoKqBVR5QmvM@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc2
X-PR-Tracked-Commit-Id: cc7cd2a9228175c975f62ad56ed7c767701cb4fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf979ab8f24657ebc6193183cfef1669029e84a5
Message-Id: <178871828690.1639575.11170799758918823102.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:26 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 11:36:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf979ab8f24657ebc6193183cfef1669029e84a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
