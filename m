Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794179534;
	b=qY+fDzRB3oNaP1j7ltlQcSSbW+Xafi1MzCKASQhJVtmtAl6q7I0ahLw9w7+vecKlFNIH
	 KuXGhuQH731LS2rKZguvW+TCCAjrQpXxj2qxl30BOFlCVPmCPdse1o1capwwvXsrjHrBy
	 8uLrLlYU+00dZJTQihnsSrtIOqEbjIzdPjn3dZprnMISBUe6ZOzLUYs3wZBlbxc/oF65+
	 5UaCBo+xF7BgFk0fIm9sUkSCHXqZ1jSNhRiuHSI51mxZ1j4OmJ57zMZOzp4/VnWmAuwDl
	 i76+4I1Y5RFA5JJ2L4KDMfolAKGFTQxZbQNDUSWH/Cb7opFChAMXgjC2uBnUzXMNnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794179534;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=0UkMIMefIrI0LzdUfAnYyhtRoKKPW1zW0p+XqV3GHKE=;
	b=LNuLvpMhVT71MZm6Nd/zIwYtXkkCOn6XNCMRPKVzktAax4OFjOg8R3MxBzeEyAXfuf+H
	 Y9+Gv4C8UdtluMsfE9ZtQ1JIGkgcLQ9TGhPv7RiZL/Wq43sdzw8YGdLzXE0RFaFOD2/QH
	 yu5mnUsNB0jFy+Ru7+nAxPjvNfzQP2tDAgo2mHGcjqCGkS8GX9PfPa1rB0nQEA8Uy8pZJ
	 CUKSO6aXa19JOKoKVIt88Hs14fIO+nFf/114F3Lnz/EDmAhY6P2W6WQMuce2Tt8cwC/BQ
	 C+apdttboGxgn8nBwvEeqenz8A198rP5CW4H5fF61FeQE4HsSQiaDrKKfm/MM9vIkTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X019dOhZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5E9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X019dOhZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35241F0089F;
	Sun,  8 Nov 2026 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179533;
	bh=0UkMIMefIrI0LzdUfAnYyhtRoKKPW1zW0p+XqV3GHKE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=X019dOhZRXcuKsHw4PNsmr7Gjb0rt73QlUp4SxM073b1htUPINJSO+Fd1zGX201uh
	 rvn5tQ6ohWZf3Q/tZ3BuH9V3NK0cibtJC7dSdwfbe+nUmjaChBoYxTOiC7KmJnKYUz
	 O16/p+/UnpHAToxJTW27tIfZC+VywtPP+xLxk17XglbzLPACmj6DfTVsBf3rEaSfOi
	 ZOaocXyIUYUqZnaZ2Fye3i8GTpM+qeFESgLhoYES5ohycptOV7bmHOh3SYKY26SSew
	 zFCVtU8SCBEiPBfNHQW4ZfIiCJoVol4ykvWm+9zeZZ4z48lmzqK5+EwO/HDvJrC+eA
	 HMSEEha/CUEgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D83CF380821F;
	Sun,  8 Nov 2026 23:12:13 +0000 (UTC)
Subject: Re: [cocci] [GIT PULL] devm_kmalloc_obj conversion for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202611052158.614CB01@keescook>
References: <202611052158.614CB01@keescook>
X-PR-Tracked-List-Id: <cocci.inria.fr>
X-PR-Tracked-Message-Id: <202611052158.614CB01@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/devm_kmalloc_obj-v7.4-rc2
X-PR-Tracked-Commit-Id: 4dd10fbbeb9c33709edc89916e19c03c780a0751
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0d8e8de8bcb1ef7b749033b5af5518ba8df7bec
Message-Id: <179417953244.1902725.2337585856363821544.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 23:12:12 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, Kees Cook <kees@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 5 Nov 2026 21:59:04 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/devm_kmalloc_obj-v7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0d8e8de8bcb1ef7b749033b5af5518ba8df7bec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
