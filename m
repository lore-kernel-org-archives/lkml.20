Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC372509EE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539509; cv=none; b=nQMBFKh7vhJoKsERRd7gcNacLilSMPI6LWLux7qYhz/CaDKhQPPcbf8R0X6Px66bS2nsGxT1Xi/kI/RSLmOkBRB89PdRxWfHkn83bLBGfckStEXCioT2W+7Xr1zQPvetI9iBM5qpF9uK9W+4bL2GnhsxQiVEude45ihWhj0+wPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539509; c=relaxed/simple;
	bh=HUSyxFvhoIlBKGgLNP03fGzW2o2kyanZ65XLHl1fatw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F/ncC2BsFdvUpv482wUqnRPeRyhaL5a7ZyXAUoWVKJnHM9dxo60wWJepauMmIttnJ+sK/hRq99N/k74KKx2mD0mOxEVoV9azqKWqUdao34nWqNU0J3fK4nFGMgUSvfXLFjEf0t6qH7o9MZO6hjJMOI7gUFCvXkcChybwEiZ6/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArbdiJdl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArbdiJdl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CD01F00A3E;
	Fri,  4 Sep 2026 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788539508;
	bh=pXnE1mmdZUDCSL0L7i4/GpFcovqbe0cs39V/aPQ5Ddg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ArbdiJdlixlI1YIxih9ENg6lWQg3E22CLD3P/XaK7Zho8z+1CetNUrh+xIZS6QyJW
	 8jrelN+dta0ui3NaTFTROA+dNSwGphSmni3g5nYStvHtUsOjUZ9wwHkTyw5WUKywEX
	 nySwAhZtAFWlwBfvgyA2g3s3Cf291RnGOkmCpYW5ugEzvCpmlSWYOStA383lO+AeHy
	 NcuveNBA/sCZAPTI1+DtMZbtjROqWIp3dcdxNdDhHE9aovEggbpOKNyXFfLvG0QfCK
	 6xMrF1LQ+0vgqz6HsWprckcJhA4EDO/QaapXvONckSRF9YZPXNHG1s8bfRMQ9imDQl
	 GmnxTDtG+V2Xg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939833924A4D;
	Fri,  4 Sep 2026 16:30:50 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aprpMAFuY6lRnT9z@beelink>
References: <aprpMAFuY6lRnT9z@beelink>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aprpMAFuY6lRnT9z@beelink>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026090401
X-PR-Tracked-Commit-Id: 9cdc7e6dc7a99ad7311ad5e7c145f2b9ce4e24b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 986c24e0fe44f844b44d365b71ce831947f50298
Message-Id: <178853944923.415389.4430130270167558276.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 16:30:49 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 17:52:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026090401

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/986c24e0fe44f844b44d365b71ce831947f50298

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
