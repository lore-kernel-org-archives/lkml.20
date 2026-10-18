Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBF378D8E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314520; cv=none; b=XxMpqMSxP3s7qlgbB2i/dz31HFIcZc2DYqNnP3h/bwJeTyjZrSmWvBeEDi8+UXn6R+IBWR/fByGZ0fxQ/GuY3RFZ9poLSQO5X/Oi4srh93iVKn3r62ajSwwkoOuCne7nTotOEmwz88I0DowQSjcJz+X0URc824OvJtexqKX2P+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314520; c=relaxed/simple;
	bh=RTPW5gSKxtXxk4H6oaoL9HMME5CRaxL8UjxX7yuFsU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCOG7sMFPwvmBEzRBzDDJlqXLLkx9hlgBwUzX7s0LKHR9GsecRIal27jnK5mFl4atv2zSjbqxXl1hD0hfVOiLD6UvvwpwTCdO37SOW+HpYBIVtVgT+9DYb5lbW8NTszzIGDyDlQEUjs1NYAjWMgvHlqSdYZtAEqmAlI76l4E9DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aEhYLzLW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aEhYLzLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792314516;
	bh=RTPW5gSKxtXxk4H6oaoL9HMME5CRaxL8UjxX7yuFsU0=;
	h=Date:From:To:Cc:Subject:From;
	b=aEhYLzLWnTEnYM2beG0US7uQ8Qv70TRrS8JV4Utw/jykKxJlEdbPRW12EvHt2pXA6
	 FOwNzv7uIBJ68SHs36xCYKDU0Sz/EWw5OiK1owKSTHsFgnGlUWcx+f8y4o61hKRKrK
	 ZwDPgtowQ7N0p3JkCBSXAjdxgyXkw8M06EA73oCI=
Date: Sun, 18 Oct 2026 11:08:36 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] nolibc changes for v7.4
Message-ID: <b98d1155-85de-4ad5-adb3-ef77fb3f6879@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

please pull the nolibc updates for 7.4.

There are two irregularities to note:

If you pull the x32 disabling patches[0] in this cycle there will be a merge
conflict in tools/testing/selftests/nolibc/run-tests.sh.
Pick the version from the nolibc tree and drop the x32 part of the conditional.

The latest commit in the PR 700ce4da6f6f ("selftests/nolibc: explicitly disable
position independent executables") is very new and was not in -next yet. It
fixes a new compiler compatibility issue I only noticed when preparing this PR.
The real nolibc selftests are not driven by the kselftests framework, but by ours
own run-tests.sh. So this commit does not affect any nolibc users and kselftest
user like -next only through our pro-forma, limited kselftests integration.

[0] https://lore.kernel.org/lkml/20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de/


Thomas


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20261018-for-7.4-1

for you to fetch changes up to 700ce4da6f6f172435349b687d2d916e791c6330:

  selftests/nolibc: explicitly disable position independent executables (2026-10-18 10:23:42 +0200)

----------------------------------------------------------------
nolibc changes for v7.4

Changes:
* New architectures: Hexagon, 64-bit parisc
* New library functionality: sendfile(), pread(), pwrite()
* Various bugfixes and cleanups

----------------------------------------------------------------
Daniel Palmer (2):
      tools/nolibc: Add sendfile()
      selftests/nolibc: Add basic test for sendfile()

Danish Khateeb (8):
      tools/nolibc: fix WIFSIGNALED() for status 0
      selftests/nolibc: add tests for the wait status macros
      tools/nolibc: fix verrx() and errx() message formatting
      tools/nolibc: fix readdir_r() with 64-bit directory offsets
      tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
      selftests/nolibc: test the FD_* macros
      tools/nolibc: stop rounding malloc() sizes up to 4096 bytes
      tools/nolibc: check for overflow in malloc()

Sasha Levin (1):
      selftests/nolibc: use the configured kernel header directory

Thomas Weißschuh (17):
      selftests/nolibc: stop treating skipped tests as warning
      tools/nolibc: split the architecture list into multiple lines
      selftests/nolibc: prepare for clang-only architectures
      tools/nolibc: add support for hexagon
      selftests/nolibc: switch around the skip conditions in run-tests.sh
      tools/nolibc: validate directory with O_DIRECTORY in opendir()
      tools/nolibc: verify that a directory is opened
      selftests/nolibc: validate ENOTDIR return values from opendir()/fdopendir()
      tools/nolibc/parisc: consistently use %dp to refer to register %r27
      tools/nolibc: add 64-bit parisc support
      selftests/nolibc: make the broken MIPS N32 argument detection reusable
      tools/nolibc: make 64-bit systemcall argument padding generic
      tools/nolibc: move __NOLIBC_LLARGPART() to compiler.h
      tools/nolibc: introduce __NOLIBC_BITS_PER_SYSCALL_ARG
      tools/nolibc: add support for pread() and pwrite()
      tools/nolibc: fix the function argument order of calloc()
      selftests/nolibc: explicitly disable position independent executables

 tools/include/nolibc/Makefile                   |  19 ++-
 tools/include/nolibc/arch-arm.h                 |   7 +-
 tools/include/nolibc/arch-hexagon.h             | 159 ++++++++++++++++++++++++
 tools/include/nolibc/arch-mips.h                |   8 +-
 tools/include/nolibc/arch-parisc.h              |  28 ++++-
 tools/include/nolibc/arch-powerpc.h             |   7 +-
 tools/include/nolibc/arch-sh.h                  |  18 +++
 tools/include/nolibc/arch-x86.h                 |   2 +
 tools/include/nolibc/arch.h                     |   7 ++
 tools/include/nolibc/compiler.h                 |   9 ++
 tools/include/nolibc/dirent.h                   |  25 +++-
 tools/include/nolibc/err.h                      |   2 +-
 tools/include/nolibc/nolibc.h                   |   1 +
 tools/include/nolibc/stdlib.h                   |  12 +-
 tools/include/nolibc/sys.h                      |  60 +++++++--
 tools/include/nolibc/sys/select.h               |   6 +-
 tools/include/nolibc/sys/sendfile.h             |  41 ++++++
 tools/include/nolibc/types.h                    |   2 +-
 tools/include/nolibc/unistd.h                   |   4 +
 tools/testing/selftests/nolibc/Makefile         |   2 +-
 tools/testing/selftests/nolibc/Makefile.include |   1 +
 tools/testing/selftests/nolibc/Makefile.nolibc  |  15 ++-
 tools/testing/selftests/nolibc/nolibc-test.c    | 159 ++++++++++++++++++++++--
 tools/testing/selftests/nolibc/run-tests.sh     |  30 ++++-
 24 files changed, 562 insertions(+), 62 deletions(-)
 create mode 100644 tools/include/nolibc/arch-hexagon.h
 create mode 100644 tools/include/nolibc/sys/sendfile.h
