Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691588;
	b=jJ1oSZDyE/SLX6/rj4jMekeY9ACr0v+7QtFGe57yx60n8JdP+4iNNbCtWulxge9iJcmD
	 Irf2wzL+0Ch+EsBAFzJV9BuKAawuQHFRScpWWnPxuyav7zZ2qUnW8BcjSZOjbl1QzwoxY
	 DP32SMYQpFDZmvv4WVMRzbBIuF+cxpXDtc/euvueKQeQGrKP8TQ5RJNVbtQhc/aYMHggA
	 uJoe4/Es4L2VnEScBvLkfM0eAxvoOxAkdAKPbgEO5uTxeV4zPUGXj9XdNciYdkG9fLX3V
	 ELYF7OFwgbYMlWcM3yQC/bc+k/Q4gWKglF6gp+EYn0u/PK6c/AuVYVgMUYB65zcU4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691588;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=xhCCJORsYkbbt3/0ac4oNQtAsUXRf5TCNiJxFVRjTGk=;
	b=TV7HySXLoan5rM5iT2JWXGqFkw8JT+R/lHZ+SmR1+DeSN1KDjDU3pt2UtOrLt0Zkz0qr
	 9RJeRRa8TiMnmpRqrjA5G3XPkN9Ub7RWyeCoNsLEGCZluT2yABWulLZR0H8IqDyLFBrXQ
	 bwM3Qdd6r9Ti0qUx2xsEPCuctJCoJfa6g8AGjeXktWl3YQiGh+e7RjZy6Rx7lMzCpOxvv
	 HOkRhEBqQVmi0ewLoKVc0iYPil05UAKzubvKay4QSrr57RsqELaE/uVZrviNJVv1ezRmr
	 2QOktH8Br6VuciPGaYEbxgGch+Wxp710asc7ALxBeBvKDY9JTqHQSRPvgYsHtqnGrSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNAyyZRG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A38606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNAyyZRG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100621F01825;
	Thu, 22 Oct 2026 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691588;
	bh=xhCCJORsYkbbt3/0ac4oNQtAsUXRf5TCNiJxFVRjTGk=;
	h=Date:From:To:Cc:Subject;
	b=GNAyyZRGIfBeYpiN1nxb4u7kr/CgDWFMBZ9J5hvws0b0iLBMWplQQhWifDm06fx1y
	 qShp1z82hno3X7yDAWdzwHjuODSUrUerN3x6zpctiEi9Jm6B+Y/65k3gWiDs59PL2n
	 f0Ix+6LifQ/nlnwHLqQ4ENfFf1nRIuw4o47hPrckJ9pZR/KpL2JzIgNFu6aZizF+vP
	 aeTWZwu1IfgfVtinkdNXv5NMt3Ft1YGORPn3YpcuLOeDx9QnuzCBy3o5ZftxdjCjZM
	 oOLDiKYeCdJzhP7PQSNYfvx4plc82W4PC0s8pdF2ugcO63a9oaJEa57meJFw8McJyz
	 81KhBDQ4MC/uQ==
Date: Thu, 22 Oct 2026 10:53:07 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>, Hui Peng <benquike@gmail.com>,
	Kees Cook <kees@kernel.org>
Subject: [GIT PULL] seccomp updates for v7.4-rc1
Message-ID: <202610221051.2E6D9ADDB1@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these seccomp updates for v7.4-rc1. These are mainly
improvements to USER_NOTIF behaviors.

Thanks!

-Kees

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v7.4-rc1

for you to fetch changes up to e32008340585a12783045c4426fbb963cfa11b7e:

  selftests/seccomp: Split fork_and_close into clone and close tests (2026-10-06 02:02:49 -0700)

----------------------------------------------------------------
seccomp updates for v7.4-rc1

- allow addfd to transfer O_PATH descriptors (Cong Wang)

- allow restarting interrupted unreceived notifications (Cong Wang)

- fix SECCOMP_ADDFD_FLAG_SEND when interrupted (Hui Peng)

- Various docs and test clean-ups

----------------------------------------------------------------
Cong Wang (5):
      seccomp: allow restarting interrupted unreceived notifications
      selftests/seccomp: cover restart of unreceived notifications
      docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV flag
      seccomp: allow addfd to transfer O_PATH descriptors
      selftests/seccomp: test addfd with an O_PATH descriptor

Hui Peng (1):
      seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted

Kees Cook (2):
      seccomp: Document RESTART_BEFORE_RECV and O_PATH addfd
      selftests/seccomp: Split fork_and_close into clone and close tests

 Documentation/userspace-api/seccomp_filter.rst |  37 ++
 include/linux/seccomp.h                        |   3 +-
 include/uapi/linux/seccomp.h                   |   2 +
 tools/include/uapi/linux/seccomp.h             |   2 +
 kernel/seccomp.c                               |  26 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c  | 642 +++++++++++++++++++++++++
 6 files changed, 704 insertions(+), 8 deletions(-)

-- 
Kees Cook
