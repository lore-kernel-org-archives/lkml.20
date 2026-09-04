Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40983ACA5F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519470; cv=none; b=ormyMBNHyq909q5OczdLQQvCQrgGlwfv9cL/VS1A4Up0yx06kNuPcXVkQD4uY8rBrCKOBbMXqYb3zgICqnk3B6igroy+MNN8Cpr2zYQ4+4pGnA4PvAzeGJiiyT9meOt51uMKHGnNvw/yIGjbo7aNwF0vlDDbURbLbkIDSmKjhfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519470; c=relaxed/simple;
	bh=I/ptyJ/YxB171w9gZqDl4SamLak1DZrkayz6Na0f37s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTi3caqMxbVkv49dSl450hGSAhP21GZNnsDYoNwjQ8EQawOcrAFqf4LuIzo4shujUCWbhTsOZwPH0P1rMO/jcR5hiW6WWMCO6xUb4KULZiMSXbjU8hH4sIQ/Oyeb64UP/j8WGWc2Skr1Fwh+7kjed4Cqje8DAJBmofS/iTXGd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEKMbgq2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEKMbgq2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so890234a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519468; x=1789124268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSICyMswvhjSa9kIiRAEFAE0EJcTXK8dXdxSnZUf4pA=;
        b=lEKMbgq2OtnX/ZUYRdDcYoYn1UqHIMg6J7kGmBtCox47a1S3UQEEKvj1Rj2Y0qHzPi
         cXl5NVJbv51jIhB7pQBHivbOJB7X7NSr2Es8JjRx39QXvjcAsfdQWdal6FQnBYW8527E
         I/NSWr1spoku3hOaJLz3U6qsFpTuuaZbWXMtbtWi/VTDlAvPxP8KvKmQD8oHXFz1nsJS
         P0TTc+cr/HJ3joRSjctZpMConl1gkgR8i3bfZQggizj/XrTqTqZaADr8xOBFlacwdbNr
         luf+aXCZM4j2YvwOzx4w5pMbf6nK8aBALDSg+VNH3BKxx/L/FNTYGOC1apNt65osyF4B
         gCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519468; x=1789124268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSICyMswvhjSa9kIiRAEFAE0EJcTXK8dXdxSnZUf4pA=;
        b=LaRhyoUKLM1TtL8bT/rU1EmwkmdgzepuzqQQTLDMuZvoPrKD8yq3SJa/KAFyxkE1Hr
         1lc+kOBDym48PGCfFa5pkbd7/WBDDZp1t6naeD9h7J8C+2mhhfy180gat36pdPyUAR7U
         SkuGmE2jdPa8HrMEF6yHfWRMeZsLMk2gcKShuFRGg52KXWQtHDYQwhlC6m1xS1EjryJF
         sqmlmwC1B77RwgJYd6PKndsqs6Kxwh289juKoj6wGJx/yQCss4Rgq5Ui+Vj+/i/+oQNT
         Rrp2KnNjG3/P4uHHR/meDCWQNK5UZ6IRLdF2Nmc8IZvITf8pusi25u6mbeDjqFp+yGzl
         frvw==
X-Gm-Message-State: AFuF++nzAG+9ggN/PkwRA6hm2cOJEZ7Fgu/4K2rLED+lChX3jXu2n/2m
	1Tf3KRGVYDgqV/W6k51otu4ZuFUNKoyg96Ib4iI2Io8IrlsONslibMFkK9ALDLnCeCg=
X-Gm-Gg: AYBFou382mpEn/2dwlqPKGmWhgdjGa71UUqutu351iAQz2m/A3hkVX5Rp/1FHL5MnfN
	B1X5R4VEJVXuamRG3HmvLoSUphtIDelGBxPU8lIcU/k1HAbi/h2SoZ3JBf8tQjvkDOjp52m0AyK
	OB3+DQ0S3x+7t3oykHTTwgjkf/06l02Vtu1wJ79+RqIi0Im//1rP8QP3c7l4RM7exSz07+8IXqO
	f2V2E0hNh+nS1xEtKgWzMKM3NMCU9v4TcsXHzj80jQWZzRDg7u1dxN8z6z+CK/AUc+Hbt4oL4d8
	BFVvoTKv7SrOKDFd/8mOE1TA2purM7jxgSUBkKjM8v9e7ezg8tJ6o3TUj+UfTa3+I1tn6lkds1v
	OtY3D4DkDyhtOsjIWEBw8UPdNL6mk1gilUTzSHjUl0mBx3+JnY8xnt31YgZg8L1mvRAmwoHjR5z
	bRQt0/+BAU1ujMkeBHe40kumUUV2mVQCc5FQkT6loD3DT0AqViBnl1/p1xtvvjZ6fdySCvWvOQc
	cvLIgLJaUJrqzbia9uMGFX2qyg=
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr8379476a91.20.1788519467893;
        Fri, 04 Sep 2026 03:57:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 0/7] selftests: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:27:30 +0530
Message-ID: <20260904105743.39799-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 7 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (7):
  ARM: net: fix typo "arithmatic" in comment
  bpf: fix typos in comments
  powerpc: net: fix typo "upto" in comments
  selftests: bpf: fix typos in comments
  sparc: net: fix typo "evalute" in comment
  tools/lib: fix typos in comments
  selftests: bpf: fix repeated words in comments

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 kernel/bpf/stream.c                                          | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.48.1

