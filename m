Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328161;
	b=BORntQgSCTEzpF91xgg7UQK9Yn2B5uqGfwnwzXNQNRsGj9Is+Yo217+WddNfCvNCYPnX
	 kPA6YqcKAaRWxpgNE88v6Z/BBYZ/PfgcdW4l+eyRD78ooZ8VNnDRBrnCl/wwV56cRwYCT
	 UX0Pt6x2TEKCe2BJuygt2T23ae1OeThy5YbJZP6nPFuKhOJROiNEVbbs7nL/zcKl0sjXS
	 kSbTsFe2xs7G2hbOkUorbIhrI5gMoRrtGwLLJc1Y1qbBDCGPwK9S6tmY6wZrI5BiJJy2F
	 y83N2VulPHz03wcIsNSf0NR+psh/otSk78QkGBABJhQHbNYDXMFkJrye2a+5guZwEMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=156pRIpY6brhI/zqInQk7DLrhtOytpIGDOtBYOeD85w=;
	b=xd9qJO1TWcQ3MWjkQkimFA5LD4Dl1CLi3vJVzSCgJDrHRtRxn7yAWrDSkzStdeoAd3Wy
	 NYbYxpcPH0ce77UAO+Wdvg54zUBmRqmPIGaYTUZG02lqPJHJcjnnsVTg4r1Ln0Kl0TiQO
	 hydxShm8EZemomySvnvWsc3geUA0KbNqBR2N1ci6vExuChP6Gp6l6yY+H+sGRSPdLKLbC
	 fEtPCavjRJwE77W6qzH3RquCOZ4zJMtojGGOgcKzCPDPZ3ba0X1tlqWE0v0rSppftB085
	 SKl1mliO2O1yZXNXc7y6JBO73HxMmFT0kpPTUW8DodE8OrGZn1yOBL791INFvIEbmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnAhCHk;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918A606A20F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B918A606A20F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnAhCHk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16546385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328159; x=1794932959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=156pRIpY6brhI/zqInQk7DLrhtOytpIGDOtBYOeD85w=;
        b=pgnAhCHkR2N6oOrt594HWoFvbgcD/pfHIj7SouCpA9ZqbPxZZuB1w+PhzGGv6D5kxn
         q/Vj3JcrwNWXH084YbXqO6myqqv/YolKGs4vPwa0g+TxvaKmlB6a4PtnRUyJTLXhzbV8
         BjvNVCRYWz1Wbb3RBMQTAQUlhyCUoRq36JWmJB+VWwTEHGvNk4IGL9rbadYM/xxPk32h
         cQk/9yQXy8bUtidO17F8Y4zvuCImBuKBZ6pWvBL5vcXTMAQFm7t1vUMjJsefJ+M7CfYJ
         lBCK4p27CmZ8/bVjX36Lt9dUqBb7Uiaxlf2d+7YDpAsQQwv3f6bvcyTP+xhB/xGhZF44
         7AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328159; x=1794932959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=156pRIpY6brhI/zqInQk7DLrhtOytpIGDOtBYOeD85w=;
        b=iUA091/RC6td8fKHhVCutWSbVl9YAtCca+39eHwBjIlSBHL1NOFjnp8CSFq+s1j16a
         AP8VAgyvdQ3gwF0xZO7MRhxOp8j/fVyWYxRqS/k8cp9M63ONTZjKrtBMNZ6CHuHSVilG
         gLNRU012j8VKbvh7Y2xUECcFtvd6jqaVLg7p+0bStJAybXv0bEyo1vzGHmo5HjQxoA+V
         3Q8mMNo4proxXB0NE1Q9ILxXKsqNcyqbTR70HZokwAyoFeMYR1okYYKe72X2kCmjQ894
         XaCHheuso8KXOsxAcJWe7FoXNfpsbgIJOkd7aO7WH3ouyzmbnYJoQJzMQQAH3ZtUsRSO
         Khmw==
X-Forwarded-Encrypted: i=1; AL+hErEs4DwCpPZnJ+opHEZ4fZXBs989ohJwgnichYyZQjYtr9dZsnuE33k9rEuEjaHPGxHxaLZoIvN65D9Jg/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vlnosxXsOnUx7Vgc3H53KvPm3ICrii7x+HQcm0pNs0RaIffPz
	qww9VTjrT5AVCDisFmqFXoiNleOIK2RvNd9cy+NDhPuapsQ4CJG+kUH5
