Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021831;
	b=p5mLGgMQGxUSeWxx/0uYeVYKwZBErc/FuFLLBGb8gBVy3vQ33ZF/KXyQfldm7rMtH9Iu
	 oGyI9nAk5/tKEQOcz/8R8r9V6X9AWASxbiBEAHjC82qiY9Vuk5vv9aCkY2wkil60cXI/L
	 j87fQo+hwIvSGW5ueUREab1YVOoO2I3CncfLv5338u04b/fqWlk0OK8pXaJinPSqhDXfy
	 o33iqqNFH+5XkvGWft0y00xb4GHimM9XrS6G8FjsGWK9uAhDuQUKMklIJhFdV1TIHf3Jl
	 4uQ9DMCfIN/XvfB/8mdjhGVrRcLW5BXXtZsMhxVUqRS09FglIqqYckB7x1lC1XfxO2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZdUmcXW287dmf4L0BFmvenYKDV6PnAEsVGMgRfFR9zw=;
	b=pRxTKilKJT5RKqOGiJcKsVclxJuYdxDFcx8dBz8CkikM8XyqP6RFegoHUJ7Fq/AoAQDg
	 8oWrQjHfN5HhOm5MuS2em2hTTWA71lkueJAiiIJCx+S85/NQGIs1ZKkBmqSCYfXy1ZGhK
	 ybpW+CFHwf65Q/G78gtz9KVw5INk+7aUQd2veV9V10MH5fEyhzDHpkL/f0QyNVV1KQeVI
	 HAA/IG4lv5Ec5HoEIrdCbwixECKlwXXpVNTwntK9cqLrK2Y9OYjRWkwjDSgma9zMs1WVL
	 R0jAtpWFE4HjadOGztb0Bg1hii64egkXj2iVAZnaT8pnnqkGmloMrYJ3dcBvisHX3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TiMHdkNN;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A474C60A260D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A474C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TiMHdkNN
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so19076525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793021830; x=1793626630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdUmcXW287dmf4L0BFmvenYKDV6PnAEsVGMgRfFR9zw=;
        b=TiMHdkNNZIGSX/bwyc4VVwUBunhP5LZvabSztj2oNV4+N7rFZM8aMIdIEdLalEyKyD
         oRl2R+en8ClINQ8QQ9PjBxD5UcSOI69qaB/vUGwvBTDNbxJSmw7eqLT/tbdPzbFkQM60
         1R48PTOUQ/v/ZCigkGwI7bCfDikCIDUEA6KaTp3VC0ueFwFSpTzyFJcNgo2pJ15feyze
         wyTfPzTP9OVUG33h1RefgfPDvE9rFA7Njllvv1Vh3eOSDGuUbPr9HDtVBLDgfsArbh+U
         q5ReJlsHP/zFw5IfQS5nTQAXA1SD9rEG1+ebi/eQEIruKZ4xtgM07z6y2b4eV4SEK+eh
         kf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021830; x=1793626630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdUmcXW287dmf4L0BFmvenYKDV6PnAEsVGMgRfFR9zw=;
        b=VnQnNVvKDN4+8/3E3W4JSmtx7cq/Oy3AsagkjAMOQFdadHVmRvGXH1ZpFqtGT7MgPx
         6GflPSO/ReTTyDUlfxyoWrjMhvZcbDTqw6QkyECJu4rerPReL6RBtQDJBAcsSpOyTSqT
         gRtShMwyw3eZFJNhU4infGrfCeaKq7SLvzb7MvcFlsP1J3HYHpBjDZxUSjdT+Fzm8Rt5
         gumw4vQMfG6Y4kzgoQnbtY1cPWVyQjH5+l2oQckAwM2wYNSxZYgEpNtc6X1Rkz7GvKsi
         rS0yXVLH07C+8SWpDEn7RRdEq5HFo5tKdqqXMHRWWuFT//CtBlcdL4qQeh7ddsTdXG+t
         shaQ==
X-Forwarded-Encrypted: i=1; AKwUvByll1NBbbgSpIfOK0DJYIlY1e1yi7m1w5QxX9r8xJpZtXvREXIcbT2h2/fpmNC+uHIRoQ4vnxZDCcBzs0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8EgcxYTdDjIB2LU65gCkzBpz3lXl55GHUyfV2BFw8LlopqfyZ
	O2jA9N6nz16AHEiRJ5IZr6BtE+J/eIorKKD7jDKLk9v27rDK4lnG1q8K
