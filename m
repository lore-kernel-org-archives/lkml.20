Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B794A2066
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264161; cv=none; b=qJUlRQDkKiHqPpLa+xsAVbcbdDIBcPYtmIlVLa8s8/BAGRgsvp3Rp3P1MHfm0D00IoxsabNd584y8wFK31VDFmYCGfZ12KGn++Yh3DC2s/sBrc52koHTvLi1Ez2mhAQESV82UyeIyxD+mRM1o53Ht5C/xrOjCCl+cYFh66SRwGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264161; c=relaxed/simple;
	bh=mlv69x0N9i4qbZQg/+geRiZh4d5nOSPd9+CjaCFBgHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GdqZ44VBly93j35yNGLLW1/B6TQz+vFuyIYOskPAinYD2QEbHgbt03hB7IIh/5ucpP/bJFt01YKB8DY55+ZXqALF+Ae7LrEyveiZCJD+8nGMflbwwEiiayq4ll52YhobJ56gDNokw842/ruu0fzdh3my+GIJtrRd/IbJFyIjU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxNoOsVr; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxNoOsVr"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so6392a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264158; x=1790868958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bocc4bE8/VVKEqsS/hQwZ3tENRkWoxkRCCfn1+gpxLY=;
        b=UxNoOsVrTZo2QwhmlXTHAh9DqiL6PqtLFSYxK2nuX+1fl1STOaKD0tZiBSLS3ovE6M
         JbC53Dy3G2msqJNPVmQRpaI+1TDmReBp5mTX7DIIvRhO3Y4kBm9kgZwuHNk9BuTz+Ybh
         TxcPD/ZgQHGfZks60MtaDn5QgzhzdGB7sxm6EV04vyeqnMCSZTU7PrMZ9bXWm0aAVKxZ
         rA5RAjN6KhfVnggxk9787zvAztVorRFy8Av1j0qyfnPuzEjBrZc4Z9Wl5gkD+esTWZjR
         W/JKKeuZrl3wonnmX7+RKi66E5SJeniAqptkUGcRF2eX1Rtm9/f/588ngyk/j+a8U2hN
         kcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264158; x=1790868958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bocc4bE8/VVKEqsS/hQwZ3tENRkWoxkRCCfn1+gpxLY=;
        b=QhjB4/m6rvhmubrBXfS2RS+SsU4MifiNHnUWD9+AjsEL3/w2oq0cocQKFehKA/M1v6
         gTJ+wAmdJKFKAnIbLxSzwsiyYr0+btKRc7FHf3ug6+CfF3ovmrYmf0bDfzEBU1Yg/RA3
         nqwKshuRGsQMgANRIIMCirWNdbMmwwKySQZ7mN1c+zPUl9bc333zgED+FsgiW+405Jc9
         UcXZTCMZwIn5AocUS+iU8q9O9hcTB3cyKNMgnFmQaz6bPOgqhoH3xM+MvmqUP4hr1+XP
         UqpVcmfEGP5uUpO+NXjwltAkZByT+FlzNCI2dKlerFhqMh67928BiKyUy7zI3+svgjcv
         LRAQ==
X-Gm-Message-State: AFuF++lkZpRcyfwNu08tiLJzGM79gC9PURAFMrEuQFEfQh9BEI0RqP1G
	rJzkIv2Up2s95XsIAW1NfHJE2DHAqvO2L7ZINpZ7UsSgkZbtmFbnF5grnXy+DQ==
X-Gm-Gg: AYBFou19h6w0F+MMFh+24pHkoysXLea4pSgmsQcy73KIH0EI2abSF8LIfhMxFeBT9wr
	7NtJNhVlKuVVgSohDDLFMQ/YSizP9FbvdzPDPOGEQ6mt3isbgjhxZqeu4F0Pybr6cOej4pX23kY
	+x/yH9BI1/43Ki1Zd+kc3jF1Gym0/WohPJ0dTFo0mR9QAvG/HlOUZIkGOa/FiqAH3W10vWWAOEd
	7LiHKT87jjqXBqh/9KwQw8fA0TwvKAms3wbltEQHAvGnHgFhMMMz0qjmpSokxXEPL/NWwYvyvy4
	9EmdywiixkomY9qK+HfFR2LrYcqKUWGYpb4ug3F+KKxyjlWRuCnAz9G4FStnO623SI9Wdi9m69w
	BicuE1sbdohvGD4Fls/oSuvuA6N2khA6UjIU68IDFx0ChknL6vt/i/31pnCMx57GCBoiXMVw/95
	cgXJA3zLvGvg89EntyYzGbW8IVIdXsCV8KaP1YNim5NyD8ut2ugoBK23AQrCr/lWFGyKbOrZ63K
	7qi8uvaDg==
