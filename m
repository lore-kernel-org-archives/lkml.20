Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2284B3644A4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684856; cv=pass; b=oYaWJu/kM9XTYBI5U9C3pMvC0Zh4j4o+ifFbVSORUbi+F7do058bYXMDWZ1ps7x2RuMcJn3oL+k+vpxNj82GS5HS88gpIR3k2IimYDOZO6XbZ3I6KEa4BIRombgF9ItP9WV6GveQ/R0kOhrSTzQFB5Ebro2zJxT9RBuf2nVSAeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684856; c=relaxed/simple;
	bh=FtMUsQ3c+eU5+RWwNkmgMZ0NRIy/xc4bbMVT5fiF/aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfzMOr30GA9LlPwux6L4QaCmZ3Wr17c8kfzgXLLVd9+aQPhNxbFca6xpBXl3/+UQKWvqR70FDZumW5uJiX4QmLaR6mq+WXVJiTkgKroMy0fEKFtxYjfadK7rGByP+K1rkwGz7wxZxqs13O7LBQOQvQ3K1H2zt/db3uz68j1jlzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9TizUcl; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9TizUcl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso3587553a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788684853; cv=none;
        d=google.com; s=arc-20260327;
        b=F2AstcvQmssfFDgDR80ofaxWUoHQbDsmICB8W9e85PdPp6U6mnjlKrDvyqi8qOaCzK
         EImKfgXO8gVKUijxX7SsNRPWnRoi/qwW3qEGIs6GC3IEzYQHwBNq7l1TxtxKW18adZ7+
         Z/9QnjsSbQV7We//cl1xGo/i4JYY64x99XaSQSPh5FM8NoAThhsQgMc/4wB8WFyPi3FC
         eGVkKIKusIZn/9U7LjE9KpYAYpYxcvg4FPyx4vLtHJ2f91qehbh6lK47u+SKT8xCfgJb
         CTsbPD4JDv9okVSxcw+OxlR+f9lwVwjxScXDoqQzXBv1tMBSHxUq75C2jhD9vEgxvMXd
         9/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        fh=Yyj96KLsumDeESCFV4MGRKIOAm8ezxbCg1tOFexppVI=;
        b=apbvjvkiQEgjmd2o1AHkYPao/s1vAI4P/DTk8pCenMUzVgyiWIuhlokuDh49DDA4Op
         zBUMPxz7SEL/tUMt4fKbJa583v4Rlki8Z8HOT5AKgAqNdKWPQEzXVuPBUM+q3SVz1Epi
         P455gAh13Bk4ywt4SkTaFbUw6x5+IJXkaqrjBPkPfqa5KaeF89gziT7ldX+zmBhHVMWA
         qc8Oyjcw1+TiM469/FvBtK4oldr/Vzu3KF6gKROwHU3o+94ELw0eTOdidSfPGR6wN00x
         m/8WubAX3i75GAs4slTMsfkhNwhq74xZE9/gtCXqmFgoyvxKjXHMU8HMgw8VTvu4qeRK
         osZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684853; x=1789289653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=h9TizUclhnkWlz6L9RI1PZiRuKD2A6UZqzwrBT4mzNeaT+v6QRA7r4RC6B6gZ8t3Wh
         9VtwOqfAhpgtrz49eF7x0JDQVIA7Y5yAz2EtSNgn7VXyNl7Ae5C/5760Ex+EMEVj5vKT
         wsqDQbqjCurHiHAJ52WUifBMseVPi8eagaf+HpjFBX66AzHmp+b8jM1HyG/ijV2/r10G
         G9rOc6T+vGvLQ1Y8VSnBNUwrMJL3dEo8zYURQQcp9Y4fN7DP11TopTJQh+d1vbG/1TDZ
         3efGsk2hoO7KzAgaVfJfIIUSYqhs1BRoJOXBaEJyDK1QwxjbT4SudYw4FlGDaeBtQng7
         76eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684853; x=1789289653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=a+gBFxg8Q1RMOq6fm9JuznKaSHXlReAV0ZpTAddE0dc7G2jspqHmdmDEIWEe7i1Zlt
         k+0lr2JXACUsmYMf9djNqEhpXjgixuAYiK0GyyzAviXkOn3b2Uj9jEC7LsnWH70/S2IO
         6lwUj9xtHh4M7FFUqnSTb7+3kFYwZCSe+wdWqVqtcenm3k1AkJu55W4GMVqvI3qxLq4c
         yeyufwOjDIi7TO2LUSjtCIRwoMjiPGpdAn/qrQ2e22galSMmD1pgag6CUrmEprqfzmLU
         vzRzHLWCUNoIfiF0b2mWiGpgZI+b7lriSGsGKDeroqfNkWIiIwBEuMFWAfVm4CuCmyZr
         3QsQ==
