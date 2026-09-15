Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137A36B06A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481567; cv=none; b=JzBQE7e8Qb+t1v+FX+3gSEUEB7FGFoqkmF0fe3Nr+dJ+TqY3ZlVXLjgPm2TDvTFYUccvHNu1njTfKPbu6vGil7r8cltzQ/c9HziItLFGFEY8I98L1FOO67VmLU3BQ6CucrpHbfTWCR6/lGgbEWYYb7/IQdRePbTPxM9AmGLfU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481567; c=relaxed/simple;
	bh=3G0O+OUF5QFvnfAby8EwEl11RBiKQK5gk892VXgZWD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkUGbS45mkoCtDa8TbXNx8WBRuE1cOmRXgorwbX4R/8UWwpuuaV/Gh92du9r7szGYwSmfQvMftOU8pA4fKuGZVasJyDIOpj4LifnsJitnGqhC8FuKcjD2X+Tsmx8YaSVd8OsaOOkP5ixPcI+KXn0pE5j9UmUkkP8xbi/YH3KfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=enCAZr5Z; arc=none smtp.client-ip=91.218.175.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="enCAZr5Z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3G0O+OUF5QFvnfAby8EwEl11RBiKQK5gk892VXgZWD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789481563; v=1; x=1790086363;
 b=enCAZr5Z6QLm3WMC6LA7ap7gnIYUpKW3DwDXV6WKtW+lGf9g8RT15ydxSPMugsmm7MgIQmAH
 vGVkHIeXSuA3VlCthgLIS42a3GlMVbu77LKlhP0eb4uRMuTGxePPPll0rMmrRm8pyFlKxCce6im
 zg64NLHyB/vcZ9d3t/ZahzB0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 04055a731e69cdef;
	Tue, 15 Sep 2026 14:12:43 +0000
X-Mizu-Trace-ID: 04055a731e69cdef
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so304e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhzaMdJk2dgrDaHbWcfmefCPZVBVyhW0OGpvf33hDkyvZM956aXgihVq5dWQHCsT5GXkWwOvqYOwpX4+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nT6DRv+K2alhrjrQ7OA3bTXON2j+QrP3RsTpKIftX6Piu9qOEI
	j696Q35OTcUQps/G4sds/2i6Dqhg6zXLuULdLUmXCIE97/KMTO5vSUtnwIZl3DrPJmVSkl20guD
	IDAVMOj3D9mYnEqgF600q8JeGoq7HiRvnM/PxjuNq
X-Received: by 2002:a05:6512:3dac:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8b2d0db8bmr195652e87.4.1789481559798; Tue, 15 Sep 2026
 07:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
 <20260915123846.2317931-2-fuad.tabba@linux.dev> <86v78662a6.wl-maz@kernel.org>
In-Reply-To: <86v78662a6.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 15:12:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxUTOj4D6Y-mjA6Wv+D-GWP1SaCBNgH_Ni=CQ3Y0zAK1g@mail.gmail.com>
X-Gm-Features: AcwNN1WrZ2vlMfsvR2ger9LO52Sjk_Eil6ga-Qs09jtEG-4giDpAv8q3LKgSy9Q
Message-ID: <CA+EHjTxUTOj4D6Y-mjA6Wv+D-GWP1SaCBNgH_Ni=CQ3Y0zAK1g@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: arm64: Reject the GICv5 CPU interface hypercalls
 under pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, 
	Sascha.Bischoff@arm.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 15 Sep 2026 13:38:40 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
>
> [...]
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 9a3b92e626adb..7c939baf9c1ba 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -911,6 +911,8 @@ static const hcall_t host_hcall[] = {
> >       HANDLE_FUNC(__kvm_enable_ssbs),
> >       HANDLE_FUNC(__vgic_v3_init_lrs),
> >       HANDLE_FUNC(__vgic_v3_get_gic_config),
> > +     HANDLE_FUNC(__vgic_v5_save_apr),
> > +     HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> >       HANDLE_FUNC(__pkvm_prot_finalize),
> >
> >       HANDLE_FUNC(__kvm_adjust_pc),
> > @@ -932,8 +934,6 @@ static const hcall_t host_hcall[] = {
> >       HANDLE_FUNC(__tracing_write_event),
> >       HANDLE_FUNC(__vgic_v3_save_aprs),
> >       HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> > -     HANDLE_FUNC(__vgic_v5_save_apr),
> > -     HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> >
> >       HANDLE_FUNC(__pkvm_host_share_hyp),
> >       HANDLE_FUNC(__pkvm_host_unshare_hyp),
>
> Why moving things in the array? The whole point of HANDLE_FUNC() is to
> abstract the position.

It's only cosmetic. The array is in the same order as the enum today,
entry for entry.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
