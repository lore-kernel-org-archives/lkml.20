Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6CE49E5E3;
	Mon, 28 Sep 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593633; cv=none; b=nKxPad89L0USlrMoaNqdM7bQm+ZNOhJHe+xgplLEZoT6vKC5QQPd3UzbTizb2BxAUOtJdGHj4MuyU/1JaW0Ul6hne/LnRY91oTj1GHodOkIeCvuwSTLZdSWs5zokt1p7XuIWe5YsmgRb6FR2mvUt7hWc5rVordyuEaFfowqdJyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593633; c=relaxed/simple;
	bh=gLXFpV/UlSmNQkqR2Rdz3HkhcsW+kLh1NWeSv2ZMPtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hRWE7DLPTTjeuiy/rhoGMD25JDC58JXHUpVAI+1HIr7Jd2ZrvFYtGnZNokFGDf5/pnbTfsX/cfxMO/DXfd5Ykh1lpebzZQbkG2yb9RdbvGVycoxvLHuyOyutDLMFzndYGH3WkBtPmkBSxbGrZWn/ARj6i3CEpDSm/VkQ4sKQuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4SIJlcH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4SIJlcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86BB1F000FF;
	Mon, 28 Sep 2026 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593632;
	bh=g4I3kZoi15a0UkSM62MyWrUzqeI7cpQOpRjyqBPRNhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j4SIJlcHkEPoCUJ/YDE/y7wfVo7IsxbGB731HWZ952JGgoeObAHAtRG8UE/3IV2h7
	 HmjEp1hdFlpnsre6n800p1plp01zWxcGhkirzcHA9mJxt7Ri4DDmEa2ibEakajpGkL
	 v4l48Q7r6NnGd87DROwFfeNhrJeW9y8bvrstEJvYOywsck3KWLkyXLJiSCCkMl69oz
	 SxMNUpGtiMgc5P8LE2uTjQiZe0Eq7oNtaNXNE620tC3jCB79h0x+qpWa4goOhLzOzW
	 xAseDZHpAyr5HnzJkjKpN48WvB9jDlVaPtBZbVIxKQWbf2ZsZl8ESO0fpGGJu7qXDk
	 rYpm3M7Eq345A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260926162533.25395-1-zainaboobacker33@gmail.com>
References: <20260926162533.25395-1-zainaboobacker33@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: nau8825: fix typos in comments
Message-Id: <179044076200.2399152.9420532434537995352.b4-ty@b4>
Date: Sat, 26 Sep 2026 18:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gLXFpV/UlSmNQkqR2Rdz3HkhcsW+kLh1NWeSv2ZMPtw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqukpaVMLA3IpT/6No8hTbAYDVjGf5c5CP2ES1P
 mgKO4CqkO6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarpKWgAKCRAk1otyXVSH
 0Hm5B/oCQeLn09i5FLJ2DaFCkQG2Q2CzRXm4dibODPqCc1Fe+K8hKHp9zaZDZOZt/EHEJbWOb8C
 jbu6CXl51ss6PdaO1OqS6v4hwAEZFYBMHbmAEhDRooecbdBnAjwy7/AM6fM5xXse+4rYkDw9mBX
 Lw8tPZ/Ii7xMs6qO2NQ5VhYFdTwqwQhnioH4xBeqfGOdKA5nmm6y3qF5fNuxF1AJwjgA/9bWLLy
 E9dl4w8yMujN7a5HM/H44hDlyV/wNut30GzmsWDhqWF7bQR7Er30OivwVPCJTc1YBBY28wk01fO
 TrdW+TAC2y5gc7qhMPkSIlpvIOMzkKXbjnYoj4zR6f0Op09D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 26 Sep 2026 12:25:33 -0400, Zain Aboobacker wrote:
> ASoC: codecs: nau8825: fix typos in comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: nau8825: fix typos in comments
      https://git.kernel.org/broonie/sound/c/20b2f7f75623

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

