Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7A4A5EBE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469324; cv=pass; b=gqpUl4J5JL/qczepH/pZLJlb8Ukyou6+jGW1di6tH4gZkB4kb6fwcXFvMeHrspmDwVzzxm841FEvXKZ6wCTTLrYG2F4/PPj9m0Vfkt3yEV/4VA5eyOfVr4sc1rqh13iUDpCl1nI3pclhS6+D9Yi1DR1TgBfCPiyc68XC2ibe5dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469324; c=relaxed/simple;
	bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAje1nqbLPXOumLmRBvVJmKHEYNTy5VrJdw59t/gSxKbke6Z8kDYNl9/k8Ujy9l0pa/IWX7X0Xq+t69iP2ve4wIA3HfDSGot19iVl2ZtMvJHVDAY1XUsQtGvvzoTsdXSWvdORPyyuNDqwcoWYfnVjZ0sUKYObbzN2pc6cuneAIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5xt2vE2; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5xt2vE2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so191221a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788469314; cv=none;
        d=google.com; s=arc-20260327;
        b=mKS56QH+R66nOhKvIlBs0UsKnJVwl7mtQUSCDt6ubqgXf4Kb9ulAbA7tDmSU0WMSEa
         R18OYDwBtYb1CBoEPbl5863xDE2AySFe12aNgtreOAvkXzLAv8+0qME2MPSzx8XDCews
         21rT16AEacJNfYK8yJiJNCKAMXh0buerELiUYyNhv4FO/YcBhqCe+O/7q1HUGCcXkgaW
         ejZtd3Z9X5n4iXnhS3/gNpLEKVb3wVolF/s22ivMQ7eivBOIFyASgGNo79rcHIQgx4dQ
         5XOx2pIFBlEW/JmApgpDyPgJw8XeXJtORVO4WZm8InWgeBTSoECvuS31pRGO0xn/eteW
         WvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        fh=xcVT0U3Kc2XquDwi6S3G4mniX6RdAYMsbD6zKNd9ljk=;
        b=NeFdUKIkS5t37j0YJSfGmQ9ZBfucfdkKdfudb7DN7LE5zsujlJbTU3eHHvX+rP7DOg
         TdbQUlmYKDjP/13/WbKjADLD2shme8/OH6mDeogkA6kvtRQYm8kEFlLCMRcxFKDca3PX
         tVNKvPSb206Kw+J3EhYTWrFKiKt0JfLoiioqodMDtqsXi1/ecbclD1JhLCKNrasFlSqu
         EnzTgv6IXgVQ1AaJ4kgHMnkqSd70dwwZSNBlLRbJKphkCKXXJV+3vl5+h7YqN7xyFaTT
         4hZSgeXOdjqkouTI0oqJcViV9wk0CuHT+mcXTScbcfPV4InZi3D85sRX2XfBjF6KRh+K
         0oig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469314; x=1789074114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        b=N5xt2vE2RzJ/NfHM7WD28B6f7yv1s/jTdsfkwSI/n/ccrJSgp8f6v/hrHPgW9JQ23Y
         hSj78PUuRWnKrHvt9u/40pDvz8yR3zi6j08AYlBcPH03wM1eVTRW2KbYnvGXPfWA1Yp3
         p1WuCdoOyqzZmO1Zvtnw00UKNHx08zAJpZhLb2XIXgKfo+2F/YFA+Vr+Ur1J1uiJXmbD
         dk8zXV4xA0/p0DCyF+gSWNrnAf9498VzQFXHAWoNa0L/oD96CTZTdYj0PTMQfuz1jkgE
         F8dH7y8EnHt+oGup1ALB1CS2cUffSMxP9F3YPqNjFNYhjH2ofGK6EMJD+ZGD6Yd9XPmq
         2W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469314; x=1789074114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yuOkHyQOJFHYoOA3DdV+zE9rezwn3b+EymmrWKCfO0=;
        b=XbwkFQmTi7KBxui9wQrXM1dQxpwyr4XDInSL6Ev4x4A/fz1AJfUNcAlW8JD+LFJfQU
         wLCJzNz7tl7+a3n7Rt5Ss1PUslw3DG5MFk/SuY6sY/JRq5E7zbdqrBXibolXOPwun+HD
         R2FYBwg+qJhwUWjlyBkfSpJXoiVIXa3VHqPL9HqnbNufBHxbPmoWxLL3e0ZGUs4SPjW+
         b88nsCvRfWmPcoQMSrCxYiSbNadaPx/pmXPm90c91S5Gp8ljv+S/8GXhMlgtEZBBuIJX
         2cCDrMWL88KHk68fVjwFr1JuMk0kIHoll/RkqkZB2a1MqvIQhFToZPFoEq6yaWVfqetI
         UYPA==
