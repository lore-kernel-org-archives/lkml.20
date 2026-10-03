Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1077397E86
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019177; cv=pass; b=YfVZjUygUrDSWlXKse/PKlx+6t2jOWBObv/5y86I++jfi+Wsl3CA3Z0tM3lubthXR8ZtaIQkfLmllqe0Tr6C/e+OZ66v/uIOEh2lrHkaIxNl8SEgOfo12oGxW170pxemANTOavCbmOumk67r7R0UD4fofWvKz5Q1Vli0sGtDwIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019177; c=relaxed/simple;
	bh=HYD+ToqudDpuaRtSe0fMMsQ+LH+7S828nt4GohMs2Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDJjds2x2anlMgceJlZlatjYBApsA6lpAVCKiyRHB7T+e7gFPoYyIstQytqoyD3rAQ/+91Bm+l00ZYrsLsbBW1cKu/84CmLw4CjtaPxuI8R/sE7QIkVJXLv+N5h777bntDDKoiPUBrWy6u5FfkW39A0L4kkuxUgMsLDk/JBehPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=sIJDf/JN; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="sIJDf/JN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso198273f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019173; cv=none;
        d=google.com; s=arc-20260327;
        b=OIXuQZO+uXuMHRht6dbp06xlAdMKFsIUPUV4Hu4T25T8pPsRjNwp0XN4bufrlbIXU+
         3fZEIIdTw9NfYHaEcIzpEu1i+or7VckmOIcT2IpDUdRvXUkif8jIHl0qPOUCvD/Zrnbv
         NlaKZ1pyoGhptyxkH3MmZB/kMTyu88+QS+G/6wn4C9vcqQojnqQKuwyxfxMnBQucyYp+
         VCvBm1ujAvCkt/ZYzNHYUkb63e3SUbWubzAifG9WgIl3hL0zgdIztV7kiDoyp4PMyigO
         NKB7yjVbnGrLUod2FQfRAFiq/HwYv8izy7d1ZecPOrjykDn99+7f78fnC3o+y9pJ3NmT
         r70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        fh=8C5ErMcnOu2FSTZC1Rz8Z/thiDDvsUbOov1V4oAhewU=;
        b=fe1ugXUU1cY5OoDSrXAV4md8wsNxDWjiIQ4l6ZHQ7KNKGfNe0PNI5Hge6vrzxKcHG9
         iTABWIwh+F6YUI9qEpf+Guv6r1uQ/6Hgk142lWJj63/cFMMLs+k6xfg3QDLjbpNVqzz7
         6p4bIMVOOULvArj6sodsNKit3y7rY5yqTAqTHirQLwBYNQ6LwYs6TmqnAaGLUJeYD/PB
         990JZF8Tk8qLHEvdwHz0Bp8OvPBQQJWPonJ90K2crivSMfBv4I6tsauWtBTBxitfVHuF
         h/xfN/MffCpHNAzlK4Tb4CvulxK9+61VBk7KqP+TzDGBC+NDuqqr+cLXpD6LZ86OqCrO
         VnIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791019173; x=1791623973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=sIJDf/JN2j3oYORqZOoEvgOeOyoUm4bRRGleo60KbKkfWR5BVcvHftxTiXIRGnMBvj
         T/VNxI4VZUk7OHxKrK0mywli3aZDmCSY+QPSjHoXN2nEQEXBSbqcFtOnITem/rnxt9MW
         WaQUks5L5Bd6L0RrvatO7bOVYIPGdnlNpa2hEvMD6F8V6eahA00jQgtDyRgDdQvtmIIJ
         xWOHf+Br98QOFxzaxfNmE3aKfLRJ2AD1wNgkV3bmkaTcmPNZ07r856O9Ql33YaLU1aNS
         S9CjVW047HUol1ZS6oQNvPwP38RG1AW058/OKB6m8GB05bvSLUz0oquGpcsupkezbPOe
         HSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019173; x=1791623973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=a7ZN3+jBbFkNuz/ubB0QHhYpq/FDOch4+BYyPhWcwi5/eL4wVXaO0yYf38mzij/KDC
         rZ4XYLwd1h7vjQYAUhKiryS97jjmGcJm1A331SI2DBGw36Ifaz8JIr2sTCre/Qg9TNdU
         OEC3cqUU6YoO8oNSv9vbW8mF2ZBwmT7DQn0yDl+C9QqV+fCfwabUZ+UfHy7BM2KGWMQt
         1JpNEVIXIuPvi8BsoL7hGdXz0shTNU+la7srtDspAU+ZVwTCKFtMNIw+6sgUUhyyL9w7
         cY0QS7O+ZTLaQCyWMtKD7qRQ6ihkt0kj5XYTHylmomYcAd0Y2Hi13gyUDT9kN9EhYs1m
         2B3A==
