Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767741;
	b=EytxGkjCFPRbmC1Dxwy4mIdWEgwphQ7HzPpG5O7717FU5pj2KUf6KGh9Xz9QLwF1Lv02
	 wh0LbRt7GBI/jkh8eTNsV8N1I5BScQwcaWaCFuqAjN+X+Q+MASsfsZ0xOlrUketLuLh80
	 Tj/A8YwHHrKgcil9JED0dOk0prV4SYgn2dbuQeBL60MsKNh4F8ARrTQcqZJGMBz4nxDdj
	 4PLZ6KNqxTEVAL6xVnsN8noL810t4vwmW6au5SgG8+6oE4/W2Zag8krKK5sD0GTQaLohw
	 O/Dpk+82McnLPxF4Cs3gkoI4lMkI8VR64Yos58JEK4pWpkmM5tFKBxcgMS1JbLjIQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767741;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=aXEWzZe6OnLHlf8VjTALCLu1A7VUqMKhDTtQNvf/NyI=;
	b=SKHwt0wWXhjSjT/5C3WgKYS6ZmFX0pKQazvVRUt34a1Dec6H0weXGgj9tna4ufEBoNUQ
	 nQR3e3NLnTJFj9fQuiQ/Y5tzfDNL7PDOV+pXrTdlEb6wV0wcoJ2NbNAIhA0hJNKC+kPip
	 T4p/pbx1efspEv6Py+TRUYKp5y52eTvtvjGPzcq8MCv5hgFqgd4bvN9mrbEd7GYhkz36/
	 DzfbaRsmCeuutugSB2W89W7fcSs6BdxeaDUx4uvc0rBVWsYjRYsE96Ykr7PhNf9gMcy7x
	 AukNie6olTTTYOkq54VK2+uGNgRbSNvoQ/2/zplS0pGLiy2Cg8JaJ+mJ6VX8oc/dx1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0Wksski;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D756606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0Wksski
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0747D1F000C4;
	Sun, 15 Nov 2026 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767741;
	bh=aXEWzZe6OnLHlf8VjTALCLu1A7VUqMKhDTtQNvf/NyI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J0WksskipE3SIqYo2ZaZlSFptKQyfDLSaxMBWtQB2BDDpOwM3QS/f8sYTSmqxOSJx
	 55JO2lKP8Aqkbvwc1IHYuUc2iY7iXYD5KfYzLG0VeFXFulMsWIYQSJpsw9pvNqy5zl
	 Dxb+hPQh6yYdsVDAoX/KNma1YM/UMauGLBFhQg8mqSRleWBB4h2QcJY4PdiHwTzKzA
	 z5C3aZJKk7CBZkhDwKWqL0DmGFZJYqXzma1zmsrsU21nYAG5ItIto/kVK644f50nqh
	 njVzCjlunow76K8ZBW9e+kywlpbf+6qvzNnLmCoxevG/yl3GfRkt3Xc0JAk09m4HEB
	 snco3NI2X3lSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16F1380822F;
	Sun, 15 Nov 2026 18:35:40 +0000 (UTC)
Subject: Re: [GIT PULL] kexec: MAINTAINERS update
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261115050200.1847508-1-rppt@kernel.org>
References: <20261115050200.1847508-1-rppt@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20261115050200.1847508-1-rppt@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-fixes-2026-11-15
X-PR-Tracked-Commit-Id: ab75132e99eb0b7dcd3a1882e35519f8229a669e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfac855a820c3a32219779e4fb44804e8f81977d
Message-Id: <179476773966.2691368.5009607276514482536.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 18:35:39 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 15 Nov 2026 07:01:59 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-fixes-2026-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfac855a820c3a32219779e4fb44804e8f81977d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
