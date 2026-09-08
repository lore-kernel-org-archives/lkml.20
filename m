Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC2583AD0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906234; cv=none; b=kYM5BTV3X87vgPjwZCeNgGj1oZFr8dtSbUex4DcftMEMRW48Li8uS9U+bI7UoTxA3WAkTWFlJ6xosIVhpC1snXRfBtKoM+eVIxJpknSBNMmkBL792tM33GE7t3KsDMjgFFgMcDT5SXz8A0G+so/WmNppA0yACGEcQOg8ZCLLato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906234; c=relaxed/simple;
	bh=mcHq30BOpBchXxrqtX6UXRDBjVjdfhQQSJlv7Qm/nos=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A2/ZHrI1U67X1NToqktrIzp/EF9/M1EoH/74nexG4qjSyT9R2Vl8Tf6tR47fTUvATI3UNHAV/MFsRbapX7+WJu4UUNfaHwnK3fv7GzerxpfFn1NyrIi1A1vFq22lEK6nDw7SAsetUEpWZSbAoU7J5EtMnw3o35CmjpE4y/ejVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPyKwxee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPyKwxee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E2C1F00A3D;
	Tue,  8 Sep 2026 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788906232;
	bh=viJcQbSkvaCUxwjRwvOxSpmTrgH5TbTlER9s6r3JymA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VPyKwxeeyXt0DGQIxANWD+rkgPryCcJq8AE0vKDLkpQCEtuqLjVNTq9pfrGQ5fYTH
	 fAyp5ket5EuqX4PMNijxUrNxWK3fHSb216/4DRFyEB2pjbSg5QWleJPuRKx8gMM+Q7
	 r0GJYHfhKHwHhqwaNdfPTja/k+rmCRg69DZ7N3FTIGbou7SzT3cvMEQugyyNjvyHS8
	 sxWOEI3KmRUtPJlxGXalrCjxR2sMHtUj9s6JM5ENEDRDMcjcV/5yw9xcYPOAxQSp3I
	 BucVdUmSulYs4pUv50lNzq6ar7V1ye5p1o2lOyefoVa3kRNXDbLo54PxaSM8yOFsME
	 J4FJ5MpIliwPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B89380820D;
	Tue,  8 Sep 2026 22:22:52 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260908195217.3202284-1-dave.hansen@linux.intel.com>
References: <20260908195217.3202284-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260908195217.3202284-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc3
X-PR-Tracked-Commit-Id: d2929113b15bfc06793b852aeba3d2db6d79fcc9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 893e11787f78e43b534e252249ac3fff4d1333f8
Message-Id: <178890617063.40657.7652807051397780980.pr-tracker-bot@kernel.org>
Date: Tue, 08 Sep 2026 22:22:50 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue,  8 Sep 2026 12:52:17 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/893e11787f78e43b534e252249ac3fff4d1333f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