X-Forwarded-Encrypted: i=1; AKwUvBy9/Bp5rMHJ5jgUw68VOHjhmDGOp4NXdK6e0u8hd65obNTXQzuqSOSfeyojjye5uOMHAoTyXp54ry/naTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb7f3iC8v528uI7XffIyUUjMXITfonAF6UURRdT52xDheEBN16
	/0fg9H0pWIGPfqWuLwtGtTGIG49mfFfaxaFhn5WZVsDdc/kLH0iLmphZ4W67kSCy1i8CU7NLJLV
	K7EbOccx5ygOuTasJZmG+889PJzvF+ia5QhllNOQ9gw==
X-Gm-Gg: AYBFou0sBzyTkwLQLjCM5rxPK1P9/dq0d4MfZan7jn1saHqaq7YFWImnz19IoJjUjm7
	yBtHWf1mTfZlOA8SifBA0/A3j4kwUttZss+hNCXMB/GFP9JOGggqMwrYgpN+XSqJpYRUt2SfCQP
	IfpVrEfXDNVaQ//l3dYzW2sLNuWtC+AmQwCH+6WLIe91QP2cn4HixvgEh+lWidCaBWbXR7kw5qY
	Jsg14GeVK9n8Wp53X1pMJH7WRZVh80Wp2IbAtYM3r0N0xgw5sL3khI+2fhSC7oOlA6rM9TG/0X4
	EBPCdvYTaSegng/FGKBv1OqLt/fIbFfnEw0aARVk10KTfhHldQX+dPZ7KI+fBV0Aj/QXEzA0x2R
	o1evmWdShntdAR4GX/VbrOeN22/R2IKyYlthxG8x8peQ0rf7CUx9nWYa5u6TAxFnin+1qEkf6Me
	U=
X-Received: by 2002:a05:6000:2289:b0:488:8546:d0b2 with SMTP id
 ffacd0b85a97d-48c48023a32mr2361761f8f.51.1791019172398; Sat, 03 Oct 2026
 02:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814123541.593613-1-jinyu.tang@linux.dev>
In-Reply-To: <20260814123541.593613-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 14:49:19 +0530
X-Gm-Features: AclHuK_Z0ksFSJd3YPpKJCJ3vTWpyr047A-VUpiGpFpHWBI599qCSz9eVjsltbU
Message-ID: <CAAhSdy2TuVK==x2Ewj_yNhG=MkYx+Lrha8aPFA=ROociaG7dGw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Avoid redundant interrupt check for pending timers
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 6:06=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
>
> kvm_vcpu_check_block() calls kvm_arch_vcpu_runnable() before
> checking whether a timer is pending. On RISC-V, kvm_arch_vcpu_runnable()
> already checks all pending guest interrupts through
> kvm_riscv_vcpu_has_interrupts(vcpu, -1UL), including IRQ_VS_TIMER.
>
> Drop the repeated IRQ_VS_TIMER pending-interrupt check from
> kvm_riscv_vcpu_timer_pending() and keep the helper focused on the timer
> deadline state. If the timer becomes pending after the runnable check,
> the timer path still injects IRQ_VS_TIMER and kicks the vCPU through the
> normal wakeup path.
>
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup


> ---
>  arch/riscv/kvm/vcpu_timer.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ae53133c7ab0..0e01bd793772 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -132,11 +132,7 @@ bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *v=
cpu)
>         struct kvm_vcpu_timer *t =3D &vcpu->arch.timer;
>         struct kvm_guest_timer *gt =3D &vcpu->kvm->arch.timer;
>
> -       if (!kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t) ||
> -           kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
> -               return true;
> -       else
> -               return false;
> +       return !kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
>  }
>
>  static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
> --
> 2.43.0
>
