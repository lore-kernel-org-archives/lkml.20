Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13226381E96
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321131; cv=none; b=G+mZ1LwIULEgEUKZ0LuXQ2xnhMrBdifc79XhSVIOIZcteZse76rFy3vm2SOoOf0KyvOfFQutNOekU8+8vu1Rtubw+PqeDRI2TISAzthvkoee5eRzGAe5qv3/9Imn1RsjhAFzFEzZCTTB092a6HOFYpHi+AIJSRd53fZt7kBvyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321131; c=relaxed/simple;
	bh=usN0KDjZUcW9Qyn3FDv/4h8Hg+vavGz9xu02vsm9EjI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M2B1QKRu4fFk2tkvl1aqzdd7hRq9at2pwuc2QZCRnAZIVKs5yyKOe4p+jHYb7Y9ClrNnmldRy21RRbhoSqJs4zfp1Fz5i7rbqexyOcbVrPVfXYERTa+8aZYhAXORPOk8pibdCMtZVNOgXUDKcei9Kit7w32hjgOBByLjcGvRqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VA/WJU43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VA/WJU43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E630C1F000FF;
	Sun, 13 Sep 2026 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321129;
	bh=DU8SZqQt2KiHDcNqLVjfio5zLax+LhWr/ELsNsECTqE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VA/WJU43ct4bbyirvvEiN2s2t655TaglRNdjzO7GtPm4CDb5BiYTNaWISZok/pbW3
	 1Rz7Ie9dcRzEgriu9jh5JJgF7kV3DfcKfhTTpe5d9FKpNYGSkMMf2Czl9ycfzjmvnF
	 MyF1mD3fpNroMOGwL9Hy2XGMJ/MDQsBc2266+wBr0fJpf1SVCe76Q7Klwwdgzg43X/
	 V0qyCTfaVN3h8d5bkmTfRa3eOmjhzCibJbNAVfrzV97CQkErr2uMPVQE0wN8cY51Jw
	 S0PGV7dn7L6HExh2g7+45qUscCnn/2exNMZbaKUFAopnfGF8lY/DTDhFhLmZfWvc8x
	 +ouyhbW5YtZvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08F1380A957;
	Sun, 13 Sep 2026 17:37:46 +0000 (UTC)
Subject: Re: [GIT PULL] objtool fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqZY5nsYd-4pat7G@gmail.com>
References: <aqZY5nsYd-4pat7G@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqZY5nsYd-4pat7G@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-13
X-PR-Tracked-Commit-Id: ac323c9467092479dc1e5bc138c9abbe015b0069
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: feb66eea6b095e488755052e96f1e0d8b51e42c4
Message-Id: <178932106545.3902938.2111900974947624971.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:45 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 10:03:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/feb66eea6b095e488755052e96f1e0d8b51e42c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
