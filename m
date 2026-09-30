Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F34344D99
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802057; cv=none; b=fALLbzynGUFTO3ck+SS5kCMpJSxsOK3ZHzKURiI8ZMUe/XTCa2Gideo92Ipyac1cktsRWDokUZ5sy+LAun7PLYorUwUpRFkazC8gdcmJUzfBk0nCg+0R72W43F6puWklnkmtUggoVBpv6tiqIQ0H8TIIXGxR6MnCuWRVb0rcsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802057; c=relaxed/simple;
	bh=Nt2Zt2tAorHSDhzt5C55ZPuqJBlHslyhuetXMrZ/IPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUaD6HEAog1ka3oWvhMg1SQIEvevr5A3gvbl+k8A7kDrhY+vztUlhFeoVJRfhQjqbAK1OwzV4svTKGg7iZ0NQFo7F4gxWkvbwxmqrMtou5eDDbaQ6dnrLJZIODmCM42CNs2mF9gcEQrbPniiC+CD6lHBNKJmsVvTWx+6tyPz2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=aT7Mnlsa; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="aT7Mnlsa"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93cb88344aeso6998485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1790802053; x=1791406853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0AJ+oQEBC5GzEDlhFKDUyUWhaXmDQG+4qYkmuNuAgo=;
        b=aT7MnlsauLxbVoBA/dkIIIZdv4z3apw09/zfQLNS5UDQAtnh88MmiuplJAyxgZjYOo
         E0yFw0DMUK1bIdrAiwKd+Lqk8rqzhztaVmee97I7M0e+QulzHHPEOCxLBFYlLhBEi+5W
         xqo1b8aOAVFi03/quxrhus0a4mVLU4Nd7LJ4W/dWJE1PEpv/z01ccr+qly47+by3I17i
         Muaew6oUT//juqXADg5gMIJQySfF1lV+Uu13qTb64aFcV8Stl25QmTpa5ZoY57tU8dcc
         r+2aQ3sR3cu2szkM4aqotVE/MvG559FM66KKPvQJOu1gbwGnzgRJjhh29hm5LbbplqqK
         abJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790802053; x=1791406853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0AJ+oQEBC5GzEDlhFKDUyUWhaXmDQG+4qYkmuNuAgo=;
        b=SXBrE5ozZSaUN7h9UC7lEKTmW1fu5TJmw6aVsmX+n5t/Y6o+NezLHpfZgs2CXLjkfN
         NiVKOoYwy//05t9jv7Lac2+e6j0DgyNCPl6XB4zvG+dlKKOnmYeCQ82ptAnqWc6xM9NF
         LeWdvnyXYBtrITXKFAWog6fHiban61QPXISmPX7Hrv44E/7vGU5Pc1P3h9ukpmZ58CpE
         4eaFM+2qZyxYt3sd7PtHTXsbJDC/j9suTIH5CDC1tCC533sXUeZXNngAlhay0wWht5sh
         kddRzfd7NkEuqLgsFa0rsqxaO0qTd7YdXtpDwIeOLSYAJPVMoa9B952iXL2L7lv2EpuD
         3baw==
X-Forwarded-Encrypted: i=1; AKwUvBzvKWM0BLLaZHN+q2Vx76KnsTN5j9BrG5Wwf4JuI8l02KOuGgFs1V1SvuZHRQetnrYP0BJRJVEWSY2jZIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lJg9qF91TQMbXKZFM+dNr9ayPRvC0CENJWASISH4xzF2hT13JG
	xD/j0gtskxcltIbGUu36tAItnAsq95g6f1HvFPWIZ4c96q6ccqlRWxLNgN2bkzvDuw==
X-Gm-Gg: AYBFou3wvtV+NYPSRWJ5OF7Hsm2lgp11pWeYtc3NQT61jtzPCl2lqP9CtoP34g/akHk
	g0AYr9eS/yi9XxT71NgPP0YRIDb9XDe/41WjTmORh9/HInNeB53bVSBH7or8baRLsNMhK0vhxGs
	zPjtGIEelvmMbrnYTv4Mf6s9z1ITib4oDYDRFOobh+rVIETMFFN4j4eOVG6+lbeh8KXg94sdQOv
	kwJ0FDkp7rUM1Bn7qjK3cJuoXoZ++1wEB7+XCJKuVwT+EvBNkqeOK3S/Lwd2hu7F35vY1M2E/3B
	9z/hTGpABJ2W4hACD4VIBMSQUwBFpGhvVOH7strOGxpvARQX608mhzRr0KP2XxaXiLTJQm7sM9D
	eV/tLoTMzk5CU6MAvQEQvjKuMfI6D/IeHbESbO4vT5YqSNDclNev6fx43E2eS5svhbntmVM9ziP
	bc1D/dfM+jO9sd4HAkAUZDD3CR9ZG0a/QeWPZJ03o1oSQUA183cBCZTTCv6QuSEoT7ij/FjymL/
	TrF7gLncQTFUscrGCHmCo7xywQunu1r5ofXieDiGzeSv/z5MPQdY0u4qruAkdPvZ5w=
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr179840885a.17.1790802051649;
        Wed, 30 Sep 2026 14:00:51 -0700 (PDT)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a579d8sm8580336d6.38.2026.09.30.14.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:00:51 -0700 (PDT)
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
Subject: [PATCH v2 0/3] perf annotate: Data type profiling support for C++ classes and virtual calls
Date: Wed, 30 Sep 2026 17:00:35 -0400
Message-ID: <20260930210038.196928-1-yzhao62@ncsu.edu>
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

v1: https://lore.kernel.org/r/20260821050207.4517-1-yzhao62@ncsu.edu

Thanks,
Yanbo

Yanbo Zhao (3):
  perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
  perf dwarf-aux: Add C++ vtable helpers
  perf annotate: Resolve C++ virtual function calls in x86 insn tracking

 tools/perf/util/annotate-arch/annotate-x86.c |  76 +++++-
 tools/perf/util/annotate-data.c              |  61 +++--
 tools/perf/util/annotate-data.h              |   4 +
 tools/perf/util/disasm.c                     |   5 +
 tools/perf/util/dwarf-aux.c                  | 265 ++++++++++++++++++-
 tools/perf/util/dwarf-aux.h                  |  21 ++
 6 files changed, 406 insertions(+), 26 deletions(-)

base-commit: 45d15e89a783a0a279b7a54f9018c230127380d7
-- 
2.53.0

