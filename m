Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F43DC4B8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898367; cv=none; b=pMefjKEr7MACZlT9nEZ10Ya340ZcjslYHGtCBa7J8ciUfDpz4o+PWzVGqfZ5rQhiVwll6GNF3MBYCw3gbqYyVfEaTLAaN1GSBwVH4O4iFy1/8Srf92RkRuJ/egD7QBFQObbBdTeIyWkVP2JP1JmAwK9KIQVtA75erBzeK32xD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898367; c=relaxed/simple;
	bh=ZFNBDABJRO6JWa4olUfIapDxkuge4CcJgYicSgLWpGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCZHyb9Dl7ivuhM/GznlwFSrvsgVM/RMnCetGP/iALlgB3Ao2wr5zfMefReiZmoiw2ysir/YSdxwx6hIYMuOv6xLwUmJr2MasgrPLuSzymROgTk93QWFXIUW7GBh7jJ1KpXDVVCMFRQ9OyM1zD162YwlJ5GRra/ycBt0WsP7qbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azezaMqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azezaMqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1580A1F000FF;
	Sun, 20 Sep 2026 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898366;
	bh=25KWYzuxAInrQX9ER/ay9H3W4gfHO2tjs8JLkfc4F+0=;
	h=Date:From:To:Cc:Subject;
	b=azezaMqx9KkQnG+b4pNmIw3zCN+DdWdqJUsG5Dh2uRorAGBEfCR/LUKJ0J3/TcCwZ
	 voXx1AZJhWFeXuOk/TitKXbEwgy+njcBJGD5NEdxW5b4yHbZDB4wm04S9MialQYas6
	 qvcqFtTUTeeGiJ7Z/s48XmQlDhqgAqb6JM6JzPqw7nolmcN7MmGh5GukQ5FwpoM8iG
	 XLjdw8Apo7E9rKIN+2XtDtXgVVmf+MEM44WLBK+qpm5oZC8Ml859hqs1SNUql3kyvD
	 DFBtI1Yhvzb1Ac6iS0wd0UMCp4It/8vXVSVOMyN3QYSWaXswN5P3A73rF+cviMltyA
	 e6UkaQ43E4gVQ==
Date: Sun, 20 Sep 2026 11:59:22 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <aq-uep_xbMeGoGTF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-20

for you to fetch changes up to 63edf5a009ae366369a1b484cd9ae4ee7c51946c:

x86 fixes:

 - Reject the loading of a potentially problematic microcode version
   on Intel Granite Rapids systems (Chang S. Bae)

 - On FRED, reconstruct the proper #GP context for rejected INT
   instructions, to fix a signal ABI regression (Matthew Schwartz)

 - Add a test for this signal ABI regression the x86
   self-test suite (Matthew Schwartz)

 - Don't emit the new and not yet properly supported EGPR instructions
   (%r16-%r31) on CONFIG_X86_NATIVE_CPU=y builds (Chang S. Bae)

 Thanks,

	Ingo

------------------>
Chang S. Bae (2):
      x86/microcode/intel: Reject problematic loading on Granite Rapids systems
      x86/build/64: Prevent native builds from generating EGPR use

Matthew Schwartz (2):
      x86/fred: Reconstruct the #GP context for rejected INT instructions
      selftests/x86: Check signal state for rejected software interrupts


 arch/x86/Kconfig.cpu                     |  11 ++
 arch/x86/Makefile                        |   5 +
 arch/x86/entry/entry_fred.c              |  11 +-
 arch/x86/kernel/cpu/microcode/intel.c    |  26 +++
 scripts/generate_rust_target.rs          |   5 +
 tools/testing/selftests/x86/Makefile     |   2 +-
 tools/testing/selftests/x86/int_signal.c | 311 +++++++++++++++++++++++++++++++
 7 files changed, 369 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/x86/int_signal.c
