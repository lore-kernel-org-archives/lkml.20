Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588A5803BA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888974; cv=pass; b=O5TtTlsAQ+JblFtLRyghZ/5eU+KgVS/6qHBLl3rV+WCilxXEG95Ad1eXR6V6YuxGNv6mzzMc2fsXRa7R//mScjfFR0WSDWwfMi3PtYa+A98crmvJSaelAuhFqEgOd0CJiSjpP/IJr9su7lnLHZmrJ9+iTTrBiEaCEzaNh8zSszA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888974; c=relaxed/simple;
	bh=aRgyDVrTNKA5s9SDT3cNGh9fJRv8grp1sQkaqHABbGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUCbzgzSM0Ip7dqbZkSmjrfXaNvrFdEXDZVtXnQgfX6yqO2zbWu/QZ2nQoeS+VSqZdPNXV715COfb4VEXigrIVlTm0liMKremRrk8VCWfp/DEZSGUVXR2zED7IT/gNnjjuq4v7F6/QqcuXQD5fTdke4KBljKV8lheb4zoLeG6Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WkoCUCfc; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WkoCUCfc"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso768041cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788888970; cv=none;
        d=google.com; s=arc-20260327;
        b=gc8sVDouyQm2tBTRiJXaW3klszhZDPbjqKlxVWBUpkqg9qA/J7BWv3TYgqjIZGc2cx
         6oQwg7k6b+5Z+t9FEI96rvKIA5PBSqW9uFDYy1LbMU1gpJj5r7WHPcXu6562zxJk+kyu
         WAfZPOxBPg029rwj/x+rDyCwJ+chiDEbj35AZq/xRU37QrpwEoo5wmDr+bcEktheF6gT
         AZyQ8MJHDa16hcgt9/tKhLPsTnVr36t3psElF6IT91NSAoPkFhV9/Y6yZP56qvCrcZEz
         WLC6EXaSIAgAJeybYyIlhoKYZT/San7+43O3i7ylbRftw9+teW8IxS1a5u7a+LZdyZVo
         tpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKi8eCYJaZKxsUOzajSEISHospqZ2tHXmAdOPIikG3s=;
        fh=zouDPY7f6IZdcL7io+GJWPSzIwwzzmjXLme2/ez5Ox0=;
        b=scSfKhtvoZ2pNZQhsV+CrDSE++/vyDmDM1J/SEzNYzebcjfWEmLmH1OZsnmUtcQgIN
         kzyvO4zL7mBNQmGfwpoTl49WWXHX95h4kb8KN0lA50IXgAGMexRmuM7+eIo7SwHirOeT
         ahQFyXcJJNxg6hvcI9tn6ufhKDeB/wQC5CtEMjruxgG7ZLZ6dkPDZXVjvxMZfiuI1vmg
         hH6vhOhsTmt1oE7dEPrc+IfRPjOqNTiLLUdrAMUyT26GPCeH1GVkVpQ1+bruHyN4OMEw
         jROmybAOgdgKyvsXnbC3tmPng3DMg9sg3gUEvrpWvtVdKO0KaENdfXZxzNbmcP9/ZxMd
         Kg5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788888970; x=1789493770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKi8eCYJaZKxsUOzajSEISHospqZ2tHXmAdOPIikG3s=;
        b=WkoCUCfcWMylCwjhsPV2a7IOcT/LFLAhHqDI2m7H09PbYa0DynrjcZa32/ApnkQKZe
         bm/BQZBwglSEtwz5D0G/TyUqj73IxdN3XqjEbmmkodtsVPV9yjdsx8f2HfcZMX1rYF7P
         iuQXbHWd9fEahAbTYjvw/bJ+CvCxwc+N/j87y+eQsvi31PnEIP3ugRr7xmo9Voq2H36g
         lZf5UGHNHOV3wljuG41+/cJ59mVLY17CyUharL2vma7ITsk4LaOO5gKW6cw+Sw+ZFv+g
         hUEoIE/ap4lFQ0rZ06FqxsyV+QNhFNxRKZox1ttWpFP0uQPj6I0pn1W4h9bmvR2fX3ta
         ITeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888970; x=1789493770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKi8eCYJaZKxsUOzajSEISHospqZ2tHXmAdOPIikG3s=;
        b=Dy9ez621MAkmq+N9tKj18+kuCKVyMOCVG1F6wH04GR5wWy/q+wVS5iuSNkGPk8FNjn
         yHz9k7WgWWLtsoi0cgJ08G8s+l4Q4LoqxF37fRp2/XQG69TMDcmYE2ENPeyA/fGkknz3
         g1I2K3j63I3MSvXsYIdHWuza844dl2RogNzuefaFDZ7OaOvzyb93DiK8eM8jlJ/+VqL6
         VanXA2R68XYMdt3EoOr4zH36XfUm6aVeI17iZ5W+mFOQL6JOQaF+Je+rrClUzSNW8/OL
         olSCzlqi63hrrQO+o9UrRsAPDeuQ5S6P3gQqDtJt3YdePonsijbAPPDIqnnSB6Vdkc4H
         OgTg==
