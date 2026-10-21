Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543275;
	b=QNUcj0nFpoLlY5uwZZE88HfQVlEdF2i/rYMYvw6o4/HrwiPhzqeqZ3Ei6WqpP5hlkSpF
	 HAfWHlAT0oNdR8K6TwsBPm9+Np0QSAuo3+rnhN+WjCaQBDwb9kmTX5HMCwC2yk/6NTWfu
	 68WpRNRvNTWc2FXMEsBxxkY0cP2IklXqar5WssBqpSw3PZ3eBiFLAYDb2D5Rd18VYAT2g
	 32iP5qJ+pLZdzMON+qtn3oNaqw8NVcwH7twPfFXoy0szVd2Li4rdZsxN+J/yFFXe1PKgJ
	 VYzn3EkCOeynV1ugpvZkH5eD0S+bZhUmfCGKmPD6HAMzX98TvBdQEZ8l1Av5ZlmzsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543275;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ciyslDAt+TZ7UGt4BogxbF/cRnwKu6zGiIwhiRrJtKk=;
	b=IdZuf0m2ZlOozuXjvyNtRgi9Dl222yjfToOJR7sLHi4Z358igqfsWJPAW0K9qXiK/2CB
	 LIsKsTR/86w5WUWyxTsQJ/vUy9f3l+dULpUWdnXkpdtsZrfldM16vj0N1X0BHaPs1DJLG
	 ByPdId12pFxeghhOrQD0vjRBRAQ5dK4aUnh7T8twD1qiA14a8aKJ5ZkfbHo4eyca/z7Ub
	 cYEZUsBu4TWs6HyMIt9UCFujn8nj4K8f788iqhHZ1E7Oartjt+v6Ak73DQ0sa+p1GQj6j
	 gKMFsYmmERYpuXNWsNRbeHiDh5uPc+Wor5R3VvOHoyQaqcTpIYz5YlFDifseNc5G+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5obs7Ms;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DF606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5obs7Ms
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9621F000CF;
	Wed, 21 Oct 2026 00:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543274;
	bh=ciyslDAt+TZ7UGt4BogxbF/cRnwKu6zGiIwhiRrJtKk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=O5obs7Msntimqrx2GTYzrz5Bx7kvsIoH1kft2NSb5tZ+f0C2Ld5HLSbAct2xjm94J
	 bkX3gGZR7XHr9p+lhMYWlyXVxwOXCZLYtx1Vhw2VozcSDxs2pUtWUOa7+16zrhq6wA
	 BbnGM9VtGBdPIGUPUeubR0hL7Tas6DeyGYEeUAJM4plWgzBaTEuh3zbwpMjGedalSk
	 sC6pcQ7xC5DxVemnGNTwuP/CavFaN0tlmTEUhQycnWxI9EElV9FnT+jA93PeFhIDrk
	 gzcX0IPRNc9O4lYNtOjt+mrRTODosNs3J0WTJzRTHoxn3AZwbE0bMviA0t3sUTXIG+
	 r9rtV7Cr+S8rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D3F553809A0D;
	Wed, 21 Oct 2026 00:41:14 +0000 (UTC)
Subject: Re: [GIT PULL] m68k updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019121317.669372-1-geert@linux-m68k.org>
References: <20261019121317.669372-1-geert@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019121317.669372-1-geert@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v7.4-tag1
X-PR-Tracked-Commit-Id: af32c3cb72529b14bfb2685bbdaa2b1514496b58
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6be53e26e8f9f2d09a4030339d1c7f653fc07983
Message-Id: <179254327371.289274.5731917532722577593.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:41:13 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 14:13:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-for-v7.4-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6be53e26e8f9f2d09a4030339d1c7f653fc07983

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
