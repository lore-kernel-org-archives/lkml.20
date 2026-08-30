Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE223EAB4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788057801; cv=none; b=axTtKXZ5eSsQXiTiLs3Xsmu2yYRaQneix929+wTT1XvdScSArX1pGJVICBINODNDo6hhVe3z8JmUS2JMyVHmnXDszzRfcxceHsRIWVZLoK3dH2Pvgydoo6nfTLK3FA4rsPDhSCZsv2pEmwnCvBOBTQfPFIDaZJ1xvaHooNgSo7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788057801; c=relaxed/simple;
	bh=X1HhHT/QJAja/4u4SeR0w6Q79hddOH2yqsT4o/SeHxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3kCqH/XgEtDNDVigXBtT7AKZreaMM1pigYbvIHqIrNu8sJ7c7Fga9ScuUarpoy9n4pW2mvmDJ6cAN4mIFXxTDw3xIv78t2nZtG3vIwDrvEAzddHdQBSoXXtg/ZUPMo76cusNwkJcbww1xxQ1Kbt2svn3SmHJ3P7eFc8/xDpCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKKk3N/y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKKk3N/y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC111F000E9;
	Sun, 30 Aug 2026 02:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788057800;
	bh=ZJ0H+MzkYnsqqRo0W9sZy0tMi4J239dYgn/XGBzV54k=;
	h=Date:From:To:Cc:Subject;
	b=YKKk3N/yqqq1Ejq0s7zHk01OdCjcB9q1L8gndnEUsw0k1G2JaJSFEzfYh3pxZeABf
	 kRk0hO7/DGl5R8188NR8EgxUzn+tq0OIHAPIvHNuc3paAnu0Rw9FziypUvuT5wwSnm
	 /B0KylkfGq+d0yBcKEYZyKoRHKsR5pcsdWe20OzQ8d9gyfdKberWVu/RlSROvLMIwO
	 EwwQS5SijNwUFmJs+XzlTZ10AEX8iaD6d0Z0pGzOfNZO8AmsRWsIfhKldDydHUHLs6
	 Bm4y7gz8ymBrHKAvO4rn8ixEmiIZz6aOvAbQPLskMB1HeTL3Sxw07YfKSb+f+BLOxj
	 5TwxoJNlAK8oA==
Date: Sun, 30 Aug 2026 04:43:14 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking fix
Message-ID: <apOYwlQs4nKjVqJo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-08-30

for you to fetch changes up to 46094a7708b7945cb7eba9eb887e3ea9757440a7:

 - Revert a commit to spinlock cleanup guards that got caught up
   in the subtle limitations & fragility of guards (again...) and
   caused a regression (Peter Zijlstra)

 Thanks,

	Ingo

------------------>
Peter Zijlstra (1):
      locking: Revert switching guards to _irq_{disable,enable}()


 include/linux/spinlock.h | 26 ++++++++++++++------------
 kernel/sched/fair.c      | 12 ++++++------
 2 files changed, 20 insertions(+), 18 deletions(-)
