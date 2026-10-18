Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A859392C2E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343711; cv=pass; b=jKscY3qQMtSJmIzzuqPyiSKFTO0c95ubi9GaaUOp1FIhh/kwe6LxmlQasMOmTFO+ucntF/KDpbNoQGW5Gq3VWgN/ZJqry8VHVgNdhF6Zwu1Qh96hgALZPad/T1y1PqaUFgrFsqKe6KS5phX/Di/FR5Jyde7zs6OVmRgRvuRkv/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343711; c=relaxed/simple;
	bh=04pzH83uw8QzvNB175Y0AMtXKA4DsexYROmDgi4NEFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhtvChavtUzZTRvO76galDZ8yGyxOIakTrX+kCw9KC4HW/c32//jAi3KEVdPlQtX0qVYG7ewU65UZV7wbSchD0IKDsehdJL2P6GRJQ54QAGEipKhk9+zqzzNy1krIKlz0+dhQm/RX/Fg35YwmRF30RTdFLW5hDb/WeFWfBlfPsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbzb4S00; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbzb4S00"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1805761a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792343707; cv=none;
        d=google.com; s=arc-20260327;
        b=Kd0dKm5fn/2YoNdvvhNS5GDuZIoiwV3T8uvYqTqHVChxUXgQvKBcjexeXpqoBdU6XK
         Ic2Z/ZmnT24WCLLhzQ+lgSPevJvM4+3OZP98rMfNTjMaa1YuyQ+KFvrZjQUpJP2yPWL6
         omwiUnSUlJjgNCVnW2iqIDFZlh9+n3TmbITHyb8KoEIdZsBAtSS5iYVvweUBW8kpSnsm
         afXUKYMUM2zeLMzLviKyMu+8XhQr+UTVwTcdh6B9Z5WDCzOltyc3GL2oGleL0HcS39AX
         j+0bQ1Nt8HFMB5bmIKz+EAVcZtE0s9r/mcrNrAHp1XM02zQ5R09OE0yaW1u+1tUCF6Zj
         QwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1ZrYZG7r8dLUaivBW3dOBXJiGQCuaRU1xIPJu2gHrs=;
        fh=bEBiUJyWNfYm1BSdDucQkWOKP9hpgS2635DBmAZ4Rwc=;
        b=K7hglQUTbdEm3MDSn3JmWDJ0GoRTFlCN+3DM02J2sSMnfFk0aH0SNuF3Ig1iHLLsAl
         GcjuZA52/HbjS7+Y+V70R5GqGeHiiKxRU8NosQYJTZLEPfSLGSp0a7s0kwS7KQRRxYtH
         ZS6rz5LUh6yoKFYgeiWbGhmO1WUA0LIXPEPxSPt1vyF6q3TN5KzGE8EnC1jg0rcda3QT
         KzPJaVB4ZCSJMQoq3x2APiUat7f+A3QAPo3yqk904Vkj+NvFqmzAtDsTZ1cjzGSQgIfk
         c65n/lC7GKuUJNGenf5xVTKWgfJkVPI73OlvHgSm+gkxjYo1oBxwdrrR/fX+OLFbkYoz
         3JvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343707; x=1792948507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1ZrYZG7r8dLUaivBW3dOBXJiGQCuaRU1xIPJu2gHrs=;
        b=cbzb4S00XAUcJLUNDTUzsAnSK2KuWh3TxRJ9PQF6WbvtmXIJv9/yScENQZQ7dh3Wrn
         4cyS7YrppRAWLWiwk5lSKJwZnZb4eZdv3TvgKuqM+5t5p1/z2lkZDNavHqvcs73ckFPf
         kqOrVWFffYpjgXuSaBHzqS1vXj7e139O7/1ES+fqKrsba4DdM7+InxmjUOMuFq7ithoy
         6aXhMu8q3ZbnZYdRV1AvTi6wuX6wF/c38kFyjDxeluSriAI7EtaDquevSsi2NXquHOe8
         KARpUYDyZyZ7QkdXS0F4FDUKijeTJXn0yaffLhdBohlhELzDjfrpAFTt3NARR7UYtbbi
         PO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343707; x=1792948507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1ZrYZG7r8dLUaivBW3dOBXJiGQCuaRU1xIPJu2gHrs=;
        b=abxGMFcU8w3fqvdiiAVBQSohnA9T6x0WZAJPTvnN9UCQh4JHhyoXV6ohG4dUa6kjol
         hbvUpPiuSirmmhWG9qG7f10EhYVcdM+4v0sPQkm0XqYWEE6yZyrscCZ70nvK58+yQjaa
         Dcc1qhyfxZFzsaxvmR+DZFLMrg2wh4Ds1/c7g1vGYNX+sT94LV9LYyV65H+fgvr9zo4V
         UvG4zjufmtJxpnGembU/UF4KwkLqnMAyZ3jVhSvF5rXz2pAdp3tOPRIEqhUsMc1JlFZp
         qgMTs972OuoFE0uOsrTIdgad/5WeqcjBwcZCId3nm/b+jtqXi6egQrqRb8YsXCAHnrF5
         YuYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxb9rsg9Q2E8en8aEJ4TcKV8AO9CTHWd2leGoZzA2JuKRJ4NdzL4haDnEpSeQZbdbch64+0OVLcJfV+fGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWNi69UgShSoQbiZbcOU01qpaVC5j1WCJieyfD3eFKrjkRDpO3
	qrY1vkgHrNBBQDtVFKKkHSn1RPasJ1yRR8IBcyaPWVBACZme4h/DgRq/gw84hkkEnLPhiA/BsX4
	dLPk11UA+czilT7joFsEg8GdPFPCKXRhF6bIfyBM=
