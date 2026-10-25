Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959146;
	b=L8erfSgEwrR774c4XVYr2v/K/KrFAGrKeVQFC4PayONb9Ol03VopUWzRfNP7APj08SSE
	 z/4IgH7B9cbp69D/VINfqWa+fwVLLvRouU+khTwgAeTUqdtv3k6qJ2Hfk7szalMlbSVaU
	 Zb7kuBlUduMFPr29gzmfCuPlLidQivLNkYOg9on77g3lQ6reJ0sMRyHPS9RjWtlnvgYtq
	 Z8e1IzIxLNb0GkjiS7iDAp8mpZNqs16Hh+j4DHctfoOSkAzMi2g8kwmKxHJ3cLMMjA8je
	 ktpbs7mRDQJ6ni6Hrxc5IBET5LZJyw3AVjLLCu821+HaLu2yfcKUV1pMKJei15AzeUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959146;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=5cDVAr6+YQe/bNMuDfysPIaGdThTHbdxjIWpI91AGfg=;
	b=PnAfOQHqoAoLspD6whL37q0v0l2eI6E/W3dGEY+zmZo3EL6e/NSOXbZcAGzBNWUl9/FB
	 fSq4u/A+GH9kI3R+2eQRrSOjLTsHAwr8P0TY0aLnMZ3LhB+l9LbSeUpqDMCJ7F9m5oziM
	 9m8d/VakCZSFwX+7loBYpg9x0faMDcnZDqGZXY0+uLtqtnlbD0FNZcbLspWhEBSfagDkd
	 UglWRmRjoWXwPq7z8n/eYP4LvOKOrz03UfE7WHoMwELHgQy2UGmnZ+RAKPunIYioZmx0S
	 /waoKBparuM2dw631d0uu2lxuB0Vy/67Ze1eflr3n9sBBnDDnujdqUxNDM25nhgVy+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfRIz22I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C5606A31A;
	Sun, 25 Oct 2026 20:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfRIz22I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2E71F01825;
	Sun, 25 Oct 2026 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959146;
	bh=5cDVAr6+YQe/bNMuDfysPIaGdThTHbdxjIWpI91AGfg=;
	h=Date:From:To:Subject;
	b=MfRIz22IJwgyVKNt9FpVoINAQSpT99boSkbxqUAdKeDzyUv+JzPfFUB2RD0pLLECF
	 fLISQTuU8XHk6xl2S66dUwkKrMtmoWbx7nI+f8IpV10U1quF2IXnc3b20A5eos1Pgx
	 56oMWe/uaNi6hC5DhqYdc2rro569RmeXDVMaOcJ/yEMVUZ0iStENgt1zBFoCSChZTK
	 dTA5odKWM3/u77A1Lbr1AnCJzTkUfYdWQJzh+P33Ei/6DflIbz7pYe3T8Z33cHv82p
	 IKKogw9Ct9jWe++KC/2pYBZiluwiOQc0iML1eiDXvCMOa/KkW7w9M8A4oy1dtuxNW1
	 r6CPld1PLL/2Q==
Date: Sun, 25 Oct 2026 21:12:22 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes and updates for v7.4-rc1
Message-ID: <at5ipgQnz46TtVMC@p100>
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

Hi Linus,

please pull the fixes and updates for parisc for kernel 7.4-rc1.

One code fix and various code cleanups in the eisa_enumerator driver,
and lots of typo fixes in header files.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 734bef548a96e8774d6eef5dfa2026c6edc4e80b:

  Merge tag 'net-next-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2026-10-22 15:58:00 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc1

for you to fetch changes up to 6219ffcc60a5b4a896b95e717c4affd6dead1bde:

  parisc: eisa_enumerator: Code and whitespace cleanups (2026-10-23 14:40:02 +0200)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v7.4-rc1:

- fix out-of-bounds read in eisa_enumerator driver
- drop redundant pte_xxx() macros and use common macros
- code cleanup in eisa_enumerator driver
- typo fixes in comments in various header files

----------------------------------------------------------------
Helge Deller (4):
      parisc: Drop own implementations for ptep_get() and ptep_test_and_clear_young()
      parisc: Drop redundant implementation of pte_same()
      parisc: Drop redundant implementation of ptep_set_wrprotect()
      parisc: eisa_enumerator: Code and whitespace cleanups

Hemanth Selam (9):
      parisc: fix typos in comments in pdcpat.h
      parisc: fix typos in comments in special_insns.h
      parisc: fix typos in comments in mman.h
      parisc: fix typos in comments in memcpy.c
      parisc: fix typos in comments in ccio-dma.c
      parisc: fix typos in comments in dino.c
      parisc: fix typos in comments in pdc_stable.c
      parisc: fix typos in comments in sba_iommu.c
      parisc: fix typos in comments in parport.c

Jean Delu (1):
      parisc: eisa_enumerator: Fix out-of-bounds reads of the EEPROM buffer

 arch/parisc/include/asm/pdcpat.h        |   4 +-
 arch/parisc/include/asm/pgtable.h       |  30 --
 arch/parisc/include/asm/special_insns.h |   2 +-
 arch/parisc/include/uapi/asm/mman.h     |   2 +-
 arch/parisc/lib/memcpy.c                |   2 +-
 drivers/parisc/ccio-dma.c               |   2 +-
 drivers/parisc/dino.c                   |   2 +-
 drivers/parisc/eisa_enumerator.c        | 481 ++++++++++++++------------------
 drivers/parisc/pdc_stable.c             |   2 +-
 drivers/parisc/sba_iommu.c              |   2 +-
 drivers/parport/parport_gsc.c           |   2 +-
 11 files changed, 226 insertions(+), 305 deletions(-)
