Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793721151;
	b=Rl+BuSmJLkWqnLoB540+6Uvt6FpjE1YK1nmTfaHbiBqnX0xUi7Rj7lzlRiGr+9Bqc/AB
	 KBfMEEo+H4gIdbkZHZAnF1Mr7fWwsET5Wc4Bj+2p2NgmBfqmWdUQ+jJJM+vaFB3lJm9Nz
	 HzbuK3Fdzwhoey8IKtSFXN4h37vlKphcRgBhRVTB0RNxGAdCJ9o7X9xtygfQn4E3IwDk5
	 FAUp7prmJBxwjO3uarK5R96PGef0KzlU3M8Uk4/ajuymnfzd4+skcMZRpbdE0FS3CT9g3
	 UyXUdt/JsL2NFCl9K+xc7jUKmD4LMGz53yfhqYqfcnOPR5uwkvZjyTmfbAJKgS1nQdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
	b=Hx7A8nA/ro+JWJQTEE7vFo4z9xnJgWfPMNodoKG3Nv4pVgBMt5KqLMIlf5Gjp3n7aO4b
	 m0dKKA41CS+BeIBD+uVwM4GQA06MtFT4m0fiuswsSFh95pQkdyL56ZMDjqItaP0db7qeu
	 ZuEffZ7IvZ7H3QsJwJju8QVorTkxtr4d4g+BVCuMLd2afBELsT6Deov+T/sDDk9BsSVOB
	 7Ms49fsWEyo9qzom7BSMOaAQM/gcmrO2ZBzMBVetnInib4FGp2mBj299Hhf8pzg80RC8H
	 l6CvguhTpneVvHFNFYrCq+D4cXbI35RKCxahCeDPnTEGp+HD+LnNw7LPDw0OyFLFaiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="EmlfQg/V";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABD606D811
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14ABD606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=EmlfQg/V
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4519670f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721149; cv=none;
        d=google.com; s=arc-20260327;
        b=Zjldn9S+pqs8D/sOnY2BVjD6rFegjx/f5iLEsDin22TuQz6OKEZdxhudi3jxmyzEYK
         bF3sYUcnIgsDbh0zTBNdzFu4B8eZrCcRyzmFe1q/9lU3N08g6hOoI/7yEOgobXLgJz/7
         EJPNHgaTIluTox2cY/PNRITw+76ADooa48cg2ig7dJgIk9qsGZnDD/qSDGGnEnddzhzV
         YE4nnBbIRT+lWkUFi3t7rNgVu0A8MPzuBjh9S2IpBcWGSDeMoC8Pvyg+l+tywo2Cv7Vs
         51T116pWM2QYLGlId3eTeoqEbaSL5bw721Pc8fRaDpmqQvHoZFdu6yTxNDm0veT/TNcD
         ihPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        fh=6JGIV95TaYiG713muJ4S+XHoWeRgoTPbYE2lJTkG/fI=;
        b=ZM9TshBPLr3VxOeI1HpNCm/pgdTvHSmtceF9v+uyuU3AniBu1iSV2oc00NE+W7ka87
         tJhaJrm95kKN2K4KAwf518EEhcX1z6mg2v+ixq4fdz4Jz3edfW2YrSoOGFxvhs5LbE2F
         BFux4M5t408R/mtFBkHDWbGQ7hfeugHN1ZVuqeDkbLzhOMtVPkZTrPfIOobIm70hxjAH
         3SJnZcosf1fom9Yt0xV8l2FTWKQR2/2FBv/I0Opo1K89cfwNGadFZ6d5Mot3AJfS5oQj
         QGCDUWJOWqCDkb0lDlu9VsVCJkHX7bmvy1f3GZI1UobSNzolhUO0rR4r84+EYHpzhjA+
         BZYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793721149; x=1794325949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        b=EmlfQg/VPnPHQ3LkjW8gYWuqUhDCeZyZWf7cmCKPqMWlmywr5fkgAoTMc07uOJVJpW
         F7ybvYLB8D3WeWIuwFtZ8rkUbu7lJfaGWOqZjWI8weSZUxTp0DU3gKIQvpfLYdHadEdo
         QVC9gFdXmlF++gUvYk2klc0dTccEgESygklPqw891LZAZuD7bhym4fQa4/BrkkAx9z9N
         g8pxGILE61zJxHrkORfK855+iANdWbIK0ezTdaOixrimf/Dv66pEB/EB1sm6xbEyiMBz
         nGIr0QtHYKXTMkkbkobS7FHtvd02FV52hQpzS1RD7kTMhJR/eGOiruruevgyPAwM4nTl
         wDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721149; x=1794325949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        b=aGAv8Q7k8YmQnetSRnvhwOyqrhtZhGCyt3wd7h4aYLdpTr8bIv75QSL8+U+9wMHOMB
         BjKanfm1Ycg/h4uPIOn+Qx7a+jm+nes6zzu/ZTeb2QUrILTNvACZvCSgrEN+aIh9SNrR
         uTiHVvRKAMLxAkl3met0MWPAGI3wx9C5o3HqWKDsvzFjNClr91AI8ut9wCFAyf1PaXHO
         InIug12luqIC5apL7pwZRCIWs0gxaihAUXDqKXx8eXil5jJzpsj+Xj8hQRLL609VvGMN
         x95XICMpdujnI4yC1+1Et9U+4x6zp1BJ//fMJu8RMcTnZBe+wnLe4yGbXp9d4Yn/swcb
         fV0w==
