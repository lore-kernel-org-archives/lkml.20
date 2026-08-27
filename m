Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA884D9915
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856886; cv=none; b=JlAPOKGOz7cPP6xeetFwsYpj+JWuqCozR3OFXiUwOWvH+cXj+8gP7OSZhNbVuTaZGHVBMyV6h7DJAjEcX9K9X488NG9HAxITx1v79g+sA9bOOV6U9V3Tczi6ctieX6d9DUA1bd3qMpshsSb/XHhAoS7N+zirAjBrHNw1dIY+mT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856886; c=relaxed/simple;
	bh=SGyQExpDQ9xDvv6TFyWJmX3wrpUPkLcrGOCou/E6B/8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=i+r5cEyRPCSYJlzsFQyhXOU6Rcjy7f9cFufFbhJ9BajkH3cDNkfEqUobKdtkV7ou0nL8UkYy6O4WMej48fhPz5vzzVRNNg6ao3lxxMsIi80mCsSzoHFSjYauIJ7BNcAvmVKCR/GzP0xF23gs3dXtqoX81OA8Pye9y4aOcPGYN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/tdlj1q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/tdlj1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624921F00A3A;
	Thu, 27 Aug 2026 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787856871;
	bh=k4VbrbrnCfXkspkk+C2SL02vmLjMJteLjOK/LPr1EAo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=U/tdlj1q+RWmvfe68B108Ah6LPzkF8QfTUK2kC/iB7xj1WkvUU6ClKowcRY9dm2+k
	 5qXRpdYdqDMeSDvWH2Ln7Y1vfhgXIBWehEWRNZY6LDfJXu4Bomb18qBCaUCFDRUpUg
	 kBP3vrc6IJ3tzFO6o8+B+/v+CHcRUsAm6D+gDCifdUtmmttyJ5qLTF4EQw7cc73Kdf
	 vJOvt+Pj3pXdQqSZUKaQ5Uontbuy7NnElpNRLb7bl6mjVOXsJ8CR3AJj5wTANYCZtv
	 lwDP9nYjx3fV8Twx2DRLFUOAdt4r2ohKvTfS6xXm+6KUui+1iY0mgr52mTzGKZeOSK
	 Pt2/Egp/13RCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198833809A8D;
	Thu, 27 Aug 2026 18:53:38 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260827124615.GF770273@google.com>
References: <20260827124615.GF770273@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260827124615.GF770273@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-7.3
X-PR-Tracked-Commit-Id: f8cca63a0a4f3475199d9ab7f86782bdfeb0744d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7cc2726d4847c48844eb0ee16f973d449260f248
Message-Id: <178785681672.1798634.3116142110648992205.pr-tracker-bot@kernel.org>
Date: Thu, 27 Aug 2026 18:53:36 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Aug 2026 13:46:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7cc2726d4847c48844eb0ee16f973d449260f248

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
