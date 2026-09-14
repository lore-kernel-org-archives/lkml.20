Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0D23392D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348248; cv=none; b=iiylKomzXKi807nn+/gVOIszktpfCXjXqNwnuRU/YPX/VrRn2zUXxJ8JfF+FKJ4MjkLCTZpav0JXX7AO0bn3K/Ra5S5bvGgHZwqv6vJ7Wr1ng9+QskbEuHgj9M4b4oo3hjmcNzIpx2GDd/tHXU51pBuyu+JviPVQ1J/Pko3nbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348248; c=relaxed/simple;
	bh=b/aZkjeoZ4NhAAxfdwrGBPrftOfNnJctEZYslRFcqSk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pzRJDXL3oAaAWaPEblyTFbByFsvK5ol/F4pMaSDMpeMFhtw1P4Clwasm9rJcp8GnzzNg5C/iINGsFsymMIZij04akf/1PUkSx3Vgh9T+CMSHzFP+mNQCKym2Un5/KKuaBae6mFxczoCCb5vcbpWF06ltVRZEIgDKKxqxlI6v4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEJRFN+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEJRFN+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D051F000FF;
	Mon, 14 Sep 2026 01:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789348245;
	bh=20kLdd8J0YnV+EY1B/8SNQ/d56fIK5uJeG7sIi8F7/A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hEJRFN+hPAt25U/39eu9nUF/cnWWvgolc3YrFL2Lf/a1tPvlF74905hKb947+CwqK
	 LYmTEde5ZeM8NKBntwEG5JkAwMYnW5WEHho27QrgHLUNI3r0Q2KVd5ASUOigdzVzb/
	 28sJe0hoTqlmh61S6TjOgiPhQeahb17kNV+6cKpkkEbOlvAieDTWrqmAyydKEzUh5k
	 OXo6HOUBoAhHK3gcmalyznI9JXcijblsXCImfdM1I+vazjYNrK3OaMcyivRNf90W1t
	 3H8F/c0LTIsZ2MdGcbpWWsPMQc9eE2OfVmwCqetpBJmx+NBh7CAlchgYuqm4raYbd0
	 3kc1G5Jbn0wkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D70380AA4B;
	Mon, 14 Sep 2026 01:09:41 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc4
X-PR-Tracked-Commit-Id: 27600805e62f800bacf990354632eae4e487d34c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
Message-Id: <178934818041.267031.1055122631675535587.pr-tracker-bot@kernel.org>
Date: Mon, 14 Sep 2026 01:09:40 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen ' <dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 15:53:56 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/704340f1cd0dcef829eb62f5b48ae95a2ce17bdf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
