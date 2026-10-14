Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C331D730
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000688; cv=none; b=GdTLkEXoWvb8gON22h14GtsW6Bv2jwX0CqEcBSO+47A7ZHE6CC4ij0He+J4LR8e60qfuJYxsv/dRTmL05+bkMRO+T9ZJoJUvHua7KdKnc4r3UV+j9xCtIyCFnfcTKOTxfM3hhwqqJT/2PKb6oFxV4Ty+CKJSbpC1E54i0LbpuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000688; c=relaxed/simple;
	bh=FBmwn916LLSSRyJnKsX/civGmonRB7otzki+K0LJS1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFbn2NnidcFt4dYrFw5hMw+q63SVbTueRJ1xhMOUnpFgHqwU8GKtwLKm4DgdYsHNNl9XNhpgUwj8i6wRuUEYug7Mgjjs/1NUTro9QvDDBMDh41cZ0IpqREoNZknf3ssksTaJqJdPq85f2b542ZzV4ojeeETM9hb1eWFO+lxt3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fao2PTrQ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fao2PTrQ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e503815adso309608085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000685; x=1792605485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbfLgUW9jzchO6/pfPCWGcSWUMfF0/SvwGcRabdT2ZQ=;
        b=fao2PTrQIGOZZDrGj0BIAoz7Dd0wBLVLC94ArSJGwbDPL8S6jFudHQzHh++jh6TAB8
         nO6VSD/LRCiVd+iY+RkhpMRunVWbpfPUTVUgyzchCAwyLI7hKgqVwEgmZ0cijLTdVnNH
         KnPRzXA8oVuUOH/8TXjyH3tVfZyOwlvq2T7XU+28/ruQ4ZocZvnHEGdQJb+XOvjCzlQf
         aXM9cTPk0LN+oKc5DTDeqbdHGq5fM3B3RZXUuCr5YPBCz42DsEFKzX/d4WNfhlneI6a3
         KY23ub7yTLpjguOufRZQj75RPTorF8cFhf2hB3rBFsdSBDACCfC7aCyTi5Vq778Gaz20
         gcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000685; x=1792605485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbfLgUW9jzchO6/pfPCWGcSWUMfF0/SvwGcRabdT2ZQ=;
        b=vGy21kXls2YyH0o6NXCJU34O17eCxbMkjMSNAGuNFroIdcgcl/0mz2gppcyCMSPbkA
         gtJmGfJH6UdnRZRUI0C9M1oXV3ZIG7W6vBpkFck0BlOD91ScSykyhLDiEGiZzSZLaoq3
         VcSrlf2MNfI8X9kTTFERuennUVxaFQEhNmb+jWT8yBnKHG6EcOAHvfZizRAK22auozZo
         6Omb/7bOro3m9OWm5mDjUcKQplK0NhP0YN0WgX9VZee4rDdePCJxrV7MftzsgQhJKY6R
         etzadIsbmU9NOD1uYOadzwRHaY+QFRtRki3pxsfHA91hsemU/YQvmf+gFDN9PcxdPQpe
         /ogw==
X-Gm-Message-State: AFq9FYJp8unKiVC71BmHbwq0e8uoBzG/7mYBCpn9F0GLsRz0A+jdOvK7
	UXBUG4P40KsR27GkKNO7qP38QvY2xj5b23QOsnvmapkBwlzl44GGqkA2HryA9NshsWw=
