Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854859;
	b=Wmu5XChfn4zf8Z5upnqdSbhoXuVZJTodauCBlrLJXbVchXrcQlRkBhRZ8JU82f6fapM9
	 fWF3pxQoQMIvLEMQr+wKB6fEjFXwaaZZ7/nBJ11548liSGOUotZiqf9Ncqqad4uoBIk26
	 vMws5dAOsMXOMmjjHohcNlhZK3JtRc4zdrWw1CUrz6izF3CO0jKROyBpElDNIimS+ZsxE
	 YH/UzBEOIrjiwlS0UXzMJqVFV1r0TH1Y1OBwnz+z3/z2wxSkRrbfwh2kayEZ9S6WjMEQ1
	 LKcOZqFJL/Ii1AVqCOrVVpXEy9q8+6xnwnI7+8FNlNcpkqq7Uw6xFw5TgnEvJW7EAYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ehAwqn1JpFtE8NSK2eGRtzEx7P6AYMWxr9u3z+M2YhY=;
	b=D/1/6DMyACl4pwu8bkZQ4LAM2O0X0ZLZuAnDm1wr3n+0g/iVLbijEVfY/a3DMktFfZ+l
	 zSJ/b33ilGNea3M6vIlgNs8tqYSlu5xGHPa4tYxWqbjqPihbXTbrCDNyB3KxweBNT0FPE
	 LUy1EvmGjCmj/N5qrjyVUT3WhH2HoBXcrd6uRRkMCMXv9sE4BC1m2WyzJlhoCwjdJSmnK
	 my2ESjelndzogyT0I3iWxig5eQoCVaa3hW+7uPM3yZWWY6GyQl6TtLS/wh6PHLsVOXc7b
	 3fxw7X4WTyCU7140QJ0y2Gt1NyQhDrIcsdQzPvKBuv8KTdf9afIVixP/3rGWvII5cqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6TMvxnU;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583FB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6TMvxnU
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eadef147ffso1071339e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854857; x=1794459657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehAwqn1JpFtE8NSK2eGRtzEx7P6AYMWxr9u3z+M2YhY=;
        b=I6TMvxnUjK2GiH+O60ssBmDx00H+9Rh2JTK3iOrGg1vFixox4+0v83bOOTh0HrwJaD
         XAB9/zl1wREneGW7kuubncoSmAfQemr6INJOI3eTt1wmgHgR9ecOHg0WelhV+1NQuDG5
         XHBJxu6PAhOOmD9dgnAcMIoAGtWvXXoVXKNTDUWUY2VbpOrYUkxgvJw2LEVYm7xYJ1qB
         vAa5CRN2yPH0xb0l5cBNbeS2CFut+LPQ4DiOZGHbVvXoyuy4oLOI9SRo+Kn4s+lE1jhf
         IQdmh7x/8pjPYlt43peL/a1aKKUuWkYb6b1NTeOnfxdZYE5W3fBU594Fz0jbKkCT4RXB
         5SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854857; x=1794459657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehAwqn1JpFtE8NSK2eGRtzEx7P6AYMWxr9u3z+M2YhY=;
        b=RrWcRNy3o0FDTeDj+MFcSaje303dVXbm35PDimXMx+corCeIXLaYm1niKQI9yJ9OXs
         sEfLxtMLX8CspDnb1vBvaol+oKk+CGsHxdpS2kdcp4YHi6tCxVHEq96lhMkLLMyYMPg4
         nMnDyOAcYJcY0pdGjU3RSWcaWUBRd2dlo8FcTHakZIoyBv0N3weB8dB854heuas1HIAM
         XrZ1enf5wqK8TuXBTXkd2JTpRGO5NpknC+syS3q7bFq/mVm3+RfmHVjy+NsSVkK4DS9S
         IWhsv2/Yt6MG0fwuZhPl3IysJR66h9fUyHnaNoZlAVVK2a153tVDmFT6hI3omxTTdTvH
         HjJA==
X-Forwarded-Encrypted: i=1; AKwUvBzsXKwlJeUGn0PLRwpKirKFu/bLpScyXhfhA39C11Hem2w1A4SLlo3sGTzJmFthT3dnptA4LXdcvpNfWc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Etw5KyILtfmRpzHHQaAUhRz7ZXLTf2w3pD9UqBy8X1sHY77Tl
	8z/oN6b+J1RYFpNvet3Ft3CLNX1aHVsF+IFu/OSx2Zb/lJvt5WV0GjvAW81tnfSuagE=
