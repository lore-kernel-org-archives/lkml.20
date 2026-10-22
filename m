Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694344;
	b=LhSMVXEin4mMb9FYD3XkNAP9u3sN2WpU1RkQFIdWcZmpQdx8+b5Cne/OMx0jV4Cbhewk
	 GETcsbBmtFNdD+tcfO22JrWuPxOl9k3CjDeBwJRtRbUzhFkbjCfoiwLxf8IY3xhT7mp6C
	 Go8j+Wt3E/fvavzOJSh+7Y2Lq7C7totO0hoqcSn493X2Jgs81EUQs6d+vqbucmmW1Y9g6
	 c0/ZY105tKslqi41wGanyisuvMAZBYzxQHQbjHOoQPaHCr9FEgpDvr9pGX8H2MykCrz4z
	 ZEeYXUqyWrwOSOiTN5U1hrLvxVS5unEdvKoTFsO9G5gMUO14HMzwsol0iGttpMdNVAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694344;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Xi19eGrhLZ0QSJNGSZ1L0rrP8jfXhDgJaWJMefMboks=;
	b=Y2zF4mfbM/l8XzQ2kAz4QmWCBrIPIWoPno3CYr+ceDusBTWUMrPyvpj/JEzTTlzR64px
	 D2eU7hXff9aacHsVv+VplL7EaEBVDWdDTwQqWJH9QkHWpeFD2ailH38uygU6vi6h/9z4b
	 Jxo86Wit+enuB/XAUXm/1W6gAwJQ9wxLrNVYaip+/rqTyoxkzV4hyDN8k2S7k5N6JYPdL
	 vdjIVDMYph1xnSOg/OelwV7hwEBoQlw8c+uXmiCR6XLdhgE8z5M6Us2ZheE7v1Bu3ce6r
	 tmM0Vk8sZwJ8FoGwso82Px8p1i1IIZqSUg168itxskwT74O5u4fFTeCj/AkgrPZBXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaXKhKbE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3B606B42F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jaXKhKbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4061F01828;
	Thu, 22 Oct 2026 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694344;
	bh=Xi19eGrhLZ0QSJNGSZ1L0rrP8jfXhDgJaWJMefMboks=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jaXKhKbEz9mTIvSGdN8izDGlX72I7Lqy/heRDwo7e+NyZ6Jirjv8hO0ajpF8gQBvh
	 YNXAOfE/DiLwTPEwk98YGajzhwTj29zLGMLdOBsL96kQ7ObvcyfTjXhmeWvBjf/bTQ
	 2M5fnWShGgya2xfk0PwkZiJFp6Dys22By3Z1vk983WCI39EPBLbH9MKgW4ZaNOWZwx
	 Gx72cgY6IAFg00NkjDRBJuEANU6mVRsbA8bfjrOxdJippFuwGSbOBaDSfSB7aFA6OB
	 axUh1Qrvz4xrqj7tplO84FGcwFJYnE+7uvvVxXMHX3C+w6R9z0W6AjlkG9ssCFkfLi
	 vwgIDomV7q3OA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 443BD3808222;
	Thu, 22 Oct 2026 18:39:04 +0000 (UTC)
Subject: Re: [GIT PULL] regmap updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
References: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4
X-PR-Tracked-Commit-Id: f52260f49b107fddbcf7c75f9cf2347a5031f0f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2dee91ee94eec85d09c13c7ca83e3005906d3732
Message-Id: <179269434278.110555.830634304810571529.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:39:02 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 12:03:05 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2dee91ee94eec85d09c13c7ca83e3005906d3732

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
