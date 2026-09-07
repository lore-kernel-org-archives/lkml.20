Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0468470446
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791591; cv=pass; b=ibW3Tvac8yJIn4FicaytehMnICXKzwwkfATViMRgu4WIXlC+xblcfhfICv6WppFnbn0eT/kNCdM2bJkTjHbxmNtqGgAZxHSmodNLT6+amKpSfBG88QQNt7U+we/9q+mob1XsR1wWCQ1TpD6u8v2lzCsDwnoUXn7KaBR5QGxRBV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791591; c=relaxed/simple;
	bh=2nEvFBMdhJgSNJqGqxUejTWHPfeJ3XTzfHyWg5nP0Y0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TS68eMm2Whay/xjcW4zfrGyWY7HgjWL7pVU9sx0lJKDd5sGz96UP5R7OdeIWD7uNk06pkndaFqBd+N6IRE7rqleCngZ0PgAvFRAZpPX+FO+BPs7oafJlGD8Y3Kpk3CZ+w2C+VA4eX0F8f8WJGI+gst4qoCH9QVs0kVL4ParL68g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQzxhSrd; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQzxhSrd"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b12ada8befso2045116eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788791586; cv=none;
        d=google.com; s=arc-20260327;
        b=StOmYaJflYkAW/uVXN4w9jwinoIxotN9kxDpIR2znzgS3SOJ0ZypV6+wpfCGKIw+lj
         VTI+h5O1A+3oHuIfDS73iAEFp2VmbfnVpuufx3FgyRiOvVKPTJi9ecT8Y8anFVpXDXEg
         nWjEbvx/uDFN/FWKynnLGTAkmsTdInOeSvbasHcSmAtxNaio5RbfFeg+sJokcjU7XOA/
         kexJD2ruo0uesspiNXAvO+L3zcAYqdflVK6huew4nT+g/gtjmt5WVve7WQFl9qTGRiLH
         g5nd1lsgTi6IjIa4FLRz3J8TAGJ9jtXUUGFWLK16x/J/xJ6fl7lRLeGHDgfuHICpW8Wy
         ct7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=aw/I14PjLqxMlfwn9Wc8/sLmMP8s19e2n/OZfMgOjdY=;
        fh=oj5AYgE8uZ8J8G7ewMpveKEOqMaabZhwCiKI33pMEyo=;
        b=mtfygs5WpjFMr6PsDlT/Qo1EwZb7gL+Ln3yDH/DCQZ9TOzgW4moKV17gRxQxjWP6H5
         N4fZqC5CpydqQ/EhLdVWu4yQo3YhUHsP43QOW6crMBhptd7r5ERCQAxnwAlfd+ORlLzW
         /eAGB1jSezbyZjOtmFp6RlJN3dz8W1kIWXdrEV43Z1A/XwlhO9a9lgQuvpjP9scfl658
         R/ZPxN+/QpkdkQm1+unzrHWmHR6QIki+HrBx9utIC81vO0dkAo8uUehlKqPw9Z6Zi3kC
         dePvJmg9kOOnxz7TFbNUyaeiMU7oHXdkLnviurAAmj/a6mEXKiGDl3FPzNwpGUFY5FOD
         bfjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788791586; x=1789396386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aw/I14PjLqxMlfwn9Wc8/sLmMP8s19e2n/OZfMgOjdY=;
        b=MQzxhSrdsUS/on+BfmujaNz2+h+9M1stiq3y3fYgnShoFsHHwlaGk4gI8nQpUz6SJN
         5JDv9XTj+YTUGZ3OiM2CuEaxwQgADoIkL+tuQP9mpo+ZGvaaldYC1j0mg8KuNnCJzoQU
         HkVip2Z9ZowMZTbv3oNzAbG5NpvSGj9fM+QeQQaeEXC6/Qw3IPj3wWJjm3F5eqIMqCQn
         0MAuMGmAYwEPrTPskorKFtVToZ8LDVPXtO2gUfQSz1FnT1Vw7oFBqIglIyw01aTPCxLa
         jYB6nNPXsT9Q2K+sX4tAbKSmcRT2+QVgWGUvfkxYXkOx2T9ISOA60ElsK06xjRx4ejRL
         vhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791586; x=1789396386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aw/I14PjLqxMlfwn9Wc8/sLmMP8s19e2n/OZfMgOjdY=;
        b=P4QNw0vMd2Wowwgp8IfjT85P3RP0yP9FWBWoUPu8O5xWXpKGx5WqDfAkYCF1W0iV1L
         h2pRGXnYuHXN26Z8RaL+GI0h7NcXevnC2K7MtTMI/+KoAMTLViIAy38vY8A6Jmwnx+KE
         H8p8Xgxp76pPfo7r4w3L8fI2VZviRvMEG2fBKF4kkQwyxTMxnXC/UkVKSAyV3qumfFvg
         pVO2YpNOw9FuKcRu4hNELGPcjuNtoSo6TajVfsmd9v8I6FRJEzcnl7H1vV8zDrnCWAcU
         L8RUepue4kdcBWeEV2sqdbmuPAhCLQSTYmw0rUuVn9dEwnRY50U9qi7XCouh0MMB9RtC
         5TmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZHLXPvG4QmyuGRXZ48oRAeIylRcy7PNJiHLhtJrT6/W1L2Jae9sulbT5b+QLqpnnB84qbMyd1rcVH/CU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqONxoaBDRe+TKY2Qn16N/4DfXabGCgzSZiLoihZc8vYW2jFNJ
	w5Athqh34WIKX9/bKIGqgjXprYLEGfLKRmRp+q1ZCueOQ/HYzK6B03RSlfoT7j6pGkgaBacaXZM
	VYSxfbhxWxR0+Szq4Pugqx86WZIeEz2I=
