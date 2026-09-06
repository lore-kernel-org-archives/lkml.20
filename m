Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F288382F1E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692767; cv=none; b=pkNLCp+agl09upvyah5oXzgI/AG/iNTxWC/gwZZdI4PPnvaYaKf9TTkIkgzO/bMH/0wHVtcAsuXa7rm8wo39iSA67DfTUvKxlgxi5T555AjAd4Y0ShxM0LhLeMu16rXrw04odHQczrN6GH7CvqwlFZP6+K1YvTGi4wk3CMlQhw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692767; c=relaxed/simple;
	bh=Su0tIq/GIelDB5RB2aVq621lNIcoc3dc3beD6EnDyAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrh6fV5U74YK8bd5wM3bPRkc28HPhwHf5owb7Pe8xy5F8/ZzotsE6znv/qdDbUY23RedoGHP4gh3piSgykl6X5f3pthHIolTjzxZWF9FE6aEGxVEEDthQ8llKWjlL/0Rfi56Dsw/zVFIyIBbre5q+obfnh/FreB235aqBTsfeWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbab9x3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbab9x3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3992D1F00A3A;
	Sun,  6 Sep 2026 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788692766;
	bh=qWkhcrfoluZTusjIqEXcTzOP+QIuSbxwq8qZHuJcqeU=;
	h=Date:From:To:Cc:Subject;
	b=Gbab9x3gijUrfi++1HDaX1TyIhMZ7UrVK9KcbS50mWt5hKJU9xWTPkNF8ONCdAf+H
	 JIQHMe4qHm0rW8JBxB1tnEomsS/Mqnd8cqoziWKmKTMcxFzivy7Adoz9VsN4a+dC7k
	 ilThOYCMCGP5e4vDwvlZPVVL1t/J3HWyDN3nU8+l0cHyLDAnIUjZYy1sL4ua/c1HZi
	 A784jqYgZ6vzvDz/1et8rNzpSizOBLse07FmYiqZtbE+fwWoZovBQOXwlIJJUwivrG
	 opxZeDDddNNP5d3EmTrg2OJ337OOIryX8ipqo4Zv8BLF0XUWAyQo8/RUS9YxpeeB+S
	 3x5tjFczOP+Jg==
Date: Sun, 6 Sep 2026 13:06:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking fixes
Message-ID: <ap1JGTb994--S4CB@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-06

for you to fetch changes up to a3b8d46fe401cba3a5c46dea610e6eb3dc15370e:

Misc locking fixes:

 - Fix a softirq processing delay bug in local_interrupt_disable(),
   which should mostly only affect the Rust runtime (Boqun Feng)

 - Remove the hardirq_disable_count() function which caused the
   previous bug and is now unused & unnecessary (Boqun Feng)

 - lockdep: Invalidate stale class_cache entries for zapped classes
   (Eric Dumazet)

 - Fix rt_mutex specific futex scheduling helpers
   (Sebastian Andrzej Siewior)

 - Fix rcuwait use-after-free race during futex requeue PI (Yao Kai)

 Thanks,

	Ingo

------------------>
Boqun Feng (2):
      interrupt: Disable interrupt before modifying hardirq_disable counter
      preempt: Remove hardirq_disable_count()

Eric Dumazet (1):
      locking/lockdep: Invalidate stale class_cache entries for zapped classes

Sebastian Andrzej Siewior (1):
      futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling

Yao Kai (1):
      futex: Prevent rcuwait use-after-free during requeue PI


 include/linux/interrupt_rc.h | 22 +++++++++----------
 include/linux/preempt.h      |  4 ----
 include/linux/sched/rt.h     |  2 ++
 kernel/futex/pi.c            | 16 +++-----------
 kernel/futex/requeue.c       | 12 +++++++++--
 kernel/locking/lockdep.c     | 50 +++++++++++++++++++++++++++++++++++++-------
 kernel/locking/rtmutex_api.c |  2 ++
 kernel/sched/core.c          | 16 ++++++++++++++
 kernel/softirq.c             | 17 ++++-----------
 9 files changed, 90 insertions(+), 51 deletions(-)
