Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001673;
	b=um1hwFSN+/1SXqnKN9WgZLzxaMMuoJm/ZZGJqzz5SHrYjAFplNYub5yTREF9IuLze5TC
	 /G1Zh/dU91tqIRxyZWmPOJluxlGF5upr45ruGWZ6H/cneyIuaJHdGmSKIogyET7kAry5t
	 QIgULpvlIQKIUnuFm3kHaZ36x4yFK0RTACAiMQkOCukDTcu8aK2pysfHeNqsE6MSvM0fi
	 EMb+SpxZYaV+6TM9uUUOBfZf5ISB9cEO1MH0uKHH3scD3R4CTN3r3cjZ6zkaFuwzwEfPm
	 wJt9T0asgMRl8tU1Oj6GIQqfeledbcUwIiQvgTzu3Nw4XSb0cjkvO/AL5ovT1CmV2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001673;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=oiz7UPOUvMRqWSpS0TxVagOV6ysYEy5Uin7A9yXyBy0=;
	b=X+Ewl6g7cFdZRb+FDnud/trLVlouc3zqMpDW1Zkyw0WWsnS+3i/FLAaZSV+/Cn4P8KKh
	 em8hLQfboDItZ5qfvyxj/8rCOpZUbSrLkA9Av7KODkvBd1Q88FGjDS/H3LKPa7zxpT6UF
	 kxRcMXsyrYylKjJQsqZj1nvpGFx7aNVCtm9vQ9DsVlvU1p/8vOZ+xuKgjrU/a4KTwVV0q
	 YsScMiFjRyun8IyX2oHYwn+xegAA6Obo88xPeYPXmycy5b8racZSrHOTofVXgV7xUGdzA
	 vqzbaK6NcI+RlM7PbQeu+U0GnRPQBnXvtrDOiMhSga9MtPTSmPQC8A6cM7+89F0QUmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJKOOBUC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D982606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJKOOBUC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BE71F008A1;
	Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001672;
	bh=oiz7UPOUvMRqWSpS0TxVagOV6ysYEy5Uin7A9yXyBy0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FJKOOBUCTjMp8e3xy+3HBZp888Zat9vze3Ttvu+0emXwb41MgA5+F1rgK2CG95QSI
	 xfLujSAGgnE4ZCcZU7gPYWyNDf5EJp4cPVP3h+vVm4JtpdBEI/Jr41EGbnpLTEzW/4
	 t9+mlA6fvNIg5gF1ngE/yyC3fKe7JG77lsixfCVVPn6TeYCwsUCMVuSrdIDgTsf6CV
	 RdOcRBNu43TyMZ+rkj4KHnryCEAiQcz5QCXdG8k5uZYTfyEti3npItZMc2XvIyuEHO
	 n61QGkaao40gkXHsW4N8PLNNBpdyf9eHfgzc7jGIBX3xCMYMtLVu+fjKvPC3R7kw8P
	 63V+YX/IAgOpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B1E83A549B8;
	Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <au4yDc-l14h7hwMI@arm.com>
References: <au4yDc-l14h7hwMI@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <au4yDc-l14h7hwMI@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 58c1eb84e97701c583605ba2fd553b69afba2245
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d48723711bae9b8cdc56719c448ba42fef28cbee
Message-Id: <179400167130.891032.9381456460991019522.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 21:47:51 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 6 Nov 2026 20:01:17 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d48723711bae9b8cdc56719c448ba42fef28cbee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
