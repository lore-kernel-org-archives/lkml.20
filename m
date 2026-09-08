Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A6509EE0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911779; cv=none; b=HxQkrC7BpgQiATggvoEZxu05SD433tREFysIRks1gyJmQwLOTgPjE0ezodKYbD/6zJikWmJL/k70yjeUk6x5ef5uLOKP0q3dpwsLR/k8fiSgY2HsEvNi4mDIg5Qmr+G4VL+fDuOs9m+5ZXHL/3SWxnbC/jOPI7ZN8XZ1yPzauzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911779; c=relaxed/simple;
	bh=5MxxvCdVgC3YLTJh7XEdP1bYFUpjHnVxjCwGvCeCFF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AvP3LNXs4z5cqL45/37FcnbGHzxe+p/SqDGFuZrLFhbck8nDqxQqpTZ+7hw72WnrrYLpHDOvQ1mxMn+wZ+z8qNsNLv8rXsbsls+rVrKb8iUumBh2jt4xuD+5aBvk6QD9D/zCFrQdUEBPE+YF5k1l5zbyE7NRo0ZASZVCappv8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDd3GtzJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDd3GtzJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so4331462a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911775; x=1789516575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aeaQ8qHK/MyWCciP9ARnOOzHBOTcOWNQ9SeCb5dOpCc=;
        b=JDd3GtzJo1ampPo13lGt2FWKwTeupUuyjiznSutxyH1B//grR6To87GBFZt86ZRVd8
         WEP8ghZO4b1ax/yeiPCToBWaEXWFQMRrqjn5Q7UIC+0EZzZyVY4Ta2ZlaWfGXTnVCx6K
         ghLPhkg1XMrl/HMWDzNDZKnGVgxYPQxOT5kNS+73HRlitL8TFnaHZAlQHK8pLw0fIH0j
         UMgvHwaJuzHNDSxdAQSm31oYwsjEJM17EbR+wyzEMxzWSVQn/rOKW36XxNbyR/2TMo06
         TQJ3spvzMRlYPpdmmlRisluRUz8WXENwNzJYyh84GfQZ47YiHBQZzEqY/FhZzqo3nR4b
         MpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911775; x=1789516575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeaQ8qHK/MyWCciP9ARnOOzHBOTcOWNQ9SeCb5dOpCc=;
        b=JRaFnzER4EzzfJX+mtgClqRCo4ZmvPhVQY4ij1Nd0I9iN761qpgiJ/zRVApD5cj+fn
         PLxIYNVIPADYLK8mnBP0oEWVZR5dISi8QUFDoIFImFpFzC/MzRPFV7X760vdixdtOGF6
         xqxQdWYMSxsOyrTXy+5Gfc65RBbNnvp2rImDUE+B6xTXEFfISas8nUGCcQY1Bk4rfE22
         BtRtFUDk/GaS6Su8Hh2uZvRe9xLJHyL4KVxggbxKDvY4pEk3W1qSTC0lUCUpxXB0ZTs7
         SaRSwGvp2hDMuPAo2FCQdl2Lnlt3IhStEpWWhP5iPtYqT3zzDKkw/m0fiToGnQiF3P4A
         TwhA==
X-Forwarded-Encrypted: i=1; AKwUvByZ3CJV9dsd84glJAca4nr9TaMCMLEG6mRXTZC37rBLzdlnXfP79BtoLQwZGW/wqDjM2HFo8W1FanrAc4o=@vger.kernel.org
X-Gm-Message-State: AFuF++mFTjVxZpaigatOao6WIsmseQQUycCgtTEHrt8LswTVoe2ctPWt
	puJhcqxVUki1EthyZYaJ1NvHYY/QJq0Dmq1TAh9EtSBSEOjtrQl7X5Ff
X-Gm-Gg: AYBFou2guULYD5K64MbTZP+pYN4cHZ0Wqr9aCoL7ZjJGHGcchp5XPpFMVls1WFCPhJf
	a4QnDEsKhSqSFneqB8mJ+xHpSJmafV8avFIxgFzx8CcPUfpf3yXkpmiOU6q8luD3m7IQN2uBaWq
	Tqwc8IWWON3biMpQmMR1OmdV4W1+Tb+p4TMxnZgqH8uZExbv1re1HwRT5Kq4ShD6XRFMMYxH7PN
	IOAv1ImkYeqtvabvf22AbYQxAAqNfVKiAl9cY2p8FAMvHe6q2p0Hs8Xpk60tjraoAJ9m3iNPeSu
	1//v3mPfYb/NnEcSnhRbgWNkdmfHti4ElecJZ22Y1oc9FlibRoegLm5bh1evfz1xzYUA03+XNlA
	jtSNky6uVfBdIR1B1nfQJbUwG5DyHuiQSTdL36XpchmetHlzPAyKTN+zlmQqZQlAWGygeuXVglt
	Fazkqq8gHHo6Twh+5XWcsJb6yXDqSbjGMNUOXjglV2/cSMZK4gSquGKhU=
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr51323684a91.2.1788911775237;
        Tue, 08 Sep 2026 16:56:15 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm36459946c88.14.2026.09.08.16.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:56:14 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ziyang Men <ziyang.meme@gmail.com>,
	kernel-team@meta.com,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] selftests: add shared Makefile for BPF selftests and new memcg test