X-Gm-Gg: AYBFou17Ghu2EpfC6jJazeom3lD8JLA4Sq9aGQ2Sf31FaZe6ooCgpF+o2wYxGZEh0uy
	NZ2Y7MXVwOutCbNcT7uN36HcpDJN/yKAiFM6KN8QqbwFzxiBF4ZdYJrEVjHubtod5/bUaJ3wvHa
	xpg5LDHMKvv9Th/v8/OjrMvM1W009JQK71Qwr/SNnbpF57R0lwBw/dgdmnup3rBG0n6BahylD83
	bI/ockC0kjawkWhKBnMqPBdjUwutz0EjReA066NHJPmDbH5MDuakxtEca/Q24ITmxV/J1dqNssa
	gYpP8D1WlQ/XkX1Cu8in7q+2MB3qEOQJwZ4qIIfMVxT58bhlr3tnAy/grXl4fkO8Hxh2JG1SKrY
	NxVWHG7FfZCB58oJytqXkOOBrqbUblzDZL9NBSpI1TqrB87LrqUhWULimFdT6dDjKcwXbsU6tS/
	58s77HMVoIpmwTr22wXW/Y9yIk7H3u2FYATVHXOIFkGJOup7b/uQ6dThz4ER1tFBnI94tyR/SPS
	oLtLmeVXmbkObovRPBYWWpezRNV7mvEgmAFp7jB+6VfCEntvFhvLvwHbS6vUWtVF3Mw+xXAbgLh
	wStvSP18bvZmBHyd10hA88hextIDKNtKvDQ81UwOyl4X9e516TH/W06NjRL9
X-Received: by 2002:a17:902:f78c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2ea9c80e221mr60199245ad.30.1793021829901;
        Mon, 26 Oct 2026 06:37:09 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:484d:51ee:4f49:b5a8:aabd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a5cf0sm17447055ad.52.2026.10.26.06.37.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:37:09 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v13 0/9] livepatch: Add support for scoped atomic replace
Date: Mon, 26 Oct 2026 21:36:42 +0800
Message-ID: <20261026133651.40061-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Atomic replacement is currently all-or-nothing: a livepatch with
"replace" set either atomically replaces all previously installed
livepatches, or - with "replace" disabled - it replaces none. There
is no way to atomically replace only a selected set of livepatches
while keeping the rest running untouched.

We previously proposed a BPF+livepatch method to enable rapid
experimentation with new kernel features without interrupting production
workloads:

  https://lore.kernel.org/live-patching/20260402092607.96430-1-laoar.shao@gmail.com/

In the resulting discussion, Song and Petr suggested that it should be
possible to selectively replace or skip individual livepatches.

This patchset introduces a more flexible model using two new fields in
struct klp_patch:

- provides: an unsigned int id identifying the replacement scope of
  the livepatch. Livepatches that share the same provides id replace
  each other, so at most one livepatch of each provides id can be
  enabled at a time. By default (provides=0), every livepatch that
  does not declare an explicit provides id belongs to the same scope:
  loading a new provides=0 livepatch atomically replaces the
  previously enabled one.

- obsoletes: an optional array of unsigned int ids specifying
  additional provides ids to be replaced. This allows a new patch
  to explicitly obsolete patches from different scopes.

A new livepatch atomically replaces any existing livepatch that
satisfies either of the following conditions:

  1. it has the same provides id as the new patch,
  2. its provides id is listed in the new patch's obsoletes list.

A new livepatch that does not replace an existing one can coexist
with it. In this case, the two livepatches must not modify the same
function, or use the state with the same id. Any attempt to load an
incompatible livepatch will be rejected by the kernel.

Previously, setting 'replace' to 0 was the only way to keep
certain livepatches persistent on the system, forcing developers to
disable atomic replacement entirely. With the introduction of provides
and obsoletes, developers now have a selective option to keep specific
livepatches persistent while maintaining atomic replacement capabilities
elsewhere.

IMPORTANT:
- this design deprecates the traditional non-atomic-replace model.
- the behavior of replacing all non-atomic-replace livepatches with a
  single atomic-replace livepatch is also deprecated.

The new "provides" and "obsoletes" attributes are exposed through
sysfs and the kselftests cover the replacement and coexistence
semantics described above.

At present, KLP state, shadow variables, and callbacks are not
integrated with the new provides/obsoletes mechanism in this patchset.
Support for these features is deferred until Petr's klp-state-transfer
infrastructure is completed and merged:

  https://github.com/pmladek/linux/tree/klp-state-transfer-v1-iter12

It is based on livepatching tree's for-next branch.

Future work
===========

