Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A744CCDC0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195646; cv=pass; b=gP+DYmKS3SQPsLgqaUUOU6/5yGDlD4rnYIoO3+C9IVfHojDeBG/ICvYDRC0Gi3m6ftOpWQi7/9QXv9QdC7ihfopT6f5z01qgW3a4361FutUAZfoxp6J/1KTnZYRyWtND2ZatUPrqteR/KQpcvoIwlbeSNYro5rTjb33PvcXW0pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195646; c=relaxed/simple;
	bh=x2KsbWxNcXzDGrxUjPtXA6JMUYxlGrwEtnlKXN9TOj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEjoByb7c3rRhP20Agv1XHf801wRbInQjVNpZa6mDC/GVnZ1XqwWP7u1vatt6QjjXaDis5D0EfmMerXpOoNi1W6VAhr5GxvJbXW1iYjp0Y3T5NdHY5bZavBXADLQlW1l0MpwD2HQjH7nLC1AsKpI25krdo1XBFm7AtfgWGCAshU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSzf5flg; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSzf5flg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8facae850so23325ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790195642; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhFFRreJphi0RzaPlNf/4Uol8XZNHZIMNmNNmGZFoO9NwnXBpB4hITA864iduEQul1
         mQ6P9vBykJYEoc41oplLD7LttCXB7zqH4COpJvcDPiLeWHWRUi91tfgkGQzXkYpdOzQA
         ZKLLAerzFnHX8pXtDuJ/iYi6WG3jEpS7GBMzC7b0tUNp3lTxTQCwMvJMiNTRuHs4UhCA
         QO9m5ENVVVYfj8tSxS7i7dCHzgHY+TPRiykHCMESGH6wYGXuPU+BwC9MvuR9oUtJY/X3
         /kOfMR3t32MdrjvpjJF326LwWNVk2IEt3q8utLv9H8UsiyaYtZ5M+o3rawRDWSPH9Ezf
         6OwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iRjbWXUWKdI5T5j70ZPijMzoSc0FwXFiL+Py7PH7F4=;
        fh=BW9cFjr2MYr3GNzPAeIeDX/Dr4UM/4icSJ56yKbLBHY=;
        b=i9ZRSQO4Y63xKHoV2tL9MMzNVU0Ap3q51KOHrpgDK20gArLMe3CuJBCMG1NbFjHJ1t
         4RHgR3e1N70WaCvp7Rz+UIDj1lLUOKJgube1SJZh3rEMyHHPR4ffzOizisDLWzmlsozG
         nC6tHrX8bf3xMj023OSIYTt45rWDlh3RNVcNuTbLdfdtSLDQ+G9EYpx0HkKLjUf0DXXL
         c3snFxcsLwyprYoCszjtzeXy6hnlFda7StGoiKAkZwJtCk2TjcldoNCuHlGXGq8PamFj
         YgqL4RO9K3tI4EalUvG4LcI0V0OFbHgei8MHuDsuPCidmz0qCLMd+REAG9wFhOr2maaa
         C8+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790195642; x=1790800442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iRjbWXUWKdI5T5j70ZPijMzoSc0FwXFiL+Py7PH7F4=;
        b=MSzf5flgQ4zcxUOOnu+OwR/YRC6E51dPDWsedFPaYZOIZ6+ZD+BPxm6ghQskoHsS7V
         +WhBoa5GMSF4LYMPBI+KytXB7ORnu/bv9DCM0i7TLxEaQTFdXh/L54pQrVinMtTw4uxc
         tBjS39jspT6+vRG6ts7g6gmp/S4Ea0E0Ea2FX7FA0Au/XA/2BwxI8n1REMZISPWem501
         HLuujeOAKEXlfahxMq4O4x38CfM9tLv8roRG5eYaOutFLwxG9lIIVtwbr1drN8WAn3OP
         tItAl9W34ejYNVFOa2Ui3oCbbF12XR9xOWY0IlidTGHKlpsdQ9qbVq21MFPCfX/+/UXc
         7zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195642; x=1790800442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iRjbWXUWKdI5T5j70ZPijMzoSc0FwXFiL+Py7PH7F4=;
        b=01tF4m6Dh1uCWIOeVqO4MYGNTYItVnDYG4m6xRv6hqWRwPlOXbhHdCY+pIcPfIAJRz
         KCkoP0KNZGtYmNQZMRRK4gPz62vCM639YW9CR0vnIoo+Vu0RR8+m4vyM+A4HtnRwpkni
         h2TD429SA9LoREg8BE7oGch0mQk8/VME4oe3WqMoC7Ntn9fZ8JGwqOTBi9i8MX6j4mDf
         wZzrl77Z4p0VGDKLiPew7Iiwq5awcSgKvvdPwce+9Hgo22oRP9x+75RiPxwpK0rYiyXs
         u0rxHSWpUvkjjnMCIOoLNnWMzNCdT1zc+xr2yFRrj8S4Fvoh+aCgn5cyW7bdNDhry5Rj
         DllQ==
