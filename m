Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328634E56C2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169123; cv=none; b=G29YTdcYL7pNfTr/XjGpcPlos9Yt/FEEtEW/sZgTSw4Tnlv4ya/IB3Ou2gjwmryAKQO4p2IxPI4NL2iRU9nRTUtlHexaekbF+m2UGNlUFxihqa4f+af9X8+141GMV0xrdcjxZgZ9dJVJgcEaEgGFOyqEgDTr4YMJAhsiS3xYBeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169123; c=relaxed/simple;
	bh=TwuGDXZHyDSI+hT3QHZyS+zWEbl9cG9HvK+PHfghsIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amA6sSgu0b7wMYadCgGP2YMG5ARg9vVMKajjz+Q4KZN8f8ET68+++bVbN7up6iw6muUXMFNTRfPYsOjAu/CC6DRJUohCqQizWyt/KANJr6wn2kxHgf8SGVGg5K15M8IzOXeshHACEzneGQGugQD9w3nYhhBBWgIzjDSiGyQkF68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=FMOUYAhf; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="FMOUYAhf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ubzli7pv5RuOgqndP9DvGcdPeC74c6OIE+IHjZRVCww=; b=FMOUYAhf2yeRa9lOsaxGhH/s7x
	RRZpkqvxffjSDQZHwVYQ9iE5uWbUnlO+zKcMzVQ4gWTchC//YzwVJYmEwndkdeK++MMQ8Qtk3Wt3Q
	iFpAUr1M/goNMIhuCB1244d2U65OTrsw6d4zYia/dULT6vvZGsw6EZqauAyZtqdjRVYYUSaXTeY2F
	Q/6r0EmUpJxJILWcDJhYnFhk41Pw9XwgkyjzkJlmcD0vgUsTCY2bg31nRQ4LX17W2KUVj2pJ8iYNW
	zh2ZxfwP4DWiNLUfQpLndGks0jBsdOYOygtfl5fzAJGXauiRfXz2g15YA9p6BoeDrGWlduEY6Isbr
	HEsqpYVA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHl3W-0066eX-1z;
	Fri, 16 Oct 2026 16:45:19 +0000
Date: Fri, 16 Oct 2026 09:45:14 -0700
From: Breno Leitao <leitao@debian.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@kernel.org, leitao@debian.org
Subject: [GIT PULL] configfs: Updates for 7.4
Message-ID: <atJT326zoaI9wfhY@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Debian-User: leitao

Linus,

Please consider pulling these configfs updates for 7.4-rc1.

There are three parts: Thomas Weiﬂschuh's series that allows const
configfs attribute structures, new selftests for the userspace
interface, and three Rust binding changes that I merged from Andreas
Hindborg's signed tag.

FWIW: The const series touches three drivers outside fs/configfs (acpi, xe,
coco/guest report) because they implement the callbacks and bin attributes
whose types change.

Thanks,
--breno

----------------------------------------------------------------
The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc1

for you to fetch changes up to 6c1fa55e287a64ebbf6877f8dd288c6d2ecf4ede:

  Merge tag 'rust-configfs-for-v7.4-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux into updates-v7.4 (2026-10-16 09:17:46 -0700)

Tag SHA: c57cc6736ce0364c9294154e900680306ffa4520
HEAD SHA: 6c1fa55e287a64ebbf6877f8dd288c6d2ecf4ede

----------------------------------------------------------------
configfs: Updates for v7.4

- Attribute structures can now be const. From Thomas Weiﬂschuh.

- The first selftests for the configfs userspace interface, plus a
  sample subsystem that accepts symlinks to test against. They include
  a race of symlink(2) against rmdir of the target, which exercises
  the use-after-free fixed in v7.3-rc3.

- Rust bindings, merged from Andreas Hindborg's signed tag: fix the
  data offset calculation in subsystem callbacks (marked for stable),
  add the missing Send and Sync bounds, and correct a safety comment.

----------------------------------------------------------------
Andreas Hindborg (1):
      rust: configfs: fix data offset calculation for subsystem callbacks

Breno Leitao (5):
      selftests/configfs: add tests for the userspace interface
      samples/configfs: add a subsystem that accepts symlinks
      selftests/configfs: cover symlink and unlink
      selftests/configfs: race symlink against rmdir of the target
      Merge tag 'rust-configfs-for-v7.4-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux into updates-v7.4

Thomas Weiﬂschuh (6):
      rust: configfs: remove mutability from some field initializers
      configfs: Constify is_visible/is_visible_bin in configfs_group_operations
      configfs: Treat attribute structures as const internally
      configfs: Constify configfs_bin_attribute
      configfs: Allow the registration of const struct configfs_attribute
      samples: configfs: constify the configfs_attribute structures

Yilin Chen (2):
      rust: configfs: fix release safety documentation
      rust: configfs: require thread-safe callback data

 MAINTAINERS                                        |   1 +
 drivers/acpi/acpi_configfs.c                       |   2 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |   4 +-
 drivers/virt/coco/guest/report.c                   |   6 +-
 fs/configfs/configfs_internal.h                    |  10 +-
 fs/configfs/dir.c                                  |  10 +-
 fs/configfs/file.c                                 |   6 +-
 fs/configfs/inode.c                                |   2 +-
 include/linux/configfs.h                           |  73 ++--
 rust/kernel/configfs.rs                            | 130 ++++--
 samples/configfs/configfs_sample.c                 | 137 +++++-
 tools/testing/selftests/Makefile                   |   1 +
 .../selftests/filesystems/configfs/.gitignore      |   2 +
 .../selftests/filesystems/configfs/Makefile        |   8 +
 .../testing/selftests/filesystems/configfs/config  |   5 +
 .../selftests/filesystems/configfs/configfs_test.c | 481 +++++++++++++++++++++
 16 files changed, 771 insertions(+), 107 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/configfs/.gitignore
 create mode 100644 tools/testing/selftests/filesystems/configfs/Makefile
 create mode 100644 tools/testing/selftests/filesystems/configfs/config
 create mode 100644 tools/testing/selftests/filesystems/configfs/configfs_test.c
