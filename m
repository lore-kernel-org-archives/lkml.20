Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672006;
	b=pDyTfZZJpOoPtN5Sh73SQ1L6WGwk3Zd91gbCI9oXPqBh2or9pCvD5daH9ZhwjPmNJnf5
	 2ghisv8Tz6Fp4nCn8P+N5uRVk/ODG/oLRg+er00/VoXABfSMJo5SN6pJLC9CzsatitzJt
	 ob7Cn/h/6c0yiueUUtyrB+hcTWx5s6p9XM76UDIy7Kx2V4UuZCWm49JHJSY1/Mbo0ddRv
	 o3gMiLXj74uqaJgPaVjavMZ4tOBEjiarep5fPquoGyadkBONpUXWU28iydQv+ufIcKgWr
	 zBQ4C8Ah9n9WboyyL9ooGqy9SC4VIcGp7KL7wbK5OywkzjUZGZlhgOeOx6/GkPRtlWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672006;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=FzaNnDUSYSKEgWFvznd0ZJjjE7rBZUUK8xBOEJSRyDQ=;
	b=VVwSFtOOtvkSW2k+Bw2zk/mw6443Gg7cWCPvq2nF39Uy5wINT8rrILgAQZ201ljEI3ej
	 rL3aTmRMVFth+oOHXMfs1vo5er+oVoe4JWwWSC3Siy/PU28alEMl3DHUwowESD1bXjkh0
	 bMvHjXmpFIMrGWY8uMjcr+C9Ha0Nu4E3LPNnOn2TETacTkQIFJgh26a1uvQMSh6avSUIk
	 6lluiVCYeeAm/mr0GNhYiDpoOeIV+MSry37UId1SBVBgUk/bymCRPfiDCsGCAGOSbw//F
	 aWVEXDzVGTcphP250jne3XXW3wAAongrQjstqzapuMIYf1DVyOoOTvz/cajqxB8lgow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0pos+gz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0pos+gz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507941F000C3;
	Thu, 22 Oct 2026 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672005;
	bh=FzaNnDUSYSKEgWFvznd0ZJjjE7rBZUUK8xBOEJSRyDQ=;
	h=From:To:Cc:Subject:Date;
	b=B0pos+gzQPKharfY/CNCo1d7JQCG0xf6wtu9eg9vZpX8nTet9gwXjbSa/Aqs2UHAK
	 M2PIGoYbtPTnl898zEDccVatNLu7/zq0cUidrHb+sT2u6OOSr1Qvn7EMyV6rT+SJf9
	 h3pZaM2+/XeHVRW2w5xCw7cD6U6GyNqD9wmL2XwnxqmQP9cEhSKq9RXuiM5YU9YxWP
	 IlKiCqZCYEshDplNwsZ0m3HKsbhLINFRR46CS3XgMPgtN/Ml7HSJxJa2vvGx3Hga8B
	 +uGzitUdferLpOxJkJFdVL5B97BJNu5rhelzy+Ke77tsMi6BZXKFFKt9zuSQIFEqpf
	 NAeBTANNS8nHA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 57BE31AC5994; Thu, 22 Oct 2026 13:26:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap updates for v7.4-2
Date: Thu, 22 Oct 2026 13:26:04 +0100
Message-Id: <20261022122643.57BE31AC5994@finisterre.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit d5a821f66047c2effd06147b84775f9b2ce0f4aa:

  regmap: Fix cache lifecycle locking and teardown (2026-10-13 00:11:44 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v7.4-2

for you to fetch changes up to 2dee91ee94eec85d09c13c7ca83e3005906d3732:

  regmap: Merge up fixes (2026-10-19 19:23:44 +0100)

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

Mark Brown (5):
      regmap: Allow a base register to be specified for the RAM regmap
      regmap: Test rbtree and maple caches for very high register numbers
      regmap: convert map->lock/unlock users to a scoped guard
      regmap: cleanups for regcache and regmap init paths
      regmap: Merge up fixes

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
 drivers/base/regmap/regcache.c        | 119 ++++++++++----------
 drivers/base/regmap/regmap-debugfs.c  | 118 +++++++++-----------
 drivers/base/regmap/regmap-kunit.c    |  98 ++++++++++++++++-
 drivers/base/regmap/regmap-ram.c      |  26 +++--
 drivers/base/regmap/regmap-raw-ram.c  |  21 ++--
 drivers/base/regmap/regmap.c          | 197 +++++++++++-----------------------
 8 files changed, 310 insertions(+), 285 deletions(-)
