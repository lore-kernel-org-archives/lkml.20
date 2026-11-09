Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243273;
	b=OQwDDg7SI0KgGqUe8dbi0SOlQYDea4x9lPx7kPcgA6d7bxmTaWigsTPl8r7wCQ8Lashg
	 jJmUADF+SMZZylzTR9pR7J5zqfZRy+bD5FJ0pbo8CamHeGBsuW3HehgWo0OddqRY3PI9E
	 tJM+am4P9Rd8FqfyM0+wsc4hkn5RAQaHVqL6j+51LL5z35fCrGmKd3lCYyRsFHh+OPO3K
	 ne5vpBdgj1IJ9xMuk+0hReMtf9J27JhabdCS8A9KDUqxcHMUtx+wvA3FqHFXX9tQKidvf
	 cmLOJtpO/qVmfKJTq0Rp7bIiZ/m2d90Z55wGLiHoXQC2p70KSbqRnWB1BhYV/ml1Duw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P9r4XS3zzGgwEJ2E5OumaHHOInOrIHEkW9EeY5d/apI=;
	b=sVWT78ZUfbb+tv5Z+SAQczCW145bT/mllFeLXMpV1nFrlM/uxaWQ7O33E0jrtWUBkViT
	 Dn+KYamAjROo1tQP2QEobHEV/ig7wkGAAt60wtd2c//pfmiAl9ymV1IiJrQTkJpFQ+9sZ
	 6cio8XYPCkgyFfvt37Y6p+MI7TUJDi1WZoJWe/NtM/alRHBNFf+HLXf4aFpxKlgQUA9P8
	 r3s0qqySjXMMOPA3+qbTFLfgSa8cgi1G8d7gXY2DKvmu+iznFnh3pHo5gzMN5YwfWq6YY
	 yA5PXLEnloFRUg7unbLU8ATtS7COCdyd8vKLMYQJtCBEmS91cs3ynhE8q7O7nwP/VSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6IHiV8I;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB2606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6IHiV8I
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so13852815e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243270; x=1794848070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9r4XS3zzGgwEJ2E5OumaHHOInOrIHEkW9EeY5d/apI=;
        b=d6IHiV8IrcMjNY5/+PX5mISrXrl4N1dI/nNsHAPGf8V2U4Mc2oK8HSCOVWJLzo8bS9
         sWOX5UQ2jf/qRrAPY3cwIwJ8R+8fNbm2VJ+M+DDtQu3W/qmNOMfAdEsPLM75CicaDqWV
         9mC3/240ifnjSlyrMGbKpJLwKhDOy/gKBTxhZwi68Qutq2TLrEBEm6tE1+76PwHYaFLb
         ESto8h8axuUz5uU9fA99wR1F6duL0R21YGy5jol8tcjthtVqB7/R29zJ8tMcYBS5+Aeg
         L/jo5s49420CU95LQVI2SZbA6MndyRT/a4eNvzrvj9lMEguRwcH41cn8rpRj8yTHqpfa
         Im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243270; x=1794848070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9r4XS3zzGgwEJ2E5OumaHHOInOrIHEkW9EeY5d/apI=;
        b=wt4sNX6wkMxVLJuYnhTuR4KSQfopii9DQUU0oTIz1CXQ2olgzaYPpI64PyDEAjRxqr
         0UFW8cZi2mGj0NZm58Xzc+5LT41HyPdx09FGB++ob3KRZm7eGDC2ppD3lTMRxoM2BFKN
         2lthxfvCMIYMhAPJYN7CHPirQ76+lgpYeQMQ+Ad7wTnxiaMHxq1nmYi9NjtfuZVBYiwW
         KJ4Fes9ri9NRP8xsB4pex1VpOE1ap4GNPT8Ne/v7UZe3oVp+LvQdDWqFbfDglmXH3tIV
         RyOdmRhjuIKMD83rgHB3PFIScOCy2CI9VheFAaA0EDcSprgt7DHY3o69y4hDcb8LUPH0
         EBMw==
X-Forwarded-Encrypted: i=1; AL+hErHw3RRVwxk0dLK6d9zvBVZVqE0CzYfmqJGSVVsgsnZ4n1E5JcZFREoL8BMYz66n5EGimVFVpFmeDC/avbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ARF8I8BLdUjAED2ip4MXBOyJjgq8gnamFz6s6U5vv7T6QPYlm
	gOqHL1LyAqKvXjHGcUCdmlpuIfaq44wGOIG4I9ZAPLm911oL11JIE+gj
