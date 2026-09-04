Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD114EE876
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537417; cv=pass; b=ph7ZI6ipkCojlnbSv4rjbgsKObMy5x617QBP55w/VMLjwGG1JpvuTqMZ07Jyek11RQYyeoXaR5dMxKtGp4bcJjqUyBUX5uvJaKU2U9PS7mpO5WEtWyOEzsSM2xKhWEd+r4LtIgOeCDCGeCLiD7Gn+PWZgQT2O9b6+o0fEfKGP0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537417; c=relaxed/simple;
	bh=ZedpNpdg7Ljc3wUSJIdxjLdYR07WVf7nzAKEFvx1nlk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pXImntOEw8Elsj1owIZ+KD2BAqi28gHpFMtSxpVuLf9mQxP11Yitk/igNB+zMqS1DL+hYiNE9ed7Z613VKILhcDBWBzEr2yWrexvSPdJYiPsHr8yRmtiUdJlwXsyWeOfZBei2hKIcsFc8rrc0iAX4Q59XYp4KUwYTYCCQzUZluA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcAZh8KN; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcAZh8KN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1558036a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788537414; cv=none;
        d=google.com; s=arc-20260327;
        b=QoB6U7boJ0uhCJ3qSKksMZRLTpykrB+mlstwrwZyIUABWRrmz6B2LZvSdhpQtCfH+6
         WiC7Y8ek9Acy464CtXS+EL2lk+1kZqk28IdAyZ44fjDmfecBOyiOPd13I4x3RDLkDaNo
         NnniWQk59TTtzUI2tWwn6rwd9C886J9S3Hv7wMM3hZKf8XSYd1SZFqrmcmwhwufQ3ySS
         rUy0JoDgqHMEQbMJU14FHF6wx3Zad2Ld5xTJ5n2TJkEHEDUbbRBr0yWdtXVMxhSwrzXl
         TS+mk/3h+QHVM9gOOPF9/58qNKOzuLBckE2aN7ZXAypJ+X04ABeavRD7PaybJpgLp4OQ
         DwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=otS+J+bVwv/Qn5hM+1H0O+k7h52oXcfagomMh4dhaxQ=;
        fh=Xh+knf+up1GismbTDF5WiLFxqyRQHAmnejdKXD0K9Cs=;
        b=KC+mUCyVSNvg7Y5QSaiAbOfTq1tr3ktbds0CDDEoH4Uc5Sldyy4stMyjkm7gGHcx3e
         2xv58pbH6JYv/E8HqIGfyjCJBSw6BFIfMcokPiKa0eopPcOq7NrwAJRWZsxOckEbOIUa
         bBwYUUdUItU3iWqSysNgPRmUfYG7va1y5Yjb5fUiXxC9+QH0n5wayFubXI979cULuzIb
         w2IrPS7TLXIYx1+xCuE8f+LLQoNxh6yau6fJgMN+0NmMQ3Qj9y5/Xb+6+DFgCS0mL3+Q
         eTPDEmc/2MAcfBBj1gZeufS2QIxqjtnFJUF+XwNO9cqPlpzm9TYsCcoNLARh4Zh0JnUP
         kt0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788537414; x=1789142214; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=otS+J+bVwv/Qn5hM+1H0O+k7h52oXcfagomMh4dhaxQ=;
        b=IcAZh8KNQeV6v2YZRO+HlBwomH2KtzHTOengyKUKkSOf1UGOaodIB8PGHw2HJ8QnTd
         CAWbXS0DC9+AckbGfA8QGS7XNydpMsuougwAhdWY1pA8/Xv1iKuF22WM7h4n2l5cT9NA
         8j4pTo0VNmnhO8iZDExhpwhGtLRvhse8Vkf9HLnwM8aTd6YxhT6+n+RtmhYR2W7wdyJq
         BmyDkjZRTsrwzSLubpYbBrXRBFZFUqdL3NdqzWZyiniO0NTupSCySm1XYqdFb2kBxVWP
         SKKIKYn2+imD1QaOPAvLMEska0+ZUZ/oTgGIfE3lBQ4g6DNmdJ7ip+dgS4hLlHkmYjRZ
         NKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537414; x=1789142214;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otS+J+bVwv/Qn5hM+1H0O+k7h52oXcfagomMh4dhaxQ=;
        b=DUEZ8ZZhIhk2skGdt9C1jyixul0RMF7MDYk+YH85tgO3ym5EXORNNg4Zwx4+c+tqX4
         cJ78j63xabrzzHdz1AonslvXGzuol8q9qbo1q4h8bOIX3wvNpfjTOShL0oTDyc9XglDg
         rMXxzC3AcfVBqRcyKtJM2z3k2Mb5eFrLsEuUGLRNxSOg+ygTKl5lUeFgm0cH0MYz5rtM
         3na7KhaCm9WdgF8UWe71YFug7udhRXM51iDTbn6Unru06CmvqUEQs3w1ulobPvG42/da
         xQNSBNlbVr64e/FOZ5fpJkxef86Se4t9q4xG4m+GixYDLESOEL/4a/Y3jTeFlIJlblUG
         d35A==
