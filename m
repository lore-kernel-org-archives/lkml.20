Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694338;
	b=dB7bJ3fFEaLUhiFd91dgqSOfftn26EehcYAOvOtb3IJFdfMRSJ+wlpwVcYxhe6ihbg94
	 q7/sZC9JTB2SZpAA3We8d6sTw+7EYwbpHTglpeokXYs0F/5UuTgehGFHuSDMGF0okmJOr
	 OAetBnMhpKXfUrFJmNgKA7mUjesgUN1RyBjJV+7D3IOZLakfXmIRlq7UL949FosIyoIzK
	 l1qRzr7tJmgFPmhxjNPeqbKnONfv6Ll36lQyZ1RRuAvlptMhz+GwkKXxWkdnAxY5Egkq4
	 p/6pPYBtTcNtw0136xH+6yNRuFZpvd3kezppIZ7nxTcjxfRqZubU6Vy8bVAWz2cnTtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694338;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=fWK9Ef6WtF272glTzukwQcMJLAxkOsz0HaIwyaYs2Co=;
	b=cx5sABhcep8hlzcIil9EhM08IC5sRA0Cg62N5by6JZDTJJYmY5qmTs/+Uq6xMV804aAr
	 4hgGPY3lJyrEEmoR0kT2WpsAJWXLzdsiUSi3gIeBynTGB2Tt2r/i3IljflouUGjTugJUg
	 KqrqyOiqvr2myq/WSuLqV2k+P82zT87fXlqdryW1NoKy3ObRjBCiTsLHPKhfY+W/6FdgS
	 RwxR+G0pGbDC5g/IttMSQqAUXf9144m4vMvwM+rNb6Ws8q70lc78z/uOa5/8dxMclsENs
	 SJnA8eDcgk7ZYSXwtHsv9V0KtZFd0KRm64G3/vg37l0HgLqDYQv6D+3A+aSD9tZ/Dfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jn8xC9ow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636D606A7B3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jn8xC9ow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA371F01829;
	Thu, 22 Oct 2026 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694337;
	bh=fWK9Ef6WtF272glTzukwQcMJLAxkOsz0HaIwyaYs2Co=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Jn8xC9owa+GFWQQnuWtWkJuFP4NWLb684CBJ7LRyUc8xeT8fc7qw/CohHQTDqCEZw
	 CBqL5tDLSXw9PYj6ywG3PZQHOscbF0YcCQR3a2Fv/2v5yzAT9AT+qxhIqizhtzjJv5
	 IzIbKos/ro0tkBjuUn4QdV7+YwVcPMCgAVj8BiSLFc46bR5l1pOixNNSc5RKCX9yl6
	 fYLYWK6bm377U/ye4Fh45qnJ4Sv1iMVIKkxSgAFFifPegADwlsc87jqtXxS663qRUm
	 ff0w/WwBZmcDuGfecb5FKWJL+l2B8fZMVLs3AxkkardLlxtJEeyveusR8zEytONNE5
	 8Ea0IT+XJSXUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 816093808222;
	Thu, 22 Oct 2026 18:38:57 +0000 (UTC)
Subject: Re: [GIT PULL] regulator updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019171541.3517A1AC57D0@finisterre.sirena.org.uk>
References: <20261019171541.3517A1AC57D0@finisterre.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019171541.3517A1AC57D0@finisterre.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v7.4
X-PR-Tracked-Commit-Id: ba83dd4a47bb47da3d2791b2ad6cd816a851b5d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 003e5a0c479e16f06b7684a1b82543aa941a5043
Message-Id: <179269433603.110555.12768344848929444879.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:38:56 +0000
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

The pull request you sent on Mon, 19 Oct 2026 18:15:19 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/003e5a0c479e16f06b7684a1b82543aa941a5043

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
