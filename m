Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94A3C8C48
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538676; cv=pass; b=mvwfM/2Q+MjvaXMeng8NdlkqYJLbS3cQYUaaB7HW/OrvKiDRtVY8/MB2JLIVAs8UhEsYFtmBNRxgkSA+I3ZbEs0B6c8aRGMLEDplwJGbjD7/VB7dUyp0YXDvzqdAKEN0Ug4r4j3Ebyr3wWmSN99pCvCIdhZwNyqdFHgCmTKywfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538676; c=relaxed/simple;
	bh=XDhlCCCy4S753j8wU+gcZX4rG1ci9fwEgIlB7NEoF9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcsTzbQ/BQCCo8AWcaW7QmdwgLcKXBUSxjFlmp4dl7JvmQ5EPA8ugZqJ3qRAcRuwXWjv5AMPTGj9knOKwU+5J381yq6Zft1fuJWFSTJhXdt5xfopvJ3x2NbvihdTCYViJqh7MNuNu6HzBDpbC/akQ947F5+OcKRIaW3qPyTPuWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=N0Q0nkNL; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="N0Q0nkNL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1555250a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788538673; cv=none;
        d=google.com; s=arc-20260327;
        b=X64V5JaYKslWaj1eSKh5awGLij00x33EXXR6Y1s+ZR/UWjY01gKOIdjV82nx3ir71d
         ryxWlLSQCLEQvb0x00Skf2vwKwS9tF86CoKPXgwBUKJkOhtjhKhkyF9ffgKl3XQUg2rE
         KAoTtEcddmc81ZMBMNpAd9DDQcULWBPdviyveILo9i3FzHBspsrfvQCvXLCBopnbvb2g
         ncadeNnzLu4slQ0fyJru+W44WuSQBlDE3WnAWLdV2BqbGJVg4u7+xjjmOw7nHMfdInnx
         G/pGh2+GiglUmYfEznwM+md/TZJaQ4eJab1TWiUpOXz8RJ4ZqXwYQZGjcZhz2R3eos+y
         2EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4hR0nqhvj3B1Hd4PIemXkyI2iIG9pnBdbtv9TVtz3qk=;
        fh=IS9NRYuDUcUtvk7c2ngS1IR5zzJFN5FerqyoViL0T+E=;
        b=PWNGpMs02RMR2vh44dd08NzmQYUH0bYdpgk7+Ls5iiU3gxZMo9khf8xdm7gy+syCWp
         DF0uhzCyil6FGdFJxnJ99IAdtbUa7QcNL7FE3W2kwrKLBsMSZs6Hbnnimbcf+rkfGMSQ
         auuPybk3BTAl9Xp75H0o2/v0RNw/qC4fzW8pLzuYkOSdn3/DWGSgy+1SczhzYllHyDD4
         3yR1MOc/oJVu9kbs4IoWPv1v46cvbZsNR+bP+Pg3jP2PKx8kqwAsxHsUHq91EAhLF64t
         JfGoEudPDiweOO58Nj4e8yS4tKLKu21NGIqUO3UKrY5EDAdjwymB5KNGze+VqZvrKQRs
         /T3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788538673; x=1789143473; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hR0nqhvj3B1Hd4PIemXkyI2iIG9pnBdbtv9TVtz3qk=;
        b=N0Q0nkNLmiyVSeeOV7cOZrwboMq08UdLFydts4djIMauhZ/ldnYhhuHq3C3KGNY07v
         eGCEnYbndX3XHcJnOV5jHyXwuT5xCJnloGRwF/+KA6c81jYQOuS/bv6OAWZEqyVE20fP
         Au5jnpYB5h7N2xd1bwW7S5K69SRyCFoyuBGRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538673; x=1789143473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4hR0nqhvj3B1Hd4PIemXkyI2iIG9pnBdbtv9TVtz3qk=;
        b=YBlFLxs+wqX41qv+Y/H9pMEMghp9EzBgwYINXXtllcWI2vOaGc4W40noJn7dpkfzI1
         BfQnK/7i+1Jl4TaJM3Zaiga+NKLj/lgXbQJjxm37FZoa3+qj/1M35dpu7udMD4RTKm1J
         oFAgZXMovDbX2qRZV+jnoQBktqBqpiFTWZqQY4EAZ3WrPunuFgcy1bRl0duhIlUTeX0k
         44ag19j28++2sXkeiL2o7U/YxJMnEvbkeEtJo0d0aflHGq/ZHXHLqyF6uwMFZqXMfgtN
         Pv6ynGFTu40lb8nnIV/jtEuCVWAXGrpTuXeNTLOf8Jd5r6QKdfArzpVORawFNrklgmXa
         Dttg==
