Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250F3B3C03
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094763; cv=none; b=krcPvR7aIlJPnghYmfkNkQZ3G4XG80pMRElZrGiwirjhYBD7fMAWgaE5xgKYnHbMz5GFTqpQ2db99X7jXoLsdgPGFOA6U8QrJVrqCzSinqsmQtWaaP7k7n2aIvtqeo2r5FvjlsJ4/2+cVG+LRGldCzz0yT/R72s8nTTkwrQG93w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094763; c=relaxed/simple;
	bh=kvkBKXr5v70bJuP9ETsOEYwcBLNhbfz1W6u3CSNAvMk=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=N49sjebr7PBnPYbcXp8aFQVVW2/d+j01aRV1xRY51tno+dsMpT+VjZFKEq6hFxsuowjlMpfs2wshg0NcbCIjlnhFj2s/Wvg/ZY4AYaut/bf31VF155WkRVtOiwVGnPexBfudPXM9F/XMIRL7SbwvR/TCDDoUQAD12NMLB8NxlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=ji4BZooR; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ji4BZooR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uYS38WJwuqbtZpX1o0G6n5p6zhUoGMkjLwa2LxYVu+Y=;
  b=ji4BZooRQeS9TTnZVE9doShWe211FS8O6InsprFm9aO2TXSwlh2JwqCv
   OOv+8doRn1uCIZsBUVwaX+oluJJSLfCm7QSOMPjE4+WwuFo4e62B3E0sR
   0Njb5pOV+Z0Rm1SKhdkt4oiDzQODiiTdlUos/rJduK09cCjxudYTYYZiZ
   k=;
X-CSE-ConnectionGUID: +kTTu38cRxmKLF462aRMsA==
X-CSE-MsgGUID: B8lGMNeQRM24g1YBMex3ow==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,252,1779141600"; 
   d="scan'208";a="155406045"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:59:18 +0200
Date: Sun, 30 Aug 2026 14:59:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: torvalds@linux-foundation.org
cc: linux-kernel@vger.kernel.org, ekffu200098@gmail.com, 
    akira.aiura.bj@hitachi.com
Subject: [GIT PULL] coccinelle changes for v7.3-rc1
Message-ID: <b81556f5-338-ea2a-6a71-5e115e66b84@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-253680050-1788094757=:3907"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-253680050-1788094757=:3907
Content-Type: text/plain; charset=ISO-2022-JP

The following changes since commit b6b019a1d9b90ac51174f0ca15b1338b61506bf9:

  Merge tag 'parisc-for-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux (2026-08-23 10:30:02 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/jlawall/linux.git tags/cocci-7.3-rc1

for you to fetch changes up to ef6a1dca8de41a408019310649e6d1b7b21ac4bc:

  coccinelle: ifnulldev_put: update error message (2026-08-30 14:36:11 +0200)

----------------------------------------------------------------
Coccinelle patches for Linux v7.3

Sang-Heon Jeon <ekffu200098@gmail.com> has cleaned up a number
of the semantic patches in the scripts/coccinelle directory,
particularly with respect to functions that no longer exist in
the kernel.  He and I have also done some reorganizations that
improve performance.

I eliminatd some false positives.

相浦彰 / AIURA，AKIRA <akira.aiura.bj@hitachi.com> fixed an
out of date URL.

----------------------------------------------------------------
Julia Lawall (6):
      coccinelle: misc: minmax: drop unneeded parentheses
      coccinelle: misc: minmax: check for the presence of if cases
      coccinelle: misc: minmax: avoid unhelpful isomorphisms
      coccinelle: api: check for macro context
      scripts: coccinelle: devm_free: reduce false positives
      coccinelle: ifnulldev_put: update error message

Sang-Heon Jeon (11):
      coccinelle: double_lock: improve performance when no double lock exists
      coccinelle: misc: minmax: improve performance when no candidate exists
      coccinelle: mini_lock: improve performance when searching loops
      coccinelle: misc: struct_size: drop unneeded parentheses
      coccinelle: remove obsolete pci_free_consistent.cocci
      coccinelle: alloc_cast: drop removed allocators
      coccinelle: zalloc-simple: drop the kmem_alloc rules
      coccinelle: pool_zalloc-simple: drop the pci_pool_alloc rules
      coccinelle: kfree_mismatch: drop vmalloc_exec
      coccinelle: atomic_as_refcounter: drop atomic_long_dec_and_lock
      coccinelle: ifnulldev_put: update outdated helper names

相浦彰 / AIURA，AKIRA (1):
      coccinelle: update Coccinelle website URL

 Documentation/process/4.Coding.rst                 |  3 +-
 scripts/coccicheck                                 |  4 +-
 scripts/coccinelle/api/alloc/alloc_cast.cocci      | 43 +++++++++++-----
 .../coccinelle/api/alloc/pool_zalloc-simple.cocci  | 17 ++----
 scripts/coccinelle/api/alloc/zalloc-simple.cocci   | 41 +--------------
 scripts/coccinelle/api/atomic_as_refcounter.cocci  |  4 --
 scripts/coccinelle/api/kfree_mismatch.cocci        | 12 ++---
 scripts/coccinelle/free/devm_free.cocci            | 15 ++++--
 scripts/coccinelle/free/ifnulldev_put.cocci        | 12 ++---
 scripts/coccinelle/free/pci_free_consistent.cocci  | 53 -------------------
 scripts/coccinelle/locks/double_lock.cocci         | 15 +++++-
 scripts/coccinelle/locks/mini_lock.cocci           | 24 ++++++++-
 scripts/coccinelle/misc/minmax.cocci               | 60 ++++++++++++++++++----
 scripts/coccinelle/misc/struct_size.cocci          |  8 +--
 scripts/nsdeps                                     |  2 +-
 15 files changed, 149 insertions(+), 164 deletions(-)
 delete mode 100644 scripts/coccinelle/free/pci_free_consistent.cocci
--8323329-253680050-1788094757=:3907--
