Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A33367B6D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129874; cv=none; b=XGExfdZaYE4KjIAGPI8MRVTDs+RmQIUPiwEx+o+7a8Ecpt4aYCufqNgjLN4gwW+QCuAIpdBpeCWVogDirG39G3xQByRydlqPHPlvsXy/B/YSQAqH1fmGmKLdk1mlFIxV9OOY5f5Bf2/jj7nmZLt3u6uHcxNawJRAcLt9cQOfzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129874; c=relaxed/simple;
	bh=95qHKL1KG3ugdS4ilJf9FnbmAHpV0EMBUaSUgzd7Ho4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Et0gNhgKaEev9aVfa+JM3dCe2zZlSzEDh1fCdw3twIiLt3sP7AP1aTfQVgeGjlu7jONFhUnOT9bjd5EHiMQVIaozODuYb7agXofRAJfXk4QCSAxq7primUCIIgytSt9zB9w/VcFJUXn+HbNQeENG1y5le22lbeGsfLH1RRiPbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBjuI2Pj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBjuI2Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E431F000FF;
	Sun,  4 Oct 2026 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129873;
	bh=wamsYryfl0zAyfXXciPrFU1QFjx6uJF4a90FUjbD/Zg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aBjuI2PjEgZmRE6d8kutmsJOKs1kclUFTChmkUIAMPNSngJRpXkTZaSxVuULLVVH8
	 VowF2BL/9zx223RZA7k8Z0m4sL6igUZTfoMaXWquIDGzP3mv1x434m8slzm24HzNmX
	 TliZ5evyQUXJJ48PIKAn+xj24VZ4RtYO2GmCa6KgG9RN/GkNHdaYq+dR9TxMEE8Um7
	 URTsA9D6h65E/VRm52Wx5lm7KBS2+3nCO7eEdmFpg/Sr3n1AF7c0Gb9shCLLV+JbRK
	 ooDsXxlq5uy+T2YVgUnJu0GNffCVY1y0SbWnC6nwV5PLWV9jYEGng0H5MQQnD8MhZh
	 vsgrBusGwGA0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F17123924FCB;
	Sun,  4 Oct 2026 16:04:32 +0000 (UTC)
Subject: Re: [GIT PULL] locking fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <asIBZtGFdG_P2c2d@gmail.com>
References: <asIBZtGFdG_P2c2d@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asIBZtGFdG_P2c2d@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-04
X-PR-Tracked-Commit-Id: f35e3b5784221654f9cdbd6222275a7fa203f6c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c915d6007fab5b87a8c2516dfd37dd614875f9c
Message-Id: <179112987155.456308.6057886041330622313.pr-tracker-bot@kernel.org>
Date: Sun, 04 Oct 2026 16:04:31 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 Oct 2026 09:33:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c915d6007fab5b87a8c2516dfd37dd614875f9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
