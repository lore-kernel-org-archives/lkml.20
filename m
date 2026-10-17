Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EED35E937
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197930; cv=none; b=USCRqTy4P6UKW7X+eQtpUdWx5IlZ9mG3XJxEUhPHO7innQHjDyaV3UpL0gRfROyJq0X6qF98kf7gSh5GJhXQVSAxA0IyrbNzG2BUzOY3f6ZHTbodQpDiBtg7JvJlpaaiUcv4EeTaFp2eFoDSqyTFShswVPP8HaqnZooIyYwKmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197930; c=relaxed/simple;
	bh=KgwB8EJdj0xvu7z7giowvStu8Kz0X2cTrtnNr4Qz8HM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dSnSkrL0v+h3lkoBolQqkU+nGX+OO75N08BSINHSFWuymsdgifcEVDam14WJsavYfz6PA2vczBU58adRbqR2XOR0FqHqsDm0YhP2/EHT8D8FHuNfny+IC0+X39u5Z0Qp0/zReiv9tYGHHv85XHMFfMkO/bA49DrdcJcXUeLj14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAEFk9KH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAEFk9KH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435D31F000C4;
	Sat, 17 Oct 2026 00:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792197929;
	bh=wxS3/e43J62dglLJSTw8ebDn3K8nuPUHpC1udOLB4gQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VAEFk9KHm6pCSlidOydnxoXUGIqOlw+X4oCF5jFoXhq4sbkk3tuNzRHS/X44xNpkj
	 7PzA9xrm9wVCcZxvZxzQS+jEE0B0W6GRuHZW39IgsMpu48UxehBTkMbwawNo3qkn7v
	 yEHgB2Sa7v0jwZKL2F0SU/IN4muKnUSE6C3wNmaZqB6zfp4ejy+6xGWim6WGZRMcfE
	 xHd9yG3h29PXDWBelmTcFqM3Csc0DKFKfH1jhsWElxefO8JIQcXrjQ7g4SlDe35ACP
	 5Hczy7vTDlv45gjV0tikjk2V93BkMGDRkzAjJWQ46x2z70xOpxVBt6t2t+ekKuDOm9
	 ytCrlnJTguYrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A42A380CED8;
	Sat, 17 Oct 2026 00:45:29 +0000 (UTC)
Subject: Re: [GIT PULL] More printk hotfixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <atJTZAhzySxopfhH@pathway.suse.cz>
References: <atJTZAhzySxopfhH@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atJTZAhzySxopfhH@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-hotfix
X-PR-Tracked-Commit-Id: 54e1e89a97924f5f1b57d93350e27993468300b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d586910e3d858fb25d061b7bf3f9642eca89213
Message-Id: <179219792783.1032542.17503019074677765280.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2026 00:45:27 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 18:40:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.3-hotfix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d586910e3d858fb25d061b7bf3f9642eca89213

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