Date: Tue,  8 Sep 2026 16:55:48 -0700
Message-ID: <20260908235552.2610256-1-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the BPF-related build machinery that is currently
duplicated across selftests/{bpf,sched_ext,hid}/. It adds the shared
tools/testing/selftests/lib.bpf.mk fragment and wires up three consumers,
simplifying both existing BPF selftests and future additions.

The series also adds a cgroup memory-controller selftest that complements
the existing coverage.

Patch 1 adds lib.bpf.mk.

Patch 2 adds selftests/cgroup/test_memcg_stat_cross_cpu, which verifies a
cgroup flush by comparing values read through BPF memcg kfuncs with the
corresponding cgroupfs values. The existing bpf/cgroup_iter_memcg test only
checks whether selected values are non-zero.

Patches 3 and 4 replace the duplicated BPF build machinery in
selftests/{hid,sched_ext} with lib.bpf.mk.

===
Changes since v3:
For shared Makefile:
- Track in-tree libbpf headers directly so a single make invocation rebuilds
  BPF objects and skeletons after a header change.
- Restore the target definitions needed by LoongArch and MIPS cross builds.
- Validate output directories and skeleton suffixes, and reject dotted or
  hyphenated source stems before they reach build and cleanup rules.
- Add stamp tracking for vmlinux.h generation while preserving content-based
  header updates.
- Make skeletons and subskeletons explicit outputs, so a missing subskeleton is
  regenerated and both sets participate in the all target.
- Namespace private variables, expand the caller-visible contract, track a
  supplied VMLINUX_H, and remove unnecessary include search paths.

For cgroup selftest:
- Add CONFIG_BPF_EVENTS and probe every required kfunc plus the sleepable
  cgroup iterator before running.
- Bound CPU fanout, cgroup/process count, and total memory use; skip a case
  when the flush threshold would require more than 256 MiB.
- Check CPU discovery, polling, iterator creation, and BPF errors, with clearer
  diagnostics.
- Compare each BPF statistic against two following memory.stat samples, keeping
  exact equality on a quiet subtree while tolerating values that move between
  the two samples.

For hid and sched_ext:
- Remove unused HID locals instead of suppressing warnings, drop obsolete
  variables and comments, tighten cleanup, and correct the generated-output
  description.

===
Changes since v2:
For shared Makefile:
- Use USERCFLAGS and USERLDFLAGS to extend CFLAGS and LDFLAGS.
- Pass OPT_FLAGS/RELEASE and EXTRA_CFLAGS to the libbpf and bpftool sub-makes.
- Use one rule per BPF source instead of a global vpath that also affected the
  caller's normal %.c rules.
- Take HOSTCC/HOSTLD from lib.mk instead of including Makefile.include, which
  also rewrote the caller's AR, LD, and CFLAGS.
- Report a missing vmlinux from the recipe rather than at parse time, so
  "make clean" still works without BTF.

For cgroup selftest:
- Create one cgroup tree, perform one flush, then read through BPF and
  cgroupfs.
- Use common cgroup helpers such as cg_read_key_long() and values_close().
- Use cpu_set_t rather than manually allocated CPU lists.
- Move test_memcontrol.c's anonymous-memory allocator into cgroup_util.
- Address the remaining review feedback.

===
Changes since v1:
- Generalize lib.bpf.mk for source layouts and suffixes, extra headers and
  flags, skeleton suffixes, subskeletons, and configurable output directories.
- Add patch 3 (hid) and patch 4 (sched_ext), converting those directories to
  the shared fragment.

Ziyang Men (4):
  selftests: add shared lib.bpf.mk to build BPF progs and skeletons
  selftests/cgroup: add memcg_stat_cross_cpu correctness test for flush
  selftests/hid: build the BPF program via the shared lib.bpf.mk
  selftests/sched_ext: build BPF schedulers via the shared lib.bpf.mk

 tools/testing/selftests/cgroup/.gitignore     |   8 +
 tools/testing/selftests/cgroup/Makefile       |  46 ++
 tools/testing/selftests/cgroup/config         |   5 +
 .../selftests/cgroup/lib/cgroup_util.c        |  82 ++
 .../cgroup/lib/include/cgroup_util.h          |   3 +
 .../cgroup/memcg_stat_cross_cpu.bpf.c         |  95 +++
 .../selftests/cgroup/memcg_stat_cross_cpu.h   |  18 +
 .../cgroup/test_memcg_stat_cross_cpu.c        | 755 ++++++++++++++++++
 .../selftests/cgroup/test_memcontrol.c        |  29 +-
 tools/testing/selftests/hid/.gitignore        |   1 +
 tools/testing/selftests/hid/Makefile          | 179 +----
 tools/testing/selftests/hid/progs/hid.c       |   7 +-
 tools/testing/selftests/lib.bpf.mk            | 321 ++++++++
 tools/testing/selftests/sched_ext/Makefile    | 149 +---
 14 files changed, 1382 insertions(+), 316 deletions(-)
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.bpf.c
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.h
 create mode 100644 tools/testing/selftests/cgroup/test_memcg_stat_cross_cpu.c
 create mode 100644 tools/testing/selftests/lib.bpf.mk

-- 
2.53.0-Meta

