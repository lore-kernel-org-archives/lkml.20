Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A04382F2F;
	Sun,  6 Sep 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718347; cv=none; b=pO06TVgjHy9ZGZpqnHGNPTwtj5si49VdUyImBFH5xxvZj3WULIZ0I00/aob5FPc+PBZ6M1/3uU+Zq5msnufcURk7tyBCPjC6AwxVa4s6soZ97ViQ82sqqoKkhjJc/P35x26bbmGlTqy86piyVvYFSVrCxUwzRaTDFEoNTOPXtJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718347; c=relaxed/simple;
	bh=e3h9e+a/2jr42fF3rtopG7+1A+gxOB3Q7IPa7E2mAWY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JoVH8QjH+9S0fqfGNGiWoGw3v7r5knASFLKDanJf37oza9PNjQXCeW8Rllfjm7rs0e2ldiPOc/uGZQqNrIiBCW9B2TFWh2amD0XEe6ER+ImfCh8rhpjV+cVoNlQMUdyK0xNZI9JmUQUCxbyU5DUjJjrBAA6vbiONFkxRfPcdOtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SolqPc5+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SolqPc5+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC931F00A3A;
	Sun,  6 Sep 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718346;
	bh=4552o/1LHBFAaesGap30aN6IjyaTxnM0KZOkd5U3K6g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SolqPc5+2p8yXoGUbsYEXxcE83to+UkXVp3nFRBI+drAgahjnMTLITao19ZgaVWjF
	 TMA9xh5hWMj9fg2YgyfxOVL+UthQUttIZ/BB9DVsR65HAyVDvwpSfBYxC91hKwiCRI
	 /O92ib/dmM4ZF9vSDtfaK7KL0vmsTZsOEjRZLjHQ7TJJjmryQ9aUoLT8zzItzukmb8
	 rAocHU44rZTf6QimUIam7AWUwV7uiH+cW9SeSs7TYpfrPPOcerLEyWA8tyWsGT5DF9
	 VgUYkAgyaIRa/muwTr8nD1tQFnJc3H47AK1jAbguPe61g1GlMrZFwJESQbF2WSx+Jm
	 rwKafDBOR6KHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B9F3926249;
	Sun,  6 Sep 2026 18:11:26 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap00FN1hfHYkcyhq@kroah.com>
References: <ap00FN1hfHYkcyhq@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap00FN1hfHYkcyhq@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc2
X-PR-Tracked-Commit-Id: c9273c83885835dbd1e8835d5665dfb8503d65e0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65538a8f02fe6e4f07228a816529b039b544f051
Message-Id: <178871828554.1639575.1809988838478697719.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:25 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 11:36:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65538a8f02fe6e4f07228a816529b039b544f051

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
