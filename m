Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33D3A875D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788731482; cv=none; b=Np5bO1N0EG2f0tVFQwvVFRocXgj9BzEjArkd8PtS2gtI+ma1oAz5sWyKT+4bOnGUYfcc2Xk3dYBZSTOnBZPSlt/VG6f+kcGdwzYIlYT4pij4JfRGyzdY65v8JhHyx0mNyoGJmF4HRLcDyyxWGv1MQG15vNuvNx9N6DPCWVybRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788731482; c=relaxed/simple;
	bh=SiRUFAQe0Y6akMZjOsoCzBnuu7wh7xdxWgYN0yFEhgo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OzlGmQaMNgX6QVrXy0VnBLbMku1Ev5+eMqdJ+UZWK04Xd97sKQsZ/hGsKMpOKzyitj6lVjdNiXiPNRpzKsGQGi9D9NSr1/szxHPefgKvO/eJ+1WJhvTM2jwq6h8JDQg26UPS91nZiBgK1TLsDMjLCCdPljz/YSv27SdTN4GzT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjY392G9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjY392G9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49EC1F00A3A;
	Sun,  6 Sep 2026 21:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788731481;
	bh=DddgADT1XwKfSVI59iblImW8G2XEH3VehBlRIJPkq2c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FjY392G9hZu9aAmnIDUZC3gpzf4Bdm5xip87HiKI29JHnLOkokVp5MjS6F4Jglsvy
	 kSe/hunXffr6rrImG8pmmfyh1GrCnCMgHO3tVmjPvjoxShqS7cz5lGdAKWYqAsmAmo
	 78hU/mJv+5M9cX9iMM3LA6K5XW563kZL6brHCzl+27hELCPCjUMVsv6Cpmg1TV8twG
	 O+jkz+dY4Gpi5s8Ub3emd3pZ9Z19JpyH6zj3X/SNvNld8TTvLabG+NcPUW0M2W61dM
	 B9KEFKZMbezwg1NXR2y+PEBHS0907E6xzrh6VZADBkh6G0PafjEnDv5MV22ykeujYy
	 A+hWU+/qg4gIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A833926274;
	Sun,  6 Sep 2026 21:50:22 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260906160316.5aed43e3@robin>
References: <20260906160316.5aed43e3@robin>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260906160316.5aed43e3@robin>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc1
X-PR-Tracked-Commit-Id: d80e12156f1fd490adf29a8d28489725a3ac817a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1e00ffaf91c41eb752a1c200295c9ab7abfae1d
Message-Id: <178873142139.1691459.6860588744905159065.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 21:50:21 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vincent Donnefort <vdonnefort@google.com>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 16:03:16 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1e00ffaf91c41eb752a1c200295c9ab7abfae1d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
