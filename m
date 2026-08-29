Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2341A38F9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966096; cv=none; b=MXxMdczl80aCUdayTN26sNEDlojOlGP8Z+pI89q3xvkjZ3b0Rbfb/+Z25z7lqA7a5JyWz3whG6ZbvJ0IcqlfZxmC7RoU4NqtJryodivOPmhPsKHgXBUux304ZuQwetkYkUIL0ctDhdZv2qqAZG+/j7YjKZWxs46CTNAtyTkoyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966096; c=relaxed/simple;
	bh=J2Azn6WRxI8YAtWhKYp2GIl3MkF63QSciz+F4Y+zzSk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ev7tek30x7zSWaTp1x8Qw8LnJQimgIzSl+A6Qt1hPqBfcAvQdeoiFmaL6liBaJZGAX7D6FhhshtN7tyQNAhusXqRDqqGVCwlP4Pg6klGqvqcmOmBVJqXcKLUiKLTYitU9peyCXnPW87mlY1e9v4Wyw8VMq4RwGLHkj+BPYHpLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buYDIP0H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buYDIP0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBFD1F00A3D;
	Sat, 29 Aug 2026 01:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787966095;
	bh=R6+DIhuP62CB5n5xPHY9PE1GvrGXtUDAjYy1Gi4Y6Cw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=buYDIP0HtCsYouDffjGIWsNxqu3yXrBIybD+SCssCscPTVirk1Vw2/RvUTPHsIULl
	 sTDqJja8ecRFTzIsMCEOUa3tKryU9jl8A7uh/3YWSQ7vTtq0p5kkBN1vvEWjFrmfdI
	 W1xSkuNh8ob2QviLakpwfzUACsa33mw2IXP3+COza4lwHxSQVQQhc/OL+CDduZp4Hh
	 Q3BRyIUy9/GxVDCrNJwdu+wS5kSv3qc5gY6aEU99r396J2n8tixusYOOdDfGXj96Um
	 PoMTUyQmZUdIUayWeCoeLWZbqY0xImrzoHgLIuD2wI+p8D5Vq7HH/e92wjm0Q528V0
	 TtbQzEFY1J2mQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1996F380AA69;
	Sat, 29 Aug 2026 01:14:01 +0000 (UTC)
Subject: Re: [GIT PULL] IPMI bug fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <apHnIj7efxcTH8i6@mail.minyard.net>
References: <apHnIj7efxcTH8i6@mail.minyard.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <apHnIj7efxcTH8i6@mail.minyard.net>
X-PR-Tracked-Remote: https://github.com/cminyard/linux-ipmi.git tags/for-linus-7.3-1
X-PR-Tracked-Commit-Id: 05ec76cfbce653e07cec19b9b8b20e33449d5d87
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4cc4cc367fd5c37ddef3279038bccbf152ef68d9
Message-Id: <178796603969.2866694.8316254903253823855.pr-tracker-bot@kernel.org>
Date: Sat, 29 Aug 2026 01:13:59 +0000
To: Corey Minyard <corey@minyard.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, openipmi-developer@lists.sourceforge.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 14:53:06 -0500:

> https://github.com/cminyard/linux-ipmi.git tags/for-linus-7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4cc4cc367fd5c37ddef3279038bccbf152ef68d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
