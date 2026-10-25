Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897837;
	b=1T34D/npTfqLopeqmuazpVj9CLX8/qRsro7yV6VQeELL7c3keZfluZlKluTFo0ldtc/4
	 HRjjAWUqVjh4TK/exl3K3FbjlGMufTTPYBuUX45iHKU6/GdkmapBH7nmZIlIooTjX4tAP
	 hctgwjJt9B+lntSAMvTSw4TcNCmM/i5Cjh3+Dgo6LHTg2PJ6oPNTfWQImy0daYEQlRCqq
	 LKktLOLq2vJl1G54igw4HgTxybU6V9cGpsrMa21Piih8Frc6lhD8xYW4f6U3ea6B2GCsC
	 LB6PcWs1GmLc1Ee/Kp7gQETZ3n+9foiZcxMgF1gnW5PCGZRaFwvaNJUkBL9uYDp5GBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A4yUS1w9x24H83Ua2MT+lR8T1R7cz5WiLE5qjZdxJiE=;
	b=32fYVql1bGkVoFC1orufxU5PqjPQE0w7kvKFBZOuApo443N2C9J7B2M769Cq70ObKEG+
	 XQfvPPfXEym7AgmfOMkq0F7CpZ/duwsCluGOnVQMaHaCQDDcG00qyBfeGcvwUNrT9iJKG
	 HMmmTp8s9Bgj9CQxOPHb5NYKRDOZZX1sjK5YBW0qrtx0d5VD8ADyKh50qsTrQV5xHh+3D
	 aHW5nFBkIQned6PUo8IjpQZolfmwthL5VvQYbeJm06wMHlytkhUgsitodzZmPQuTXalDU
	 59XK4fBx/8vxP4Bw8217jNq195YMM74O+4WszT+zhJdinOnaZxYvPHv2hTTm+qbMmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yjn-systems.com;
	spf=none smtp.mailfrom=yjn-systems.com;
	dkim=pass header.d=yjn-systems.com header.i=@yjn-systems.com header.a=rsa-sha256 header.s=google header.b=bE6f4o2u;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5144E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5144E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yjn-systems.com header.i=@yjn-systems.com header.a=rsa-sha256 header.s=google header.b=bE6f4o2u
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso12635405e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yjn-systems.com; s=google; t=1792897835; x=1793502635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4yUS1w9x24H83Ua2MT+lR8T1R7cz5WiLE5qjZdxJiE=;
        b=bE6f4o2uSpFN/n+A5VuK0gePJ5hXAblkGZM7wfvadz2wwz6BW/HLSyDK2STnWAXB4O
         tw1o4MG9Cj6mYYVsH7xpsAvW71icBd3DqAdmzIPuZr7O/22dqwjzeOTTiNLwDwfcxipC
         ZEBQ+Lm0tIeQ1wzGkNWObVhL4Qici9jDNi/5ed4Y57EwouvI+2DsX8ZQAUgDbudZpRZv
         AgMl1ZxBrCH4rP1QteEJjmjD7mGC3+lIsJ4Sy0oCuV1sW8p3D6XJnBgROx2U5o8gae9y
         5PISqy6y8M7KHw44W6eSn46M+iUJGO++MMHVkVwMkTNtNQLUUrNep/c9cWA6LMd8JWRo
         5jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897835; x=1793502635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4yUS1w9x24H83Ua2MT+lR8T1R7cz5WiLE5qjZdxJiE=;
        b=X5BJRsG1vAv//FJn7yxoeksZuX8z+U54JA5nNn87ufqOHxGQrocGCTxA2/6qEB8pk8
         hXmfn3DjPhxLvOIueAR4dSVtnrCyyF4CYgLGWkrzMEcXa+SnFx34gyIxD/ayuis+8C3A
         gDZGYVJss7jVoKbxF+ibfgfZxu3uPtlRiH/TvgCcX4E4DWS3sRN+uN/w35AmL1paWhl/
         qY/1tPbJ40zRi6X0VRg7Wu/RahvJN9opf3rM0sj6e21bx2f926mGu+8nNHtkuNRz4ih1
         MEqIBlFF8kuVYqq26xi/9ZUilrgdNb2hdZa8+/qexLLpgoiDuWj/zdKKewTg2KbBOVtr
         H8fg==
X-Gm-Message-State: AFq9FYJth+ywamCP1f4YGLBw7xW4EotnvcbzFp370xr7AiF5Sc6UHImz
	8lSHOUaGaEAZ2YyGR06Xr/TPrJY8dPrARqs8H+TUhuLWvIO9gvR5eKVa7mrJPZBOKWXy
