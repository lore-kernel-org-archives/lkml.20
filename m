Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2118C332
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777477; cv=none; b=igyBr6t/aZaP9h7Aa4NsBB24qjZI/gCDcU71YXWhlXXRNOQmlZxjWqzOVKHQ2dhopKQHV/HOSMYbYPJ9/zE4oJYVqN6CgrnQW5zNUHB2bqG+HQzzduBKvoZlhOPh5ISC/mIlo7UDVPgSCDpxs0K6X6YiRJv+OmtUT10QA0Zwzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777477; c=relaxed/simple;
	bh=7vj8fmdE/m/aF6FxJpvfcPnLKigWkV8j6SEozqaFQlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVAPPgxYySlx38FRk3HAPutlwMYdwSs5Hjyp4fCT3ID2C4hQFqH9ceEVspLxYAnPJwrT1JtzGR725RL0zvYUsvDuFh5OBekaBj41DQNRD6wWlpo3zo3Jam2Zj8tebsQYwgjDIeBfnQh8uX4trQqbp6JCqsylFPPLLqV1k0FuOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQ8zoleT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQ8zoleT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C821D1F000FF;
	Sat, 19 Sep 2026 00:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789777475;
	bh=41FTQXjrh4Bg/pC/Z/rzVyoJwFVLrI0d/jbmhiFcMtQ=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=DQ8zoleTu390MxWCUDDfLcX7oEOad9x6i2bq9f/TpCH6ZFqv2xgLg0NJKILwEqSoy
	 hZAeB83V1IrhE6fCsXIsAmD2E9FKvrIePVUvTk3bt/Xf0atZg4lDd27Rrivt6G0/8P
	 QDD6QUl03z3NL0vJMSfcW+D9n5wPciPPD/JZdSalCjm9a/9ioH+Ipggr+FaH4l+BBD
	 Zl4RtqNqmnSsDg0+Jee3oHhWxZOOnKD12XOprZT66cjYz0yv5pcxy1GLVzuPwg3DYM
	 IG9ThGb9DAkFzKtORdKaLTK4yTzSrV/2mo2vUFwjIuRui4HVlUl4G/CFoQuF1DhAgJ
	 Nk0gwYuBIe+fw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8731DCE1775; Fri, 18 Sep 2026 17:24:35 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:24:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH RFC] Fix data races in timers
Message-ID: <d432e78f-1d1b-422a-8622-8d3145cecbfd@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

In CONFIG_KCSAN_STRICT=y mode, KCSAN finds (a very few) data races,
one set on the hlist_node ->pprev field and another set on tmigr_event
structure's ->ignore field.  Therefore, fix these applying READ_ONCE()
and WRITE_ONCE().

1.	Mark updates to hlist_node ->pprev field.

2.	Mark updates to tmigr_event ->field.

						Thanx, Paul

------------------------------------------------------------------------

 include/linux/list.h          |    6 +++---
 kernel/time/timer.c           |    2 +-
 kernel/time/timer_migration.c |    6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
