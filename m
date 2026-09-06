Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50817389E1A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718354; cv=none; b=Tuz5XNvHMqQcvmoEmZMSXKp+XL2hp/02KwfYHpSowOliZv6InTQ4i1i9zDJ2Gt8GQpWRzSd5AgY3qxAWyblTkjjGl8ppKazxxq4+5qCSPs/y3cFcQcapwZoSkZc0ESBdW8PqWwykd0W91bYAbILBY0ZT2nPjrUEP2W439/hDwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718354; c=relaxed/simple;
	bh=RIbd+i9nvQXqVFW/QXQXvrGvG4RdbN6RIQOLY/FI0dw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SITKx1Y9phtp08Nobj20jgabLqcxnxiDS4+0Oik9bApJNzE80QtHoae0gH3v1/YbqLyRoNmadiEgLyzAJex4zHYn3f1yhIuepMynIMZlPcLExl7F+2ajsywObYsALMeVZBeDdpGo8QmJ2XSZxWzGdOzmjlWNjz+5X5x3hzDAOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll3hjZtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll3hjZtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743E81F00A3A;
	Sun,  6 Sep 2026 18:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718350;
	bh=hqNcxAyiwr9kAWQZVWrdFzSmdw8db1+JtmhGipPPV+E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ll3hjZtORt9aqK1QUqRJSsJjyzYj6IiCnWi0LtmKKiZPFNT/xVyMaD71rnCuP9bGP
	 O6AQHRvjfWe8aKrw0z8W5QOS15dR6nPb//Q+NAPozvzUeZX58jPm4hmqBFedcD0lvu
	 xEfCWF+t17VxTGXKBJQacb04GJOXRlRSGQpfhH/4yi4gCKDLTjzuiqbqAm8PgmFb3q
	 Z9F5awReVu4ZYM3hRr03G3fMZDS3dKq3u3FjZTjhMxtZ+ives2fxouYuhFwR4vNR/W
	 CbWq/1D8KnG54bcRiURz1xTL2sZj6H4+FvJbC5PHpi7iaetwY1KrDFSJQ1K6+TzSaG
	 7RQBMp9XTq1zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5691C3926249;
	Sun,  6 Sep 2026 18:11:31 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap1FmTYMQ3NVpRs3@gmail.com>
References: <ap1FmTYMQ3NVpRs3@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap1FmTYMQ3NVpRs3@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-06
X-PR-Tracked-Commit-Id: d31fbbade43f880b7e59e2b3a72722fe2725d93f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b485131995544741ba6dcc313d7eb573bca7bebc
Message-Id: <178871828990.1639575.8008786188174015838.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:29 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 12:51:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b485131995544741ba6dcc313d7eb573bca7bebc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
