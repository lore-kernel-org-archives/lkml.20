Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455088;
	b=e2E09962LXJV/fITjaEupY4ExijC0RA3wYkpKGHlZkoFt9BEQlsaZ6QNh3Y0i+0jkJJO
	 16Jb4pzbXZKFjcPgUsunt+gK9W6zLP/yBzAK9IuH3ytO2QhOZJCf1EbNZDbUTEHgooNLi
	 sezOerJTSWOhlkE0/Ngc8MO2glqix7YGauIvOzWtfK4AcmkD5JJjQ8H538+jIh6mtoO2u
	 3IRAgdGmGPVmC5/mGHniCLuUGr0a52G3xieHljLn3ct9EOKvbds2+zjPG0cNDfDEhfw0D
	 DQGUQd718AWCWaFeVZ3FOxx0pqI2ejLDj+kLVB7BBC/aPVtxa6DCmp9qb7o/Af1AxXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fI4KScsk7gG6RwgtVM01mT7SOGeJOcVhU9QE+cMELpc=;
	b=U9Frz2y3f29IOCfPA6c2bCxo2lTkodWQ6zG5ekYM6Wq2WiGoeckhXqA1EXC7QsFBgIw0
	 jCsH/XHBQsdELlJn+Kz4YCMt7dIjQtKvDM5v1VZ+QMD7LyJvdYnmQDnm2oXq5XEHPO6pd
	 Iw2RwPmjpwvY0WD7HFPwntdKEq3F5E6DpEdOo/fGj1Cs5Z01R80MI1k3OmT399UHlNuA7
	 ErMbdJy418LDPi/vq38D9u66rDwO+rkuUMRiopDTCj71riEODk5RVXMhqJPmvEkoJ36DZ
	 X0UoPug9efvCTEIxXtuKUPsK4vrgiPSA/sBnNMtsU5JhP00GeoTgT3bKNPyNpvYdrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZuK/xJSa";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F3606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuK/xJSa
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so235769c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455087; x=1793059887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fI4KScsk7gG6RwgtVM01mT7SOGeJOcVhU9QE+cMELpc=;
        b=ZuK/xJSaPYMorUcvpk1xv8cGzF4wBYKxStqYcq8UGMHroIRs76vKrnoqiNMnZ6Guzg
         hXa+J8q0ipI67W/zNZ0plDISXfWsOpeDrWKyOYd4vcCflYTuf1mosbI+KSU8/XEFTAna
         p2DeDYK1Wt/7tIOhJVneIfe2XrvwJlDowYteVmuuBq7fasKZ+S4et20K/cMcCmB+r/zE
         2/mivEeAGuP3eRDuBAaPr220QbMBZ0K8FLF/5CL4X8Kq1Bk604ng/38QMgfKW2/Kg7MB
         yWQR/z+mwVg/cOafaZ2/HWGCaa+KzAdXhMiwstX13aLLRnVhonTtMNyCPL6NI+UJr1nC
         Yz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455087; x=1793059887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fI4KScsk7gG6RwgtVM01mT7SOGeJOcVhU9QE+cMELpc=;
        b=gzdjnX5gsUx2YcJg8PeqyAbKTXnqpliYCVGLnce0r7KpN/m4GLfV50IHVWvz6hjX6C
         OFsuMNJlkCvO5DGz1RKFQOUcodeZPW15kyVq/u1/m5iliK5GhL90LZttFgJV/YvaP3Qo
         T/GvXeqSWkjR2XUtK1qDQEjrvMqQQQ2vSLp6fa003f1iXau3C+AXCAjQnSJUFuWSDLQY
         YaBlp7Gj5ijl3Q/HO9IrNJ7olGuP4J21pEEibYvJSGwSGqQ2bPR+s2Q6GIS6ZBg/2oxD
         0B5TO2+5N3IixNcHpb47CWfiDm2BjgBH6T/5s1MsSLZdz8XsKf+p1JScVFsUf8V+UfkB
         KSXw==
X-Gm-Message-State: AFq9FYKwnq3geIAMLF/5dD6lv83z8vZQy56A1jtitwqxMViAvjYTdAU/
	UrdVbBDOiInt2GbtnWOcsSz4y4qjd3T5JNCmF0ZtEBGwzM0wxryk+13+zqbDTw==
