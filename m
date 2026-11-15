Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781768;
	b=5qI9p8ufH/HVszLqO7nrvrBEQtqsPLY6w4f/ms5KOrPXYm1p1nmLBZxlhPorf78G/Iai
	 xTR/B3TNR1jczbO7uidapwPue7uIdXQiWyEHM/JLChOwNjebN6xKgbLchqGSvufxogEHU
	 iVPJ6XNpYM25LjDAFNZCq4Up69Am39D5wHZhqxBnIBbfsOP9YWT0zx2A8GBveHSmKFcTP
	 zfYzifUa7QfmcnJxAxQd3FX6/mxJDTquQgIc3HJdBQZz/1sDo/H4u6hRAt32kXnbOxTG3
	 DE5RLQCeJpXBAygujfZwZLrFcHX38ROvhXUSsu/jqkMtfqfC4uYAoc5lCs9JI7gcheQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781768;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=aJzJrnn7F68lzfXMeuPJ2b2MxqGfssHim57MVOdPFpw=;
	b=xYMy/ULx9ZcKhZ5YYiWmkkDk/1HeNu173JOkj1lOszWyBUjFm8vHVYiDLQE0diRgAEFV
	 KdCTcXjcOzRs8VjR4NdUnc0NGExPf1UtOTai1ZcHGKK2PkUM71XDk+t0FdZ+GCF/JNGAl
	 wOk/VMkQK4uZSVinZAQxOxuKq9oepbf1dI0aJjWBQ3FbMnAxVsuLBpXuqTWWzMLw12uUe
	 SEwGEyhxJiCp1QkmfhUCGzXNdyRSese/N+wjDaaqT541ayyh+sjXrrXpr6AJ4kGKSBWAL
	 CPIaMysi3zUFDTqJqmkJmxqqMqzwomDPEknDPKmxMzg/9kMor4IYo7GWquCLEGIhn6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U6j//xDT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893E606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6j//xDT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D6A1F000C4;
	Sun, 15 Nov 2026 22:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781767;
	bh=aJzJrnn7F68lzfXMeuPJ2b2MxqGfssHim57MVOdPFpw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=U6j//xDTTpk6+lHDDJYhtlYRlnLrQTzEutwnbLWifnLoz20w2K5Np1BSs1MlkbQq7
	 EQHOXWxAMrCgIY4C2xfCedZo+T4wtECuas1WQSujlaVDOaozpZHBP/HdNh0bTknaLi
	 enu/aCfvOxBiYEk53nEaHhiLBodpPVt9Mq70ou5BozraWyC0+iCJvBcw1Qf1Q6BCYx
	 8iyjF/tGvyb/BkdsEVs0Tp/Z9/+GGyetj5vrWFWJD2P02XpSSvTYMzFuX85VkFnt1q
	 oOwLvWSAoFfFII22/aAs2+R5Xb2Drfug87/4Ga/Qg2jfpObl21H7PzPek97YwQzaGI
	 SIPr2PPoQH65A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77631380823F;
	Sun, 15 Nov 2026 22:29:27 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261115115048.3EEE33366F2A@traversing.sirena.org.uk>
References: <20261115115048.3EEE33366F2A@traversing.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261115115048.3EEE33366F2A@traversing.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc2
X-PR-Tracked-Commit-Id: fd89c52811a4c0754795199f86e0889bee7a70a3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e147c68fea1594901975ad0c9777a6e42077b39e
Message-Id: <179478176608.2784423.4983031348600129648.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 22:29:26 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 11:50:10 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e147c68fea1594901975ad0c9777a6e42077b39e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
