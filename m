Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253148821C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256766; cv=none; b=dT01sYrwonc1HWheRPnQoHPfp6AFNtPclJngkXrJSfFLLNFb2Ofve+uWp75Pr1nwavZ+9xKMjRwcjXBSWV2vX3Mha+HP38v/fJXYJTvz8nyZoEAkOFtkOqamhfjEk/vZ1RTQHOE5lsW2EPiK7IUCR3m74kQviZmY24wavWn1Bpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256766; c=relaxed/simple;
	bh=EAbMlArMyUrKR5yoaFPqQTn+JPlb4U1CMbGKgFbs/TA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F+CCtLJJwWclo0rDIqZJbEz752IpejfBC7EQ3j+Nuipzh7TQgriJ/IImAAN8W9s1UaPjcPRcrOPWbUSDsyStGa+WlL28uNhXLTHWVQCVr7f5SIkQ77TitwBMH1C61jaxPLFBdO7aqzlSVwoS5+Dz8dbXpuMlwATxBO2Um7sg/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUmMinJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUmMinJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801111F008A6;
	Thu, 24 Sep 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256753;
	bh=ZoQON+uKfeArSEel93EozFzN3+R+zr6tyWu15mzXZek=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RUmMinJLOXo2jjpCnXOrOVbSgF6LQ/Fv3Pfa8+y8rs6ln/1dmiRBJOSPhnhW28M2+
	 iN/0YRSairuFtTYaZ8uYPi0uHBZ/HRRtW3M8M52RZWX2CfNPXt8ihDrs6xvTXyeLEg
	 pXq0Hx2nmXBCpzzYUFNllnX7jb5a2OacJQga0itV4H+TCAPwCvca8ovGwIf7U0M68+
	 RTaNUnaxGqrCf0fbe1Zd2U7Bl8IZ2zr85T1fn4ItH0pbkh33qGhUfmNp3UbPhb7EXi
	 E5TcvA4IFlsZoEpSsZoNwXVkiyxxnrgGUAmCpjj87gsVIlQkXlJkn4O3QkGeoNSV0Q
	 Rax4HrVVavwew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CF939FD333;
	Thu, 24 Sep 2026 13:31:23 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <arUI8d-mES9Z00we@willie-the-truck>
References: <arUI8d-mES9Z00we@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <arUI8d-mES9Z00we@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 2bc6b218717b9d08f466f88209251d54bc09b207
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef33dd4e0a5290b1de0e64e30e738f005289e1f2
Message-Id: <179025668243.1550318.7791677030778155601.pr-tracker-bot@kernel.org>
Date: Thu, 24 Sep 2026 13:31:22 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 24 Sep 2026 12:26:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef33dd4e0a5290b1de0e64e30e738f005289e1f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
