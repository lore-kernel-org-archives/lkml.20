Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C923BE174
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279414; cv=none; b=qx+bmmVseSfKGpUS04LsCDkFO+A3ORZqdmjzmS1LC9DFWTmlFXNR/VTck37wolcJehAdVUtQb97WVbIE/6y027E8f/N5aV5CrITnNtxn+c84P5HXDYYRHBGe3QdDXc1h9gwvsry0RtLsfQspROiEPfZ9slCBSI291ON8WV4uARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279414; c=relaxed/simple;
	bh=aE5iDjd++J78cRxaiH9yEUMdsPcmZVzlE3U2VrDSOX4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Lm4fjXfPTMVwB9VV69PxHKOkFLRcK8+4qdhecH9hqycRbNQw53OCsLXS8yJWwS6uhb+wy5LlJEli0tBNdVwLhqABxMffoLcpwsDT88pJx9srrLhp9eZkB3zyVhJ4rxBNnAvmwCIfhj5h36jopzOJOvCUVF67gskbiLEkQg5BJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cW4wTuf/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cW4wTuf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3251F000FF;
	Tue,  6 Oct 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279413;
	bh=k9wxdnaCz6QA+GTHmFSHYVRfR0cNPw28SSb4ehysfo4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cW4wTuf/fIzUlDjjWApATl8ZXOKRNWtNFIb1JvI/rNjZmvygkGIx5d7fuWaWNivEk
	 9rYiIgWleAZN+SXA+kN9ks4mw3owKfvgOsi0667cArBXIl28wiUjLy2fIp0ukcKtII
	 EyY5xf2YbSkA/Oylif9sHnay4TSS3H8eMgD+M9+QK85UB3Mo3KxWchk53cSXSnOBwX
	 DTnlzkWvoe8B4k82e3sYBLIwD2tD+k9KobdXMkHnr0Q5MVywSLSsWxLkXKv7O4kcFJ
	 Y8sAmkbMKp6fLJ3NDyEamHJiBpX1b+d/b0WoPnSCPdsL6/uXZNKv2a0IGvYsBBpdCl
	 I7s6go8VKfN3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16613927078;
	Tue,  6 Oct 2026 09:36:52 +0000 (UTC)
Subject: Re: [GIT PULL] printk for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <asSb5id17XfYBTyH@pathway.suse.cz>
References: <asSb5id17XfYBTyH@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asSb5id17XfYBTyH@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc7
X-PR-Tracked-Commit-Id: c83e3d2912432107148cc5e288ddd153a84c0f43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
Message-Id: <179127941158.2106282.194020324456182506.pr-tracker-bot@kernel.org>
Date: Tue, 06 Oct 2026 09:36:51 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 6 Oct 2026 08:57:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22430ae5d90ab288b0ee2ad99ae941f4a666b694

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
