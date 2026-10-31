Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410831;
	b=ovWLXDZlevGZkCr2qL7wQUl8reCvl6iJPA983hLukEfSceihHA1kf0Nka2uDnq/Hw9d1
	 VofFd2gGOKGtGhyFKmIK0WhhSQE3a0BViu7J7XlLPyCE+qVt2wnI5dIqD6h3eg0XElIUe
	 U9qpXJgF9hwTVbXSsQ3KNz0g3ae8VkefYHpnlPDWTm3i96KHaIR+U4AMB1BDHW/Q4glME
	 wntn42ix90UGWUmgS5GPxhbt9fPBBXWAjKZYLwpdzpAk0IvAyTx2rsoHW2iqyDv9a8vyL
	 kBTQqoDJQrrD1lWoerJZZoNiIWnclHMIbp1R114heNLjV/sWMPi+ranv8Rm7sfkf8fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410831;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EAJu04mdX0kbVuQyNmSZdbzTKVyihRnShGbuZn9bePU=;
	b=0TZ9C+HZifyrJCV7PdFG923NmsGg33eN8e+20al+ZZfTEnE2XjyJ2url09ZnA9efQzc/
	 4QwFGRSLixlL5eVISK7MOabJWOYIU+tsvs0Utzj3Mf3kQfO67Po+iVEcLnwUKhQ8KTj6+
	 bosurFeJ26O1VRPa99Hc/1os0Vzfc4L9uH9wd1rWZLdg2ZXIPMjRmsreOqloIFfF1UquO
	 z2xsXN3htfzC7gjx+IOsfttSke4R+b3ECvG5XVvL4gn2R4FLYKLf4YT8CpDynuA4TIjPn
	 AbsHayKQxiiICBd4KUhfBv6HrwxTNR+TGjTwYUBDsTvpRrjxlB9gt+r5uEA2b6wII5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h440Q7dj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B31606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h440Q7dj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0529F1F00A02
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793410831;
	bh=EAJu04mdX0kbVuQyNmSZdbzTKVyihRnShGbuZn9bePU=;
	h=From:Date:Subject:To:Cc;
	b=h440Q7dj+vJlHuoUTOuhl5EiVjIDQkw99xOpqG8jahRlgF/g1OKguOp+v3qRoDKXT
	 boCCQqY17QsqqQHpmY91sQtEsAxjxB5lC4TCdEVu0fM69tALroB336xjdBCoQv+l10
	 n0M6O4/rVIPhCJHPNNar4g/fP1drV1K14SbVBZ/VuJu+iXmiNFKd1Nt4JgTi52UxAc
	 wx5/SzYJ+4KXMMcWjH4ii/R6UVaK0GrS6SefB6d9w+O33J47gGuAt9PsI5XwephCyL
	 KReugybC7ORWCpOYVdh0bL+OleF3TRf6N6ZlkHfvy98m3xp8H7EDibr58WV2mISbQQ
	 EaFEsThVgDQwA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1672853a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:40:30 -0700 (PDT)
X-Gm-Message-State: AFq9FYIJsrIRtLvsT54q+9qDKFlKD46SNZFC8tfDJ5qjkmXxEKjipgXm
	OEEvSMsjl85tO11y65XYyf3Ii7uHgiNLqnC1Isd3PDZ1v8z0oLPUxPGK7jzFIKZO8sEuwdmMaQU
	DXXvzxnQIrBWjEN5Uy7MsFOOtseQqBes=
X-Received: by 2002:a17:907:3e0c:b0:c49:df95:fd0 with SMTP id
 a640c23a62f3a-c4ca7ad10a9mr361084066b.48.1793410829643; Fri, 30 Oct 2026
 18:40:29 -0700 (PDT)
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
Date: Sat, 31 Oct 2026 10:40:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd98nDs6_4fhaMwn1gbTSsRkNoLefr+ZCxC+RV16j1rEwA@mail.gmail.com>
X-Gm-Features: AclHuK-GG_1JFYUOpwLFNC18p_eJR7exjJvBr9XQxhpDrQ7RdoI3dyucQxIDvQY
Message-ID: <CAKYAXd98nDs6_4fhaMwn1gbTSsRkNoLefr+ZCxC+RV16j1rEwA@mail.gmail.com>
Subject: [GIT PULL] ksmbd server fixes for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ksmbd server fixes pull request for v7.4-rc1. I add a description of
this pull request below. Please pull ksmbd with following ones.

