Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532328;
	b=g+ls4iblF4joADbOo+uHw1TnQgJnuXcM8r/pDhZkx/qDsmf1hJMYCbHpb6Z5cFiyI+8Y
	 Khg4+Z43MeIXJnnlNhUBPb6jUsVYz+bHO9RAgiDez6/nQWqg4vIV0tOHXwNObaTD4AR8Q
	 APrKUThji7dbavVPv+ypdhUGSY7pJVA01JFg8IuKLOFzur4hkoW7KKCDiHYIOcwLDku1c
	 P2zFnIAuqK1sMbDPut7MnoYjwgJWxJsPdsS4k2UIBkjmUBsWhpaLMyLby0HEnSfDfx0rY
	 MgFKx/YpIf8Eo66aPXvUYx8ZGnm/j1oSDlOIgPk70aj7jDekW8K/4kiNw6GwbjWnHDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532328;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=qan8ruDoVQ8CSiiHWKDgTq+kOw134k3fJJh0TDC/f1k=;
	b=GnZaBRbwtS0JUiRJH62/w+KGLtiffU1g2e0ivrNNg0xCMosLf5dwFPE87p/yTk/ty5gK
	 YmlN0qXlHKpmHB16CAwW0NJfY57H2jeX7JrcuFlOw2wnZXnshVexQa5PlGQJe2FqY1Ovm
	 auSfW7iJ+uNIj4zAfV/PThNhR4Uq8y6ryybpuVwAXDIPn19eB05MIkKzLXL18jzor+QdH
	 qibY4Z4iAmoEiUDOVASaiEiTsmosOIzGQ/4SLp41y6dClSk+iYbFQq1zwr0z41ev1nA4L
	 ZMT2d05EyOlENrEi/5sLCbMW9F7hYntdAS6Ta7nkOEW83Y8HPki66l5gJUeqQYlSAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JoxIGyPY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CFC606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JoxIGyPY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805B31F000CB;
	Tue, 20 Oct 2026 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532328;
	bh=qan8ruDoVQ8CSiiHWKDgTq+kOw134k3fJJh0TDC/f1k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JoxIGyPY94vhVdDS0rz+lkNlWgxHLbJsmWKDKPZts4E+HQJq6ZSO8XkR7tp2NwSmR
	 WJyElddriR5+wIDSsuXWbTPxh8wER+HpbYp41j3KhH2ONkfCs5j35u/tthDLAuKrcq
	 gJye0XABERWOjYwa2H/ARubQbgqaTQlQKsDRwBpUSmCloYwGHUp4A+mJNUrpCfMoLR
	 ZdXHdBcAnjk89OIq03ht6GUjAcKBZ0P9b+NNIYDO08SwwPSnlFIGpGlBLg+8ClrGbo
	 Lo9mritbnlLH61KaRkt6wYfM1EAFdlMEM/8yKussmSUTwYHmg7uYKd05lXeonUgJbx
	 HO8nt4wPmt6UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772D73809A09;
	Tue, 20 Oct 2026 21:38:48 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cleanups for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261020033154.GAatbgqhp2_A-T569i@fat_crate.local>
References: <20261020033154.GAatbgqhp2_A-T569i@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261020033154.GAatbgqhp2_A-T569i@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cleanups_for_v7.4_rc1
X-PR-Tracked-Commit-Id: 27441d76b3d6604de9162c4c24d034bcfe3249de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1bd2400fba444db006c1949f6ea02cbc5543cee7
Message-Id: <179253232713.225072.18383910928069695606.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:47 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 20:31:54 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cleanups_for_v7.4_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1bd2400fba444db006c1949f6ea02cbc5543cee7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
