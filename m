Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50C3358B0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979150; cv=none; b=lYN/fB3pac/dlniNUL3d8+5WAuoea8g4kj4zPqCmV3oANcvpEekWs2DxOLhFcK2bcr4Ugp37j0MPkhUu9ILhRm05Vl6DSIEoKgo61L4opW45QT+YttO1gLYV37pZzhN+H8L01/3PyDaRIZ9gE4T0WUuLUS125Vk31tOpqNxfmHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979150; c=relaxed/simple;
	bh=DiGu0Olot1bw3PyadJARJplL52M7mDKKlAjcPrE9v8g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lBR7VeZziqSXmypfJ2uDmwendhMbQ+cXZ1zBOMDbR7kN0G113tZyeSGI8652RdIqG5J1Pcs3bn19zfdAEzL9VRj81zQKE5Ntm3Y5YJNhjCd8NhrRWyJR+NSRHRiIxcOyjHKIuU27kVz/fk8zBH0X3CQ7uh6ZJPRiu9hZ8REPXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoEq3Iuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoEq3Iuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DCF1F000FF;
	Wed,  9 Sep 2026 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788979145;
	bh=VxMLcLpv8USXAMTtYUoK70GFpRR9xkKWB0GBCtOj2Vc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EoEq3IuhmQhUmx1fU9CrliXbOS78APXKS8Z2VmBUd061oDT1M3rx22FPMM0srREHi
	 lCM1VFD4A2CkJlE0BmYCjPO9CabIIQDjJ1r/QbjHpMq6x+Uk/pUTylDBJrnqBtkqzd
	 BlrzP8Qe0YGVg0NoRaJExPoxsGXFNeABNNtLX7nXR7JY2d1kxucmxactH0sZ26C88N
	 4oMJlYtKf1KIewJjfksxzeukY+9wh/L8j3Glzf8b6pwgrz5th0q7e0s+bYMWcwNmCI
	 mccyyGmAogkrU8J2uYxDWfQ53ba6NJ+/nZ6ADHeMNQcO0zwLGbrSdizpQC26kihBVY
	 K2ZvO2ZLqSl4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19BC5380AA52;
	Wed,  9 Sep 2026 18:38:04 +0000 (UTC)
Subject: Re: [GIT PULL] printk for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqEiG_01A3T0XhFW@pathway.suse.cz>
References: <aqEiG_01A3T0XhFW@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqEiG_01A3T0XhFW@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc3
X-PR-Tracked-Commit-Id: a76f015d424e1956e7be9ead2224ab9816be5d79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f8b8c94a723ab6c0a62005e69a0872717f01709
Message-Id: <178897908276.999556.5031414711523282905.pr-tracker-bot@kernel.org>
Date: Wed, 09 Sep 2026 18:38:02 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 9 Sep 2026 11:08:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f8b8c94a723ab6c0a62005e69a0872717f01709

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