X-Forwarded-Encrypted: i=1; AKwUvBwDeLzhwEtz+V5XigjecKxPffpV1a7sUf4InVBufDaTSsK6kKoZ6AjiV52TgUS04nKgOTWhQQq4GXtomwo=@vger.kernel.org
X-Gm-Message-State: AFuF++kJTV7y3kD3HlK5Sf0AtrOFiEpa5LBn2J3tpT9lJdxJXS+AjnVb
	UJCTd7GSXUkLlAEFsgILbrHZWxOp/hXVPNT+Py0FeWwgsgqyrsJuF3u5POcOcy7drex0s0x27mK
	d5t+QeaOEM3aqv3uLDvtlY7IbQUZWKUTzvfckW61s
X-Gm-Gg: AYBFou0hBVTFiGR2wN8V34QUgoFlofB0WKHqd71F7S8l6ITot6qFBoQafswSFo70fbR
	qj4WBkHX3oHFjQ5Sqy/Mtw1PLJPt0syeOhAbDDxy7K/KMxRjixiUyGz2x4tu/RCsEkADXkuJug3
	JXwueqmphC3v+Cgp7jDt/bZ2ekCcAHaH6K9SIA4/kIlSrHwWxdo8qUEsQbsIIH7iFSNnqMKMpo2
	BO3DrkurTXndV5cwww7JEc2NUShOZbc6rarBuE0c+WeUcVKZOCrNU/cinTzI1MunIiDFhgLicsm
	b32QhaMoeORr9OPQNr1biMnULnAPju7Sn+hXT1OwU3TS83O5n4Dh1iR2bKm1ZGxpYLnZqoRLkg=
	=
X-Received: by 2002:a05:622a:1c15:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-530a3bb8079mr2069441cf.15.1788888969088; Tue, 08 Sep 2026
 10:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-perf-alpha-annotate-v1-0-97380433ccb6@gmail.com> <20260905-perf-alpha-annotate-v1-2-97380433ccb6@gmail.com>
