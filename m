Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D69175A8B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368183; cv=none; b=dd6UqRaaF07iAoT68vKkDxFwQfJuVKETqQLhYE92V1tZRU/h6oVlA+o0EJKk54yLYc4q8IHqxJK0P6rskyevlnYOCoi2Yso3v/eU9WrOKibVwh/DC7bFnCDSSuywwhQ2+Y4Zl4IjnY71pVInp91+y/s8yL45bR8Zk4RLmKgnCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368183; c=relaxed/simple;
	bh=+7uunGwoy0C1mzqxTjbwB/rALRAuIvFdqqLq1AVKSLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cyutvaI4t/61gYPUcQQGvxNwEUtnXlWFUssymAkcGkzx1cOinB5dEpvDvlekleW03syop32vitnHNbxKtJsMfshAg10ZiyJHwfwqc7R/gYWhYrDB1aVcFrFpqk3QA3QXmQG7eRIAeOUeSnDNmZfUTDT1c/ipkAgVar8XwQIbt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+J0FDO1; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+J0FDO1"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f55a53898cso945723b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368181; x=1792972981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntwCDwHIASzRwaVOgC2xXNZadJNzSVEJMo19avjC2fU=;
        b=o+J0FDO1u4R8/sNvzKNPODjPDyQgROOso1Z9VKGrNxAk/hfDqTqmqi3Vzt1tAdGBdK
         NcfVH5HdKQUrVPb+MrAY6Ngw3Qw0v6jNWTRah6zsaWhUPppZk7xqM0CQGwGS2f0QP9YH
         yLG4WmrIf1jsSir3IlO8Cms5OOJupJUjaW4vW6nUbFzAOBysAe1J29aRDRH7JSmYDiaT
         EmoN0SDoPVkIeJPxbj/kImF8eRX4Who6ld7tcplILLzDvgzbf6xZsRc1AFCpi/Gi9UiG
         ng4ZgNF7Hb7fJ/fj29xnhDfcpHp0qS8CdTCS6D+iJLmcu7xWFSlieUcM4KVKlr5a8Y4S
         BqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368181; x=1792972981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntwCDwHIASzRwaVOgC2xXNZadJNzSVEJMo19avjC2fU=;
        b=hRbsc6RHWngesAitRjxD9jAtyttTXyPPDyS56F4sKrjzzwUV0fIG7Y1tT5h3h/nxIq
         S3K1A5f8mfrqi235VWgWVx1DTY4Dj/MHjd5b0jx/smsUSv/rrbFiomRKkzlg3p69oO0N
         ZS6ytGI9A0ni7gtngx2EpmUuEyUOkqHTd2F5d72YhMAkQF3bpeTzmn7/GgT5HVOKSBSS
         Aeayd662tZ5cXOXdSXqf6q3np0x2V4Ng9qS8f5Y9Tz7i6Ihq8SC3UeKnMW1J3nJAJtIC
         pgsoWF0rE3RRXAENYO8nmmr+YS/4JmdqMRhWrho0vqv5aiy2xvnmYM2wpAZCq0KA6lau
         zDIw==
X-Forwarded-Encrypted: i=1; AKwUvBxMLLMdz2g5eDn+zgPl1oDKrM23gaY6W978a5+LTwXK4GZYpHs0BH/S2S0adwnJmo4LRyLC+3X9QHYq7o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+NTuc1PpqcBdiy+ZK1m9wGma+6IrZUuGMhMzCnv9aDc6rNZjt
	1iGcfalkI3eKSyPztpKRSC3A/ZSaUaBZRFjtNOlNsNyUvpLx04Afny7U
X-Gm-Gg: AYBFou20kRVqiAr7OlPnpCwTPO015sljJWMzjc0rovzgeHAziMs0lv9ykiG8Jb8jOh+
	/X77m+mDoBLshGRcEEPkKMO+bEW3RXm6fZP2Q31cr1NmlQi3rWDRVNHu3/b4ONc+eKxigc32ZR4
	/C58T6Gqt3Romt8ZW7pq4zVW6vfyhF5fBqC224S/xyQt0acsgajN5+r7d47ktPz5D+7pPGpXvtS
	+rocCFMzjdghBsEMkvdxrEJvSEoOrZtjyee0X3wzwMsmXaqDWaTdOTO7qf14tJHZBtoT7Lspm76
	ucc6FTFsrmLaHXN+rQ7gitWkAhWP66N7LNiFP7jYlbVzkfxS7AOXdlNhNoJAanuH0vFnAThxgoo
	iLx4V0pMFgGZ8Rhd0kiwC4jyRff6a3kt5HcdBAumCPHzCU4UiCOdPWYvtf6oO2TqQfVMf1EzeE/
	W68u8MfX6VMwh1atUrmVefaMg37DuVb/YdFCtEWIRTYV+BMesO7neJp1xc3t0JU2kY7OQl0na6x
	xlDWbw35P1o
