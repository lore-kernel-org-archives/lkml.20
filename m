Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548334;
	b=SyoF3FN56K61qNcf9PUQto8v8QawQi0hte+0DXRpqggT31JYH8hTyrb/GUITW01itBPv
	 mkZiUSHGWZhSDn6mNud9rxnYzFeJeoWtXwHhUrI0XVmg0NoltNa0gO8oSNVbKln043Q1j
	 pHRqJHhMQBd73Bd25PIH41uQvL3wALJuGXO6Kje7bJOzAdTjYwjowhAWD1uEbU0ZRQvHg
	 Wgi9ZDA8oy3bQ8XaMX5MTyWKXGQUQ1y7mxu/2djAeAaRKES8Q/WLrRigzx8GXrL/8bNiq
	 GKzi96Erw7GVGfeTbAVEW7orZz+pXGQC55Hc0w6k8fEvIxnFhlkWzp2ZvBLD+d/Jfsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548334;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PX0i8pHtQvjRW9g4b9HdYeYIOynvMYnFBHislzODRA=;
	b=tGvUegYbTAd+/6wXsGLh2LSyp5WDa1L8Sm5SE9Rihm5WR3Naji1YZaTY+n7Z9fmHypG9
	 EkJjTSS9EWHEuxsJmrqqQ7gKk+9pkEDlCR5U2jcaCFfXZCK2MdWKyvoKcABnFCTzGYhpD
	 Rgb7R1myOIVRY2EL+YK+DoSMQqA/iva2/eMhv0zsEmg9NKL8L3tN/xjwPtsoj03YEpkVi
	 bhZ8WmbW73bkoHprCXB4q7Ob0meyAwOBSyKhMQTzdSbF6jtRaB0NFeNho7nDceURT5LC4
	 KsNX8Qd4LJCWEvYI6Zgp9nhUr9UTWUjSJRbdJbe3T00n1f8+O1sax30F+V422tznfUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dx9iK5mh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158E2606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dx9iK5mh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11551F000C5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794548333;
	bh=7PX0i8pHtQvjRW9g4b9HdYeYIOynvMYnFBHislzODRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dx9iK5mh5JGcPC1a0kVPN0MNX3vUf0cyPnz2syKaP1lW+7/k3bsBh+qUdP5S3AyWB
	 6gPJtg48CUtuGZCwTSuoNI27WH6s27lEJKCbYulv5Qw6/I3AWHSv1ketUDXg9lSwJ0
	 lg9LctMrUfqNWkNsJyoQSQwPL20WRFxMvM3hpbIi5DD32+SxhQzYFTZkaZUWxwtUKg
	 fGw3JPcyF1Zx+iGFmUAY1Ph1280Xky4OhmC8qvRakRz2BjH0zGAuWLn0EBR0yZxkD0
	 ihjR/gKUhCBpxPL7vPfTSrT1PvTYd3LIFcV89fdxoGg1kD4S228WNY8y/pEX+KdftN
	 MlHOTe7gOiY5g==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso125015566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:38:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHXyZuNCiu0tY3qh0wyfLkfeLGI5snq12wZjehXkFM9tmm3Som7nZyTqvouOzvG+I89FYOHblvMqq9VeVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JmNzzyfjnB4ENjy2rhHrwlUq+SlVZtMT9/sB+xF3DruAnkZ+b
	mLEUSDTeILzme4IrqYzDc+AmH6uxm7zRnuKBadXrIpeg7tE9jczeFdQsL2QNTsTCXlmFFGUQfT8
	AWp4vxPJYIG8nI1LHz1IK17Py2lIcJcc=
X-Received: by 2002:a17:906:9c89:b0:c2d:c6e7:9e9a with SMTP id
 a640c23a62f3a-c509634a669mr114095166b.11.1794548332730; Thu, 12 Nov 2026
 21:38:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112212628.265262-1-jmattson@google.com> <CAO9r8zMkKXRT0N18haYG+=jyO6FvL7VE84-=n9kpm7vnARH5UA@mail.gmail.com>
 <CALMp9eRmJ8BpWHrveE=nTD6vF9OrB=OiwNA15_4Df-=kUzmMnA@mail.gmail.com>
In-Reply-To: <CALMp9eRmJ8BpWHrveE=nTD6vF9OrB=OiwNA15_4Df-=kUzmMnA@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Nov 2026 21:38:41 -0800
X-Gmail-Original-Message-ID: <CAO9r8zPUT-G4P3zWv02NUifs8c=NgBbcMn7PHzyp4j51bK3ung@mail.gmail.com>
X-Gm-Features: AclHuK8Y6jUiihNT_B2hmRUXB3Vg7dnIolE7NbO65Dtqe_M1bU3FpupggVD9ulw
Message-ID: <CAO9r8zPUT-G4P3zWv02NUifs8c=NgBbcMn7PHzyp4j51bK3ung@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state()
 on guest SHSTK
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:17=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Thu, Nov 12, 2026 at 2:41=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > On Thu, Nov 12, 2026 at 1:26=E2=80=AFPM Jim Mattson <jmattson@google.co=
m> wrote:
> > >
> > > Like nested_vmcb02_prepare_save() and nested_svm_vmexit_update_vmcb12=
(),
> > > svm_copy_vmrun_state() should gate copying s_cet, isst_addr, and ssp =
on
> > > guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) (i.e. the feature is adver=
tised
> > > to the guest). Instead, copying is gated on
> > > kvm_cpu_cap_has(X86_FEATURE_SHSTK) (i.e. the host supports shadow sta=
cks).
> >
> > This is a bit confusing, nested_vmcb02_prepare_save() and
> > nested_svm_vmexit_update_vmcb12() are about vmcb12 <-> vmcb02, so L2's
> > state, while svm_copy_vmrun_state() is for L1's state. I think the
> > patch is correct, but the examples are confusing.
> >
> > Perhaps a better example would be __kvm_set_msr() and __kvm_get_msr()?
>
> Or, perhaps I should just drop the examples?

It's probably useful to mention that without guest_cpu_cap_has(vcpu,
X86_FEATURE_SHSTK), the MSRs cannot be set, but I am fine either way.
With either changes to the changelog:

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
