Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884740927A;
	Thu,  1 Oct 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890685; cv=none; b=NT5R/6+x+GArsbHDyPysnliCmzqsTDNdYR2dVgr/ZqjZdVvpbWUcCdwzBcjgOGzjHlTWGWRLxtyuzJC0qrumSvQNeTzI7297XbZJFCZFWbGvnEXRZH+uBVa3plnKFAiLACFFG75e7N8XVIlKwU65zRd6QM2mSWsuy3cYaFBhf7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890685; c=relaxed/simple;
	bh=lGfbR0yO+4UhIRKjdNm1/pFQ9vbYcmXDCCGLne52jhk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=caM4mr7ePxuOYE56FJ66NrF+qVL4cOilRzqPuysnNM1NAQdjzSA78K4OySUPurvsS8zPd9Hd7fP+syP4I49LrWZjltKtfx9peeAVh/OXJF5g7w9VMl1eHerLZKfhFa/Gg86vugjISOsEPDSXXiA7GDzGlunKNGruCYSI/kgVneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ah71EH8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah71EH8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EF61F00893;
	Thu,  1 Oct 2026 21:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790890682;
	bh=dPN5oKndiiWPIbr2MVwqfPOLUEm0mPfAyvLKswV/p3Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ah71EH8GVPqU3bv4t8kfoGclSIOmmIeNCQ2Tx8W6rtxx/ZmphDmTnBgbJTOY+H59P
	 kMXVvsgmlEVXg/AraWiW9sHnTHzEL5QcqkaT4eEpGs2LB7kVftHMDPD5dROZxO6CnQ
	 0/6MsW0yHu4l/H4RkF5OSTE7s45LE5tb1zUfck8x5I7r0P+c/GrtSCK06fd5arKMnk
	 Rn8/Zl5YFO+dwWXk2GtISvKUQ6sEroHaz+Qxvuzn3RqNUayh9FjlrKMbNo8pQ1OHd7
	 WX3zUFyCWQx2IuNp2CafhZ1buf/DXOuZOhRkkTS+cC/AX00t9pLQN+Pd0P9rOhJuLF
	 O6qMWXPFzK+SA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45C03811976;
	Thu,  1 Oct 2026 21:38:02 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v7.3, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261001193546.GA1670288-robh@kernel.org>
References: <20261001193546.GA1670288-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261001193546.GA1670288-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-2
X-PR-Tracked-Commit-Id: 30724547b221e0e670ddfef140fc7d816b2aaec6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
Message-Id: <179089068122.3100647.16667550261988924617.pr-tracker-bot@kernel.org>
Date: Thu, 01 Oct 2026 21:38:01 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 1 Oct 2026 14:35:46 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce1e0223d8ad4211275c82a17ed6d43ab81e13d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