For backward compatibility with the old non-atomic-replace model, we
might consider adding a new "noreplace" flag. A livepatch with this
flag set would not replace any other livepatch, but it could still
be replaced by an atomic-replace livepatch. This would preserve the
behavior of the original non-atomic-replace model.

We can revisit this once a real use case for the non-atomic-replace
model emerges.

Changes
=======

v12->v13:
- clarify the replacement conditions (Petr)
- update the system state compatibility rules in system-state.rst
  to match the new conflict rules
- fix temporary selftests broken in #2 (Petr)
- remove the "patch.replace = true;" in #8 (Petr)
- add the new file ABI/removed/sysfs-kernel-livepatch to MAINTAINERS
- The UAF in livepatch_mod_init() is fixed by a standalone patch:
  https://lore.kernel.org/live-patching/20261016122314.81476-1-laoar.shao@gmail.com/

v12: https://lore.kernel.org/live-patching/20261016053708.47089-1-laoar.shao@gmail.com/

v11->v12:
Comments from Petr after the LPC discussion:
- document the rollback pitfalls in #5
- warn about installing more livepatches in parallel in #5

v11: https://lore.kernel.org/live-patching/20261008095830.26308-1-laoar.shao@gmail.com/

v10->v11:
- check $HAS_PROVIDES_ATTR positively in #2 (Petr)
- document the conflict semantics in #5 (Petr)
- per the LPC discussion, drop the symmetric obsoletes semantics

v10: https://lore.kernel.org/live-patching/20260930030323.14396-1-laoar.shao@gmail.com/

v9->v10:
Various comments from Miroslav:
- rename skip() to skip_exit() and skip_test() to skip() in #2
- define CONFIG_KLP_HAS_PROVIDES in #2
- add a comment about the CONFIG_IKCONFIG_PROC fallback in #2
- adjust the order around `CONFIG_KLP_HAS_PROVIDES`
- update the comment above klp_add_nops() and
  klp_unpatch_replaced_patches()
- add verification step for `provides 0 coexists with provides 1` in #7

v9: https://lore.kernel.org/all/20260913024228.72317-1-laoar.shao@gmail.com/

v8->v9:
- extract the replace-related test scenarios into functions in patch #2
  (Song)
- make the state module parameters read-only to avoid a potential
  state leak if tampered with after load (sashiko-bot)
- verify that /proc/meminfo is no longer patched after the atomic
  replacement (sashiko-bot)
- unload the coexisting state livepatches in LIFO order so that the
  console_loglevel is properly restored (sashiko-bot)

v8: https://lore.kernel.org/all/20260909024324.16002-1-laoar.shao@gmail.com/

v7->v8:
- fix the commit log and documentation regarding `--obsoletes`
  (sashiko-bot)
- remove the `--obsoletes` validation requirement from klp-build (Josh)
- explicitly log the skip info for the deprecated `replace` attribute on
  the new kernel
- implement symmetric obsoletes (Petr)
- rename test module files for clarity (Petr)
- add CONFIG_KLP_HAS_PROVIDES (Petr)
- avoid duplicate test module source files (Petr)
- documentation and commit log improvement (Petr)
- add more selftests for provides/obsoletes (Petr)
- other code cleanups (Petr, Josh)

v7: https://lore.kernel.org/all/20260825114641.80452-1-laoar.shao@gmail.com/

v6->v7:
- rebase it to livepatching's for-next branch
- rename klp_patch_replaceable() to klp_patch_replaces() (Song)
- remove "[]" around --obsoletes (Song)

v6: https://lore.kernel.org/live-patching/20260607131659.29281-1-laoar.shao@gmail.com/

