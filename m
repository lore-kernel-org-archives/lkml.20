Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0632DB794
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960730; cv=none; b=bxz1s1leIeMleqOEePkw+fTMTbVHJplE1+chM/jrMb+94yQUIsCMbri1qkPMgJvJ87ML7ewPCVM18Czz03gfi1GM8Lwm6sl6z6abtQ9TX62lglSON/FK69LZqHxNULm95EqgBKMn4mb1hqYqJHTnjPa0herLTpGR4JNJiIsU0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960730; c=relaxed/simple;
	bh=XW4N05OEVK3kTSrKu2YvtYCY/0Yl1GeZpZgC4ntdtxs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rJZQXhBaB4SKrA1w0Gsqnsiy6qB9HI/a/dYr2PLsDaA1x1r9jUdRtfXc4RzOXDW/myWZ7AU+DWgz+rtyuvARfPLxdxB6iFqydxQj6hxpLks/JRNviVAWL+QLA8vwRqqJiJUGMiTLfPzRMPEdiNlaLnQG3z4mTN+vxjGviwMIWvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgJ5Zqcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgJ5Zqcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CA11F00893;
	Fri,  2 Oct 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790960722;
	bh=pqp5TWOX8MT9w5xBrMcnVg4bZDGn0Q9Rzt8Q+Ejl2UI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NgJ5ZqcnRyQ6C6Y0m3K8RaqH5iZ1tj2KZqLTBXcc+bTeg2Jwj9RWSYAd+Vo6rXCSA
	 mhCuSyzikuldGUKBt+M5/DAPbQpCbls3Sxjw1KGMc7KbV+KH+LU5pBBA6V+w+sFO+f
	 Pr3ANc2VoG/tsjgzaUxNqWO/TzyKljvxZfe1LA7dObG5n/kzpM3tNjFNBeWY3mGjsp
	 hGqJJYN59swdvycBcXAIM33w49tyzcsXU+EPdjBlEAs6wgTnsVjAHNufvpT2vUueuH
	 mvX2kJEPIwMj5n+Md/9vs3axm9o2IB7jhJbMWUw2Pvmmo1Q2T3OIIjtY2mwzMPaYgB
	 u/gDlTqB0FyhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 00D453811A66;
	Fri,  2 Oct 2026 17:05:22 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ar9lU7uxSwvV57e9@beelink>
References: <ar9lU7uxSwvV57e9@beelink>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ar9lU7uxSwvV57e9@beelink>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026100201
X-PR-Tracked-Commit-Id: 3f35b678a1d6b4c2dc773ad73623b1515cfc5bc5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
Message-Id: <179096072092.3506251.6530512483959742957.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2026 17:05:20 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 2 Oct 2026 10:04:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026100201

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
