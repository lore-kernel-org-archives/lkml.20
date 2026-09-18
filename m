Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36D4B95D3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729842; cv=pass; b=KH2GYtd7zFH9Kik6NqLbvw4chcMSlSIT/q8lKBRDVzZVT8cdJvQzLjenOy92L8o7ctzA0tvbKs626qKVQOMsaXfdaTnvtf/6JzZ+VlNUSxlF+m65sVjggg1A89t0NuzepMZjoWjwOIBV66+U7czgXLfIpqwLdp63C9OtzPb+tj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729842; c=relaxed/simple;
	bh=D8NQlMTkB0EOhznxgeBx1U32SLb3Dti876hh7jNPEbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+lyalEVpu8w/2lZCAywInSfvNw2M440LQs3/lV4deiK4NqZJF2mpesuQIDjBtElkPyAT1EKi5A32wLTQFm91AFH38MstEIssB6AZrDPM/Yd8X1YirbLH0/RNJ8A7wGaHRGyLjTDRfjU9AmqQB3BdbGyH4qs+M5RyNp0EjgecZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GKSzWx26; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GKSzWx26"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6428a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729837; cv=none;
        d=google.com; s=arc-20260327;
        b=k1HrMCNVai+DQY5nz+KzTpOR4l+DWn60GcgbLT1qHbiYHTBHBr64DeSFm6smXG3Wrf
         07kpGpm4jgAOkGFcJMGYxIQW7gvs7fxHLhw+1NG0krV0at4RvLnpEMPDTLfP8pfDFiUR
         0d+pR+wKmSlF8owvGsV91a4bxiBQTzlkVsPMW1wAu2Jy2GQGcbhpTQGQaXpJn8MZgLpy
         Ul5RQvbikZt6Lrww6Suqt+cMaEu4omyGBY74i+GUJuW1th144GdWx7af2KSOhM4If+tp
         JTe9oEhzpdEZRGGu3bmCYay07eVuB049SLRk3ZYe1d78JD+mJHjobh6WK+kAQEHnM2/W
         QT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        fh=QPu6iRIki8AEBK/pCjgw43BmKT+XtkymaNN3mbINcfY=;
        b=A77LHbd/H/Zap6C5Af3nOmFT57IfmLm4sW5HZkv1LzR8aUmDoq1La69E5TgmaY5iH1
         tn/HL6uhEkAJnorV3sQJHvuL9JR7TV3q90ppW6sv5qU7BjCgAe6fWr2mwam7kXg/V7z5
         2NukG2FqTNmsFC238chKpWoq7jEvrUg8+fWhsfLqHQOk6sAZPPJFpfrIse/n/sxI8sad
         /foYqCKpMovVnSsmx/k/LbXtnh8Wng7ghyVFfWP/V7rneWOu/k1OtZ85VFXXePnq2C8Y
         +KN9sFkQQ7iWiOvE8hawTDscaESeGjl170GItDqbUv2lAwiq2ahHAzMsbppoiON4oOg3
         C6QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789729837; x=1790334637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        b=GKSzWx26MRfk5eV66AXJq5XBRNsa/MC5hsTmlKaDDqaGzxoVdJMOkyawIKZhVNHD4V
         GjNsGlgsknooExv/i+bhqpvtdmSPDc2MC25KLBiUzlriaoFn1CNzXqEJhQiClFKQTL0P
         ERsk1mXPwe7mqvUZat8BPA+OTwTFdOdc6kxftXBJtGO0Is2X62Tcb9q9AWsrukPLKgx2
         Y7ugiNzTsCgD/GUwVFxR6tvsT1Pnh7Qt0WRquvdwCswNOio/KxNxG76YvmqHMcZCGMzL
         8+IAGFbfmhtOG+U1yyd98RYY+NVd3OOkhmrmmwPkd/N4VtbRt+FDzXMIYclSjLM5oqA8
         fFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729837; x=1790334637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq/2MH8S5nK6mySG3u3/RDyzhbqeFuAbCFn+abDQdoY=;
        b=xzLefpLQA84KUEwl12s5K0ERVXr4t8oJg/RyImUzFcj9JIypwFd4aQIm0+FncUwglT
         hBkSuwcaVPcVieVromF/+r4yPIt/J4b70zZEfbdyY0F3tgLk0Lp5irReJIjBI8HQpV72
         auLr6cCbWPyw8k6OL8A0elYVUFKH5SlEqRURZXPxSUcwMN5LnzYqkGQW3ikiqnOwmWDl
         EShEMuJNZOf+zt5u+aMMTPEJiTQ4mURyqF3Lf3MtFyPuxLhbtakshnKH2xFBp5ufVU3w
         06XXu3BdkgjeH9VsTNG7gdeajZMmP4qFXnUWEIgkhp5IsGPz/S7YTWxUZgpDgTcoSU/y
         B9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoQumn0ZC7HgoephnBThJXT7MH5HnDJKgkAdz5kaJNTlTSFoQ2ijgzmfbOdUCVupNGPoLC/hUK9xMLVFA=@vger.kernel.org
