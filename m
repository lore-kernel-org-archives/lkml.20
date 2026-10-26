Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036236;
	b=I3huObFyCyKHz/7hZVanCwr3zYdWqZG62iXu7oAnZ2Qh0rIzYzTm4FFrtSfK4hgzJT/7
	 k6o2k30iEl6GNjU/hBEasXqMRJlpgHARQzJRaHDnM7AzCrmqoMLfSBcMq2IojnKdlC0ZL
	 73IszABYfHjowsp6goqIq5hff5jAZYniZZezvgjx6M1VzCPkl3qaW90UJv93KTImboeRK
	 u7oXyQfXXYw9/1n/y9LAqmSvp9fiCi+Xflo35mNt4SN86cjT4cL0G2LhDxuY0Lxz01iRt
	 utFr58oxKriXBwJhARN4R5QC221vxXdiUuQGy220SLMLgcWW9UOFX6BjGS2ymR4SUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=u3uDBAF1Ovkb0RC2KTlASMQ4Rd8WYJb+WLyWCC0Ty9k=;
	b=k/CGG6Q28Rmi/TSOhDmLxwrAqVDV4bKcEM8wlkEH6u63H/kjwa5NQ2MHj2/DoDjGIAPp
	 aLq6Hi5ym9EWjDI08Za0dwkodQ/CHoHMyyFnV6qAzcR4vulEYlJVrPPT81QQr4/RlWu5z
	 vlIa+D5d6iePgnxM4bN226BeCd2luV5UilegbqjYYLHkwekMF8jFt6rBc4abDvtvku3Du
	 JWyKOJwAA/oFZwsSymgkzxXa7AxLpBhlmhT8bDCFd9sB4Rzru+Tmku5vIpqdd3w0bwBRR
	 nVdsZRTq4uQUe+NERTYfkswVKuQ6ziU1Sa9kPeVKthHkZUQChBlja1WvBx99BonyzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P02yuksC;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8218F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P02yuksC
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea785a4decso1430435ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036236; x=1793641036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u3uDBAF1Ovkb0RC2KTlASMQ4Rd8WYJb+WLyWCC0Ty9k=;
        b=P02yuksC3DvUK68oipBNIgX+rOQVFqmFViaa3wC8WfAKmnslU0xkePJYWNtE1kRXus
         8hTv94aeZCNTC+Vip/VcqniQmXZnNk9B59MH18/lL3pnSZyTVwKUjORBEP+LBUSB4Cy/
         doTdKpFYXjgoaKLdukQwUy/MVat7OQ2lgZ8lz/Za3CiKR6IsDK9OtGYquwvtlP2pgUVO
         0uHQ3pZ96NpE5c6L8Z32hjznLu8lZzLeIMU1uacsGDFLNQNQFYopyPd1uZpjjrfyyuOl
         gEOU/Qt+SKhEyNpTBsP7eM9890DaZaX9TDHCAi2jOMQIPS22T1KxNBN1p8YJi/rbp+Mq
         RH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036236; x=1793641036;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3uDBAF1Ovkb0RC2KTlASMQ4Rd8WYJb+WLyWCC0Ty9k=;
        b=psOPWGxYhdTSSuVxdH5F9vjDbcXya4w7429PXji6R3BGg1tf5MnxR604ROVKe4IuVg
         MgEfZ4MoismXjw23bB9hP3uz5V/DwKGJ3iC13W42lw8krNINcmE4cDHTV50NXJi3nFfm
         a1jXm0Pz6Wt1pGEv0wyg+4XsFWyrw4Y1ihLNKnb+ON8AR7Hio3OdvlXeIXrkAqIlfsRj
         0spWOMy6Kc+ad8ytUYkngTAZiUOKnKOZyhEFfjZ6Q98gD011pxW7bCvTBNJaez19FY1q
         qVDwr6+q7qoOEXIWqL3FaujFVstamE+gG87Zlj5lW4PQ3OqUv+xjWZYouc1xpveH5AJ7
         8UbA==
X-Forwarded-Encrypted: i=1; AKwUvBy2uQpWZHXujX4KljHQ4v/h/neNQjmr19EHX/ntqscbL7+vikUxJEMRpju4WiM2ioqRjCem4SIW4fpHy4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL02IP0LfY0uDlUQFM9u54wW1XdrkTbCRKyw5bdKOBrDqV/LsoN
	aPKy2rFEi95wSw4R0Q0y3s7nCktzKXAWVIVlglvOO1N/6lH71ZaUNeIowNGfoSxqLXF5hz8tBb+
	CrpvEiA==
X-Received: from plkq2.prod.google.com ([2002:a17:902:edc2:b0:2dd:bff7:1e38])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1109:b0:2e9:b831:29ea
 with SMTP id d9443c01a7336-2eae40c9849mr1522565ad.40.1793036235657; Mon, 26
 Oct 2026 10:37:15 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:37:14 -0700
In-Reply-To: <CAO9r8zNbieeCQKLjfC4vhaeS_mgFJc3Ex9xKKmKQHL_43j9axw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com> <20261022223052.646891-4-seanjc@google.com>
 <CAO9r8zNbieeCQKLjfC4vhaeS_mgFJc3Ex9xKKmKQHL_43j9axw@mail.gmail.com>
Message-ID: <at-Pyu-tvtPEXOxT@google.com>
Subject: Re: [PATCH 3/4] KVM: x86: Recompute EFER.LMA instead of inheriting
 the current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026, Yosry Ahmed wrote:
> On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Recompute EFER.LMA on bare writes to EFER (via WRMSR or KVM_SET_MSRS)
> > instead of carrying forward the current EFER.LMA.  While it _should_ be
> > impossible for EFER.LMA to end up in an inconsistent state on such a wr=
ite,
> > KVM has had a rash of exactly those bugs, mostly because SVM is quite l=
ax
> > when it comes to consistenty checks, which in turn bleeds into KVM's ne=
sted
> > SVM implementation.  Retaining the existing EFER is also rather confusi=
ng,
> > as understanding why keeping EFER.LMA is correct requires a lot of a pr=
iori
> > knowledge of both x86-64 and KVM.
> >
> > Keep the core concept of the existing logic as a sanity check: WARN and
> > reject the write if the computed EFER.LMA would be toggled, because as
> > described above, that _should_ be impossible.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/msrs.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
> > index c3cb1575fe66..41f3ec6eb286 100644
> > --- a/arch/x86/kvm/msrs.c
> > +++ b/arch/x86/kvm/msrs.c
> > @@ -638,8 +638,18 @@ static int set_efer(struct kvm_vcpu *vcpu, u64 efe=
r)
> >             (vcpu->arch.efer & EFER_SVME) && !(efer & EFER_SVME))
> >                 return 1;
> >
> > -       efer &=3D ~EFER_LMA;
> > -       efer |=3D vcpu->arch.efer & EFER_LMA;
> > +       if ((efer & EFER_LME) && is_paging(vcpu) && is_pae(vcpu))
> > +               efer |=3D EFER_LMA;
> > +       else
> > +               efer &=3D ~EFER_LMA;
>=20
> Does this mean we can effectively revert this patch:
> https://lore.kernel.org/kvm/20260902232028.2767071-3-seanjc@google.com/?

No, because that flow goes straight through svm_set_efer(), i.e. doesn't hi=
t this
path:

+	/* SVM ignores EFER.LMA if EFER.LME=3D0 (instead of failing VMRUN). */
+	if (!(svm->nested.save.efer & EFER_LME))
+		svm->nested.save.efer &=3D ~EFER_LMA;
+
 	svm_set_efer(vcpu, svm->nested.save.efer);