X-Forwarded-Encrypted: i=1; AKwUvBwyGSKyVf311n0cBNtvvaCC74vMBsh2QGJu/VJMmXZX0mItPE+r7uJk7dpg86jMwlhzVb+qxE7G/ufx8FM=@vger.kernel.org
X-Gm-Message-State: AFuF++lvym/9UXoLEN/kG6r0UGSDC/h7Z52dLP/Yh4adfi5Vy+uGAHav
	oKNRCM1DoW9afH7MOH88YKKEU40oid6WN86nuFwk71x/nn8h9vQK4NK2ec2qRehITgXyi/mgA4g
	+ICrXaINEvJynNEqpcgPq4dRV2mQ42pJFDjNAIwantQ==
X-Gm-Gg: AYBFou0bph1Lik0kqdE9Xg/lbbTbIvph50lnPGakiCYIdv4lYKZzgyW1SyoaegTB/6f
	ARvsXqfoTSL1Ni4x7ULPp6ucdtAnY8MQ6O8JzsuzVd1D6UUJd1193Y2oyNxZ5nBjR1L04H9OKta
	BQ1dn3JxaxM5FWZ9jHo/vHa3xzLS1z4QXzcolKj2h7Xkf8vLEXlgP4UubZuB5IEJX5hk+7GW6Zm
	1RuVTKT9fVdci5CbYaANXL3mWAjg6NbxfpdI7Nu0Tj8uzQF0k4Hw8RhmwXkHfxTSQvJeAcwcHmO
	VcHkIZKGJcgCHNVwhiZG+8iwiOwMoEB3HWJAEqd0J0i9Ry0LiprBC2kMKn6JM9cKIy0+kJmfB0/
	d
X-Received: by 2002:a17:906:2091:b0:c26:19de:913b with SMTP id
 a640c23a62f3a-c2619dea026mr128536166b.46.1788538672347; Fri, 04 Sep 2026
 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPWDnYo=LUD8oC_wCaFZ=PXwHMpKFW3SzV1+peoYnz5sJMjLQQ@mail.gmail.com>
In-Reply-To: <CAPWDnYo=LUD8oC_wCaFZ=PXwHMpKFW3SzV1+peoYnz5sJMjLQQ@mail.gmail.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Fri, 4 Sep 2026 18:17:40 +0200
X-Gm-Features: AcwNN1X73QhZw0vysx2qp4wGUjcGa4bRsSl3isSoNkb2VxqUWpuvb1fgTYXqDyg
Message-ID: <CAJqdLrrfx8b71rnmjS+1GvvUOd9EpFZ=+oKB-ttqsttY0dKsUw@mail.gmail.com>
Subject: Re: [BUG] net/scm: scm_pidfd_recv() reports pidfd_prepare() failure
 to userspace as a file descriptor
To: Seoah Myeong <astronaut0703@gmail.com>
Cc: kuniyu@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, willemb@google.com, 
	davem@davemloft.net, kuba@kernel.org, horms@kernel.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Fr., 4. Sept. 2026 um 17:56 Uhr schrieb Seoah Myeong
<astronaut0703@gmail.com>:
>
> Hi,

Hi Seoah,

>
> scm_pidfd_recv() does not check the return value of pidfd_prepare().
> When pidfd_prepare() fails, its negative errno is passed to put_cmsg()
> and delivered to userspace in the SCM_PIDFD control message, in the
> field that is specified to hold a file descriptor.  No flag is set to
> tell the receiver that anything went wrong.

no, this is not oversight. We are very limited on our ways to report an error
when user-space received socket control messages. One of the ways
could be fail recvmsg() completely, but
there might be more than SCM. In some special cases we raise flags
like MSG_CTRUNC.
In case of SCM_PIDFD we decided to return errno as pidfd and userspace
*must* check for this (see for example [1]).

Link: https://github.com/systemd/systemd/blob/0b5c330d156e91c21d68f246f92790bf212cbd98/src/shared/notify-recv.c#L156
[1]

P.S. Is this LLM generated stuff?

Kind regards,
Alex

