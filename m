Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3647B436
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789229860; cv=none; b=DYKEcEZa5zIB1HxFFsPvwe10FmWPIGuk+s1QMovVpQEdYxukHKKZGOeLywbaBLNE9oWqsafZUu4QxQ1AKzlie/vrp3Vzeve/4nZ55Z4IwcAPwOCZxhhOgTUAKLjMODvAPEC9vDOjmzprOBOHS2u3y3kcbWyRYX9fgz7/FR9290A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789229860; c=relaxed/simple;
	bh=xl6Z3hWnu7lljlgLuVjdeAoTcaezEhTmuIaJXf4Ea9k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DG76hCnBNHzhg4RcNcUPqM5ckeTlcPMvtdwQosIpMUsG6rJnVuu8Q5qu2ZtYxP9ZagKXdl/+bXimT/qx+/CqLQWO52FQ7b02m+CvyDHXjrKX+C4Jw0N36qV/1Z92+NiDMIBiBrbxM5GbWfla+6exCBxBITGDGJ7yq6rwoDWaLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+ca+KOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+ca+KOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5224F1F000FF;
	Sat, 12 Sep 2026 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789229856;
	bh=uZN626yd30FEpVwVqFda/2a31Z//LOAzQuj35O8XFdw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=F+ca+KOBk54/wnxGzdPP8uvnNGQvYIEbQNPowUIvC+i9d6cNDbxXBl0W1nFiwaoOW
	 eO+WdaGZuysMcHYBJnqZfAerTCF7aa9LXsth8VuEf5ZBuhjlVlPNDkt4ClzEjn+Sv/
	 +rwBOnbXS76ICzWrsM1beq2MZy7xQO7NhgMX8brKorvXNqocV010Hf9MfJBUuTrbWi
	 w7MyZnShkHzwK8kVvWyqDR7NmUjVTykAkBw9xTp4Trnlwimesp8Qie3gpRNfVXNwYP
	 CfFVsiKEA71kRSOIT7xduNlWq+KfFUoXhr8HF6nZc2a6KhknviehSAuFMb2U1EWQV7
	 l3r44S7V9PiPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0DEE380820D;
	Sat, 12 Sep 2026 16:16:33 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqVKkkgDZCBO-0Df@XiangdeMacBook-Pro.local>
References: <aqVKkkgDZCBO-0Df@XiangdeMacBook-Pro.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqVKkkgDZCBO-0Df@XiangdeMacBook-Pro.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.3-rc3-fixes
X-PR-Tracked-Commit-Id: 135d84c66f85426299db01a09d93a79a87af18ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d85a45df03118ade0eb34486fb7948bca17acf8
Message-Id: <178922979252.3530607.10384746269709132317.pr-tracker-bot@kernel.org>
Date: Sat, 12 Sep 2026 16:16:32 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Jingbo Xu <jefflexu@linux.alibaba.com>, Nikhil Gurudasani <nikhilgurudasani314@gmail.com>, Chengyu Zhu <hudsonzhu@tencent.com>, Binglei Wang <l3b2w1@gmail.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Sep 2026 20:50:26 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.3-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d85a45df03118ade0eb34486fb7948bca17acf8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
