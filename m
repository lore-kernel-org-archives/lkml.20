Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361352;
	b=V10I32NLm2s9F3UzRKa4IiDJ4dZjA0ZRRtt2PpAZHd+Mnrf30MtR6BJVbADK/8Fwl87b
	 ETFjejYBzLH2oee1tPjy+cU1zMdzMn3aVERaRnWN6ZzDNOJ7cVLkpFbt52gQA7mShSfUz
	 CgZshUOTU0MLsFFWDD+Em8mLA4FnzEyXIU9cJIdgelISEW48xOf7P5WKFvIvyfUmEYSgK
	 T8PKRPliRTQzN7vb5EntA8YrSyuR6KfW6I3H1kmcFy0zKz8z7ZgaAaaVHc9sXhS86/xsJ
	 fQy1gzzVkGIBbRL0prg7Jk/sk9KL4DkYv1ERMF6feRDp8Ou1CFSRTLXhLfbQwPsa4Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gynuYOYjBlWXiC/Ji28tlTf9iaepwWTtf+nCYUbuqa4=;
	b=K1ftG7lGlFTG8zX7YtjpDgazVQZGNN5zVNQr2G2wtylI6QONz8pusrgKyPOvkIhyQeAC
	 QcJhvQtXeEOS6IDunH+jvbmQonCias963C9mC+/4F3DaUyrgp42a74L9af9Qp2oAORNlr
	 zN5QkT2CKZhDh1mzVOdQlZhrLIavjoXcVUIyWXp2vpfZ89sAPpsLc6EraS68vHK++84l2
	 b93tRudMmcV5gt0kmg7HOUbyhXZBFcK8KDdds8VFsLTh5x4tbckBcoq4vfTGkklPSXCfE
	 P5m0S4QbIgg265bGebWL8gAvpbHzQy0gInF6w/1dWnQloYwsGPZhbk5ChJxx2MJYJ6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=boxhw4dH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63535606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63535606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=boxhw4dH
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso11163a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361351; cv=none;
        d=google.com; s=arc-20260327;
        b=YI7sWXwahKDnTxaH7FR+zXkwNx92K5lxm4HPMUY1QeOQonfvCC/zGLLcJj87kb+fD1
         E3mWwy0YFyWvhm1rBoi8Si/1jGppb6/QAswN9+GTf0EfyMsoITV1galxXb4IT51aTbJj
         UCZitfFNln6TPN+q3e1MWlgUTemND0iw1/1h8n8sFiaSQ5Hbs2sc6vWEM1AV3kJqr0i4
         u7rv4A7UjNGxyBZrbH5vaYdklakPwHcoFDXQnEpd2JcGhVBzGoqdYphexcGkQY72G1nd
         ExS355fqM3HOlJULrIldbCUuUIGwIXuqBj6N61Rvw7AGo9EQtyuj157wdnZjdVULz9G0
         tiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gynuYOYjBlWXiC/Ji28tlTf9iaepwWTtf+nCYUbuqa4=;
        fh=eO/WW3lA/Ej3UXFvNzwuJvT5WZRcG21MVvDkdmIDCmM=;
        b=j8FtjxpPaPlxdF62O9M9J5UIC4vGsUi+GNlWCO1pLhdUP3yXUiOof8rRcxANPO6+rn
         ji3md/obr0tSgwHkG4+8SgVEBB/2NNrA0StxM8nfAYA8OQkJj4AnPowO0N7ogjqGD6ZR
         QkyTiMW6/f1lg+Q3ZINE/C/cy+L9/2OZt5vr+mCflPUW4E9qT7cHdUyU1HCONZK/KQUo
         3xxTSp+EZANJUFHIjme9XILbbpbtf7V2laD6eEWDH598Qs8FDjGJqdogblfTuj1fzMzH
         vnMcrF8BY3zGbbO3DGIw5bvJ/j4HIaLcvFoFYcGT2TC1mOieVp6KKnzjfP8aasZV6+l+
         7ewQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793361351; x=1793966151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gynuYOYjBlWXiC/Ji28tlTf9iaepwWTtf+nCYUbuqa4=;
        b=boxhw4dH86RIu+y5xz+rjBlb4lW673ZL0lmVmDE269CuQ2MCVDr2OVFsLbJ8hi1sIg
         /bHsfkhKJK5R4k9j4NeShwo2c1vPohfq03Z3e0B24rHWjQ8i5dikKTbdAp5dvSEG/Gy5
         WMaktuLq1v2M68zTgN/jAm9mdeotjjj2MBOMJzSJ8V+3DMo6fRel1NXEDz/CjHx8h2Av
         zWpM9hxTdcPPRfgNZbsC5wQT0cLQpv/Hu/l451ATqVE44LG+T8j1rQjta7AlTYw17kIS
         YbdAeuNZCq9IXbpHVKxOAitgiVhK3GQcv76+ZK062ljwg63TZP88lZJmkJuXvMzZ/tpI
         ApPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361351; x=1793966151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gynuYOYjBlWXiC/Ji28tlTf9iaepwWTtf+nCYUbuqa4=;
        b=Yz57FlLO93O4ciGb5e1gbbva0K5Zzt/TbF4T9o/js6YU+WSAJtCrIxLmYAnbRYGL67
         8Jrv+WjWXFSNSI5aEc+wqbDvX+TgRv0dpU1yHIfGKxViROjEkT2dMI8vIjdaBhe1dg5T
         Bm+rg2H3VwFWxhbT7hGdwetbpuQwtCDCJx46LdCazQg8i+5LMg45Dnc59KP+O6eyhqaD
         1ynyI67o8UFstYQLUMYNcsontL9plia6wHtOpJSyrK7vX8k0oECLXkZc5MP2GUOiZ+xA
         ntv6URO+3wDRn3lo3pqWeH/ZQKvQJ+7bYgFreke+YuninrvlJYpBtf1ZGU29dVeqAA3W
         ghaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRKyrCBSgtkWrUY22ClKB5gdti+H67OgZb6u+BOtBCTfwdBgeLijfDb0SkR/LT11UPanCCZZkTymcBCu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIctuc9oAHt8VoHj+Mc4++kRYPVQcQRKwcNo+7jy6ktB7M5A4el
	B1y8oQqff7peFh8rLkBkwFsEyIXh1f0OYZtpemI1TBdz+WZiGRu313O6Fmfi+bPVh3s+QgV/5jL
	4KHqzaYr+Z5/aGZsAHIYaGiaEVmGQCgZUkalmd6Ep
