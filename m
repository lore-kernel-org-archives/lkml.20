Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83DE43A809
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555672; cv=none; b=d1HJ/ufVlNr0kV2U6chKM9AMSDVb7YL336McvvOomoCBDwkJKP6W7+gEDCzr+qyM8WurYQz0uxA+L8GTO7YhMojEaqArzwiAjsA0IdLSVn+1hUe353qjbUhTouDzw5hwP3JTFvf1u5Kx22GJNonaqBNm3hUJK8ItCc9MlsVPkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555672; c=relaxed/simple;
	bh=IcHS5AEGmOy86IBRPQunQmYusglbd/F/sGrDT1HKQMI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sNrUZz2Eig9JXASfzEIUCr88ah6ZAGj1zLmLX29j4m3C2elhyFy8xttCJs0HEXj+4P7CHxmfJeW8aO7dLGH5nHqwQ8X7fdfYHcDnOfRyu0Y+Zr5xyXkX+gWfsCIq2pfJjnpT9WjpNLdW4B2BmGNflulsbtwX2chPy2KLHYadLqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEpMlNpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEpMlNpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15331F00A3D;
	Fri,  4 Sep 2026 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788555668;
	bh=MEDTZKOI1zKmVzVESeetHAjqEmshg9hQhE5xi+j+Pd0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EEpMlNpFw0IL38ZHdn42REVxD2A251H6p60xhpZ8yzmMP/TysVkr6HucDkXO603ru
	 X6Je3epVzH68SjbSE3w4JJEW1fmvlJ1xOBKjaM/iVlh5P6zqbWJvTOy6qVRAC7yvym
	 8uKySO351xHDPZEmVFszjttF4ZXJhPZpc7cBtpuLU1UIcv4tas/wA0GjfTIz/t6QO7
	 7X64yYlwVNl4iSA/lwzXezK3G6IauH26ROHWkPHH5YfPEXSBeJZKWlfRVioWZgDuCE
	 /GK93tVfl8y89F6FlfDEJcSKZeqBd4WHF7Tc6RPMuxHro6eUoMzxLkwWz/2SqrP14k
	 XpbXq4fyqvRmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 953D63924A72;
	Fri,  4 Sep 2026 21:00:10 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <apsL0Jd_RUiP20Vd@willie-the-truck>
References: <apsL0Jd_RUiP20Vd@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <apsL0Jd_RUiP20Vd@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 5445d64199626974269fcdf347769ad44b0bb53b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f17a52d47ed39c89cc8429307cf246e781ec979
Message-Id: <178855561017.966019.6559448602205792725.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 21:00:10 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Sep 2026 19:20:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f17a52d47ed39c89cc8429307cf246e781ec979

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
