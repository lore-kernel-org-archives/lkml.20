Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2692F30
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940136; cv=none; b=s0Gv+bGi9EQG4pDGH0qKZztSBwTIKyIHKQgGpzrGZA27q302Axr8B0YHNDP0DxRdm+6z+rs4X5Rn+1X1oFklfssAPEvQJ6H87ZjTK+aAQ2jHmP5JxhmqYcTUYFPgGGDaIc8wv6DOqzSX4SVml8ACBhL1ICgBAEAYgFZu9+X7YBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940136; c=relaxed/simple;
	bh=hBiHzxJ6AlnRntrZ6gyGz5pjOCXcH7/BAw0cNWAMAAI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FGAm59SYNZAbBvUA4ZnzzowIiJ2JvTayVDNEK1Q2XEilwu9/YOBkpIL+WGg3GwRJcL9J3agTQOpRiSP7c6TGFG2w7ZHlnFK8wvXyUbSKNjHCCnOKvsEFUcNQMYOs9d6avn6GSJ7jkjfFWr1vu4M5wT3S0m0NHTjJvmE/19OalFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ld022I/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ld022I/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458081F000FF;
	Wed, 14 Oct 2026 01:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791940135;
	bh=JDIjBm4G+yt/N7BcyKFeDYTq+Y9BOD3BwVaTWod/r+8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ld022I/NQDtBmMuruFrzaIPPQrwPVAqLsdSKRlGxqfGlBY40l4oJnNXQ9tEDZulNL
	 5bwz0i4aoN4bMseH92SlH+6h96xgeaoDlvOPHdk6+k8JkVfjwPm9TTSMrBOZL9RJaM
	 vGmm7WFbYxV02HX3a0G7tfEukRZ2O6bLpxnGbskM05JOZHq4Rvm5FLVf7gvpjRrKEu
	 B6NDR5xRxh0HNp+9XwxanppCxIlxqqqV/mI6LBrXlIkFzVutPcXdScSQ3OJzaeMqGZ
	 j2kJ8f7PwVOuLdPjHGHIVW7v5toQREX55OOydAovPcb/gc7LVekzEyMcPhYwm7o/aL
	 sKLO4K99VJtgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4A139E8A57;
	Wed, 14 Oct 2026 01:08:55 +0000 (UTC)
Subject: Re: [GIT PULL] NIOS2: update for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261013234753.1733745-1-dinguyen@kernel.org>
References: <20261013234753.1733745-1-dinguyen@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261013234753.1733745-1-dinguyen@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4
X-PR-Tracked-Commit-Id: b963f2345fa20417401c51a69dedb6a58eea33a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
Message-Id: <179194013377.1544263.11239174546741299138.pr-tracker-bot@kernel.org>
Date: Wed, 14 Oct 2026 01:08:53 +0000
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: torvalds@linux-foundation.org, dinguyen@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 13 Oct 2026 18:47:53 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4056b3c9d3c92ea45955641dbafeb9b960e146ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
