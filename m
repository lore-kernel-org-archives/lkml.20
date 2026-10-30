Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385352;
	b=eY2Pog6Bgjm0Z+oleFGVy8nDVrMQs7kWQlwqaCH31IS6my3QjkNCkDLTO1PKCTZKoyjv
	 k0/5S6UAaZ8Algfs9pNSMvPnN72OKQC+AUNcLEKcduSNxjS9GcPzgXzkQwkyUagibVr+0
	 5KINR2dqMb1ePoAoJztHPnRKyJp+dhqCeI1ebOSUtwNTc6gcBDO1dbFrLIR5FBhOc6SaW
	 6UcDbbgTDibAqNlZHUBEPMPo6/Nqdc4brN2JjtNwajlP90FQl5/Uhks8kesqso/dcIqMV
	 imMAfT505QxmgVvhu22nXQNH2rUB5HuW8ROXEuln9w0aPw25hDEbGGVNZv11bbf3+wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385352;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=dP3J+Yy1uoMdcbI7dKJBCKnCma8NS4Q8UPqydZ+v72E=;
	b=On9niMlB+dswP8so30bTGkp/n6Hy/Q3cSXjci1NkSGoF48xTdMF3R3w97JFfVaxpHAbw
	 YwCbN1DNbnAXhoyofOxE7wgoYDhtQ6qRgLhyah/w4d+oBLVKaWJvsXnhT2tTIfjtsSquo
	 S6f8gCsTH2Cr0qBpwQ/0j81wRty/vggYQg/IjJLzZKw+43gxVuXEZkqpxZ/sYJk+Lio+x
	 XJFBP6IYXr98o8zlUSpTVSuFMyuj6sor5K15pHsVEhybKFpqk15R47chxeE2BOOB/cfim
	 HyqVlkj8tqgyBllRt6Rx9rjpiUJ5dwKiYDTEx3qUeoTvcueHnat0Kdr699KpXuZ8Bmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ83gJeM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJ83gJeM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AA71F000C1;
	Fri, 30 Oct 2026 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793385351;
	bh=dP3J+Yy1uoMdcbI7dKJBCKnCma8NS4Q8UPqydZ+v72E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eJ83gJeM50dQfAhxEqJjcpvsgrZlcjfaiK/MH4zgZkfs6MfYMeEcHbo+Z5BaCRoJp
	 zcUKpNxNbb4GIjJ1iYuKNgvYDFo/995eP6baatwuuyRQWGB8rH4JsA948684XQLQtW
	 0i3lBY3yNbDDicR0NlskLcZe61/kqCyGWRQL/8SuoJL+YFrJ8VvNAVVJJ++L0SFsRS
	 lygdFgFzeWGVmSEn1yRkQbrbiuyOPngfUApf42Rdv8o5XkYnbbj3CxkT+vH9/HLQ5U
	 ykJo593j/h5/qU6AirH+tlF8I3hFmSDY/bzOsiK0yiISwm7L9JRmSeHl8aKk3Ltoax
	 x6q8bdetHTYxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA50D3800473;
	Fri, 30 Oct 2026 18:35:51 +0000 (UTC)
Subject: Re: [GIT PULL] regmap fixes for v7.4-merge-window
From: pr-tracker-bot@kernel.org
In-Reply-To: <40ab85dd02918aba26760f0b9cf1ff7a@kernel.org>
References: <40ab85dd02918aba26760f0b9cf1ff7a@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <40ab85dd02918aba26760f0b9cf1ff7a@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.4-merge-window
X-PR-Tracked-Commit-Id: 1ea2927c1bc3c66d2ff69f131268e6be4d38a87c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4395d81eca6a94026276fe70cfb20f5a0191f1f
Message-Id: <179338535028.1709878.7537494123047263978.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 18:35:50 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 30 Oct 2026 17:09:15 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.4-merge-window

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4395d81eca6a94026276fe70cfb20f5a0191f1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