X-Forwarded-Encrypted: i=1; AKwUvBybTwx1wNM21AdqT3I64d25j6UD77vzrK04AZYUaVq6Y6AXikRc2+TpBnUH7Sd/fk0QSSz0uwW+SJOBw28=@vger.kernel.org
X-Gm-Message-State: AFuF++lGzCu1H1xd9z5e6RRAj6lg/62qyrlLQBrC5b76lfYU3D4FTLOv
	WYSVjai2atQIwZa/xOVZPz0jEmx+Hw9HkpPxNsWkGCbh+wY1hKOXd5ighU+u8M0eHaQGObraFEj
	sqYmaRtC1EGNS4MqP8inGOLCzBD5r8Sk=
X-Gm-Gg: AYBFou12ppT277A5D5XKkWe196R/Mt0GT4fSrKthTjQQM/73cBwHriAIm0HNtctaYh5
	+DdXDOTbcD1uu7caJkn/Ora6agxMoQTsoZi+MvR3Cy8ppc7/npqXTSHeSYgEyEfvomujHs7M0It
	zFlOrF1qs7q9gFciadJpe+YiJttgYhjPqCxSxZctq0t9A78IWJ6Pl/Rt6ejxdnPGsxGIaby+UzF
	CbJcSeVK3gxa1mFS1ntZGpp51S6CTTHCHtW9WSYX67Nw5JerA/2aq4AwuT6mciIK8uEmC0XmV8A
	CyHUqgVafsi87798kGn8FX9McLDutIShP/33vogUsqsPQJTgedTwJi1xsupoXzzmx9Utj4CLYzp
	rAw==
X-Received: by 2002:a17:907:948f:b0:c26:1649:47ac with SMTP id
 a640c23a62f3a-c2616495609mr192663366b.34.1788537413448; Fri, 04 Sep 2026
 08:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seoah Myeong <astronaut0703@gmail.com>
Date: Sat, 5 Sep 2026 00:56:39 +0900
X-Gm-Features: AcwNN1UK5NEJ2Bk7eXRI025K1HeH0ArV26fhN0qT1HlgaHgmJIXCpvTGpe9309w
Message-ID: <CAPWDnYo=LUD8oC_wCaFZ=PXwHMpKFW3SzV1+peoYnz5sJMjLQQ@mail.gmail.com>
Subject: [BUG] net/scm: scm_pidfd_recv() reports pidfd_prepare() failure to
 userspace as a file descriptor
To: kuniyu@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, willemb@google.com, 
	davem@davemloft.net, kuba@kernel.org, horms@kernel.org, 
	alexander@mihalicyn.com, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

scm_pidfd_recv() does not check the return value of pidfd_prepare().
When pidfd_prepare() fails, its negative errno is passed to put_cmsg()
and delivered to userspace in the SCM_PIDFD control message, in the
field that is specified to hold a file descriptor.  No flag is set to
tell the receiver that anything went wrong.

Affected trees
==============

  mainline (421066905cbc)  net/core/scm.c:489, call at :510
  v7.2-rc5                 net/core/scm.c:465, call at :486
  v6.12.107 (LTS)          include/net/scm.h:136, call at :157

The code is identical in all three; only the location differs, because
38b95d588f8f moved the function out of the header after v6.12.

Analysis
========