X-Forwarded-Encrypted: i=1; AKwUvBwugFHOTEakcNp0gFkIfIb5fG1E6AaYO39GJiYCwW+91TC/ERUQUUSy03UUta4qIn0tIuBv8nVbbt5sbpc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUpdObHYiSnpjJYpbKJUrgm8z7kwcbi4D6kLIh5wfCFW9/zHh5
	dGpPCuORWQD7GIGvuoe5zfF9A5fURg8SFlAKU4kf1r46EuC54hVAT8RjjEDFphfKgluoPV4jOIj
	wYvkypjk3HkeV2H9TxeXkGpAZ4IacfUStYAf21/Ea
X-Gm-Gg: AYBFou3hIXfp9L02PtylfnGhSmXSUm2xqYJv5wamaw14Is/EM93F6elLp1xoKgIWl8e
	kgatLVQZ+QidRKhskTYveJEeXEFsvfJP/002Ob5PvxJ1MPG3mVsliMyNZQkFwjji4gxyFKrKNTm
	9AP1ZsU40fSeLJbvzywGOtT3rXCJ1U68uFkbl7/5EphsANV/XkWy8TgHhklxM4uyWRQ6cbc2oNL
	b6KsJ6tKIaf9bOguW8e4S5bROlE8Hh3BP8tQMZoBrYNk4HqmQTbKjOAAWprI5cJfBiw0cG1/w+Y
	8+Qiq2nC9H0Wz9joggFnYbqUCdpUCjZI5IBZ3inMuF6gREGLA2EL5EIaGoAjBJngBaUbT0BHUQM
	a8ggrFAafdJeloGKqKrnu
X-Received: by 2002:a17:902:f543:b0:2d5:db38:800f with SMTP id
 d9443c01a7336-2df7b3e1e8emr1773735ad.14.1790195640940; Wed, 23 Sep 2026
 13:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923193432.2489729-1-stian@itx.no>