X-Gm-Gg: AYBFou0i9pxyy7zbDGiHdjt4qif+msJyfwV9ImZGRwi6fmc+8ftWpmplw3cnKysRxko
	OyYaYKZ5iZEORwYkQm6C2i80qhv3hqqtrMKLRFlUyAonW3AXDCPLLJ4OaFXNzKrHioh+ONYkctl
	dB3FX3UCZRbeDMEK81FppQcsel3BPteJ7IQDbwu8Rsd7yXqFHm3ObgA8fxrbnXDHyoRG51JHuV/
	j/2IE3KXfFmrE0/VqO3ALyDH37WYGKwCWXxYXdxy7qxMuQUiq2eMuKBcT79i+fQdQTNpKAp/fwr
	hogblPqkEqPvqbgmM2wwVNZ3UWNOlj1lGuDp4AueYwoju3WuHKRb7EquT1iqyu5u6PYZiyhZ+D/
	KsS7peFaAxqVv1kKKrSwaOSbEdi3oVmkGvfDVh+VJPXlhmJYLwmws1BGpM2d4/U8UUI/H1NDBYl
	nzlwrLggTn2OlnsKoqPGlu8UlT5FLDd//uk4oV2OuOj52BdFgp+5EDRs61pCkCmtyaWH/xyIauk
	QcC0y9T/8O6z5VlFmKrQSWmOz0Pf/vzdUjMWHMOMQVXoHM/XKWiMjplqDfyJGRFzdRY2Hnb+3hy
	WUe8M+cHpdC3/5mKOK7yj+5GS/oKdcNNyMDL2AlK31AQPJk=
X-Received: by 2002:a05:600c:4f09:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4b963c87beamr90679925e9.31.1794243269283;
        Mon, 09 Nov 2026 08:54:29 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:28 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v2 bpf-next 00/18] Auto-detect BPF fmodret targets
Date: Mon,  9 Nov 2026 17:05:20 +0000
Message-ID: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

Due to recent changes in software development, security fixes and attack-surface
hardening increasingly need to land on production systems _now_. BPF has proven
really useful for producing mitigations, but its error-injection capabilities
remain limited: the list of possible fmodret hooks is static, which no longer
matches reality.

This series allows more kernel functions to be targeted by fmodret BPF
programs. New functions are marked as fmodret-attachable _automatically_, if
CONFIG_CLANG_PLUGIN_BPF_SCAN_IR is on. The latter is off by default, but can be
enabled with CLANG >= 19 with a matching llvm-config and host C++ compiler.
Supported archs are x86_64 and arm64. (The existing static lists are, of
course, still supported.)

The decision on "if this function is safe to inject error" left to BPF program
writers.  The motivation/discussion can be found in the recent talk [1].  The
safety/operation model of this new functionality can be briefly stated as
"a trusted operator can already do this with live patch". However, the BPF
approach is more flexible. See the recent talk on shirudo [2] for more details
on how to build a trusted system managing such policies.

The changes introduced are as follows.

The first part of the series changes the way the lists of fmodret-attachable
functions are passed to kernel, namely, now a function is considered as a
fmodret target if it has a bpf_fmodret BTF tag. This tag is generated by the
resolve_btfids tool. The sleepable hooks are in addition tagged with
bpf_fmodret_sleepable. The old-style static hooks, explicitly defined in
kernel/modules, also get the bpf_fmodret tag. The security_*, syscall, and
error-injection hooks are _not_ all marked with the tag, and any new rules do
not apply to them.

Currently static hooks are defined using sets (BTF_FMODRET_START/END).  When
the minimal versions of GCC and pahole will support tags, the sets will go away
in favour of just declaring a proper tag.

