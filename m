Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF053793CA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321128; cv=none; b=rMMLbvoFxOcMOFmfDdPsYYmQcNQRgT3wQrc2W555CtJWIdImutszja4nlcjUYp1PbWD0OrcyjU8tubLhTbSqarIIjnlbvW8GIlG6hz6suRba1ljps63Brp4Ijeez9/0APx1JUBld3b4jJ25sLxwgMKUE2vnIrvq+3SxIyatFO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321128; c=relaxed/simple;
	bh=zLYLvIiUu/XxpD8yl9/gD87lwDe5NEWw6Npa7oEvlTI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SxxSbncvgFyoxsXv6TK4sS87OU1cFeOPLvqfhcAAYy+AifbeeG2gC0eASVRzL7VZcV+PqhUNNeYJ+fqs25x7a5FdlZeWrWW6jtl92bccnTh73fjbX2E7yVaAP7ysrl27tyUKMAQTeqFo66eVdLeOfIa61SErJcoRrT17/4GWFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYxXxbEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYxXxbEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63471F000FF;
	Sun, 13 Sep 2026 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321126;
	bh=Y0WIKb+BHjcgK6RStX5pj5SDc30xuhckLAiwPmDAnTU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UYxXxbEMczAr1SQRqzy5LAbenmp0jwMlP2+RlOUOWL3H9SrNHmqoCniwjWRETizTt
	 ALEaNjmpmg/UuQcJfwOPZ9m9qLxZ1ae+9Q5CPaPA+hsfwFzvWiFVOGnREHRr0mnORK
	 Sp/n4mwCq/KpgVhBGbtnhUQYQ8FT5RaQBsIByy3swD/iQoD+iqBysE2eNnycYkRbuE
	 FxrKz42rN3akGe+uO+VO4f4cxCc9kggDma4ZcOZd3v6vKz9LBvkWV24+o7CoRKkG26
	 mY7QpwHw3T/Jsrc82PH5mj/LwwF8FQy7dHQFpKmY/Az5RUXqwW5QbytF6t4eGbnymj
	 I8Haf47S4RUCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A93380A957;
	Sun, 13 Sep 2026 17:37:43 +0000 (UTC)
Subject: Re: [GIT PULL] core/urgent fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZU44Da1o6Bo0q6@gmail.com>
References: <aqZU44Da1o6Bo0q6@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZU44Da1o6Bo0q6@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-09-13
X-PR-Tracked-Commit-Id: 954f7a48fa2ae7310c67729fb556caf726783436
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 086fd27ee9c41f1a3ae040ffe5c9c00b45296f82
Message-Id: <178932106235.3902938.2426056927542255871.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:42 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 09:46:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/086fd27ee9c41f1a3ae040ffe5c9c00b45296f82

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
