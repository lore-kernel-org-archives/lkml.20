Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693882;
	b=R6ie6nNOpkWSOjbuH3RIofHw/nNUbt85v31eDKcewWKp+9VZlMIO3jEkTMS3ChXLkzAx
	 mTai4XHr4JNjufhXhDxJPclU8yBqHbq3fdRdOeU7ZbnqYCzqpIoHoTW5WtFDs/V2Lazbj
	 8tcc3XVbET22bT1IZSn8qS2+YqaYYFODJ6mSD3PWDtDriOHe1Mgm54LamG2n2tjVgXCbw
	 P5XVUxU5KcleWCAoPzs9h9L19lQsXxT28n2UgacVCwu65Uz0UpY0fYZqRRiQD8MyZEKLk
	 NAswDxHAgf+WTl5+awkVZrA6pZIbWeOht6XXnRsREDSsA66S1O8WaoMteHZM9pN7pZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693882;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=wgDvUWHtOpfwxy7l3pZ9EU/KdeVcAx3Bsh6BSQG3GyA=;
	b=HWM9Db78SRIq7Bk0+oXSeZUqQcaOl5Ff4TOnqYvbjQYlNa92Fxn1IZt2SwHohsWWd9e6
	 p2MGx7oKzQaUrHDVdXwvwdxWs4LI57ZeUkmn2fu7QxWUnalo8t9AGSasILouxmtZd7JiT
	 MDtOSAZDEhtD5swZQ4+YHWtUyvSs/7NpdST8tpj1GiS65dOio/DpNKnqDzXI1yzh2GWf7
	 Rr5Gfve2VHPbZl4Kx8MGqb4eUFgfE+tbNaMmiGEZR5risv4fcNAT9ZVv9VBTZoiVIOe4o
	 ggNTEBbo83aczN7y3a5xi7goUH50hVVgN/a+qgxq3yfEyeSfELmHDXyZNIbfIaYqQww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nZ4G2aMp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A660A380D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nZ4G2aMp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77CE1F031E4;
	Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693881;
	bh=wgDvUWHtOpfwxy7l3pZ9EU/KdeVcAx3Bsh6BSQG3GyA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nZ4G2aMpXmk1oXkY8Pypof2Mu6hkhytqEVhK2OSVkigVDj2c7ml6RQTdtn1k1HCfS
	 LTQd8IblkD+H6FKWSLenbW8iORRmVJEVoDWHXOxJV8/ffv3nCgFz650XmOucUFpc19
	 hT5cIP5aq35L8Uys+C6gUwJ2tZNf3XUXMi1/D07DqY0r8DkGKvpBhpl71e68707cMH
	 kosBKhKfwOpi7WNxgiK0dJbKINEEjdudEDBevloRdMV+C0lKr96GJME6H5Lm/7jIJU
	 7CjuFR+POR3wWlYRxnaTi24IUF9UHTbQrmZsxvNh1atC3U3y6Z85T72T2smQ5VG5Yw
	 6HHbUPcCiASGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BFB2A380822E;
	Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
References: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.4
X-PR-Tracked-Commit-Id: 01a40ad5a9687ea5a837857d4b21ddd764be7aa3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6876634d0fc254362ed6cc4f475c16ddd5e2c0eb
Message-Id: <179269388065.87271.5732085592566179416.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:20 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:37:40 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6876634d0fc254362ed6cc4f475c16ddd5e2c0eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
