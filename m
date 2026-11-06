Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997859;
	b=foeUohdPi8FPyIp2eORce5KbR50EfLxopuPXnhFB8GEl9yxikOyqIW2F9/by5T/Y4txL
	 8iuwyv9NFkC7TzuySb55lHC0XXS7dTVcLzD+X+uUYigzX/XmEUF88IONGxfsCGWtjnXez
	 +75aA29v2L8zlFN3sXqUwlfCSlwXKSAimnTI7wPwWlIETMj1JEpnNBcuFg4wadvFMsV7x
	 hCuf1hRWO9Lmg52z7ZQHfzc1o+Fss8QfnA4yfTCNUoZF3i74+uxaCUizFFHsaS+wC40W/
	 ljdqOogejTn5Aam0Acv90UCvvOST04yRyh3zJMfWP2H59E55eQpnoZEIuVrTqcf4gUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4qyw7RRBNe8rIIEMwp+kIE6yOh8/TuI6F4rxb8lEAX0=;
	b=jvjtLxSB4ITSdSWqb5BOLLayF1w4xDhemm2n2JVhgPXKGDNiOzufgEN7dEWDPMGR4JIE
	 W/HjbZ0etGCLZxqLKPKj1fpC0MRwFlWWjqDrC7hM44mA/pJC+W8FBwkk+AkatRLIyBJMg
	 6aHdJS2zlqPF3BfswKAEu+xUPzqnrdaMCq3vWF2VSE2p2FWeVRCDj8iq4Xtq4dl0IafiO
	 jxydRAmswym4w2BrxBbeLnMfpjp4C5ZnXoXCePJ1iem73SrEKcWRt7/EAu8Uu+UYbMLn4
	 MzSPkLXPqcgltnkiyYsZm8qjuuKUHp9mdqgjmdiJWl16joPp+xponOdU320PRH1nYfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCOJdwqY;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCOJdwqY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7851805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997856; x=1794602656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qyw7RRBNe8rIIEMwp+kIE6yOh8/TuI6F4rxb8lEAX0=;
        b=VCOJdwqYZYcQqQMhqKDE/jyiHvrSPoXC227QkBTI9wEwjZYTTL1SuExQJW6d9uxTO1
         UF412JkC/1QuxlDzXXcXA3DuDJIr+wdiX4LZvTabta254ehY9DT8y5tYq8tzzNEg5NjR
         +v8N9tNHlNYpos0MRleWrifPe0uk8slUoEdqwN9qZ1/pZmj69ljGB8bcsh+Fh3Rp9O8f
         ED5VlXJKhGsVcmuOaxelmWc5yrfWUwmXAs7s23l7D4xa0JZXD8AD6h3T/bDuDDidRHlq
         UbRGedjx0RRgenusIwlQ7wF+TlNFRyLxh+Rwlb3AN3UNZcu4ZiO/P/29SVCuC+nG2m2W
         M2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997856; x=1794602656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qyw7RRBNe8rIIEMwp+kIE6yOh8/TuI6F4rxb8lEAX0=;
        b=ToAQcdi30m/xGJBrBEXwGkUjHGDo2InRzUb7PQsMvJECTUyGzahib9R3bEngs3S3sG
         /8JtFbFlvCUoGAb+q+C0L4tomnu3r2Gc1/lo1nJJDv/IuCMPHx8VyH6bZLQxoSlWW/N0
         NZxQ6Yyu/ou3CZZx8FG3rbDAaK4aqy6se0IXHsiRiihDIYmOSSRUuMicD7+DvVnwYnXT
         lW7U0Q+7S1kWWbKoWkq9ASQvAOoSOASK933MxJOlYgYWkQn6gCGvOa0t5wQfAZkzkyc0
         4Chd/spmiTFF1P5yHyAAEdr7DHn1P0OpEnhrdFfXASaruSudb+mXXlGtsrEM7HLIThu9
         RzXw==
X-Forwarded-Encrypted: i=1; AKwUvByApwP8QX8oMZ4RaLdLQWOHsc97tI3KO3Ea/nwEEQV8XSDpxtTKoH4coZIAp1bn0GGpwFuPnsSa9+6R/fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zk/0BEfxgUJyXk1c0/4xz/7AZWoXMV9+tWYancUct9RZXLhht
	8jR4vkpwz/m/mboYKUnbZLW8t9+UO/y0RzlPwAfG7d2zJlGluAcTf2qgjv0tGw==
