Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD74E535B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836036; cv=none; b=s7isONXddNTt8P1tc/sHexTN1YOoIXOfUITHbmoiNyUby9Ru1AdBH5woj1n2GRiG1opZqDbqW4CWOpsv9hQLXTSbXXqnypRVnHhFxa/hDE47NazpbF6hh/p1Q+eTQE2Z1zkLNTCrTjqOZPycI8/O+bx+CqyhYpPnCB0fsHduWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836036; c=relaxed/simple;
	bh=nwJ9LwFn0jiy4+yPoQ8GTH6SBwik3tPHXEWfrGXfQos=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hN/EQ5ftlCU8BracmJfBtTmPDshQpbn+QQ6pcTDsKPyX+HHKGrU+mfRsrmBNGl+0/UnH+Dh72NzJrw8WyebeWn7ToBaQaSotTRzsfChMmiBsA5f8vXXVUDD7iXMVxYNNJLygoQttXN3z4leC5iDVq4QZ1Jb5qRR6pH0IEEt/ieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eeeeGFeG; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eeeeGFeG"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so3516771a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791836033; x=1792440833; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acp+U304GwmkdVMCYfD8nJLd7JDmrMBNmY+Nz8Wjd/8=;
        b=eeeeGFeGt6vwQ5peZHJKnAHvX5Oc6wcCz4UIcFnEmxNmXYgELgivbin2/wH3YrHhUM
         MaCXAvjxJg+Ph+Tcp9PSmyx2NH1ZmMG2tO7q6/la2+8E1V+/iZZz0UMKkbcP6Bl/W53W
         mXJqgfxcUClcF7hdjqbmfIFXswdi/plD3bd73BDNah/9O2vtqwe8TSljkTl/JlrzcCWh
         bRcYQ3ZBmu5IOWdeH1tGmfaRa681cnS9DPuAZFs9qq2JyAqQ4WZjjj5F9IXOccYim89r
         cAeyILtpcNfBiR3Ba/JBtu8qlBrzBV6fYQWVAYzbUR4jk8NB8gC7sScNsb93JXLPsaMT
         hCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836033; x=1792440833;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acp+U304GwmkdVMCYfD8nJLd7JDmrMBNmY+Nz8Wjd/8=;
        b=CfBxI9PGBGkPpSOY5uq+IjKLtxl7QnTZ3q0t35dwFjv0igzrmZ0TNVOmEGAIKKktFB
         mtYvefK0/hy4l+k+uvsBOlhm5fz0XUFYkijC8u2OoHwmqpkydxh8vEDRUppGK2qoB+tc
         fYKXvHnk8KwlpV9+cpBuwEFf42JUj0B3Di/mTUVN8vK6KATqppDqIgcyduLWg4Rk/o+r
         TNq+ZaWIlqdbD8HMS4c8/p6GtpTTKuOauVsZyhppkqN4sFGjAtNabZ5kONK1h6YbedZs
         ciZs2mKciEBGXE+7TetYRgWsppULY6+iwd57BEjan+bu/CzvmDAFyKZDlyKSadWXC3ZU
         pXMw==
X-Forwarded-Encrypted: i=1; AKwUvBzvkeIo0fpC13JXKItKZwKRWsufzP7CYbA/NsNnwbMilvhvbXGol+p6xd9yb7xiIsNAVpB/Plae+DblpXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTg1XpO8r46fHiaexgoRrMBVpUktFHithGk9yl+EKLE94izBAA
	zdV62FySzIuPIbE99mPDFe5JJYomoSdXFs/rILwv6gCmsTLPA8rDnQs9fLxr7aqsEClCFSoIi2J
	eyE6BEQ==
X-Received: from pgcgn2-n1.prod.google.com ([2002:a05:6a02:6a02:10b0:cc7:ad09:94b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d91:b0:3ab:be66:ddbe
 with SMTP id 98e67ed59e1d1-3abbe66e006mr4271545a91.28.1791836032556; Mon, 12
 Oct 2026 13:13:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:13:51 -0700
In-Reply-To: <CAEvNRgG3h5jgHOpHvJ_uuJv8o-mq0Jy9gXUhKcDZXfSGAfZBiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-13-15ad654a50db@google.com> <f7b3a63c-7a1d-445f-b062-4cea5343d266@intel.com>
 <asz8GKNO9aQANr5E@google.com> <as0FedYcvJvdOaq2@google.com> <CAEvNRgG3h5jgHOpHvJ_uuJv8o-mq0Jy9gXUhKcDZXfSGAfZBiA@mail.gmail.com>
Message-ID: <as0_f5dTbCWuODwQ@google.com>
Subject: Re: [PATCH v14 13/22] KVM: selftests: Support guest_memfd in-place conversion
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 12, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > The alternative would be to take sev_cmd_mutex around the kvm_gmem_populate() call
> > in snp_launch_update(), but even if the CPP maintainers were willing to provide hooks
> 
> I realized you meant CCP/PSP instead of CPP :)
> 
> > to allow that, I'm not willing to take such a hack in KVM.
> >
> 
> Is this a hack because sev_cmd_mutex() would be held for a long time
> while the populate loop executes?

It would also bleed CCP internals into KVM, and in general doesn't pass a basic
"is this the right thing to do" test. 

> > So, very sadly, I think in-place conversion is dead for 7.4, and will need to be
> > revived on top of an overhaul of sev_cmd_mutex locking.
> >
> > Or I guess maybe a less painful temporary workaround would be to disable support
> > for SNP if in-place conversion is enabled.  That would avoid extending the in-place
> > conversion bottleneck for TDX, pKVM, and CCA, without having to take a gross hack
> > to make SNP play nice.
> >
> > E.g. this as a workaround for 7.4 (not yet tested)
> >
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index fad72cab76cf..df885b8214d4 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -3213,6 +3213,14 @@ void __init sev_hardware_setup(void)
> >  	sev_snp_supported = sev_snp_enabled && cc_platform_has(CC_ATTR_HOST_SEV_SNP);
> >
> >  out:
> > +	/*
> > +	 * FIXME: Allow SNP with in-place guest_memfd conversion once the PSP
> > +	 * driver no longer takes its global mutex outside of mmap_lock (which
> > +	 * leads to deadlock with sev_gmem_post_populate()).
> > +	 */
> > +	if (gmem_in_place_conversion)
> > +		sev_snp_supported = false;
> > +
> 
> If we go with something like this, when SNP and gmem_in_place_conversion
> starts to work together, would we need some kind of new CAP or other way
> to advertise that guest_memfd and SNP are now friends?

I don't think so?  KVM already enumerates support for SNP, so reverting the
block should tell userspace everything it needs.  We'd need to document that
enabling in-place conversion disables SNP support, but I think it's purely a
documentation problem.