In-Reply-To: <20260923193432.2489729-1-stian@itx.no>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 13:33:48 -0700
X-Gm-Features: AcwNN1UT7NrgvcNDp1sJnOfbIhVSfmmWr9VKa8r6V-od56OMd3RrgE8WhcMyDkE
Message-ID: <CAP-5=fX2M6ndLGh5GKjiP2eK=tCp_LpE1iVjDH+Nkz5jJVpxqw@mail.gmail.com>
Subject: Re: [PATCH] perf unwind-libdw: Fix reading the stack of a 32-bit task
To: Stian Halseth <stian@itx.no>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:34=E2=80=AFPM Stian Halseth <stian@itx.no> wrote=
:
>
> memory_read() hands libdw 8 bytes whatever the sampled task's ABI. For a
> 32-bit task libdw keeps the low 32 bits (__libdwfl_frame_reg_set()), so
> on a big-endian machine each word read from the stack or a DSO is the
> one at addr + 4, and unwinding stops at the first frame restored from
> the stack. On sparc the 8-byte load from a stack address that is only
> 4-byte aligned even traps, and perf dies with SIGBUS. Read 4 bytes for a
> PERF_SAMPLE_REGS_ABI_32 sample.
>
> A recording of the other byte order has each sample swapped in 8-byte
> units when it is read (perf_event__all64_swap()), which leaves the
> 4-byte words of a 32-bit stack dump reversed and paired up wrongly.
> Undo the swap of the unit holding the word and swap the word itself, as
> __evsel__parse_sample() does for PERF_SAMPLE_CPU.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Stian Halseth <stian@itx.no>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
> Ian raised the cross-endian case in review of the sparc64 perf_regs
> series:
> https://lore.kernel.org/all/CAP-5=3DfUuRm3dWra4a-6eNF3F=3DtafcHvvDipqmDEX=
N5+ti-sW0A@mail.gmail.com/
>
> Tested with 32-bit sparc programs (static, dynamic and multithreaded) on
> top of that series, with a local change so perf recognises sparc32plus
> binaries: natively on sparc64 perf died with SIGBUS before and unwinds
> complete chains after; cross-endian on x86 no call chain was complete
> before and all are after. 64-bit unwinding is unchanged in both.
>
> Words read from a DSO rather than the stack dump are still not swapped
> for a recording of the other byte order, whatever the word size, as
> before this change.
>
>  tools/perf/util/unwind-libdw.c | 46 ++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libd=
w.c
> index 4ccfcc7c2dfc..d49901b1571e 100644
> --- a/tools/perf/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw.c
> @@ -4,6 +4,7 @@
>  #include <elfutils/libdw.h>
>  #include <elfutils/libdwfl.h>
>  #include <inttypes.h>
> +#include <byteswap.h>
>  #include <errno.h>
>  #include "debug.h"
>  #include "dso.h"
> @@ -17,6 +18,8 @@
>  #include <linux/types.h>
>  #include <linux/zalloc.h>
>  #include "event.h"
> +#include "evsel.h"
> +#include "memswap.h"
>  #include "perf_regs.h"
>  #include "callchain.h"
>  #include "util/env.h"
> @@ -203,9 +206,10 @@ static bool get_thread(Dwfl *dwfl __maybe_unused, pi=
d_t tid, void *arg,
>  }
>
>  static int access_dso_mem(struct unwind_info *ui, Dwarf_Addr addr,
> -                         Dwarf_Word *data)
> +                         Dwarf_Word *data, size_t len)
>  {
>         struct addr_location al;
> +       union u64_swap u;
>         ssize_t size;
>         struct dso *dso;
>
> @@ -218,15 +222,38 @@ static int access_dso_mem(struct unwind_info *ui, D=
warf_Addr addr,
>         if (!dso)
>                 goto out_fail;
>
> -       size =3D dso__data_read_addr(dso, al.map, ui->machine, addr, (u8 =
*) data, sizeof(*data));
> +       size =3D dso__data_read_addr(dso, al.map, ui->machine, addr, (u8 =
*)&u, len);
>
>         addr_location__exit(&al);
> -       return !(size =3D=3D sizeof(*data));
> +       if (size !=3D (ssize_t)len)
> +               return 1;
> +       *data =3D len =3D=3D sizeof(u32) ? u.val32[0] : u.val64;
> +       return 0;
>  out_fail:
>         addr_location__exit(&al);
>         return -1;
>  }
>
> +/*
> + * libdw expects a 32-bit task's words zero-extended.  A recording of th=
e
> + * other byte order was swapped in 8-byte units when it was read (see
> + * perf_event__all64_swap()), so a 4-byte word is picked out of its unit=
 with
> + * that swap undone, as for PERF_SAMPLE_CPU in __evsel__parse_sample().
> + */
> +static Dwarf_Word stack_word(struct stack_dump *stack, int offset, size_=
t len,
> +                            bool swapped)
> +{
> +       union u64_swap u;
> +
> +       if (len =3D=3D sizeof(u64))
> +               return *(Dwarf_Word *)&stack->data[offset];
> +       if (!swapped)
> +               return *(u32 *)&stack->data[offset];
> +
> +       u.val64 =3D bswap_64(*(u64 *)&stack->data[offset & ~7]);
> +       return bswap_32(u.val32[(offset & 4) / 4]);
> +}
> +
>  static bool memory_read(Dwfl *dwfl __maybe_unused, Dwarf_Addr addr, Dwar=
f_Word *result,
>                         void *arg)
>  {
> @@ -234,11 +261,16 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, =
Dwarf_Addr addr, Dwarf_Word *
>         struct unwind_info *ui =3D dwfl_ui_ti->ui;
>         struct stack_dump *stack =3D &ui->sample->user_stack;
>         u64 start, end;
> +       bool swapped;
> +       size_t len;
>         int offset;
>         int ret;
>
>         if (!ui->sample->user_regs)
>                 return false;
> +       len =3D ui->sample->user_regs->abi =3D=3D PERF_SAMPLE_REGS_ABI_32=
 ?
> +             sizeof(u32) : sizeof(u64);
> +       swapped =3D ui->sample->evsel && ui->sample->evsel->needs_swap;
>
>         ret =3D perf_reg_value(&start, ui->sample->user_regs,
>                              perf_arch_reg_sp(ui->e_machine));
> @@ -248,11 +280,11 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, =
Dwarf_Addr addr, Dwarf_Word *
>         end =3D start + stack->size;
>
>         /* Check overflow. */
> -       if (addr + sizeof(Dwarf_Word) < addr)
> +       if (addr + len < addr)
>                 return false;
>
> -       if (addr < start || addr + sizeof(Dwarf_Word) > end) {
> -               ret =3D access_dso_mem(ui, addr, result);
> +       if (addr < start || addr + len > end) {
> +               ret =3D access_dso_mem(ui, addr, result, len);
>                 if (ret) {
>                         pr_debug("unwind: access_mem 0x%" PRIx64 " not in=
side range"
>                                  " 0x%" PRIx64 "-0x%" PRIx64 "\n",
> @@ -263,7 +295,7 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, Dw=
arf_Addr addr, Dwarf_Word *
>         }
>
>         offset  =3D addr - start;
> -       *result =3D *(Dwarf_Word *)&stack->data[offset];
> +       *result =3D stack_word(stack, offset, len, swapped);
>         pr_debug("unwind: access_mem addr 0x%" PRIx64 ", val %lx, offset =
%d\n",
>                  addr, (unsigned long)*result, offset);
>         return true;
>
> base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
> --
> 2.55.0
>