The second part enables automatic search and usage of fmodret targets:

  * The search is performed by a new compiler pass via a compiler plugin.
    The candidates are written into a new .BTF_fmodret_candidates section which
    is dropped later in the final object.  Roughly speaking, a candidate is a
    function with a clean (side-effectless) path to "return -errno".

  * After the compilation is done, the resolve_btfids tool scans the candidates,
    drops some of them (redefined weak, non-ftracable, etc.), and assigns proper
    BTF tags: bpf_fmodret/bpf_fmodret_sleepable and bpf_fmodret_retval. The latter
    lists all possible return values the analysis found. The verifier rejects
    the values outside this list. (An alternative approach, maybe a followup,
    is to auto-convert all negative error values returned by a BPF program with
    a value from this list.)

The following selftests are added:
  
  * Test fmod_ret BTF decl tags and attach permission: the declared targets get
    the right tags, and fmod_ret programs attach only to tagged functions.

  * Test fmod_ret candidates found by bpf_scan_ir: functions in bpf_testmod
    annotated with the values the analysis must find, checked against the
    generated tags. The verifier allows only these values on every path and
    rejects extensions and tail calls of such programs.

Finally, the last patch adds a new `bpftool fmodret` command to simplify listing
the functions having bpf_fmodret* tags.

Planned follow ups, more or less in order:

  * LLVM LTO support
  * GCC support
  * Allow injecting errors into functions returning pointers
  * More complex logic to gather more candidates (mainly, error propagation,
    left out for now to reduce the number of commits in the series)

Build times with and without plugin enabled are nearly the same:

  with:                   without:
    real    5m48.377s       real    5m47.543s
    user    136m7.002s      user    135m57.994s
    sys     10m13.739s      sys     10m12.635s

Links:

  [1] Scaling BPF LSM hooks and error injection across the kernel,
      https://lpc.events/event/20/contributions/2435/

  [2] Shirudo: BPF live-patching infra for the agentic era,
      https://lpc.events/event/20/contributions/2437/

v1 -> v2:
  * Rebase onto bpf-next, as upstream removed mark_chain_precision()
  * Move tests into their own bpf_test_retval.ko from bpf_testmod.ko.
    The problem was with pahole, which can't properly find symbols in
    modules build from two or more objects (was only prominent with GCC,
    which reorders sections while linking objects together)
  * Fix the fmodret/extension test for GCC (force a const return)
  * resolve_btfids: dedup and cleanup code (bpf-ci bot)
  * bpftool: drop dead code (bpf-ci bot)
  * Rename two tests properly, remove dead code (bpf-ci bot)
  * Exclude KCSAN and UBSAN instrumentation from tests (sashiko)

v1: https://lore.kernel.org/bpf/20261106210314.1767267-1-a.s.protopopov@gmail.com/T/#t

