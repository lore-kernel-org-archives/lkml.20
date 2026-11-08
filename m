Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167179;
	b=DeluHlXqkmOJqAvyHk4zYNW6xaI1vhfvpMFIXzfQTHcYSDPvuzh3pETpKOZ+0RgJfY6q
	 dvpLRyeNObR6REq7Hx8y8eh53F/k/nYmNrWTofsO86hHxLGYDLu/BBC8nQDvnK2Z7tfGZ
	 IcLCcOkvRrIPJfAwNDr0ReDRlVeXcrrgCLBqzDoWKZRJNHPbtEx3UpRSc2ebwNsmkDibx
	 IwyGSs+AR5RQvLJmPmwfm5VyfmV2sbC3iZJDsijpr1uob1eit6eKUp7G7kkAHZTgk72Jk
	 I3xTlKZvHfDhfn/X56z+lFLE2FnC8phauAoihfUVHjIV3Jq7kVi0eKH9L8B6iKjKHFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167179;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=X8wnEtHmu52Od5WjNWhGnAoMf2Z1uw6uH+cidA0yraA=;
	b=1tEth05oySPhAb2UxsJvTbNUk6h83Xb2gM7jdVwGs2doNBdk4OqMKhEqk0tkd2HO4lLG
	 EnnpV3PhiWDKTTP+wCe6kjJ2qag8ilOTOujj7PTo3GMrT2z0hlzGurPNOriR7WPQXFDvm
	 J3VmwIGA9EmkEI4pQoW5Dy0A9cTnhLqz4+p0eUB4uvJtX4D/etwziBbWCoKOaWjlCZ3hq
	 xhLzp4EaZALhjH81m5wrx0YtPxQ9Z9Z+/UBu9oPp4awKuP2pD6632C3bpkF73d4ygRGuy
	 ALmJM5YiHHIRArLCdv7fbJzvRss5NPEuFKqmsEgczmWxfRueQ+ZSSpndVoicgxkyCXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3B50dI3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E5606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3B50dI3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E195E1F008A2;
	Sun,  8 Nov 2026 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167178;
	bh=X8wnEtHmu52Od5WjNWhGnAoMf2Z1uw6uH+cidA0yraA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=A3B50dI30QAtKla2qta8lLvWb4mL+4JTaBIHwarpRqlDKch5o/ZinHyg9PjuAzvN1
	 Zn3lGslA8WNxH1SrzpUqiRfIQU9zQ54bGzIRktF3/2F4c5ex0buOYWMqB3IuTEa3uy
	 egryx436hl9zuRphFx9I1zx6SbZSZcTLeGFQdHy1KBbRCOBeYjVu9eouI8WdacBAWy
	 H+5vS937lLTae5gnoEjHhsMwWLwz3tZzxvjBLPi1RAuEPb3nFLmcOt8thIFNrXW8my
	 p728o30vX5EB83J4bVSxiuB3TGp9m1e+KgLa95lZQJiV9WeShtxN1Q+AZLzYGXXw90
	 tJRz6XGBqw7gQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D820E380821F;
	Sun,  8 Nov 2026 19:46:18 +0000 (UTC)
Subject: Re: [GIT PULL] locking fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <avA64Rq3KFJw2g5L@gmail.com>
References: <avA64Rq3KFJw2g5L@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <avA64Rq3KFJw2g5L@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-11-08
X-PR-Tracked-Commit-Id: 408b129aac48b574c0c9d11137a89eefba825d5d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d1829ebf4ad888f1b73afee0f1d6e41734ca328a
Message-Id: <179416717736.1685596.17895632705008477606.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:17 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 8 Nov 2026 10:03:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-11-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d1829ebf4ad888f1b73afee0f1d6e41734ca328a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