X-Gm-Gg: AYBFou02nAiPPmNlr5O6QMLd3WbYHUUIJezmIccS9S8pSt+PC6SNdWps9lstZg0JNrJ
	RJqdPUpY6PY6kx0a3ers4NR3kHYTQc+wyzGyUCk90nkjc5+QIPHDJB6n9iM1S7/7V0nz7zDsSRT
	TPJq7/3PKIpHfWEpccBHmPBBlP4GrdDuHAz6QjZCckmrQ5Qntsuv7HMd/Uyow5l9WNzH/+rNAcg
	tjs0N/Ygp5RCrQMI1Bwc0X7MVknlZZOh3hbxIdxoz+dlBAgT2m4Nrl6so/3pvw2YspK2IJizBXB
	EWTEq3/nDKnGrzPsf2OGNVO4eXYrrqPJ9UShBToRrMPCfzeaKInyZeKUCzDTUvhSa/I9vGwOcU5
	oM9LvE5Evf53wJcTwrDuZeLqLf+gOTrXIjuv4pB26Ru2GuVbKkphEZZ48j7HAeiazSkq568FkgU
	UmpSoWTWx+81KXZRZobyq1xa8P9HgbQKXb8L9kT+g/iSFZjlMOFmYyHbXQypNEVV0I5gcsbd4ps
	2RUj9Tm6O1DAvOQWIsF7a5ooyI9qX6pfNZqxRVSTHOfr52uUk2m75FLWAY8bbwB8UWBF3WlrTQu
	IBc7LWbtHbFo63EelhL8SoKra6oRmlPHndUwFrsC7CeoW9STS7n5notj+VWhPG33QKXO38xG114
	8pYG1PuglgI+NYAU=
X-Received: by 2002:a05:600c:4e44:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a35ac95a17mr51633855e9.13.1792897834468;
        Sat, 24 Oct 2026 20:10:34 -0700 (PDT)