X-Gm-Gg: AYBFou0v2wHPtMa06A/1OygaZfL33iPEV11PnIrPkT9uvvn5VpH0hIC2f7mP9Mj/prA
	HJ9okYfj8CxHzO6YuoJ3AZK9xb0VPxGOX5sYpfs6USlbFdOiIlf2wTE806AmXMrrZ1LG1Cg37P1
	XXLpl4ATho8+c40nE70uVEFaGbVltXe+SEPFZWApebVr0sg4ApxHSRb3RM2PLNZFHCQ/MvUbWBp
	FQk7YovVgIxb+J7D8clbCAknpSP0/jOEJeASLXPHX4na5L2ze6Y+3mkbNiLSy9Y9V5f+2ga/Hih
	qQ21Z+bBf+8zxCGs9uis4Qxz6x8ngK7SguktMpSbfDGXMZiNneY3fBMea2ePy3F2l+ukmB9fNHc
	24GpmG7smWLJ4nOSloGja3DJ0c0M8f/YO9d17d7ePtZLnIROsHsWxc8xi87zUUNZUMOTF0QcyXP
	UFDoiO4CfeinqGTm/1+ZUqA65uY4V8zf7Qrr6mHtkYqu09CxypLsupk9fTUG/E6aD5ldRVc5sLv
	W2VwDPvVphjHHzlT35OnjtADCnveNeElolM3Achsuf0oQmyW5rexFxZOMMYMJt/Qt2705A7HYrx
	MH01HHmSulFgsiZxw5bu3bSK3TPiJksh6wrj8GWLmCWxIlyH5L8ZbLSOK7H7Zy0jFsmxRsW4CTo
	pQaYYX47I1zBsTangWChHRrbI0qSCNWhZbG+zcTsDFT3cUpvLSw==
X-Received: by 2002:a05:6122:6984:b0:5c9:a60b:e5a6 with SMTP id 71dfb90a1353d-5ec689bbc49mr8844831e0c.17.1793854857202;
        Wed, 04 Nov 2026 21:00:57 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:00:56 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 0/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Thu,  5 Nov 2026 00:00:46 -0500
Message-ID: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

Currently, LUO freezes outgoing sessions only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) syscall path, serially under global write
locks, and binds every outgoing session's lifetime strictly to an open
session FD until reboot.

On hosts running many workloads (such as VMs or stateful daemons),
workloads do not all pause simultaneously inside reboot(): they quiesce
one by one ahead of the host kexec. Userspace needs an explicit
per-session freeze point to snapshot final file state (.freeze()) as
each workload pauses -- concurrently across sessions under per-session
locks -- along with a way to commit a frozen session into KHO so it
survives closing the session FD.

This series introduces LIVEUPDATE_SESSION_FREEZE on session FDs:

1. Freeze (flags == 0):
   Freezes all preserved files in the session under the per-session
   mutex while keeping session lifetime tied to the session FD. The
   session stays frozen as long as the FD remains open; closing the
   session FD before reboot (for example, to abort the session or on
   process exit/crash) runs .unfreeze() and .unpreserve() and reclaims
   all resources. At kexec time, already-frozen sessions skip the late
   auto-freeze step and are published into the outgoing KHO subtree.

2. Freeze and commit (LIVEUPDATE_SESSION_FREEZE_COMMIT):
   Freezes preserved files, immediately inserts the session and its FLB
   dependencies into the outgoing KHO subtree in O(1), and commits the
   session so it survives close() with full ownership retained by LUO
   until reboot. Once committed, closing the session FD (or another
   session failing to freeze during reboot) never unfreezes or
   unpreserves it. This allows processes to hand off preserved state to
   LUO and exit prior to kexec, and makes committed sessions immediately
   visible in the outgoing KHO subtree before the host reboots.

Overview of the series:
- Patch 1 decouples luo_file_freeze()/unfreeze() from
  struct luo_file_set_ser.
