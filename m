Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535839;
	b=UDHBWnjIOXtGPV42vmpBZWQgIH/+KcMjnw3MAw6dZmnubpQ4q6bHjC3slNpPIciuqJv2
	 eyaNKlNTtFgDXN5Yh0ZCISNgvFHn47MDh4VQ51wsYkXsKCCWEg3fuWeUrlarOg10n0EEB
	 ac/vmEQmJ2Qkj8Gh+xnGbDJ9Bpj1SscL+QOC6pzffrvjmltDHoLep7d8B8A9hwcYbuDVA
	 Vnid0Q8WcetCiCxamR6z02fcCL6QRKJKzXbUqhnoqiYTHDMxYwIyetxb+tsEsmjesmUaB
	 T4VTDNDKJtKpti+xfsO+4UnGMW98UHbDSBuD62PPgkns7cEnDueUX/WUNDBC5cpCaLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535839;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=j4+btOz1oHoBAqfaSqPlkcp8uCJuBhMheG7zjwkI9n4=;
	b=JG4gxmfv3HV/lVyAb3L2ZOqUrPa72dzQsD03J2kDRET1n/A8XUM2cLWGKCuq+OVgQbct
	 dN4zVazv1Wg2ZA3C9L7FmR9s4s0VeL1giRwqScz72rNMGDhtwXBaoNaOLFESNdYHdq1Rv
	 DOHi2Ocv5JQDodY1e/x9wF+Tk5KO9rIOv+JLoOGt95cGR/0AfAdJNlLCX9q1Gp7jqyZXS
	 qP+/uS/kQ8NpMIXVdFh919Zle6vxCut+vPau2WJoflPOyntGS6vC+EdfaKUwOV3kQlIW6
	 mo7PsLYJHxXlu41gzX954XMprZGn19CSTOgf8Bgg0STCp3qYTF58ARAYlUWkR+AMBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er3l1bFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB037606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er3l1bFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EFB1F000CA;
	Tue, 20 Oct 2026 22:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535838;
	bh=j4+btOz1oHoBAqfaSqPlkcp8uCJuBhMheG7zjwkI9n4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Er3l1bFIo5Wt4pITVFn8XfSg3Ua0G+liuFaVYWlss5yulJl0TS70BX+y/U21uWs4R
	 4T6EZ1XObkLDg38n2PDuzWZBG6K60wxZm9shFpf2pBX2rmt/TOtmOYQlXulqE2HcUf
	 pMwFKNzJwUlSY4eb2RbHillISvQxaKOhr14Hl/+UC8apRu00Boa6UnOMtGNp103aTI
	 lhJagpH4DrpGMpOvucK6+MH29OQblIeEHUcQ0Vn1IrcBpkvS96W7WmihjP7uB/RGYB
	 /jWjeGu7x2K0Yw8QSqNG6dVgvnCXuBhiln1MTRpEPNZHbg4c4zuWFxZBO7fG9ZxnHP
	 yf2nNo3UHvc1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2A13809A0C;
	Tue, 20 Oct 2026 22:37:18 +0000 (UTC)
Subject: Re: [GIT PULL] x86/microcode for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019151634.1857472-1-dave.hansen@linux.intel.com>
References: <20261019151634.1857472-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019151634.1857472-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_microcode_for_7.4-rc1
X-PR-Tracked-Commit-Id: cf086537af4e3b04f6012dae3766a51ed1afc61c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09789bc9b19613a0f6e9dfba3b4a8f0d6ae026ca
Message-Id: <179253583688.248332.12176472859383786386.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 22:37:16 +0000
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

The pull request you sent on Mon, 19 Oct 2026 08:16:34 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_microcode_for_7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09789bc9b19613a0f6e9dfba3b4a8f0d6ae026ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