X-Received: by 2002:a17:90b:48d1:b0:3a0:3881:ead0 with SMTP id 98e67ed59e1d1-3a09855f5f7mr2595289a91.11.1790264158560;
        Thu, 24 Sep 2026 08:35:58 -0700 (PDT)
Received: from Modern-15.. ([223.225.63.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b11d4sm5979066a91.4.2026.09.24.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:35:58 -0700 (PDT)
From: mathura kumar <mathura.kumar.tech@gmail.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	corbet@lwn.net,
	mathura.kumar.tech@gmail.com
Subject: [PATCH v4 0/4] Add two new system call mq_recvmmsg() and mq_sendmmsg() to posix ipc mqueue
Date: Thu, 24 Sep 2026 21:04:58 +0530
Message-ID: <20260924153505.620772-1-mathura.kumar.tech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit



Patch series overview:

  1. Add New system call mq_recvmmsg(), mq_sendmmsg() and handler implementation.
  2. Add system call number in all most common architectures.
  3. Add entries in performance tools.
  4. Prepared Documentation and test.

  I am still awaiting the full review for v3. However, I have incorporated the
  minor feedback suggested so far and wanted to share this updated version.


change since v3:

 - error handling improved for backward compatibility
 - edge cases in augmentation has been handled properly
 - documentation formating fixed and improved
 - syscall number order corrected in arch/microblaze/kernel/syscalls/syscall.tbl

 - v3 Link: https://lore.kernel.org/all/20260816153811.1085261-1-mathura.kumar.tech@gmail.com/


mathura kumar (4):
  IPC: Added two new system call mq_recvmmsg() and  mq_sendmmsg()
  IPC: Added system call entry in all of most common  architectures
  IPC: Added system call entry in performance tool
  Test: Added self-testing and documentation

 Documentation/userspace-api/index.rst         |   2 +
 Documentation/userspace-api/mq_recvmmsg.rst   | 207 ++++++
 Documentation/userspace-api/mq_sendmmsg.rst   | 171 +++++
 arch/alpha/kernel/syscalls/syscall.tbl        |   2 +
 arch/arm/tools/syscall.tbl                    |   2 +
 arch/arm64/tools/syscall_32.tbl               |   3 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   2 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   2 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   2 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   3 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   2 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   2 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   2 +
 arch/s390/kernel/syscalls/syscall.tbl         |   3 +
 arch/sh/kernel/syscalls/syscall.tbl           |   2 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   3 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   2 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   3 +-
 arch/xtensa/kernel/syscalls/syscall.tbl       |   2 +
 include/linux/compat.h                        |  12 +-
 include/linux/syscalls.h                      |   9 +
 include/uapi/asm-generic/unistd.h             |   9 +-
 include/uapi/linux/mqueue.h                   |  27 +-
 ipc/mqueue.c                                  | 595 +++++++++++++++++-
 ipc/msg.c                                     |   2 +-
 ipc/msgutil.c                                 |  45 +-
 ipc/util.h                                    |   3 +-
 kernel/sys_ni.c                               |   6 +
 scripts/syscall.tbl                           |   2 +
 tools/include/uapi/asm-generic/unistd.h       |   8 +-
 .../arch/alpha/entry/syscalls/syscall.tbl     |   4 +
 .../perf/arch/arm/entry/syscalls/syscall.tbl  |   3 +
 .../arch/arm64/entry/syscalls/syscall_32.tbl  |   3 +
 .../arch/mips/entry/syscalls/syscall_n64.tbl  |   2 +
 .../arch/parisc/entry/syscalls/syscall.tbl    |   3 +
 .../arch/powerpc/entry/syscalls/syscall.tbl   |   3 +
 .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +
 tools/perf/arch/sh/entry/syscalls/syscall.tbl |   2 +
 .../arch/sparc/entry/syscalls/syscall.tbl     |   2 +
 .../arch/x86/entry/syscalls/syscall_32.tbl    |   2 +
 .../arch/x86/entry/syscalls/syscall_64.tbl    |   2 +
 .../arch/xtensa/entry/syscalls/syscall.tbl    |   2 +
 tools/scripts/syscall.tbl                     |   2 +
 tools/testing/selftests/ipc/Makefile          |   2 +-
 tools/testing/selftests/ipc/mq_recvmmsg.c     | 392 ++++++++++++
 tools/testing/selftests/ipc/mq_sendmmsg.c     | 360 +++++++++++
 46 files changed, 1855 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/userspace-api/mq_recvmmsg.rst
 create mode 100644 Documentation/userspace-api/mq_sendmmsg.rst
 create mode 100644 tools/testing/selftests/ipc/mq_recvmmsg.c
 create mode 100644 tools/testing/selftests/ipc/mq_sendmmsg.c

-- 
2.43.0

