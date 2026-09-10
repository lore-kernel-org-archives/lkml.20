Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334ED3B3C0A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030993; cv=none; b=BocpllBO7R4b+AS9umMEido4dRhDM9SpswBldNPMepH6gtphGA8XC74BYYLa0FIJkM1JZyXxLGE9v7W/9S4Wx1ERLsnuFgQkc5Dqezh0demT/txEIMngZ1gAPUO1kugzdi9spyy4FCSAf0g/zMpK33pupakr5NkZvgYYStw86WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030993; c=relaxed/simple;
	bh=W8IYFYyVSf1IJTAHU+XAlm63NQn+c1mU5Xot2nF3bm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S55Qj7IxIAmXddRlaabD9fn6iLZfomLmplXWd7ZHpD3oxqzaErNRzuIAp9sJYdtG8VlpAZ00/G9TTIRppbb9i/ty0rQeqp//iYH9oM9qj0IcsJv5sBEOTfuGf/ZJoutizZ0bc/o/n1oea4xqjeumvVFg0oTB7gQmZAwzPweXaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sifMoqBn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sifMoqBn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso31285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789030989; x=1789635789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WB1NjqmZcUvP9wHGBJnRxwj++gRzhIlJU0V8tkFibco=;
        b=sifMoqBng/r1YTCwZigbTbU74hNmyDBQpN677W72kzTc9GU8gdXA01H3Kw2adFcDPf
         /BcED1yTGBlTeM7JQDr4duojjcKPCdrhjIFbDe0noljTVT6+25dOScigeVac/I/SR6Zo
         sOIjvTfz80WtTlDdLBne+0FHbicRhnfEFvLKkr/7rVla7rWhJf0EnxP1uLe9rHGmpvsX
         0V/NgQJsNqKh5Qm2N7/UZ1Na8pv/pgsOsTQFixXez2kg3IOd49GJrlB2rNesMXLymGmO
         dccSDjhV8f2EFYL7C+mWXcQmycqP4lg39X8lDMR0Xbcu8kvt2yAvZaCLmGrC522/LdmR
         8nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030989; x=1789635789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WB1NjqmZcUvP9wHGBJnRxwj++gRzhIlJU0V8tkFibco=;
        b=DxtE3+SFWKjunvsb0oKsDAprI2QGESr7fMNymAJeZPia6iP0qAmVldWXsRJmRkQ9HF
         Uizri1FK73bDMVm8GgzSrwkma5e7Je4xMSQEJfIFjflhKl4En8qkRFdQuSxB5lGAt7yi
         Z57d6bzxKxxMLJcVLUpJyUWF7L5pDK5/OFcY4eSN9W2zvljdZBsxTg9gBvPTuemUr/G6
         7L1350rHlJS+NS0Pe/DcmX5/+0dAvhYU8DpbKA0nei58N1rffnyG1ezWuYl0jFIomIJz
         a50cY0Gcybv3ga+8XPx+EOsOQYRBerMSWfANigcwatc8kGXkNhnyF+P/OEhW3yuNNqhQ
         8wRA==
X-Forwarded-Encrypted: i=1; AKwUvBygyeQwuFoBoqxg6m/HL7K48D39CrbwPgmp0I6dRBzKE9ePEg0DKhIDKvNxQgJuVJAJc/J19wkx6p2EeKg=@vger.kernel.org
X-Gm-Message-State: AFuF++kCRoDczrwqZqA1Unv3h6a1wBK94YkVS+cjSNXnuujJHYJY2/Hh
	M+TxwWzVPUI8518+zORJI92wohAwMa1MXfb7H7RFTd0HShvoNTDDcSgbfbynuCLofA==
X-Gm-Gg: AYBFou2r1CMeiQ78VxHo9kSnSe3qfRunQdrAq6M3pmEQ15EehwInxMd1+n27XwKRfaM
	v1ddvJTBqwlHDdfy95Nk5JFxOWMVj8v/CXFGAIKZe8a20fr4bnXWPD8nV2S8pS3Rh2ZC7wFgnM+
	wrlG/drqGUQDIltbC5rknUm3boEEqdwKwyGfaZdHq0r/gV7RqzrBbGQ3MdzKpBhaZowI2O3eo1k
	AN3OgJiy6CrbzNZz2ICzkx7vsgKlmyPq0rnBD3TBC39ck/s86zxz3qN6R2tA7t6lSpm5aKcdJQa
	Pj/Ys4oPF+u7eEnJ0XT6vRvVvR5SmLvOtkwbG+buVpr/+/OWrkSTJalOW/NgXWkRqSZsP2QoPVv
	UiGrxbpoWu3kqNHyUan99NtA1sh9wFNaJm9imffw3IK5jJPkg33Nk3xdPyDo3CAps+T3TnS9aYo
	g49N7abl0WE/eORSCoIk5jDHYlikAfG6NHr0RALXxt7WJTM+Xdh8TGMVgOvIgVX+P//z8HbRILk
	RfYiDFvB0lZJI2NIIbP3bhfiDaZzm8kr7zYVHs15/vj6GRDjXo=
