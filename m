Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902806;
	b=5PrQ+vyHeqLn/NH4sZmY22bi3/VOzkv6E4tFBZH1UXlb+/+DfX4cAjtBcS4krahG5LrV
	 ZVdKvoMHok5kkpxiIb6o0sruCG2fwxtpEhKI8Qv51QERxdbrwBnIhL5+OuVqBj8AEVG86
	 8Bmb1JVKp+s2iQzpQ+sySi32BnRKIPlircLUm3MsAdR0kQGeo9EOqlFsW/0Qqqi+06eV9
	 QEVTzFdmwFx1hvEWRgILExFWYuiesy5awEHWTja5rh8dAhXp+T/Ppuc7+nGnGc9PI8fq+
	 jncpyCBvkSB9epnAU6wQmPcbneP0sn0Drut28DX+cDp4hkOZO0sfM4WEchvOegmKdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L0ljk8FeWO73U6WHA6b1Ojbu1WCEtX4eQz7Lmk/w0NI=;
	b=PlSEbZgw0A3p4CuYz4HiZO//HPcJxDpwLKOtpcWtF+fUOyo4qLnrv4FDj56DJGxFnO42
	 4Kif8W25qs5TWE5jvl2L6J33BXAn9sOHHRNAOrdmyERCaY7bHrfFVJpR6mNyQTKpeoQ4Z
	 OfnqHFR7aiZXMGfM7tCCtJyeK/M9pd6rCW8kyPFU9qVjzkgp8MH8Bb9/j4ujbJKEnYWx6
	 kHE46CAJo/oxtYDgj1PDmUvzqwtcLe4HjErFgmXsGOqeHLZhQgX1o3RNQ+PznAn/j0gsZ
	 6ZF9May9PIxbAZanwrDS2+WBem+JFcDO33XRcfJsrwKfxOjtjPJDZvkQ2/oYSjYdKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ncsu.edu;
	spf=pass smtp.mailfrom=ncsu.edu;
	dkim=pass header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b="AUaZj/ud";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC16D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=AUaZj/ud
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b312be5de8so25210577b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1793902804; x=1794507604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0ljk8FeWO73U6WHA6b1Ojbu1WCEtX4eQz7Lmk/w0NI=;
        b=AUaZj/udV+tvdslwuwNIBg2igr6ITKGZr7xZzIIyaKic4LViHzO7tWxVdeMCK80ja4
         iEfeaIZeHCp932r15tl+3I6uu+CqP7S6qxJH8vmNDAVemW3GPdiU3032doUjTUYVBSQW
         rn6FmPVoPmZxKyYbjHotlFeJYZkOTSEtb2XMAGrrbCFkyV7KfI0v1fmB8anh/njpsisq
         K8heM4bLSrkwbpJP5eJLI304zeqjBwrhqjUwAKwV6A98HIYjseAJSbvDWAmwPipP2rzk
         PQ1EovzbWVuA7HW4uXJEEcPa6blSZ2ulnZXxsJgWTVDjf0vz7x2pczjYMRKsVaXP/rs/
         w4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902804; x=1794507604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0ljk8FeWO73U6WHA6b1Ojbu1WCEtX4eQz7Lmk/w0NI=;
        b=L8WEAurzr1b2P5CFE6WTKDiyGKQCghsuMWhXmEyUCl89YjPZSe3/djuIZnl3Yi+Wyc
         skC6qrQQZUO9uoXJS+fQQhhu6mTOGqDSvfp1j5dB6rD6pnlb8xkojAtpGEknTtIyMhZT
         M4anwYZNVz2sw8heNbV2vo/rI+oTkpr5aJfEtQhAxg4+UskPf70vyuERLWzK6pvpxRBL
         x/FE9SmU49IyiyNuh3yex+nzNq0KmJBGTQ4NEI1mpQ7mqInNu9Nc+UEPmv9qyRKTJGd6
         b3CGK+3rv92y4J3wxktWp/efGOb5+gm/mP2Qq9Vr46Yb+aKv5iqq+pq2ckv5PidBK2zX
         JmtQ==
