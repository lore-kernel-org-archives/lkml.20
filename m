Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018389;
	b=HZq+gXYSB+3SZaFP+d889Lw82NQsEU4jQslB1NBI8OSRs1QaVRU5tfaDxgnOvDL8usBs
	 r2O8Xq8BJbFLzqHLXoQS1Va63Oyo8oGDFZ6GXnaBMAx5R5YPlEyoI/zoiKskDnbDkzqNc
	 WZKl3sspH/fc1iVRtDJN5L60CiYJXJfZQw5y3xlIbYeVfhur7uOYaIlIATBZFF8psatlJ
	 +FvGFsAeV0M8SWNPj0QXmzI6ka9RLDqN/AGu7Fl6+mZbdQOCh92R+RxNJlbtFFWkTmc3n
	 RnbWvJ05Hvhhi7a1sN/tDg2DpnNTSVyNEl7n+pxskfEdwDub80yf/OEC2W11SY9+TAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018389;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J65rKF/UOcwg3jpA5K8U2letQdeUIFDe8iCEa4fMeH0=;
	b=nYGJ8Ff2mK38HwI0LkfEQ9FEcbQVJQ7N7V9ipDU514/HZogOJjO8c1QdLY4srcZBKr5+
	 7POeal5uhl0zNPhdMreMZJS3uYLpf0tzvFQ//oo3+eUu/xDNRnCe5SCdbLoYdWXBZwxYl
	 nLrp38ts4erNS4EP0BlVeegvDo6HNFIueO/wEWRTWy1B/2+tXtD2r8MnmYSHBmoUSzG2f
	 X36RgT8xgmdt4aZdH+70xBFfBzh3pxnCyL2qbtsh3plq9CuLvDhjWjVRpY6ByCYqSBNH6
	 kT2Eyxp87iNMJp9qaYQ8t9SKGB+Sv2RWUqBF7R+AT6HIMTp4yhpZSEWkmxwE3Dg23CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAPT2gvN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC2606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAPT2gvN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E024B1F008BD
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018388;
	bh=J65rKF/UOcwg3jpA5K8U2letQdeUIFDe8iCEa4fMeH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YAPT2gvNsYPSQe7YvbLoncRAQ257EL+9j6UCipkIiF1STdeSnT+1cgnEEnCTjg/kJ
	 d5Dk4T2u6NQwpFKEnwFg0nwF0RZSlQkn64+O87u5nkUFAL+ZPQP3Zzt//DxwT2CXjB
	 Xc9lH+8a1fz/SfEQeLl2n6w/cVR2mewkyN7F3up4eTGEBzJMU2BJQjoDIjAVuhlkmo
	 sg1hR1gN2u/fyV1pxlnU3HRodDetVhBQbkjRlhzCoVdpDDNhRf9ubhYgvXmPX0E3Oh
	 cC2kmKMDydr374GhM1ViyjyBLRBd2ex5Y6iuHFdfjwkvoiQq/IDNCqanOEWkRZTvwj
	 8+okqM01WYJAw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so186362066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:26:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG86+7JThundhX0AHK+yJusaKrokDTzt0qRzs6E65hPWykUNvdfC3UTqygiB83VpLNBINv9WAag8cCczoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cyzM7qKLNjDo73s72o1JRXA6VbueWOmA5+HZBpS1x4MH5ECdu
	cxNDHRZMTMPE6WoB/F8yVAclh5gKgnDqf+XH72zQuC3/HTwpse8lmS0XwWls1MBECUgm1FkAAzl
	M4K0/MAchAJr3z1dpOCkwiqpBiqwh0i4=
X-Received: by 2002:a17:907:3d8f:b0:c46:ba33:1f0a with SMTP id
 a640c23a62f3a-c4d34cf8aa6mr324118966b.31.1794018387786; Fri, 06 Nov 2026
 18:26:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-6-zide.chen@intel.com>
 <au4pSeg5AcHEbfDv@google.com> <CALMp9eQZQ7-cGgmssAn5xd5hd7Yqi7fzFJVrTawJpdxZBS4Btg@mail.gmail.com>
In-Reply-To: <CALMp9eQZQ7-cGgmssAn5xd5hd7Yqi7fzFJVrTawJpdxZBS4Btg@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 6 Nov 2026 18:26:15 -0800
X-Gmail-Original-Message-ID: <CAO9r8zPQNzzrT6yqzb5d+vbG7XXM5Puvf8fBmZyHTyLkm1hiLw@mail.gmail.com>
X-Gm-Features: AclHuK-MYTf64hMea9vMNls7vvuOHZctaNDXb9LUURTJYCBAEdZIN49V8gl__rQ
Message-ID: <CAO9r8zPQNzzrT6yqzb5d+vbG7XXM5Puvf8fBmZyHTyLkm1hiLw@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] KVM: x86/pmu: Drop nr_arch_{gp,fixed}_counters
 from kvm_pmu
To: Jim Mattson <jmattson@google.com>
Cc: Zide Chen <zide.chen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:42=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Fri, Nov 6, 2026 at 11:34=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > > @@ -979,8 +979,6 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
> > >       kvm_pmu_reset(vcpu);
> > >
> > >       pmu->version =3D 0;
> > > -     pmu->nr_arch_gp_counters =3D 0;
> > > -     pmu->nr_arch_fixed_counters =3D 0;
> > >       pmu->counter_bitmask[KVM_PMC_GP] =3D 0;
> > >       pmu->counter_bitmask[KVM_PMC_FIXED] =3D 0;
> > >       /*
> > > @@ -1008,16 +1006,12 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
> > >        * in the global controls).  Emulate that behavior when refresh=
ing the
> > >        * PMU so that userspace doesn't need to manually set PERF_GLOB=
AL_CTRL.
> > >        */
> > > -     if (pmu->nr_arch_gp_counters &&
> > > +     if (kvm_gp_pmc_mask(pmu) &&
> > >           (kvm_pmu_has_perf_global_ctrl(pmu) || kvm_vcpu_has_mediated=
_pmu(vcpu)))
> > > -             pmu->global_ctrl =3D GENMASK_ULL(pmu->nr_arch_gp_counte=
rs - 1, 0);
> > > +             pmu->global_ctrl =3D kvm_gp_pmc_mask(pmu);
> > >
> > >       if (kvm_vcpu_has_mediated_pmu(vcpu))
> > >               kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
> > > -
> > > -     bitmap_set(pmu->pmc_exists, 0, pmu->nr_arch_gp_counters);
> > > -     bitmap_set(pmu->pmc_exists, KVM_FIXED_PMC_BASE_IDX,
> > > -                pmu->nr_arch_fixed_counters);
> >
> > I understand the vendor modules are responsible of initializing this
> > now, but should we clear it before calling into the vendors like other
> > fields above?
>
> pmc_exists is zeroed further up in kvm_pmu_refresh. See patch 02/18.

Duh, sorry I missed this.