X-Received: by 2002:a05:600c:1c20:b0:49b:8f5e:51f6 with SMTP id 5b1f17b1804b1-49d28f4b4ecmr656805e9.3.1789030988814;
        Thu, 10 Sep 2026 02:03:08 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm48353295f8f.22.2026.09.10.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:03:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:03:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, mark.rutland@arm.com, maz@kernel.org,
	oupton@kernel.org, rananta@google.com, Sascha.Bischoff@arm.com,
	suzuki.poulose@arm.com, will@kernel.org, kvmarm@lists.linux.dev,
	android-kvm@google.com, bgrzesik@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com,
	tglx@kernel.org, vdonnefort@google.com, vladimir.murzin@arm.com,
	yuzenghui@huawei.com, zenghui.yu@linux.dev
Subject: Re: [PATCH v2 01/13] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aqJySHem_uYd-c1P@google.com>
References: <20260807164322.2970811-2-sebastianene@google.com>
 <20260807164322.2970811-3-sebastianene@google.com>
 <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>

Hi Fuad,

On Wed, Sep 09, 2026 at 04:39:03PM +0100, Fuad Tabba wrote:
> Hi Mostaf, Seb,
> 
> On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > From: Mostafa Saleh <smostafa@google.com>
> ...
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size)
> > +{
> ...
> > +       /*
> > +        * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +        * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +        * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +        *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +        * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +        */
> > +       ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +                             addr, size, &host_s2_pool,
> > +                             KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > +                             FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> 
> Before this patch the hyp linear map held nothing but memory, and this
> adds the first device mapping to it. That places it outside
> `fix_host_ownership()`, whose scope is the memblock list, so nothing
> at init verifies the ownership. It's correct as written: the donation
> writes the host stage-2 annotation itself.
> 
> This has already gone wrong once with the hyp stacks. The fix [1] adds
> `pkvm_check_host_ownership()` over the private range, which fails init
> on a leaf that isn't hyp-owned. I'd move this mapping there rather
> than leave it outside any ownership walk.
> 

This patch is not the latest, the latest one uses the private range:
https://lore.kernel.org/all/20260715115906.2664882-3-smostafa@google.com/

> ...
> 
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> > +{
> ...
> > +               virt = __hyp_va(addr + offset);
> > +               if (kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE)
> > +                       goto err_with_unmap;
> 
> Sashiko is right, even though this is benign for now. `ret` is still 0
> from the `kvm_pgtable_get_leaf()` above, so a short unmap runs the
> rollback and returns success. Could it set an error before the goto?
> 

True, also fixed in the latest version.

> ...
> 
> > @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >         kvm_pte_t *childp = NULL;
> >         bool need_flush = false;
> >
> > -       if (!kvm_pte_valid(ctx->old)) {
> > -               if (stage2_pte_is_counted(ctx->old)) {
> > -                       kvm_clear_pte(ctx->ptep);
> > -                       mm_ops->put_page(ctx->ptep);
> > -               }
> > +       /*
> > +        * That also ignores stage2_pte_is_counted() instead of clearing
> > +        * the PTE as the MMIO can be owned by the hypervisor.
> > +        */
> > +       if (!kvm_pte_valid(ctx->old))
> >                 return 0;
> > -       }
> 
> This changes `kvm_pgtable_stage2_unmap()` for every caller, for a
> reason specific to `host_stage2_unmap_dev_all()`. The others are
> `__unmap_stage2_range()` and the two guest unmaps in `mem_protect.c`;
> as far as I can tell none is affected today, but
> `stage2_pte_is_counted()`'s comment still describes the old behaviour.

I digged more into this check and I am not sure why is it here in
the first place, as invalid counted PTEs are pKVM specific anyway.
And there is no place were pKVM clear them with an unmap call.
So this is more solid IMHO to avoid accidentally losing annotations.

> 
> What's changing isn't what the walk does, it's what counts as a
> counted entry, and that isn't the same question for the host stage-2
> as for a guest's. Could that be stated at the call site instead?

My understanding is that the old check never hits in guest (invalid
and counted)

> 
> I couldn't work out what "That" refers to in the new comment.

Sorry that was unclear, I mean't "the check", as it only checks
for validity now, it will ignore stage2_pte_is_counted() PTEs,
I just wanted to make that clear.


Thanks,
Mostafa

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260908110713.1540304-1-fuad.tabba@linux.dev/
> 
> >
> >         if (kvm_pte_table(ctx->old, ctx->level)) {
> >                 childp = kvm_pte_follow(ctx->old, mm_ops);
> > --
> > 2.55.0.654.g21b8a5bc05-goog
> >
