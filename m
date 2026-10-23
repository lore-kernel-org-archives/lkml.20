Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794364;
	b=t2ogZ6voU/nuRGmY3FxgHp58nOJ4fKvugdrrQrXlRk+mZnXu5GhRZElN0vzY6ZNzhC/+
	 j1rlCmsicSA+SF4aYhwFzltkVepHBsQgn3lbrzj4/b4MvmAbLQV/cWoQ5YhrD5A1qwfqt
	 eG5aoPE+R6ExbwtJ+G8YaGDWb8XACS0mY7ISZgVzkfTU2w8Ebno21fq7u+xqLBYQkCIEy
	 bvxUHsxtOq2dxJxjdaz/oe1XzLOAcmhC/x5rCGcEi8ffwlZKjF+0eD7eqocP7tbAEBfWx
	 nfLC3YxAnPpc41ZtsnliCqSElDy4S43naZA07T7zeXwSHvKj1+Gsbd9LrO5Cef4Jlug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794364;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=oXgDjvYrNVapkKUxdZ/bjrBVdRnCozI9d9odnqMxTSc=;
	b=4UuyR7YXxvKiSA0lDBS1I6m16xzSXnEv00VQuuKFYbuYKyB1bxPfCJQZoXSwlqM/mpFT
	 +LIqZXipf+W+vHxcM1tai3QwR6XLpENuBLdAkKdkn08CeFQcTCDVVDadsBZ/udajXpaFk
	 frhIkF1wMOTXBYbRVpQKJm1vRO8X0miiU15hJ/FQ8Kf8hYT+WG/j0zgdYR+5/H+BXQ4Sc
	 TpgYofFJYHw4tJp4aDX5mcfV5RSoKsYyFvuFa+zLRnbt7WOhqfiowc0lx4nfLsWjRXvng
	 rxYJhnnCwYZfg736ERedHnDrSCe/OFJXKqbyTxS/I72fcmvH8YB7QOWh2ygGqSRjflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhTdoMJG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhTdoMJG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9751F01825;
	Fri, 23 Oct 2026 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794363;
	bh=oXgDjvYrNVapkKUxdZ/bjrBVdRnCozI9d9odnqMxTSc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=DhTdoMJGV0fRjDPRUqWltMEWmDrKFvtCs2IYGHkq9XUWY6v5+aRy3LCJtoRWuAUtQ
	 32q9j2zMy1I7E/RpTv3eicd+OgTD4WgRVdt3NuKJi5thCbQk94QLUtrmiWPhOqlBS3
	 8VC62nKZkxNWDJ3Re2Byq8uEO5kyL8sqL21Dl3qyK79f/2GaEiBfZrdLhrMSURflER
	 npLKctRIfUW+/I1/EPcwEmtfCnOtZ3UDdibxTF9bAg0DMy5Rg6k6dN1OxJ1iPDFttx
	 ugAYRT9ntGCU4ASkloUQyvTJXH71q71KHiPE5vyvawj5WonuimL9dFgorphTXBnRV4
	 W5b4SF/RCpw4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8167F391B158;
	Fri, 23 Oct 2026 22:26:03 +0000 (UTC)
Subject: Re: [GIT PULL] rv: Changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020121923.72c650b3@gandalf.local.home>
References: <20261020121923.72c650b3@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020121923.72c650b3@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-rv-v7.4
X-PR-Tracked-Commit-Id: 5e9bdf2924c9041ff1520b528db6104626e9ef41
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff5b1cefb4b211d4853b7ae1d20ce51c859b1619
Message-Id: <179279436216.1300063.16549781287763613406.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 22:26:02 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, Wen Yang <wen.yang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Tue, 20 Oct 2026 12:19:23 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-rv-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff5b1cefb4b211d4853b7ae1d20ce51c859b1619

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