X-Forwarded-Encrypted: i=1; AL+hErG8gKMYGtyNH4Zky788oOFAwyIHZ6yahPY8wT2/pUxLdNKoeMdnotlfSlXxLa08HcC8wSeWft2GSBx8utQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3MZtKub6sAUYsAXGPVB9PCYvlmbMHCqUx+8zBF44cO4RpTYKj
	MTp5863giX1XSyBx6L96tCuXBvaPGFn0YIjA/FskSjH+XcPuFuHRI04QenNVtaC9gg==
X-Gm-Gg: AYBFou0VWNZcjTDMgWhjhNZ9w7W2S77xNn8C9btIK9P+XvtfVpl9KfN82FvrZKoYzco
	fOPBiILwN5FI6e0sS83FUzILySZ2Sc3ldY0qa7ROBGDySV8Nrc9qhCZCJA7mWC8CcRunRfpkR3X
	afeTEjwfWgFpoMFtrTXORjjRIqlQzGzJVxxuyWizn4n9JFtBHJagcv93KKv1dQG9uCKQvdYfSgN
	lFCtw4Ow+gG4En7BgUEWcGvl5BsGB/fqoyEGUYZXzT3Lj/0kE9hZFgH/EU2NuunHrz2wTPvK+Rp
	JdCF9hFkmmcdIWsgo8EOgi6gf/8NhsfwoXHFVO+mdYJ3YNOnckaGKvSyl/IylLBWJ4jp81B4LHy
	RvuQ2GhETzQBpsOusF5qOwYoLIMvm1ONRqA0NOj2r7N7HJWlrxLCdlaaRR5ErMEEHMFAUE1ZrjF
	S5Jud6usKpovbDrcZHMgnIAj1/btKUP3QNCNFxl4g7nHpk+wLAs95Yf2esA5JRlO5fI34MsQvd5
	9XKU8h5W2NJTyfqdAyX/NRomHFFjDtgbTyzL4nLCPMurUCncVHieBqYK26ZPbC3hy3P3l7J/0a5
	gqu1a7Z+7zWviikNO/ZGhzyZPzJsWLduuWYeoW2FWL9fzOIyWxO2dzvpxjmQccAa1nP3bc3HAzX
	XPqrCn58eURUgLBmaNgg2
X-Received: by 2002:a05:690c:c50d:b0:896:5874:6d0a with SMTP id 00721157ae682-8b2b672150amr120482977b3.40.1793902803487;
        Thu, 05 Nov 2026 10:20:03 -0800 (PST)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm1492287b3.2.2026.11.05.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:20:02 -0800 (PST)
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
Subject: [PATCH v5 0/3] perf annotate: Data type profiling support for C++ classes and virtual calls
Date: Thu,  5 Nov 2026 13:19:46 -0500
Message-ID: <20261105181949.43198-1-yzhao62@ncsu.edu>
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

Changes in v5:
- Bound the recursion into base classes in __die_find_member_offset_cb()
  with MAX_TYPE_CHASE in patch 1 (Sashiko, Namhyung).  The callback
  argument is now a struct carrying the offset, the nesting depth and
  an overflow flag; when the limit is reached the search stops and
  die_get_member_type() / die_get_vptr_class() fail instead of using
  a wrong DIE.  This replaces the separate patch mentioned in v3/v4.
- Dropped the Reviewed-by on patch 1 because of the change; patches 2
  and 3 are unchanged except for the new callback argument in
  die_get_vptr_class() and keep it.

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

v4: https://lore.kernel.org/r/20261103155650.269973-1-yzhao62@ncsu.edu
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
 tools/perf/util/dwarf-aux.c                  | 316 ++++++++++++++++++-
 tools/perf/util/dwarf-aux.h                  |  21 ++
 6 files changed, 457 insertions(+), 29 deletions(-)


base-commit: 29fd95dbd25cda35ac1e38d096a85809e952274b
-- 
2.53.0

