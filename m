Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEC254B03
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395278; cv=none; b=VGPHOHEyyyiEqFt5YcgRHl7XWBuFkLuu21JIviESuKh3KKpKr3Nr3hjgA+phBvqDUeaVE2qyIODBCZKDMFIhIfXfJTkHcauP6GYdve91yoP8IWjUU45DPFEY8gS2YX/t7wJ47+ELIbFpPbtKAYTuA0nGDT/2AcmH8qnsTkmahBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395278; c=relaxed/simple;
	bh=3T0fIXqcvXOZV/S7e3pt0pv9VnXxwiBuxeb/dP/F3bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgSESAxQcYayCpLKnGDbeYg0M9L9gxltcSId94nRxoXcETtt6icCryfuYnDFKGlAVBK7JSAHGri3szjj+Q9E1iYYvi+O0wRSwyzeTNUvJvJGM6Cf2Zdr0syZnqyDEuKQU5jEI2lNNk6B5ebyLmKVeLa0nP9G1OVv+szQa4wyIr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1hqdjSu; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1hqdjSu"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so903488a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790395276; x=1791000076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feSWp0FeA2kSuVMH2CMgZ8PGvP6pWP5LzQDclYVaTIQ=;
        b=Y1hqdjSuBEbTEhiSLesYkzG6Zzp5IR351H0tjlEF5pe0WxWknrUsG/8P4lyDbJHT+N
         jS8YYYwvWM22GHlv/mqsmxRLwOiTD2hfK69Qz8fvlcdE2N1XtHhhaFd+bEVGO8EMDaEq
         4FcZ0Cn/RJUPvKgq7EQYw2mgfTZWH29tPkbwVzIhFC50wliPCZ592aoFq97FlJ7lf3AS
         T+03k64x+ZQU2etfmvSoyaTlm//czs7AQsXBJpPdIXfnbclvWsLWiEjFUEAPgbcWZQzt
         pY14CJXoHE1hZuuobQahNQefwo187Zg+XdpJ9bYBJcsHMw059KpWus1KLY0Ht32Ec3HJ
         EFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395276; x=1791000076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feSWp0FeA2kSuVMH2CMgZ8PGvP6pWP5LzQDclYVaTIQ=;
        b=x0tWOqS8IgGl4MfLzFWsBQvQGm5cjHj/RFP4D+dlXKyDo21yNgKa/N8Mk7fAzNccK3
         BpQWDNEs1uNKFfDlh81IyDJaz48lq3Hy2AgU61p55KakFf0JBjCXe94nEV9sXcNjw1JT
         yN7nHLAxzFmVbgRNQPjEK3v/dmAFIqx6udUOcaOLBJf0AMJWbxofwRQD4FK6JY4xn2Kl
         uY/8fLQ5BZOZZ2TAPaRuk+VpVJi+0wf/RUyVB1A7S9ISKHN5f9MfazPOoq7jZb8dSXp7
         KdOaXCp/2UtR3jxR8ZKaU5iZRMECqgY2MKA4CgNwZVdPbRLkVn9YuYZrhHccknylTbg5
         mQaA==
X-Gm-Message-State: AFuF++kjshl6RYThC3X0IXG8GIXT2nnX9KUn+rMovMOkPAeANm6Pvr11
	ZnE2vMd0rEc9oxv9DbguAFNjsACgwge0pZoZxb4NjYLGS1wJ+xmRpv/9D8uyHw==
X-Gm-Gg: AYBFou1KraLRCAMxuXGJFcUqr0ykn1mVcK/wQjzQklDuRvSNZwfvWsYIbIOdZ7NZedp
	GVF0bh9XdHDKCYWV/BBoZX6Bnocvi9i9LKER+COFzc7KMOZRXXm63CFENfIEK2nRjlrrR6WRgDC
	RUJT0xLLIdRQ/YsVZqBohaUQyOIiqFbDr3fCoEOzdCCLk8ePAt6WmtpNMd4AihVZnwRSFIHCE5u
	oBejLfQj1XknJh9Vt+wP9lBIcKhPCY12tnizQVxKYrAro8yi4JiFedxceYHWDi27joDbMsKS4r3
	2gFFGgx3pM+CUWObULXFiR7wd9GMR2t9cfy7IPpQxlKQu33cad5eyZpaPbudxBfm6VgbmKpbzkC
	aBxTfyTncC9ZWxIHaWBx7XxwsSTPzwsu2gNsfZoz/g8JpFHVAPav2mJ4DTCRrJ0T9SQTPQ5tf24
	GbNYLqd+q0hDvsdfM8GvLTMehIpsfLLk1Hhaoco89pJq0vH41ObxLu8Px3kqZtPGXtLDXvSzKvg
	RJ6154F7RtODA==
X-Received: by 2002:a17:90b:4b89:b0:3a0:d2d8:edf1 with SMTP id 98e67ed59e1d1-3a0d2d90c15mr1241338a91.18.1790395276387;
        Fri, 25 Sep 2026 21:01:16 -0700 (PDT)
Received: from Modern-15.. ([2401:4900:8206:fc0b:ca44:7562:7898:358b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm6845063a91.0.2026.09.25.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:01:16 -0700 (PDT)
From: mathura kumar <mathura.kumar.tech@gmail.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	corbet@lwn.net,
	mathura.kumar.tech@gmail.com
Subject: [PATCH v5 0/4] Add two new system call mq_recvmmsg() and mq_sendmmsg() to posix ipc mqueue
Date: Sat, 26 Sep 2026 09:30:54 +0530
Message-ID: <20260926040102.308350-1-mathura.kumar.tech@gmail.com>
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

  I am unware of some error code like ERESTARTSYS, it has special meaning and purpose
  I had just sent v4  couple of day ago but was not handling it correctly.
  
  now with lot of continous grind I corrected it and done some optimization


change since v4:

 - optimization is done regarding memory footprint for userspace caller
  by introducing two mode flag

 - error handling and error propogation is improved

 - documentation and test updated

 - v4 Link: https://lore.kernel.org/all/20260924153505.620772-1-mathura.kumar.tech@gmail.com/



mathura kumar (4):
  IPC: Added two new system call mq_recvmmsg() and  mq_sendmmsg()
  IPC: Added system call entry in all of most common  architectures
  IPC: Added system call entry in performance tool
  Test: Added self-testing and documentation

 Documentation/userspace-api/index.rst         |   2 +
 Documentation/userspace-api/mq_recvmmsg.rst   | 224 ++++++
 Documentation/userspace-api/mq_sendmmsg.rst   | 174 +++++
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
 ipc/mqueue.c                                  | 664 +++++++++++++++++-
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
 tools/testing/selftests/ipc/mq_recvmmsg.c     | 393 +++++++++++
 tools/testing/selftests/ipc/mq_sendmmsg.c     | 360 ++++++++++
 46 files changed, 1945 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/userspace-api/mq_recvmmsg.rst
 create mode 100644 Documentation/userspace-api/mq_sendmmsg.rst
 create mode 100644 tools/testing/selftests/ipc/mq_recvmmsg.c
 create mode 100644 tools/testing/selftests/ipc/mq_sendmmsg.c

-- 
2.43.0