The current code in mainline (421066905cbc), net/core/scm.c:

  489  static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
  490  {
  491          struct file *pidfd_file = NULL;
  492          int len, pidfd;
  493
  494          /* put_cmsg() doesn't return an error if CMSG is truncated,
  495           * that's why we need to opencode these checks here.
  496           */
  497          if (msg->msg_flags & MSG_CMSG_COMPAT)
  498                  len = sizeof(struct compat_cmsghdr) + sizeof(int);
  499          else
  500                  len = sizeof(struct cmsghdr) + sizeof(int);
  501
  502          if (msg->msg_controllen < len) {
  503                  msg->msg_flags |= MSG_CTRUNC;
  504                  return;
  505          }
  506
  507          if (!scm->pid)
  508                  return;
  509
  510          pidfd = pidfd_prepare(scm->pid, PIDFD_STALE, &pidfd_file);
  511
  512          if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
  513                  if (pidfd_file) {
  514                          put_unused_fd(pidfd);
  515                          fput(pidfd_file);
  516                  }
  517
  518                  return;
  519          }
  520
  521          if (pidfd_file)
  522                  fd_install(pidfd, pidfd_file);
  523  }

pidfd_prepare() returns a file descriptor on success or a negative
errno on failure.  At line 510 the return value is stored in pidfd, and
at line 512 it is copied into the cmsg without being checked.

On the failure path pidfd_file remains NULL, so the cleanup at 513-516
and the install at 521-522 are both skipped.  Nothing is leaked and no
descriptor is installed; the only consequence is the value that reaches
userspace.

This looks like an oversight rather than intended behaviour:

  - The comment at 494-496 shows the function deliberately opencodes
    error checks that put_cmsg() cannot report, so error reporting in
    this function was considered.

  - The function has already been fixed twice for error-path problems:
    603fc57ab70c ("af_unix: Skip SCM_PIDFD if scm->pid is NULL.") and
    718e6b51298e ("af_unix: Fix msg_controllen test in scm_pidfd_recv()
    for MSG_CMSG_COMPAT.").

  - c679d17d3f2d ("af_unix: enable handing out pidfds for reaped tasks
    in SCM_PIDFD") modified this very call, changing the flags argument
    from 0 to PIDFD_STALE, without adding a check.

Reproduction
============

The attached program creates an AF_UNIX SOCK_STREAM socket pair with
SO_PASSPIDFD enabled on the receiver, lowers RLIMIT_NOFILE so that
pidfd_prepare() fails with -EMFILE, and then calls recvmsg().

  $ ./poc
  pidfd_val = -24        (-EMFILE)
  close(-24)  -> EBADF
  fstat(-24)  -> EBADF
  msg_flags: MSG_CTRUNC not set

3000 of 3000 iterations reproduce this as an unprivileged user
(uid 65534, CapEff = CapPrm = 0).  A root control run reproduces
500 of 500 identically, so this does not depend on privilege.

Testing was done on v6.12.107, where the code is in include/net/scm.h.
I have not run the reproducer on mainline, but the code path is
character-for-character the same apart from the PIDFD_STALE flag.

Observed vs expected
====================

Observed: the SCM_PIDFD cmsg carries a negative errno in the int field
that is specified to carry a file descriptor, with no MSG_CTRUNC or
other indication of failure.

Expected: either the cmsg is not emitted, or the failure is signalled
in a way the receiver can detect.

Impact
======

This is a correctness bug, not a security issue.  To be explicit about
what I checked and did not find:

  - No file descriptor or struct file leak.  pidfd_file stays NULL on
    the failure path, and /proc/sys/fs/file-nr went from 384 to 352
    across the run, i.e. it decreased.

  - No memory corruption.  The run was performed with KASAN and lockdep
    enabled, and neither reported anything.  lockdep was verified to be
    active throughout: its lock-class and dependency-chain counts
    increased during the run and the validator was never turned off.

  - No privilege boundary is crossed.

The practical effect is that a receiver which follows the SCM_PIDFD
contract will store or use a value that is not a descriptor.  In the
common case this surfaces later as an EBADF from an unrelated call
site, which is hard to attribute back to the recvmsg() that produced
it.

Fix direction
=============

I have not sent a patch because the right behaviour looks like a
maintainer decision.  Since 38b95d588f8f the function is a static void
in net/core/scm.c with a single caller in the same file, so changing
its signature to propagate an error is much more contained than it
would have been while it was a header inline.  But choosing between
suppressing the cmsg, setting MSG_CTRUNC, and reporting the error to
the caller has ABI implications for existing receivers, and that is
not my call.

I am happy to test any patch, and to send one myself if you tell me
which behaviour you prefer.

Environment
===========

  Kernel:   v6.12.107, x86_64, QEMU
  Config:   KASAN=y, PROVE_LOCKING=y, DEBUG_LIST=y
  Repro:    3000/3000 unprivileged, 500/500 as root

Reproducer
==========

[PASTE poc.c INLINE HERE]

Thanks,
Seoah Myeong
