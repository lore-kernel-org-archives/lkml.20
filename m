Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC833955C4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267414; cv=none; b=j/IUFucB3Jy8vQeRDz4cE4rcdANqSf2Ts9XtQ+pYDt/wpZppdXPBka71sxPCpKBzfjFjfQQM8jcoT+3CpFDh5GibdnfHn0D8oEyS7K3EDXQGTYShqkWDZhEqZMccEtVU/qzxEaayTuEQv7BWPXF38Gr5GnItK+YBb7n/RmLGkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267414; c=relaxed/simple;
	bh=O08cq3Y3cQTH/9SBVvDHHzM60EuXDef5UreGi/S+Czk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tAkRAnBJRbtZKL7n22g7yRBOUKAts/EJdCZ1WBRFgxXf4WfvfUY1jTotEPVjyjm/AvMYUXL0fJN9iy8fGPYOUZs9dHG0fwARXgdmai8We3ERcFojit8i6MP5mqCIk+ONZTVYD6HjzNs+KSAFlmrHUWxppYV1oA09IzGDQ+iOFCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Da2dVD3P; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Da2dVD3P"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1736350a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791267413; x=1791872213; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSMXz7j7y1E19IYWz6Uz4I7uqLz4WSNGL5PR7f2zxls=;
        b=Da2dVD3PS563p8xwQLOw6gK8OyrjV2rYAyZKuiXqdKT+Qv3g21nhi25tc9qKYstYN/
         N0Aw2MiWcY47xBhG5dzPZoEc02outHWaTLeOUOWvr902bYPhMAC3rKGjo8i+ICD/LlQx
         n/WTmqV0NhI4m4aoQXqz8qaOHD4eSBaWfHRNJeieVolLBtWP26mgiiD0NFRjcU7NgXxg
         AjpkmqA3mrLYoNL0A5eiTtjF1zxeoOdpy+BAqwflTxjMwq+4OpVOvNthfJm3OYUU72Op
         +xXG+ZGGNwToX+HxhwLSxjq6mxde1pmE7Xbjq05xme8UzOqqAXsR+1Ni4koSlXBDWF4Y
         F2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267413; x=1791872213;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSMXz7j7y1E19IYWz6Uz4I7uqLz4WSNGL5PR7f2zxls=;
        b=USR9X7YFxxLZM/+kjSCoAwoC1s/r9LJL7DcjlVBa2UE8jecxsbnViIsXHMkzvT77Vz
         FXN/f7Ac8hdhsADhXJp1C5x1yOqaU9VfCpXQaltZx/MoUbaKvn0CT6p+CsauOopgxdDZ
         8FPwSsxCTKbl0ACd/v63HK0GSK/jb6f9UJSGw75gx0188BWODN271dN5wjh0R08jcV4C
         bJ931TA3oK/FXM+FHSy6bEzlZ0iRTGC5ja76fJZlO7rX1beolvA4DVATHAdKdzfVVMEW
         NJQbBbfnzF4yMN3J2qHaqiJ1Y4aIy8pRlsrvRVojJ7W576jgBJqZGHdQJIXRoFoWD8PN
         w8mg==
X-Forwarded-Encrypted: i=1; AKwUvByQGyKg937VFDpr8LN/hlraHZOV+LgpagCq1AUSE3+A2wqOU4DF+MVVFrk+pNV7VY0FP4y+pD4bZDlakIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfIcNbCUMku7qSVWpvxocHsK2mlKGGmkxUcRb2kyb9ATfKp1pU
	tDcmwHN53J3LJH6n4WleJFzS6UC+xfRw+5cvZ2HdgwerSUuYC+uTaRjXNiB5skoqwazaHqRgDL0
	z138fDg==
X-Received: from plbmg12.prod.google.com ([2002:a17:903:348c:b0:2df:a429:6698])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c5:b0:2e2:d09f:d770
 with SMTP id d9443c01a7336-2e5dcda05a9mr4724415ad.26.1791267412437; Mon, 05
 Oct 2026 23:16:52 -0700 (PDT)
Date: Mon, 5 Oct 2026 23:16:51 -0700
In-Reply-To: <alX59ewiXXSx7J3R@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783490022.git.naveen@kernel.org> <36c039713c4b03c87b636635cb4c1f8b98c15eff.1783490022.git.naveen@kernel.org>
 <5f6bcceb-1c48-43e5-bafc-8f86676c4092@amd.com> <alX59ewiXXSx7J3R@blrnaveerao1>
Message-ID: <asSSU2huZDlusYdG@google.com>
Subject: Re: [RFC PATCH v3 02/27] x86/apic: Drop savic_eoi() in favor of
 native_apic_msr_eoi() for Secure AVIC
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tianyu Lan <tiala@microsoft.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 14, 2026, Naveen N Rao wrote:
> On Mon, Jul 13, 2026 at 12:43:45PM -0500, Tom Lendacky wrote:
> > On 7/8/26 01:32, Naveen N Rao (AMD) wrote:
> > > Drop savic_eoi() in favor of using the native helper that writes to the
> > > APIC_EOI MSR. savic_eoi() was added mainly to be able to handle
> > > level-triggered interrupts. However, it relies on APIC_TMR indicating a
> > > vector to be level-triggered, but APIC_TMR can never have a bit set
> > > since it is only updated when the LAPIC accepts a level-triggered
> > > interrupt. In the case of a Secure AVIC SEV-SNP guest, all
> > > level-triggered interrupt sources are in the VMM (emulated IOAPIC
> > > primarily) and KVM accepts them on behalf of the guest resulting in the
> > > APIC_TMR in KVM APIC backing page having a bit set. This is never seen
> > > by the guest, which has its own private APIC backing page. As such, the
> > > savic_eoi() handler is dead code. Remove it.
> > > 
> > > Fixes: 43b6687ac877 ("x86/apic: Handle EOI writes for Secure AVIC guests")
> > > Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> > 
> > Another guest change which should be separate from this series.
> 
> Yes, I have called this out in the cover letter. I see now that I should 
> have used a better subject for the cover letter though.
> 
> > 
> > Is this causing issues with this hypervisor support or is just code that
> > is never invoked? Do other hypervisors behave the same way and will
> > removing this break them?
> 
> This is code that is never invoked and is independent of the hypervisor.  
> No impact to hypervisor code.

Doesn't that mean level-triggered interrupts are fundamentally incompatible with
Secure AVIC?  I don't see how the emulated I/O APIC will ever get an EOI.
