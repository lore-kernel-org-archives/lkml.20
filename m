Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535836;
	b=4SvQUBC8qPBA2bsOTZWNSLKKFKBeJQy48D1KkflhmMc77Y8FnPzHK6UMA23onZrXoIgL
	 YIetzfklDg0E5l00n8Je7F/W6HQ0rOCusoKRG3nm3R6a1pGX7bNBkAHXp4kfG91wtW8Z1
	 gJL4dN5+gBio3STZTPhZ+IhwAMndI1mulUqeBqMap12eLZyr7MGQNIlDqr2UEeFLhgZ3Z
	 WLq2N3PT132LwNPk/oxXWeKC1lSo/3z+OQ6BOyM3gbStj/ecAuRxyOdizlzsTS6P/ruyn
	 iRJTancgTdH28NcFJPq3K4qFYxn1OXsCq+oGs1TyMyRYUSmTOK/InKZWL75Ot4cSZ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535836;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=A5eN66WJvNjMyujMDowyUiPDaNuS7cUm4tF9E9f1lbo=;
	b=igpQrrzrSPGYGTNg1ea/HTP24J+arIMY2UoNREiAQbs/l/vurHrpMsd/MiLCtq0JiTkd
	 d3qOBD/XfEEv5jfKoq/K4dl5fEXG6L/+OhZhXVqGsu3kgRTaDZazCC9sWOsKjNkEXiB4u
	 WiW9SXXE3V1BWo+tGGjXmJHk7+B7SosKBPNCY0vcoKX07dmfkdC76EPWABvIOrjnS/iGC
	 VWwJK2fFaaj+DhgIFVdx9lve6iqHpiIoQ18Y/u0S2bLWaSC/WLJVO/LouJuGXnc4+dov8
	 Bpm6EHLqXdLkUZ+oWpVKgJhLOxNdCJ6VDid3IL+IqlIjOFSInsWK1swVaLF0e+6M+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlpuK0gL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CE6606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlpuK0gL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8213A1F000C9;
	Tue, 20 Oct 2026 22:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535836;
	bh=A5eN66WJvNjMyujMDowyUiPDaNuS7cUm4tF9E9f1lbo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AlpuK0gLmuuUPM5kJ2OJw6381b8gclhxqfh0gvdhxeFasBkk9Oaz5Ohg3DAbuOSTs
	 aO3mNW9ia2CoT1yVoqxMbCbcAOq3g4+M5r8jlBUMLh9nwZXFvBsjXHNn8HRXZqtvpM
	 IgqosliCRubg1NCuQzf6l2GG6cQTDuDAWO6GZyXPK944H7HFFrYPFvo916HKW8XPLD
	 i3wNs66SoJsMzMJsCtQ9jao/tJHLvXPkQAjSPPEJdrfctIw5U+yX1813+cNdpE2rDL
	 tQnARBmi8pbRdO5x2nVW9zdjkU0bsg7dFGYuNngCzCssFN791zi7+FQ4QqarT0S1gb
	 WQus8vpyP4/PQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775B53809A0C;
	Tue, 20 Oct 2026 22:37:16 +0000 (UTC)
Subject: Re: [GIT PULL] x86/kdump for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019150704.1851215-1-dave.hansen@linux.intel.com>
References: <20261019150704.1851215-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019150704.1851215-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_kdump_for_7.4-rc1
X-PR-Tracked-Commit-Id: d949fa7b1ec54c626b656f873b95d76b8ab0d143
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d92881a8599025508856d8c3aa195972df775da
Message-Id: <179253583500.248332.829316917190149233.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 22:37:15 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 08:07:04 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_kdump_for_7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d92881a8599025508856d8c3aa195972df775da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
