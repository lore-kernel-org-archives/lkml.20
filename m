Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580630;
	b=0U7gLQXC8luTORCfsfoTRNtBpOpvyz2hv3vmSnpDmCAe9p7C7O5/7kzUP/R3VnqA/tO+
	 QW8kQn4Qk48bIJ9Oxqit3JcjptZ9/DgF2qHZiJqY4ZUcznlu7k3ouqQHzzbJ7g9VNbOmr
	 iJFzz9cXPSQVd/yNvJdQIdCueecbDvinaisJsuQB024QlisoIGWovVcwRgiDcCKdmY7IO
	 s5g5JsxmYb02IdXy8wKznK7Wq30cNCLMBRfgA6vCufusfWVnllZicpLvhnmRcdMxehN4/
	 FGATQL3Fr2scbEGU81/pNgMMLGNZYww8QPekmyH0YcHRjmxKLI+842RfSp7HpfAg+Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580630;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=1B0YGzIwsPrlGrI15PQgP+OEbjtSdiPLZPCVPwWy6D8=;
	b=N9o17YeOzmlWtJYi04fGPBqsJaw7dhhIC2LmZvyMroXxPnWYli2ReHPXwls0aacNKmrw
	 z8Uf9CqrAlMkw0HKFwD9zBoPEB+zU6b+/bPu8GlWChTCYSnziq2faG+BC9yu+peMPz/kk
	 mz1t+kH6E7Bjp1QvMDAtp1R28aLMGlc/5jYRK5cj9fh25pg3BEEiDtKaZUeBjcv68PkR6
	 WDyoGKPs38NqN/yQTSUqDqXV+3fHeJFP6+60GQ35a80o8/RybgeVVdX67C6OfhD5XEEjO
	 0RonTUJG+Gs4XaOB7jaUQ5O/oL3yQ0UaLkLD7Fgu0hfjLQYAZmzLyyEtyFYuvqKDIIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHQdQZX+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C018606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHQdQZX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E481F000C9;
	Wed, 21 Oct 2026 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580630;
	bh=1B0YGzIwsPrlGrI15PQgP+OEbjtSdiPLZPCVPwWy6D8=;
	h=From:To:Cc:Subject:Date;
	b=EHQdQZX+6K9O9qA2U+DyQaQKhhik7P25yC6up75PR/ytJlG1nfBQlZVfT5LJT4hJc
	 an1Wp9pJJqKn7S6++F7oaX4sccbCpK+f6NygeXa+x0VrHwfrihsFCrXFHAppUICoF9
	 bBjm0RcZRezCwdnVqxU52Tim7LYNGiLTJP3t7tuvS3Zh8EEqP6+zNAWw2d2FyDgP7N
	 Y32sH2qFy9fDr2w7+gSKWGPiS0TRnaaVx/S4Dtcit4/698oClrJhiikbXApRCP9THO
	 hxyWQRkrMgKZgB2QjMpBf++he32cq0VNnAbOLLdYdynJK+7lu7lZRb6HZKfyztIE8a
	 /KCMZbuvNSdBw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CD20E1AC5994; Wed, 21 Oct 2026 12:03:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap updates for v7.4
Date: Wed, 21 Oct 2026 12:03:05 +0100
Message-Id: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4

for you to fetch changes up to f52260f49b107fddbcf7c75f9cf2347a5031f0f7:

  regmap: debugfs: Use __free(kfree) for regmap_reg_ranges_read_file (2026-10-08 09:46:00 +0200)

----------------------------------------------------------------
regmap: Changes for v7.4

This is a relatively busy release, mostly due to the general cleanup
work which people have been doing throughout the kernel - for regmap
that's mostly been some work from Peng Fan.  I also added some more
tests for the sparse caches to catch some gotchas people might run into
trying to improve the maple cache.

 - Test very high register numbers to help people avoid a nasty gotcha
   trying to optimise the maple cache.
 - Make more use of scoped lock and allocation guards.
 - A couple of other smaller improvements and fixes.

----------------------------------------------------------------
Hemanth Selam (1):
      regmap: fix typo "asynchrnous" in comment

Mark Brown (4):
      regmap: Allow a base register to be specified for the RAM regmap
      regmap: Test rbtree and maple caches for very high register numbers
      regmap: convert map->lock/unlock users to a scoped guard
      regmap: cleanups for regcache and regmap init paths

Peng Fan (12):
      regmap: convert lock/unlock to a scoped guard
      regcache: use the regmap scoped lock guard
      regcache: rbtree: use the regmap scoped lock guard
      regmap: debugfs: use the regmap scoped lock guard
      regcache: extract locked helpers to replace open-coded lock/unlock pairs
      regcache: extract __regcache_sync() to deduplicate sync dispatch
      regcache: simplify control flow and reduce nesting
      regmap: use krealloc_array() in regmap_register_patch()
      regmap: fix potential double-free of map->reg_defaults on cache reinit
      regmap: debugfs: Use __free(kfree) in regmap_name_read_file()
      regmap: debugfs: Use guard to simplify code
      regmap: debugfs: Use __free(kfree) for regmap_reg_ranges_read_file

 drivers/base/regmap/internal.h        |  12 +++
 drivers/base/regmap/regcache-rbtree.c |   4 +-
 drivers/base/regmap/regcache.c        | 156 ++++++++++++---------------
 drivers/base/regmap/regmap-debugfs.c  | 118 +++++++++-----------
 drivers/base/regmap/regmap-kunit.c    |  98 ++++++++++++++++-
 drivers/base/regmap/regmap-ram.c      |  26 +++--
 drivers/base/regmap/regmap-raw-ram.c  |  21 ++--
 drivers/base/regmap/regmap.c          | 197 +++++++++++-----------------------
 8 files changed, 325 insertions(+), 307 deletions(-)