X-Gm-Gg: AYBFou1aQuacHwT19yLjAfmnqYPEatlKi6A3BpmgIZ2UCX1cPiAL7vleCUmADf7OqT6
	g4YjpV2teUCViutftDKyy5Bdkt+ifTbStsFuVJJk6SFCW6MYRsib6ShLciJM/bnZIdgiDWNrqWb
	57Qe8Qd95/EjnqfwX3zMaWB36fokVuo8IjPU0p6wT1t1g2ygdLKRJCcyZnAwIKzAfUcTCz6UnHw
	tcsdGg4AWlqtZlUePahvgHj6NCnIm5ExxeK4/ZAvjOaiIzqyQLuqpXyr2Ju024HD+e5Zf6+9WcC
	8Cj5rc1Sv+n8imGtYYemY44PEdTBIsMFUrauwOEB8CkZ
X-Received: by 2002:a05:6820:290b:b0:6b1:39b1:80ee with SMTP id
 006d021491bc7-6b6fe796fd6mr21967862eaf.24.1788791586103; Mon, 07 Sep 2026
 07:33:06 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Mon, 7 Sep 2026 07:33:05 -0700
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Mon, 7 Sep 2026 07:33:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: jihoon kim <kigihi85@gmail.com>
Date: Mon, 7 Sep 2026 07:33:05 -0700
X-Gm-Features: AcwNN1W84ahu04IwVUw6e0PdRBAHXJrOP3ZWHAeZnJqQKWjnIEyuihUuQY5OljQ
Message-ID: <CAAyWcRWWULkDa9L+Qgxt8c_mAbdYAU4uUA+51HhEKKDao-1KMg@mail.gmail.com>
Subject: [BUG] WARNING in perf_pending_task() outside do_exit() path
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: mark.rutland@arm.com, jolsa@kernel.org, irogers@google.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

While fuzz testing mainline (syzkaller, arm64, local build) I hit the
following WARNING repeatedly and reliably:

------------[ cut here ]------------
WARNING: kernel/events/core.c:7629 at perf_pending_task+0x268/0x2a4,
CPU#1: syz.1.79/2934
Modules linked in:
CPU: 1 UID: 0 PID: 2934 Comm: syz.1.79 Tainted: G        W
7.2.0 #1 PREEMPT
Tainted: [W]=3DWARN
Hardware name: linux,dummy-virt (DT)
Call trace:
 perf_pending_task+0x268/0x2a4 (P)
 task_work_run+0x124/0x1ec
 exit_to_user_mode_loop+0x1f4/0x210
 el0_svc+0x1e0/0x270
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
---[ end trace 0000000000000000 ]---

