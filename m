Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529F4CE67B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499369; cv=pass; b=cee4dXquZZTGX6YJpXNqoBxA5Fm4e54Yx5nGJkgErqZr1Yr3YgFijwJ8ObW/fRqq6glwQZb437MHMJ7YB8vZr676Dnad+Sarkrfmn+e8gggooHnvNq8QsNDGyL3qTYotmgphgXvBlIkXvSzggj5Oip6Fn4SxsApY3euX4xrXB+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499369; c=relaxed/simple;
	bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5EnjEIdBcg0943uBV7IqbzRjFEiScMR5xj9wHWh8LsHXzvKik1bplgxPWTAbBNGsX6LVGLmPz5uKxZ91orBB2IPJTByC9xBRQSEAqiu4jMjmO0ytwo5SeNLXAE8M6R/QgQ3soCsmNAjG8jU67+SI029hpRleMLvuEZqUP1pzYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuATZTLE; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuATZTLE"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so23255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789499366; cv=none;
        d=google.com; s=arc-20260327;
        b=IaGe7aO0YjjAGFXyCUZaWh+vuoJVeqdaOCU4eMRxtEfL4gMipuOIePmpFQSnXxn3Yp
         qxKNzDZVJXjnZm67927wDVpKZ70HwXpYlKgZdEftoPBO3bm9ZB3241jgAaI1imWZnDCG
         ycLjCjVk1qp9VpwZEAncqmZ9Aj0Evr70kdwPG1TOcN7AD0u5LPCJx1RpqsTpjEkO08us
         hJDzre0/S1PL0gnlas47zMYhW8/DRTEto1wIfVVbjUA9+UFwrMt+1K/fLnoC/sAS9tdk
         7GrjgFASOb2VbKZ6x9MbrHY4etkR156GXOqP1GqJy/NWmnTYCalNM0iFzuP/VDbsv/SU
         iSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        fh=mCG+30zXzehdX+JdopUslTORnWR+d/9ZVcdOYUJkTes=;
        b=oJ6cnormys7cdEggZwXJcja7T7PIV3aanoDMwuOXmqh1a5EcCgL+/Fl2L+tL4AFg3q
         O+3abwfcJNCG3RZt4OIsvrIax/ELHbpL8WyrntuBFb4xqdweSlxJeZXbhwbaYXoNq6wO
         hF+4hUIsg64gRfllvHAgdmKCgyARzI+dVhalmzovJSLFqL5KNyrv5LtjToYsV0Mqa3ej
         4tUjoluWZq4BwnLvPUU91VTnEsUaDjfNHI4bvHVtPEM41YTjMBuQ3cRtVezsgYWceafI
         F9h/7ItH+RD2bFLUBqp64X0EOHKYk0l6u0Lxg2wxSrxaYNrh0+YdcGSPK0ZGo+HJIUV3
         s9UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789499366; x=1790104166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        b=MuATZTLEgZnlGiYbsFkCb1tJGpmdlpOZUUyymTfBA0TNFDDc2YWa+L9NflthO42h/s
         d6H94TSF/ZZzQK1fbpzyxSssQye4IvcEbgTyKCi3K3iAReJwudYvWE5IqnqI0BPiGt/t
         1xtMfBm6sQUbC2ol7vsTzrLOCgLIWrz+tdOAERVyjVKnOHyJolZ0cdr2K6DAn4lFSiu3
         axaKn3RyMw+WGqcyk/O63oH0X6QwJC0qidCB4ovjVOSRPxq/rkI1xAfgpxCm0gHDqtqx
         NdYo7rygJt+SHx3PA6giNL0XusUILetYCpXoOTmt+g6wSE+M8mYIf9smA6bmKu/b+7CU
         qwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499366; x=1790104166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        b=N7S2w87dbo9aw8QOg5nDgCBmFPtDGrHF3uM2z2d6sywge212JfQi19Cu5Ty9MIUzER
         h0YBVlHZ8JNgbTHzo0/sRDv4sLqQ0s0b7q/wbesahG5RHTZMYRSZ1RxD76IqzotgoamA
         1CdF4jbp0bqklSOD7UM8fk2qPfZVsVoi0nMYaw6ARH11712bPlPxsXZnhMs16xX0VM6a
         10ASVTz5EYJDtVzv3U24fgcIofa2CZYTiYntilTK4pbSNj4ralVPGCl2P71wKLXV+AOl
         wb9U0meF1cWRwe/FOno6iAebDbwcDfFCmeSITXBUbnBeU/WhjGDNSMmZWCSE59/NqkK+
         Bxbw==
