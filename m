Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893052;
	b=A7TXCnE7sUz7/2Yd014H7LpPOeuJPB/MZczwmHjuU33oKAxlzGVnQYDtgdARisGStTRJ
	 k68isACjsE/l3nuTx2UOcs+njrvpNKYJ6yZZfNKhyJz9C5zGm0AiuoA6MyG7Tvr9+MUQR
	 e3C/E0sJDLOFq14xCQSwHc7Daimpu1z9hOBaa040ZAwKzgy2EyoEOH4dZZEuMA1EkLrIr
	 OKnab4f0aBukUWrt5ynBW28zrncwmdOHoI2yyFlp2b+wUo2WHvM38G3qOBXyX6V/upVs4
	 hNq35pSNT3FtwhpDXfPgJa5P4Wasjl8t7h+cFGgFAIN12DUmij1BF5GBQITrQUYARNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893052;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=r/sAouJbnxGfgi0LmFwxGGpSvX2Y0raqOln37nn6FjE=;
	b=1iIw9MU9OGn82VTOesFW7m4xGkQ4WN87IB8UxgQHcnZjf1qrcjTAks1Rc2TOItwtYIbt
	 mvt3SCqIl4vw7EaJKi9oR4lA/tNilt66gPpRxW4T0vJ/JyE54HRpldjom1TM+YNYo+HzH
	 ZkvgA0ZhRWwz3/ZDyijzw+T7XvvXTrHweydl66eC29pnB1xK8t68ijPWOOw1aaNYNEBFo
	 5xuqoaArQBmKOukO6gxhlrm+F2c6QP63606wtdpoxcKe+riOgYhwPJ6BlJsoz+/l/T1W7
	 gq6bB7F7K4PIAMVs6qTwJu+UCflYQE3WIN1gJZWlCAHRc9ACsenPPchceOqdrAV1KFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBUM7rjI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE38606A32A;
	Sun, 25 Oct 2026 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBUM7rjI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8936E1F01825;
	Sun, 25 Oct 2026 01:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792893052;
	bh=r/sAouJbnxGfgi0LmFwxGGpSvX2Y0raqOln37nn6FjE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GBUM7rjImaSD90bPn0QzOU3mgYVg8Y1XtK6ih0qI/ZSs9opi7lQsUArfnNmmA/clN
	 4ok8OjzJ/Oazsz7K5iR4EAnypzuMyRG9DYfL/wY1ZsmTnlmYevuME9qzPa1om8u/0P
	 vPZYQA7tNBMsRuVqFgeRcKJFeTrqclSmlpUK27+Zn8DagpzqZyNz5zfqZbiIsYuIri
	 K5FMV1q94ALV43JDtO91ZPUplBQWN38wO4LvDXc5L+VlU/KvAUbCRts7+OZnj8NTzx
	 dPrwcDCYI3/+16GZxn2ZR8wABWKuXZk5NjkjO5XJm7Nf5vpexsmeJ9xchLjsZbSL3Z
	 NmYkH+OHGBd7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 81AC1391B1B6;
	Sun, 25 Oct 2026 01:50:52 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <atoUqhA4O6NAoZ7T@kroah.com>
References: <atoUqhA4O6NAoZ7T@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <atoUqhA4O6NAoZ7T@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc1
X-PR-Tracked-Commit-Id: bdf12cde30830d46a8ef1ba93986356f1164b4f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 168151cdb0f93d26557f9f3c7aae659b8d6b1863
Message-Id: <179289305117.1865536.733679841218811546.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 01:50:51 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 15:50:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/168151cdb0f93d26557f9f3c7aae659b8d6b1863

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