v5->v6:
- Check `--provides` argument in `klp-build (sashiko)
- Fix the 'replace' feature detection for OOT kernel builds (sashiko)
- Fix race condition in sysfs polling (sashiko)

v5: https://lore.kernel.org/live-patching/20260809091954.22930-1-laoar.shao@gmail.com

v4(RFC)->v5:
- Add selftests and Remove the RFC
- Fmprove klp_has_function_conflict() (Song)
- Fix a pre-exisiting bug
- Fix bugs reported by sashiko

v4 (RFC): https://lore.kernel.org/live-patching/20260804065010.44922-1-laoar.shao@gmail.com/

v3->v4(RFC):
- Allow a livepatch to replace livepatches with different provides IDs.
  Replace the single `replace_set` field with two separate fields,
  `provides` and `obsoletes`, for more flexible replacement semantics.
  (Petr, Joe)

v3: https://lore.kernel.org/live-patching/20260607131659.29281-1-laoar.shao@gmail.com/

v2->v3:
- Address the feedback from Sachiko AI
 - Fix the pre-existing NULL pointer dereference issue
 - Move klp_find_func into core.h
 - Don't deprecate stack_order completely

v2: https://lore.kernel.org/live-patching/20260529034542.68766-1-laoar.shao@gmail.com/

v1->v2:
- Incorporate feedback from Petr:
  - Initialize replace_set to 0 by default
  - Improve documentation
  - Enforce that livepatches in different replace_sets cannot use the same
    state->id.
  - Enforce that livepatches in different replace_sets cannot modify the
  - Ensure consistent capitalization and naming usage of KLP_REPLACE_SET.
- Incorporate feedback from Sachiko AI:
  - Skip the klp_transition patch during klp_force_transition().

v1 (RFC): https://lore.kernel.org/live-patching/20260513143321.26185-1-laoar.shao@gmail.com/

Yafang Shao (9):
  selftests/livepatch: Clarify test module file names
  selftests/livepatch: Adapt atomic replace tests to provides/obsoletes
  livepatch: Make klp_find_func() non static
  livepatch: Call klp_init_patch_early() earlier
  livepatch: Implement provides and obsoletes for scoped atomic replace
  livepatch: Deprecate stack_order
  selftests/livepatch: Add provides/obsoletes test scenarios
  selftests/livepatch: Add state test for provides/obsoletes
  selftests/livepatch: Add function test for provides/obsoletes

 Documentation/ABI/removed/sysfs-kernel-livepatch   |  16 +
 Documentation/ABI/testing/sysfs-kernel-livepatch   |  26 +-
 Documentation/livepatch/cumulative-patches.rst     | 127 +++-
 Documentation/livepatch/livepatch.rst              |  29 +-
 Documentation/livepatch/system-state.rst           |  22 +-
 MAINTAINERS                                        |   1 +
 include/linux/livepatch.h                          |   8 +-
 kernel/livepatch/Kconfig                           |  15 +
 kernel/livepatch/core.c                            | 126 ++--
 kernel/livepatch/core.h                            |   2 +
 kernel/livepatch/state.c                           |  70 ++-
 kernel/livepatch/transition.c                      |  15 +-
 scripts/livepatch/init.c                           |  18 +-
 scripts/livepatch/klp-build                        |  23 +-
 tools/testing/selftests/livepatch/Makefile         |   3 +-
 tools/testing/selftests/livepatch/functions.sh     |  42 +-
 .../testing/selftests/livepatch/test-callbacks.sh  |  43 +-
 tools/testing/selftests/livepatch/test-ftrace.sh   |   2 +-
 tools/testing/selftests/livepatch/test-kprobe.sh   |  15 +-
 .../testing/selftests/livepatch/test-livepatch.sh  | 108 ++--
 .../selftests/livepatch/test-provides-obsoletes.sh | 656 +++++++++++++++++++++
 tools/testing/selftests/livepatch/test-syscall.sh  |   2 +-
 tools/testing/selftests/livepatch/test-sysfs.sh    |   9 +-
 .../selftests/livepatch/test_modules/Makefile      |   9 +-
 .../test_modules/test_klp_atomic_replace.c         |  57 --
 .../test_modules/test_klp_callbacks_demo2.c        |  12 +
 .../livepatch/test_modules/test_klp_cmdline_kp.c   |  38 ++
 .../livepatch/test_modules/test_klp_cmdline_lp.c   |  60 ++
 .../livepatch/test_modules/test_klp_kprobe.c       |  38 --
 .../livepatch/test_modules/test_klp_livepatch.c    |  51 --
 .../livepatch/test_modules/test_klp_meminfo_lp.c   |  79 +++
 .../livepatch/test_modules/test_klp_meminfo_lp2.c  |   2 +
 .../livepatch/test_modules/test_klp_state.c        |  38 +-
 .../livepatch/test_modules/test_klp_state2.c       |  46 +-
 .../livepatch/test_modules/test_klp_syscall.c      | 131 ----
 .../test_modules/test_klp_syscall_getpid.c         | 131 ++++
 36 files changed, 1548 insertions(+), 522 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-kernel-livepatch
 create mode 100755 tools/testing/selftests/livepatch/test-provides-obsoletes.sh
 delete mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_kp.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_cmdline_lp.c
 delete mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_kprobe.c
 delete mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_livepatch.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_meminfo_lp2.c
 delete mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_syscall_getpid.c

-- 
1.8.3.1

