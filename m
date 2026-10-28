Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207365;
	b=qXhqnLIZizLDnVu9+Ec9m5pDMxcozJtJ/qsQMNtX5u9654YSTE5RmTSRYW6a4vI5Rnb4
	 oA+agTArGuKqNZslRd2j0IB45zdQ6N6X2uCbKYB0hR0S59oDX4ir8EvBBBdV0ejTcTzSX
	 xcpFAE2qU0xBESgwVzMLBPysHja2vTmDzG54K6eSuCS2Gwe2OtE4wZ87h1H3P6DFV9Ive
	 fKSAn+WN9f+x3T9i+gTTj378CnH3pGfmUN/PyIuafUQYUrPYROs5Cf6OWcDfUceQ0Zba9
	 ulB+93L243Q9Bgvn35agHfinDq8u8qWWCdCE3+o3ZtibcFG8LM/6sZyut/h7hjBiqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207365;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=b6HeXDS3vxlil0pe2jwcTtEhLQKpBWJxZDrfHSbLbvs=;
	b=A+Ny4Kv7xnUvFBqxXHf+LzVMrlY7STqoIDo9PSR4JI6mtQ1Kd9iBuhhx2KTW7vj/mCus
	 QEuw+jh292NpibAmu4MD4R3PArA0OGinUjHUWPkoGFw8OGrQHqvM+EvWah7ixRNpQz8Qs
	 Lr0O0poHUOTq4G1zRR5YvvIVKhxsZ1SNOY+lOHoPeZC43jKRCuoXkO98BLQdTt74cZVsE
	 v8GLD2E55ZXURQk6O8jponunCKZ7gtHu/WDxRXTA/Ylm6ueopADLl/Ugxjd0qWraKdjfP
	 KXwHPqyDxWy7kw0B+5bhri4feoQOVsWIVlgVgdcjNwEzugMfznemiWVPQ9gv7/qjIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xneg8Np9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BC606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xneg8Np9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3103B1F01825;
	Wed, 28 Oct 2026 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793207365;
	bh=b6HeXDS3vxlil0pe2jwcTtEhLQKpBWJxZDrfHSbLbvs=;
	h=Date:From:To:Cc:Subject;
	b=Xneg8Np9gWOeHtT0eMJqzEEYsGOdnXmmza/e3lkHgC3o2oTBraFdVctYVIMTQjWkb
	 saBHr3idy3wR3UJitwhp+PTdge08DONfbJ3CF86dMxwTlBJ1Dbrjpi3DEOC5RRqLVE
	 R07/ht72/K7FXKnTdDjCj964iVMqqQ06McMIXpzKqClvGl5grMTfnHvEO/fYkzGB51
	 pEOu5LN8Ym6GoJny0zfBuzL8L+BIJ3SXRyW9wJiq5vtXgDZPJVopmRQAdIOWsrC41N
	 siNN0UQFaPE2l59FIr/Tf1slJlFysm2Dkch7oL5gGFG1RhJKMT6TGHiC8SP0o9AqtQ
	 7cUR0rRJ7Dthg==
Date: Wed, 28 Oct 2026 17:09:21 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Fang Xieyan <fangxy@xiaopeng.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
Subject: [GIT PULL] kgdb changes for v7.4
Message-ID: <auIsQQ1rwNReWa1r@aspen.lan>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-7.4-rc1

for you to fetch changes up to 9ca9e8c857b55a081d5a1f8039b27cbb4d646b49:

  kgdb: Fix buffer overflow in the qRcmd packet handler (2026-10-28 16:55:40 +0000)

----------------------------------------------------------------
kgdb patches for 7.4

Varied updates this cycle. Naveen Kumar Chaudhary fixed a memory leak
when the environment is already full, eliminated to weird historical
cruft (CMD_BUFLEN having different values in different files) and
removed some dead code. Fang Xieyan tackled a family of related
buffer overflows in the gdb remote protocol parsing (great fixes
from a defensive coding point of view but not security relavent;
gdb can already do anything it wants to).

Signed-off-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

----------------------------------------------------------------
Fang Xieyan (3):
      kgdb: Fix buffer overflow in the 'm' packet handler
      kgdb: Fix buffer overflow in the 'M' and 'X' packet handlers
      kgdb: Fix buffer overflow in the qRcmd packet handler

Naveen Kumar Chaudhary (3):
      kdb: fix memory leak in kdb_setenv() when environment is full
      kdb: unify CMD_BUFLEN definition into kdb_private.h
      kgdb: remove unreachable return in kgdb_reenter_check()

 kernel/debug/debug_core.c      |  2 --
 kernel/debug/gdbstub.c         | 55 ++++++++++++++++++++++++++++++++++++------
 kernel/debug/kdb/kdb_io.c      |  1 -
 kernel/debug/kdb/kdb_main.c    |  7 +++---
 kernel/debug/kdb/kdb_private.h |  3 ++-
 5 files changed, 52 insertions(+), 16 deletions(-)
