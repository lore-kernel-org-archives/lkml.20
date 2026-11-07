Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794012171;
	b=i8fdm5edzmJULCrrjPDPiInYdJIA4HPWC0s9PsNqmcORN34qhjKRVU9YwVrv+pUaRPzo
	 vR0vfa8W+gZBfrFnRsXox7IyQQeGOv8Bik8fE9zqF//QE763O0X35h1zCeUNJismL+GbM
	 +DQ0ECe0VyPDtN59AZ40xAKsUB23eX08zmRur7Ae13jOSIAIF2E78dIdaMRvEKDq5RMnB
	 Ry1boFh872tProe3A39/m1PGJBbgddOZjnfbJiwf2vduYSSWPa7AwlQWMHV/jiKukWeBj
	 uGWt6/h6VX4u4hpHPCX8KlVJznvwEczHP3QtxqZ01ou9QGxkHh8DzSOc192WftLZjfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rxfr2Q/cVJbpK3vZD6NPrJBBDTXMr9aYYK9hIqRSdxA=;
	b=t2bHnsaNg983jjASM2hzb6FXd+1AFiefjh5iLb8spEUUvocC0thstH1yRXOU7u+rRM3I
	 6Qy0PoEIhP4JJqUT2bkjlrV4bQSCQyBEBoFYA1uSsa/H5saEdv++yA0KveU5/jvT28v9w
	 i4Bbn3HZMC7HDcBdXIDEO1NjlezdFNd70WLI80jmnYTt8e1Rqo5UbvcuoPxW517vWJFor
	 gpDMbhHrwBAGPKm3WN/QzM/SAAGitsgj5yfs5Arno+3KngB9HAwX9+owppk+MQ0SdveIH
	 06BolR6uVGF1Pch7SmdlKX4/mMkM7fUezE2w2OOX2YuIGkRzU6rak2Ckg99YL1GQD7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mKRLzxSU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F5606AF8A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393F5606AF8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mKRLzxSU
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so1202a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012169; cv=none;
        d=google.com; s=arc-20260327;
        b=HVUmKnXolZ6xN7cirS2SeRpE23ByC9ksKgcwW0+dh57KLPYIE3TU/D9oFwYBmJqYs/
         uLLkVzLCYZ+lC9xXwgsmcYcP++aJZzr+hoNV7BjdHSbwNoNCU8ac6uw3eA4Pi3zf9r0y
         4adFZzeiYUHBwSRsr5Sg+K9owQK2rPP1RiQscUpGVKzQwZx6MDuNclxEA9xUprGf8Kgf
         Tl93xASDpY/N03d3avpDW56oym9kUV8m1USP+flPEWUERVfUoGP13M9k1/cpAg+y3Pvt
         vqqVEU5PTvipQcR4WTh+ZeuNZNXAqP3NapzkDz8poTuTgSMcR7CxHM50yfVqgfewXq4S
         yJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rxfr2Q/cVJbpK3vZD6NPrJBBDTXMr9aYYK9hIqRSdxA=;
        fh=sXfLi6Toff4mrwSTYKi7Nz1OrQ9zo2Guf+fj9K3bThY=;
        b=YuEE5DTRUGK+7NogQrrXshXDhsW2RVrx6de47f0vvZIKTQKTjIaF0IblnpsmA1Y3Pq
         sJFCaprrexmUU07FkEF7pHjLjzYGISRlWKWs4ykRusVmyBhHkQaip8co9wMcGAjr7PfK
         FJxc8Y0F54MLQ5NgompZQSZ6CD5h+SMXKg8uqT7t44ntlcodLq30iXwf1VFF2MaDglU3
         pBNSpHYb4letw2qj0RMrh1Z55Q9xuvE7Dz9aAf5FY+0r9Cpi2exYvsyLeTm8/zU1m3e+
         lwTOOX7EoqAjp665TkXvv82l+K7VfbhirXpNLAYG99fjapkZeexka9yfQEJM8awaK3Yu
         q3uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794012169; x=1794616969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rxfr2Q/cVJbpK3vZD6NPrJBBDTXMr9aYYK9hIqRSdxA=;
        b=mKRLzxSUVgY24YecrcJ2AcvYnbBZ+zfgqgNTwySkaHLr3sYJ4KGCdAMTeX+1IgEmlj
         ORc/4Z8PHsyV1r+MO/g4w5jlgrKwVqmoESKULmRAG1LSNlbdGMjwSO3ZaBkJLvhUPl+t
         fPeZnxOIqdlwon8FgstmjvzCXVWxS+43KT3umXTqRmLFMdiQPRQfc6s/MkDZjRq98Nlb
         APdRo19ffSELwNg+MvLfyBciRveCqjdvLn/+q+U1sEj6dh3yhESLqoSixt3AxdgCyCqe
         dpPByT+bCI1MerNC2vSTejTp1knH82PA82sD22vaHD72+4LP9eD5QCIZ0rnxAKVvxhQB
         zvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012169; x=1794616969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxfr2Q/cVJbpK3vZD6NPrJBBDTXMr9aYYK9hIqRSdxA=;
        b=twp+CCxe2kINaZ+QFWpwRos45W9GzAZUTnvbD/Ot33DX5BhvQpnaIuIbCqmLHFN72D
         kmfPo95g2afuBFpHubykmS7RTMGfDwZPlOzxtk359rbqUsICri7mMH5nJdKZZArffVog
         jiWk2u7gRRxCp5ZV+2pD6g/p8JJf4N4kcIsCDf+YBDvLBnKciF3etH2voEcTs2DsTQyY
         PEuvEhYLcOaaDzCrvmQUE09h1FM2fjhX/zDdlXhWQzvzCXJUwW+hn/5WrvEto4S+oaJD
         uoLRvWCUXntgmRfEFffuXk62+SyY34nP1DGXyWsB6XkGX0ZjIsIiOHc6xBmZfUIyF6Hb
         hQuQ==
