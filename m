Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570EC45198B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316717; cv=none; b=YEmR+PBmIRP4IAMAZTF1bSVr8kMZRwezqZADX0sJ4Nig+4Uta1E0EbZKhWS+QaYNU1NyPk7j3vbaJ0UaKWeJ0KZJqN3VFron2WhPZmkXQI5u3nhvMInHrzMUVZZS0cHVOfGd++V10Q59MdALJZYBEHKeT8wdIsollVrSov3B0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316717; c=relaxed/simple;
	bh=1+/ebHYj6uS6dPSR1NkyqNwhPbhp4umFuQcMF2n1ISo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GU9/62h1/1nKwF42dowYqE0rzWzBg3XltbCguW59Z63m49qpnJAoYQs0I7omYN/J9K7daYAqcbfZOkmaG5I6Z+PMD1kraVIrnLZTIbzeNuqAQ+6/YhbyJl5KYCDBFQCAC/QBm7qHUecCimmrQ/e1q00vH8NEjUz3BluVBF93eWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQAsKHNd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQAsKHNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B914D1F000C4;
	Sun, 18 Oct 2026 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792316714;
	bh=sUPyIm6zmpb2Ds9+mC9XLXu+SFCXWx9o8T9PRdsjW9w=;
	h=Date:From:To:Cc:Subject;
	b=JQAsKHNdZH0oR+TF1wfIh0IXlnLSJK26oTC2sZKtWiZWdC2mxYTQnO6XC2kFyLB4w
	 +BWncuCvwwvKjeHdSZbXhP0oO8HxMSKGuX73Wh/BsEMJWGLRylSrmw0FHlbvbMdMEQ
	 V8bdb0vWcrL9H6+PgLewP3r+3A7uZRPhBMqGvUTW0NUvdiVVWlMIQSNFDmB471Cc5m
	 aqdozrzlbZdOG4GI8+gdrzb6KMs4Wb2mU61TkPGbc8b9LYhveyGwmHtg+tjhQ+rtKt
	 /gwc23xD5vPv0VuNveG0J8CNW7hHiFw3Wo2Ia4IgMOdSZmpgmRAzixNclM/2xF59sK
	 AE/WVZDMWyVTQ==
Date: Sun, 18 Oct 2026 11:45:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking updates for v7.4
Message-ID: <atSVJgnfPWO35u2U@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2026-10-18

for you to fetch changes up to 67e0eadd862616cb22145d6117b79b79c4ae48fe:

Locking updates:

 - In the refcount checking code, BUG() on UAF related errors if
   CONFIG_BUG_ON_DATA_CORRUPTION=y (Jann Horn)

 - Add {over,under}flow detection for local_interrupt_{enable,disable}()
   (Boqun Feng)

 - Add kunit test case for max local_interrupt_disable() nesting level
   (Boqun Feng)

 - Clarify comment (Boqun Feng)

 Thanks,

	Ingo

------------------>
Boqun Feng (3):
      irq: Add {over,under}flow detection for local_interrupt_{enable,disable}
      irq: Explain better on NMI_MASK overflow condition
      irq: Add max local_interrupt_disable() nesting level kunit test case

Jann Horn (1):
      refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors


 include/linux/hardirq.h              |  2 +-
 include/linux/interrupt_rc.h         | 13 +++++++++++++
 kernel/irq/refcount_interrupt_test.c | 22 ++++++++++++++++++++++
 lib/refcount.c                       | 15 ++++++++++++---
 4 files changed, 48 insertions(+), 4 deletions(-)