X-Gm-Gg: AYBFou3WlO+X+LzlKeGUaHDysHDKqkFS3hPXrGq/588Cnr+PJwxKbOPfHVNVPceCCmS
	hE66dKvo331vQtKtk9YpVrGXyFFUJ1MeN9knyyD5cWGjdz1QYWvOqSxO7zlFQZOP9gQj9ecJM7c
	C3J1zYXb67Mu5Lf5UqGREh6KcCeMHtIrZtrI0mCpN9COvLUpGdD1rqmODZplpGtS4i+XgIBvdom
	sFuxgkm6m13KC8/1pI30Zjl96rYkXSpasqVLOCZgmf18cFGmmGefOGGlBmue/0Nf7TkFyOGvSZL
	xF7X/wCdHZL4YY4tYLbcYyq+Ong7YhEDQRVeukzk955XTi/BlerNjefDhUjIaYW+jS9LanW1h9y
	w6MtYe61Xdt+UJz8Zf/AUN/34fgMSnvLee83PXA==
X-Received: by 2002:a05:6402:1a58:b0:6b4:880b:1b61 with SMTP id
 4fb4d7f45d1cf-6b4b3cd2861mr140092a12.12.1793361350377; Fri, 30 Oct 2026
 04:55:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-12-zide.chen@intel.com>
 <CALMp9eRvQ+iQdw_dWPLqZCrO7zpLut+O27pb-EPNa33hkegaBw@mail.gmail.com> <b3dcb403-ec19-4d23-9bab-336e2eb344bd@intel.com>
In-Reply-To: <b3dcb403-ec19-4d23-9bab-336e2eb344bd@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 30 Oct 2026 04:55:38 -0700
X-Gm-Features: AclHuK_puoGdrXd53jsXaOwX1cFb2UMvIc6UqgWONJCoSZMyJit01Nsz-Bi7xBU
Message-ID: <CALMp9eTHRzXXm1gpKR3u1nzJU3i9M1a_wUjp9+bD8_r4eoPQ_Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] KVM: x86/pmu: Emulate the GLOBAL_STATUS_SET and
 GLOBAL_INUSE MSRs
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:45=E2=80=AFAM Chen, Zide <zide.chen@intel.com> w=
rote:
> On 10/28/2026 4:24 PM, Jim Mattson wrote:
[ ... ]
> > As I pointed out in patch 04/16, we can't pass through the PMU global
> > controls unless their reserved bits match hardware.
>
> Totally agree. Then the handling of bit 55 breaks this rule as well.
>
> if (vmx_pt_mode_is_host_guest())
>         pmu->global_status_rsvd &=3D ~GLOBAL_STATUS_TRACE_TOPAPMI;
>
> Always intercepting GLOBAL_OVF_CTRL and GLOBAL_STATUS_SET can solve this
> problem, but it may impair guest performance, especially for nested.
>
> Instead, I'd propal to have separate reserved masks:
> - pmu->global_status_rsvd: unchanged, strictly tracking virtualized
> guest state and preserving live migration validation.
> - pmu->global_status_{clr,set}_rsvd: unmasking all architecturally valid
> hardware bits for the corresponding MSRs on v4+.
>
> Any bits allowed by hardware but unvirtualized by KVM are
> scrubbed/filtered in intel_mediated_pmu_{put,load}().

That is a terrible proposal. MSR bits that vanish at unpredictable
times?!? No. If an MSR contains bits that aren't virtualized, that MSR
can't be passed through. Full stop.
