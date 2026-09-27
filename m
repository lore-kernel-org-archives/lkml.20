Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1318B3C1D7B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498949; cv=none; b=Bez1EN4IlYG8UUFIP2H6kVA6YFSsUphKAczGdVk7aDxfCKKCS40YFYsReLIoU1LkXqaXao+9Ci+IUPQ8cHf2OLdrAazc7iArbtcYdI40qf0zuGeKDQF5CiEBHi05w3ApN4v4INZlihSf15qQ7uIRm/vq8qe8Fc9pHS/rjPeuCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498949; c=relaxed/simple;
	bh=oRFLk3ihA1f5kotI0lvRltw2rAz+6QG1+laVImz0saU=;
	h=Date:Message-ID:From:To:Cc:Subject; b=uU2WaP9Ige9SlHAhkW0K+9jJSCIiTK0KnjdZiRQLo7kvj3ZMQFSP4ZjerC9yXLdkBdz7yBrieFxmXyAd7HBRSpAUsxnEkmAmxMv9r2jbFO3Kf+k3Qe7LpSQOIS2MaJYdjiGBnkkcc+gEWNefE8OvawAR2eL2zZQXQPm1Eqq0kEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItyyKiqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItyyKiqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD531F000FF;
	Sun, 27 Sep 2026 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790498947;
	bh=wx7ZbZ+oquuzQ3H+o+tNk/0eWXkSltW8jaooGuoMFnA=;
	h=Date:From:To:Cc:Subject;
	b=ItyyKiqRAf3CcagbSzfEyP7HiyFNRf50vAeVhfWjyZUJ40/3zjH8g1zP89DKO8qBF
	 FZDppOV4e2F2Tg6eC+Bu5QtwJiehhZhigaR9EaqjMvrL3792KVtXYE2rLiTB7AfhsU
	 FwG1pzULv6jfAi+kf2ctiJ0xJRdnXxGHsFC1muCeT4zOfQki33G2PxeUN0FEYCCMXa
	 EPk5F54CddfbtR/4Lam3Cie3He05xGbbIHrSMKeBHWjP2RRYJC/hAOqd+uh2FGQ7Z7
	 iTrPGRw/SI74Jtd7uEZXVd27BErnjMFSNE6CsA5PdMpoYyHkuvOMx4fAWtkZowYJYA
	 CTp8FDZbuvy1Q==
Date: Sat, 26 Sep 2026 22:49:06 -1000
Message-ID: <6b8546a8a2435140a96c6d8351c06227@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Fixes for v7.3-rc4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

The following changes since commit 93e257938aa67a6c957217db94091d9d9e5d403f:

  tools/workqueue/wq_dump.py: Support backward compatibility for wq->attrs rename (2026-08-31 10:17:08 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc4-fixes

for you to fetch changes up to db6365ced4d5855e321f772b240c0e473bcfcdd5:

  workqueue: Fix NULL current_pwq deref in flush dependency check (2026-09-26 22:18:50 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.3-rc4

- Fix a NULL dereference in the flush dependency check when a worker flushes
  outside a work item, such as from the OOM path during worker creation.

----------------------------------------------------------------
Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in flush dependency check

 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
tejun
