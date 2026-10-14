Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D675A496D34
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017196; cv=none; b=KMDzNrfg9s05+LePvlOKgJz0t0ZeBqIzy1vnaDVT5mHZRvha6U0GtBEeuPTfGczusWPJpUlzwqBpWSO7k1DBffqnOyL0td0Gbvz/qhfwtbTYddHhLJP7VMp3w0QTM5LOcndCEysm0eu7hp9uO6Nhr9IZY3RXbG3T7tRPvA+r988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017196; c=relaxed/simple;
	bh=2L7mEX8x7eMJsXognkazSazWXYN+KMBDPZaLQ0SIGpI=;
	h=Date:Message-ID:From:To:Cc:Subject; b=rcA30j01KgEQRiNILZvDgst62Ktd/9spRs4uwYIrzO+QEytTLLazgHPMuFHvhvBV1vDLejayd6mLg5boMexzcUPUgWZMq6ICdQm0x79tRtFO8j3f6Bt4P4d8mLaGGvLfVte1jL+HS37GwjTe5MZwUcn6b5s5U8bynbI6RBqqlOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZK14JTMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZK14JTMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C251F000C5;
	Wed, 14 Oct 2026 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017195;
	bh=9AsEikHN2a7o1Jg3hpG/FkgnZkpzKkePP5w5Ahu0oD0=;
	h=Date:From:To:Cc:Subject;
	b=ZK14JTMIvenlBhOocInAYDA1DfgA8Zt/s9cPM+TOn13T4xbMsye+vEyNajvAcjvF1
	 sYm15/0h+dhfCgjauFDN9DXcaqjwyIuPne+jvf/dWdKw/tDxbjQE2P4thTdMIvG6BL
	 OlFhfnnp3eKeJOq+EU8XLLEZaCi7TGY7hlN8DlIDxpNJ6pb4SIjHmz/2pq1B5D1W0R
	 VITe3ZHsK6YAxr7hXR9uy6YjsDCPOWcJ3XdxcYxSfPZ59fwF4M9oJGnmZpqI4oUv+4
	 pMkuD0W7TvcPK7RreN5IPs4colBxpljuZWSAzh+GDz/4JcuDuspI2TlNHc9CzI9dHj
	 ycnoPN5EB337w==
Date: Wed, 14 Oct 2026 12:33:14 -1000
Message-ID: <b947d220cd9f47e9778e0c10e4a27164@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Fixes for v7.3-rc7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

The following changes since commit 7b63ef2d55f24519e7e9e5f4d15dbea03f126e40:

  Merge tag 'for-7.3-rc6-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2026-10-07 15:58:48 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc7-fixes

for you to fetch changes up to d1a4549a3645e55cc9ade09e360280590b3c9559:

  workqueue: Fix NULL current_pwq deref in mem-reclaim helper (2026-10-07 07:57:17 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.3-rc7

- Fix a NULL dereference in the check for whether the current task is
  running a memory reclaim work item when called from a kworker outside work
  item execution.

----------------------------------------------------------------
Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in mem-reclaim helper

 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
tejun
