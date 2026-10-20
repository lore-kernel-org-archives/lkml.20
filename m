Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524699;
	b=3VBbTJv4sH7V/DGYSCbon/juqzTHYj96Oqr11NgQSTt+gdypzfrTDjLVbOUVjEFHxdvk
	 c157eyyrReLVeuATdAJUVx1lW1dyiT7L5vipYzbCTIWSrDsI4W6Y+AuJfZBLFO0tOdtHR
	 7/KwO4DIfDyTkG/Be44/K92NbQYQoQODfTp59LYRsCHyJ6c+XeruCQcgtKMZUVGFrzA+D
	 ugSYvowlcgR+1YEpj9KjZLOuN0p9od/nKU/KATrzaw0g3iSV/R9JjOQBNOPPwBvp3/8li
	 adNqUuq9d/n/jFTtIDWjkXTzpWLuxHCdj1NJGXdll4P4YGsyO4UBOmoEGmRRy1tAcgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524699;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZFQd2JuIrkRskW6DIyZMgb3/rIjk8gKZ/llqAP6BjBM=;
	b=YNeArOfp7cCaQ/xrbMPJS12Gons2fTlNxe17aE1kZwIaRS8lKqM5gwlWknSukv7Dgq4k
	 sej/2DefUZJ/KQ/s5sRju4CqvwZvelfFGdo1hsp9lR0v7OeDtVnlfE2EVlTscSUu8kl/u
	 0Fl4V05/OJ0gB5fnLNIRirMjkxdXuQ+EI/+rS6hFfbR3zY0T+iBQolWB9I66zKsdES0Ma
	 S8GAwyhWCRYpFoHQNcnDnjDb6ljQ6rIN8AOsS6jTP3OTeFDin2eb863+twNwfYbDvoc+w
	 ZYMMA+IAUZ5J5fJ6YUX32NmqLlb+ihQ3rZM3LiEK+gCbdnHiFAA6GGc2vXHXzDPCztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uSBms9ur;
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B97606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uSBms9ur
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xjvnNuI2ASxgD0d3laO0ICYnzSAp4eDcc86vmcYiWos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792524696; v=1; x=1793129496;
 b=uSBms9uriz9wewRpR3M3n5yx73floJN//+XhLhodtaNeYP/ADKwBSVIhb7JsClYVXg+tMGSG
 Q0anaTpVy0HCqpb8JOTyihKPuy/+8ZO2JEv50v/vkOq3eIoGg3m/r8NKvy/i/m1af9Oc7ta9qEG
 7wSVE+kEMDMOGThyuBWbGQtc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 990c649898b146e5;
	Tue, 20 Oct 2026 19:31:36 +0000
X-Mizu-Trace-ID: 990c649898b146e5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be58ad9600so2097e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwx6crEajekuOrLV5HQpvkw7WooMktRY5Ij0lq1rpvSSgF90KH77v3f9FftT1s5kNqGqwoSYY6t+8ZxxHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYImvtGKCMp1fUWV+ZqUBGLx77TAjkM/CfU1GxTkUGBg5ol3cOr4
	oE0JNVImCY26oPyqAvQzzLpu7vVe8Ihtznp7BA50qntRixBonDlqAfvXVXqjj0cEaKiodLHRFDO
	Z/rPjwJEbye/2MLARrFo341Pi4s56y0juftS8mdpB
X-Received: by 2002:a05:6512:3044:b0:5be:4ed3:95b0 with SMTP id
 2adb3069b0e04-5be661e26cdmr211161e87.5.1792524693007; Tue, 20 Oct 2026
 12:31:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020064306.1542865-1-fuad.tabba@linux.dev> <atc2Y4gHwtGlffns@gremlin>
In-Reply-To: <atc2Y4gHwtGlffns@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 20:30:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
X-Gm-Features: AclHuK9HrLZiA-ahBYloBklQOkqXrnZWgSufxI-Ey3LM0N-9js0xNvZGXm47ZUU
Message-ID: <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 20 Oct 2026 12:35:14 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
>> Fixes: 70ed7238297fb ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
>> Fixes: d4a89e5aee23e ("KVM: arm64: Expose S1PIE to guests")
>
> I guess kernels that are missing 19868b67e3e7 and 2ce80f624032 will need
> that stuff ported too?

I think 2ce80f624032 would have to go back too, since without it a VMM
can still write the ID registers after they've been sanitised.
19868b67e3e7 mostly provides the call site: the version I tested on
7.3-rc3 called kvm_idregs_enforce_dependencies() at the top of
kvm_finalize_sys_regs() instead. Kernels before 6.16 don't have
config.c, so the backport there would be a different patch. I'd leave
the stable side to Marc though.

[...]
> static const struct reg_feat_map_desc *idreg_feat_maps[] = {
>         &id_aa64mmfr3_el1_desc,
> +       &id_aa64pfr1_el1_desc,
> };
>
> Right?

That's how I'd expect it to look. Since
kvm_idregs_enforce_dependencies() repeats until nothing changes,
feat_gcs() could also test FEAT_S1PIE directly: by then, S1PIE has
been cleared if its own dependencies are missing.

[...]
>> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
>> @@ -59,6 +59,7 @@ struct reg_feat_map_desc {
>>         const struct reg_bits_to_feat_map feat_map;
>>         const struct reg_bits_to_feat_map *bit_feat_map;
>>         const unsigned int                bit_feat_map_sz;
>> +       const unsigned int                idreg_idx;
>
> This field feels a bit hazardous - 0 is a valid index and now things that
> don't declare it are setting a valid value.

idreg_idx is only read for the descriptors in idreg_feat_maps[], which
all come from DECLARE_IDREG_FEAT_MAP(), so the 0 in the others is
never used. Storing the encoding would work as well, I'll leave that
one to Marc.

[...]
>> +static bool idreg_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
>
> To me this reads confusingly - idreg_apply_deps() would be clearer I think.

Agreed.

[...]
>> +       for (int i = 0; i < r->bit_feat_map_sz; i++) {
>> +               if ((r->bit_feat_map[i].flags & CALL_FUNC) &&
>
> What if it isn't a CALL_FUNC feature?
>
> Could this loop just be replaced with compute_resx_bits()?

It's skipped, so a dependency written as a plain field match would be
silently ignored. Both entries today are CALL_FUNC, but
compute_resx_bits() handles every kind of entry and would also give
the res1 line something to set. It'd mean moving idreg_deps() below
it.

Marc, compute_resx_bits(), the rename and the loop rework are all fine
by me. If you agree, I can respin with them, or you can fold them in
when applying, whichever is easier for you.

Thanks,
/fuad