X-Forwarded-Encrypted: i=1; AL+hErG+AfqyNxK9v8s7i3U1LRIyJO2h1/XzYkPYclPio/qKAnL5V9Lro3Aarjkq/YTI9+jjh+Yuqy5hiQi6N8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2PFJ5KIltErmLk/9+qCYR+qD42jinRqgongpeCJhokpvTsKWI
	pck2DmZzNFGh75jKvsTESIyQQtJpsqaiqpr3QGZWuLtYLkDU7aE/yBGbxd+E2V8T6GC9JDk8/pf
	oWuQK6rDjeziXSN3ksVlHvTZR3FcxbvpfmgAS2c1u
X-Gm-Gg: AYBFou2w5eFgwN8L4c5ajcoYanX7daKX9tunrr9xqIPDrVW+KBagrx/favQefGP0Dej
	Or6JhvcfSFcWAQI1Cuwv9EE5K4TXqh+KuIIDKy6ZzMrWMsQSHOkPUYrJOm5mANAmPNotvs+RDjs
	tBraDfCibzRo9T6Wycq3EbRgc6+HEkmL56AGiryr8AX1CDek+R75MnQhLYXVprnZFV7EutQ9P1M
	9ssmsfdl/D6RzosPnCe4LCUAYjIQKvSU3e6Vx0zXVfbCrVwLrc2AZUV00DRuT6nb6RgCjKu1kCT
	O0C9+9EVQ3Um07/V1o41ARutNNOYRYKku9hFeQpn1MF6aU4evXFo9FwSyINK2AZWyYKaP/mE4/e
	gIAtf3NFZDcE/YdJfdCAldgdx3jlaiq9CQ/mp1ZZOoLECAXLLMXFtqo30qS3F26w4J6n4bEEO/n
	eFR+aKDFg8jpjLsksILDC60kjL
X-Received: by 2002:a05:6402:c549:20b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b6fef69aebmr13396a12.8.1794012168067; Fri, 06 Nov 2026
 16:42:48 -0800 (PST)
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
 <au4pSeg5AcHEbfDv@google.com>
In-Reply-To: <au4pSeg5AcHEbfDv@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 6 Nov 2026 16:42:36 -0800
X-Gm-Features: AclHuK9NRM_gDWCKM7JVrOv3NMzvD81_ZshQ0dqGboabAvUVaSpIbTnBv2z0vjM
Message-ID: <CALMp9eQZQ7-cGgmssAn5xd5hd7Yqi7fzFJVrTawJpdxZBS4Btg@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] KVM: x86/pmu: Drop nr_arch_{gp,fixed}_counters
 from kvm_pmu
To: Yosry Ahmed <yosry@kernel.org>
Cc: Zide Chen <zide.chen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:34=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > @@ -979,8 +979,6 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
> >       kvm_pmu_reset(vcpu);
> >
> >       pmu->version =3D 0;
> > -     pmu->nr_arch_gp_counters =3D 0;
> > -     pmu->nr_arch_fixed_counters =3D 0;
> >       pmu->counter_bitmask[KVM_PMC_GP] =3D 0;
> >       pmu->counter_bitmask[KVM_PMC_FIXED] =3D 0;
> >       /*
> > @@ -1008,16 +1006,12 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
> >        * in the global controls).  Emulate that behavior when refreshin=
g the
> >        * PMU so that userspace doesn't need to manually set PERF_GLOBAL=
_CTRL.
> >        */
> > -     if (pmu->nr_arch_gp_counters &&
> > +     if (kvm_gp_pmc_mask(pmu) &&
> >           (kvm_pmu_has_perf_global_ctrl(pmu) || kvm_vcpu_has_mediated_p=
mu(vcpu)))
> > -             pmu->global_ctrl =3D GENMASK_ULL(pmu->nr_arch_gp_counters=
 - 1, 0);
> > +             pmu->global_ctrl =3D kvm_gp_pmc_mask(pmu);
> >
> >       if (kvm_vcpu_has_mediated_pmu(vcpu))
> >               kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
> > -
> > -     bitmap_set(pmu->pmc_exists, 0, pmu->nr_arch_gp_counters);
> > -     bitmap_set(pmu->pmc_exists, KVM_FIXED_PMC_BASE_IDX,
> > -                pmu->nr_arch_fixed_counters);
>
> I understand the vendor modules are responsible of initializing this
> now, but should we clear it before calling into the vendors like other
> fields above?

pmc_exists is zeroed further up in kvm_pmu_refresh. See patch 02/18.

[..]

> > @@ -117,7 +116,7 @@ static bool amd_is_valid_msr(struct kvm_vcpu *vcpu,=
 u32 msr)
> >               return pmu->version > 1;
> >       default:
> >               if (msr > MSR_F15H_PERF_CTR5 &&
> > -                 msr < MSR_F15H_PERF_CTL0 + 2 * pmu->nr_arch_gp_counte=
rs)
> > +                 msr < MSR_F15H_PERF_CTL0 + 2 * hweight_long(kvm_gp_pm=
c_mask(pmu)))
>
> This assumes the MSRs are contiguous, which IIUC is always true, but I
> wonder if it should also be handled since the series claims to also
> prepare for discontiguous GP counters.

Actually, since KVM_MAX_NR_AMD_GP_COUNTERS is 6 and MSR_F15H_PERF_CTR5
is MSR_F15H_PERF_CTL0 + 11, this condition is always false today,
rendering the default case dead code. What situation is this intended
to address?