X-Gm-Gg: AYBFou2R2xBNs/ST8M0NlZzbWgKr3IpBC+HuRdTEV35Drc+hlScLWGna7Ozn8wJJeTh
	Jqn9Wq/3FC75RqEww0FbmFGe1NYtSVS/uIwUPrt8lJcsiWC3tHS+jivDbHVYGlpE5DGi9XZVkIo
	iVaTFb9eJwFc0s7aBShIMX6FCw2vDcQfjgqqdH6/YSzbKP0AMmvWFW0TIbuqhqyVErkivC+RBxi
	sfUkroxoyYT3giz9B1Y47pwG6GCiBCkT7a3tMVCq/dB/HnsQ3aBw97H2C9YpV3STD8dffJ8iLII
	c1o9dNHmfmX9Nzliq213lZup8tA8A8qX8HMvDiul61Bd2Xc47dZkJR9uKEaibpqhQyp6OD1mUrN
	oUNbQwYd7VbWynpED1BAVPPoKG26kF1DHgJTNVRaXktJib6+ffoRvw7GpVJi4oRITlYqN0EUB48
	FEcBAoTQlZLIjh+v85wv+YppgJkjlmgUADGyHV0ZGTKFXK6NaBgFvKcEIQY59v/gBTkgSlpByk0
	sPM47Bbk4qvUTL8scoZYzQGTyRl6QbZ2u9VF6+e9TwbAKbYtTg7buPhLZD56qFYtYjNi+I=
X-Received: by 2002:a05:620a:4591:b0:939:6dfa:48fd with SMTP id af79cd13be357-93ebd23398emr2633773185a.51.1792000684921;
        Wed, 14 Oct 2026 10:58:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:04 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 0/8] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
Date: Wed, 14 Oct 2026 13:57:48 -0400
Message-ID: <20261014175756.2035176-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD and MADV_PAGEOUT share a page-table walker in mm/madvise.c
that handles ordinary PTEs, PTE-mapped large folios and huge PMDs.
Existing selftests cover little of its range, folio and permission
handling.

The walker has needed several fixes recently, and it's clear we need
to refactor this walker to make it maintainable.  Ahead of that, lets
add some selftests to at least cover contractual behaviors.

This series adds tools/testing/selftests/mm/madvise.c to test only
behaviors userspace can rely on, so that it stays valid across changes
to the walker's implementation.

Each patch adds one group of tests, simplest first:

  1. MADV_COLD skips PTE holes and swapped pages.
     both hints reject locked VMAs
  2. the same hole and swap checks for MADV_PAGEOUT
  3. zero-length, unaligned and partly unmapped ranges
  4. hugetlb VMAs are rejected
  5. shared file, shared anonymous and SHM_LOCK'd memory is preserved
  6. whole and partly advised THPs, including that MADV_PAGEOUT never
     reclaims pages outside the advised range
  7. the file permission rule in can_do_file_pageout()
  8. the same rule for large file folios mapped by a PMD or by PTEs

Tests that need root, swap, THPs or hugetlb pages skip when those are
unavailable, and tests that need a page to be reclaimed skip when reclaim
does not happen. Where a skip would hide the bug a test looks for, it first
checks with a control page that reclaim works at all.

All 24 tests pass over three consecutive runs, with no skips and no
warnings in dmesg, as root in a virtme-ng guest with 4 CPUs, two NUMA
nodes, a 2G swap disk, 16 hugetlb pages, THP set to always,
CONFIG_DEBUG_VM and CONFIG_PROVE_LOCKING.

Run unprivileged on a host with swap, 18 pass and 6 skip:
  - 5 need root
  - 1 needs reserved hugetlb pages

original set: https://lore.kernel.org/linux-mm/20260922235830.2350770-2-gourry@gourry.net/

Gregory Price (Meta) (8):
  selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
  selftests/mm: check that MADV_PAGEOUT skips holes and swapped pages
  selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared
    memory
  selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
  selftests/mm: check MADV_PAGEOUT file permissions
  selftests/mm: check that unauthorized MADV_PAGEOUT skips large file
    folios

 tools/testing/selftests/mm/Makefile        |   2 +
 tools/testing/selftests/mm/ksft_madvise.sh |   4 +
 tools/testing/selftests/mm/madvise.c       | 846 +++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh  |   5 +
 tools/testing/selftests/mm/vm_util.h       |   1 +
 5 files changed, 858 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madvise.sh
 create mode 100644 tools/testing/selftests/mm/madvise.c

-- 
2.56.0

