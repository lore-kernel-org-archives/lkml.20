Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337E390991
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257010; cv=none; b=XZFSRBSfj6jnBjd6D9yjgzH2bhBGJTadGt1yrfpjPmMsownL6c3DEBGqwQrfYbWrS2eTiyw4wJO67hrS87m7Eb5nftk6bUD/QvmDda8ZMZwN/c/N5uzOYDyQ6pgSQUo3PQohu98I8pVo3kRW4uB5ypP2FnJsOCg0tMBRbxuj378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257010; c=relaxed/simple;
	bh=vLHw37OvwlRrZ4XPPE0br3SFCrEM6QcRvJ2HO49HW6U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lEtWD58xtkrCv1Xw7RH6Sv2dNFX1j17n/qZsKAddZSYr9Y7nu0PTIxbNeq1okkVjuKK7d03k+vk5Yx3Si0wUVcjaUn+A+caTEfF2xEMb+QgSO6FRURn2g+ufnqV8a3hJmR8O10bdqw5qLk4/kiZg5hJ29PqLzZmpS6qPdNxYjnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKOrVddg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKOrVddg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06231F000E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257008;
	bh=kWpCtZJj9ar3AUKSCkZ/PlS/SMTGj+vzuoz/Hh94MCw=;
	h=From:Date:Subject:To:Cc;
	b=lKOrVddgbb/CxkrqTbuAdNS93ctqfTE8OK6VvqRMQTSWGYlaApXTkOf1lOS46NeLq
	 GwlKmzFgtB10czuHjGXt+vf2ekZP1DzwNJzSFeUTsUKIpLRjDkwi5UnxXfXbGKRXVy
	 r5+vnp1LF8eAXHeTU5CHBft5wSP43E6v+aRb5FFbMlddQNL1SiKlyhU7F7zV8NzH2O
	 qqtwDqeZ3Lo8Ezkwi8UgOpy+q2TaH6OQ53rqpJ0BTWwHvew687Uu/BUYPPbZtsr2om
	 gJKtpNsoTGRQ/cGePgDfR6kgNteBobtyfv5J7+LcTAVI+G8DyT3JDPon8ViQmXYv35
	 OlVft9YZFsYNA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso589830366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:03:28 -0700 (PDT)
X-Gm-Message-State: AFuF++nzmUFD77vjCZ60D+y8Ru1LcRTnip/pR5+27akO1IpfjzV7hqzh
	qQGSajEQfkq3VoeeKpkhfTKIzjUzyO/n1OYnsRDRIsBhaxDOZHaS8+VJIAHl/ElFm8VaWyDpyTQ
	Y0TPRn0eqjhsRdVlEZKl5Zgvanb4UZ1U=
X-Received: by 2002:a17:907:3cc2:b0:c1c:5aa1:de57 with SMTP id
 a640c23a62f3a-c2557030696mr1987951666b.13.1788257007316; Tue, 01 Sep 2026
 03:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 1 Sep 2026 19:03:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9MMkW5hUCBz0_xBTLxsxeifmnKmp5jF0daMK=3R1adLg@mail.gmail.com>
X-Gm-Features: AcwNN1U2OtPbV3k2Uf7kE1P3gNZRFS35_lccs8_y_L08PGnBMLFAzP13ugcyUYs
Message-ID: <CAKYAXd9MMkW5hUCBz0_xBTLxsxeifmnKmp5jF0daMK=3R1adLg@mail.gmail.com>
Subject: [GIT PULL] ksmbd server fixes for 7.3-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ksmbd server fixes pull request for v7.3-rc2. I add a description of
this pull request below. Please pull ksmbd with following ones.

Thanks!

The following changes since commit 0a0d1d55dad570724bf8c7ea83409639cfb4be9b:

  Merge tag 'scftorture.2026.08.18a' of
git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux (2026-08-23
19:28:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
tags/ksmbd-for-7.3-rc2

for you to fetch changes up to ba9572bc43d04d71ba52ae7f20645f1eafe86875:

  ksmbd: validate normalized name response length (2026-08-31 19:27:36 +0900)

----------------------------------------------------------------
 - Prevent unintended data exposure by clearing pipe compound padding and
   the response buffer.

 - Initialize missing fields in FS_OBJECT_ID_INFORMATION,
   FS_CONTROL_INFORMATION, and FS_POSIX_INFORMATION.

 - Propagate DACL parsing and allocation failures so malformed security
   descriptors are rejected.

 - Rate-limit errors for unmapped SIDs to prevent kernel log flooding.

 - Drain multichannel sessions during LOGOFF, wake deferred locks and
   cancellable requests, and ensure cancellation callbacks run only once.

 - Fix listener kthread reference handling and teardown ordering during
   netdevice events.

 - Validate normalized-name and IPC share configuration response lengths.

 - Update the KSMBD MAINTAINERS entry and add Paulo Alcantara as
   an SMBDIRECT co-maintainer.

----------------------------------------------------------------
Aleksandr Khromov (3):
      ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before filling it in
      ksmbd: initialize FileSystemControlFlags in FS_CONTROL_INFORMATION
      ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION

Alon Shakevsky (1):
      ksmbd: validate normalized name response length

Namjae Jeon (8):
      MAINTAINERS: Add Paulo Alcantara as an SMBDIRECT co-maintainer
      MAINTAINERS: Update the KSMBD entry
      ksmbd: safely drain sessions during logoff
      ksmbd: zero pipe read compound padding
      ksmbd: propagate DACL parsing errors
      ksmbd: rate limit unmapped SID errors
      ksmbd: prevent out-of-bounds reads in share config responses
      ksmbd: fix listener task lifetime on netdev events

 MAINTAINERS                       |  5 +--
 fs/smb/server/connection.c        |  8 +++--
 fs/smb/server/mgmt/share_config.c | 40 +++++++++++++++-------
 fs/smb/server/mgmt/user_session.c | 13 ++++++-
 fs/smb/server/mgmt/user_session.h |  1 +
 fs/smb/server/smb2pdu.c           | 72 ++++++++++++++++++++++++++++++++++-----
 fs/smb/server/smbacl.c            | 67 +++++++++++++++++++++---------------
 fs/smb/server/transport_ipc.c     | 21 ++++++++----
 fs/smb/server/transport_tcp.c     | 36 +++++++++++++++-----
 fs/smb/server/vfs_cache.c         | 17 +++++++--
 fs/smb/server/vfs_cache.h         |  1 +
 11 files changed, 208 insertions(+), 73 deletions(-)
