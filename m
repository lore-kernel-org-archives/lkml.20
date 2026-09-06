Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D523BD65D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727492; cv=pass; b=mdSbKhBZsOS35OaSfCMkDoCiOI+ldIhnrfTrSuzUb3a3R3kQhupZCX2I17eFj9W8o1kTgShXDq/ylAsR90t+xQ9fGuFxUGg3EQ92ezArs+YG3OPVWpszzBJuZi/fNWiuIJ4pYEwF0dO5T5NkDP6seaZ6JkOWKF31oF6evm9xkuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727492; c=relaxed/simple;
	bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJu/MWGUfyd+JQG9l++AnbLng+dgRhFLgPCw9d6KU+USNr8Qc2MR7YCeniYSl0CxBRaZ5v4K80cB/ttZIjpiqjRLbbjvY0jS52CixCb6tRoi1sgW1JN5waQSFMJTCtZvmNPL+QTxYztAw9m1270cDjOyM2MZDlvbuGkGltmh2PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvuJLxq7; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvuJLxq7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c28eef361f0so51667066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727489; cv=none;
        d=google.com; s=arc-20260327;
        b=JgpaP4RVLrTYz362ltAHuivBbaT9iqA2tBZBOMqAw4xNgFMEplDCywbT6q0kc0Y/rJ
         12wsrNlV/Hx5hdKLbvXFwJM9USTgc17EsCyJhNf5kaulHkuEbr3D2piOmBLGiVDUS+F/
         LHtMplXl/QlU4DT5Qo4Bp+EtIyutgq9jMWM040EYvwQPrke8nF5YWaUflGLGW7d1zhqx
         2kBAzkIrj5OPmGYQ39hJSceoqfCN+fM+Abyr+WaHc/xA8VzGNa2qCSh1AOt/tigkADpZ
         Q2aVfELy+BGNCK538+plRMPi05ARKOEFhFvMZl51N9JX3VMed782HFf9KTV/agoIAXOq
         Onlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        fh=Fpm4KPJRNE1+WInxNH7fCYpDXXh5GJuWpsv1q5kUpOo=;
        b=R89coboC8VH5WXMv0I+JnJSwa2Z+iCSD1QPYDK3RFnRfpYCzIbloBA6ZgjvUAlBEij
         a8f+0F6bDJbTU/N8X9Js84erTO6KCrg4zXey3XBvZaOhHL3EXEETZSkkyFonOnY2nPeB
         tbAXvus4IfksQOx0p+zgtg9UwOEz4qsirajtU/rc7aZm/pTkt+IyVgcf7sw7pCgOCa5+
         FquWBEdvMIMjNI88l8nGd+HnLGic1ERGrk+Scknzgqy53bg+rw2uFauicAGtRv1y7h07
         +s4qnnv4/Cb0WfbSNKgcLRnyIVZEiKbhs2hN9Ruaob4kciU2olwgFCrIKG7grE8jTrSp
         xTIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727489; x=1789332289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=ZvuJLxq7UnGxQy3/tdKxGRBTo/vvPeoBfQ0i0xekofZOIeMf2wV2W+VDhf44hQ8Z69
         jcux6HyQMsL88AyR0/n+TjFMuX2rbmqgrEPLF8Xf51KCFvHuVT4yEBhCuYvXAylFx1Ot
         wzZC3RBgQ+Y9PG6O/qb1fSUtnfAOkx48gyOjQyO2EV5NXSyL2FDmEXFmyKvnnqmh7EXE
         V67vh06NnSQTYiJ8XeMIBt27Ow4JKaXoiFPZ6UC0URp1kP67uZTJFd4wbR9PpTyKlwff
         c/ddNP+A50ar1QYW6iFhpbLPZZmh2tHuLQcy1exGq4XP/SwBPsdbXOBtHnAAVejojsrZ
         GWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727489; x=1789332289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=EnaO8gKcFBrs0OzgWCxfn7wfNQ9Fc/HUrQzgKxyGp5JaK94t6jBSPBuwI94aR+vY7l
         D/0O7DhDhdZnbMl7AAAMBdMpfToHBQXobZLu9IqhL8AEXSCvJdqrX/2L/BV1h4l9rpMO
         GMl3vc3TPG1CXH5LMlJ4tDQlsGluICs7iAJ5Ci5uL3Vxd1KlChVzTvxEuTVQjmYFmSxw
         x1qgli0Ql/8ND7tSt39ZDjUAZipzd7J53fNtq9oanjolR/dQHw8smFRkw5eKS0Y4AVWI
         INYItIl0D/FcGhTcrOA+BPcqfwo+xlXU04D4vQjdrxG0kLK2T7MGfhwwW2NvB//ujTWR
         4QLw==
