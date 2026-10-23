Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717818;
	b=Q2cXWhKOmC502vQGeOfkgEL4DpszXcUzL2+aIyYiU5BZiAEREsLWZPuB9mTE/6jivZao
	 XI7Kp3KR1n/ZwDbjLfeCowkU/zzwWneazfutj1ZNEWTjr7L2LHKgX4Q/1M7Yn1oLNadPe
	 83XfEpIBKREn9YEG6dbLVNabt/b2jJYhxOb91FyaNVMHvu3P19H0bDZJu30T+Y6gjEU1+
	 XkNdoNdPTGjcO31fwS8B0ClszbZR1RGVx/SfCBnEBqSpAQHw+feVI2qS5GTrUQsDjXD4c
	 sJpNpLT4yFqzyir4logdMIeNmDBYm0dL02AjNbLSa7TgxBF2i128s1DJ/T67DhIkGJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717818;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=MAh2/Ly9pTD7uCfK92G/MfECGZZNJW3FX/hI4wxK/1Y=;
	b=4hzNi6btKPQVIZ4prHWCrHHoUVQLJ3vknzfSH0gwf+XgZY0tkTiI3dBpokknNvAn+Gfn
	 K/obwU1tiowWbh3aP45z87+ZMbEn4cWhV9rOE5L0mAMaW9koxbHBX6aF1dvyi1rfYrRcf
	 /4lraqBEJql/hBxtRRBgzVa1WcKQri6mO7XcNTwM3bFBaDFkXbixunN23re2roMcWeeW8
	 zBH9oewpCJOeFT2Vm5sZC4HnWpj2vlujkz0Em7x2E8jlCKd61qUFMqdMZQ6SKEsiY9VKb
	 JzMh2FItwm31VXDVxBPc6zpkWRtcLxz75tuKW7f9QWbltOQ9BDFe2wbpWpjARVgEWmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMykMqKR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB2606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMykMqKR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9448F1F01828;
	Fri, 23 Oct 2026 01:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792717817;
	bh=MAh2/Ly9pTD7uCfK92G/MfECGZZNJW3FX/hI4wxK/1Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jMykMqKRqQEOYIywdHc92jAKm64sd7EIehaaba2yPfrMrvkJDMnoEeBQRqVuxo8Qq
	 +3/BRz6qvRtugYOGSZr1P6r5/W3BrKQ7b1LmdeuEnJXWX+wJbblaUipxKh9QVN1gng
	 kBmL0fdNXRgPuncjwwI+Ib5nAsDnJzBHeYH165lTj2aQYenmoHmQOvCTWN3Uo0hSw8
	 gg4QD0qyR8hjK3O1C/oP4NYyWZ/cBlu+T/4z+2ytz/+UiYixIojvn7y4qjYf2bWSKX
	 oVKEN3U0SMzOF74I4Dswp9PBQjDh+ET1BG2/h3xG7kR0o07yhs7VIBFIHHAei69DXo
	 HDar3w2ay7aSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 81FA43808235;
	Fri, 23 Oct 2026 01:10:17 +0000 (UTC)
Subject: Re: [GIT PULL] pstore updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202610221048.DB2F64A17@keescook>
References: <202610221048.DB2F64A17@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202610221048.DB2F64A17@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/pstore-v7.4-rc1
X-PR-Tracked-Commit-Id: 7c756181175d50200be487affa905e973f6cbaf5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 075e3396ebf5dfd0030bfe12642fa82cecd0c6ee
Message-Id: <179271781637.280548.2362110498257468340.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2026 01:10:16 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Andrea Parri <parri.andrea@gmail.com>, Jaidev Shastri <jaidevshastri@vt.edu>, Kees Cook <kees@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:49:37 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/pstore-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/075e3396ebf5dfd0030bfe12642fa82cecd0c6ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