- Patches 2-4 add incremental KHO publication helpers for kho_block
  (kho_block_set_it_append()), LUO sessions (luo_session_publish_one()),
  and outgoing FLBs (luo_flb_ser_publish_one(), replacing the late
  luo_flb_serialize() reboot pass).
- Patch 5 introduces LIVEUPDATE_SESSION_FREEZE and
  LIVEUPDATE_SESSION_FREEZE_COMMIT and updates the LUO core and uAPI
  documentation.
- Patch 6 adds selftests covering both uncommitted and committed session
  freezes across unit and multi-session kexec tests.

This series is based on liveupdate/next commit d80a5528df4c ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v5:
- Rebase onto latest liveupdate/next.
- Replace reserved field in struct liveupdate_session_freeze with flags
  and add LIVEUPDATE_SESSION_FREEZE_COMMIT so userspace can either
  freeze a session while keeping it bound to its FD (rolled back on
  close()) or commit the frozen session (inserted immediately into KHO
  and retained by LUO across close() until reboot).
- Add incremental KHO publication helpers in kho_block, luo_session, and
  luo_flb so committed sessions and their FLB dependencies are inserted
  into the outgoing KHO subtree immediately on freeze, dropping the
  separate luo_flb_serialize() pass at reboot.
- Keep luo_session_freeze_one() / luo_session_unfreeze_one() in Patch 1
  rather than renaming them to luo_session_serialize_one() /
  luo_session_unserialize_one() and back once luo_session_publish_one()
  is introduced.
- Update Documentation/userspace-api/liveupdate.rst and kernel-doc
  across kho_block, luo_flb, luo_file, and luo_session.
- Drop v4 Reviewed-by tag on the modified freeze and selftest patches,
  and expand selftests to cover both uncommitted and committed freezes.
v4:
- Split out a preparatory patch that drops struct luo_file_set_ser *
  from luo_file_freeze() / luo_file_unfreeze() and moves file_set_ser
  handling into luo_session_serialize_one() /
  luo_session_unserialize_one() (Suggested by Mike Rapoport).
- Few more nits from Mike.
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next (commit 27be83a12b24 ("Merge branch
  'lu-pci-preservation' into next")) and split out early session freeze
  into a standalone series (tmpfs preservation and its per-file user
  argument plumbing were spun out into a separate series).
- Patch 1:
  - Drop struct luo_file_set_ser * from luo_file_freeze() and
    luo_file_unfreeze(), and rename the session helpers to
    luo_session_serialize_one() / luo_session_unserialize_one() so all
    of struct luo_session_ser is populated and cleared in one place
    (Suggested by Pratyush Yadav).
  - Unfreeze the session's files if luo_ucmd_respond() fails in
    luo_session_freeze().
  - Update remaining reboot-only wording in luo_file.c kernel-doc
    comments.
- Patch 2:
  - Add checks verifying that non-zero reserved bits and freezing an
    incoming post-kexec session fail with -EINVAL.
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (6):
  liveupdate: Move file_set_ser handling to luo_session_serialize()
  kho: support incremental entry publication in kho_block
  liveupdate: luo: serialize sessions via per-session publish helper
  liveupdate: luo_flb: support incremental outgoing FLB publication
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 Documentation/userspace-api/liveupdate.rst    |  30 +++
 include/linux/kho_block.h                     |   1 +
 include/linux/liveupdate.h                    |   3 +-
 include/uapi/linux/liveupdate.h               |  46 +++++
 kernel/liveupdate/kho_block.c                 |  86 ++++++++-
 kernel/liveupdate/luo_core.c                  |  10 +-
 kernel/liveupdate/luo_file.c                  |  94 ++++-----
 kernel/liveupdate/luo_flb.c                   | 111 +++++++----
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 178 ++++++++++++++----
 .../liveupdate/lib/include/libliveupdate.h    |   5 +-
 .../selftests/liveupdate/lib/lu_utils.c       |  21 ++-
 .../testing/selftests/liveupdate/liveupdate.c | 107 +++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  22 ++-
 .../selftests/liveupdate/luo_multi_session.c  |  33 +++-
 15 files changed, 612 insertions(+), 151 deletions(-)


base-commit: d80a5528df4cdee5871243e392da08c2d5c92e43
-- 
2.56.0.398.g882cbad275-goog

