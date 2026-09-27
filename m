Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04756435A80
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538559; cv=none; b=HfkNTYe00m/ZfNBKZJgrDsh97YhgbfSZcobluOyPSY5W1MABgigOC9vaBbGiz6X/8sNcvhyiELzxsD0bfVd3rM0gmB/6g0LqCgLuVMa/uxyxB2wvs8sPxHHKriljwLf4sd64LCujui3p0+HXJwX1wpnodpCMJ0ACfHbA5dzPrxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538559; c=relaxed/simple;
	bh=t3xYfHydZfiiJlQ1Zqi0VrZWhiQW9B62cti6DkOM8do=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Dn94i6SfqJLrlQf0uI2PndCBOnSaZhinFE5RudAEgEbLfc2D5lR5lKU28vAtj6ymFJnoumbu1ywKUhQSjO290lq6NXi9M0ardleVJltmJVyYH0MJaFarSF/lHilVGDf5UZaqSt998jqWEZ9OS1jnryg0t1Twzf2mKemF+Ug5/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7EH0pez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7EH0pez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3021F000FF;
	Sun, 27 Sep 2026 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538557;
	bh=tpo0wiKdTdCUzNYNrYJpv4MeR0Qpf+N0qclQR4751GE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h7EH0pezK3O7Bn3CLyPprt2te/tTl9I/79RHNFBT1lNfXkQ6Vc3pxDL2sIVkArQaJ
	 flgRnZ4WaUUlDTeOT4BPMpY/i3Uve9zou//pBh3BtrsFfyS++BPJW/RIgBU8RRPWs0
	 ByEv6UUj5+xMDc/CxvnYwiW8yikdzwbmlG8Vt0M7OyMlQlWkXKpCfrVL0xmMfYDL5Y
	 rl+lepPUla1iw8z4+e/358gsDfLiEhNhU4PAYw95aHEe7UdIAYgwVBscTCl9V6N8RI
	 atGRubu1Ig8lP7U1CYcsVlu/TOjAynst6+LNFz7Fg7RFutq1jCIsEzQcFpZqbaCtf5
	 GM8NtTBu8VEFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6F022380AA5F;
	Sun, 27 Sep 2026 19:48:04 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260926212636.26253345778ff20d31e62ca9@kernel.org>
References: <20260926212636.26253345778ff20d31e62ca9@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260926212636.26253345778ff20d31e62ca9@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc4
X-PR-Tracked-Commit-Id: 5bfa9f1a9dcb6ecb607adbc1c0226605c972935b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: efb27d47677397961c9017c0f8f469eb25a15d68
Message-Id: <179053848312.2777566.2643362681836133968.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:48:03 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrea Parri <parri.andrea@gmail.com>, David Carlier <devnexen@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Sep 2026 21:26:36 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/efb27d47677397961c9017c0f8f469eb25a15d68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
