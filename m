Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635224;
	b=KUwj+KMZAD1FwW8d6q1Y0moK/dDbURF29xh7lK1FhyGyudpmwnzSFbP8Qud2yDjDQFrf
	 Ik8zSYhP5bumGDS5zDBV6hjVUNyWRLOxnj/nEKOEWgPQc6yyq9ow9Gu91yAkzjCRkx7Kf
	 YCEXaiInAgGlU1FaS05E2ofRpm2G/LXhnkLdilInfKQBBAuqdt40035MHQaz+xh4Li3Qq
	 VpKPotMMmb3IFhi9sPjSFbfkX72ciF0gvHvhqzw4Dpjrr2kg2N4tDVYvLKedahKbqWCqj
	 /Iucjw9Es+l6vqYKQYt7TWWpbk5a0OP0IuNktNonoXTOenunzsXPYlff5YNo3MoCSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635224;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XFzvZgIEep3ESf+0yHAHjZPGOLvnbYltmbPqObm7Juo=;
	b=wgFaxS5bMh0CbfFDX+Y8GHJu+9VkCIpvKWn1yftDupbbSQxkIQBQh+bliB8dOLHvf5ip
	 NbnGchnJC+yp/6V+A04sNwhKvZSTQcKKSd+gFf/x+pvreFlgmznXz9GX43ExXNxSwq3r8
	 k2jhw1fK3U+AuW0RotQq6s8+zKuEwTmQiwP3sSX3xfzQm2THY4rBIgc+F2YpOa7HSv84B
	 DFQEQQpEi2fW7hdO6BzI7SjsxilmDLFtKkTWnTCl7JjzxgGcN8eTZvf2q/Coaeh7+AGiG
	 1BwLCZWz9cmmjR+vF15MLMPaIBPtbRbrZj5oR28D3h648bfy1KwfLNuJ09z7q0VPvaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fCIa8S/x";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB5606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCIa8S/x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501DE1F000C6
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794635224;
	bh=XFzvZgIEep3ESf+0yHAHjZPGOLvnbYltmbPqObm7Juo=;
	h=From:Date:Subject:To:Cc;
	b=fCIa8S/xBvq09qkPhnL7NZLUIDyWTfBuFjJrXbSMcWVYG/uU40q8V6VsiJDcciR9h
	 uPilucZn4Yk+7VxCWomEl9Eaudp91fWj/K3FeVznqLEYqxQ3mam6Lt8RJWQw7q9thL
	 DYT1N/rmrSQ6uEy5VLONNOxa0wREuqL2pLojj/6YSIhGZWir8ymASjCmFXbuQoxxzh
	 WzP3i5o7XtxxkbCGehb3oT8Bw9NspXriQ/WxFCm+gZJW5mMrs7bnhU8ptiFx5vskhN
	 pOCHQ+qZAN4/JWKM4CdPXHctk2RVN0XjowVs/z5mrvvdIvX7W7aZGLNVLJ3HXiBG/V
	 AkFd7qFozAcig==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50aaad19fbso97102566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:47:04 -0800 (PST)
X-Gm-Message-State: APuU4Z/7nyIx/9Jt0b6hmiek0Gi2b/U/ALApDE1Hquy2yBPxIV3viuSc
	eVNuIKgJPMqr8a//P9/Rpxg6Bft9e69VdmJ23e15VhEc8nGv+CYXZjFFbt2Y0C/GdGQc2k80Iub
	bs66u0eKvsmA9ciyZjHVjKHDq7CKvvFQ=
X-Received: by 2002:a17:906:c151:b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c5096541a80mr378746566b.34.1794635222842; Fri, 13 Nov 2026
 21:47:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 14 Nov 2026 14:46:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
X-Gm-Features: AclHuK9dH6WUicWRknYhe9QWDOvMiFa1zWa3vFtoh-cGOAXFzoYVuA3C2sAJkYs
Message-ID: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
Subject: [GIT PULL] ntfs fixes for 7.4-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	"open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ntfs fixes pull request for v7.4-rc3. I add the description of
this pull request below. Please pull the following ntfs fixes.

Thanks!

The following changes since commit fa4ad798f6f681031775266044ba1b0cf3c670bd:

  Merge tag 'for-7.4-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2026-11-07
13:52:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.4-rc3

for you to fetch changes up to bada7bbb11aaa6feba8904cf38ff833453f5b5d9:

  ntfs: open the index allocation before reading or writing an index
block (2026-11-08 12:43:07 +0900)

----------------------------------------------------------------
- Validate that $INDEX_ALLOCATION is open and non-resident before reading
  or writing index blocks, preventing NULL pointer dereferences when an
  earlier index operation has not opened it.

- Check that index allocation inodes are non-resident and child VCNs are
  non-negative and within bounds before directory lookup reads, preventing
  a deadlock when $INDEX_ALLOCATION is missing or damaged.

- Validate file names against the index entry's key length, preventing
  out-of-bounds reads when directory enumeration resumes using a copied
  key.

- Return -ENOENT for NTFS_IOC_LIST_STREAMS on deleted base files and fix
  unsigned underflow in its buffer bounds check, preventing out-of-bounds
  writes when the sizing and filling passes disagree.

- Use kfree() for the temporary runlist allocated with kmalloc() on merge
  failure, resolving the Coccinelle allocation/free mismatch warning.

----------------------------------------------------------------
Namjae Jeon (1):
      ntfs: silence kmalloc/kvfree mismatch warning

Wahid Khan (3):
      ntfs: check the file name against the key length of an index entry
      ntfs: do not read an index block outside $INDEX_ALLOCATION
      ntfs: open the index allocation before reading or writing an index block

Xingyuan Mo (1):
      ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS

 fs/ntfs/dir.c          | 14 ++++++++++++++
 fs/ntfs/index.c        | 30 +++++++++++++++++++++++++++---
 fs/ntfs/iomap.c        |  2 +-
 fs/ntfs/named_stream.c |  6 +++++-
 4 files changed, 47 insertions(+), 5 deletions(-)