X-Forwarded-Encrypted: i=1; AKwUvBwiXFlrMkXnDvPHXw/Ia2en6SJbpbP3JsmkI5lDAu0kTlsy4sPOsJ5QzdfGYZHwikP9kkgbpphs098FpLs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4TMxDWwELDiWlxPb/+DXKtyw7q3fNKG8N0CNH7VWcRw/NhtlF
	WUiV2KJL31PVnydO5zeJAoDHYinTiTJQCdjgsPEMLpVLoMqXDWntH4LYy47rbHXbCyWOCXIlO80
	BKWEGmtawG1UIXIMwdGshnghCSBmW1juLz1sJRka3
X-Gm-Gg: AYBFou1qNAf0Du7Mct0yIqtf2j+t3O2ow2kg+6ci5maF1ccsoE8sSSJIqny7eWfMRbH
	rsxrtpJGhSe/PGyTd3MWaRhX6HysEpyuEd8coBhaxnEUgCcfexpAGMyWEEr39JFB2DXyA1o+ETv
	yCFPSUnFHDdDJKRtdqglW8Mf2VogmTD3EO3jIMM9SXu9f04INy3G3XbmHzI8mKg+cVYuAHGWzhB
	XIeKLDyfzVsjhjtBEiJpCucdNqMbeA5p5bAMKI9D+lLj9S4r0Zr6OdCwS4LR3k4P/PUqa/6KCss
	U3vVaDCzfv9iofhKb/gPEfVCC9p4oKV9Xa6MKmUidz8VYfeMYa13CrG+GGyWAVu277dGU/pZaJY
	96O5WQwNSog==
X-Received: by 2002:a17:903:2312:b0:2dd:280b:cdfc with SMTP id
 d9443c01a7336-2dd89dbf5b6mr911345ad.17.1789499365825; Tue, 15 Sep 2026
 12:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914124145.1257-1-cp0613@linux.alibaba.com>
 <20260914125814.C92251F000FF@smtp.kernel.org> <20260915015420.818-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260915015420.818-1-cp0613@linux.alibaba.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:09:13 -0700
X-Gm-Features: AcwNN1VEnCQGYjVI_5aMVzakyKX12QfH25O8aH1TDijDh6nLV8Gvbs5KkQU6zmM
Message-ID: <CAP-5=fWE7gjkpZdnHh_QAiVBKTF=1tsUE+ezDxW8SaCsaS-s5w@mail.gmail.com>
Subject: Re: [PATCH] perf riscv: Add perf_regs_load and enable the dwarf
 unwind test
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:54=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> Both items checked. Neither needs a v2 of this patch.
>
> > Does this file need to explicitly include <stdlib.h>? Since musl libc
> > enforces strict POSIX header inclusions, missing the declaration for
> > malloc could lead to a build failure regression on musl libc systems.
>
> It is not missing. "perf_regs.h" three lines above resolves to
> arch/riscv/include/perf_regs.h, which has #include <stdlib.h> and is
> also where PERF_REGS_MAX comes from, so this file cannot be built
> without it. arm64 relies on the same transitive include. Checked with
> riscv64 gcc 15.3, where an implicit declaration is a hard error:
> including only that header is enough to call malloc() and calloc().

Hi Pei,

Thanks for the patch! Please don't rely on transitive includes as a
change in the other header file will break code here. Since this code
only builds for RISC-V, we're likely to miss the problem if the other
header changes. Other than this,

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian


> > Can perf_sample__user_regs() return NULL here?
>
> It can, but that is not introduced here and cannot be fixed from this
> file. arch/x86, arch/arm, arch/arm64 and arch/powerpc all dereference
> it the same way, and tests/dwarf-unwind.c:118 does
> zfree(&sample.user_regs->regs) unconditionally, so an early return here
> would still crash in the caller. A fix has to cover the whole "Test
> dwarf unwind" path, or the contract of perf_sample__user_regs() itself.
> Either is a separate series, which I can send if wanted.
>
> Best regards,
> Pei
