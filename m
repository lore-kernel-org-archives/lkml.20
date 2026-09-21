Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F04BB28B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005309; cv=none; b=s7yvJg6CcYDeKqSUn+jqxlqa/Ez0F9sgE70t94OEvySTYyDmpJeu5TaYtLmP/3pQprdAX+NrxBEOVJYP9QLK6MM4W0YvdGV2ZTWikViIfys9rp1YIhEpHEoOz6GtIVRjyO/bQ1prlwGXrxpFcCeJawTofD6UwqCsZa3PlkINGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005309; c=relaxed/simple;
	bh=J3AvrX0iFYPsJjr3XrHKx7R6sWHc8XiaeuJLdLknwCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNerD8d+RuiTLZqqHoKlRm0s+98reIlvgZhR/37H5So/LUoEoIdVBegjIRtEcXLEaOJMyIWCEKH0SwUXLhbY/Izjxq/YEk2QyzceXQcIo+H5e17hXyfiqktQAd/bjT17TwK2cAO/Q9TbAXupRpHlQJJgE3dUZSNoQyYfPfsmMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3HAa2W8; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3HAa2W8"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5563494b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790005307; x=1790610107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SCrR0emCujd+YdQmomlKx8U5XxO1W+9NZytUeTIcwzs=;
        b=r3HAa2W8kuD04JyjmDuxVU8Ob++2sJeEZcZRzG8SYnsc+SqxN17Zs694pORaH0r5fW
         nln8qYobG5d69md0RbQ6nJgikMXrCoT6yFSkK3wD4dZcMTwoXMWrjK+FW+t6H8WsC6/v
         fKJW+M2rrZ2KchJAnRvYUX2rMdGwC2g+fGS68KqwK8p4fejTJ0Dze3bpopRF3QmoC4nP
         DYDxa65Fnkxc9sX8TyDBIbXcOjh0RLkdaNSQVvaiz/3p+SuLu+/ewowba2oCrOMpVKj8
         BSMzjtozkm5qB7FmsZ6LUSsHdg5L6dG/0MOwNO/S8tw3rHijqTGe1PBik2HPovSBMegE
         c8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005307; x=1790610107;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCrR0emCujd+YdQmomlKx8U5XxO1W+9NZytUeTIcwzs=;
        b=FPTAXCfuhgYE6UQDN2RO1v5W8IT+Vne0wLgfeMFtmshUIFYMKx2MsA/6M3myZ1r8tg
         j8wTy1EOhYyMGGxOdH+mCbD/UE7J2P7d2KYsnG+A47dQmvuNEvsCtLyNUFrHWsQ+yMyC
         /EoxlJrZx66I85OWePXuYE8q8iXI8y19iBbXsW3MTjN7Tu1kAyFRFUXVmU1zyuamjWOq
         CYZGS23s6gt4FvC2i/VIOnPaCQPRwm+kjJfJHc+Wt/tSIw1R6I9ZvSQSMorRsn5i0M/q
         BKgGHY2I/ICkI/sAhWXSB+9ZQeAPiZJ+ZIy1LrOZS+Zhjab1NGJB5drmrnAIhvopjJfm
         VnRA==
X-Forwarded-Encrypted: i=1; AKwUvBxqzahCOImYEbHkC1qZR6Lbtwwu2DXDL1voGh9w+JU/ch5Xzb8616zbl+bTJlo8WOfCTCI3DBzAXVPC/WE=@vger.kernel.org
X-Gm-Message-State: AFuF++nfm+jDoLZD47u0LnTDql6uuwCgus9iLY+WIgiegfu4mtKaqA6v
	dhw9qlzFs7LQ4BPIc7ZlhLhDJDSTiaQaiCno5hJoxlxGudMgkHJFmw7dxcWHEDbRk1wQaKTToAW
	mOArehg==
X-Received: from pfbmc17.prod.google.com ([2002:a05:6a00:7691:b0:847:8ffb:40ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a21:b0:878:34d7:6a24
 with SMTP id d2e1a72fcca58-87834e74820mr8043003b3a.38.1790005306488; Mon, 21
 Sep 2026 08:41:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:41:45 -0700
In-Reply-To: <CABgObfbtL48EP7+_VJirWxFj+NWnn=kmF6CF+qdctyHv_a4FAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com> <178999899502.746042.13434207152687268434.b4-ty@google.com>
 <CABgObfbtL48EP7+_VJirWxFj+NWnn=kmF6CF+qdctyHv_a4FAw@mail.gmail.com>
Message-ID: <arFQOQzsyonmp0rm@google.com>
Subject: Re: [PATCH v2 0/4] KVM: x86/mmu: Fix pre-fault and map private loops
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026, Paolo Bonzini wrote:
> On Mon, Sep 21, 2026 at 4:07=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Wed, 26 Aug 2026 09:42:10 -0700, Sean Christopherson wrote:
> > > Fix a bug in the pre-fault path where KVM fails to reload an invalida=
ted
> > > MMU root, which puts the KVM_PRE_FAULT_MEMORY task into an infinite l=
oop
> > > (although it's breakable, so not fatal to the host).  My best guess i=
s that
> > > the test started failing once PREEMPT_LAZY was enabled by default.  N=
ote,
> > > the bug is *really* easy to repro with a to-be-proposed patch to have=
 KVM
> > > do auto-pre-faulting[*], i.e. prefetch surrounding pages on fault.
> > >
> > > [...]
> >
> > Applied to kvm-x86 mmu, thanks!
> >
> > [1/4] KVM: x86/mmu: Reload MMU on *every* page pre-fault attempt/iterat=
ion
> >       https://github.com/kvm-x86/linux/commit/355323a4dc94
> > [2/4] KVM: x86/mmu: Harden "map private PFN" against unexpected root in=
validation
> >       https://github.com/kvm-x86/linux/commit/698b8c88e159
> > [3/4] KVM: x86/mmu: Top-up memory caches when retrying "map private PFN=
"
> >       https://github.com/kvm-x86/linux/commit/6415d9c4ee19
> > [4/4] KVM: x86/mmu: Add sanity check to detect stale page faults in "ma=
p private PFN"
> >       https://github.com/kvm-x86/linux/commit/f7a3be227619
>=20
> Should I apply this to kvm/master?

I'm not opposed to pulling this into 7.3, but I also don't think it's neces=
sary.
There's no danger to the host, and without the auto-pre-faulting functional=
ity,
it effectively requires a deliberately misbehaving VMM.  I doubt this will =
impact
anything other than the pre-fault selftest for 7.3.
