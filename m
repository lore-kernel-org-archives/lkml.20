Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201221;
	b=TcdyKQkcBJ+wpUgkt/BdWYBxPZkkT1LrrkJr9OwXYcmjPLQu/nEIwzPhOX+kadF1SQU6
	 fDBKMVWkzS4dK/A2dtwVtH66GkTBzoRDgk9h4cBqAkGEXlYBFmKNd6tQA8ZoB//Esu1Yp
	 zXId60I7Xe4Gr2SqVHn/3C7Dcf5Pt92EQ6Jn01Xb6MBR5LKwR/H8vv6KyWLJUDku+990l
	 q6VPueBMCgOqLu/B17y/R1drubZYlsMX35y6efScl/JHFsj2sNOCcsH3t/qXN/QAxz7r2
	 JvkCnluuZ4wWMX1UAKS7Q5L+jdeLMAQ2MWM4ona1AUscZCUgexOAvRIV710evB17aRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201221;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=VB5jNk5xkH6on40MV2K4aHnG1H26SC3nlVA3Ge7l2CY=;
	b=mYZum0MJn7vrPfThnZ3UYclNxAEFHGbxjOfmXluU8Wcymumvt23mAoBmrJJPKJGYVQiP
	 nmbFe+PkbQjYVss1o2toFpCyO3q0MwBRdihFBQ9MEEqku2A4UkOEvA0WCIUszm+SV2hnY
	 2/JMDoXO+/AcuPNf3EMuVqEsX+WyGJ09LBWvrHMwCPL5tj3p9glOS/4yIELiq7ridiBuo
	 vF49r0/+OgmmQfwz1WUvRonrIE5qO5Su/v3JwgY19dVS5sEtS6yXY1meAbIqyOWvh0BL/
	 tV5hhmwJRFH+SaUkXYgrGUZme6VW+kfA/Dn3K2/a+0L3G9YKJK8sxm8OZrgd+4U/qNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=i34c8xuC;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB7606A31E;
	Wed, 28 Oct 2026 15:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=i34c8xuC
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4E61340430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793201220; bh=VB5jNk5xkH6on40MV2K4aHnG1H26SC3nlVA3Ge7l2CY=;
	h=From:To:Cc:Subject:Date:From;
	b=i34c8xuCGVXoLmvzJ+z39EjUgu4CcQ2zM2AdFq7J/vTbdnzPtXtNANEgTYEwLhZC7
	 39OZZYEjmce2EZ73fGYG6fUu8QVOQxMZB29MkyaNt/QApW/7HB1DCTMB6sLZ813m2w
	 lam+kgzvvot1xt5GZ3iRCigvacvkJH/HUT0vlLLXqpXK2lLPirZxHbqzvOfRwxFavg
	 O1Xx+ep0LARD25C0qQRJhW8uHUwu4OmWrummk/v9/RGs5awSLVknpeqtC37UZgOdKp
	 hT37TcTsxeB507hCjImsWex0lXkce0I1cfxcnmaEK8stIJpO5VSI3xLuVjSF4qrcYR
	 Pw1+QH460FUpw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4E61340430;
	Wed, 28 Oct 2026 15:27:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] More documentation for 7.4
Date: Wed, 28 Oct 2026 09:26:59 -0600
Message-ID: <87o6cdq20s.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 90d9f76ccb72ec024ef476b4229f3dd1957d7b26:

  docs: add AGENTS.md as a symlink to README (2026-10-14 11:45:46 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4-2

for you to fetch changes up to 151235bf3d5d4de1a077a83c54ee651e074816ae:

  uaccess: fix some erroneous kerneldoc comments (2026-10-26 12:42:28 -0600)

----------------------------------------------------------------
A handful of late-arriving changes, most of which were ready ahead of the
merge window:

- More Portuguese translation updates

- Some docs-build and self-test fixes

- Bring documentation for the user-space access primitives in
  include/linux/uaccess.h into the docs build.  This revealed a number of
  malformed kerneldoc comments, which are fixed in a subsequent tweak to
  uaccess.h.

Expect a trivial conflict with your tree due to a kerneldoc change that
came via another path.

The uaccess.h change was done late, but only affects formatting, not
content.  Nonetheless, if you don't want it, this stuff can wait until
7.5 without causing undue grief.
----------------------------------------------------------------
Daniel Pereira (10):
      docs/translations/pt_BR: admin-guide: add features.rst
      docs/translations/pt_BR: admin-guide: add sysfs-rules.rst
      docs/translations/pt_BR: admin-guide: add sysctl/index.rst
      docs/translations/pt_BR: admin-guide: add cputopology.rst
      docs/translations/pt_BR: admin-guide: add hw-vuln/index.rst
      docs/translations/pt_BR: admin-guide: add LSM/index.rst
      docs/translations/pt_BR: admin-guide: add perf-security.rst
      docs/translations/pt_BR: admin-guide: add bootconfig.rst
      docs/translations/pt_BR: admin-guide: add kernel-parameters.rst
      docs/translations/pt_BR: admin-guide: add efi-stub.rst

Igor Giamoniano (1):
      docs: pt_BR: process: translate userspace debugging guide

Jonathan Corbet (2):
      docs: core-api: include documentation from linux/uaccess.h
      uaccess: fix some erroneous kerneldoc comments

Karl Mehltretter (1):
      docs: kerneldoc.py: preserve headings in kernel-doc output

Mauro Carvalho Chehab (4):
      docs: test_doc_build: better handle python version
      docs: test_doc_build: update it to support newer Sphinx versions
      docs: test_doc_build: address pylint warnings
      docs: test_doc_build: don't select urllib3 yanked version

Pasha Tatashin (1):
      docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members

Subhadip Sarkar (1):
      docs: admin-guide: Fix typo in kernel-parameters.txt

 Documentation/admin-guide/kernel-parameters.txt    |   2 +-
 Documentation/core-api/mm-api.rst                  |   3 +
 Documentation/sphinx/kerneldoc.py                  |   3 +-
 .../translations/pt_BR/admin-guide/LSM/index.rst   |  53 +++
 .../translations/pt_BR/admin-guide/bootconfig.rst  | 425 +++++++++++++++++++++
 .../translations/pt_BR/admin-guide/cputopology.rst | 105 +++++
 .../translations/pt_BR/admin-guide/efi-stub.rst    | 102 +++++
 .../translations/pt_BR/admin-guide/features.rst    |   3 +
 .../pt_BR/admin-guide/hw-vuln/index.rst            |  30 ++
 .../translations/pt_BR/admin-guide/index.rst       |  34 +-
 .../pt_BR/admin-guide/kernel-parameters.rst        | 134 +++++++
 .../pt_BR/admin-guide/perf-security.rst            | 328 ++++++++++++++++
 .../pt_BR/admin-guide/sysctl/index.rst             | 108 ++++++
 .../translations/pt_BR/admin-guide/sysfs-rules.rst | 195 ++++++++++
 .../translations/pt_BR/process/debugging/index.rst |  10 +-
 .../debugging/userspace_debugging_guide.rst        | 297 ++++++++++++++
 include/linux/uaccess.h                            |  10 +-
 tools/docs/test_doc_build.py                       | 120 ++++--
 tools/lib/python/kdoc/xforms_lists.py              |   1 +
 19 files changed, 1900 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/LSM/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/bootconfig.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/cputopology.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/efi-stub.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/features.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/perf-security.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysctl/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst
 create mode 100644 Documentation/translations/pt_BR/process/debugging/userspace_debugging_guide.rst