X-Gm-Gg: AYBFou2W8gU2U3VctwlXr78xL6vkYkvSQnwRoIPBdSPnvh000uhCjffTAIWAlUYHBQ5
	CdRH2Uu4MYiIPOValEBd69EZ+j9XdfXUX163ST7/mgaSTQMM7sMb/lnegNpr04hHLbVvi0csrYb
	zPGdJhUz+dVHe8MZaWV+aRWA94iYYhLONLb1O8BuFJUEDaETKRVx8REPQkbV8KH72tXftM9JDsg
	m5hOkGPi/DM7HhjhFmnMMflQFdLthCEonjV5RjfUrOzwfIsrO0jsZ7QbyH335hurtc8jkOj58ek
	EGDKfXIlmepArrHOpZ6+cSLW29B+V9XCu5d4501MUcJPVhFvrVAIOPe25vG1dP5KRG9SPISpm5p
	itZ41LSKs8SjEy+8QwJBISQPe0tL4dLwVsSW9ikbz+QhjkxYIJxwJWHx6kK9oQICTn7OBzrsu0q
	/3HN+HXcajsoft0c3/iwz68mFJPgekwNPFETuFT+rsKwbO7VtB4S0GgxVu8zxzRkbiRvNphS2rT
	tqnsPCyZD9Crkp54btWoeFcVbyeQRWiYf6yadjKOm2qRtHq6hGc8dJScUuHk9t0YnEN0pIwfR41
	SLMNw1hDwhRCooJ1B077Cd9BlzIDjieXZ5KQlm6GYhubIqAsJCyE5+FfuvkQPZsXpGNG
X-Received: by 2002:a05:600c:6387:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4ba0234a056mr53477435e9.20.1794328158827;
        Tue, 10 Nov 2026 08:29:18 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:17 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 00/18] Auto-detect BPF fmodret targets
Date: Tue, 10 Nov 2026 16:40:20 +0000
Message-ID: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

v2 -> v3:
   * verifier: accept a range in R0 at exit if all its values are
     allowed. Reason: in between v1 and v2 a change was merged:
     the verifier now joins states, so two allowed constants which
     meet at one exit, like 0 and -1, became a range and the program
     was rejected. (bpf-ci bot)
   * do not tag kfuncs with KF_IMPLICIT_ARGS, because the trampoline
     is built for the prototype without the implicit arguments and
     would not save them. (bpf-ci bot)
   * count and log every function with a shared name (sashiko)
   * fix a comment and rename a variable (bpf-ci bot)
   * simplify code in bpf_scan_ir (bpf-ci bot)
   * bpftool: fix man page (bpf-ci bot)

v1 -> v2: https://lore.kernel.org/bpf/20261109170550.141443-1-a.s.protopopov@gmail.com/
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
 kernel/bpf/verifier.c                         |  151 +++
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
 scripts/llvm-plugins/bpf_scan_ir.cpp          |  363 +++++
 scripts/mod/modpost.c                         |    1 +
 scripts/module.lds.S                          |    5 +
 .../bpftool/Documentation/bpftool-fmodret.rst |  111 ++
 tools/bpf/bpftool/Documentation/bpftool.rst   |    4 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   31 +
 tools/bpf/bpftool/fmodret.c                   |  896 ++++++++++++
 tools/bpf/bpftool/main.c                      |    3 +-
 tools/bpf/bpftool/main.h                      |    1 +
 tools/bpf/resolve_btfids/Build                |    1 +
 tools/bpf/resolve_btfids/fmodret.c            | 1203 +++++++++++++++++
 tools/bpf/resolve_btfids/fmodret.h            |   28 +
 tools/bpf/resolve_btfids/main.c               |  187 ++-
 tools/include/linux/btf_ids.h                 |   24 +-
 tools/objtool/check.c                         |    1 +
 tools/testing/selftests/bpf/Makefile          |    2 +-
 tools/testing/selftests/bpf/config            |    2 +
 .../selftests/bpf/prog_tests/fmodret_retval.c |  211 +++
 .../selftests/bpf/prog_tests/fmodret_tags.c   |  155 +++
 .../selftests/bpf/progs/fmodret_retval.c      |  254 ++++
 .../selftests/bpf/progs/fmodret_retval_ext.c  |   55 +
 .../selftests/bpf/progs/fsession_test.c       |    2 +
 .../bpf/progs/get_func_ip_fsession_test.c     |    2 +
 .../selftests/bpf/progs/tracing_multi_check.c |    2 +-
 .../testing/selftests/bpf/test_kmods/Makefile |   15 +-
 .../bpf/test_kmods/bpf_test_retval_main.c     |   12 +
 .../selftests/bpf/test_kmods/bpf_testmod.c    |   11 +-
 .../bpf/test_kmods/bpf_testmod_retval.c       |  328 +++++
 .../test_kmods/bpf_testmod_retval_strong.c    |   28 +
 58 files changed, 4353 insertions(+), 82 deletions(-)
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

