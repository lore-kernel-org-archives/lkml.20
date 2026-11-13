Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589193;
	b=Zr1T44VCs4d8mbzeagPv4D1q46dc2kiCa5MJygEFeNeoS/InmOicrr3vokDCYkVE3eOt
	 OC3xotypTmMMuoulbtTi5xHrtyWiVTv6f34cEBIio1Tyks+D1qZMNYxEecWefD2i4rITc
	 oSJiHCou2e9oTZYtawh7WgGUe5z6apyE2hU4UJpZjow1f3rGMuJll2UCmWrMoDsrXrBvK
	 z3cDu9DKjlj3XLokaCP1dj5+DX3Lah0xXRSNKmB1XaGg0heCCY7eUhY7SLGXC0SYRREgq
	 1LFVzI0LhHSdbWZDpsA0gYA37G7QTacHRp3k9mCNtMPASoOruu2hbw9vikPi5M/V5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589193;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wgzlMCkgAsu5CQiRrpZO0ziSJijVRb8hvM5ncdn/9m0=;
	b=aerWltVKb0ybXsEMy+IazoEJ0sgCYnLs493UM7Yz2NfwNQ5r+a1lRM7na5ONzE5clLsG
	 UrpRYCfjbQFjUX2osTff1pglolDA88Yql+NHOP2hVXnN5y6AVEptB/M/0VETYJ9phFoSq
	 mwndIppFl/nf8l1fhBafUU1C8QnJhSv8RyilA3hJv8Hb2uGjHAdw0ScvxLaySeeVcga96
	 HXHD6QKroyDLEEV7uhTqZlwQCZI17kJlt19sTbsjZIfeJn6+5C0Tt6gxDyv672ozs0c3o
	 83jpb5qQ8wW+MOilB+m5nBfT9QVDYqqzJwN0oxyopgVOUY1YBXH3mEgKFPbqQHooHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AeSwIvET;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93596606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AeSwIvET
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706C81F000CA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589193;
	bh=wgzlMCkgAsu5CQiRrpZO0ziSJijVRb8hvM5ncdn/9m0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AeSwIvET7pF2MKlQGYcTWD9U2qIRR8OCZ6gvvxiyOQpiYSJYmOr8bXT6ATdH0d7/X
	 QqbYFRd4ek78XnpKgpRsculhlu4tEahpl11g4xfnq2Bwr2SJPrNaQvNp+PwT4jDDpG
	 aJQbNiMR4Q5LupQ4cBSRcmflL9pHg1jgmpJ01WPTnVpU2lDHPS6agC213Rb9kS9D1r
	 UwBnbdMByZ9UJhh9msW2UBtu+goRHnv4Qh0SVGIBoPNmle/GWbT8x97HOxkqIciQUm
	 FSo2Ec2STCIfqjS3S1gG+FDTHaNOErZ6T5bUFlBRzR3Dlil0/yhFKRWwGAIELaE7sw
	 IwBGcpwZatExg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so290738166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:59:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZtQQzQElgQYFy4k7BiU7vBUoAWyIXFI8uXq4wbn/UzU/xnbq15SCkWnfNROG4oegnVryLtdORCShmDcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+echrlRlMS+Y6VS2Hth33cMD1qTBey8uJB0y7odI/Q284YWO2Y
	tTxutCMd7VXNLCPePO9EUbH1rDptQGu2yI0+1tQ4b6YxZzqG88SBRxh/XlxGRaXmS30SHoF3XbJ
	/5HBAj31lkb0AIjbuVsjtGZLPL0JyY4A=
X-Received: by 2002:a17:907:2d24:b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c5095db3278mr321539766b.0.1794589192252; Fri, 13 Nov 2026
 08:59:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113162556.461390-1-seanjc@google.com>
In-Reply-To: <20261113162556.461390-1-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 13 Nov 2026 08:59:38 -0800
X-Gmail-Original-Message-ID: <CAO9r8zNi+SjoNTQA49qZ=M+ScxKZmxGuCrXznXtVBnuJc1=avw@mail.gmail.com>
X-Gm-Features: AclHuK-gTCuxozU17TODtCi35T4jEwKOePW3MLI_7q9_i_p27j44pUugSqrBsbw
Message-ID: <CAO9r8zNi+SjoNTQA49qZ=M+ScxKZmxGuCrXznXtVBnuJc1=avw@mail.gmail.com>
Subject: Re: [PATCH] KVM: SVM: Sync CR8 to the local APIC after marking the
 VMCB clean
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, 
	Stefano Garzarella <sgarzare@redhat.com>, Chris Oo <cho@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:28=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> From: Chris Oo <cho@microsoft.com>
>
> Sync CR8 from the VMCB to the TPR *after* marking all VMCB fields as clea=
n,
> as syncing CR8 can toggle the CR8 write intercept and thus mark INTERCEPT=
S
> as dirty.  Clobbering the dirty bit can result in KVM failing to detect C=
R8
> writes if the underlying "hardware" uses the clean bits to optimize VMRUN=
,
> e.g. when KVM is running on Hyper-V.
>
> Failure to intercept CR8 usually manifests as hangs when running Windows =
as
> L2, as KVM's view of vTPR stays high and so KVM never injects pending IRQ=
s.
>
> Fixes: bb365a506b1e ("KVM: x86: Unconditionally recompute CR8 intercept o=
n PPR update")
> Cc: stable@vger.kernel.org
> Cc: Carlos L=C3=B3pez <clopez@suse.de>
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> Not-signed-off-by: Chris Oo <cho@microsoft.com>
> [sean: rewrite changelog, massage comment]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