X-Gm-Gg: AYBFou1jKGKk+hXq87rXDMR9rZtuuQMVO6ztiOlGtgq/3jbp6LKH2Ev0HmjGYLpmHB9
	pMKphG9aUB51gf3pZG2w8TS0XBzgn9qaDVuZ8u+u1yEqMDRJ8IwRlnYpp3ngPpDI6GqQ9qlYB+6
	qroUOc3sv7HKtJAE0+nkzmSj0gqeMULzf829PUe5qpW3NXeAQWeApumFtfizQldlrVqju2WUA2a
	Obu/56+hahvsEox4CchUfqIAf+IXtMFHOmNmHefCRnALQUoxgVyD9BhioroTh/vNGt8LDssmzM1
	BUutq4SxRfnST0x3JfExnmAuiktG17vUECQYAKgQT8LwzA+GdBAqm20duDej4Mwjf4fUGiI2RxA
	q5WHmO+pjMqmMyvpmYdriNeDF/xNj/s3UZudum3edbfPTgSjVI0H9sXJ+yBb4A00nbzowlDjPfN
	hBcHq9h40mcOj9rY3iMybR5t8Z8ZZxgTHmFklXJsSZ+JdYL0benifdvrJNi48DvwV1h8P7BngSI
	u9gAPijaBRUcNu0LWVyI8Iqq8NxNBeb7KEStAUZaI0jWcOA4VDymJK/Q6uFFvbI2z7YgcR8HNTm
	vc611Pw549Iuof3Anfj8hXtvxEDYiWKNULKw5d1SD5cn1sc=
X-Received: by 2002:a05:600c:1913:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4b6de0ce791mr63628965e9.16.1793997856351;
        Fri, 06 Nov 2026 12:44:16 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm13394705e9.0.2026.11.06.12.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:44:15 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 00/18] Auto-detect BPF fmodret targets
Date: Fri,  6 Nov 2026 20:55:01 +0000
Message-ID: <20261106205523.1765622-1-a.s.protopopov@gmail.com>
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
 kernel/bpf/verifier.c                         |  149 ++
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
 tools/bpf/bpftool/fmodret.c                   |  906 ++++++++++++
 tools/bpf/bpftool/main.c                      |    3 +-
 tools/bpf/bpftool/main.h                      |    1 +
 tools/bpf/resolve_btfids/Build                |    1 +
 tools/bpf/resolve_btfids/fmodret.c            | 1215 +++++++++++++++++
 tools/bpf/resolve_btfids/fmodret.h            |   28 +
 tools/bpf/resolve_btfids/main.c               |  180 ++-
 tools/include/linux/btf_ids.h                 |   24 +-
 tools/objtool/check.c                         |    1 +
 tools/testing/selftests/bpf/config            |    2 +
 .../selftests/bpf/prog_tests/fmodret_retval.c |  205 +++
 .../selftests/bpf/prog_tests/fmodret_tags.c   |  155 +++
 .../selftests/bpf/progs/fmodret_retval.c      |  196 +++
 .../selftests/bpf/progs/fmodret_retval_ext.c  |   44 +
 .../selftests/bpf/progs/fsession_test.c       |    2 +
 .../bpf/progs/get_func_ip_fsession_test.c     |    2 +
 .../selftests/bpf/progs/tracing_multi_check.c |    2 +-
 .../testing/selftests/bpf/test_kmods/Makefile |   11 +-
 .../{bpf_testmod.c => bpf_testmod_main.c}     |   11 +-
 .../bpf/test_kmods/bpf_testmod_retval.c       |  314 +++++
 .../test_kmods/bpf_testmod_retval_strong.c    |   28 +
 56 files changed, 4271 insertions(+), 79 deletions(-)
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
 rename tools/testing/selftests/bpf/test_kmods/{bpf_testmod.c => bpf_testmod_main.c} (99%)
 create mode 100644 tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval.c
 create mode 100644 tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval_strong.c

-- 
2.43.0

