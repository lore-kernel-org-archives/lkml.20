Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E752DB7B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949702; cv=none; b=qCwZ0Mx77TKMyNBp9dMEmi3BFm+irqwcGg5MwxdgkOKmL0i2a1a0p2jW02j7GLxjKYUXhm+/9vJX5yHsHszDdz5MtDHKCTFDdu1aeNkc/fU4fsaGacchlMHqRZfcjYtBN9OKA0extagIZromHpQevdM5R82G8eINtEmSgtYd16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949702; c=relaxed/simple;
	bh=ohPBNZ0mLuh/aVmQbkEfxdUHKmJOMnZd7BYfo4uAixI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsDcQLifkZK1s8M+tAEFfF1hdtbp5qlY765wFRnbCSPN+ZaEUGcTkTQjWxLikz2sEWtQ8bjY7dIaIKJKZo3q7cqc8P/gtcaQhK+BEF7eokL5tVk9VRW+wzw76ukny3k+Nk4rTYzAZ9KpqA325it1duxnw+N/Je/qW1wNje4+kyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Mf+0QauE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Mf+0QauE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4481F000FF;
	Fri,  2 Oct 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Mf+0QauE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790949696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k972xhq9FGe8bP1JIVBQJ/ysfk9mzYVsF4isXhz4+3o=;
	b=Mf+0QauEjewwOVyLnJSD5A+3jFQHTJmgHkJvc+x3+HX/SZkRdEECZXk459rne5+jeMzNVw
	+w0oBdeDKW6ACjIEgd84Gt+QBCw3TWKRW6gHMSbLzgnGrR6rjBmtRp/FvjQdo9bP/vxoNg
	cuMYiTGcRLVarLqfMmqyVvnmZkBpw98=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id f6ff36d2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 2 Oct 2026 14:01:36 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [GIT PULL] random number generator fixes for 7.3-rc6
Date: Fri,  2 Oct 2026 16:01:10 +0200
Message-ID: <20261002140110.1481971-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the following small set of updates to the random number generator
and related code:

- VMGENID memory needs to be mapped with the decrypted tag, so that SEV-SNP
  machines can boot.
- A fix for an initialization race in VMGENID, followed by a cleanup.
- Trivial kernel doc cleanups in siphash and random.c. Arguably this isn't a
  true bug fix and would be for 7.4, but it's so insignificant, that I figure
  it's fine.
- A fix for a new compilation failure with recent clang on PPC and RISC-V, due
  to generating an out-of-line memset in the vDSO.

The last fix has a conflict with linux-next, which you might encounter in the
7.4 merge window: https://lore.kernel.org/all/ar5-4Yq3wtmXTWnD@sirena.org.uk/T/#u

Thanks,
Jason

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git tags/random-7.3-rc6-for-linus

for you to fetch changes up to eb13a1ff271b0d180687eebb30611b0b276d5193:

  random: vDSO: avoid call to memset() when zeroing reserved parameter (2026-10-02 12:12:13 +0200)

----------------------------------------------------------------
Random number generator fixes for Linux 7.3-rc6.
----------------------------------------------------------------

Hemanth Selam (1):
      random: vDSO: fix repeated word 'to' in comment

Jason A. Donenfeld (1):
      virt: vmgenid: move to using dev_set/get_drvdata

Karl Mehltretter (1):
      random: fix vgetrandom_opaque_params kernel-doc

Nathan Chancellor (1):
      random: vDSO: avoid call to memset() when zeroing reserved parameter

Randy Dunlap (1):
      siphash: clean up kernel-doc comments

Vitaly Kuznetsov (1):
      virt: vmgenid: remap memory as decrypted

Zhichen Wang (1):
      virt: vmgenid: set driver_data before registering notification handlers

 arch/arm64/kernel/vdso/Makefile     |  2 +-
 arch/loongarch/vdso/Makefile        |  1 +
 arch/powerpc/kernel/vdso/Makefile   |  1 +
 arch/riscv/kernel/vdso/Makefile     |  1 +
 arch/s390/kernel/vdso/Makefile      |  1 +
 arch/x86/entry/vdso/vdso64/Makefile |  2 +-
 drivers/virt/vmgenid.c              | 11 +++++++----
 include/linux/siphash.h             |  8 ++++++--
 include/uapi/linux/random.h         |  2 +-
 include/vdso/getrandom.h            |  2 +-
 init/Kconfig                        |  5 +++++
 11 files changed, 26 insertions(+), 10 deletions(-)
