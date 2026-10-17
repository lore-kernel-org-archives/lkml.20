Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04812D21B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209289; cv=none; b=myM6oKpiTAmXxJwvuTklPS5xcdV0roMZERdgPFId+ySRI2IS4k/uNMmBJ+MydAXITN+CR3Samv7ReAwev5VOqn9FaTT9rzSPSwf6IYyPcCoDIwBi4IWyFvwhOLIU2ekn45RvR4Ed45bwkIv4IDBGYL5Hyiu46is4gUvP8LnHjzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209289; c=relaxed/simple;
	bh=71hk6F22bai9CrsMO8K6CXWZJDoccTMtSGjsithW32M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXDSlwM+rSvT+IEmAoWmaIKpPBBBiky+XB+pumkce99STgCJmNjDCR6e6gUYrYnEoZvto+VBvN0XP+eFSebfIGOYGrpAGx75iHujNZjb5VAi9XaZPRWMCx+G3l3PD7PAAYmdUfQwd4yIaYyDvGJ0I2XMFCFtop+424IuxCkeDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyEcwSNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyEcwSNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7F21F000C4;
	Sat, 17 Oct 2026 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792209288;
	bh=hS8/mxrBAKFYCcZxHRKtNUxiSTgLMdYsOY6RaWIMWuY=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=SyEcwSNCBs2R5xTlCu1tC8qckfbExpERMXk51YfYzI3xtc6tKV62agNJPZsoPsq1k
	 dAlai9F0CVQgH7byhXEv7/w5tNGGHa7zl90D4hgmb7tLCn/bt0Rl/mzQzAmf5Lbi1D
	 7n/0r8UkKIc1ISG5Fl2xkYBRxMgoIOgjXiLjsoEO7k8GV/X7LFw44MF1i+1gI9X/gX
	 TEIiecYMb3p910xLCAU1IjvU9KPzHFzzCfIzmS8C9jcCUS16TpQS/bRu83w+tlMp/w
	 SVVtmGls7mC0z9b9shdmkWVfp3wUJ/7w03EQbgRnE086+kW3jjWKBUsTyQ6q298FcB
	 KNYsKsI3Rx5Uw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 07085CE0D69; Fri, 16 Oct 2026 20:54:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 20:54:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [GIT PULL] Report recovery time for CSD-lock stall for v7.4
Message-ID: <b854ac43-0f6e-4cfb-a18d-6586410f0902@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Linus,

When the v7.4 merge window opens, please pull this CSD-lock update that
reports the time required to recover from a CSD-lock stall:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/csd-lock.2026.10.12a
  # HEAD: f929e61143a2842e8f8ec9f2319ee19dbb048e32: lib/test_csd_lock: Add a module to stall a CPU on a CSD lock (2026-09-03 10:45:17 -0700)

----------------------------------------------------------------
Report CSD-lock stall recovery time

 * Refactor to simplify csd_lock_wait_toolong() function prototype.
 * Report time required to recover from a CSD-lock stall.
 * Add a test of this reporting.

----------------------------------------------------------------
Breno Leitao (3):
      locking/csd-lock: Pack csd_lock_wait_toolong() state into a struct
      locking/csd-lock: Report how long a stuck CSD lock took to recover
      lib/test_csd_lock: Add a module to stall a CPU on a CSD lock

 kernel/smp.c        |  77 +++++++++++++++--------
 lib/Kconfig.debug   |  12 ++++
 lib/Makefile        |   1 +
 lib/test_csd_lock.c | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+), 26 deletions(-)
 create mode 100644 lib/test_csd_lock.c
