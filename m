Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1907A40A93D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099256; cv=none; b=fu4Z2DSnDjOrZx3B8pfgCtUR/cIBWFqfpvq5NdGo1bGG9jfuidDOkf3zhr1nwziEKddl+aa1780rYX+V1nd3vMNt9Ne9ovTkXePmOoXkRamfhiZgX+prxEARyawFZBbNuUuuibA/pmPh99gCy/OmGyFG2eja9haE8RKg9ZuneHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099256; c=relaxed/simple;
	bh=K9f82waH5swdL8XFEPiO9i6IYHDv/BaNmSorOXik5YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctiZEUIDkFnTDGxnF3FNC1zchwkrbqOYcmU+8HINVzsKvQLXhaZc+pLT4VuZpeHRqLxlYqdWWo5cJJIyQuEFyuzWRfj3wW5g2RqrSF5Q9AICrfXfNcDn7KJ+yGDaA5faP35iKN5q8gYN3Z62Gn+y8zziNpGRMZUck+XsLWBCh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPWTHPEe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPWTHPEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DFE1F000FF;
	Sun,  4 Oct 2026 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791099243;
	bh=E/jNLSYka59rFh7voqa3Qo5urJx3ClV8ZS/bWU3F/H0=;
	h=Date:From:To:Cc:Subject;
	b=PPWTHPEejtHKGswxjH5G4hbOi337zpY+puOyVA5IFg5OKa3vSqC/3wcxzBOSeTt4w
	 gid3u3S61lkZS/ByLBga2n+qpUa+WYHA5riR65O9fRqBF6OXwKCGL2rrBg401d4dJt
	 OYAUrk30VLOcSSXA1eXpCKcuJFACpg/fmxzaaCvg7lihiLWE2E7p0Jn6pFICE1iTwD
	 t1qXPdbSGV74K2DgublecBaVoMHKeWZF1d4THFk/FFLr8jC+VWF4C2G3NM601QehTc
	 0hjJn5RtSKuHQNWBkcpCfCrXMyPQXDCl4I6ekRnmiHwe+IrxJ8UCa3qdwkQ4nCNrrP
	 Uf/rW1AOLqXAg==
Date: Sun, 4 Oct 2026 09:33:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking fixes
Message-ID: <asIBZtGFdG_P2c2d@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-04

for you to fetch changes up to f35e3b5784221654f9cdbd6222275a7fa203f6c3:

Locking fixes:

 - Don't run refcount kunit self-test when !CONFIG_KUNIT_ALL_TESTS
   (Kuan-Wei Chiu)

 - Fix futex private hash use-after-free on resize (Chris Mason)

 Thanks,

	Ingo

------------------>
Chris Mason (1):
      futex: Fix private hash use-after-free on resize

Kuan-Wei Chiu (1):
      irq: Make refcount_interrupt kunit test selectable


 kernel/futex/core.c | 10 ++++++----
 kernel/irq/Kconfig  | 12 ++++++++++++
 kernel/irq/Makefile |  2 +-
 3 files changed, 19 insertions(+), 5 deletions(-)
