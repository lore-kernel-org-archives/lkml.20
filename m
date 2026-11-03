Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721461;
	b=R8a6voYouaEaITuHvq7Z1YCbL9to+pkd2F3f6uuNJLw32umkXZtsgVw/IExqhor+w7bJ
	 VBIGMbO79idwNChl3OJP7tTy7NJIbFto6T22eosTzPKO28mVt60ligwmhB6ggJbLsl7Vv
	 kuV5Bs+JAsIzFezTd/Gqfj8b3wt1vmv3qBRcbMzW/oNlwZ6BEWn50mkan4LaywtmMZRkW
	 zKEMfR6QKPDccfLLu4ItZ70K74PFyd7xKaRxYBySJmOP5Jz24rCUj40IhJaUGcwMowfHn
	 ivFpzRwz5iIGEUX4dy3bO12RGvBr0PxtgGSrgDFp8l+dVJgu8bDxWQ2ElvpTW1TYDVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=usxHPrZdfM3KAuRcX8FKBBlof7JsXvlRhoP8QnibfPk=;
	b=1BL0Ns/1U+Xal3/VRHFSH1lxo8me7yur6aM2IwiJADfySf1Uy1DOEjMVbkBG8FxfZLVA
	 FV9qduosHwrJ/SAb/pTs2uIe263EXt0YrNTc8SDmUScFG8fbC9gDVJEUFVF71jXrWZJmS
	 NKyZ9DhnQRVRbEMypV51VMcRsbHHnAcwcimLiq4HoWYIg19Q9mlm7a5R4M+a9P4wrXORt
	 3eAGXPtAfNxDOTbDq62EIFf2eiS5KBS/uvF3Ncvx37YaRfOiIxW+dmKg6cUBYmcHglIb1
	 fabIHdTxQ0iSkBO4XIkEDQa45Nq0dJZIkS1L/fjvZWoo6Ue+Xf+GlDGy0uP0Lnwmw6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ncsu.edu;
	spf=pass smtp.mailfrom=ncsu.edu;
	dkim=pass header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=bjNJasTP;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C4660A2637
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C4660A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=bjNJasTP
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1e5d7450so396415885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1793721458; x=1794326258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=usxHPrZdfM3KAuRcX8FKBBlof7JsXvlRhoP8QnibfPk=;
        b=bjNJasTP507BjciDdMAOwPw9RBH6Ndc+fsd6Hr9SJKo1bbU2O2is/NDO69cPKKBcNq
         atwdHwoVz5IPWYP41G23ZNqxvwy0kXN7uzD06LkFZIHQP5OqHT8aHRT1IvjZd9CzLE6W
         TbvAP0x+QB26J0ZSXzrNaUc5pfEBNpLZZk4YTUu6nIewyylF68HiaFmSN/RFhNe8ZgOV
         D4ShuXMroL8gjSdWWxP1HUpUS2cSZI8aYwe6wFLaStW4dz0DdyReQefUw3Fi1aVCWZiQ
         jHTNmoFEJoxUq9b6doM0Rl2Kexh/+tZWmKtrsOOAUKp8ASrQtJS7MkrzQM3cu1tQckWq
         PT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721458; x=1794326258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usxHPrZdfM3KAuRcX8FKBBlof7JsXvlRhoP8QnibfPk=;
        b=R0r3llACE1VnoDzgtgS9vcvggIa7d/0RpoFkXygW8poBH2HokOQtcDS9ZillHfHoFi
         +rNqoZDo0vXteYKBYpbWJHar27TJuaG6GUgiQuK5EHU1n4yAtZqzDT4VOcKMOwU4b/jX
         MvtoUkGeU3AW25CdDlMGUm3jv/HNcN06uEsa3aELOq2IGrJIbuIdUhuB8qlNGNlN3lkC
         eerKRXruUgZspT2uVR3Lf9d2RYNWgIZZ+TWg1x9/HnL4QS2jUOt79kIhnLeTkmEQO6PB
         rYHjl7RdjCemjvEyq2t8juYUsP8A5a6LYmqht+ILvyKJ24QU4ntCVzqSBx5orLeuKvKC
         nO2A==
X-Forwarded-Encrypted: i=1; AKwUvBwllKtARAX0QSo8+3lfGjyKdTg4g3zi6CtaSNFqVOcxb8ONXx1PW+15PNqv5TvnKq6RpwBGcPl9+DMMzYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+wqfGaMFmsfs9KwMOrOn0+SscXpw8BN4Lhl69pL0rc+PQN+Di
	tdgzaeW65TMQKiHsFouTtNTO7BJs03UkL9mf6PK3c/U9oD/1I/ctihoW0dEblt3ABg==