X-Gm-Gg: AYBFou20HN0xO4FTyhd1wLNvrJXcdo0txZ9H8ITX9P18cfn609vqBnr8UO115zYmac4
	Y1JOwh2BgxFRFQgkHUXm/T6gBK/wQGuFt8mnQZANqSScWsX5OZUALXbYwDHCQ65gSTuHxWkuW28
	l+ZiNoYEuhDbJnvzrK8MhY6MQFV5DZpMrMRUhHVanIZ8aBNGr1XzlVmZ3PqWpVqIAIkca6pjd21
	3p39DZhn8gyYLqku3naJZU9aW1hZ+FfXHKsrqg5m2XX+9DbUXADql5xn6+43M8J9yQ+OUrJjl64
	FLRSmGiMfCNvXO9HpW7aN5wjsV21GwOfvpYp1CErwVjuxIby9s3RtT+iLWJyLDamLNBKnanfXFK
	5sw4ayj/Qp7S6OowGGkzYiBdt/XXtHOw/ZHvNtR4+kQ==
X-Received: by 2002:a05:6402:305c:20b0:6b1:c79f:9c05 with SMTP id
 4fb4d7f45d1cf-6b3a81c380fmr2188762a12.36.1792343707018; Sun, 18 Oct 2026
 10:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018095334.869926-1-ramin.moussavi@yacoub.de>
In-Reply-To: <20261018095334.869926-1-ramin.moussavi@yacoub.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 19:14:55 +0200
X-Gm-Features: AclHuK8GZCUW3I0Oao0gxwo1dxlHyOzG-zDEBSZj881gRRmHHuyAogHsOe-WdI8
Message-ID: <CA+=Fv5RBJMMM1WKDNrFzKU=2BA7ETJXJjiBEqP9f+=+Xs=cE_g@mail.gmail.com>
Subject: Re: [PATCH] sparc32: sun4m: do not clear IPIs that were not handled
To: Ramin Moussavi <ramin.moussavi@yacoub.de>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S . Miller" <davem@davemloft.net>, 
	Daniel Hellstrom <daniel@gaisler.com>, Imre Kaloz <kaloz@kernel.org>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ramin,

On Sun, Oct 18, 2026 at 11:53=E2=80=AFAM Ramin Moussavi
<ramin.moussavi@yacoub.de> wrote:
>
> maybe_smp4m_msg reads the per-cpu interrupt pending register and then
> writes 0x70000000 to the clear register, acknowledging all three soft
> interrupt levels used for IPIs (12, 13 and 14) whether or not they were
> pending in the value it read. An IPI that another CPU raises between the
> read and the write is acknowledged without ever being handled.
>
> For IRQ_IPI_SINGLE this is not just a delay. __smp_call_single_queue()
> only sends the IPI when the target's call_single_queue was empty, so
> once one IPI is lost no further IPI is sent to that CPU, and every
> remote wakeup queued there waits until the CPU next goes idle and
> flushes the queue. Under CPU-bound load that does not happen: woken
> tasks show up as R in /proc, with a vruntime below that of the tasks
> that keep running, and still do not run until the load ends.
>
> Seen on a 4-CPU SPARCstation 20 under qemu with eight threads doing
> syscalls and window flushes next to threads that wake each other
> through condition variables and pipes: 7 of 8 runs had tasks starving
> for as long as the load lasted (up to 25 minutes), 0 of 4 runs with a
> single CPU. With this change 0 of 8 runs starved.
>
> Acknowledge only the levels that were seen. A level raised after the
> read stays pending and traps again once PIL allows.
>
> Fixes: ecbc42b70acb ("sparc32, sun4m: Implemented SMP IPIs support for SU=
N4M machines")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> ---
>  arch/sparc/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
> index ea51ef52c952..0bc30436f028 100644
> --- a/arch/sparc/kernel/entry.S
> +++ b/arch/sparc/kernel/entry.S
> @@ -275,11 +275,11 @@ maybe_smp4m_msg:
>         sethi   %hi(0x70000000), %o2    ! Check all soft-IRQs
>         ld      [%o5 + %o3], %o1
>         ld      [%o1 + 0x00], %o3       ! sun4m_irq_percpu[cpu]->pending
> -       andcc   %o3, %o2, %g0
> +       andcc   %o3, %o2, %o4
>         be,a    smp4m_ticker
>          cmp    %l7, 14
> -       /* Soft-IRQ IPI */
> -       st      %o2, [%o1 + 0x04]       ! sun4m_irq_percpu[cpu]->clear=3D=
0x70000000
> +       /* Soft-IRQ IPI: clear only the ones we saw, a later one must sta=
y */
> +       st      %o4, [%o1 + 0x04]       ! sun4m_irq_percpu[cpu]->clear
>         WRITE_PAUSE
>         ld      [%o1 + 0x00], %g0       ! sun4m_irq_percpu[cpu]->pending
>         WRITE_PAUSE
> --
> 2.53.0
>

I tested this on a dual-CPU HyperSPARC (RT626) SPARCstation 20 with 512 MB
RAM, using a 32-bit SMP kernel with your patch, Imre's PIL fix and my
HyperSPARC cache changes (not yet published, work in progress).

After a 60-second sanity check, I ran an independent 30-minute stress test:
eight pinned threads issuing syscalls and flushing register windows,
alongside two condition-variable pairs and two pipe pairs waking across
CPUs. All 16 workers kept making progress under load and the test passed.
There were no new core dumps, kernel warnings or RCU stalls.

The same workload also passed a 60-second run with four CPUs under QEMU.

I'm working on HyperSPARC cache-coherency fixes and have also encountered
SMP livelocks where interrupts remain responsive but tasks stop making
progress. I haven't established whether all of these are cache-related, so
this lost-IPI race is particularly interesting.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
