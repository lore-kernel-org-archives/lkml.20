Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F836E48C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476000; cv=none; b=UuiO5ItDnN5undxEkBHvYL6/FzfdlrNxpHimPnK+9Z2sSuSkQqENPb7oYaK5Ulfwdfx6G1wyHH/e+YJTUr4moOsAqcLQ7IpUPsRU1Fu5nobVWmIN+sRVv0CTJ9OF4lWomxn1C1Lzt46hHvuqFROXc5PiAKndns67zoMHTse8haM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476000; c=relaxed/simple;
	bh=IhNLbauZGI/2fBL2LuFC8mj6FtPAx5+odJC5SAlbv3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIIgWtXZFAtO7HqVBBI63H3kpMCD2n7IfbGht8cT7Z9PeDBwE2C4qS/uhStz7DzodJbESZsUnSt/Np8eD270hFYT7oCOQd2D00J1oQB8dyn6+Ap5GvKgGbjjCdKtQ40XIZhamQrdpKXonFDOy/lERUPa8965+lKCrTm3UykjREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h80aqEyc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h80aqEyc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so23363915e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475997; x=1792080797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2FZLNMG+7qodCzojxRqRtcJYLMEEmZppl93FJZkKgg=;
        b=h80aqEycU+BdOhwGBLoUuDnlF1KbMry6ESQLDKmVaEJd7lAI2pMz7eIW2Ui1ibshhU
         sCC+WBsZ46PZ3uE/NxaQswmHQfKS1bKCs9K4Q9QA9QY+WbDfUQhFh6nF+XmnQrldt44s
         UEg7GjhbzNTSPI22xR79PpCgzp+w9OSwX1Fho7/XwpRWec2Mzf/8S4gJcM0ZetIFtdQM
         0qZXc5E2GEd/k1MfTblb5n4PPZvJ3vPxaD6RdZCvfF2ZmRJH+nUMhUgQkC+hCCeMh8eG
         CoWu1oxAEA+h1M9B3iSrKtAOUBOjN0yo2HoCDdnFDqvyh01ly/oydjKEChgGBVCa+myb
         DoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475997; x=1792080797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2FZLNMG+7qodCzojxRqRtcJYLMEEmZppl93FJZkKgg=;
        b=f7xwyDHoMhDDB4R61jIFDXEcQvNMpOfIXszkCISmxS07lnDkM1FvVxgYGOvIzRNoaZ
         er0JQdCx/RwyllPI9BXoAEK6Rk5ID1Sgs2Qu9EaNc1TJQNJ1nc1/kbPckl6RWe6QhqQJ
         DWmb81PAfhNo52lX41ImD4JHZ1DrOqGPzO7KR3z5/jwKBuWMtTzxT8cdFeEXMw6QLDKw
         8WesCf5iwcO5AXM+XOJ8N6+/I1u2AB6sheGuqMS9MUALhfRPe5e8iZHdripBZEf7SLR0
         fYFC15IM2codOAWNa4xq3Q3OPpVZJ/4HhVDvQ5EkGmGedcBro40vGxJO8aM9DNcCYhMR
         864w==
X-Forwarded-Encrypted: i=1; AKwUvBw8Pmr22Xu6b2xuyGTfBU8Ixx+wwTI5gTCaZ6F4HMpbbFg0VvAC17iTXiiBcW4zVuYy7/WGqgdhbCLMcx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nFr3QyHPnLWvfYmn5Uzyco4FrlLSD7eaBLwoPnKqu58MAS3JM5
	O41SXUoQyBtlMJGgOXf6Uezi3h6ZVp/udl78fVjOz6KNhUzN6eQN7NsU
X-Gm-Gg: AYBFou3ECSszzlhHrKxeJlwXiS56YyzSgvFmpU25nS04/RuZWOe8lJd+tjx1P1v3+Xz
	1XtMYXfM4mE2q1FHk751E8Mh49J0Qnf1fFH5Im2X0q1gGHWl0BCfSCZhYFlQr/e5oBaA0mxZUIy
	VliN3aPKTMYMLaERgAKsW1ar6X3UPShBHiMM8Mloz/hZq/m3SZ/m4cYAdPDcFdcV2imN16KUFX1
	1aiWiFFAESUe7DK1AsvcmYSeKKPsjlJDmes8hRBpFmDnfZwMUNu1qoj5T21ruflpuKJEnEUnQlb
	Ye6ZNAYW8MNqiXf8iEDmJfxozfCl5K+Xc1/DoH2yjbncTmBd8mX4YWv3XXbCTh5pFfYXSTyzwkF
	H1AI+TqoN1gCyKxky/JeM9tvmKvI+uLfshRJ3PISnRcdeER3k/SCWYC3ZRbEw47ON0HLSapFjSd
	Q5Lrk7OpP/7EJka9aWDkiAh3EVldFUl4VoMgyyULJVhzEBZFOpynQBmM19gR7ky+UgyFfL9y0nq
	71pfEZQSYWz0RFcNgua5KNbmVnPgSKWiXFkDA==