X-Gm-Gg: AYBFou3LCgWz8octWotgewpccZsrTBkb0+Z+esWiYvdMw0wJHgf8zrMFHfJ46CiPdfp
	KGfIhcL2SF6HhOXtNWfowZYWFSUXBojcXf1sosRxu6sGyjq3iuMnCpMbNObCYug3JKdNcvfTQoj
	YV5ohdy4sCadlqQxjEJ7FYzc9Jo2uZy83Ws98N9LErJMJSeiwIpKovgixMdrj7r6NHpq6ECa3QH
	Met45RihfsE3nG1EsmytxlQyrxkMPTHYZ3aIqcBPsmrRZZxfZ3/7gT2aWaEmvvyl32Td58+v5iL
	+ZdDwGCqrQoN3hrCGkGo3Qd3DY0kDjECQ3w14+giZ0YhClZUPl+HRuWhATbJl2byII1FTLxrvYM
	pBgP+nkiW6TTzAHose3rUReB/DMnuKr1iX/TD4C4YFxgCuCItFSlQS29viql6OT/tb/GSeCrP3S
	PW0xsyC4NVqM1KPBcoFUoU2ny447zhsMCLS4Go/GhB5Q9yX8J90ei3dY6EL1mZCby6eW0FLvajB
	D+pBjGaLRysVdyVEaJlUi9BeDK16kyEe43PMg1Vvaktgb2bPLqog9JPol3KK6q3HQXjdhZ8mTj5
	htnt9w/nrJTCpfX189vajRUMYpExo27byxq3Vv0kSVSR5koUagbYIoUovX3quP9kGYIOYi7qzft
	bhZpOBTaVrjkBkmn9sXGmLQ==
X-Received: by 2002:a05:620a:2b43:b0:943:faab:aabe with SMTP id af79cd13be357-94421799619mr2317530085a.62.1793721458176;
        Tue, 03 Nov 2026 07:57:38 -0800 (PST)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm1113191985a.27.2026.11.03.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:57:37 -0800 (PST)
From: Yanbo Zhao <yzhao62@ncsu.edu>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Kan Liang <kan.liang@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Zecheng Li <zli94@ncsu.edu>,
	Xu Liu <xliuprof@google.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yanbo Zhao <yzhao62@ncsu.edu>
Subject: [PATCH v4 0/3] perf annotate: Data type profiling support for C++ classes and virtual calls
Date: Tue,  3 Nov 2026 10:56:47 -0500
Message-ID: <20261103155650.269973-1-yzhao62@ncsu.edu>
X-Mailer: git-send-email 2.53.0
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

Hello,

Data type profiling currently only understands C struct/union types.
For C++ workloads, member accesses through base class subobjects
cannot be resolved, and virtual function calls (indirect calls through
the vtable) lose the return type of the callee: the register holding
the returned value becomes unknown, which matters when it's used
directly to access memory like 'p->next()->val' where no DWARF
variable describes the temporary.

This series extends data type profiling to C++:

Patch 1 introduces die_is_compound_type() covering DW_TAG_class_type
as well and accepts DW_TAG_inheritance in the offset-based member
lookup so that it descends into base class subobjects.  It handles
empty base classes, members placed in the tail padding of a base and
virtual base classes.

Patch 2 adds the DWARF helpers for virtual calls: the vtable slot index
of a virtual function, the virtual function at a slot of a class
(following the primary base class chain), and the class of the vtable
pointer at an offset of a type.

Patch 3 tracks the vtable pointer and the virtual function pointer
loaded from it in the x86 instruction tracking, and resolves the
return type of 'call *N(%reg)' and 'call *%reg' through them.

Tested on x86-64 with GCC 15 (-O2 -g) using small programs covering
single/multiple inheritance, empty base optimization, tail padding
reuse, virtual inheritance, direct calls through the vtable and the
speculatively devirtualized form.  In all cases the access to the
returned pointer after a virtual call is annotated with the right type
and member, e.g.:

  movq    (%rbp), %rax           # data-type: struct Node +0 (_vptr.Node)
  movq    (%rax), %rax
  cmpq    %r14, %rax
  je      0x1240
  movq    %rbp, %rdi
  callq   *%rax
  addq    8(%rax), %r12          # data-type: struct Node +0x8 (val)

The existing results for C code are unchanged and the added cost on
the common path (a pointer dereference) is a tag check on the resolved
member type.

