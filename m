Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150E31197C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453308; cv=none; b=Aqm+jkrDa0VY2V1hIRYL4H6U9e3mRFaOLdzusD2E/jeqm7DKc4xJfSQTVQBjnEZOc291Rno30y7F0/8qE/D1izfRTx5inf7b8QAExAc2kVzLnXQJ2aZ0cs7/wgt6blp7MKphfFDK7eKF6dePmMjHKKdiljhdd1iYaS8/ow8esoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453308; c=relaxed/simple;
	bh=YNym0DGoteaYEYE9x8dLsuYyEEVr4uZOqrdw87jKo4w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fYO9xmChP/iU+JMERUMlv9qiMHk2/PlqufxcNvKKVpI37Nk9uWke2P3gs1G2BuiKg/RM70TlIrHt0PLLJtnm4Cmuq6CKXBc0e8OeY5szJrJYkr+Z93rT+WxQNxuB73/bLy7ZKmMgaRIMAor059sx+4Yo5po/SL55SDjCPjwnIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzERWFrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzERWFrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87711F00AC4;
	Thu,  3 Sep 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788453307;
	bh=rylkqtxypEgfCRO4niCkdzIRMLIHIr2nr6jkMKruGdk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TzERWFrL03srM1ml9kUYbguMyEepTSC13Ggr24GTWe2thACTVeoz8/khGjbzaJ4ea
	 tRGYMMV5rc3/fKzrSRqIJAHyisp6oKTNUyWoGN9WxnOBsfdIIwyM0QaSFk2Pr2ezoO
	 4wRDgdJFwqaeZmE0fvKosNhWFPlpqwT2lC1tSt8Wuk8vRcJQhC2z4Nvy1cGfGfzf2t
	 emf8pPbTY00CXYHbrEg9NlCz4sfcYK9BECznexlPLvCCqZ4XwwLmk1CEtTH0HJXHmU
	 zLCnLLXuUoGJpcR3boH6YRjTcrfEm7CCDTDBO0lJCy1EmHNpVyq8y1rPAsHXhGgSgk
	 6pD6XEak18krw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A0038119D1;
	Thu,  3 Sep 2026 16:34:10 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd-GgLoLKM4tX4wUqH+67nWVemjkH-pC7WzrM=aaCsXrnA@mail.gmail.com>
References: <CAKYAXd-GgLoLKM4tX4wUqH+67nWVemjkH-pC7WzrM=aaCsXrnA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd-GgLoLKM4tX4wUqH+67nWVemjkH-pC7WzrM=aaCsXrnA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.3-rc2
X-PR-Tracked-Commit-Id: 0fecc393f2060e6bc25138df32cb923ec7071c6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97be98b94dc8e43a3e4dedccaf9683fb806e49aa
Message-Id: <178845324887.3436244.14033067698235733935.pr-tracker-bot@kernel.org>
Date: Thu, 03 Sep 2026 16:34:08 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hyunchul Lee <hyc.lee@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 3 Sep 2026 16:14:08 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97be98b94dc8e43a3e4dedccaf9683fb806e49aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