X-Received: by 2002:a05:600c:4688:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18042a422mr109945825e9.22.1791475996918;
        Thu, 08 Oct 2026 09:13:16 -0700 (PDT)
Received: from MacBookAir.home.tenber.ge ([2a00:6020:a725:dc00:95bf:d5d1:d7d8:747f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db63401desm448005f8f.0.2026.10.08.09.13.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 09:13:15 -0700 (PDT)
From: Jan-Gerd Tenberge <janten@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	kuniyu@google.com,
	willemb@google.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 0/2] bpf: Fix iterator link update target validation
Date: Thu,  8 Oct 2026 18:13:07 +0200
Message-ID: <20261008161309.8179-1-janten@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF iterator link creation validates constraints that depend on both the
program and the selected target. BPF_LINK_UPDATE only compares program
type, expected attach type, and attach BTF ID, allowing those checks to be
bypassed by attaching a compatible program first and replacing it later.

Runtime testing in disposable QEMU guests confirmed that the resulting
out-of-bounds access can reach kernel-owned metadata of a separately
allocated live map and cause a deterministic kernel panic. Corrupting a
victim map's refcount caused it to be freed while a verified BPF program
retained a reference. A same-size replacement reused the slab slot, and
the live program read the replacement's marker through its stale map
pointer. A separate test obtained a selected-address eight-byte kernel
read by changing the victim to another valid in-kernel operations table.
These tests did not demonstrate code execution or privilege escalation.
The UAF/read tests and the identity-boundary tests were separate; no single
combined exploit was demonstrated.

In a split-UID test, a UID-1001 process with CAP_BPF and CAP_PERFMON, but
neither CAP_SYS_ADMIN nor CAP_SYS_PTRACE, corrupted a UID-1000-owned map
without possessing its FD. BPF_MAP_GET_FD_BY_ID and pidfd_getfd both
returned EPERM. In another test, a child user namespace mapped to host UID
1000 and given an administrator-delegated BPF token triggered a host kernel
panic; tokenless tracing-program load returned EPERM. There is no
demonstrated default-unprivileged trigger.

Patch 1 reruns both target-specific validation and the iterator
sleepability check before replacing the link's program. Patch 2 covers
rejected array and socket-storage value accesses, a rejected sleepable
hash program, preservation of the old program after a failed update, and
a valid update.

The flaw was introduced by commit d6c4503cc296 ("bpf: Implement bpf
iterator for hash maps") and remains present in bpf.git at ff47652a4b66
and bpf-next at e1d84a37cba9. A patched ff47652a4b66-based kernel rejected
the invalid updates with -EACCES before the programs could execute.

Source reproducers, build-specific layout details, and exploitability logs
are available privately to maintainers on request. They are intentionally
not included in this public posting under the kernel's guidance for bugs
found with AI assistance. The public regression tests do not execute an
out-of-bounds access.

Testing performed:

  - Reproduced the bypass, cross-object metadata corruption, kernel panic,
    stale-reference reuse, and selected-address read on Debian Linux
    7.2.9+deb14-amd64 under isolated QEMU.
  - Built bpf_iter.o, map_iter.o, bpf_sk_storage.o, and sock_map.o with
    W=1.
  - Built the affected BPF selftest objects and skeletons with clang 19.
  - Compiled the bpf_iter host selftest with -Wall -Werror.
  - Passed git diff --check and checkpatch.pl --strict --no-signoff.
  - Verified that the series applies to bpf-next e1d84a37cba9.
  - Booted the patched ff47652a4b66-based kernel with vmlinux BTF under
    QEMU and confirmed that invalid updates return -EACCES.

An LLM assisted with discovery, analysis, fix implementation, test
development, and review.

Given the memory-safety impact and the Fixes tag, please consider patch 1
for applicable stable trees.

Jan-Gerd Tenberge (2):
  bpf: Revalidate iterator programs on link update
  selftests/bpf: Test iterator link target validation

 include/linux/bpf.h                           |  3 +
 kernel/bpf/bpf_iter.c                         | 15 +++++
 kernel/bpf/map_iter.c                         | 58 +++++++++++--------
 net/core/bpf_sk_storage.c                     | 24 +++++---
 net/core/sock_map.c                           | 26 ++++++---
 .../selftests/bpf/prog_tests/bpf_iter.c       | 34 ++++++++++-
 .../bpf/progs/bpf_iter_bpf_array_map.c        | 17 ++++++
 7 files changed, 136 insertions(+), 41 deletions(-)


base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
-- 
2.54.0 (Apple Git-157)

