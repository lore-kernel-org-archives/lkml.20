Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2EC246783
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413965; cv=none; b=BmbrVeS//FGgJoa/cdgSJJlMFktIpFYdD8+tyAx/EJZmWaYzlE4XuzN3GiiAG0UZGFQyO+OZol2sq1jU10QijSk6jpMNKduGTh/BlmGmL+3zFxHXkvOtz6RTxqQ3k7ND0pIEDtKRdXfxQhgi3ygicM02PDfzThMz67jvV1yOoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413965; c=relaxed/simple;
	bh=Qxp6b0ax9oueHkME8135NN7XH5RwaIVlp3JI/E88/tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvitQIlckzwO7wSMsYrdsNFTlFOsuZKzs/66m/BhiRNHN3TzKDkee4eoo/2822hbiBvNBaWDh4hoKIUaupyxnaWfUg6Y9yVxKq3AUJu3BRTBvEZY81dcA/L1WAg71l3dF1IK3psi86TjZvDfBTVYdYtiHNFPO6bT6dYAPYVq8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lBztxkKo; arc=none smtp.client-ip=91.218.175.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lBztxkKo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Qxp6b0ax9oueHkME8135NN7XH5RwaIVlp3JI/E88/tc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792413962; v=1; x=1793018762;
 b=lBztxkKopqGcsqDZ9VUC8cFUbmDvDvMelm7O/vQ7KpwLBiH6ykpzch+npuDLk279sUiCTLDH
 Vfyayzr9znhhnOJYzOGj+/OkrUQn1rDBu4mYrOm9Rt4bwiAxQ4zzMDEaJgvn4a3wDQQM52pQXP9
 bXiAa6kR5gCT4opcQu8zaXhE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a8fe107f7a95894e;
	Mon, 19 Oct 2026 12:46:02 +0000
X-Mizu-Trace-ID: a8fe107f7a95894e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so9702e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:45:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmWTIFyXOIGHKQX8tByVAJZKyO4NcooDtPUs9V+8Ywa0s19He7+a1Yl9p7jOTuCSXsmrcYIZn+0YZDFWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjvTCM7lwi7s9sTb2SLtUTEgcM9hEJe4qBU1OCpAPJTgcacgxQ
	Ejcz8yd1sSIqzmoC9sa400aneDt7oJJKKzosUJv1Xhj3Ins2zfFvl4R1ESWNDkMgKwHnEJAbMdv
	YWYEUJF+if4V+2mkR8jmbMtp96/5BKfjz7qd621Ct
X-Received: by 2002:a05:6512:4026:b0:5be:5605:3606 with SMTP id
 2adb3069b0e04-5be560540ecmr122144e87.8.1792413957034; Mon, 19 Oct 2026
 05:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev> <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev> <atYPZeJuw2grFDlz@google.com> <atYQKaLo4VJDoNJn@google.com>
In-Reply-To: <atYQKaLo4VJDoNJn@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 13:45:20 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxU_dAPcm7C77SkWffJRtAzkTG3NJ6ix3Qk1hC-09wRBQ@mail.gmail.com>
X-Gm-Features: AclHuK88biJmUkYYPe6V74w0Egs3dpNZ2AJ9BmPKg1toG3idbbnqb7l-xriaAuI
Message-ID: <CA+EHjTxU_dAPcm7C77SkWffJRtAzkTG3NJ6ix3Qk1hC-09wRBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 13:42, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Mon, Oct 19, 2026 at 01:39:01PM +0100, Vincent Donnefort wrote:
> > On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> > > Hi Vincent,
> > >
> > > On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > [...]
> > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > > [...]
> > > > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > > > >          unsigned short refcount;
> > > > >          hyp_spinlock_t lock;
> > > > >
> > > > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > > > +        int *last_vcpu_ran;
> > > >
> > > > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > > > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> > >
> > > I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> > > vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> > > unsigned int and UINT_MAX in v2.
> > >
> > > Thanks,
> > > /fuad
> >
> > Also,
> >
> > as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
> > to pkvm_get_hyp_vm_size() instead of allocating separately?
> >
> > --
> > Vincent
>
> Ha, I just saw your answer to Marc and you will switch to a per-cpu approach
> anyway it seems?

Yes. Now v2 (coming soon) doesn't allocate it at all. As you noticed,
after Marc's comment on patch 1 [1], I'm dropping that patch and made
this a static per-CPU array indexed by the VM's table entry.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86y0buyo5s.wl-maz@kernel.org/

>
> --
> Vincent
