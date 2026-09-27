Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C9E37E5D4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537453; cv=none; b=mXd/+BU9RdZaxQUWwdGsqsqXRBZ2IRci9NaJOTVQoMk4K5+9ufmLLcsNkWyF0nujpRoMAdQ2k8+MWM22yUaCwi3+UFwXajNrIF5g7HJvf+GG5mYoaNQ6Bt2tshhKjQ9q+hvsrvMic2atfQ1gA2tpYB85ENGRnHEGYjlcVBiTqpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537453; c=relaxed/simple;
	bh=p9ZKF9Ap6k1JUlaODV8yJ+lylLxBfXEnCv0v69QZgKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vgv3RY6dFWq+pMqdsnpuekqDeIQU0xlQRZzgZkdyNRjWXooBbkVrWy1r1vOZ7W0o8jSHv3q19tnirxcFngxu7No4DQv5evnpMQwgdMKJHJxFuS06hP7E+mwJsQhrMg90EcXSpjJ4iU5Odrh9nArFrSykAAGJdkSIpBR/XRkcBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiKPLP7I; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiKPLP7I"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso16791015e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537450; x=1791142250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2wFfAuYjBooZY4oJ+a20B6y1DYxavVrLG/ry5G+MGM=;
        b=GiKPLP7I3Sc6D5+i39+pozMjOiq1nTepbf0VfKJLaNzvs+aBOnQ8Rm91oZ5wNLNXvv
         jvqJWgvafm3knJEh1iCQYcze8bRcwRg4o31JvKAbIEcdFKl4I8+6pRb17d9u6UYMyBRV
         Iak5dAe9Tl2ouC6s4P6ws0b2x8VsVE1HXdu0gNsMLHV2bk7IpHHEuzY9apo6ZyYE3gZb
         WyGk79/BKqEXP9JEglaQj5e5IReGjqQnTSQZMdHlWpKG2Wkj+/DBwHCgm/ZwwXS+9EYI
         VTN8bkDhgBIv2n0asD9raCLB+V9qFPvz0OdvdbCNBYgsfN6FTjyvSC8v/a1sTnKXF3UO
         gvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537450; x=1791142250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2wFfAuYjBooZY4oJ+a20B6y1DYxavVrLG/ry5G+MGM=;
        b=VdRmkEkaucbm+afI51iClG8Tnifo80CN2gIY9M+wgQxk9bjFRZDPSyE3L3KwJ1F8eJ
         Rxn/3TaTv/FUp0YLboOCBBCinkcvnkVirv7MSJ1fsy1vJmkfhtCocloS0LrRjim29sNA
         RvxJgjrQYkKidCR+zUZFnv6JCwu1t+Q7ZlyZrKvJzhOs4qVFBYIs7TqW5wWXnqx2taFS
         W4v/YHUS/lritCBPWtm5HZ0c3mlbuAORj3PVX5zEC4+EbfJ0ziYGKAie4aP50bESafbg
         IUqGD2cxVGsswKuEc35Ry8NEbUecwYe3Py2UlDexDYmBzCwsRpuIs3KUXdth4P82Idjo
         FEqw==
X-Forwarded-Encrypted: i=1; AKwUvBwGSQYJBaQ3UrSImODeufgZFF5QYBYJbgsaG1A+U6YEa9LsyESa485jo9ClAnRMFCKvSWlwgceIC8sdh5o=@vger.kernel.org
X-Gm-Message-State: AFuF++ll53+YDF8VBt2dsD8U0vrHzirdIAc1MZW1qWJTRolikdLhcyFh
	B19efxo1VsG8vr8ui442H+9BCvNtuGm476zMY8ti9ULLJh0+4VH7VhCXFVV74Q==
X-Gm-Gg: AYBFou07YW5/M2Y65YnTo8jdE1p1xf0M7gT/gGjbYYw6a2eCzK2KR28543142NDPH6x
	Dng2+a4XOhV1/4WGFr5Lxwq1kNVDrQg1adpZOcDHH3x3GZtJy4rLdYkDV3E+Tn9fQlGiGlnGPzq
	PoPpNlFiUKj/cy8gYRZ1Ok1hdRjmI0HS3vFeQ4D+jMr0pBgRZozi81fGij+jc8aje834Gefcn/E
	FK9mjkWPYpsH1ZYXCMF56BY4lUoXwEsymTwXsNUsPHZINHeix1H4mBG1PqgC3DVKiy8nJEQsRs2
	CADpio+0WoCwOteNtKPrtLMX36FhLmj3qz3UmHcM0kkDTEOEyzoPuQvfMsYz7w1tjzPtepO8Tdk
	bLyLWWBvXCWlZntodxDQz9Mr7U1NG89dr+hRvQE+d4TWvoXMFCxrLZ+sruQCdR0ZEEaPuQunECy
	6OREi374+O9krGS4wrwAx1XFUHr/Fq0r6DjmWUJg/AY9zs1amknMfkquud4zlgSnUbYRmOlytb7
	9Gg1LebjALA1ofdqrobyp6QO6AObCC41jDRTPcXFQ9fGQ/d7xbhtXwHB6AyWjvD50w/nHkt76Po
	lTYF51TbSfCo5rFMHhjWr6+al2LD2R2QKfE36aLwC+j9Oetw7YR5ybLZthXvnfAByfCNWxXKgtF
	v
