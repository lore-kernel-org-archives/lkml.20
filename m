Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED03B47F5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389651; cv=pass; b=DriSoXrvIh89xeSHUc0by9+WsUNkzFMs8AJL3IgfjDD7FsMQHNO092NsXrZagdeQ2I+CwrsMNdzurVl+0R8FdLNCzcOzgn+WZ4+fVVDnR7SdMvGl+Tz2hARr30CNxI6Si0g3tBDieL9In3K8EeAMCZtsOFyEVKvNAVVnnDMG9wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389651; c=relaxed/simple;
	bh=WKUs52uoC9EQE/UJ+NNwRhWd//Mj9ebAmu+GkM0uTyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYLMgvbbJ21hADWWU9GX9XC0xOU4jXZDRINKJwANqKOSt5ntBNY2DoW8CEKHaxxsI9+zyh10B2QK04wlUmQxO54PkmQDEkYZG6XPmMuSn5YGsS8xJNcEqSTpOo/vpkmxaHT56kajNJVoJNd/F6cyRkzL9epiKPp2mAMwTiXiGzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=XYDMKc+O; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="XYDMKc+O"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1386394a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791389648; cv=none;
        d=google.com; s=arc-20260327;
        b=GMntSOtOHdxzgcZG3T6xHY4YP0bnE2kOvWBiygkbIZZQq/0eykbvMVvM48iOeACd/m
         xsx3EOSYBfi5ojaJ5Tr840y2OZ2x7RaH/xZSY/zm0cYHXq8TCvv413b0UJD0d2o2TjYU
         w9H9VdX84/6IBOk01adH8yJyKT+F0PjS02qHGzf9WIUKbspakVTj4l0BUub+jln5XDEv
         TLArqzTvzF5StqIcZ8yDTSzLUMDHouh+ZhoquYh5EpijeusB046qreEqSdw02Dji2PIa
         vBtGYFo5AG6yQLYg19+LW2QH+qiJcav/1Utoccqhwow45q+Yf9z1ohozJRFLj/fOwx9S
         Uk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwTAWcr73xgYfBX4GXvfxHil13WRE/QVYtr1aSJOR0E=;
        fh=AZOsN2ndvy25/3aRM64dzPVS3hhbMBuSWhF1JdHG+2M=;
        b=LbAEbnUEE6mtXcQrveDIPIQCf/+cbhepatazngn3kt/KIbThg9wnTAaZzi9FjqEpn5
         4tOjHx1b1bR8hkiiPS34C0HiB27A3WYqG7AGFydZfwZpQFcHLyLmXRY3R7tqBmSGBegi
         Qy1fPmaxOucPaAutATFephQBL52DFhdYMsWW7k9P4jwlCnDl6jTD6jV/OF+sDjQXKsJp
         iMyUvio6ah1KqhMAg3YJXyPsgzF7lw1Tdt6phM4kG3FCoHTa+rN64+f+Vqc1zVgFijuk
         3RWhcrnEUnAd8o/Tg8NWYbcwSGxJc/QNXPPbnv2BDA40pNefdnTuT+2Nstx4/8teVYgU
         prjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1791389648; x=1791994448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwTAWcr73xgYfBX4GXvfxHil13WRE/QVYtr1aSJOR0E=;
        b=XYDMKc+OVqGBL+kUUjz7NUE9PqyzwZz6FMFAKkP9g4HZ+gcg/Z/mfMcz6JypcInRDV
         ZcxpznonHMVQJGGT4Rw5SWplchPNIvThDD/4YTF31+KJ0ZXsdjSslFH0L1e5mATI5y0D
         r5wNEDXZCpNkx0snySTjbyWL0FGGHD+wJNnSixo1k2KoSb8rWGpSr32Sl30Ha3yM0f0i
         BI/Tq52wJ4HxmKdOSjnQncXZiFnZ+l7Zo1JIZ5U9AK8TbtvD/lUKL7TspRDWMSOZyyue
         rPsNb4a6uveq73rICQn7X797FCMEzUeCXRqj992Rv34k6E3/PYY5oVlGu4hPBTlry7zR
         T7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791389648; x=1791994448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwTAWcr73xgYfBX4GXvfxHil13WRE/QVYtr1aSJOR0E=;
        b=dklCMX9ZRIsvS9wBc+v/z8h3CFWXK5TsGzP3Ta7IWgZybDbSxjFZYqGWxsu1sTTINS
         DAke2kdOB4mUkmEgRbe2SfAZ5yiLzvovFstJyvAtX2xJ6lGlxf8zOIRkvlIuDYeMrLVM
         UUVOx41HfdVfIbVE6+JsZHiqqpSi4LjKwRBoTBTSOdtp3yWCkUrA8jilyegW/VR477F/
         nfYv0jH6xocE8c1Rm1/mZdxJ0p08zpGwdah/86GTz9rZ1cYh2z+fWqDNAfqXgzBCuvju
         9VDPpBGY3UWbKQr9MzShPGGIR6qR4wSfzAEnVXCkYVsQB5tPXn1ifEqDeADL53y1FVje
         /k5g==