Anton Protopopov (18):
  bpf: Add BTF ID sets for fmod_ret targets
  bpf: Add a btf_id_set8_entry helper
  bpf: Build fmod_ret target sets from BTF decl tags
  selftests/bpf: Declare bpf_fentry_test1 in tracing tests
  bpf: Declare fmod_ret targets with BTF_FMODRET sets
  selftests/bpf: Test fmod_ret BTF decl tags and attach permission
  scripts: Add LLVM plugin infrastructure
  bpf: Add the bpf_scan_ir LLVM plugin
  bpf: Find fmod_ret candidates in bpf_scan_ir
  bpf: Allow writes to private stack objects in bpf_scan_ir
  bpf: Follow PHIs in bpf_scan_ir
  bpf: Follow integer casts in bpf_scan_ir
  bpf: Check the return values of fmod_ret programs on found targets
  bpf: Require the JIT for fmod_ret programs on found 64-bit targets
  resolve_btfids: Tag fmod_ret candidates as targets
  selftests/bpf: Test fmod_ret candidates found by bpf_scan_ir
  selftests/bpf: Enable bpf_scan_ir in the config
  bpftool: List and show fmod_ret targets

 MAINTAINERS                                   |   10 +
 Makefile                                      |    6 +-
 arch/Kconfig                                  |    1 +
 arch/arm64/kernel/pi/Makefile                 |    1 +
 arch/x86/boot/startup/Makefile                |    2 +
 arch/x86/um/vdso/Makefile                     |    2 +-
 drivers/firmware/efi/libstub/Makefile         |    2 +-
 include/asm-generic/vmlinux.lds.h             |    7 +-
 include/linux/bpf.h                           |    6 +
 include/linux/btf.h                           |    9 +-
 include/linux/btf_ids.h                       |   24 +-
 include/linux/compiler-version.h              |    5 +
 kernel/bpf/btf.c                              |  124 +-
 kernel/bpf/syscall.c                          |    1 +
 kernel/bpf/verifier.c                         |  143 ++
 lib/vdso/Makefile.include                     |    3 +
 net/bpf/test_run.c                            |   12 +-
 net/mptcp/bpf.c                               |   15 +-
 scripts/Makefile                              |    1 +
 scripts/Makefile.btf                          |    1 +
 scripts/Makefile.llvm-plugins                 |   10 +
 scripts/Makefile.modfinal                     |    1 +
 scripts/Makefile.vmlinux                      |    3 +
 scripts/bpf/fmodret.lds                       |    6 +
 scripts/bpf/fmodret_metadata.h                |   29 +
 scripts/gen-btf.sh                            |    4 +-
 scripts/link-vmlinux.sh                       |    7 +
 scripts/llvm-plugins/Kconfig                  |   33 +
 scripts/llvm-plugins/Makefile                 |   21 +
 scripts/llvm-plugins/bpf_scan_ir.cpp          |  374 +++++
 scripts/mod/modpost.c                         |    1 +
 scripts/module.lds.S                          |    5 +
 .../bpftool/Documentation/bpftool-fmodret.rst |  111 ++
 tools/bpf/bpftool/Documentation/bpftool.rst   |    2 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   31 +
 tools/bpf/bpftool/fmodret.c                   |  896 ++++++++++++
 tools/bpf/bpftool/main.c                      |    3 +-
 tools/bpf/bpftool/main.h                      |    1 +
 tools/bpf/resolve_btfids/Build                |    1 +
 tools/bpf/resolve_btfids/fmodret.c            | 1205 +++++++++++++++++
 tools/bpf/resolve_btfids/fmodret.h            |   28 +
 tools/bpf/resolve_btfids/main.c               |  185 ++-
 tools/include/linux/btf_ids.h                 |   24 +-
 tools/objtool/check.c                         |    1 +
 tools/testing/selftests/bpf/Makefile          |    2 +-
 tools/testing/selftests/bpf/config            |    2 +
 .../selftests/bpf/prog_tests/fmodret_retval.c |  211 +++
 .../selftests/bpf/prog_tests/fmodret_tags.c   |  155 +++
 .../selftests/bpf/progs/fmodret_retval.c      |  196 +++
 .../selftests/bpf/progs/fmodret_retval_ext.c  |   53 +
 .../selftests/bpf/progs/fsession_test.c       |    2 +
 .../bpf/progs/get_func_ip_fsession_test.c     |    2 +
 .../selftests/bpf/progs/tracing_multi_check.c |    2 +-
 .../testing/selftests/bpf/test_kmods/Makefile |   15 +-
 .../bpf/test_kmods/bpf_test_retval_main.c     |   12 +
 .../selftests/bpf/test_kmods/bpf_testmod.c    |   11 +-
 .../bpf/test_kmods/bpf_testmod_retval.c       |  311 +++++
 .../test_kmods/bpf_testmod_retval_strong.c    |   28 +
 58 files changed, 4277 insertions(+), 82 deletions(-)
 create mode 100644 scripts/Makefile.llvm-plugins
 create mode 100644 scripts/bpf/fmodret.lds
 create mode 100644 scripts/bpf/fmodret_metadata.h
 create mode 100644 scripts/llvm-plugins/Kconfig
 create mode 100644 scripts/llvm-plugins/Makefile
 create mode 100644 scripts/llvm-plugins/bpf_scan_ir.cpp
 create mode 100644 tools/bpf/bpftool/Documentation/bpftool-fmodret.rst
 create mode 100644 tools/bpf/bpftool/fmodret.c
 create mode 100644 tools/bpf/resolve_btfids/fmodret.c
 create mode 100644 tools/bpf/resolve_btfids/fmodret.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/fmodret_retval.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/fmodret_tags.c
 create mode 100644 tools/testing/selftests/bpf/progs/fmodret_retval.c
 create mode 100644 tools/testing/selftests/bpf/progs/fmodret_retval_ext.c
 create mode 100644 tools/testing/selftests/bpf/test_kmods/bpf_test_retval_main.c
 create mode 100644 tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval.c
 create mode 100644 tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval_strong.c

-- 
2.43.0