This is the WARN_ON_ONCE in perf_sigtrap() (inlined into
perf_pending_task()):

    static void perf_sigtrap(struct perf_event *event)
    {
        if (current->flags & PF_EXITING)
            return;

        if (WARN_ON_ONCE(event->ctx->task !=3D current))
            return;
        ...
    }

Why I think this is worth a separate look
------------------------------------------
This exact function has a history of related issues:

- CVE-2022-48950: a use-after-free in perf_pending_task() (fixed by
  extending the perf_event's refcount across the queued task_work,
  commit 8bffa95ac19ff27c8261904f89d36c7fcf215d59). That fix
  (put_event(event) at the end of perf_pending_task()) is present in
  the tree I'm testing, so this is not that bug.

- commit 3da6bb419750 ("perf/core: Fix WARN in perf_sigtrap()"),
  2025-09-04, fixed a WARN at this same line, but for a call path that
  goes through do_exit()/do_group_exit()/get_signal() while the task is
  actively exiting (ctx->task pinned to TASK_TOMBSTONE).

My reproduction's call trace has no do_exit()/get_signal() anywhere =E2=80=
=94
it's a completely ordinary syscall-return path (task_work_run ->
exit_to_user_mode_loop). So the task is not exiting, and the 2025-09-04
fix's precondition doesn't appear to apply here. I have not been able
to pin down exactly how event->ctx->task and current diverge outside
that exit path =E2=80=94 reporting in case this rings a bell for people who
know this code better than I do.

Severity / impact
------------------
I don't believe this indicates memory corruption:
- The WARN_ON_ONCE only compares pointer values; nothing is
  dereferenced before or after the check on the taken branch.
- This build has CONFIG_KASAN=3Dy; no KASAN report accompanies the WARN.
- I also built a variant with CONFIG_KCSAN=3Dy (KASAN and KCSAN can't be
  enabled together in this tree) and reproduced the same WARN several
  times; KCSAN did not report any data race.

So this looks like a WARN-only assertion violation (no observed
memory-safety impact), but given the recurring history of races in
this exact function, it seemed worth flagging rather than silently
working around it.

Reproducer
----------
Minimized by syzkaller to two syscalls:

    perf_event_open(&(0x7f0000000000)=3D{0x2, 0x80, 0x77, 0x0, 0x0, 0x0,
0x0, 0x9c29, 0x147cb, 0x8, 0x0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x1,
0x1, 0x1, 0x1, 0x1, 0x0, 0x0, 0x0, 0x2, 0x1, 0x0, 0x0, 0x1, 0x1, 0x1,
0x0, 0x0, 0x0, 0x1, 0x1, 0x1, 0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x1, 0x1,
0x1, 0x0, 0xb, 0x4, @perf_config_ext=3D{0xfffffffffffffbff, 0x100},
0xa1, 0x3, 0x4, 0x6, 0x7, 0x8, 0xfcbe, 0x0, 0x0, 0x0, 0x2}, 0x0,
0xffffffffffffffff, 0xffffffffffffffff, 0x2)
    io_uring_setup(0x25fa, &(0x7f0000000180)=3D{0x0, 0x6bc, 0x2, 0x0, 0xaa}=
)

A standalone C reproducer (autogenerated by syzkaller) is attached
[repro_perf_pending_task.c]. It reproduces reliably within ~20-40s of
boot under syzkaller's syz-repro tool; I have not yet reduced it to a
hand-written minimal C repro independent of the syzkaller harness.

Kernel: mainline, local build tagged 7.2.0-g26260251022f-dirty
Arch: arm64, QEMU/KVM(hvf) virt machine, 2 vCPU / 2GB RAM

Happy to provide the full syzkaller log, the C repro, or test patches.

Thanks,
Jihoon Kim (Harumomonabi) <kigihi85@gmail.com>