X-Forwarded-Encrypted: i=1; AKwUvByyc8LYtKii9d3EXWU4Rw5ONXbPMN0XnIOsS0thExnlo/5bmUEyWcDMTrOu63C5Y7d692Zyzucsn516czI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BNjvfBa27R6WumzWc5Tksat84QgUYl9f6CmakH9qr1aX9gmuZ
	sA+6MG6RRz/N5JZX5VDbIltbcigkB8f+biZ/eUmnLSXn+nzPlKcJG1PGSMmTM4AjbRvRHQ66z1S
	zE5pwGOoTF6mFpAybcd9OSVG4PquIfCXXyLzEf56N8w==
X-Gm-Gg: AYBFou2VnIwvk9Dokkd5nnB8U6iLhDMr1xB5iKIUkcvS+DhDT8QOI/yPWLqd+ycFmpu
	JtoAEUbjkyyoX7bTnIGHoKMWbdcX6k+uB8ZSqCe6NEkApQprGrXsScNj+lvhR9kGeiTgB131l23
	+oy10oLoiHPZH07XnUV1m6xr0ITqjZL1YbD6iyqoETcoo0vY0HpI3/gSHgNp91LNowx3/BGSZk5
	kV8DX4J+e+dWGsTSX2NxDBX2kz56n+RZ3DSqo9qU9TBkrBK82yMHCActN27ZAykt3HOfYmSwQ+s
	/VFwKdbzPPfdHEjOqOOfPV2BXZt0s8TcnlLw9GLPTUYArKw/R+gm+qEQ4vxTiF3ikEauZ25dVws
	RDHhYr6GFsm44gGbPYqFUjciH8GM4hlkEnrImlJPFoE6tDtkepWNgzn4iZWv43O5yaEy2HWkG5d
	OjjRxJq8146Pa2AC7MKiHV+x4KPnYinrig+1vZvVkJVUQQod1VFPuwErZK
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-48e6e501911mr30600099f8f.43.1793721149190; Tue, 03 Nov 2026
 07:52:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
In-Reply-To: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Nov 2026 21:22:17 +0530
X-Gm-Features: AclHuK-Duz2U2kH9foWsdX6nwnK4quq9DLKbc6uMPaHmTR3hhx4HWy-1ofAnrKc
Message-ID: <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ work
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:34=E2=80=AFPM Troy Mitchell <troy.mitchell@linux.d=
ev> wrote:
>
> Remote IMSIC state updates are deferred to a timer on the target CPU.
> If that CPU has stopped its local clockevent and is waiting for a
> broadcast interrupt, enabling the broadcast IRQ can depend on delivery
> of that same interrupt. This can stall timer delivery when the broadcast
> IRQ is unmasked or moved to another CPU, including during CPU hotplug.
>
> Queue hard IRQ work to synchronize remote state independently of timer
> delivery. Keep synchronous updates on the local CPU and the timer retry
> for an unfinished vector move. Hard IRQ work also avoids depending on a
> schedulable worker when PREEMPT_RT is enabled.

Using timer retry for local CPU and IRQ work queue for remote CPUs looks
strange. Why not use IRQ work queue even for local CPU ??

