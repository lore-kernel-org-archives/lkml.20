Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B271DD525
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209100; cv=none; b=YBAo1zZwugpKFDm2cTaDWH4v4Kh+R6AZB50RwELGRzGm8boxzCFXuPHR0nOUOLE7htgTpPI4XSQeKMRcz2UqDjR665Bm7F6n2eZxiUawkswlbh8njQZ3Wu+ZFI4M40kQeA7DsEnA+opJXQo7iK1p3xN5u//EqNUnJG2wZX2WnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209100; c=relaxed/simple;
	bh=xtNc14UNVQkR+EwGZF7OL0Whswwwd+/ddQGz5yFN8nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ft+1ljQKPAx/7omSCGYMhDTZZLGh0Mxe4SebG7sZoeZkaXixX9Hv/2iobm4tbXEQeKVU5q1Vn7NFYIqkrPkmD3XSpJ98k255pvg47f1+PHuqmsi6ulLf8QZyX00LtSfNanN2fNfvwXfpQ+BSuoIyXe+SNex4FyuuKBZZROYWsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7XzoKeC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7XzoKeC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211EF1F000C5;
	Sat, 17 Oct 2026 03:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792209099;
	bh=GuvWOhmBQWWas+ZVZKRKfp5l450SEqqg3KYl4l2ymjc=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=f7XzoKeCcFun3i0tgQUppLVr+m4ZRFew/b2pc+2LFo8/wKlELppX8q4apL2GlnrMM
	 gjXDRfUt1mCNMXYZJfukJJAtDcs3ztdi8NEPTWm78KCH5DoyTQxKlTgUbdGqNLArGV
	 Md4YhBcZ/ynUO3jwzvhrAe43YRU9xOojcvrwBN8KW36tDx+PoyhqgEs9fK0PNb77wI
	 L9C84u4iNmOzgxbhyWQ/57ZDnUcd+hyzhhmG9+aALcJZgV8e8OOkjB+rDA6r2r5p3e
	 DNGKdcnktEgppt3L470Ip5EQApiNTWjuEZzc95ijQ6X57ghsNJ02IBtxrXP9X/tAO0
	 6NWijFpn/js3Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BDF04CE0D69; Fri, 16 Oct 2026 20:51:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 20:51:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
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

When the v7.4 merge window opens, please pull this two-byte cmpxchg
emulation:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/cmpxchg-emu.2026.10.12b
  # HEAD: 558ccc91ddf98d58ae726ed7ccaf5838f284084f: xtensa: Emulate two-byte cmpxchg (2026-10-12 16:36:53 -0700)

----------------------------------------------------------------
Add emulation of two-byte cmpxchg()

These commits add a cmpxchg_emu_u16() function that emulates two-byte
cmpxchg() in terms of four-byte cmpxchg() for architectures not having
native instructions for this purpose.  They also make use of this
cmpxchg_emu_u16() function in those architectures, namely sh, arc, csky,
and xtensa.  This permits use of two-byte cmpxchg() in common code.

However, it sadly does not permit easy implementation of all algorithms
needing on two-byte atomic operations because there are some systems still
supported by Linux that do not have native two-byte store instructions.
There is reason to believe that these systems will soon no longer be
supported by Linux.

----------------------------------------------------------------
Bradley Morgan (5):
      lib: Add two-byte cmpxchg emulation function
      sh: Emulate two-byte cmpxchg
      ARC: Emulate two-byte cmpxchg
      csky: Emulate two-byte cmpxchg
      xtensa: Emulate two-byte cmpxchg

 arch/arc/include/asm/cmpxchg.h    |  3 +++
 arch/csky/include/asm/cmpxchg.h   |  9 +++++++++
 arch/sh/include/asm/cmpxchg.h     |  2 ++
 arch/xtensa/include/asm/cmpxchg.h |  1 +
 include/linux/cmpxchg-emu.h       |  4 +++-
 lib/cmpxchg-emu.c                 | 38 ++++++++++++++++++++++++++++++++++----
 6 files changed, 52 insertions(+), 5 deletions(-)
