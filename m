Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3001FD4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788691871; cv=none; b=LOLPCPQGaZRgmnM7jY6FyBrLoQFTRiSIqsm6l9sc7dbex6Dyxu6LlStU/SojsRb8a7CPSIkpgbkWoX+bA52u1GANF78VWiAwnsDGsxNEQPED23+0h6HzOCGCbBTs61S38LBtTruwTklXsjegHqqD/u045WVNbHCLTgX6MLblDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788691871; c=relaxed/simple;
	bh=D78AXzfkhd3aHv7nTgC48ZpMJodL0kesvUOGigM0hO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJZTyNZ5oZiB92tQyX4mTY9/MvQQ4sorQnalmOS9Ylg4QoXtCbR9iSeXEh3tv/qxfsFDIuDNbjc7jZwN1PeIu05J0hjzTMOJWQJxr6bHt+7BfOwAJ/tNa7uHWdbiKjaPNDcFq1+Aro/WG7H8MfmKpqSI57yEHjcmPBQZybo+L54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4a6x0tE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4a6x0tE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C631F00A3A;
	Sun,  6 Sep 2026 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788691870;
	bh=bEhX8wcyW0QmLwyv0nv3NytxyBtM2P5YDX+DEl27I9Q=;
	h=Date:From:To:Cc:Subject;
	b=O4a6x0tEjPL5+RUMmz/vEvNtQOkZWNG2h1M87+nFCRd6LoTVeoRrNx/Fdm0USrNo/
	 Se5phRxPa1cvOUMGylIl0+pi+e1Ha2VD6THoSgqK9RjHkYBYQeGiIZgrZp0rTxG99k
	 lYu9BbYNkHqz8idvkwh0y5g3iB7/pFnDxUYMowHIdlj/aCUrKfjk+J3rzVY/0oHVIS
	 SGAagDCBvQEiMSB3SzRVk7XwGvf9dcBi3pVSbHvitbtjiUF71NC1Ragrrpu3mpijM+
	 TaIeitXHEY4f6Sgh4XeK7ISZOb9ntYqfgP82N1y58EtaB1YHqEtwBDoTr9o0NmNAQU
	 XM51jJg2XRhVg==
Date: Sun, 6 Sep 2026 12:51:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fixes
Message-ID: <ap1FmTYMQ3NVpRs3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-06

for you to fetch changes up to d31fbbade43f880b7e59e2b3a72722fe2725d93f:

Miscellaneous IRQ subsystem fixes:

 - Revert a commit to the mbigen irqchip driver that caused
   a regression on two-port Hi1616 chips (Caina)

 - Fix a too-long-preemption-off bug in the stm32mp-exti
   irqchip driver, caused by a time unit ambiguity & mismatch (Ju Nan)

 - Remove the now completely unused irq_domain_add_linear()
   inline function (Jiri Slaby)

 Thanks,

	Ingo

------------------>
Jiri Slaby (SUSE) (1):
      irqdomain: Delete irq_domain_add_linear()

Ju Nan (1):
      irqchip/stm32mp-exti: Fix the unit of the hwspinlock timeout

caina (1):
      Revert "irqchip/mbigen: Fix mbigen node address layout"


 .../translations/zh_CN/core-api/irq/irq-domain.rst   |  4 ----
 drivers/irqchip/irq-mbigen.c                         | 20 ++++----------------
 drivers/irqchip/irq-stm32mp-exti.c                   |  4 ++--
 include/linux/irqdomain.h                            | 18 ------------------
 4 files changed, 6 insertions(+), 40 deletions(-)
