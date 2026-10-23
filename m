Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767602;
	b=jJcJSFlSQkhG+NPXkTkLCaYGJmiaMcZPA1Kgxp014I+HEbmWkqgDLnTaBAWJ3EZH162m
	 dAX+eCsENvJJQIMe/j38ll0XbgkQM3CuD2v4j3egonr+vixvNgBvKeMOqwXtV/c+ahl0Y
	 YYvTTUBERlv6mz92iMneRouKzkTweOrlixT7YVfu2F5a003vHG8XObhV3Hm13VA9wkCxF
	 BqDs+TylNo5d1qSGoPK7nY0HQ+EboHTQdFPa/YGIzjMT/uGH6IkxulEejmblqkkqcHlHv
	 +u0CAF84Cm52e6GNWx8DCcwsj5tih9OYhMHRsT/XAYu4YteYY5FoiTU6W71ybRCXBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767602;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3TqGRdfj2f6pP68eFjoILORXa2Gei3E/xbZOJtrKKSM=;
	b=L9UraZ4gPs4XE1SFchIf0HY2IkQy2JXkjyYjr+oouMcZ8EMhf7IOftol/GHeblaMXab9
	 1Xf+MI4MvmJX7i/Am/ygh5vJRmJZfNcTtm2gPOfYxLVyHi5PTEfepz3qn1EsRBNoBJTky
	 w1fePMItKjucgFD8DcrlVczamrosUJUcVilv+qV2OFOwrgF4XWTAQOAvnakhapn9mZTNR
	 41ymPc6uEFUDiltFICu+68FAeiZyEKb93DTqrKA6ufjQfPSP+EeTbhTU+/j2QtrPg9Bxa
	 /+hshO9KZVcyqywNYQm7f144tSS5eWzzhdvGzwn7DYOTT6L72VChxu/iz9XXucXAe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmV3T53f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16903606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmV3T53f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4CE1F01829
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792767601;
	bh=3TqGRdfj2f6pP68eFjoILORXa2Gei3E/xbZOJtrKKSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JmV3T53fAr+p1XBqm6FoeHW+k9L8lHJOGaXc564h2vJpgJDm2K6P4ygluahT1VgvL
	 J/6ipGlgGgKRfX3G3P1pueuJa1km2mXDxIMQWCtroAf3y0pyaSZ0u9ZdDYINZ0UTf3
	 WFiXyc7yZr4KX1Rcd2ZFC1Imlnru0Yxg7cUrfrA0zGxRzbgm7MCtn4eVpFb3MPIzVl
	 07qmL6HmkygJ8NIxuvbg/fqlrwI+OXc+kcesOFMHZKSmrCugkmY/4pvS78huUDTrMk
	 ZmCEUT6hb28CwdPAkAv26ADpOg91OPSwV/T1QF+p5aU9XaQvmXGzAOWKzcXyTZa/NV
	 yRZpfvmESo1Rg==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93a40a9a01aso241133885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+dFReeuREzM6FNTdOrIimLm07ECdHJ51w6Tc+TVXW2jZWV7a9Wp4nnfmDsixNdqcI7ph+DjsqsQQ7F60=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSYfBPxvgAYznNFX8AZ0Goj9oUSnxTS4DimiNCGybX9QaoaOs2
	pYkr6stzUmJYm/raZNQj/kuXPLY7YPq2l8V1iFt5jLC7EmwQfKhUeXUvFEie/nJqnGLS4fPTy32
	HfBRSd6gB6p/RFg/8kUF+CC/hf4Oc3FE=
X-Received: by 2002:a05:620a:198f:b0:93e:7ddb:4ee1 with SMTP id
 af79cd13be357-93f6f8585bfmr459625085a.31.1792767601040; Fri, 23 Oct 2026
 08:00:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com>
In-Reply-To: <20261022215541.631694-1-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 23 Oct 2026 07:59:47 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
X-Gm-Features: AclHuK-VmzpzCFWBtZtVhn5tctAk4rTz9JCIJPsgrG0bk-LkSNsK2i8AV1j0r3Y
Message-ID: <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
To: Sean Christopherson <seanjc@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that aren=
't
> strictly scoped to module init/exit, or similar, to ONCE() variants for w=
hat
> should be fairly obvious reasons at this point.

Do you wanna CC stable?

>
> Sean Christopherson (2):
>   KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
>   KVM: x86: Convert all runtime WARNs to ONCE variants
>
>  arch/x86/kvm/hyperv.c          |  2 +-
>  arch/x86/kvm/i8254.c           |  2 +-
>  arch/x86/kvm/irq.c             |  4 ++--
>  arch/x86/kvm/lapic.c           | 17 ++++++++++-------
>  arch/x86/kvm/mmu/tdp_mmu.c     |  2 +-
>  arch/x86/kvm/msrs.c            |  2 +-
>  arch/x86/kvm/svm/avic.c        |  2 +-
>  arch/x86/kvm/svm/nested.c      | 12 ++++++------
>  arch/x86/kvm/svm/sev.c         |  2 +-
>  arch/x86/kvm/svm/svm.c         | 12 ++++++------
>  arch/x86/kvm/vmx/nested.c      | 12 ++++++------
>  arch/x86/kvm/vmx/posted_intr.c |  2 +-
>  arch/x86/kvm/vmx/vmx.c         |  8 ++++----
>  arch/x86/kvm/x86.c             | 18 +++++++++---------
>  arch/x86/kvm/x86.h             |  2 +-
>  15 files changed, 51 insertions(+), 48 deletions(-)
>
>
> base-commit: 814607cd40df80d5727957adaa857e0feca43497
> --
> 2.56.0.257.gf7497c7d27-goog
>
>
