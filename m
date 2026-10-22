Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693920;
	b=j0YIVS2hIJsWJbAIA812N21prfYGS7O+pf75MkuUhAIMACUPQ9utIgb98N7bHtHREaru
	 IRZbbzzCmSWbk4AZDo3iTyA0GJV07ISEN716Aokl+usYkOHzjxO1fVLcZ/sG7PTWDTu/h
	 FpjG7WhC1jw+TcbxPRPmwDQiJzqophU4UDIWTtfrnvG3jQQClIcOGaFjac6WBh+Ix8Z7a
	 zkFLQOLvevmjAI8iufOIfwC/6bbfCAZyQNslJM0RWpgKeDaJhHgyvNy92TzHQGFNOTPAc
	 EvWYVTyuYNwhv2kjVh9QJhIMiR9H1QC8okR6Hxd1R0cOfhb/lJREHKlqcqYEDvZrsyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693920;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Ckqaswfo9sEyvIsIurDoe3dyP3Wi6JEgkyS1WVag/Wk=;
	b=3eRl0n64bel63kWpgdki9qMDl4AtgYlPFGxmXV9Ck10pYjc8cbKvoJMd8ght9ZBBv02p
	 l1NH4x0FiYjWEmdEwmDdlGpxwVznftf8UrRwj06Ffsoqe6DURCJ9RWveqOa7FfIcl8TWe
	 /5tr4ZWdypiwAPbt7QY5DtexnjcFQ+R3QG10/kaubZUznH2SMeVwTmheC+DJMpakBoDib
	 H/w3WVqWlwI5LnivbkUxGotFcU7/PFyl3YVTQELTp6qeAJhRFUQq17h7+p+TOlMCJCpWe
	 I+B8ZrSrUVa4+OYc3PlMtnqUxdbk6X93BIsUUpyhPprWD6fcIJkeLdSPwozzqdz9I1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLtJ43zB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5939606A934
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLtJ43zB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8C51F031E3;
	Thu, 22 Oct 2026 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693920;
	bh=Ckqaswfo9sEyvIsIurDoe3dyP3Wi6JEgkyS1WVag/Wk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eLtJ43zBithfmjNqhofHIXl8azLl8YYygLgsCLKqQMuL61LrQeOhfQ/WIc1hEsUNR
	 8aIzD9U2D0dCBA5QaP3697g6pnhQbymTZ7J5+2TH1/wJw7Q/tns7XzCep8GGz+6y6I
	 oQOSoNudlYA1yyz+uVllZz80YhEN0tDFTx9NueEsSQBqH/zdHidFbRV5gRzHjPGpYf
	 mRXAIXDGIwJpp9xOhrBFhywKDYoWAN/4V9NbeAitXyJpwAxS0jl++8xG9z0udLgkwp
	 3To19SaA2A8kh781HbGCwtn5c7R/Db5ZalYZVqHv8v62QUcEs7n88rLpGBiVtQAZ61
	 qBUMyvlKh3Guw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 80E7F380822E;
	Thu, 22 Oct 2026 18:32:00 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.4-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
References: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-1
X-PR-Tracked-Commit-Id: 129f5d395fd66b6587a5ac156b232cca060d6512
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb2235894a8a604c08b3f93f4e1082b9df03265a
Message-Id: <179269391934.87271.7544822800655175224.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:59 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, adubey@linux.ibm.com, amachhiw@linux.ibm.com, blum@kernel.org, christophe.leroy@csgroup.eu, dmitry.torokhov@gmail.com, gautam@linux.ibm.com, gbatra@linux.ibm.com, hbathini@linux.ibm.com, kaylovefoss@gmail.com, kmehltretter@gmail.com, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mkchauras@gmail.com, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, shivangu@linux.ibm.com, srikar@linux.ibm.com, sshegde@linux.ibm.com, ssrish@linux.ibm.com, venkat88@linux.ibm.com, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 10:19:07 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb2235894a8a604c08b3f93f4e1082b9df03265a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
