Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555883;
	b=Nq7v/vywOSOoNRqSLKwN2Z1Q9dK2KxE5Kdfj7LtFL8lgA21k5UcNRNaTOh7CUN9b4BD1
	 KMiGnY32asKb5PzGd4Zs9CvX8x7bbKCq6y0tYwO1D81k18VJYk41XbphgJPvrTAtvOPCG
	 JVXHjHpVS5CCmn2yiti3EVIasUvJxSWzUmA0Shrf1YyuDswsXdlUMsZnUUfqBkIRRL8Kn
	 cZjUNTuUJZWUUzKrcMp9FJdpXpcoegnaa36v3s70psinOm6Qt7UQ0GwW0ElS5dtIgihLz
	 UEqGiEMQw/i2+r3VYTH967alWNgwo8V1+cUcth71yOxDOoV4w55Wn/meDUzhG/AIYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555883;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=zx5hwtFcc9XEmCpg6WguqJkklPP77se2QUPguqRflqE=;
	b=pNLFvcQPbaEiETRrU+o3B+R3wXdvkTmqwmcuWhhAtnkFS8pyrHGrJQrVd5PYUuIjT+lW
	 dbsfJY1pkYdHIx6c1csJK1V3LbCoR32ylTUty5OXHALa/KFtAZp0MgtDO0GnaYdbdx2qm
	 F32skvgX3U2JurPLoWkb0+AhGyQt+4I/ePE4lnod3CqLo89uN9NMhskxMTsGgoGm83bA2
	 F/WailB0dZMZn2W/dLJwPsAOhUtH1LI73GYAIID1/T22Pq2sQYv5IQ6dNe8u3OFtRj0Vu
	 dh6U2WMiSCh2//Vc+pg8r+wGNfDvIDVflMjSCz6Y78uroiNHujZCfPNgoJf3RzM1ZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J+eV1/us";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E237606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+eV1/us
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A70E1F00919;
	Sun,  1 Nov 2026 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555883;
	bh=zx5hwtFcc9XEmCpg6WguqJkklPP77se2QUPguqRflqE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J+eV1/usBwpUMPtpxWdSk+nj8IZZ4xo3dagHFb13JgkMKzCxy00uG8pU2BhpoxJIv
	 eEX3KAByAObikgnANkaB4Rqbwud+8BiVZ21HPvaM2mhuPdvicSCcgec1ZnPGWXeerN
	 inRjWX+QdCqNMu3Ob9Lgf/nUKHX7BbaM1OPM8gAFJVv7YnkaMpMSvt1OD+jnJw1/GE
	 X3NrgdWdv4xlsZTUc28KTIoNrRNS1ZFk03XZNIXbfhCkJBlg4/7cwFxQYToZOcZZIw
	 xvrEG0NQL3MlrLcigUD/NFtdtzRtQrXw3pmG4huMVeFqwXGgHJlHMxaTFozqf0xJyY
	 ErNJ8yyl9Zz7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401BA38003F7;
	Sun,  1 Nov 2026 17:58:03 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <undine-1793491210495917491-179269aed50bb5fc@undined.local>
References: <undine-1793491210495917491-179269aed50bb5fc@undined.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <undine-1793491210495917491-179269aed50bb5fc@undined.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc1
X-PR-Tracked-Commit-Id: 278b2abf660a3e0991eb9f16f11bd9e9514a286d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbaa26615075e26ab54e0e8afaa10860867f75fe
Message-Id: <179355588186.2549645.3389242672798830302.pr-tracker-bot@kernel.org>
Date: Sun, 01 Nov 2026 17:58:01 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Avi Weiss <thnkslprpt@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 01 Nov 2026 09:00:10 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-fixes-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbaa26615075e26ab54e0e8afaa10860867f75fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
