Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CA37BE6C;
	Thu, 27 Aug 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862369; cv=none; b=oPIAZK5yMLFIAYLtK2IPCXAwsh+MBiBaQP+Y0m6Sgrlbt/tiooV8tGDf0U7C/4SzO8W9roa1Q1Y9qVZaeohzgDBd82IWzUHWnzO4uaZX7H+c/T0Ns5jZvDH+RLa0VsQOOGUq1fGS37gIHOcx9udtUofHwpt5IwT9iP/osYbNAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862369; c=relaxed/simple;
	bh=L8YwEckZFWiAwD06IBO9PyEXZi6Uha7xb1JY1klWxiA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aweUmM8hspuwrSx9WuryoYjDfywxc5mmaO6OOmQd2omMoljY5E7BuI9XlM+v7Mch7Hd1GAl0rcrpQo9GInXHKG7Fzevzwa4WIH0mk9DlN5zHe+mAc+Q9IJxCIqBDGYMpLQwNk4iS7ddWkpwCuskVFYR205XfIBM9q8nPKXkyLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1SZOuya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1SZOuya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A951E1F00A3A;
	Thu, 27 Aug 2026 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862365;
	bh=FRvwGof0FL6mg3vRqxMrlghSSjMOOnmr9WDRSouq8bM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Y1SZOuyaiyckWJrr4bS3mR/qfadAuoYiFmxengXbNrjZQz71mNv+K6iyMbTyfM4Vw
	 xVuxQtoSvHVujPR8Qp4PTAjN4foN2tHRU/fuP5QIbm+1OfSLMnFfXHxcD6nIFBSvpo
	 A2OnuLuNWAGl5vJiDLU6j9G4ps/CfyyFFZ5GmJL8KygxTHZsanKLC9JcIlyGI4HoNn
	 Z/jRg2FRu8yEWuR4xifB4Cn9AZc8ilwvy8MmAU2MokiIAUPVSK7G1PcHkDcoCLcJJm
	 2yjq5p5x5Vrr5UGYT+hEykj6Au3PObHEIffgwoCeFqmbraPLQixRaq3Fc6HzBz5hfm
	 lU6WunHtLJwbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568FC3809A8D;
	Thu, 27 Aug 2026 20:25:12 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v7.3, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260827180633.GA3385724-robh@kernel.org>
References: <20260827180633.GA3385724-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260827180633.GA3385724-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-1
X-PR-Tracked-Commit-Id: 5bb01c657ff9fc807c2c592ca18af34c4fc3bc6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ba13f5e7180c034b0a1ef7e052fb780856b134e
Message-Id: <178786231098.1831091.5362347655258446525.pr-tracker-bot@kernel.org>
Date: Thu, 27 Aug 2026 20:25:10 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Aug 2026 13:06:33 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ba13f5e7180c034b0a1ef7e052fb780856b134e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
