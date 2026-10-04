Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5170F2E4257
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099824; cv=none; b=iR1vtwSqtCGFmvhfgT16NrxafrIlPe8Xju7CE9HHZpA0AfHFe8HHNI25YJC7LYnj6FhBIct2UcYZGz3TP9CngrqHhYykIHpBVEUgDWwQZ1sKoVmPB5eLQNzO2f3MBKvR0Fh3awTpulo3fWyXhpHsZxRx5K+IE99qpCAzX5/ocds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099824; c=relaxed/simple;
	bh=1ftuBpDVqiLs+X/1Z4i/fTkYeG8rnGta3flkDPwSnIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mb+Q05sTrYxZUTJ0/5T4JpIiAuVU5bvtmM194QIBvDFpeEhfu60Sa82p7twJeaZ65qsrw9mp6LtKZ1m0La/DGP6GBMlgGcKCqYf2UFqAutkPd4nHaF34AF/H/niXcNSiRenraHTuz7FMnqVyUjOaQ8ILtvA2PRxMewUDHiRLic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k61gGGgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k61gGGgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1866E1F000FF;
	Sun,  4 Oct 2026 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791099823;
	bh=hemtFChyzvGf7rcXcGKutVCVshhWY4Sdwu58nmE2jZU=;
	h=Date:From:To:Cc:Subject;
	b=k61gGGgZ6HNpjnCs+b2vLkWNr9gGLuYpIdohF57VGCgKpIB9PtplU6tkx7oZU47fA
	 ZKJdyHE9/ljURsIeJfXGK2vrvkS9QCJEdjFGZueL15I7RBQRt3V2GFf5urHIFYMFYg
	 RlXYvLbepE2PXOwvxJ6jlu7HcBrkMHior7NtiLqGrXEtC0SnJFNfH1Xl0JTDftjMNX
	 ucqXf4p9yXwcF2eGsvJlPDcVDl3x9zQpAMiO/5iQ9ymL6EwTOm/2oFtix+AQIHu8EW
	 ERwuKN3BITTt98kc+i/N++0yUol01LebtdTNOIat3r4SzF6BYSy5zYoV1qflGyFmIL
	 +67slhnM5eRmA==
Date: Sun, 4 Oct 2026 09:43:37 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fix
Message-ID: <asIDqVbUHoqIkkfP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-10-04

for you to fetch changes up to 28fa9af353bed2bb738c46e31f9b7d0347b759d1:

Timer fix:

 - Fix task work flags management regression in the hrtimer
   rearming code that can leave task work items unprocessed
   (Karl Mehltretter)

 Thanks,

	Ingo

------------------>
Karl Mehltretter (1):
      hrtimer: Use the mask to clear TIF_HRTIMER_REARM from the exit work


 include/linux/hrtimer_rearm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
