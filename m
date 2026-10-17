Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AED29B8E1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245344; cv=pass; b=IywlzrEq3CTdawUuWBWOpzQtxc94NjQOKdRa4jol38fjSLok9xyLXl69xV+R8MYixQ2EzbJJpZ++ALk//11LP8BrJ1fGr/VMg661BnLcUvJDCeimc6hmunFSX3R/HnuylONVN3+C9XAF4TpTo4S6HbDa5WjoKL1LSVqlI2tgk3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245344; c=relaxed/simple;
	bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFeG1E6oUKwPkGZtrVfejkMkWEUwF6GrOtOSq2tVBWoE52EcpAeJwqmju0NvfYy7++/2CD9orSBZbJOLkOkz8LkmXMj7BoNYt3CK9zgKnt/shofr6LMWd7nBNDKKAvCzu3xqwGor0O9LmMvPCZvx3NNOxxJv+EuPaft/RiDSx4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edum3t6n; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edum3t6n"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ac9d666d4eso5808377b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792245342; cv=none;
        d=google.com; s=arc-20260327;
        b=evBvP6OIrGFpTRzJV1dk1jnarvYB2nqJzCjsKdlrfVbCcYQ51guuUAEvI2bkqmGkPA
         D95ayj041HdqSYl5wx6tQiT2fUmup8UdOUYIJ7FUKCV9XkqtEipSJgp9T+oCXCD+TowD
         zQv77taLvR9qIJdQpWo78RPVIz9fxwNqfmnaYXWMreubiDw6kYcc1LMc/fJVcLNlBI0c
         SnJF3wSXNMdEoL5uBxlajm/4Kr6nq77pbeXHXij22Dm/SkKkN2xCxDkOVVd6DzFHmA+a
         k1mZbELNQ/4jM52e/6KQIHlvq0Jn9g0w1qCwJSdyvNnBpb1GEm0Z72lSP7BfQhTQaXZh
         SB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        fh=aJklPSEBiIh/ZbfPxZb2MlCHpLpZ11iQrN15/mP1yQs=;
        b=Phb6LOUOqZ8GzwbudqvjGuNj5YjeNYvVtxDRoG3Iv4GkvNayJ/r+lCaeCBuXKiQla0
         a7YXA86MsOJhg7LHLL6hWDiKspPN77Ct92cekAyAVCns2JVhSMPAkr+tzgXV3BrYOWRd
         sjCDquQY1R4z+8pYyzz0Z/YSEpyeF9dp7w2CFmZ/cbbSMFmQJfPU0f++rxvO3GozIDti
         WrrcOM69703Hha42AkcqzrFvYCtnijTWoQ9QRw1Xz6EAxZirO6eEnZDhPrONMaTlsk24
         A36u/E3lhS3E2kDz8xWlIZJ7+sOXzWiq95o68h2utYuDbOUnH/bJDpPCkTHh5bkXmMxc
         PEJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245342; x=1792850142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        b=edum3t6nWf0FTl/rcNXoQ4JRQxgECIo2zf3Loklny7CZmnJFerFO7Dup8zXODqlncx
         zYoKe+vdQvoAXXpoG6cchi6dcXxHP0NvXU+WqLyBIrIlwNsoULoxJtiTOiqzitzax+1Z
         RPTM4XuimbtlV1j3W5AcrF3TYaEZABE6aeS9Pn2S5WKBRLmmFGuOmypnrxFbsF9lBZ+M
         Kx9buQorqyWi2sqdIG+tobHYB7lDZ2MlCJvRf42Nqjd8VLtGP5SFg8Jp6WPv7uAx4XBw
         CO/YwBU6ByVcjTlQBKvzewF09RpPlCl9v8TNA/TJkLm4jDhyQQCN+JHRfZdnS4uSD2Ms
         mYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245342; x=1792850142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        b=vIkQOkpPgUpinOetlhSGwmE7qIyupbUpIFfCVsO8veEViq/+wiiDuDpi0Nw9Z6R1WM
         mKc6f5cYanQQ7XuHXo5qCo2sTPla6yzVR1gZjLsgOZ6b/+E1cqLENK2VE2gxGmRftwme
         xa/ElPwNJwY55HlZ+OlyP564J7KZxOAySbZdRsZZhD8cYqCLMeV64LAo676l0yAQRmWP
         celByKg/ZEf0dyLtXCSpUxpqxmT2OkNUFdg5S1WslDpDZnDWQczqZk86n8OjIWweI/D/
         iHwRzz2vpWAfWjQykiFYohA5qm6IG4B7twv7mx7IfGt3CYRvOPgu7Ije5RkMPsjcQRZk
         p38A==
X-Forwarded-Encrypted: i=1; AKwUvBxRuAD1WFLZdZ8Vroc7AVcdmNIg8m5jakPCPjQMl/Ohg0yh6j2HqzX3+QqzJtAs8DQAzlDO2g/vXxuSbaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN4XamGf4/0ks98xWI2pZUhyuiRNvpjozqyoKO/nOKYb1NUELm
	Bds96V/SZqG2wnUtUsgVqAJYVUSP8NQGfkAdnrjSLE2By36Qb31LlExisEkKMhDezQMLS3CulHL
	kGZi5g4qiQWExgqbLEr/FxMgNIdOp4/A=
X-Gm-Gg: AYBFou1gxW7UJAUgbxbbIYeCR821ZRqWxY1I9/9fHrgtxCKFlym3mmF4ymLMlZm3Q52
	GZD7ThnXRo3Ujm79y6979PQAX5K4uO+zESbEGZG02g06qYd2U2GHm7XBuz8i56DaAIR6pDn+sA+
	/aMFvhExnuGS9BUVrcI1pITeNCMurhql1743fBdjypKV2JILthSDiGNLeRIGKOnhV/7psxqO+M7
	nbaWvhuAwnIdxVihU2NayCiuw9ovQLB+lmzGOrBJsgyrys+RFroY3i2btpAspLv+AOsdxAX4k5n
	RUXmHHK5clbOclktnLZB6qkm1QEl77OUbRFFWGB4iuiF5qNTSe1eUT4=
X-Received: by 2002:a05:690c:39a:b0:8b0:a8ce:5794 with SMTP id
 00721157ae682-8b0f216360emr9898317b3.26.1792245342432; Sat, 17 Oct 2026
 06:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com> <20261016103630.6e8fbaa5@gandalf.local.home>
In-Reply-To: <20261016103630.6e8fbaa5@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sat, 17 Oct 2026 15:55:31 +0200
X-Gm-Features: AclHuK-2Q3jw5htyblPTbANoT7rDStvHfnCBo-DhiyiYGqRfnGspVuTujsxRsgk
Message-ID: <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:36=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Sun, 30 Aug 2026 16:36:37 +0200
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
>
> > diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/ri=
scv_tlb.h
>
> Please do not put architecture specific events in include/trace.
>
> They belong in the architecture.
>
> See the example code in samples/trace_events/trace-events-sample.[ch]
> as well as the Makefile there on how to put trace events in directories
> outside of include/trace/
>
> Thanks,
>
> -- Steve
>

Hi Steve,

Thanks for the review.

I've moved the trace event definition to
arch/riscv/include/asm/riscv_tlb.h in v5, following the existing
RISC-V tracepoint convention.

The updated patch is available here:
https://lore.kernel.org/linux-riscv/20261017-tlb_tracepoint-v5-1-256fb5393a=
7f@gmail.com/

Thanks for pointing this out.

--=20
Kind regards,
Roman 'Hedin' Storozhenko
