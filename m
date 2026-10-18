Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78424AB1BC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333331; cv=none; b=igVNKm7t1ALHGkg9yXWJsD1pZOzRmTMT5oH+cZzJOcRSUotFGEZjQHyGul1WYfR5+jqIc9zirCxpJtMxuwTUo7KFSF4rzpnaFm/Fzwsl9K41fRa3HiWdb8GnM1iRpX2Qe0VPaTpGp6BjldjC1htXxokw1G8T91OoR1vnFMWeYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333331; c=relaxed/simple;
	bh=LjMXoezUDF/yb2bIlsKflM7rVcpM8+PuJScfVp3m1Bs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i6yxS7zANupjo9XzQcle6Wv7+DiYUpKXkN9154NbcqpJ1NiibFz4Ns8n+Nm7M5Z6Z8Zxx0D1ze4k+B39Hd8WdP8AHFwOjUh+QGBY8Daji6BF+yxHrpZcCpXsl7ME5K5jIZcjY+PzfIXMhu4WbvV5Dcd5Gqni2Lwxb6FpofQkE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1YuEqeK; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1YuEqeK"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8a83d2706fdso8314277b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333329; x=1792938129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8nQnAWl5gVJ2vAvs9R4XU9C2GQ8g7WYmvy6TT/ECoDA=;
        b=B1YuEqeKSa7Z16vieB31Pv+JiKrhOnv1gnCwk5OiiRLnx2hQE4jcyfaZN7dsw59OKb
         kr7TrhXxUz+iEwdtcM0spdhmDZ18f0IoRSOx3841tYPkTqvsXKi0KrPPfCeJ3UpSz871
         /oImLw9442WN2oJumVYtXxJrjIc5tELoUHbiWS+sbf7x0v1T6Lrs5kjvphoLV81X/D8s
         meiwQL9sytdP3K8i3PG3ib94281Gn3yNvjjNDGjweE2faq8TkUTGTi37znS0+I/u65KV
         Q3edA84I4QhPtAMEcdpnZAubaLQtYjiGS9ZX4NeE0c9VkTE+q+TK2qwuu+BUpGSl0Spt
         sS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333329; x=1792938129;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8nQnAWl5gVJ2vAvs9R4XU9C2GQ8g7WYmvy6TT/ECoDA=;
        b=v9kBjr1RTxQaRYzcQMc+Vuq3tJJ+NNc/873067g4poUacWhlAqhRMlx1rKxsA31CS9
         S3B/zlLu3OLnGZlJXjMMTBIrry9hKLHeUJNBEjEVI49ryjLLzmta2cquHNBCPUpEglNB
         Hja53L9gERqlNGoIp01E4oTgkfRI2Dp7WQUPj/dbc6Wtkycsy48dAnq7YBkh/rnqtYne
         wHf2bBg5T5vaygJ+992+CH0qH9eIxFAosXPFs0F5QeykFn7mvLyBKMHhMy/YqA3ImH5g
         Cd4vW5wrouR6ccI2hoEf/ChcUkRBJr559oVLBMWwhkMWgIkY5rDtjmhGcvri586V+4xw
         ahfg==
X-Forwarded-Encrypted: i=1; AKwUvBw7A25OFb+rKV9URPfepDQ8xvK1gDkQ8m3BklzWXS9Aiswi/T+U7m10rITreTIFWfhVN0CYJGDz0HmK5q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2hRULDAcOAQAlQ3bJkp2Kiq1a7iXowEVU+LD5G5UV4fnB9lBZ
	HtKhJvaUs8A0Bp26buNT4Z5+3aqlGd6aw8UJHNbGd6yvp+AhRDS7ak37
X-Gm-Gg: AYBFou0MY29dDmcCGDAJTu42xZdZpf2GrV0Oh4egZBzku8WmM3C50EDDx7oByzEARsG
	/bilYdUfVrsBIFVTtUZOz39pVIaiAT/JL/8am5yqupJ6uteIy0DreM5kgnoQBtPVz+VYjkNG39O
	ql1H8HAd+ldqyTBJS7hxVjj52dPOgU11capH7Ruf9V/b7dX0gUOyeqXbV4uxyoPIhZSeYDxO5sm
	K0EIaN4zL6QTqXrmJs+eN9wwxSjrCyMaQPXw5qcmOwY5znvX610cuOmCg2gJcgYYAVBqeDBed9B
	QMmE2YuZhYVMO+ZOI3LSLEX+9wb6pczdOTF3fSrFyAQVFn806o73EzW2lK3uH6zuN7mJ8oSg7CH
	OUHmdu6ryiSH0e1hchIpDjn0d+NkimPHF36hehG6SEGJd1RkZCkPfkxa5UdBWFF3g4EICp9uku6
	c1/10qrdO2WHOsOHQMN4zwMnrZejfbXPOo3Nnwupl06PqrPddSVEb3I0V+4jhDtZ1a2TMpA7vaq
	No2penU9G2GMpgtNVH+e9UQcLxNKvrfUJg5nbjudx7XZV+5pboDdTYsbZAKsdfwvaMs2O/F9D+2
	ykin7jmHbhio7VzdmFlKifWawlH8D05r0CPZGdjrKioY9FDTT0gi2egae4g1ZCZ9MGSvqMWnYmq
	pjtVJPEydKw==
