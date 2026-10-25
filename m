Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909175;
	b=BgeD+TuvCp2Pok0rKXyNSkucfNhDjxxN27HxeCsmAGlrR1IuWXDQK4R9M0iQlOmO62EU
	 tOMBDiWh2aBEA9OKw2mbBXQUUVYUwtZzx8hvY2/arBY5LIHqfiiYnnwFghZP+tnNg0mmh
	 PdjIDlh6WaSarwrvrVzQ6zqUqESeWgtR/njCDhCkr/oXzzxN+oM0CRvLDAGI5I5aW55UK
	 MEWQjcQmC3XaYPc5An9r4lzAllCU9ieMIfW7jJR2pI8nYfWMNXMXhOmTzbpwjkFYOK+Bd
	 y19Df7C2kP2VGl8sK2mS/3KrjjOfG7/O56NW+AHSftbkgD0hfiITP1kMGb5wlGrj55Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909175;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=UCzayJ7KuVARexn7tF2Fb65oHobceQMZM797d/Qk6Hs=;
	b=NtmNlK+0Ob/4uknXJFsdsc36Jdrkash1PQKuzOCD5Mwhmy+6mBKWsaYenpJyHElZJ3kP
	 4qV9rjM7LTw23mg0G1crtN1Kl+erkMsHriDrQctCvLQZIFG77FFU/vQoFiJHEDyLzSY8C
	 hfjgSAy+megbYC+hskMfQ0dHMN6awCRsacDQYymBMP0/ZpC7FDjSWDBC1WTGcrZ9yU1/e
	 BO9gmY03n52Xb42G56bX9i0a91ukJ6ygQNa0VxjYRqfFFxCc9ZCzU3UqbLZlxTobQVFmo
	 2SPPbiKbyPEgbEywLcwjpeQ+EfmpjG/gmqxEDOoq2CAwc7+VTXebT8xsWIOKfx3DB9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBuMZrew;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D4606A322;
	Sun, 25 Oct 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBuMZrew
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B1A1F01829;
	Sun, 25 Oct 2026 06:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792909174;
	bh=UCzayJ7KuVARexn7tF2Fb65oHobceQMZM797d/Qk6Hs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KBuMZrewTAcIyKzanf4EwXcEwYWnacbhZudOqpyolLo6coSAbPvMSZrThgh7p3HcT
	 rcXUZaQbE52KeEbZ7HKOU15uoPqtElHkYEs+4CGxp8xgqAdnIMhMHgOVYtCX9RWoiC
	 uAWYfr2JgxLRcmJmQSQcRuJrIblmdNgGkQSpCe7INKPE5da7Ub8GRcramdzg3tkZq6
	 vRSZnnmZFEEx7+rKUgU75AgXAM60fJXUNuBRyGdFHwHUXPJ+WSeMeAMQmBAzkpk+0s
	 mGMpVrc5pGVVsrIWoc7IpTrB+F0538yiWiJonyG45FFnUumFcb9Eh7VRxytMsUnZHL
	 Mx3Ebap0HbWFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 81576392ED67;
	Sun, 25 Oct 2026 06:19:34 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261022195741.GA3409202-robh@kernel.org>
References: <20261022195741.GA3409202-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261022195741.GA3409202-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.4
X-PR-Tracked-Commit-Id: e8ff9af18e80279b80cf7063244db91b12f5e27e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21a7f44fd0765fcc5194130b28767786eba1d1e7
Message-Id: <179290917312.2017309.17082223538602703719.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 06:19:33 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 14:57:41 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21a7f44fd0765fcc5194130b28767786eba1d1e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
