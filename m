Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947622;
	b=scuA8d9doDpueSLcslsYKG++a5DZC6Bt9YBjJ+A/mikS9bplP5ieKnx1fBce2XGYmJTv
	 6PxacKofPYm3FnMpwKa2hmfXTaqWgqApIl0takR14pmdW4KRd5eVNCDGP+XxL1EWEOOjk
	 ylG15ds0j5aVfbdWMPEx+vGVza8lFSiaqWb2huj5KHZIaZXv1Jdyi273CBf9igCByPFOo
	 k9QfcBC77PJRw79Abco22DoLQB1gVBvhj48ByAezSi1NcgpWsrjWnGeTZNh1SLJprp/vg
	 POOCwiGkba7sq7ATbX5TI9By+Y6vbbCyjvvMKM+C4rWrIEv3x03i6f17lYXPrhT7Gbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hIiJTHVvnRcW94BgAfPLzMPiYxMM33qks5DkmeQr+Ak=;
	b=g8iIOYzWFdY9GR9kM+wERS5rQf84bRBtLnlT/rdkBopbuEdd4iV2yid0iqbTRMx/HdBF
	 xdcExz0bv0e3ZYrTSNG34MSYvBZYhgnkROURpgaVzszrWXxUkj70I6wlHhO6mE5Q0oNeV
	 8U/jsnE7dACBY9UNKZ1mX+HInePQaO8ewiR+q/eIT93lamf8AhhMeV4hjKA9Oht6LrViV
	 pacz9YZ7qOn6ieYPQeETk93a+pROBny3sotaQ8CHqj8typ8bD30rbT+a5lm4GdrRRl1uy
	 CsTG0tMKVB0qAIRKPHHSl3s4jxrZQT2WwvGsyjebhTRrD4JbIIkOwLzXu82v5mxzvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g6DnxrD/";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C08606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6DnxrD/
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d21051042so35876666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793947620; x=1794552420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIiJTHVvnRcW94BgAfPLzMPiYxMM33qks5DkmeQr+Ak=;
        b=g6DnxrD/K96AYO1B7tiDT6BfiOA4apqHQiYNM04gubZiCRYnStB+SjpfQuoxjfi4fJ
         a0WpnVMLWTWH281kH6Uv80/8Xbbd2/utITQ7T5H/2hmayMLGKJUwPZza7WKopmyX2yqM
         mmQaiHm0yAa1UqVBf/WI+YZYGianrILUH2+IA/EegHVDEgY9ujbbkrf4LmEy4Jw67Br8
         54g/wGGUtM2o7f2dzLXbGoZI4B9h0Cld1c3VdqnCIsDbuZWVEwQa9ybgUh6LE01l2fhh
         83B6WuqKrPbh+PP7AacD3BsZmRFGvbEmz+8AXqna49n7my/LggaBbQ2RMJW7/gjEBjQG
         t3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947620; x=1794552420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIiJTHVvnRcW94BgAfPLzMPiYxMM33qks5DkmeQr+Ak=;
        b=Lo6GAUl2mJxpD5oUgPCWtr425tIx3Lup+BJGFQjUmGfMrRdMt2Z0Z9V7S37KLpVrSJ
         MB2f7zX/qvRAtet3Jds1pMjzyk3o1al6JYlQt6zqR3qPBIOZbvCqu6GFGxUjxDEuYwUU
         /lpf0h95VDvd2SI7LIVhxvORruwplsamTpqPRnts+oXFssJJCW+L3qA0WIzc3uD/sVKL
         gAkxslt2oSgtivQPVnm7iks+BDMc0nKhYJltPLhH11I0aI4gLVQB3jfby0hTy02haqMt
         HHzkioL8BcYqAn1N0sYcJFH4jVhAoXMGENkiLgiGuY+2q3TeAPeTVMx+BDgUkBUUj5JH
         QKfw==
X-Forwarded-Encrypted: i=1; AKwUvBwkzw6/l1yNAdhJxafEjZGmr5BZjxsAKZNidsrn0RI9BM9TYmOV/FxAZgcqtnDc4OPcRzg1SVvXN2xSm6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ad/M68nwnNkF3/I+tKoFVXQe3Jxizn4DzsoUctF/V9E3ymowV
	hw5b1q+F0Syb91rMk6Kt00Ho/R7U4+uWpqDqyTDQ5RC0AXMM1mE3UzXV