X-Received: by 2002:a05:6808:509f:b0:4f8:4a95:9b3a with SMTP id 5614622812f47-53ccd3e9167mr5356932b6e.11.1792368181281;
        Sun, 18 Oct 2026 17:03:01 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:00 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 0/5] elf-parse: validate what the host ELF tools read from the file
Date: Sun, 18 Oct 2026 19:02:13 -0500
Message-Id: <20261019000218.3977398-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/elf-parse.c takes the section header table, the section indices and
the symbol table straight out of the file it maps, without checking any of
them against the mapping. All three users -- kallsyms, sorttable and
tracepoint-update -- then index with those values, so a truncated or
corrupted object file makes the tools read outside the mapping, allocate
from a file-supplied count, or divide by zero instead of printing an error.

These are build-time tools fed by the local toolchain, so under
Documentation/process/threat-model.rst this looks like a robustness problem
rather than a vulnerability: reaching it takes a corrupt or hostile object
in the build tree. I am leaving that classification for you to review.

How this was found: the three tools were built with
-fsanitize=address,undefined and driven by a mutational fuzzer that pokes
ELF structure fields (ELF header, section headers, symbol entries) in
otherwise valid objects. Every crash was then reduced to a reproducer that
changes exactly one field of a valid file, which is what each patch quotes.

  1/5  e_type >= 32 shifts by at least the width of int (UB). Hits all three
       tools, and is in mainline as well as -next.
  2/5  nothing checks that the file is long enough for its ELF header, or
       that e_shoff/e_shnum/e_shstrndx describe a table inside the mapping.
       Also mainline.
  3/5  elf_open_ro() resolves a count and a name index through section 0 and
       a string table through sh_link, all unchecked. -next only.
  4/5  a zero sh_entsize divides by zero, and an sh_size past the end of the
       file yields an unbounded symbol count which the caller allocates.
       -next only.
  5/5  st_name is unbounded, so one symbol can point its name anywhere.
       -next only.

Verification, per patch, on the reproducer it quotes and on a valid vmlinux,
a shared object and a .o: every reproducer now prints one line and exits 1,
and the three tools accept the valid objects unchanged. After the series the
fuzzer no longer reaches any of these paths (3420 kallsyms, 2149 sorttable
and 2594 tracepoint-update iterations). gcc -Wall -Wextra is clean on the
changed files, and checkpatch --strict reports nothing except CamelCase
complaints about the standard ELF type names.

What is NOT fixed, and what I could not do:

 - An unaligned symbol-table sh_offset makes elf_symbol() form a misaligned
   Elf_Sym pointer, which UBSan reports at scripts/elf-parse.h:233. Checking
   alignment here would reject legitimate ELF32 objects, whose symbol tables
   need 4-byte alignment while the Elf_Sym union wants 8, so this wants the
   accessors to read unaligned instead. Patch 4/5 says so in its message.
 - Reading e_shoff itself through get_unaligned_le32() is UB on a byte with
   the top bit set. That is a separate bug in
   tools/include/tools/le_byteshift.h which I have a patch pending for
   ("tools/include: fix signed shift overflow in 32-bit unaligned
   accessors"). Until it lands, the e_shoff reproducer in 2/5 stops at the
   byteshift report first; with it applied the behaviour is as described.
 - sorttable.c and tracepoint-update.c read *section* names the same
   unbounded way through the elf_map() path. Both crash, both have a
   one-field reproducer, and both are sent as separate patches to their own
   maintainers rather than buried in this series.
 - The series is based on next-20261002, the newest linux-next I could fetch
   here. Patches 1 and 2 apply to mainline as well.
 - Per Documentation/process/coding-assistants.rst each patch carries an
   Assisted-by tag recording that an LLM found and drafted it, along with
   the sanitizers used. The Signed-off-by is mine: I reviewed the analysis
   and the code.

Leizhen Zhang (5):
  elf-parse: avoid an undefined shift when checking the ELF type
  elf-parse: check that the section header table is inside the file
  elf-parse: check the section indices that elf_open_ro() takes from the
    file
  elf-parse: check the symbol table before walking it
  elf-parse: bound symbol names by the string table

 scripts/elf-parse.c       | 125 +++++++++++++++++++++++++++++++++++---
 scripts/elf-parse.h       |  14 +++++
 scripts/kallsyms-sysmap.c |   4 +-
 3 files changed, 133 insertions(+), 10 deletions(-)

-- 
2.34.1

