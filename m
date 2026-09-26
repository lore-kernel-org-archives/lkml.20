Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBFF21767D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395103; cv=none; b=oVWh592iX1xfUjjrt247fgmgBZlXZ6QsoLaI2zmVkG/cQl8+/RLJ6GywCNTrHqL/LkhotY7V6kXlIQbYJDyp8ADK5DKQw65AgW4q/tup5kgTGnRdxjjjozVICX5WHo+kIubqkUEl9jkDKmFJhXY7zbt6V9kbCF6tlryD2ooekX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395103; c=relaxed/simple;
	bh=3T0fIXqcvXOZV/S7e3pt0pv9VnXxwiBuxeb/dP/F3bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ci27ynmhdUxKIUWBr4OFxdLnx6fKigbsgpCzT47pX5aSTlX4yjXZ5hxxq0UP29LuRYRVvjMZQU7BisdcA2kV51rUI3OQa7v7kRXWby5ZMTNxviJ9jGVe69v5igaQBSSVwXrhk4W6bGvwANxf7/+ycMsGZEUdKaJ1354pWaWzZeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pb+9Dv/d; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pb+9Dv/d"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so839488eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790395101; x=1790999901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feSWp0FeA2kSuVMH2CMgZ8PGvP6pWP5LzQDclYVaTIQ=;
        b=pb+9Dv/dz1Zy86ezAMT2uUH5GWa9og67AGQjgAINdGFDgvMOSB30SoKdkRvoy6S6Ih
         B/b28wOuhUnBRrnmSZK1ZQmgBsiGTbf1s65PUCZ6Y8Y+TKDApfbwLvKqzg/bYWFRQuyg
         ezWE0kEUoXjvIDb+R9bciICm+zKKTBwx2T3s33fwaLH3giQCCzNC2eEfx/TRKqNidt2W
         U2TBQMfsENiWUTgPjru63ODjd7TcJBZaQqRA8KtkB+1hTxAJlcK+V81ZFd6RZCAQZKXd
         YwSQiO24bXMgVop+c+9KPiKKvBKS5HdSe2dSoB51cdGtY8SMkPGchbSm3JCJ0/1Jw8YU
         3lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395101; x=1790999901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feSWp0FeA2kSuVMH2CMgZ8PGvP6pWP5LzQDclYVaTIQ=;
        b=JZXsnFb6VNhUyOY71gbpNQe6Hwk86NaAypkSAwBLiO0aeCdbY18RINc5EbsA67Fikq
         Fz+MtrcdzCWSj2+iO4HHIIiRIKNLGQtY/NBHBkhguhOHQTrKI8lTvUg1SEGaKywFkZzc
         yhIJ8UvDrEa92pRgCbom1ofHjTXS9j4oju72zIdjm6LT7jaK3TWfctzGsKl8KbPbvzvP
         j7krhCbuUhD6OJCx1xdEfR4hu7wBcHV6NvC2+5YXwGroSzrsmAbd46bIt8LN/4p+XbxE
         aIIUkMFqpzEUMTHERYWwY54bb0bYUimbd5bRRXLGbq2LGJgO17c6tUL22lQZ1PzLckoc
         F6JA==
X-Gm-Message-State: AFuF++lE+EW0idYnJMzLUbaKjgX2rrkM6M9OroVj8zKJuMvOqEijrUTz
	porcMkztfbhUkbHOCEQLhZPqKZiIgYu5B628tbdpeoDQ7r7WfGu8i5Zx
X-Gm-Gg: AYBFou0UAdM3huvCLJnplBBhTgqXr1k/2+osAt9McUHTNovjyXXDxTFjPzER505vHMr
	Eifaj0L2kC9Es5vPMbxpTzbN133jY9kUv9z93NwcJyhgzR4RbP0y0yXT6EsskYM9CnmL1A0vkN8
	VsQOsdVgKwV2P7UPH0HSJnefYO/cuYDFYhmoJD3Hisp8Dn1kL6QKC3SkAA77pgCYzCAsacRYu2T
	msz/2wezlRafs2pJa+wJdNS1/MVP4uYbUwonWsGq7t6EK5x1H47qJehp3RGN0KcnC9CCBFlTmp2
	rzStOD5LHcDZCNbq+Mr5pwHEP95NbNwuHHdWCWW7ubVpCZ7K9BAsTm1IOlBAV7TCvbIg/F9jg68
	2z8msX6SvQR40d20VDF2QougCBjA/W+273FbUMYazCXuCaYBPzl+wGFwKFcGziKwvKa6NdEuZ+Q
	7JSCMoMNbYfuAxNNijbiBssjOv//Mt/THG6BFmut/XH11AxZSvYzGVTunhQXMWQB82jpHp64TDx
	pi5NOqGZSUz0A==
X-Received: by 2002:a05:7301:1448:b0:342:6595:d750 with SMTP id 5a478bee46e88-342711aadcdmr1815588eec.2.1790395100853;
        Fri, 25 Sep 2026 20:58:20 -0700 (PDT)
Received: from Modern-15.. ([2401:4900:8206:fc0b:ca44:7562:7898:358b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm364689eec.14.2026.09.25.20.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:58:20 -0700 (PDT)
From: mathura kumar <mathura.kumar.tech@gmail.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	corbet@lwn.net,
	mathura.kumar.tech@gmail.com
Subject: [PATCH v5 0/4] Add two new system call mq_recvmmsg() and mq_sendmmsg() to posix ipc mqueue
Date: Sat, 26 Sep 2026 09:26:59 +0530
Message-ID: <20260926035705.307233-1-mathura.kumar.tech@gmail.com>
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

