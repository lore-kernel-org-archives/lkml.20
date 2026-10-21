Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543292;
	b=XoJT4rxNyXWRVhMojfPiUgf8H9mqAami1Zfzo5maGlZrUV7CatZq4LFVLU7zI9VpQdvI
	 KxX4GXZE4dqM6Uom292q7TDzy33N1xWpO0gendl8ZlifRrcH4RE/pCthO0EGvlX2hAECB
	 /ISRhjz+L6zX8qT/k4TumL0UJ+E5Hgjtk29iVHrvNbj2wC6wHO7R9ENA4hcZh30MHD9m6
	 Xf0e0gkE1xwxsnKkmmxBmG4KcVYSaXrANb+f7UqECLiZziVAH4cJ8e+RslIn0yGE8D6Tf
	 Ng9v2hRZ11zj8oLfq96qW+tzg9LofQAXAW6xOi8A/dxWqApB2MKmSy51Z6VnUnJYgVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543292;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=X2Kxv3mJpDKDJB+5pKZCRsssmwhER53b4YfHaRp0jJY=;
	b=sH1VvPowcBAN9xW0v++OolmLxyne2q7dslas3Bj+s98cB+ehpf/eo4AbL2ArQC7FCWzj
	 YLJZ6xyOGIfn387KrqyRnStPUxUfpokNnF3p8Tdwq+olsiugw+R2nx06LD1reUlN0KiAW
	 QOAHTE7u/zGjdghflTWCC5QcccedT5pdOZKXXeS7Q7a+39MJarpZIEq1oXheRCRCc+Fl5
	 3XXCGk8NkWQwrvtAULuVnYJFa8eQuAyziqOybPXYUyI3YlhViPvdbbuG6gmdeYwKnYXoA
	 JqJ6U76F5OC2lUgD4pYHg35IL9amXR486CqgIPW+8/hIOAVK/iPmBzVUF/Zro2jIx8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXKMryKR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A31606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXKMryKR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23F21F000D0;
	Wed, 21 Oct 2026 00:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543291;
	bh=X2Kxv3mJpDKDJB+5pKZCRsssmwhER53b4YfHaRp0jJY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RXKMryKRvHG1QjDbjYmrorK3r8Znn/wabnd7G0UVf9tFJkp4ks84JbpaHKxrlKQyZ
	 VugmYge8S8iZytDdibGpZsMvQhmSzoxrkNn6dLjRr7tKRlgrawNAUZfVxMQkAVgGhU
	 42IvdfQ9ljXrAsqIb1ZZnIUAZT1zTutCqC0GwNzzinBkstVbHh/ykpizLVJx775tab
	 GDUJPVan10kFDgF6OEUMPqq4gKNXyRbX29+693W5kc/F/h+M5ynLyUwtIe+YznlADx
	 lcudBrjD+A07A/OF+pLHSuKkz4UDdjlFQXOXRQu/Ol2jfLPf5wIaBVdpRe+8krrE7b
	 UYXoEm9uH9ftA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A9D493809A0D;
	Wed, 21 Oct 2026 00:41:31 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261015114439.418665-1-jgross@suse.com>
References: <20261015114439.418665-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20261015114439.418665-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag
X-PR-Tracked-Commit-Id: 61b6d1df1d6234c38a6ea7e4f58e7da035ef6ab4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a0d3d73c112e1ffbb8cc01098b9bd2a3087b40f
Message-Id: <179254329058.289274.8850742191656357692.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:41:30 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 15 Oct 2026 13:44:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a0d3d73c112e1ffbb8cc01098b9bd2a3087b40f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
