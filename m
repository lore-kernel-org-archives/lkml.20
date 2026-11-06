Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926660;
	b=cIZUOziz764aRdcGwIn5zLnOHCWyMAVhWYbCJsIgpW2ZdF6iToQDnbx9SeVffVQBTy1n
	 WRfPXxZOduQmLZaeFUY515exUGvmqUk6aWLmSmf3mr+Veq0CrjeItXBA9ASKPHLfc1CN7
	 J0OCu26T6vCjF6slsotCJq2FwELOqu6ZbpVG8n/XN4UF2/SwcvtWqqHX01cUxsOxmlqxF
	 NyOPExFjD2wmLuKaRMun3KAhaMaVoGmjWN/gQb5+skWy7/DXUteLPuWXoFLp9mo7X4Opi
	 PsD3DPUbAILQMPKeMAtUA9GwtTTLSvsvon+JdtjBKIIsMdMwmcbn13MyuwTAAvflMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926660;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=YVeFT7LriaxY+L/H0hfcnFbGAhPLt1+tTB5zxNdoDVU=;
	b=L6iCeWXvoU3UV59Q3fY8gjsL5E+zD4Izkfq5OUXhstfmNIfiX3f6eDYTskagE1FrQaAv
	 tUfL7zHArEt/JihiaTXLIaOYqrNkCG+Tfc4KHd0lZ5xawpeLaflyygmYrpY0fM+hvwtdd
	 HAmbaFNeyADZN6eHwHxhUmUviuMWBNsdjq018X0BQrK902i05cDUmfrDc/k0skfW7U6tC
	 Ck/WdK+xutUEZ9sBo1TWucKcKQyH7TSJe1iB8ZerqJ3U2PvO80EcpzDAeNEerw4k+hYpj
	 XRTYCE43sINKyZYfx+miQlddR0NFelWrVIpBQ/1IlqYcajzNYJva9Ft5UT0yPMkTtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XakR83wQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE67606A328;
	Fri,  6 Nov 2026 00:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XakR83wQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6271F0089F;
	Fri,  6 Nov 2026 00:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793926660;
	bh=YVeFT7LriaxY+L/H0hfcnFbGAhPLt1+tTB5zxNdoDVU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XakR83wQf0Ix863N0vXhbIqzVGqQhO/jm+HBtAp9ZTXtIfxgzmJWc+oDyyyqqwJmQ
	 g855WRlEoQxkvPY652C34AJxhkTkOHb02Asl5F0rbImw16Fwwpv4EAsp/4KuXevYSA
	 QRKPR/AsmfB/GHaWGHQ/sS8e82qqSkr1S9/eFjzCNU75OHz5vpeZIukAL+yBpn3b6f
	 6MG2LG7r58nXTs3XdPnNFckSeSfhNSg/CJhZ/rMmcOOSRf3xjDstn+0ruOyjDpkpsa
	 OTM+MksXpj6V7/coXXfjnXxepiJU6OjiXWebya1ztKxpisys55VMMJNVPV1N7Bvjo6
	 ToOJIAbmQOYMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5DFEA391B1B3;
	Fri,  6 Nov 2026 00:57:40 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware fixes for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <auwLLFIY6FBdB1H0@google.com>
References: <auwLLFIY6FBdB1H0@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <auwLLFIY6FBdB1H0@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-fixes-v7.4-rc2
X-PR-Tracked-Commit-Id: 2433db2af8e1482a3a50b8cefaf25cf7e4a9374d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eedaa7d61f1ec8ae053a9ece0d553785350ac486
Message-Id: <179392665906.268614.221300077378715668.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 00:57:39 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 5 Nov 2026 04:50:52 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-fixes-v7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eedaa7d61f1ec8ae053a9ece0d553785350ac486

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
