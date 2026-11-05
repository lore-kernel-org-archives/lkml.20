Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914666;
	b=yRo38yjJMNOC8nm14Kbr4HrwReHoSj0UJLls9pW4ThgbEcXqlE6FqxjiD0NwbObR3VLZ
	 1J64mr+OhrQ9mxPSO62+pZVJM/9adhG9IoFHZVWOQaG/ZoKV4e8kQrNiSPGZWv1SYQnJv
	 JL1YKngO2qvJKjAncpySc5LONA8xb7feDaOK99rokKs0m2+lqRPwgUUWzRVNJVfe/U3dR
	 cbVPAuThhVB309BLrAvBe6L9N4WFqzoUU/2rPZkFmmDaPUvM5XHMgHmeVPbYmsSyq9Os3
	 9d3SdT3m0NjqmkhGsJEruI59yyUbu0j+2bruhDiAw/FP/7Na6l95Ouq7CzuhArNq1/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914666;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Z7MyjlK223pIL18T1qkoDQuJHQwQ7PjffmCPYkwoQRU=;
	b=CYlsGJz5oxmL6nLYUg92aEmZHpp+8E0R6a+He3OE/nejdXHBRBXgpL0kMyK1gbyhUX34
	 nwQ33KAlnyHqdsKWBWmXXqKI11WpEmBDNA1cEdMp/CFnL84xjOT5/2qZLIz1SbT3QKTwJ
	 e4HHuauZ4x05Vgx2W3+zQDSg9/4bXEk4U1pQHdsWzHU0WkP7ICkeftQCLJyoB8Hn4GQbf
	 vzKnum50d6vSFt6+NKOpCjjeMu0uk3Sfr+dzI/HO2UWAKSdPiaYu1AkTS3TeIs6VTqjhw
	 Cmc31BRvN9Af3CnhGwwsrGbsvIFo1tq5+59Wt6qdnTvRV0/gZW7VovaQXGYo7i8zf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVr2Y4g9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B17606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVr2Y4g9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30E31F0089F;
	Thu,  5 Nov 2026 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793914665;
	bh=Z7MyjlK223pIL18T1qkoDQuJHQwQ7PjffmCPYkwoQRU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JVr2Y4g9I2Uofy1UXMxVq0CmgTurasTa3LZoVOVvoXym3QeZWsjiErAUPokj6NZ1g
	 xcA4Sw4ttCqmyyub6NQT0Pm2H1A2KVO7LC5Y740L3+iKkor9HAeXKVtnvXCnd7T6ID
	 tOtqHDVrHZ4gXZudgJphXWvkvYePyTF0gZ+cPuDZU5jkGEaN2+VtWwtAoyz7dWSCWE
	 RWzsjMKZxIQrIidUeTtdr8cuORz37QPnC5BSRICZuRMhOsNpGn9EkeynPj1y0o2FB9
	 D/rgzRQTpAWWZXfqjEBCX6J4OJqtXrTIv+KffxFqXi+Am3myQm0v1qt9ovkYkw03PQ
	 xtvEFpe8q6j6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D8155391B19C;
	Thu,  5 Nov 2026 21:37:45 +0000 (UTC)
Subject: Re: [GIT PULL] Core MM updates for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261105084704.5703-1-david@kernel.org>
References: <20261105084704.5703-1-david@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20261105084704.5703-1-david@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc2
X-PR-Tracked-Commit-Id: 71555ae8c7572fd99158013ca2e29187c5d2508d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d68ce4e71248e1ff5af9654b407541d9260b3ba5
Message-Id: <179391466439.190890.2508388451772076480.pr-tracker-bot@kernel.org>
Date: Thu, 05 Nov 2026 21:37:44 +0000
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu,  5 Nov 2026 09:47:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d68ce4e71248e1ff5af9654b407541d9260b3ba5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