Thanks!

The following changes since commit 6b4b543fa18757297ac756a6fe6e64f506b7844a:

  Merge tag 'parisc-for-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
(2026-10-25 18:04:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
tags/ksmbd-for-7.4-rc1-part2

for you to fetch changes up to 206fc30f71b005156085fd8523ccc84a2c67791b:

  ksmbd: return complete and aligned stream information (2026-10-28
17:57:07 +0900)

----------------------------------------------------------------
 - Fix compound CREATE response buffer sizing and reserve space for final
   response padding to prevent buffer overflows and out-of-bounds reads.

 - Allocate sufficient space for UTF-16 directory-name conversion,
   including the terminating NUL.

 - Fix an RDMA transfer length underflow that can cause out-of-bounds
   reads or writes when processing multiple remote buffer descriptors.

 - Fix use-after-free bugs during failed durable reconnect cleanup and
   AppInstanceId supersede racing with session teardown.

 - Keep retry timeout clamp bounds constant to fix a MIPS build
   failure with CONFIG_HZ=1024.

 - Fix a session reference leak in compounded SESSION_SETUP and reject
   compounded session binding to avoid mixing session and tree state
   after a failed binding.

 - Serialize operations on each named pipe and preserve unread RPC reply
   data for subsequent READ requests when the client's output buffer is
   too small.

 - Return complete, eight-byte-aligned stream information entries and
   report insufficient output space correctly.

 - Use the resolved share root path so shares rooted at mount points
   list their contents correctly with crossmnt disabled.

 - Ignore network-device events outside the initial network namespace,
   preventing container interfaces from affecting ksmbd listeners.

----------------------------------------------------------------
Denis Kulikov (1):
      ksmbd: use the resolved share path for the share root

Ian Bridges (5):
      ksmbd: fix app-instance non-durable supersede session UAF
      ksmbd: fix SMB2 CREATE response buffer overflow in compound requests
      ksmbd: fix out-of-bounds read when padding the final compound response
      ksmbd: fix use-after-free after a failed durable reconnect
      ksmbd: fix session reference leak on compounded SESSION_SETUP

Jan Koester (1):
      ksmbd: ignore network devices of other namespaces

Namjae Jeon (3):
      ksmbd: prevent session binding in compound requests
      ksmbd: keep retry timeout clamp bounds constant
      ksmbd: return complete and aligned stream information

Stefan Metzmacher (1):
      smb: smbdirect: fix buffer length underflow in RDMA transfers

VeroFess (1):
      smb: server: size directory name conversion buffer correctly

Wang Zhaolong (2):
      ksmbd: avoid races between named-pipe operations
      ksmbd: fix named-pipe reply loss with small output buffers

 fs/smb/server/mgmt/user_session.c | 128 ++++++----
 fs/smb/server/mgmt/user_session.h |  18 ++
 fs/smb/server/misc.c              |   8 +-
 fs/smb/server/smb2misc.c          |   8 +
 fs/smb/server/smb2pdu.c           | 517 +++++++++++++++++++++++++-------------
 fs/smb/server/transport_ipc.c     |  45 ++--
 fs/smb/server/transport_ipc.h     |  14 +-
 fs/smb/server/transport_tcp.c     |  11 +-
 fs/smb/server/vfs.c               |   9 +-
 fs/smb/server/vfs_cache.c         |  60 ++++-
 fs/smb/server/vfs_cache.h         |   2 +
 fs/smb/smbdirect/rw.c             |   1 -
 12 files changed, 569 insertions(+), 252 deletions(-)
