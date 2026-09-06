Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172023B14D4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718356; cv=none; b=qCVgxjQ596A0s5jhsmYAUcLkqATsMJ+VqEdfneqY/Hx3hK4CCqAfY3bbZtpwqNSC6kfzwmjLLYq+1Pv8cS1MC9AmhXCnRO7UOe/EXc4SZZExC7Aju4H0n850JjZiHCKO00CZTg8s1sQz0uTsBAaLNALaYywVNO8a3Fzl1VcGbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718356; c=relaxed/simple;
	bh=oUhcJYc9h2FpbKykl4b+b4Kq6X4QjqlZ+dcs+H0EWb4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H3AtJ8dUBfkoGEyDOsDtwA78oLZBh6T4Mtiwsz+fcdtITVs2CA70lpt/sr1Oxo84C1/GDkVZKjw6Esw9Kq4H8KJ6JRdjPLFcd8T0VHaff/TKzCn1TJmq7jOyxsHptkBKblJnzpyJVOF8pzc87QCjNv4mMAKNT9iBpeLMHiD1Mbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOZRB7yO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOZRB7yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0EC1F00A3A;
	Sun,  6 Sep 2026 18:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788718355;
	bh=gBEsQNIHZ8sXMswvgsn7Kd49lpVe8MJ6RAusNMXXpHE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KOZRB7yOT/dcDO/7lwjStXyr18GNzIAoD/RHGNSf2cvLY55T/FVK39SKQQGvY7x0u
	 dROe5GHEMo/ATycyQcPoHKRwymABbv/0QPRiXo9cXO4vaPmGweH+yr8DTy2jteTFBg
	 tsQJGhulkMDUTooukWfCKNBWBNeID0ddQ0AdJK+tukEsKSrcVWzzR76Wt3is0JGQwJ
	 3EYUMlpB2Uh7eRcddgZiTdVG3J2kkfxiqK65gUF6mb1sTSTXdfAi3svSNHueYPekDn
	 c4nlvKckKZPodiE/MM0O6BxM2T4nW/VDRiM2kH5XgfmAw5V6PB7yKarwI+E+xnPW8O
	 LJ9HU8Bj90OVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A883926249;
	Sun,  6 Sep 2026 18:11:35 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <ap1NEllrD8nMsFiB@gmail.com>
References: <ap1NEllrD8nMsFiB@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ap1NEllrD8nMsFiB@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-06
X-PR-Tracked-Commit-Id: f0d243a96f2684ad771d678767d17972cf840bd7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
Message-Id: <178871829440.1639575.4127304395444817583.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2026 18:11:34 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Sep 2026 13:22:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