X-Gm-Gg: AYBFou0IRoBKfZwzKe4YgNTs/Y/tIu323eogZqRggo6SXLzSr47MEbfM1uu2WOrBfrC
	eQ3NFcKMt19i+dG4dHCiZrbcth0jwdcx9pLfYFvgu4maY71TEUWTx33xZMms5tTzFRxGlRLgt4D
	89+3WBue4Ek65pHfJ6AzvC8Bj4U+72PawiNb+uKJwQUNJpRKanoJ0hfA7C6j94Kf3r1ru2NtDL0
	u2tF/N7Ab/xWd0xR3Be0SJ5I85D97/7TrOBE/EsE9izlB+g9Dx3clyig38Hlxhp2KWC9thoHMcC
	UByGSd+rwop3KAuYLGeWuz1SpwEvYtyuLhpphjiPSskchwNgnmQY+lgVDQf85xgXWQK/8rTEsfJ
	umZYv7Dr9Kd3wVgoDUJerdXC6rjijFYEV7TXcE9Gd9uGKytdoPE1AuqnlhDGbTUsXA1jynSV+zE
	LrgCWvzIwMWh5YwtTQ17rIBjhTVCbYshpmcDmQ6oJPBXHpwdW4swWVdBdCzMGieBzR1vTgYb7cu
	Aj0zeHk7o567io6EVGOeKu7SjIkxdj6m83ChpQ2d+0MI/0Djrw7nbxA
X-Received: by 2002:a05:701b:208a:b0:168:fe32:35a with SMTP id a92af1059eb24-18512296a20mr12690950c88.20.1792455087062;
        Mon, 19 Oct 2026 17:11:27 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:26 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 0/9] seccomp: report the result of continued system calls
Date: Mon, 19 Oct 2026 17:11:15 -0700
Message-ID: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Cong Wang <cwang@multikernel.io>

A seccomp user notification supervisor that continues a fork never
learns whether it succeeded or which task it created, so it cannot track
the tasks below it. Today the only way is ptrace fork events, which take
the one tracer slot from every task, may be forbidden by Yama or an LSM,
report nothing for a failed fork, interfere with signals and waitpid(),
and cost several stops per fork.

Sandlock [1] hits exactly this. It is an unprivileged process sandbox
built on seccomp user notification, with no cgroups to count tasks, so
it must see every fork itself and is left with ptrace and its problems.

This series lets the supervisor ask for the result of a continued
system call:

  - SECCOMP_USER_NOTIF_FLAG_RESULT, given with CONTINUE, queues a one-way
    result record on the listener once the call completes. It is read
    with SECCOMP_IOCTL_NOTIF_RECV like any notification, flagged with
    SECCOMP_NOTIF_FLAG_RESULT, and carries the id of the continued
    notification and the call's return value.

  - For the fork family, the record also carries the new task's pid in
    the listener's pid namespace and its pidfs inode number, which is
    never reused. The supervisor can open a pidfd for exactly that task
    with open_by_handle_at(FD_PIDFS_ROOT, ...), unprivileged, or learn
    that it has already exited. The record is queued before the new task
    first runs and records are received before notifications, so the
    supervisor always hears of a task before it hears from it.

  - SECCOMP_USER_NOTIF_FLAG_HOLD, given with RESULT, reports the result
    as a notification the supervisor must answer, and the task waits
    until it does. For a fork, the new task does not run until then
    either, so the supervisor can act on it before its first
    instruction.

The interface is generic; only the fork family is supported so far.
Results are reported from task work on the way back to user space,
which needs nothing per system call. A successful fork is the one
exception: it is reported in kernel_clone() just before the child is
woken, which is the only point where both ordering and the child's
identity can be guaranteed. Every other system call is refused with
EINVAL, which is also what older kernels return, so the flags are easy
to probe and can be extended to more calls without new uAPI.

struct seccomp_notif keeps its size: the result shares a union with
struct seccomp_data, so the ioctl numbers and SECCOMP_GET_NOTIF_SIZES
are unchanged. The record is allocated by SEND and charged to the
supervisor, so the system call itself never allocates and a record can
never be lost after the point of no return.

Tested on x86_64 in QEMU with lockdep, KASAN and kmemleak: the full
seccomp_bpf selftest, the new tests as an unprivileged user, and fork
result records from an ia32 task.

[1] https://github.com/multikernel/sandlock

---

Cong Wang (9):
  seccomp: add result records to the notification listener
  seccomp: add __NR_seccomp_* aliases for the fork family
  seccomp: report the result of a continued system call
  seccomp: report the result of a continued fork
  seccomp: factor out the user notification queue and wait
  seccomp: add SECCOMP_USER_NOTIF_FLAG_HOLD
  selftests/seccomp: test fork result records
  selftests/seccomp: test held fork results
  Documentation: seccomp: describe system call result records

 .../userspace-api/seccomp_filter.rst          | 117 +++-
 arch/Kconfig                                  |   6 +
 arch/x86/include/asm/seccomp.h                |   4 +
 include/asm-generic/seccomp.h                 |  26 +
 include/linux/seccomp.h                       |   4 +
 include/linux/seccomp_types.h                 |   6 +
 include/uapi/linux/seccomp.h                  |  57 +-
 kernel/fork.c                                 |   3 +
 kernel/seccomp.c                              | 461 ++++++++++++--
 tools/testing/selftests/seccomp/seccomp_bpf.c | 579 ++++++++++++++++++
 10 files changed, 1218 insertions(+), 45 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