X-Forwarded-Encrypted: i=1; AKwUvByjGhG6OYtc+5VAC2ogfN3X/6Vp5M910Nscq1dNdM/DxBxQKyCnLW7Lh3l9hfjtF53jIMKD0WLVQVj9mps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo7fbgjmiI7Fr90OvKlFSDFQq4ynHNbCRANlM0Ig7fG72Pzkcj
	JE7Z/9cBMXzt6/GSrTE9hiFHHOy9lqYhqLuPO2nHHt7KZ4xCdiddnG6qsZRqlZ8uYU8dkhSIxDT
	NxoDXe12Lwn466YEJINXppTovTITa7IuMbwtKGiSo
X-Gm-Gg: AYBFou2lh5LP/nyMO47VF/b+6kSrlz+X4h+PNsTnkSWRajYyrVr0LEEaGlxAO2JoB7b
	T7tVZets1ac1guZW6CnrT179NpwLZIkQZslxOLxX2x10163oErUsc3BSsL5fCeZrBZpnkDvNYAW
	IZPPmwzkqcjiLIZH80XD2CLYCk9q1TZ43PG3WcqzC9vzyyjUi/jMi6JD/jh1vVtY48wiSG5MjQP
	Fv5ntLTn9XSO5s21FbUIel3bsoH5AsIbnro13sNPEZkc0hCnAGbHm3/Ngv/cKRb9Us3YGOAT0C+
	ZDu5vf2QgUBjsGuJj+CAqggz5ET8/s15a+dLuLJqfcHeTemqbHV/Q8Hs02xDPANqm23i8isxNCj
	m3NkFMvLlJ2I=
X-Received: by 2002:a17:90b:57ce:b0:3a4:fa1a:2b1d with SMTP id
 98e67ed59e1d1-3a8a1c3ac39mr2165844a91.62.1791389647673; Wed, 07 Oct 2026
 09:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005201010.36493-1-yzhao62@ncsu.edu> <asZtHmjHDA--hXVM@google.com>
In-Reply-To: <asZtHmjHDA--hXVM@google.com>
From: Yanbo Zhao <yzhao62@ncsu.edu>
Date: Wed, 7 Oct 2026 12:13:56 -0400
X-Gm-Features: AclHuK8WLqUQRQdipFXa86JF-X-263W7GTyonNnwLbJjjvdD0ud2BwBbpNpZiYA
Message-ID: <CA+J8viZkWZy=UfDg1aX9KDGmkJp_+V6MCWP8UZ9zYPU89+cSLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] perf annotate: Data type profiling support for C++
 classes and virtual calls
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Zecheng Li <zli94@ncsu.edu>, Xu Liu <xliuprof@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Namhyung,

Thanks very much for your review and help!

Best,
Yanbo

