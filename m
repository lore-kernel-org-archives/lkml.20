Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442674;
	b=NxdJ5HwUjuqoqbn1mbRnnhW7Cd3qrClnDLC9QKiuFZtdPpyBKa2vHpFuv77fCSV3Qy7Y
	 13F/PrSPTzQN5Bh5uZhX2H2XJDdpQFNt4POKnCKItpWr7mQVX49J52YJI2v3vxsFU0svR
	 2UCNpr7/0kDPSE0P2/aLXBve8LCE56WW8Ig9NsAopGQw01F73YujPXRRn61hyqdaIyc+r
	 eQjOBB+i5Zv8x7YhRgzTxVSn+eBRDyEBfzopq1t0jnxQrjad4IX7zjfU8ytVETHfr3Q4F
	 ulRnJmTyXdIrmz0+e8uhpTMOBwOqDVRw2DlNvbI2fDZYr7u5H0MzuMUc+o9bmuAScjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442674;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZzsPa81dpyn+F/Esmqz9jQgZ2Ln/oH57eZktwIJQp6Y=;
	b=caWEmT+SHlNlkAC+CR0nVXuwML2A9L/v+lt/4yhicyDBEUTJgUejJeMEoRuRNGCCy7hg
	 sfNg5uUZRdd/OpIGQRVsk5rvODcH4ALQwNEjYALBEIoiSe6gh+RKwgcY34cEszq6qDWt6
	 R6TWEKssn2Nj6JmpCduCD901uu3OBW4Ir3rZ5WiroJzDHpZtnboSbIwAV5s02zomSU9na
	 wTb1jiJf4qRadpqeZa3hsOB2UKjyuDvqZSDlIEdYJEK24LqSMZwfbvuxtYvp2GZBDcOAT
	 +RcrtqnEMHL2D8h2qXRcWe4mx7tmFpyveQuRuy7n2CyRSlgY8ssNmD7ovB17uwmHacA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEsGkfZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F879606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEsGkfZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18CF1F00A07
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442673;
	bh=ZzsPa81dpyn+F/Esmqz9jQgZ2Ln/oH57eZktwIJQp6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZEsGkfZydFig5ZVck3lA/C5493vPLZ2sGi5g8mDO/n4GIR6AE6m9rh0/YufhB/wNp
	 6ZOQIj9NzuSMBwYJ+Qf/JlRZbU94/OmPloQs2zcg1TG7+H4UAXDzKPzgHd3W9Fyfds
	 eggGoZ71ipTiclI22QNuAGp+kGgeR+7qTjmSqEfqK4YRFmSLg4wha6JT7EcRyiRsml
	 Ert/ZpEE9f/RCGAtMBIheT25jCdbNtLkbFwWS0z6SEJ5AE5sSNrjuH9eF18Bgb/ZAV
	 qmfEtE76nCXu+2n3UO3mTHJ/m/xDhGpo7K2HNCiq020CutKBBDzhOZwMhGCPUdeYk/
	 lYHYGFSYDIWuA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so556620766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:17:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG2TTmnaVfU1whMVoVNo+o6RG2HLBNWTgzHNNMR/5mI4wKNgtJkXMr7DlNz9gtA2tU82QMzS1fM6fp7Xyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5pl00pX3va2P6yXmZ/3mvCuZ8WdOVj9PUN1XKS21/JVdhEouq
	kH0B4jZvFvlI+0dumgO83nk1gcJNhLSj6kQo1LZHt5au+pfd4nyjee+tEz34h0JyVLpfaoO/xUQ
	//HrAgghVYlgjMnfqV/N/Gg6tOI6gASU=
X-Received: by 2002:a17:907:980b:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c506694f0b9mr345372866b.6.1794442672547; Wed, 11 Nov 2026
 16:17:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112000200.3005587-1-jmattson@google.com>
In-Reply-To: <20261112000200.3005587-1-jmattson@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 11 Nov 2026 16:17:40 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMD5E4LxsQsV2P5_wy2yKdqE6TSNAp6y+3SpzcMDTSUkg@mail.gmail.com>
X-Gm-Features: AclHuK85o75-ht54CUq8k-6jkx4zbqrwa2R0Tq72RmOqP8KdGNg2NVlFa4nMQzc
Message-ID: <CAO9r8zMD5E4LxsQsV2P5_wy2yKdqE6TSNAp6y+3SpzcMDTSUkg@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Mark VMCB_CET dirty on active VMCB in svm_set_msr()
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:02=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> In svm_set_msr(), writes to MSR_IA32_S_CET, MSR_IA32_INT_SSP_TAB, and
> MSR_KVM_INTERNAL_GUEST_SSP update svm->vmcb->save.{s_cet,isst_addr,ssp}
> (which resolves to vmcb02->save when in guest mode), but mark VMCB_CET
> dirty on svm->vmcb01.ptr instead of svm->vmcb.
>
> A stale VMCB_CET clean bit may result in the loss of those MSR updates.
>
> Mark VMCB_CET dirty on svm->vmcb instead of svm->vmcb01.ptr.
>
> Fixes: 48b2ec0d540c ("KVM: SVM: Emulate reads and writes to shadow stack =
MSRs")
> Signed-off-by: Jim Mattson <jmattson@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>

> ---
>  arch/x86/kvm/svm/svm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 136069dfcd44..eab11fe50312 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3181,15 +3181,15 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, str=
uct msr_data *msr)
>                 break;
>         case MSR_IA32_S_CET:
>                 svm->vmcb->save.s_cet =3D data;
> -               vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
> +               vmcb_mark_dirty(svm->vmcb, VMCB_CET);
>                 break;
>         case MSR_IA32_INT_SSP_TAB:
>                 svm->vmcb->save.isst_addr =3D data;
> -               vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
> +               vmcb_mark_dirty(svm->vmcb, VMCB_CET);
>                 break;
>         case MSR_KVM_INTERNAL_GUEST_SSP:
>                 svm->vmcb->save.ssp =3D data;
> -               vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_CET);
> +               vmcb_mark_dirty(svm->vmcb, VMCB_CET);
>                 break;
>         case MSR_TSC_AUX:
>                 /*
> --
> 2.56.0.567.gdb80ae8cd5-goog
>
