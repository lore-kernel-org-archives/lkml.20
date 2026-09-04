Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0386644D01D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519608; cv=none; b=DqpGxWAx7ISNenTRCGVaSzAKdkQhDTdLYoHp566LgJxcgcNwY3nQV1cWqBR2G179D6MW8q+GnJr0nkOaWfdHrfgl0NBs4tIyA2cSRrSDwUFMYEgQO9O5ySPbOpTBaUSQuaBNTWnRVKeA7uLhfrqqtsbgyHd9mqxAvZ5HmpcdI48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519608; c=relaxed/simple;
	bh=4fpMTlsJcIMA+pYDHyLdPFhUPXeqpGjTUePD7YBUK0A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YXs5OnabhA/hfTe8O231v7k85/8RpZDsqnOo/o2YkJHDWJq9ZcySWrotYsIZg0h2CrNE9hd9arbmZpu0c/k1guLgXYnw7L5j19eD2YfBFcpQ+frf8cqwsn6P12te0USRk7Rb1yYKwH88cKmborZjRS2O3HYFdXW/Tyru1qr0v0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7Ag0EmG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7Ag0EmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932241F00A3E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519606;
	bh=VECVCytsxpeL/9yxomyfc2Zi8sqN4pbjyGMyvBmuLZE=;
	h=From:Date:Subject:To:Cc;
	b=A7Ag0EmGdFDAIiyBt25gnhEfIk7Qp/theIS9tg49Z1dhp+FcMndI52dQG+NxXZRpe
	 dbng/61Ks0hGsU/1ib3Di/L3KjFH23rd85pGOdUC9ZoWpiSv0PivMvEe8VUBz8b3X4
	 JUNbUu2xB8Y7WMgu6Tz1/uDo7imoWELyu2BzWT+lk1p4v5TJLhaJKBKdlzOTjNs4Qz
	 DPE3cmaa43vjrKtY77+BSCK9neLHEmdqwjOzRlChnrvfD1yaKM5O5W2lp7VW103xa9
	 3TSASpR+YFB9EwzDrV2xX7Ae/kB2rI9oOPYc8SeL+zEZa9fuN+TeSaw8+s1b/+/5r4
	 S5F/El+y1ri7g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1677c91969so79733566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:06 -0700 (PDT)
X-Gm-Message-State: AFuF++luAPCgVsrRWceRLiXvV5ZkP28DCIltWi+nKG6k5ZBdIx29jhQ7
	LPhdp8dibkkFHQdptCYPAn8LFp3rLBPnlULzAnL6yvLZnwlXpq2+8rnh+S/WpEdxGAyWj9lSH2q
	yAKKHRxHpaNTE/KCIrbHbVMv2qZGjmuk=
X-Received: by 2002:a17:906:794d:b0:c21:450d:cd7e with SMTP id
 a640c23a62f3a-c260c7b7306mr213800466b.9.1788519605046; Fri, 04 Sep 2026
 04:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 19:59:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9=UQWCu+7da3w+pGa_v0kaYvDCYmvSgxb0d8r0hJ3e+w@mail.gmail.com>
X-Gm-Features: AcwNN1XarZkpGMv79LBbgYuw1H4h_HJ2LKTIggma1pUHIj_SiSX-EkZ-PWbAk7g
Message-ID: <CAKYAXd9=UQWCu+7da3w+pGa_v0kaYvDCYmvSgxb0d8r0hJ3e+w@mail.gmail.com>
Subject: [GIT PULL] ksmbd server fixes for 7.3-rc2 part2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ksmbd server fixes pull request for v7.3-rc2. I add a description of
this pull request below. Please pull ksmbd with following ones.

Thanks!

The following changes since commit 89a312991dc6e638a36adc43ccb91dbc25504c04:

  Merge tag 'cifs-fixes-7.3-rc2' of https://git.manguebit.org/linux
(2026-09-01 13:37:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
tags/ksmbd-for-7.3-rc2-part2

for you to fetch changes up to b5ec6c462aab1062cf5d1e667ba7c6442f737055:

  ksmbd: fix tree connection use-after-free in smb2_tree_connect()
(2026-09-02 17:58:35 +0900)

----------------------------------------------------------------
 - Fix a tree connection use-after-free in smb2_tree_connect() by
   balancing references across concurrent connect, disconnect, and
   session logoff paths.

 - Validate source and target ranges in COPYCHUNK requests before range
   locking and copy operations.

 - Fix an oplock break notification UAF by acquiring a connection
   reference under ksmbd_inode lock and releasing it after the
   notification work completes.

 - Fix the sparc build by using an unsigned int for the atomic work
   state, ensuring xchg() uses a supported four-byte operation.

----------------------------------------------------------------
Abdifatah Suruur (1):
      ksmbd: fix use-after-free in oplock break notification

Alon Shakevsky (1):
      ksmbd: validate COPYCHUNK source and target ranges

Cen Zhang (Microsoft Security FORGE Labs) (1):
      ksmbd: fix tree connection use-after-free in smb2_tree_connect()

Namjae Jeon (1):
      ksmbd: fix sparc build with atomic work state

 fs/smb/server/ksmbd_work.h        |  2 +-
 fs/smb/server/mgmt/tree_connect.c |  8 +++++
 fs/smb/server/oplock.c            | 73 ++++++++++++++++++++++++++++++---------
 fs/smb/server/smb2pdu.c           | 28 +++++++--------
 fs/smb/server/vfs.c               | 12 ++++++-
 5 files changed, 90 insertions(+), 33 deletions(-)