On Wed, Oct 7, 2026 at 12:02=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello Yanbo,
>
> On Mon, Oct 05, 2026 at 04:10:07PM -0400, Yanbo Zhao wrote:
> > Hello,
> >
> > Data type profiling currently only understands C struct/union types.
> > For C++ workloads, member accesses through base class subobjects
> > cannot be resolved, and virtual function calls (indirect calls through
> > the vtable) lose the return type of the callee: the register holding
> > the returned value becomes unknown, which matters when it's used
> > directly to access memory like 'p->next()->val' where no DWARF
> > variable describes the temporary.
> >
> > This series extends data type profiling to C++:
> >
> > Patch 1 introduces die_is_compound_type() covering DW_TAG_class_type
> > as well and accepts DW_TAG_inheritance in the offset-based member
> > lookup so that it descends into base class subobjects.  It handles
> > empty base classes, members placed in the tail padding of a base and
> > virtual base classes.
> >
> > Patch 2 adds the DWARF helpers for virtual calls: the vtable slot index
> > of a virtual function, the virtual function at a slot of a class
> > (following the primary base class chain), and the class of the vtable
> > pointer at an offset of a type.
> >
> > Patch 3 tracks the vtable pointer and the virtual function pointer
> > loaded from it in the x86 instruction tracking, and resolves the
> > return type of 'call *N(%reg)' and 'call *%reg' through them.
> >
> > Tested on x86-64 with GCC 15 (-O2 -g) using small programs covering
> > single/multiple inheritance, empty base optimization, tail padding
> > reuse, virtual inheritance, direct calls through the vtable and the
> > speculatively devirtualized form.  In all cases the access to the
> > returned pointer after a virtual call is annotated with the right type
> > and member, e.g.:
> >
> >   movq    (%rbp), %rax           # data-type: struct Node +0 (_vptr.Nod=
e)
> >   movq    (%rax), %rax
> >   cmpq    %r14, %rax
> >   je      0x1240
> >   movq    %rbp, %rdi
> >   callq   *%rax
> >   addq    8(%rax), %r12          # data-type: struct Node +0x8 (val)
> >
> > The existing results for C code are unchanged and the added cost on
> > the common path (a pointer dereference) is a tag check on the resolved
> > member type.
>
> Thanks for working on this!
>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>
> Thanks,
> Namhyung
>
> >
> > Changes in v3:
> > - Rebased onto the current perf-tools-next.
> >
> > Patch 1:
> > - No change.
> >
> > Patch 2:
> > - Check the value of DW_AT_virtuality instead of its presence (Sashiko,
> >   Namhyung).
> > - Bound the base class walks in die_find_virtual_func() and
> >   die_get_vptr_class() with MAX_TYPE_CHASE (Sashiko, Namhyung).
> >
> > Patch 3:
> > - Check !src->multi_regs when loading a function pointer from the
> >   vtable and when marking a register as the vtable pointer (Sashiko,
> >   Namhyung).
> > - Set ops->target.multi_regs in call__parse() so that an indirect call
> >   with an index register is not resolved by the displacement alone.
> >
> > The recursion depth limit in __die_find_member_offset_cb() reported
> > for the patch 1 will be sent as a separate patch on top of this series
> > as discussed.
> >
> > Changes in v2:
> >
> > Patch 1:
> > - Explain DW_TAG_inheritance with an example DWARF in the commit
> >   message (Namhyung).
> > - Skip virtual base classes whose location is a runtime expression
> >   instead of falling back to offset 0 (Sashiko).
> > - Match a base class in the offset lookup only if it actually has a
> >   member at the offset, to handle empty base optimization and tail
> >   padding reuse where a member of the derived class shares the offset
> >   with the base (Sashiko).
> > - Keep looking at the next sibling in fill_member_name() when an
> >   anonymous child (base class) has nothing at the offset.
> >
> > Patch 2:
> > - Drop the non-existent DW_AT_vtable_elem_index and the DW_LANG_*
> >   fallback macros (Namhyung).
> > - Drop cu_get_language(), cu_is_cplusplus(), die_get_base_class(),
> >   die_get_parent() and die_find_member_by_offset() which are not
> >   needed anymore (Namhyung).
> > - Document that die_get_vtable_index() returns the vtable slot index
> >   and that GCC and Clang both emit the index as DW_OP_constu
> >   (Namhyung, Sashiko).
> > - Fix die_find_virtual_func() to return the function DIE instead of
> >   the DW_TAG_inheritance DIE when found in a base class (Sashiko).
> > - Follow only the primary base class chain in die_find_virtual_func()
> >   since non-primary bases have their own secondary vtables, and skip
> >   an empty base at offset 0 which is not the primary base.
> > - Add die_get_vptr_class() to find the class of the vtable pointer
> >   through base class subobjects, and die_is_vtbl_ptr_type() to
> >   identify the vtable pointer by its type ('__vtbl_ptr_type').
> >
> > Patch 3:
> > - Remove the receiver ('this' pointer) register update after the call
> >   which was dead code and not needed, and the arg0_reg field (Sashiko,
> >   Namhyung).  The 'this' pointer lives in a callee-saved register or
> >   on the stack across the call and DWARF location lists cover it.
> > - Handle 'call *%reg' by tracking the function pointer loaded from the
> >   vtable as TSR_KIND_VFUNC_PTR with its return type (Sashiko).  This
> >   form is common due to speculative devirtualization by GCC.
> > - Strip the leading '*' of an indirect call operand in call__parse()
> >   instead of extract_reg_offset() so that both forms are parsed.
> > - Ignore void virtual functions instead of aborting (Namhyung).
> > - Keep the existing pointer dereference branch and its fall-through
> >   intact; the vtable pointer is detected from the resolved member
> >   type there instead of a separate lookup before it.
> > - Treat the new register kinds as pointers when saved to the stack.
> >
> > v2: https://lore.kernel.org/r/20260930210038.196928-1-yzhao62@ncsu.edu
> > v1: https://lore.kernel.org/r/20260821050207.4517-1-yzhao62@ncsu.edu
> >
> > Thanks,
> > Yanbo
> >
> > Yanbo Zhao (3):
> >   perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
> >   perf dwarf-aux: Add C++ vtable helpers
> >   perf annotate: Resolve C++ virtual function calls in x86 insn trackin=
g
> >
> >  tools/perf/util/annotate-arch/annotate-x86.c |  77 ++++-
> >  tools/perf/util/annotate-data.c              |  61 ++--
> >  tools/perf/util/annotate-data.h              |   4 +
> >  tools/perf/util/disasm.c                     |   7 +
> >  tools/perf/util/dwarf-aux.c                  | 282 ++++++++++++++++++-
> >  tools/perf/util/dwarf-aux.h                  |  21 ++
> >  6 files changed, 426 insertions(+), 26 deletions(-)
> >
> > base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
> > --
> > 2.53.0
> >