X-Gm-Gg: AYBFou2+daNiPX/9fPIIafRGZ6VHQjzBgaXKlXg7Q7XeCpXzKikq6/VB9geByO/jjQa
	G4gpzGrTB0+C3mqFfCgbnFxuwqIkwM2RBkjB8RFVfTmllARWDgK3n4FUbFFydHK5ueT3hs8Exv7
	cyh6bPR0QbdDVftKER/K/q4kpUmQiCu9vkAK+pBsjE/I3ioi8gl7VZxGldseFXOMiFraFNU6lOQ
	QVaN/P0uoxHyMqZpDKZp+EZoNpGeBOdieDbXhyaWDwosIZxbABBeLGGqPtvejsqYO+4YOgM4pdq
	5l9OhiykeVZHR0q0d5L6Bn82hxcJYbJU0vu8YMXWzkLUKjH32Hu9O2s2isuAkkke2G5MVF2p7HH
	5hXaxpy7c/lnfn88+dlQ5TRIE+TLNtwEteEHJ5jdyQqr2ec7eAifREkAWft0igxYfLGPr1E0gM/
	MDESHKPnlGlFv7GNFbQKjmC+pJjvB5fJnfA5p/IiDl0HN+kwWkYkyMIo/oMaepgpAXOdqnykSP4
	Dj5LQ3FHMBIqAAyh3QOVkCHOVoJ4rFjyJ8/3UFzSaCuNOqsBWeJA0BW5QjEneFakHk3FlXYm+4w
	7QIKyp0fol4LSc5RU6kuEG2lz7zEuecNfox+4FeP7TkisZdDS8yNMYAMceRMaTk7giMQLLkcriR
	bnG9+n6Nhx4rN
X-Received: by 2002:a17:907:9496:b0:c46:8909:963b with SMTP id a640c23a62f3a-c4d35485cf9mr140787466b.9.1793947620154;
        Thu, 05 Nov 2026 22:47:00 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c6025sm51097866b.73.2026.11.05.22.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:46:59 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org
Subject: [GIT PULL] overlayfs fixes for 7.4-rc2
Date: Fri,  6 Nov 2026 07:46:59 +0100
Message-ID: <20261106064659.3809691-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull overlayfs fixes for 7.4-rc2.

- Was in linux-next overnight

- Gone through the usual overlayfs test routines

- Merges cleanly with master branch of the moment

VFS NOTE: added export of symbol dentry_open_nonotify() that was added
by commit ebe559609d78 ("fs: get rid of __FMODE_NONOTIFY kludge").
Note that before removing the __FMODE_NONOTIFY kludge, overlayfs and other
modules could open a FMODE_NONOTIFY file with dentry_open().

Thanks,
Amir.

----------------------------------------------------------------
The following changes since commit 51628610f9187c1c1cfe499d92e066bc22ad9693:

  vfs: fix take_dentry_name_snapshot() semantics (2026-11-03 08:28:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git ovl-fixes-7.4-rc2

for you to fetch changes up to db1c5da238dc80a61ab429a7b71b0e2835766c45:

  selftests/fscontext_ns: expect EINVAL for overlay descendant userns create (2026-11-04 21:47:48 +0100)

----------------------------------------------------------------
overlayfs fixes for 7.4-rc2

- Fix a self deadlock of a fanotify permission event listener that also
  watches the layers, when it reads an overlay directory

- Three casefold fixes, found by Chris Mason's AI review

- Fix a decode of a modified file handle with nfs_export=on, which could
  read the stale lower data of a copied up file, also found by Chris
  Mason's AI review

- Fix an overlay selftest after an errno change

----------------------------------------------------------------
Amir Goldstein (3):
      ovl: inherit FMODE_NONOTIFY when opening directory realfiles
      ovl: inherit FMODE_NONOTIFY when reading directory layers
      selftests/fscontext_ns: expect EINVAL for overlay descendant userns create

Chris Mason (4):
      ovl: fail the mount if the casefold flag has changed
      ovl: do not let chattr change the casefold flag
      ovl: fix whiteout creation in casefolded directories
      ovl: look up the index by the decoded origin

 Documentation/filesystems/overlayfs.rst            |  3 +-
 fs/open.c                                          |  1 +
 fs/overlayfs/dir.c                                 | 46 ++++++++++++----------
 fs/overlayfs/export.c                              |  4 +-
 fs/overlayfs/inode.c                               |  8 ++++
 fs/overlayfs/namei.c                               | 13 ++++--
 fs/overlayfs/overlayfs.h                           | 21 +++++-----
 fs/overlayfs/readdir.c                             | 35 +++++++++-------
 fs/overlayfs/super.c                               | 12 +++++-
 fs/overlayfs/util.c                                | 13 +++++-
 .../filesystems/fscontext_ns/fscontext_ns_test.c   |  2 +-
 11 files changed, 102 insertions(+), 56 deletions(-)
