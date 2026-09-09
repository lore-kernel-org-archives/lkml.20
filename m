Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CB568FD9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968396; cv=none; b=mWmzjmvx4CC8Pm23hxqhqJ2foGCRhP0uNS8OwDMZd5a7l85yDdea1dcR9pAWJdnofEpBGxjAZsxVgMUgqGOvhMnDHCRQ4QQbCEGylTSGCqWNsCBbAhrRZlMHSwxdL+xsaie/V975/fttstHbUbkbMX+1Y3aLf2mB1Ljhwh+h358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968396; c=relaxed/simple;
	bh=fzj4Ws8lKIWrjEiyGIpoIDsUvXAXaL99aEWk2VGWV7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4A91c25h744DM3v1ax0FQWx4qNHx07YYY1anntAzLjiSWnyFlaTgiJMhpAJYoEcjI9CxtGlJt25AeiqYU3NIn1khK7sLd7KyPWsVWyCrZARuRcHjU+nuY5Yj8BW24+tzNqz9dUtokO4W6Wj3b6aXroSqi3Hsc1TT+WXEP921G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vFfUnaFs; arc=none smtp.client-ip=91.218.175.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vFfUnaFs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fzj4Ws8lKIWrjEiyGIpoIDsUvXAXaL99aEWk2VGWV7s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788968391; v=1; x=1789573191;
 b=vFfUnaFs0Ol0/yoJQQ3j9uMjQuSUqmBYMp8H9vaPLwW81Qc6+FzdGoeuZK+Ki4Dj11ng0aA9
 u43xNl7lYMl4LCg1YcVGGECU+WvdttYdYxp9jr3wiZISBQo7hqvyfPm5Q1MApgOtWAa3Cg6Sxcj
 TAdVlH5zUqReRnHK4t0RhleE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7dcc242b5665a7b6;
	Wed, 09 Sep 2026 15:39:41 +0000
X-Mizu-Trace-ID: 7dcc242b5665a7b6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so8784e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0RfrizaA+K8Ht1rWMSYukz9Dg7IyrfABLA9noSlqFiL8UkIcK/4hKz/gkzrSslfKZBfguAaS48WodlXI=@vger.kernel.org
X-Gm-Message-State: AFuF++nlfSZeIwY9dNi1JE/yPbymvSZLuxfUTo/ktfkwelN2M/UYiFcw
	3V5qqcgc7TRlkMDiIIUeNV/VXbDzDFCXt/2xFYKnI65bxKk1piVudRqruo9G0i42PsnS/Yz2Ipd
	9XMEvmi2L+G/DomGfBVsZFKHejwxQkzI7RQqLN0bK
X-Received: by 2002:a05:6512:1296:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b764bb8a14mr142455e87.8.1788968380386; Wed, 09 Sep 2026
 08:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-3-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-3-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 16:39:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
X-Gm-Features: AcwNN1Xn11LM3S-N1a2DBr7wA2T25hY8d1olPDXuf0s4eEIGVNgdvX4H2BSTCmw
Message-ID: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] KVM: arm64: Donate MMIO to the hypervisor
To: Sebastian Ene <sebastianene@google.com>, Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	tglx@kernel.org, vdonnefort@google.com, vladimir.murzin@arm.com, 
	yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mostaf, Seb,

On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
>
> From: Mostafa Saleh <smostafa@google.com>
...
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size)
> +{
...
> +       /*
> +        * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +        * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +        * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +        *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +        * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +        */
> +       ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> +                             addr, size, &host_s2_pool,
> +                             KVM_HOST_INVALID_PTE_TYPE_DONATION,
> +                             FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));

Before this patch the hyp linear map held nothing but memory, and this
adds the first device mapping to it. That places it outside
`fix_host_ownership()`, whose scope is the memblock list, so nothing
at init verifies the ownership. It's correct as written: the donation
writes the host stage-2 annotation itself.

This has already gone wrong once with the hyp stacks. The fix [1] adds
`pkvm_check_host_ownership()` over the private range, which fails init
on a leaf that isn't hyp-owned. I'd move this mapping there rather
than leave it outside any ownership walk.

...

> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> +{
...
> +               virt = __hyp_va(addr + offset);
> +               if (kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE)
> +                       goto err_with_unmap;

Sashiko is right, even though this is benign for now. `ret` is still 0
from the `kvm_pgtable_get_leaf()` above, so a short unmap runs the
rollback and returns success. Could it set an error before the goto?

...

> @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>         kvm_pte_t *childp = NULL;
>         bool need_flush = false;
>
> -       if (!kvm_pte_valid(ctx->old)) {
> -               if (stage2_pte_is_counted(ctx->old)) {
> -                       kvm_clear_pte(ctx->ptep);
> -                       mm_ops->put_page(ctx->ptep);
> -               }
> +       /*
> +        * That also ignores stage2_pte_is_counted() instead of clearing
> +        * the PTE as the MMIO can be owned by the hypervisor.
> +        */
> +       if (!kvm_pte_valid(ctx->old))
>                 return 0;
> -       }

This changes `kvm_pgtable_stage2_unmap()` for every caller, for a
reason specific to `host_stage2_unmap_dev_all()`. The others are
`__unmap_stage2_range()` and the two guest unmaps in `mem_protect.c`;
as far as I can tell none is affected today, but
`stage2_pte_is_counted()`'s comment still describes the old behaviour.

What's changing isn't what the walk does, it's what counts as a
counted entry, and that isn't the same question for the host stage-2
as for a guest's. Could that be stated at the call site instead?

I couldn't work out what "That" refers to in the new comment.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260908110713.1540304-1-fuad.tabba@linux.dev/

>
>         if (kvm_pte_table(ctx->old, ctx->level)) {
>                 childp = kvm_pte_follow(ctx->old, mm_ops);
> --
> 2.55.0.654.g21b8a5bc05-goog
>