In-Reply-To: <20260905-perf-alpha-annotate-v1-2-97380433ccb6@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:35:57 -0700
X-Gm-Features: AcwNN1UxlkVN3Rw4UwGMGOQDSIApMZiAW899jxT8aH2F2OhWkp8yH2U2K2p44mY
Message-ID: <CAP-5=fW8s5WndkCDEHFhxmBOqRV+3LCz8kKFoiU7ExJHviFFiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf annotate: add Alpha instruction support
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Teach perf annotate about the Alpha control-transfer instructions, so tha=
t
> an Alpha perf.data gets call and jump arrows and resolved call targets,
> whether it is read on Alpha or on another host.
>
> Add tools/perf/util/annotate-arch/annotate-alpha.c with arch__new_alpha()
> and an associate_instruction_ops() that classifies:
>
>   call:   bsr, plus jsr and jcr as indirect calls
>   ret:    ret
>   jump:   br, the conditional branches beq/bne/blt/ble/bgt/bge/blbc/blbs
>           and fbeq/fbne/fblt/fble/fbgt/fbge, plus jmp as an indirect jump
>   mov:    mov, fmov (objdump pseudos)
>
> That is every mnemonic binutils can print for the branch and JSR formats.
> jcr rather than jsr_coroutine, because both name the same MBR(0x1a,3)
> encoding and print_insn_alpha() takes the first match in the table, where
> the jcr alias has come first since the sources were imported in 1999.
>
> bsr needs an Alpha-specific parse routine.  The generic call__parse()
> expects the operand string to begin with the target address, but a bsr
> prints its return-address register first:
>
>   bsr     t0,fffffc0001031dc0 <cserve_ena>
>
> strtoull() then stops on the leading register name, leaving the target
> address as 0, which makes call__scnprintf() fall back to printing the raw
> operands and leaves target.sym unresolved so the browser cannot follow th=
e
> call.  alpha_call__parse() takes the address from after the comma instead=
,
> as s390_call__parse() does for the same reason.  The PC-relative branches
> need no such handling, as jump__parse() already skips up to two operands.
>
> jsr and jmp get ins_ops that resolve no target at all.  They transfer
> control to a register, and their trailing operand is only a branch
> prediction hint:
>
>   jsr     ra,(t12),fffffc0001014ee8 <_printk>
>
> binutils extracts that hint as a 14-bit signed field scaled by four and
> prints it relative to the next instruction (extract_jhint() in alpha-opc.=
c,
> print_insn_alpha() in alpha-dis.c), so it can name the callee only when t=
he
> callee lies within the resulting +-32KB.  It also defaults to zero, which
> prints as the next instruction.  Of the 213750 jsr in a vmlinux built fro=
m
> this tree, only 23093 hints land on a symbol; 157204 point into the middl=
e
> of an unrelated function and 33453 are that default.  Parsing the hint
> would therefore invent a call target for the majority of calls, so these
> keep their operands, as an indirect call does elsewhere.
>
> EM_ALPHA is 0x9026, far too large to index the e_machine-keyed
> arch_new_fn[] table in arch__find(), so select arch__new_alpha explicitly
> before the table lookup.  Declare it in disasm.h and add the object to th=
e
> annotate-arch Build.
>
> Disassembly itself comes from objdump/binutils, which already supports
> Alpha; this provides perf's instruction-class metadata for annotation.
>
> Tested on an EV7 Marvel, both natively and by annotating its perf.data on
> an x86_64 host, over bsr to a local function, jsr through the PLT and
> kernel-mode jsr; the two hosts produce identical output.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/annotate-arch/Build            |   1 +
>  tools/perf/util/annotate-arch/annotate-alpha.c | 185 +++++++++++++++++++=
++++++
>  tools/perf/util/disasm.c                       |  15 +-
>  tools/perf/util/disasm.h                       |   1 +
>  4 files changed, 200 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/annotate-arch/Build b/tools/perf/util/annota=
te-arch/Build
> index 23316743fdc5..0a74e1a9f17b 100644
> --- a/tools/perf/util/annotate-arch/Build
> +++ b/tools/perf/util/annotate-arch/Build
> @@ -1,3 +1,4 @@
> +perf-util-y +=3D annotate-alpha.o
>  perf-util-y +=3D annotate-arc.o
>  perf-util-y +=3D annotate-arm.o
>  perf-util-y +=3D annotate-arm64.o
> diff --git a/tools/perf/util/annotate-arch/annotate-alpha.c b/tools/perf/=
util/annotate-arch/annotate-alpha.c
> new file mode 100644
> index 000000000000..ccb13e2338a2
> --- /dev/null
> +++ b/tools/perf/util/annotate-arch/annotate-alpha.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <stdlib.h>
> +#include <string.h>
> +#include <linux/compiler.h>
> +#include <linux/kernel.h>
> +#include <linux/zalloc.h>
> +#include "../../util/disasm.h"
> +#include "../../util/map.h"
> +#include "../../util/maps.h"
> +#include "../../util/symbol.h"
> +#include "../../util/thread.h"
> +
> +/*
> + * Alpha control-transfer instructions, as printed by objdump:
> + *
> + *   PC-relative (opcode group 0x30-0x3f), 21-bit displacement:
> + *     br, bsr                             unconditional / to-subroutine
> + *     beq bne blt ble bgt bge blbc blbs   integer conditional
> + *     fbeq fbne fblt fble fbgt fbge       floating conditional
> + *
> + *   Register-indirect (JSR group, opcode 0x1a):
> + *     jmp, jsr, ret, jcr
> + *
> + * bsr/jsr (and jcr, the coroutine form, which binutils prints in prefer=
ence to
> + * the jsr_coroutine spelling) save a return address, so they are calls;=
 ret
> + * returns; everything else that transfers control is a jump.
> + *
> + * Alpha has no machine "mov"; objdump prints "mov"/"fmov" as pseudos fo=
r
> + * bis/cpys, so map them to mov_ops when present.  The no-ops are delibe=
rately
> + * left alone: nop_ops would let delete_last_nop() trim the padding gcc =
leaves
> + * at the end of a function, but its scnprintf() prints the literal "nop=
", and
> + * Alpha pads with unop (ldq_u $31) rather than nop.
> + */
> +
> +/*
> + * The generic call__parse() expects the target address to be the first =
thing
> + * in the operand string, but a bsr prints its return-address register f=
irst:
> + *
> + *     bsr     t0,fffffc0001031dc0 <cserve_ena>
> + *
> + * so take the address from after the comma.  Without this the address c=
omes
> + * out as 0, and neither the callee symbol nor the annotation browser's
> + * "go to target" work.
> + */
> +static int alpha_call__parse(const struct arch *arch, struct ins_operand=
s *ops,
> +                            struct map_symbol *ms,
> +                            struct disasm_line *dl __maybe_unused)
> +{
> +       char *endptr, *tok, *name;
> +       struct map *map =3D ms->map;
> +       struct addr_map_symbol target;
> +
> +       tok =3D strchr(ops->raw, ',');
> +       if (tok =3D=3D NULL)
> +               return -1;
> +
> +       ops->target.addr =3D strtoull(tok + 1, &endptr, 16);
> +       if (endptr =3D=3D tok + 1)
> +               return -1;
> +
> +       /* A stripped object has no "<symbol>" to name the target with. *=
/
> +       name =3D strchr(endptr, '<');
> +       if (name =3D=3D NULL)
> +               goto find_target;
> +
> +       name++;
> +
> +       if (arch->objdump.skip_functions_char &&
> +           strchr(name, arch->objdump.skip_functions_char))
> +               return -1;
> +
> +       tok =3D strchr(name, '>');
> +       if (tok =3D=3D NULL)
> +               return -1;
> +
> +       *tok =3D '\0';
> +       ops->target.name =3D strdup(name);
> +       *tok =3D '>';
> +
> +       if (ops->target.name =3D=3D NULL)
> +               return -1;
> +
> +find_target:
> +       target =3D (struct addr_map_symbol) {
> +               .ms =3D { .map =3D map__get(map), },
> +               .addr =3D map__objdump_2mem(map, ops->target.addr),
> +       };
> +
> +       if (maps__find_ams(thread__maps(ms->thread), &target) =3D=3D 0 &&
> +           map__rip_2objdump(target.ms.map,
> +                             map__map_ip(target.ms.map, target.addr)) =
=3D=3D ops->target.addr)
> +               ops->target.sym =3D target.ms.sym;
> +
> +       addr_map_symbol__exit(&target);
> +       return 0;
> +}
> +
> +static const struct ins_ops alpha_call_ops =3D {
> +       .parse     =3D alpha_call__parse,
> +       .scnprintf =3D call__scnprintf,
> +       .is_call   =3D true,
> +};
> +
> +/*
> + * jsr and jmp transfer control to a register, and their trailing operan=
d is
> + * only a branch prediction hint:
> + *
> + *     jsr     ra,(t12),fffffc0001014ee8 <_printk>
> + *
> + * binutils extracts that hint as a 14-bit signed field scaled by four a=
nd
> + * prints it relative to the next instruction (extract_jhint() in alpha-=
opc.c,
> + * print_insn_alpha() in alpha-dis.c), so it can name the callee only wh=
en the
> + * callee lies within the resulting +-32KB.  It also defaults to zero, w=
hich
> + * prints as the next instruction.  Most hints are therefore not the cal=
lee at
> + * all, and parsing one would invent a call target, so these resolve no =
target
> + * and keep their operands, as an indirect call does elsewhere.  The hin=
t on
> + * jcr is not even an address.
> + */
> +static const struct ins_ops alpha_indirect_call_ops =3D {
> +       .scnprintf =3D ins__raw_scnprintf,
> +       .is_call   =3D true,
> +};
> +
> +static const struct ins_ops alpha_indirect_jump_ops =3D {
> +       .scnprintf =3D ins__raw_scnprintf,
> +       .is_jump   =3D true,
> +};
> +
> +static int is_alpha_cond_branch(const char *name)
> +{
> +       static const char *const branches[] =3D {
> +               "beq", "bne", "blt", "ble", "bgt", "bge", "blbc", "blbs",
> +               "fbeq", "fbne", "fblt", "fble", "fbgt", "fbge",
> +       };
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(branches); i++) {
> +               if (!strcmp(name, branches[i]))
> +                       return 1;
> +       }
> +       return 0;
> +}
> +
> +static const struct ins_ops *alpha__associate_instruction_ops(struct arc=
h *arch, const char *name)
> +{
> +       const struct ins_ops *ops =3D NULL;
> +
> +       if (!strcmp(name, "bsr")) {
> +               ops =3D &alpha_call_ops;
> +       } else if (!strcmp(name, "jsr") ||
> +                  !strcmp(name, "jcr")) {
> +               ops =3D &alpha_indirect_call_ops;
> +       } else if (!strcmp(name, "ret")) {
> +               ops =3D &ret_ops;
> +       } else if (!strcmp(name, "jmp")) {
> +               ops =3D &alpha_indirect_jump_ops;
> +       } else if (!strcmp(name, "br") ||
> +                  is_alpha_cond_branch(name)) {
> +               ops =3D &jump_ops;
> +       } else if (!strcmp(name, "mov") ||
> +                  !strcmp(name, "fmov")) {
> +               ops =3D &mov_ops;
> +       }
> +
> +       if (ops)
> +               arch__associate_ins_ops(arch, name, ops);
> +
> +       return ops;
> +}
> +
> +const struct arch *arch__new_alpha(const struct e_machine_and_e_flags *i=
d,
> +                                  const char *cpuid __maybe_unused)
> +{
> +       struct arch *arch =3D zalloc(sizeof(*arch));
> +
> +       if (!arch)
> +               return NULL;
> +
> +       arch->name =3D "alpha";
> +       arch->id =3D *id;
> +       arch->associate_instruction_ops =3D alpha__associate_instruction_=
ops;
> +       /* objdump emits no comments for Alpha; '#' is what the assembler=
 uses. */
> +       arch->objdump.comment_char =3D '#';
> +       return arch;
> +}
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 6cfdbabbb8c7..49c206a88eec 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -161,6 +161,8 @@ const struct arch *arch__find(uint16_t e_machine, uin=
t32_t e_flags, const char *
>                 .e_flags =3D e_flags,
>         };
>         const struct arch *result =3D NULL, **tmp;
> +       const struct arch *(*new_fn)(const struct e_machine_and_e_flags *=
id,
> +                                    const char *cpuid) =3D NULL;
>
>         if (num_archs > 0) {
>                 tmp =3D bsearch(&key, archs, num_archs, sizeof(*archs), a=
rch__key_cmp);
> @@ -171,7 +173,16 @@ const struct arch *arch__find(uint16_t e_machine, ui=
nt32_t e_flags, const char *
>         if (result)
>                 return result;
>
> -       if (e_machine >=3D ARRAY_SIZE(arch_new_fn) || arch_new_fn[e_machi=
ne] =3D=3D NULL) {
> +       /*
> +        * EM_ALPHA (0x9026) is far too large to index arch_new_fn[], so =
it is
> +        * selected explicitly; everything else uses the e_machine-indexe=
d table.
> +        */
> +       if (e_machine =3D=3D EM_ALPHA)
> +               new_fn =3D arch__new_alpha;
> +       else if (e_machine < ARRAY_SIZE(arch_new_fn))
> +               new_fn =3D arch_new_fn[e_machine];
> +
> +       if (new_fn =3D=3D NULL) {
>                 errno =3D ENOTSUP;
>                 return NULL;
>         }
> @@ -182,7 +193,7 @@ const struct arch *arch__find(uint16_t e_machine, uin=
t32_t e_flags, const char *
>
>         archs =3D tmp;
>
> -       result =3D arch_new_fn[e_machine](&key, cpuid);
> +       result =3D new_fn(&key, cpuid);
>         if (!result) {
>                 pr_err("%s: failed to initialize %u arch priv area\n",
>                         __func__, e_machine);
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index 25756e3f47e4..adbdbf8f1f35 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -122,6 +122,7 @@ extern const struct ins_ops ret_ops;
>
>  int arch__associate_ins_ops(struct arch *arch, const char *name, const s=
truct ins_ops *ops);
>
> +const struct arch *arch__new_alpha(const struct e_machine_and_e_flags *i=
d, const char *cpuid);
>  const struct arch *arch__new_arc(const struct e_machine_and_e_flags *id,=
 const char *cpuid);
>  const struct arch *arch__new_arm(const struct e_machine_and_e_flags *id,=
 const char *cpuid);
>  const struct arch *arch__new_arm64(const struct e_machine_and_e_flags *i=
d, const char *cpuid);
>
> --
> 2.54.0
>
