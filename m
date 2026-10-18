Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74549EC47
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327971; cv=none; b=UzYIDgI3PBTFSBZUfvUAo2IepUT6fn6KXx9J+RpeTUHFkL3gs8vnuv60Do5/nhdTnOC+TfaRjX69em13JFSCIqIbkArBZ/cHv7O2ezJJ8Tw0b+/CKi0jHu2cDdRatNVZ3n8eTFZnRSqO0U3/8Xjmb2afgQ+KJ8OiuH+aGn5QFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327971; c=relaxed/simple;
	bh=k1cEz2DJS9J8J/nXKByrgqOisCZybPQFc2+UYuf3Fjs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lnAwhpjoYz/2hkeClCJhaF+24Ijh/aeqW2Exs8Z55MAKOTL+HR+Kn3HvzRoWYDBLSL5lVwn59MNG5ldfx2BZN8ibugGEpN6FYT4pyXejiJmeJ4QRn9U4icLwBqE9dnHkMzMVVSWa2VS/sEtpTLxaJOezROh+Nwrj/eMDbw369U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqTJi3o9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqTJi3o9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1EB1F000C7;
	Sun, 18 Oct 2026 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792327966;
	bh=YuXbH4FOUc5F23HxTXdA3xfCJ8FVEXawstGMCXdU9hY=;
	h=From:To:Cc:Subject:Date;
	b=OqTJi3o9BQiZtoGrcKnw7Ys8uu23U/ySnIRrcI7FgB7B2aMlUmBlyQ8pvZAAUBdKG
	 hyNGDGim9vTwT+be3STatmApRK4O4+eSLG53bMncjwQNm+TgPeYEdHmMQHkGXZlyHL
	 JzFZEPTkdAKARUW/zzALKPpvOvZDD4FSVunhuM2Ls4ZE9owVH7ARjxUKbito84ltlY
	 bS3Pu0Q0yJx3Q71R9dsdyjf+xNSce3KmiIiLESH36gfNOcFlDF4rrTRvgWHdxt/El2
	 bvIgYENsFvlgAhBbFo3XC/unrAOuRIHUx/IR3SstlV+0zuryZG5bFroPFIdJyuICag
	 N7TznttarCt3A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0B4901AC57D1; Sun, 18 Oct 2026 13:52:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap fixes for v7.3-rc7
Date: Sun, 18 Oct 2026 13:50:28 +0100
Message-Id: <20261018125223.0B4901AC57D1@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.3-rc7

for you to fetch changes up to d5a821f66047c2effd06147b84775f9b2ce0f4aa:

  regmap: Fix cache lifecycle locking and teardown (2026-10-13 00:11:44 +0100)

----------------------------------------------------------------
regmap: Fixes for v7.3

The main thing here is a fix for lockdep warnings with MMIO regmaps that
use a raw spinlock and a cache, some other lockdep fixes we'd done for
the benefit of the maple tree on sleeping buses meant that we were doing
allocations for those MMIO regmaps under a raw spinlock.  While fixing
that Michael Reeves also noticed that the debugfs files were briefly
available without the cache structures backing them.

There's also a fix for interrupt freeing on error in regmap-irq which
had been hanging around because it's not super urgent.

----------------------------------------------------------------
Mark Brown (2):
      regmap: irq: Free the irqdomain we create
      regmap: Fix cache lifecycle locking and teardown

Michael Reeves (2):
      regmap: Remove debugfs before cache teardown
      regmap: Drop map lock during cache init and exit

 drivers/base/regmap/regcache-maple.c |  9 +++++++--
 drivers/base/regmap/regcache.c       |  6 ------
 drivers/base/regmap/regmap-debugfs.c |  1 +
 drivers/base/regmap/regmap-irq.c     |  2 +-
 drivers/base/regmap/regmap.c         | 15 +++++++++------
 include/linux/maple_tree.h           |  4 ++++
 6 files changed, 22 insertions(+), 15 deletions(-)