X-Forwarded-Encrypted: i=1; AKwUvBwaJjDCNcxpOFNIQxiH7wPW5Xj+jqSCV2H253zCy6WnnXxlYdn1EGwV54APqZ4ZcfSPk5li/wGGB07YCsg=@vger.kernel.org
X-Gm-Message-State: AFuF++nKdHmKvI653i98oe1RgAtMjYoGobjn8UslT6iDLt7FWF5b58uZ
	8mNk3Kl/Z0F3jUYY2TPdGBxvbqHx8aJ8QSZNP/omcSqTL7V5HIbSMfHnI4B0FB5ybcHIoXSu/Yd
	2lGDmB4GVr3w+zCgSGHepU9UXQo8dD724yTjA
X-Gm-Gg: AYBFou0QH1XbaROeFHnM18JAzag4obTKnYlrGLdljUUz4wya9js6X+inYV8yCkzlyBD
	+CwVr9HK+63uGs9wOUBWCs4PseCii446n8b7Tu69niUKhCQ2akIXMU0pa+Yljt/YeMG9QLe+VHo
	tXnF9HUrhRTzLVL5YrTw9bC9cZfYYpKsLVJAsCjkYmgb4HhlXbu/V2rxW+Z8ujN+OaK4H+z6TSG
	J7H4b0eWe/gTxcnF03p7ToP4h8Ub02nYflkFc2w/7N5DqTCugwAOT0zYio1tTtnEHpYsaUqfZEf
	EnbivYm38UMIjwIhTsCytIq+yiJJ81p0sRxKOiLgnivAgIutJKlZHc90Ei6I0gPo7RfB7SerMdt
	eApCHACQH8/DAgln/KPR2z6TScd/a1G0=
X-Received: by 2002:a05:6402:3203:b0:6a5:f9ab:bdfd with SMTP id
 4fb4d7f45d1cf-6a7e8cb104fmr612198a12.0.1788469314120; Thu, 03 Sep 2026
 14:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <6e7a5e56a201a74c00d1615a7ac1d58d385194eb.1788277742.git.mattst88@gmail.com>
In-Reply-To: <6e7a5e56a201a74c00d1615a7ac1d58d385194eb.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 23:01:41 +0200
X-Gm-Features: AcwNN1UctXBCyXjdQB9DOXuPKYOdbWfSfCWoFp7K2RjPmXxy_RlgE8G6kc8THUI
Message-ID: <CA+=Fv5TkaU7+yoU-MeHUo5Qs0jhVCexahSubAkzqSyhN+HSdXw@mail.gmail.com>
Subject: Re: [PATCH 22/24] alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP
 support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
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

I tested this on an Alpha UP2000. Basic perf recording works, but
user-register and user-stack sampling still appear to need some
additional work.

`perf record --user-regs=3D?` reports an empty register list, since
tools/perf does not yet provide the Alpha register mask, names, or
IP/SP mappings. Adding DWARF call-graph sampling consequently fails
with EINVAL. I think the corresponding tools/perf support could be
added as a separate patch in this series.

There also appears to be one kernel-side issue with user-stack
sampling. The generic code obtains the stack pointer through
user_stack_pointer(regs), which returns regs->usp on Alpha.

Alpha already has alpha_snapshot_usp(), which initializes this field
for user-mode register frames, but it is currently local to traps.c
and is only called from do_entArith() and do_entIF(). The interrupt
entry path through do_entInt() does not call it.

Perhaps alpha_snapshot_usp() could be moved to a shared header and
called near the beginning of do_entInt(), before dispatching the
interrupt. That would ensure that perf_irq() receives a valid
regs->usp for interrupts taken from userspace, without adding this
work to the SAVE_ALL assembly macro.

The perf register ABI also appears to be missing SP. This could be
provided using current_user_stack_pointer(), as in the older Alpha
implementation.

I have some older Alpha kernel and tools/perf patches which implement
similar support. They target an older API, but I will send them
off-list in case any of the code is useful. Please feel free to reuse
or adapt whatever helps.

Regards,
Magnus
