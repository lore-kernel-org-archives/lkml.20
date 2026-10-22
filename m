Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694349;
	b=OB8mDEBpEjF/yAlDgRfjAifAsIfqoWCpACM+LZ9QLy4oH7AEuroPVBsZJ5KWiJkRXGUY
	 FdN8McZwuTyDaaaLRs3vw1CPJDvcRLT7q44Mnhg4S2P9qz95a+EyuPMboBr7fvtZeAeVy
	 bNO+9AjB5f1LTMt+MPhPJevZqp2uYQ3anj7EJOUtYWxRYQTBq9x8j2ZVOnBdzteigojIH
	 UVqnwex5TREdLJtOpvSPoCKFFxTJzdqH1oNXzJN+sxZ4OtCAUixDCuUTbMu4qHw3vxxTw
	 5iw0ZWSG6HWyuvw/a03LgjD81+dtpE3V4sQqirhXCsc8NWoMTNRUuH3xKsLpFDqZNIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694349;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ebGpPoQfpYGgDHVBc4mDyQV+Hcna7EK3qbgAIXMuyjA=;
	b=Yv1RituRdBSukopv/hFBXXFOs7GZSrDK0lHcmLj7zoCGcdHa3QyhW0Di395JOTd5Zh9a
	 NSFcC3NOzCB+r/eTG0EyQnhelHsjONhHi5y8kvsJ8Zuoj3W/ABLg7YXhbIpL53y1QIMno
	 q3e2zrt4+Dq7b40RJKkJ79GWofMuFt6Mc2nJ1JIs/uWVfTkXYW4YTeVVRexIG5p45hcmP
	 Tl9Ss+3Kim84k/+AR4gLtBwDKhyjwLsHxBrDkwRyYrhD5xRS3aa/BpDvNXxHr5W6iL50m
	 QdnqL9uGfP3C2CYt695a20VV3UxGXDzJWLc4Kr+ZlLpUIIGSTXnbl5vXkgrKurQ0vAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPBbWKZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF86460A263B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FPBbWKZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3C61F031E3;
	Thu, 22 Oct 2026 18:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694348;
	bh=ebGpPoQfpYGgDHVBc4mDyQV+Hcna7EK3qbgAIXMuyjA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FPBbWKZjgZRBA/RFvxnU/i3ZTaONZp/7H+QebhBvoFTeNtxO4BTPYzBu4m+BD8uQ3
	 HWY86IkYLsj3N/L1qKHQ63y7hrILS5InAl7jkkcrr+MtLLm8AFVgbkl9QcXWrVRnyx
	 hQtUODKumUA7D0xKn0EJpgZhtqgYWjnx06Fizrb+77STUf3h1McwlRkBXiDkwuDROx
	 SpOpyRPVsuPHFb1NqY7mR7hnt+CevccP3/etbeDNSZGClErGMEYILrclfmsLv37rf0
	 /lyeO9zn3QkkBZG/L7QtVJ2A2WDIg24hREB5YMjauKZMLLjH4awmRIdZxiq365RVPa
	 sUbm033uD9hsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4458B3808222;
	Thu, 22 Oct 2026 18:39:08 +0000 (UTC)
Subject: Re: [GIT PULL] HID for 7.4 merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <so055932-q645-4261-noq6-12214q6n09n9@xreary.bet>
References: <so055932-q645-4261-noq6-12214q6n09n9@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <so055932-q645-4261-noq6-12214q6n09n9@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026102101
X-PR-Tracked-Commit-Id: 60ccbc2343d37c65a76b736eb7cf41ce0ec343b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c2fe95ab19b09bef7391e3e5cdf8146d09792b6
Message-Id: <179269434685.110555.10307830468024471925.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:39:06 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 22:25:54 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026102101

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c2fe95ab19b09bef7391e3e5cdf8146d09792b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
