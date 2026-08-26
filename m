Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD039CCFA;
	Wed, 26 Aug 2026 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769648; cv=none; b=Pce1A9xWq2VmKnFDPg1DJOdOjTQBqW8kPyTebSZ0YhAS3lZ/zT6K/pSd++hAhMlrnYkI3b+lyV8abcY5b5bhgDnevY5UJ+AP6vWrLinl5g418+KKjudHwRNc5bBLFIPf8jAV91zj/Dbbqd3aK16tHKKnGC7og/n7bSIlvS40my4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769648; c=relaxed/simple;
	bh=Vr/n19rMlCwlCk6NBqJRX3Q+INPynO+pR3nDFfJKKSg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NPzwaaEMV77gf47+wyGwc/EDVy+zHoPD7UW1+9TRu+nOF0OyOSGnr02YOVMFr2e0PHitpu7s9SCdSmRf3gDixAf79f1ZMGBXAQoSw4j9s/UYg/wMkWh6E6dJfDgJfF9emvXBLh/1SqpOathI96A2InEmMmS30Kaol21739fjr2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdEmDOP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdEmDOP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80D01F00A3F;
	Wed, 26 Aug 2026 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787769632;
	bh=CHUEaEFNjjMRtrjNQC63WoYhZtX2a/o1zmpSzzFcRJk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TdEmDOP5RMPVd48hOBu8Fspuq7vp/eg0/S172fbaEp5gMrEpm5GHRSsDBPOIkPaX8
	 RsaNyFuMXQcNXWfdkw996ViEIOQ7mQo9utE3eLDlOrifCjT485gDqYXx9zpADrIK9q
	 6IsyXhyRRVdIebg9bh6sm7uwoRipHafMRGQx8E2E5ccNPsYEwNQBcJPV1oaU8oEt1a
	 4IvMa8+GyrxqDm4H5f/j5JHL6yHmzewXYf6rrm4XrijOhxw/00YqLveufU0InXcvl2
	 wUHa+VxtkjgdLBl8Vc83AYT9DevFIwXTLv8Xx4JM70UObhnbhBPiy/wKehI+ADx4+k
	 OOgt/yVMmWRmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B33380820D;
	Wed, 26 Aug 2026 18:39:40 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation stragglers for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <877blcsvfa.fsf@trenco.lwn.net>
References: <877blcsvfa.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <877blcsvfa.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3-2
X-PR-Tracked-Commit-Id: 94509f50d696bff745fe26457ce421cea8525bee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bdcd6cf2ac4186c3640ac54cfc48c14de80948c
Message-Id: <178776957882.801398.5452778190897544910.pr-tracker-bot@kernel.org>
Date: Wed, 26 Aug 2026 18:39:38 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Aug 2026 10:23:05 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bdcd6cf2ac4186c3640ac54cfc48c14de80948c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
