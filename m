Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396268;
	b=LAnTKgYbUhC2B7qnV1WmAUCalmVdqaLyOThwmIKq+otKkVca8XIYUV0uWCKEkDKz/+rR
	 nY4Olqd5bwBgUTzbq77oMbd867F+1JRvFd9y7QW0hSvxXQDG3FDopUCXG0nBcHUzx3ZeO
	 xooFppfuOMSptjZcqBVvdEdy9xqq7XVhPmfbJI3UYYzATxXH7m+UlLVJXJCD1VqhNXJ3G
	 TTw5RQiV9lvLTQQ0ybLOBo1BizNAV0GglYRjPICYMhTK3VyIArf3rQOi51fh7Ij9Vq06r
	 IwcZkBoUTshXjsnhOM6bEfu62JZ40T+iPxK8tvXz3rNGo+vl7enycAU6toqMFnQXH3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=lLJ+RytG/Z6fAA7i4XLswM02XTXV1PXuYSsk4iRByVs=;
	b=0JUpKzcC9+8PyWkD08OQD8SXEx4x4hRichv3dqRjak21Xrn3a5RFVEhIm6//D7yYmiK7
	 x1lS4XTL2ufmBEwjCt66jzqWTdVeLXhWl2Mg2TgEiQbguO5mMy7t7+r45HDkKCAb7Mu1v
	 FtR8vcIEGZ07aB+9a9z/R6JuzRxDF2jAN78rr7HgpRgbQYY9Lzpk8wcLPzt4wjFvGivGq
	 xczZPxzybHfWdo23K+NuPcwztebNwcR/5qI3UybnhsE1/X/j65Q/4DBFwneM74aq6U5zr
	 Axo+1lnwB5u2c+EAZmLZ1H0j2aCaJX+xD2hnE0Gl7iV30j3sQ0dFDXiyro78QKhqxYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jNtiwYWs;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9056B606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9056B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jNtiwYWs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LTkmc0WCsHinhYMS/2OI3bvHrpQrAYvGB39j0bNDVNM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794396265; v=1; x=1795001065;
 b=jNtiwYWs/MIF5oqXRx4jGHNDHZKSqgrggph60M5Z2dZo3PhWleE0Hx+f0Qcm55PU4A7jRTE9
 br0dVCw0Lt2oEST3xaIzrCcpX4lSjYvk01LBt/AFrs3PiUm+q+lamF7YFGgxjoKiGC1bSNAyFC0
 lZ0JVP54XSig5Cdgd1fl2w2U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3b3de8bac2ce609d;
	Wed, 11 Nov 2026 11:24:25 +0000
X-Mizu-Trace-ID: 3b3de8bac2ce609d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so4215e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFcSv2MQVmbwb691UzZ7HNMpdXurP2zN8wn2WlQnk8Qg5uTdGNsuXYzF0EKaiNCc7LUrCIdi5k/o2d66bY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KPwZIQ7i/DmbdqtKPTPuRdCzlKjJypA/KmI97zNdz5amiC/VR
	dPNTH8EjgitGsy4hURKVpiE+lu72xsO1kDU2Mikyz1NDQ8M5mxon83qssFFx1nuSWlaV9svEtHm
	6JH1xveRFysbpK1ZPtUcj9NePs5lDrZ/Vr7Nphpgl
X-Received: by 2002:a05:6512:3e0d:b0:5bf:d226:862e with SMTP id
 2adb3069b0e04-5c15d37f11cmr144047e87.2.1794396260539; Wed, 11 Nov 2026
 03:24:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111082746.1064567-1-fuad.tabba@linux.dev> <86mrrf1ux8.wl-maz@kernel.org>
In-Reply-To: <86mrrf1ux8.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 11:23:44 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxXf+os+68gTeHb9H0UaCT994+w6aCrnUXaFYkm0Eo3Cw@mail.gmail.com>
X-Gm-Features: AclHuK_tB5ygP1htfYcTK39qsoECE8_zGN_xazx4QuE8eQkwLTDZ6N_3PXY9CxQ
Message-ID: <CA+EHjTxXf+os+68gTeHb9H0UaCT994+w6aCrnUXaFYkm0Eo3Cw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SCTLR_EL1 before a pVM's CPU_ON reads
 its endianness
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 11:15, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 11 Nov 2026 08:27:46 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > pKVM handles a protected guest's PSCI CPU_ON at EL2 before the guest's
> > EL1 sysregs are saved, so kvm_vcpu_is_be() reads a stale SCTLR_EL1. A
> > guest that changes SCTLR_EL1.EE and calls CPU_ON before its next exit
> > to the host starts the target vCPU with the old endianness.
> >
> > Sync SCTLR_EL1 before the read, as inject_sync64() does.
> >
> > Fixes: 9d4ec80be2eb4 ("KVM: arm64: Handle PSCI calls for protected VMs at EL2")
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >
> > Notes:
> >     inject_sync64() is the only other reader on a protected guest's exit
> >     path of a guest-writable EL1 sysreg's copy, and it syncs that register
> >     first. Saving SCTLR_EL1 before the in-loop exit handlers instead would
> >     put the save on every protected exit for two readers. A non-protected
> >     guest's CPU_ON is handled by the host, after the sysregs are saved.
> >
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index fc0475f0877d1..e421f45383e0d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -1321,6 +1321,9 @@ static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
> >               goto error;
> >       }
> >
> > +     /* Sync SCTLR_EL1 for kvm_vcpu_is_be(), as HVCs are handled before sysregs are resync'ed. */
> > +     __vcpu_assign_sys_reg(&hyp_vcpu->vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
> > +
> >       reset_state = &target->vcpu.arch.reset_state;
> >       WRITE_ONCE(reset_state->pc, smccc_get_arg2(&hyp_vcpu->vcpu));
> >       WRITE_ONCE(reset_state->r0, smccc_get_arg3(&hyp_vcpu->vcpu));
> >
>
> I think it'd make more sense to have a global primitive that pKVM
> calls to synchronise whatever affects the control flow of a vcpu (yes,
> control flow for PSCI_ON is a bit abusive, but hey...). It's a bit
> more invasive, but at least we have a single spot to deal with this
> stuff, and it doesn't affect the hot path.
>
> Something like the hack below.

Yes, better to have it in a single spot. Will respin with that.

Cheers,
/fuad
