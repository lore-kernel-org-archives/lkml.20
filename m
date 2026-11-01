Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555885;
	b=sJ15Hrivg+iFJmeaa5nSfKZQ/a8ovmfH1uvn3NKci8YDOhl8wKporweapllqhRKp9sV2
	 P9/vtZVT6aCorcg38CJE7SoEHvECCTmKqM5FOTfdmTJcq3XXNvgI9Z6y9lRauZILWq5xc
	 4eu77tiXolrj6J/430YenhiMoGuTbSRsZ5mxcSscbKSbIttMZUluKp2XuHgObsbFXY7F3
	 RoOxFRW4UCOKIfwGNYOiN22nam8fx2LQxntjmn5Xr8sRGQdU4har8/6jmmd7KkRDViRW/
	 EGOzG2F6zDScXm5K0vbIOS9UUcR9EYZoCnWq9G8FRNL9/JXxHeEJ9fssnwhjXPNC6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555885;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=xOV1Bc7HIXnrqCizivsNFAh40YWEjU/1LwKtxqScv+Y=;
	b=UgNjTTVlWpFovbqln7Hm9Hf/01J4NcqhrQQ6eLUEsmu8sCmij0dcYZG6XWKJvoccTQQo
	 fp+tIn1hQMV1cPNXcDyjzLUoY7c4lhpw1xPlXHRr4YDpzFt5uTIMtBV84slzKmrMgL9zC
	 cgmTCgAJZzhVNlupQ3ZHIJ7fTSPI4gtBfh8FpRGHJId9HfpKyIqyEO2D1eISqX2CDQIdn
	 T9FeFUSUvQKvhA676niIe3q1Uejgi5H4ryttFfJaz9BM6xSoRQfb9QRJd/5LFmjDSzmu6
	 k+pMsoxXUtRNPKqjgEZ/UqBCQzApSxr4Etdc8/hvr2mdcpgF+UDLg+EOpZ9tQUPeczg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kT2tpn+I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BB606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kT2tpn+I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858DF1F00A02;
	Sun,  1 Nov 2026 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555885;
	bh=xOV1Bc7HIXnrqCizivsNFAh40YWEjU/1LwKtxqScv+Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kT2tpn+Ivhb5KUNHMbqtgWXtkU0H1YvL+QPKYt+lcuShksWOzKNBLdEh69okGNQhJ
	 zgWn16YKJdc1tQ0IYNEm4Eil+StaEOXJJ1rqZefATc25mi0FzufmzO4luR06SqVrvV
	 Mfd1BrNg3hJ1hvGWorZvfEVsUX74u44lMygF6AbyP/o6IF9u0QBJDcXwMMWppVuDUa
	 qgxHjdFMLisoo3pzFK+ugn1g1gf+4y9VzCWAgaNg0anDpHD5yuTKOaBmBYBIakXr5y
	 73AI3h5eQvWUiXxFvku+cP7ubu5LJecxsnm/Mw2GRokBorv5rZozgyJAG7Y4lUl5/J
	 Kaj/nIRa/k2+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D25138003F7;
	Sun,  1 Nov 2026 17:58:05 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aubfrZ6hk_E4LW9E@gmail.com>
References: <aubfrZ6hk_E4LW9E@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aubfrZ6hk_E4LW9E@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-11-01
X-PR-Tracked-Commit-Id: 1c16bc2b1122f78f9d51c5785f7a78b36d44972b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65cac1217004da03c3d2418bd7a7fda038117809
Message-Id: <179355588404.2549645.7990442121867131832.pr-tracker-bot@kernel.org>
Date: Sun, 01 Nov 2026 17:58:04 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 1 Nov 2026 07:43:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-11-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65cac1217004da03c3d2418bd7a7fda038117809

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