>
> Affected trees
> ==============
>
>   mainline (421066905cbc)  net/core/scm.c:489, call at :510
>   v7.2-rc5                 net/core/scm.c:465, call at :486
>   v6.12.107 (LTS)          include/net/scm.h:136, call at :157
>
> The code is identical in all three; only the location differs, because
> 38b95d588f8f moved the function out of the header after v6.12.
>
> Analysis
> ========
>
> The current code in mainline (421066905cbc), net/core/scm.c:
>
>   489  static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
>   490  {
>   491          struct file *pidfd_file = NULL;
>   492          int len, pidfd;
>   493
>   494          /* put_cmsg() doesn't return an error if CMSG is truncated,
>   495           * that's why we need to opencode these checks here.
>   496           */
>   497          if (msg->msg_flags & MSG_CMSG_COMPAT)
>   498                  len = sizeof(struct compat_cmsghdr) + sizeof(int);
>   499          else
>   500                  len = sizeof(struct cmsghdr) + sizeof(int);
>   501
>   502          if (msg->msg_controllen < len) {
>   503                  msg->msg_flags |= MSG_CTRUNC;
>   504                  return;
>   505          }
>   506
>   507          if (!scm->pid)
>   508                  return;
>   509
>   510          pidfd = pidfd_prepare(scm->pid, PIDFD_STALE, &pidfd_file);
>   511
>   512          if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
>   513                  if (pidfd_file) {
>   514                          put_unused_fd(pidfd);
>   515                          fput(pidfd_file);
>   516                  }
>   517
>   518                  return;
>   519          }
>   520
>   521          if (pidfd_file)
>   522                  fd_install(pidfd, pidfd_file);
>   523  }
>
> pidfd_prepare() returns a file descriptor on success or a negative
> errno on failure.  At line 510 the return value is stored in pidfd, and
> at line 512 it is copied into the cmsg without being checked.
>
> On the failure path pidfd_file remains NULL, so the cleanup at 513-516
> and the install at 521-522 are both skipped.  Nothing is leaked and no
> descriptor is installed; the only consequence is the value that reaches
> userspace.
>
> This looks like an oversight rather than intended behaviour:
>
>   - The comment at 494-496 shows the function deliberately opencodes
>     error checks that put_cmsg() cannot report, so error reporting in
>     this function was considered.
>
>   - The function has already been fixed twice for error-path problems:
>     603fc57ab70c ("af_unix: Skip SCM_PIDFD if scm->pid is NULL.") and
>     718e6b51298e ("af_unix: Fix msg_controllen test in scm_pidfd_recv()
>     for MSG_CMSG_COMPAT.").
>
>   - c679d17d3f2d ("af_unix: enable handing out pidfds for reaped tasks
>     in SCM_PIDFD") modified this very call, changing the flags argument
>     from 0 to PIDFD_STALE, without adding a check.
>
> Reproduction
> ============
>
> The attached program creates an AF_UNIX SOCK_STREAM socket pair with
> SO_PASSPIDFD enabled on the receiver, lowers RLIMIT_NOFILE so that
> pidfd_prepare() fails with -EMFILE, and then calls recvmsg().
>
>   $ ./poc
>   pidfd_val = -24        (-EMFILE)
>   close(-24)  -> EBADF
>   fstat(-24)  -> EBADF
>   msg_flags: MSG_CTRUNC not set
>
> 3000 of 3000 iterations reproduce this as an unprivileged user
> (uid 65534, CapEff = CapPrm = 0).  A root control run reproduces
> 500 of 500 identically, so this does not depend on privilege.
>
> Testing was done on v6.12.107, where the code is in include/net/scm.h.
> I have not run the reproducer on mainline, but the code path is
> character-for-character the same apart from the PIDFD_STALE flag.
>
> Observed vs expected
> ====================
>
> Observed: the SCM_PIDFD cmsg carries a negative errno in the int field
> that is specified to carry a file descriptor, with no MSG_CTRUNC or
> other indication of failure.
>
> Expected: either the cmsg is not emitted, or the failure is signalled
> in a way the receiver can detect.
>
> Impact
> ======
>
> This is a correctness bug, not a security issue.  To be explicit about
> what I checked and did not find:
>
>   - No file descriptor or struct file leak.  pidfd_file stays NULL on
>     the failure path, and /proc/sys/fs/file-nr went from 384 to 352
>     across the run, i.e. it decreased.
>
>   - No memory corruption.  The run was performed with KASAN and lockdep
>     enabled, and neither reported anything.  lockdep was verified to be
>     active throughout: its lock-class and dependency-chain counts
>     increased during the run and the validator was never turned off.
>
>   - No privilege boundary is crossed.
>
> The practical effect is that a receiver which follows the SCM_PIDFD
> contract will store or use a value that is not a descriptor.  In the
> common case this surfaces later as an EBADF from an unrelated call
> site, which is hard to attribute back to the recvmsg() that produced
> it.
>
> Fix direction
> =============
>
> I have not sent a patch because the right behaviour looks like a
> maintainer decision.  Since 38b95d588f8f the function is a static void
> in net/core/scm.c with a single caller in the same file, so changing
> its signature to propagate an error is much more contained than it
> would have been while it was a header inline.  But choosing between
> suppressing the cmsg, setting MSG_CTRUNC, and reporting the error to
> the caller has ABI implications for existing receivers, and that is
> not my call.
>
> I am happy to test any patch, and to send one myself if you tell me
> which behaviour you prefer.
>
> Environment
> ===========
>
>   Kernel:   v6.12.107, x86_64, QEMU
>   Config:   KASAN=y, PROVE_LOCKING=y, DEBUG_LIST=y
>   Repro:    3000/3000 unprivileged, 500/500 as root
>
> Reproducer
> ==========
>
> [PASTE poc.c INLINE HERE]
>
> Thanks,
> Seoah Myeong