Changes in v4:
- Rebased onto the current perf-tools-next (v7.4-rc1 based) to resolve
  the conflicts with the arm64 instruction tracking series.  Patch 3
  now uses the common invalidate_reg_state() helper and keeps the
  TSR_KIND_CONST / TSR_KIND_GLOBAL_ADDR handling in set_stack_state().
  No functional change.
- Add Reviewed-by from Namhyung.

Changes in v3:
- Rebased onto the current perf-tools-next.

Patch 1:
- No change.

Patch 2:
- Check the value of DW_AT_virtuality instead of its presence (Sashiko,
  Namhyung).
- Bound the base class walks in die_find_virtual_func() and
  die_get_vptr_class() with MAX_TYPE_CHASE (Sashiko, Namhyung).

Patch 3:
- Check !src->multi_regs when loading a function pointer from the
  vtable and when marking a register as the vtable pointer (Sashiko,
  Namhyung).
- Set ops->target.multi_regs in call__parse() so that an indirect call
  with an index register is not resolved by the displacement alone.

The recursion depth limit in __die_find_member_offset_cb() reported
for the patch 1 will be sent as a separate patch on top of this series
as discussed.

Changes in v2:

Patch 1:
- Explain DW_TAG_inheritance with an example DWARF in the commit
  message (Namhyung).
- Skip virtual base classes whose location is a runtime expression
  instead of falling back to offset 0 (Sashiko).
- Match a base class in the offset lookup only if it actually has a
  member at the offset, to handle empty base optimization and tail
  padding reuse where a member of the derived class shares the offset
  with the base (Sashiko).
- Keep looking at the next sibling in fill_member_name() when an
  anonymous child (base class) has nothing at the offset.

Patch 2:
- Drop the non-existent DW_AT_vtable_elem_index and the DW_LANG_*
  fallback macros (Namhyung).
- Drop cu_get_language(), cu_is_cplusplus(), die_get_base_class(),
  die_get_parent() and die_find_member_by_offset() which are not
  needed anymore (Namhyung).
- Document that die_get_vtable_index() returns the vtable slot index
  and that GCC and Clang both emit the index as DW_OP_constu
  (Namhyung, Sashiko).
- Fix die_find_virtual_func() to return the function DIE instead of
  the DW_TAG_inheritance DIE when found in a base class (Sashiko).
- Follow only the primary base class chain in die_find_virtual_func()
  since non-primary bases have their own secondary vtables, and skip
  an empty base at offset 0 which is not the primary base.
- Add die_get_vptr_class() to find the class of the vtable pointer
  through base class subobjects, and die_is_vtbl_ptr_type() to
  identify the vtable pointer by its type ('__vtbl_ptr_type').

Patch 3:
- Remove the receiver ('this' pointer) register update after the call
  which was dead code and not needed, and the arg0_reg field (Sashiko,
  Namhyung).  The 'this' pointer lives in a callee-saved register or
  on the stack across the call and DWARF location lists cover it.
- Handle 'call *%reg' by tracking the function pointer loaded from the
  vtable as TSR_KIND_VFUNC_PTR with its return type (Sashiko).  This
  form is common due to speculative devirtualization by GCC.
- Strip the leading '*' of an indirect call operand in call__parse()
  instead of extract_reg_offset() so that both forms are parsed.
- Ignore void virtual functions instead of aborting (Namhyung).
- Keep the existing pointer dereference branch and its fall-through
  intact; the vtable pointer is detected from the resolved member
  type there instead of a separate lookup before it.
- Treat the new register kinds as pointers when saved to the stack.

v3: https://lore.kernel.org/r/20261005201010.36493-1-yzhao62@ncsu.edu
v2: https://lore.kernel.org/r/20260930210038.196928-1-yzhao62@ncsu.edu
v1: https://lore.kernel.org/r/20260821050207.4517-1-yzhao62@ncsu.edu

Thanks,
Yanbo

Yanbo Zhao (3):
  perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
  perf dwarf-aux: Add C++ vtable helpers
  perf annotate: Resolve C++ virtual function calls in x86 insn tracking

 tools/perf/util/annotate-arch/annotate-x86.c |  77 ++++-
 tools/perf/util/annotate-data.c              |  61 ++--
 tools/perf/util/annotate-data.h              |   4 +
 tools/perf/util/disasm.c                     |   7 +
 tools/perf/util/dwarf-aux.c                  | 282 ++++++++++++++++++-
 tools/perf/util/dwarf-aux.h                  |  21 ++
 6 files changed, 426 insertions(+), 26 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

