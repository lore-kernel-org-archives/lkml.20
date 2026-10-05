Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C8A31D730
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231029; cv=none; b=ZRdxC/NTe9ZXhWSryVkshXG6OsarqgHK4z57zAOxGxAWPAVmIQTRaF8b8leV5En6TmWJVjg53fBKi+2EO+P4P2hyuE6GO6uBiZrIwV3ZH1NAUfatsCdX0g8FLCyoC89fUgrGeKFboK0FPqWny/fi3Ux3w6MZ9+cih2tiH8pwlhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231029; c=relaxed/simple;
	bh=UpAx9mLMIpL3rMBCNwzW5Dq33W6KjPFsFmFYIjlffmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNhgHq3OPkehvUWbVsdUcq9e7VkhNweuoToxTD9dDy0gVLLeEAjLuSnbIjlZcT5SVJSaQMN6IJs1VVMurxq9MCMtAVsI+avNJey9GtqFVNN8JFUcDOzCGBpuSvNXwet/pVy6IkWU7/U24Xw0Bt3zhtzfTyC9cFYEiGKW/koLqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=DQqDnFr5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="DQqDnFr5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5351d76e1baso13279651cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1791231025; x=1791835825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ooRBrlgG/+LZ8y1btseMmgSzmfpeb0S+Qh8lEsQpK0=;
        b=DQqDnFr52RXFZp45HmrNUBkycqnJbXlyrZZEvStaXLSTg5/xciMn0488fPNTEPUBZg
         VQ1qcLyLtET7q8MpcG3pMU5QdVlTRqrtt7QIrTbOHzyl5Minxu9MwGRdPWu0eYxAj97J
         dzmOqF5FsbUwDDHQi4ddLPRcXHrnPkc9tt/idfr7mWYPc1pz77eQYmkqp8HzKdoGuCQL
         mXbnSyHuuennKBLysLyd2CZYQ8rw9JWaM/KFe2pGv6qp+l9XOpHm08kSgP4/lAEa9nuw
         1vDmGnvcZcZcsGj9k/zWLrMxpTWQL6xVwDV8lhXmMFXQe5FGm8szhdZt/ds8njV8Zsxh
         AjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231025; x=1791835825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ooRBrlgG/+LZ8y1btseMmgSzmfpeb0S+Qh8lEsQpK0=;
        b=P6tJar4sQAyKkMJCOk5NDNXGKdyzFRJWzaOahXj6rTU3qwDVE+XHf5sC7qHYlnWKt+
         sawJ2aUQQVeFOhuciOaHIFLCDvT4c+NeIbG9Z+kuYMwFC8tSrMn/nnb8DSawFWbXiqOe
         +am84qbJmn5aBhbX9bmPdFLbMWwlz6y+3DjV9N8QQ10Mj7fKoW1x1CJy6EbgywwxfW3W
         s/6ND46ONI/0ntkB23b8x7JrhYzIxvFBB02XTR8WTWfTTUh161C3f4Zh+Ikv8hKobKEQ
         hDPL66g8vYEKZVj1CwWrpiq752yDdONEDfajGBpPUWhG2MrY1/0lQW5V3yne1nnNy95l
         k88Q==
X-Forwarded-Encrypted: i=1; AKwUvByTz/5lkHNymS10s890n0M8tApJhgTPqN4cLQDDkkbkn/BiawbBCbjS+X+aow5Bb+VMbh+FO96I2aky4pY=@vger.kernel.org
X-Gm-Message-State: AFuF++nBkaTb8dNP4TGKZwGSYoKvMUC121u1yL8XWHlTtyLfCrDs5jY2
	DU/acDzprYLI5gyxkAp9IHOl5ETLydAYdB5Rry7CzvzidgoFVAVsfmRf5a/myJpoRA==
X-Gm-Gg: AYBFou31bpvZAjRTclL4gsN4akxvkpzCbSO6wp3oLHgNmlC1318oLQupIMnBCS4+GTm
	mm5JTmcmWBRzUBacXLCNzLvl7oew8WV1oiwaGLKJvTydkhV7EEv7mttGtJ/y8KO6zgFcruoPoAJ
	9987j61B3gJVHrB4jDaMsTqADivwSRxxo2midSD43fpnx9SylhGQJuJuf5957pzsT+xMVno5VAm
	R/C3mKG+JlwsfWYXSVW//4rf7w8F5Ii1RsYbeFdAkeCWeObXKjbK43JZ2ceemanTxtuFSuQ5JKz
	Z5SsZLgEGPXwy3eggtNr4hjprH8Q+ID3URNt5ef/TitcTKXMmtzwp01N2Th3pPN+t6pbBwHtnXT
	j2ICLJ/tSROdgoEGq2j++Vg6xGBRB/WIOpFEyZd/U7k+GIOg8OQtIBLt49EwuohfgVUYXVJthQX
	4j/WzdpM3jl6XAyVtlQ+xiKcRG8gM1N5XfncHyHG/QGp4HAT2KVSFpdl2KDzv2i1pMIljSZuxFn
	l9I8wrjjRAbkFUquRShrBY8/fA9Alyba0SsX6fnoxfclWhRyViI6H7cgKAOi+1Fwec=
X-Received: by 2002:a05:622a:260e:b0:533:8dbc:1fb5 with SMTP id d75a77b69052e-5353f2018ddmr13658111cf.4.1791231024971;
        Mon, 05 Oct 2026 13:10:24 -0700 (PDT)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a9c92csm106693991cf.11.2026.10.05.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:10:22 -0700 (PDT)
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
Subject: [PATCH v3 0/3] perf annotate: Data type profiling support for C++ classes and virtual calls
Date: Mon,  5 Oct 2026 16:10:07 -0400
Message-ID: <20261005201010.36493-1-yzhao62@ncsu.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
-- 
2.53.0