X-Forwarded-Encrypted: i=1; AKwUvBzsxQRkWHm6zbl280LGDvKRAJiypzjX2tZ5CgO2Yuez7ZyKdrmw0zXpUZmYMLS6O4cd3MVpmZ3ifw6cN50=@vger.kernel.org
X-Gm-Message-State: AFuF++kmTzCwtQBSQjn9OKQ2juS18BDpq1RfQw4STe8Co8rue+Tp+R5F
	NRdFd4TYj03oYBhLhH/xWAwUj7m7uhGUR6BMZ3qDZAn2H5H51WhWdV1rJrYwlkDaFcF5rdU1TQZ
	+6KTzCNJOpX+snvdsTsi0CR/FPdmX5+o=
X-Gm-Gg: AYBFou0LYhhdhfVgpW4hB3TPw/58Mw430opLFl5ImGaGwinUBmztEukduHQUfHUgBoS
	IalKtg6OKKteVI0Om6xph+LzkZ4hfjI4qAdHhtGqBAJ/LFAYEVlTYZX6OYjQNjg3iTnaR/Nuc6d
	p+gHpT8TLpoYfVE8oscCI9nnFaopuJvVZgsv2aiK4yofCfHpIzUEmSW6jWZlJs4J17fLLgrFVDu
	+PmZ10pxPgktbYjoyogGyJIKdY/2BwP7l14wLZC8gJwg5uzh6ZPJJ3bgQgZpDAL010toGU5mxfi
	9NL/bFs4nPlSKAXxX4kaMZlYMofU/JHy3JE9L6rn5sTBgETn/3hYmgNa2eIhbubGiAIAYNBiqhz
	iFvO1p7iJvLnMJCTffNhzbz9/Rz1pLQ==
X-Received: by 2002:a17:907:72d5:b0:c26:1691:b361 with SMTP id
 a640c23a62f3a-c261691b94dmr574303066b.26.1788727488511; Sun, 06 Sep 2026
 13:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 22:44:36 +0200
X-Gm-Features: AcwNN1We0AsiI87C6m3-nOVPbE0KRdcX5bT97xhlIc8oCAONBoZx_sgPyrzwY90
Message-ID: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Implement the perf register sampling interface for Alpha. This enables
> perf to capture register state and user stack dumps with samples,
> supporting --call-graph dwarf.
>
> The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> in switch_stack, not pt_regs, so they are not included.
>
> A switch statement maps perf register indices to pt_regs fields since
> Alpha's pt_regs layout is non-contiguous (unlike architectures where
> direct array indexing works).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I think this patch still needs kernel-side work in addition to the
matching tools/perf support.

HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
stack pointer through user_stack_pointer(regs), which on Alpha returns
regs->usp. However, the interrupt SAVE_ALL path does not initialize
that field, and do_entInt() does not snapshot USP. A profiling
interrupt taken from user mode may therefore attempt to copy the stack
from a stale or uninitialized address.

The proposed perf register ABI also does not include SP. A DWARF
unwinder needs both the sampled stack contents and the corresponding
stack pointer, so this cannot be completed solely by a later
tools/perf patch.

Would it make sense to drop this patch from the current series and
submit the perf support separately, including USP capture on interrupt
entry, SP in the kernel perf register ABI, and the matching tools/perf
support? That would allow the rest of this series to proceed without
waiting for the perf interface to be completed.

Regards,
Magnus