X-Received: by 2002:a05:600c:c48e:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fe6710a41mr191679495e9.35.1790537450199;
        Sun, 27 Sep 2026 12:30:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e6-5301-2072-0420-f831-ed4e.310.pool.telefonica.de. [2a02:3100:b2e6:5301:2072:420:f831:ed4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178b069sm118607035e9.0.2026.09.27.12.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 12:30:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <yoshinori.sato@nifty.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Rich Felker <dalias@libc.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling them
Date: Sun, 27 Sep 2026 21:30:35 +0200
Message-Id: <20260927193035.6490-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260927191359.6144-1-kmehltretter@gmail.com>
References: <20260927191359.6144-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Yoshinori at yoshinori.sato@nifty.com. The users.sourceforge.jp
address in MAINTAINERS no longer receives mail. The patch is at

https://lore.kernel.org/r/20260927191359.6144-1-kmehltretter@gmail.com

and quoted in full below.

On Sun, 27 Sep 2026 21:13:59 +0200, Karl Mehltretter wrote:
> register_intc_controller() sorts d->prio and d->sense right after
> allocating them, with hw->nr_prio_regs and hw->nr_sense_regs as the
> element count. The lists hold hw->nr_vectors entries and are only
> filled later, by intc_register_irq().
>
> On SH7785, sh7785-irq0123 and sh7785-irq4567 have four vectors but the
> SoC's eleven priority registers, so sort() swaps 88 bytes in a 32 byte
> kmalloc object at boot. slub_debug=FZPU reports "Right Redzone
> overwritten" in kmalloc-32, and v6.5 and v6.6 panic in
> __kmem_cache_alloc_node() while registering sh7785-irq0123.
>
> Found with a custom QEMU model of the SH7785LCR. On it, v6.4
> sh7785lcr_defconfig boots with SLAB, the defconfig default before v6.5,
> and hangs before the console is up when built with SLUB.
>
> Sort the lists once all vectors are registered, with the number of
> entries that were added.
>
> Fixes: b59f9f9775e6 ("sh: intc: optimize intc IRQ lookup")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>
> Notes:
>     Testing, all in QEMU on a custom SH7785LCR model, not on hardware:
>     - v6.5 and v6.6 sh7785lcr_defconfig hang before the console is up
>       (gcc 8 and gcc 14). With slub_debug=FZPU they boot and validating
>       kmalloc-32 reports "Right Redzone overwritten" after the object
>       holding the entries of sh7785-irq4567. With this patch they boot
>       and the report is gone.
>     - v6.4 sh7785lcr_defconfig (SLAB) boots. The same v6.4 built with SLUB
>       hangs, reports the overflow with slub_debug=FZPU, and boots with
>       this patch.
>     - Current mainline boots with or without the patch, but reports the
>       overflow with slub_debug=FZPU unless patched.
>     Testing on real hardware is welcome.
>
>  drivers/sh/intc/core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
> index aa68fe190865d..ffbe60234eefc 100644
> --- a/drivers/sh/intc/core.c
> +++ b/drivers/sh/intc/core.c
> @@ -275,9 +275,6 @@ int __init register_intc_controller(struct intc_desc *desc)
>  			k += save_reg(d, k, hw->prio_regs[i].set_reg, smp);
>  			k += save_reg(d, k, hw->prio_regs[i].clr_reg, smp);
>  		}
> -
> -		sort(d->prio, hw->nr_prio_regs, sizeof(*d->prio),
> -		     intc_handle_int_cmp, NULL);
>  	}
>
>  	if (hw->sense_regs) {
> @@ -287,9 +284,6 @@ int __init register_intc_controller(struct intc_desc *desc)
>
>  		for (i = 0; i < hw->nr_sense_regs; i++)
>  			k += save_reg(d, k, hw->sense_regs[i].reg, 0);
> -
> -		sort(d->sense, hw->nr_sense_regs, sizeof(*d->sense),
> -		     intc_handle_int_cmp, NULL);
>  	}
>
>  	if (hw->subgroups)
> @@ -357,6 +351,11 @@ int __init register_intc_controller(struct intc_desc *desc)
>  		}
>  	}
>
> +	sort(d->prio, d->nr_prio, sizeof(*d->prio),
> +	     intc_handle_int_cmp, NULL);
> +	sort(d->sense, d->nr_sense, sizeof(*d->sense),
> +	     intc_handle_int_cmp, NULL);
> +
>  	intc_subgroup_init(desc, d);
>
>  	/* enable bits matching force_enable after registering irqs */
> -- 
> 2.53.0
>
>