Received: from yjn-Zenbook-UX3404VA-UX3404VA.. (p200300dcbf1819005b3565a866058f95.dip0.t-ipconnect.de. [2003:dc:bf18:1900:5b35:65a8:6605:8f95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm7314301f8f.23.2026.10.24.20.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:10:34 -0700 (PDT)
From: York Jasper Niebuhr <yjn@yjn-systems.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kees@kernel.org,
	gregkh@linuxfoundation.org,
	franzen@sec.in.tum.de,
	ardb@kernel.org,
	York Jasper Niebuhr <yjn@yjn-systems.com>
Subject: [RFC v4 0/3] Selfpatch-SLR: Randomizing Linux Kernel Structure Layouts at Boot
Date: Sun, 25 Oct 2026 04:10:11 +0100
Message-ID: <20261025031011.183364-1-yjn@yjn-systems.com>
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

Hi there,
I am pleased to present the fourth iteration of Selfpatch-SLR (formerly
also called Bootpatch-SLR). Built on an entirely new GCC patch series,
and a few new concepts, this version achieves boot-time randomization of
almost the entire structure set that RandStruct targets. This series is
now based on v7.3-rc7.

RFC v3:
  https://lists.openwall.net/linux-hardening/2026/07/20/38

Changes since RFC v3:
  - Based on new GCC deferred constants
  - Added refresh pins (rpins) to update static data leaves that depend
    on randomized field offsets
  - Drastically simplified metadata format
  - Switched to fisher-yates shuffle with greedy padding-hole-filling
  - Fixed build issues pointed out by Kees Cook
  - Expanded set of target structures to reflect RandStruct targets

At this point, this series only applies to x86-64 and requires a custom
toolchain based on GCC 16.1.0 and GAS 2.46.1. The corresponding patches
are available at:

  https://github.com/YJN-Systems/Selfpatch-SLR/tree/rfc-v4/toolchain/gcc_16_1_0
  https://github.com/YJN-Systems/Selfpatch-SLR/tree/rfc-v4/toolchain/gas_2_46_1

With these, a defconfig+CONFIG_SPSLR kernel:
  - successfully randomizes a total of 400 structure layouts (65
    explicitly marked, the rest are pure-ops)
  - patches 64438 instruction immediates that depend on the resulting
    field offsets
  - reorders 4521 static instances of target structures to reflect the
    new layouts
  - and updates 495 static data leaves that depend on randomized field
    offsets (e.g. self-referencing list heads in the init_task)
at BOOT!

The behavior can be disabled using the 'nospslr' boot param. A seed for
randomization can be specified with 'spslr_seed=<up to 64 hex digits>'.

In QEMU, using kvm on an i9-13900H, SPSLR adds roughly 3ms to the boot
procedure, and no meaningful steady-state runtime overhead. While the
current instrumentation separates instruction patch sites into dedicated
gadgets, I am working on a follow-up patch that folds these into memory
operand displacements, bringing code size down to roughly what it is
without SPSLR transformations.

This RFC patch series is organized as follows:
  * Patch 1 adds the Pinpoint GCC plugin.
  * Patch 2 adds the Selfpatch runtime.
  * Patch 3 makes minor adjustments to the explicit SPSLR target set,
    compared to RandStruct.

Where the first 3 RFC versions used a custom GCC parser hook in the C
frontend to catch COMPONENT_REFs before field offset dependencies could
be folded into constants, v4 uses a new 'deferred constant' mechanism.
This mechanism preserves all dependencies on randomized field offsets
(e.g. when usually eliminated by fold_offsetof) through the C frontend.

The Pinpoint plugin, mostly running after the frontend finished parsing,
essentially sees

  DEFERRED_CST_EXPR<IFN_DEFERRED_CST_FIELD_OFFSET<struct S, x>>

instead of

  42

Additionally, deferred constants are allowed in static initializers,
meaning that the frontend will no longer throw an error due to non-const
initializers when they depend on deferred field offsets. Thus, code like

  static size_t OFF = offsetof(struct task_struct, core_cookie);

survives until pinpoint's main instrumentation pass can generate a
refresh pin for this data point. While the deferred initializer is
replaced with its preliminary compile-time value (for the sake of
producing valid data in the ELF binary) Selfpatch substitutes the
runtime offsets into copies of the initializer's leaf expressions and
reapplies the initializers at runtime.

The new metadata format no longer uses per-CU data or runtime mappings
of CU-local target IDs to global targets. Instead, each subject (kernel
or module) now has exactly one array of target struct descriptors, one
of instruction pins, one of data pins, and one of refresh pins. The pins
refer to targets through an additional array of target references.
Selfpatch redirects a module's references to the kernel's target array
to allow efficient lookup.

I replaced the old whatever-that-was-shuffle with fisher-yates. To make
sure no random layout exceeds the original struct size, the shuffle is
followed by a greedy pull-back operation that fills a padding hole with
the first field that fits. While the old randomizer needed roughly half
a second to shuffle only the task_struct, this new mechanism is
practically instant.

As usual, I appreciate any feedback on this!

Thanks,
Jasper

York Jasper Niebuhr (3):
  Selfpatch-SLR pinpoint plugin
  Selfpatch-SLR selfpatch runtime
  Selfpatch-SLR target annotations

 .../admin-guide/kernel-parameters.txt         |    9 +
 arch/x86/boot/startup/Makefile                |    4 +
 arch/x86/entry/vdso/common/Makefile.include   |    2 +-
 arch/x86/include/asm/processor.h              |    2 +-
 arch/x86/kernel/vmlinux.lds.S                 |   42 +
 fs/proc/internal.h                            |    7 +-
 include/linux/compiler_types.h                |   31 +-
 include/linux/cred.h                          |    7 +-
 include/linux/dax.h                           |    9 +-
 include/linux/module.h                        |   18 +-
 include/linux/sched.h                         |   21 +-
 include/linux/spslr.h                         |   72 +
 include/linux/time_namespace.h                |   10 +-
 include/linux/uts_namespace.h                 |    8 +-
 include/net/neighbour.h                       |   10 +-
 init/main.c                                   |   39 +
 ipc/sem.c                                     |    6 +-
 kernel/Makefile                               |    2 +
 kernel/module/internal.h                      |    6 +
 kernel/module/main.c                          |  194 ++-
 kernel/module/strict_rwx.c                    |   23 +
 kernel/spslr/Makefile                         |    5 +
 kernel/spslr/pinpoint.h                       |   62 +
 kernel/spslr/spslr.c                          |  590 +++++++
 kernel/spslr/spslr_env.c                      |  147 ++
 kernel/spslr/spslr_env.h                      |   41 +
 kernel/spslr/spslr_randomizer.c               |  264 +++
 kernel/spslr/spslr_randomizer.h               |   19 +
 lib/tests/randstruct_kunit.c                  |    6 +-
 scripts/Makefile.gcc-plugins                  |   11 +
 scripts/gcc-plugins/Makefile                  |   15 +
 .../gcc-plugins/pinpoint/deferred_pin_pass.c  | 1437 +++++++++++++++++
 scripts/gcc-plugins/pinpoint/dpin_registry.c  |  212 +++
 scripts/gcc-plugins/pinpoint/dpin_registry.h  |   25 +
 scripts/gcc-plugins/pinpoint/ipin_registry.c  |  363 +++++
 scripts/gcc-plugins/pinpoint/ipin_registry.h  |   58 +
 scripts/gcc-plugins/pinpoint/layout_hash.c    |   71 +
 scripts/gcc-plugins/pinpoint/layout_hash.h    |   15 +
 scripts/gcc-plugins/pinpoint/on_finish_type.c |   32 +
 scripts/gcc-plugins/pinpoint/on_finish_unit.c |  221 +++
 .../pinpoint/on_register_attributes.c         |   61 +
 scripts/gcc-plugins/pinpoint/on_start_unit.c  |   17 +
 scripts/gcc-plugins/pinpoint/passes.h         |   21 +
 scripts/gcc-plugins/pinpoint/pinpoint.c       |   75 +
 scripts/gcc-plugins/pinpoint/pinpoint.h       |   78 +
 scripts/gcc-plugins/pinpoint/rpin_registry.c  |   45 +
 scripts/gcc-plugins/pinpoint/rpin_registry.h  |   22 +
 .../pinpoint/rtl_ipin_survival_scan_pass.c    |   47 +
 scripts/gcc-plugins/pinpoint/serialize.c      |  287 ++++
 scripts/gcc-plugins/pinpoint/serialize.h      |  114 ++
 .../gcc-plugins/pinpoint/target_registry.c    |  541 +++++++
 .../gcc-plugins/pinpoint/target_registry.h    |   59 +
 scripts/module.lds.S                          |   43 +
 security/Kconfig.hardening                    |    9 +-
 security/selinux/include/objsec.h             |    2 +-
 security/selinux/ss/hashtab.h                 |    2 +-
 56 files changed, 5504 insertions(+), 35 deletions(-)
 create mode 100644 include/linux/spslr.h
 create mode 100644 kernel/spslr/Makefile
 create mode 100644 kernel/spslr/pinpoint.h
 create mode 100644 kernel/spslr/spslr.c
 create mode 100644 kernel/spslr/spslr_env.c
 create mode 100644 kernel/spslr/spslr_env.h
 create mode 100644 kernel/spslr/spslr_randomizer.c
 create mode 100644 kernel/spslr/spslr_randomizer.h
 create mode 100644 scripts/gcc-plugins/pinpoint/deferred_pin_pass.c
 create mode 100644 scripts/gcc-plugins/pinpoint/dpin_registry.c
 create mode 100644 scripts/gcc-plugins/pinpoint/dpin_registry.h
 create mode 100644 scripts/gcc-plugins/pinpoint/ipin_registry.c
 create mode 100644 scripts/gcc-plugins/pinpoint/ipin_registry.h
 create mode 100644 scripts/gcc-plugins/pinpoint/layout_hash.c
 create mode 100644 scripts/gcc-plugins/pinpoint/layout_hash.h
 create mode 100644 scripts/gcc-plugins/pinpoint/on_finish_type.c
 create mode 100644 scripts/gcc-plugins/pinpoint/on_finish_unit.c
 create mode 100644 scripts/gcc-plugins/pinpoint/on_register_attributes.c
 create mode 100644 scripts/gcc-plugins/pinpoint/on_start_unit.c
 create mode 100644 scripts/gcc-plugins/pinpoint/passes.h
 create mode 100644 scripts/gcc-plugins/pinpoint/pinpoint.c
 create mode 100644 scripts/gcc-plugins/pinpoint/pinpoint.h
 create mode 100644 scripts/gcc-plugins/pinpoint/rpin_registry.c
 create mode 100644 scripts/gcc-plugins/pinpoint/rpin_registry.h
 create mode 100644 scripts/gcc-plugins/pinpoint/rtl_ipin_survival_scan_pass.c
 create mode 100644 scripts/gcc-plugins/pinpoint/serialize.c
 create mode 100644 scripts/gcc-plugins/pinpoint/serialize.h
 create mode 100644 scripts/gcc-plugins/pinpoint/target_registry.c
 create mode 100644 scripts/gcc-plugins/pinpoint/target_registry.h

-- 
2.43.0

