Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307338A70B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295876; cv=none; b=EnTSOFQaSJSeZTFv2q44cBrlewcU1AzQfhk+UpU160vpSqUqQhc9vvxHVY1nFFnEtxp3VoN9a37bjhJfULBMxJxhpXIoqdpk7c1+VSUqC5Yk4FwAIZ1jTTURpivq4ujgKMa+Ew1VYRJGJEeHZFLedfWIaqbihD68gw689k3we9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295876; c=relaxed/simple;
	bh=SElzPYmaym6iUMbfPKR2vUbdARiV5kR8/8RAHtmDMpQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oLFUbJXm/x43LQ1Tra6C9Wwz7JNyCcXkDDglBiowlA8bpEK5T1qkwdAqMawfMdRPeLuARPaXJQs1y8getdU9z+YLrGNxqUAYotdTIfDykayWS1e39jqNZj5fQyEzscm7BZqAvf0I09rFkDYPUib6nEcMJ+UNtSX/Kjvt+j7HRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhpnC2nD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhpnC2nD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56191F000E9;
	Tue,  1 Sep 2026 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295874;
	bh=ny7uePr8tXxubp05K5KTUeAAvHwNywwpzMt3vtYvyHU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KhpnC2nD3Ipb5g8puS0tl4LJBaiy3Bqxaobcg7Tl4pZE8W6/J3K/jtzvTELjiWkDM
	 kG4+bjhPa4nyCeUK6Tyty86BsHBLG9XJ+B7ak5JmmaOLINC6+yBMSLiCKnKubocPW8
	 qLGxyXqsAz/dNXmnGDOZF5IUqfk90fc5E8Tk60He8EHNPitXKgjbMebX037tPTlecT
	 nBiV+X++TnSy67abF6rxCGGRo30CgoUTNOZxm3KnYvIHSrfjp49ALST/efpkJmC2w7
	 E6WfNJwBkP8IldvrMmWo8xV57y5jNNE/R0+WCTzXGouq/BH1c70WHeqCCP9266nfdl
	 In3cGxZs1Dr9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A1F39253F9;
	Tue,  1 Sep 2026 20:50:18 +0000 (UTC)
Subject: Re: [GIT PULL] ksmbd server fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd9MMkW5hUCBz0_xBTLxsxeifmnKmp5jF0daMK=3R1adLg@mail.gmail.com>
References: <CAKYAXd9MMkW5hUCBz0_xBTLxsxeifmnKmp5jF0daMK=3R1adLg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd9MMkW5hUCBz0_xBTLxsxeifmnKmp5jF0daMK=3R1adLg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc2
X-PR-Tracked-Commit-Id: ba9572bc43d04d71ba52ae7f20645f1eafe86875
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a58da80053f992b285b6b7bebc694b0f284c443
Message-Id: <178829581684.1843886.17107273411800115181.pr-tracker-bot@kernel.org>
Date: Tue, 01 Sep 2026 20:50:16 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 1 Sep 2026 19:03:14 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git tags/ksmbd-for-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a58da80053f992b285b6b7bebc694b0f284c443

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