X-Gm-Message-State: AFuF++ne5fX75UJgafUv1bXtPEPldqp5diz9rf3/mFpEKeQWBvJcao/t
	S1f4xk6WCdI3RJSpQATRLw77CDryMyKJKmvEfEQuECuQlLohWuSCPITSe3+tN4hLqJwX2N8oqXI
	H5uN73xQ7suuNbcJhg8n3qTiwoMdapxv4RjMK/lgE
X-Gm-Gg: AYBFou3l+3VYu+AGkeUCONcmHSn3iXdi8PoUYteInDpESeX9OBPh9Abps48mcF2msj4
	OVIL7FooTkO4ioYcffh2z9wazPxJVtJguFkOuo4dGR8PH4beAomVOMm43gpD9YnZCuutCst//rV
	F77P/L8eY6owthjaJx/eTUOam8Qdq9XpAJOA8lZ8A59eBsQUTlmVCe1J5NdVqaWYf3b21paq2mk
	PkWSB/ObcYpBnM3A6VybA6FJYhlnG2ENv/kvs0ePjPg7DneOYVZ5+yQtQF0yBAM5dmNt5Y+BDc7
	Im6IRxW391vwnxel+i1XsF1BMi5NO0XRJrK2OfPdxo+/1ybndDH46d0=
X-Received: by 2002:aa7:d0c3:0:b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6aa5221e1a1mr19881a12.1.1789729836834; Fri, 18 Sep 2026
 04:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <2d608f82681532f3010db14ff8d4293f57620514.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <2d608f82681532f3010db14ff8d4293f57620514.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:10:24 -0700
X-Gm-Features: AcwNN1V-rgmx99EAasoSRH5nrhUVDqdiVaLr-XvIiqfmCZLZ0zQJlJ6-mPzgGz4
Message-ID: <CALMp9eQo1WZhtCEmPhsK=BoCkeSmMfwXh-JHsq6-E0HCkOunVQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> INVLPG's memory operand is decoded with NoAccess, and thus src_val does
> not contain the operand address.  Intercept handlers therefore cannot
> construct exit state that reports the linear address from the existing
> x86_instruction_info fields.
>
> Add get_invlpg_linear_addr() to compute the address through __linearize()=
,
> using the same flags as em_invlpg(), and pass the result through
> x86_instruction_info.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/emulate.c     | 23 +++++++++++++++++++++++
>  arch/x86/kvm/kvm_emulate.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index c1b21282187f..2972a35b0ac0 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -411,6 +411,9 @@ static int em_salc(struct x86_emulate_ctxt *ctxt)
>         _fault ? X86EMUL_UNHANDLEABLE : X86EMUL_CONTINUE; \
>  })
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept);
> +
>  static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
>                                     enum x86_intercept intercept,
>                                     enum x86_intercept_stage stage)
> @@ -428,6 +431,7 @@ static int emulator_check_intercept(struct x86_emulat=
e_ctxt *ctxt,
>                 .src_type   =3D ctxt->src.type,
>                 .dst_type   =3D ctxt->dst.type,
>                 .ad_bytes   =3D ctxt->ad_bytes,
> +               .invlpg_linear_addr =3D get_invlpg_linear_addr(ctxt, inte=
rcept),
>                 .rip        =3D ctxt->eip,
>                 .next_rip   =3D ctxt->_eip,
>         };
> @@ -684,6 +688,25 @@ static __always_inline int __linearize(struct x86_em=
ulate_ctxt *ctxt,
>                 return emulate_gp(ctxt, 0);
>  }
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept)
> +{
> +       unsigned int max_size;
> +       unsigned long linear =3D 0;
> +
> +       if (intercept !=3D x86_intercept_invlpg)
> +               return 0;
> +
> +       /*
> +        * Use the same address calculation as em_invlpg() for the addres=
s
> +        * reported to L1.  Ignore address-check failures, as __linearize=
()
> +        * sets linear before reporting a failure.
> +        */

That comment misses the main point. Perhaps something like:

        /*
         * Ignore faults, just as em_invlpg() does. Calling __linearize()
         * exactly as em_invlpg() does guarantees agreement with
         * em_invlpg() on the linear address.
         */

> +       __linearize(ctxt, ctxt->src.addr.mem, &max_size, 1, ctxt->mode,
> +                   &linear, X86EMUL_F_INVLPG);
> +       return linear;
> +}
> +
>  static int linearize(struct x86_emulate_ctxt *ctxt,
>                      struct segmented_address addr,
>                      unsigned size, bool write,