X-Forwarded-Encrypted: i=1; AKwUvBypJ+dLans8OmdsUtl0TS8bYeT6MMkVdXwabRMHRiXElvpaWSzzqN2w6zmv6I/zhuhEHLJ9ZdWDKPKnEbk=@vger.kernel.org
X-Gm-Message-State: AFuF++nlOcqqi+yE7E9WzwRkqryr4nCX5I76EHERaVQrOH4/IbOPuD7a
	rER7cNdoiCOs0zYxUENjE8kJqDMtydUR5MDX7EKK3hwcLACpIra6hYyXEl6dLJ7RQOShOwu4sW2
	2T5KZ3sB8mSmkV5zkS7ugnzHvpYapXEc=
X-Gm-Gg: AYBFou1bWgFhbrJC+qNW+4Q7Ikw5NX17sAeg035TrEZRh7INaY1QV9nrFnhU9KkqO/i
	oH0ybawmybpOTGHPh0JIFveSu+WJB6/SDeWz52svjvDcreWAThUfNBHkJmc0SBzWwoYwlV9TB2Y
	Frw3rKuNnSHb6rkYz146ILMLOybmt6DBHGxvgaApOG5z3iZwrFbUfxyXhvjWBx/Tpeb6ah6bJsx
	LOc5FDFqyioj5LAS+S9erx/Dl7/sce0uwjFV4ZV85wrtAYFtX75mih0Jo9uO5LDwZGwV/HMIBDP
	inqj+HK6fCuqU7zn1eyj5ENery1ivjeKeQ8ZEOCHXqAaqRHfoH1QcA1xQkxrHGtIMqPh6Uz3Q4r
	1SSK+jHhILVYR9BV4wCrLCj2A3h4ZxWc8TcpxVghgaw==
X-Received: by 2002:a05:6402:27ce:b0:6a6:7882:89f2 with SMTP id
 4fb4d7f45d1cf-6a7e8f9623cmr5389972a12.17.1788684852982; Sun, 06 Sep 2026
 01:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 10:53:59 +0200
X-Gm-Features: AcwNN1UUMEovJX_eDQLTzWZBni3pDHzUeZjtKQmab2rob-n71CYiUsiteVtNV_I
Message-ID: <CA+=Fv5SZRccPT=1A39uqucCcCahkMCeecX_FnnCt-q39o=vx5g@mail.gmail.com>
Subject: Re: [PATCH v2 01/22] alpha: enter hardirq context before looking up
 the irq descriptor
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

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> handle_irq() called irq_to_desc() before irq_enter(), so that lookup ran
> with the preempt count still saying task context and with RCU not yet
> watching.  Generic code called from an interrupt handler should see
> hardirq context, and irq_to_desc() is more than an array index once
> SPARSE_IRQ is in use.
>
> Move irq_enter() to the top of the function and add the matching
> irq_exit() to the invalid interrupt path.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/irq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> index 4a6a8b1d5a8b..5867a1655045 100644
> --- a/arch/alpha/kernel/irq.c
> +++ b/arch/alpha/kernel/irq.c
> @@ -107,18 +107,21 @@ handle_irq(int irq)
>          * handled by some other CPU. (or is disabled)
>          */
>         static unsigned int illegal_count=3D0;
> -       struct irq_desc *desc =3D irq_to_desc(irq);
> -
> +       struct irq_desc *desc;
> +
> +       irq_enter();
> +
> +       desc =3D irq_to_desc(irq);
>         if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
>             illegal_count < MAX_ILLEGAL_IRQS)) {
>                 irq_err_count++;
>                 illegal_count++;
>                 printk(KERN_CRIT "device_interrupt: invalid interrupt %d\=
n",
>                        irq);
> +               irq_exit();
>                 return;
>         }
>
> -       irq_enter();
>         generic_handle_irq_desc(desc);
>         irq_exit();
>  }
>

Since this patch is unchanged in v2, and we agreed to handle the
hardirq-context consolidation as a follow-up, my tags from reviewing
and testing the current change are:

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