X-Received: by 2002:a05:690c:6603:b0:8b0:f1c0:60b1 with SMTP id 00721157ae682-8b0f21b03bcmr16727947b3.60.1792333329438;
        Sun, 18 Oct 2026 07:22:09 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e79bcesm3061221d50.12.2026.10.18.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:22:08 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v3 0/5] alpha: perf register sampling and user stack dumps
Date: Sun, 18 Oct 2026 10:22:00 -0400
Message-Id: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQrCMBCG4auUrB1JJm2irryHuBjitA30j0SCU
 np30+Kiiy7fD+aZWUQOnqO4FbMInHz045BDnwrhWhoaBv/KLVCiUVIqoG5qCSYONQRuIiQNllF
 X8uKUIxT5cApc+8+GPp65Wx/fY/huP5Ja1z+nDrmkQAITGaxIX63Ce9OT785u7MXKJdwT5pDAT
 ChrqtKWiGhoTyzL8gNcgVp+9wAAAA==
X-Change-ID: 20261001-alpha-perf-regs-v3-7e23508c1ca2
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3469; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=LjMXoezUDF/yb2bIlsKflM7rVcpM8+PuJScfVp3m1Bs=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKuXOO4+uKjX2/LvHz59lZpzfW5RWYVsZnF1z3WCvlun
 XqvWqWx4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK4Rm8HI0OzZb1O4Y+
 +sV38f96/n8j++afv8tF6xVWcM2BjLlBVZ7BgZdpVnrWF+6vpaN6JIYke8kEH5/wuiZuzCVj8ZK
 /5+93ZnBQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

This lets perf sample registers and dump the user stack on alpha, which
perf record --call-graph dwarf needs to unwind user space.

r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
therefore cannot get past a first frame that uses $15 as its frame
pointer (-O0 code or alloca).

The perf tool side is a separate patch for perf-tools-next:

  https://lore.kernel.org/r/20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com

libdw also needs alpha unwinding support, which I sent to
elfutils-devel:

  https://inbox.sourceware.org/elfutils-devel/20261012-alpha-v1-0-46760216dfb7@gmail.com/

---
Changes in v3:
- Patch 4: rename the uapi <asm/perf_regs.h> include guard from
  _UAPI_ASM_ALPHA_PERF_REGS_H to _ASM_ALPHA_PERF_REGS_H, matching
  x86, arm64 and most other architectures. headers_install strips
  the _UAPI prefix, so installed headers were fine, but code built
  against the uapi directory in the kernel tree saw a different
  guard. elfutils tests for _ASM_ALPHA_PERF_REGS_H, and without the
  rename it disabled alpha perf sample unwinding in that case
  (Magnus).
- Patch 5: make alpha_ftrace_return_address0() available without
  CONFIG_FRAME_POINTER. CALLER_ADDR0 was 0 in that configuration, so
  software event samples still reported pc as 0 (Magnus).
- Collect trailers.
- Link to v2: https://lore.kernel.org/r/20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com

Changes in v2:
- Patch 4: report sp as 0 for software event samples, whose pt_regs is
  a per-CPU buffer rather than a trap frame (Magnus).
- New patch 5: fill in pc for those samples via
  perf_arch_fetch_caller_regs() (Magnus).
- Collect trailers. Magnus's Tested-by on patch 4 dropped until he
  retests the change.
- Link the perf and elfutils postings.
- Link to v1: https://lore.kernel.org/r/20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com

---
Matt Turner (5):
      alpha: fix stale user_stack_pointer()
      alpha: stop storing the user stack pointer in pt_regs
      alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
      alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
      alpha: fill in pc for software event samples

 .../features/perf/perf-regs/arch-support.txt       |  2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
 arch/alpha/Kconfig                                 |  2 +
 arch/alpha/include/asm/ftrace.h                    |  5 +-
 arch/alpha/include/asm/perf_event.h                |  7 +++
 arch/alpha/include/asm/processor.h                 |  3 +-
 arch/alpha/include/asm/ptrace.h                    |  7 +--
 arch/alpha/include/uapi/asm/perf_regs.h            | 45 +++++++++++++++
 arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
 arch/alpha/kernel/Makefile                         |  1 +
 arch/alpha/kernel/asm-offsets.c                    |  1 -
 arch/alpha/kernel/entry.S                          |  5 --
 arch/alpha/kernel/perf_regs.c                      | 64 ++++++++++++++++++++++
 arch/alpha/kernel/process.c                        |  2 +-
 arch/alpha/kernel/ptrace.c                         | 12 ++++
 arch/alpha/kernel/traps.c                          |  8 ---
 16 files changed, 139 insertions(+), 29 deletions(-)
---
base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