>
> Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early d=
river")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
> This was found while bringing up the SoC timer on SpacemiT K3 as a tick
> broadcast device.
>
> Without a real broadcast device, the tick code falls back to the hrtimer
> based broadcast, which keeps one CPU's local timer running. Once the SoC
> timer is registered it replaces the hrtimer broadcast, and every CPU may
> stop its local timer in idle.
>
> On K3 the SoC timer interrupt goes through APLIC in MSI mode to IMSIC.
> When the CPU owning it goes offline, the interrupt is moved to a CPU
> that may already be idle with its local timer stopped. IMSIC leaves the
> enable on the new target to a timer on that CPU, and that timer can only
> fire through the broadcast interrupt, which is not enabled yet. The
> system stalls.
>
> Tested on a K3 COM260 board by offlining the CPU owning the broadcast
> interrupt, and then each CPU in turn, under a timerfd load:
> - v7.4-rc1 with the SpacemiT SoC timer series and local timers forced
>   to stop in idle
> - a vendor 6.18 kernel with SBI cpuidle states that stop the local timer
>
> Both stall without this patch and pass with it.
> ---
>  drivers/irqchip/Kconfig                 |  1 +
>  drivers/irqchip/irq-riscv-imsic-state.c | 19 +++++++++++++------
>  drivers/irqchip/irq-riscv-imsic-state.h |  4 ++++
>  3 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 136bab41f801..5cdc3f52198c 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -651,6 +651,7 @@ config RISCV_IMSIC
>         bool
>         depends on RISCV
>         select IRQ_DOMAIN_HIERARCHY
> +       select IRQ_WORK if SMP
>         select GENERIC_IRQ_MATRIX_ALLOCATOR
>         select GENERIC_MSI_IRQ
>         select IRQ_MSI_LIB
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index 01620373b43a..f6373e4019a2 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -252,6 +252,11 @@ void imsic_local_delivery(bool enable)
>  }
>
>  #ifdef CONFIG_SMP
> +static void imsic_local_sync_work(struct irq_work *work)
> +{
> +       imsic_local_sync_all(false);
> +}
> +
>  static void imsic_local_timer_callback(struct timer_list *timer)
>  {
>         imsic_local_sync_all(false);
> @@ -268,18 +273,19 @@ static void __imsic_remote_sync(struct imsic_local_=
priv *lpriv, unsigned int cpu
>          */
>
>         /*
> -        * We schedule a timer on the target CPU if the target CPU is not
> -        * same as the current CPU. An offline CPU will unconditionally
> -        * synchronize IDs through imsic_starting_cpu() when the
> -        * CPU is brought up.
> +        * A remote CPU may have stopped its local timer and be waiting f=
or
> +        * the broadcast interrupt whose IMSIC state needs updating. Use =
an
> +        * IPI-backed work item so enabling that interrupt does not depen=
d on
> +        * its delivery. An offline CPU synchronizes IDs in imsic_startin=
g_cpu().
>          */
>         if (cpu_online(cpu)) {
>                 if (cpu =3D=3D smp_processor_id()) {
>                         if (__imsic_local_sync(lpriv))
>                                 return;
> +                       __imsic_local_timer_start(lpriv, cpu);
> +               } else {
> +                       irq_work_queue_on(&lpriv->sync_work, cpu);
>                 }
> -
> -               __imsic_local_timer_start(lpriv, cpu);
>         }
>  }
>  #else
> @@ -510,6 +516,7 @@ static int __init imsic_local_init(void)
>  #ifdef CONFIG_SMP
>                 /* Setup lazy timer for synchronization */
>                 timer_setup(&lpriv->timer, imsic_local_timer_callback, TI=
MER_PINNED);
> +               lpriv->sync_work =3D IRQ_WORK_INIT_HARD(imsic_local_sync_=
work);
>  #endif
>
>                 /* Allocate vector array */
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/ir=
q-riscv-imsic-state.h
> index 189829b8673a..a36b9f0ef840 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.h
> +++ b/drivers/irqchip/irq-riscv-imsic-state.h
> @@ -9,6 +9,7 @@
>
>  #include <linux/irqchip/riscv-imsic.h>
>  #include <linux/irqdomain.h>
> +#include <linux/irq_work.h>
>  #include <linux/fwnode.h>
>  #include <linux/timer.h>
>
> @@ -34,6 +35,9 @@ struct imsic_local_priv {
>         unsigned long                           *dirty_bitmap;
>
>  #ifdef CONFIG_SMP
> +       /* Remote synchronization must not depend on a timer interrupt. *=
/
> +       struct irq_work                         sync_work;
> +
>         /* Local timer for synchronization */
>         struct timer_list                       timer;
>  #endif
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-imsic-remote-sync-irqwork-9cfec6c410de
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.dev>
>

Regards,
Anup
