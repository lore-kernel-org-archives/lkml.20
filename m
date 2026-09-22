Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3304F56B848
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098614; cv=none; b=EZOO+MucD1dH2aO/+50KURSC9h6tNwYF3CaDAX8gHdWL6gJ0zcGdgviVTWqxM86rN1jpz5RYWa/p9311xVtoLTid06psNaJtO/VEk5NPufHdbwjTlxN753zkEqyHAgeWsCRLOsPRcjDpaecRanGZn3M9g341O9hgdywado4zjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098614; c=relaxed/simple;
	bh=kCVPb4zwnu13SKmdgm85gSinRRs5VQ0Ti5NlSAG0mvQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=frojn19fGweRT7j4BdIqPuBuOAjTuudA4l+SLOEXZ8obXw4RJcXqHi/5ZITd1yUbxvxv6Uw+VsY3LRbnHS1BabcCBpSw43TRrDZh4LyBw7KBTTAwG/IMumUyGoEVlg5x9qgOlf/u4/SW7/covXFhmySwG7gWz1mvGKEsfNgpYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5RxNhpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5RxNhpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B341F0089A;
	Tue, 22 Sep 2026 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790098612;
	bh=8Js6+1qWcVkkG81E6++WQZT9fvaDkCHMJg8WMUzWbt0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=R5RxNhpYpJnZE+4WGUIf6QXePH41ip32t7CyA39UG3CZ/Xu8miAa9XHNMT3pXS86J
	 2wh2I2FnNyahRSv79gM0hNAEORALeqmGjFkE+ukMIh6CvenUub7lXJ2/H+JYOnmRm2
	 1uKomtLK8QYLTH3kOfd/mPX9EjFyNKowAuaQPRAJeEzIMzjOtxtzfx7bA4i8gGz/ej
	 MnDGmGJjdyisfxdPyGARo3kKLLeRXLy3IokxIjBqZiX7V3AsKgoCxKvQYrNEO64jFK
	 Ge72zVJuIumXwr0Lcqz7iF8GPuDN9aV7ZbZ7/kGurohwHtOpK9Og23nSxB0yZWOEl0
	 /3Ci3EUR0ISZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19BC13811A57;
	Tue, 22 Sep 2026 17:35:45 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <0s2359n9-n77s-1nr5-4sss-r4900p89o5sn@xreary.bet>
References: <0s2359n9-n77s-1nr5-4sss-r4900p89o5sn@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0s2359n9-n77s-1nr5-4sss-r4900p89o5sn@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026092202
X-PR-Tracked-Commit-Id: b6f69097c8271cca30314fd6e4c802f90737bfcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe2ec83746e501645709761605c2464a44fd2929
Message-Id: <179009854377.10467.12195770724757793917.pr-tracker-bot@kernel.org>
Date: Tue, 22 Sep 2026 17:35:43 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 22 Sep 2026 13:29:26 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026092202

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe2ec83746e501645709761605c2464a44fd2929

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
