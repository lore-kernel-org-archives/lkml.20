Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E39381AEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410219; cv=pass; b=tzWb5J9w4L/wp/gBi3Awezqx0ZINSm1DqVbTwBwgpxO2Jl1hQNLyM9SmGJqYYZPpU0ZeEsIDECVEJrGTdacYpFhoS7+1Frnrr0agTfsX9a0gM89XlZCx/MW8rDmV5ey2+03K8lhSet9si7vgPieoNT844wXAeV8TMgXj9P611I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410219; c=relaxed/simple;
	bh=8lWU4cpgiMq9YnX7HwrBm5P/hF6ii9HNA+L6UIhaR9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlyoCjRm9/19ZwSMCL9GUHQ/lPYBKsxVRvmjSiqA8bEeZFENKO0gxFVXAFJmRxVYEhduoLA13C+Hp4E8+X0Xdl8Q+8EmLOi1ZvWTYfkhVScGIzT8azvh4Wl3pqB//l8rkXu2dHOllqprhN/RBC+CwptkewXrRk3rBaOlKuUEXRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJZrI4lw; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJZrI4lw"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so463091cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789410216; cv=none;
        d=google.com; s=arc-20260327;
        b=QGJXm7ebi19R8NY0mFAuMYMSswHOvrK2zpjPegWJETdTmT/TEo1pvYEZC68aG++mO3
         dsuW4WrEypKFtG0bpJhUbMpa8VjC3TIWnLaxSz3BaqSGMRdbSSRi2riy07g8zgJnVFZW
         z6XzIem79mmKAzYIxSJUpQtmdVmDUtlgZsZSAUJPoCfj0IvdLSESJtH5kRKQhQmhatpx
         hmc/Jtz9XaHyM53EwYYcHLzxaHJLUhF2tRzN+nYHeajdT1iJUUXe4+rhaJ3ZzUPom3Fo
         maZrpaSxnW/Yn0kmbi7zuUVeuvm5kUUangPELtneYrMJ5187Vpf/7kQSBwohmBWXRtTQ
         xzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        fh=IjNNc5iAbVAj2Qt/+H+9Wch+FViyQ13aqCtUWXHslgU=;
        b=S3PULOQegkp6iLhdcaAoQDApmi2yFuDlafQngP97mw8FlYOnE3hRFnfRQAVLVBxtIh
         G+BMTIetGDgY4uwDxxPOCagWU7MxmIBadgxbe44g17j1VzAK9+jYlKr6rF2XpWMG+1kl
         9xqav4+qWyoymimG8/AJpGIIvXs3p94Y26OuhmrHx9YRsolMIJtRjJBYrpBfjMf6NSsE
         YPxtSPQ8QNBzfVg36Gunys0xdpEyc3bPpBWLOZplp3Cd7c9iMrmDtFkWDHEFiJhg2EGA
         Fz18KYK8LbNqBcSTVsgLBU7yToPKRpJCFRqRtZzGIAWeqF1qwPrCnZ1AQHNtbSuioK/g
         OpBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789410216; x=1790015016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        b=AJZrI4lwzUJWtbnyW6s2pMShMXQD5O8bEGa9qe58OxRD5MOTKu72DUjdPNzSi57NOT
         j6gI2uMHhoGZ0umG0NPl7R77Zxf9xRTJoZaSPhFOJnzxIaZ2dflUGlBkOeAWdvFRfH2t
         jFtfq1v18/C12ssBZjlSgmu5B6fHW8NGonKV6cACRx60vF1cmU/UO+Y58N0Bn4V7qISF
         wFTOfSjBs6bAujfIpRWnNPv1PqvMX6/OcBDc8P2Ms6eDBGzhnqHgBH2HT2nMwkMPTIsO
         +FiWFeRsWW1EnK7HVaoqcIXWBNer9aKxiZhdcO8j4jVuV/B9skN83advFcMcaZlcMHM6
         Vgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410216; x=1790015016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        b=M0q1rqacixXwBrUaac1n+QCzklbJwB9BmWh9y4mBqE5MYqhgAOb8qjb+B7yMR3NmDl
         xFfmvT6n7tNaESn7RKyCzwxY0MkBwEGze1NgFFqHNpK1f8nJQTGOfphZ+U52XZQzXDE9
         RIRgnVlzmxBhDW9uCRpo2Gv+Fa5ERcR+7oQEjLn0c+7TPJGPVXq5uaNlIIG+KsyXf7Pd
         9q5z7BU+FJzEftLhFgbEQONAWdxFh5EZvolX9MLO1MqwoTHaGmhAEyiWdzj1OAxqkqCw
         mxq78uSuU3OlcxCJZunVccLdv8OkHoW/76MWXohiu9zgm+HbBHxLGCvxmOTu+OtOC4m1
         V+OQ==
X-Forwarded-Encrypted: i=1; AKwUvByxwfOiHFvU9whdFwd3qU+yByf2tw1fGkblgrRN9+jJS0jtw372ffvqU57AKwGX8V3UAoYrSkpeNSV9Z2A=@vger.kernel.org
X-Gm-Message-State: AFuF++mlY9Vwmmhis0n8AJ6abAo2tQjH88mYsFLv9tSm85pPbRXE68Dz
	jBMZp+7H99WsZIou1uIBOapgtoJuE/4NAZP1UXwVjZHbS0IpEkcXJJngGiGhfO82Z8TKSua6oxu
	v+/gMo/BHewFqjjgrQVY78usnClntks8V1PI0HoIm
X-Gm-Gg: AYBFou3Wh4wuereszY4UWCMUm3mjs9Vk4OLZOnz8J86hRGhsFApK0HimmExJDK3pfTx
	MJLnZnZrlfpPs7FJ6LY30llL6GIQDaY17S0hKehSQU3wGl4Ywn3ZFw0YmQJpqI3YLvNdwy/Jcl/
	4o31F74mvXJaTJcgfVe2xjelbefvXgt0SoA9MCFyTJTx+E2H7ki2WOD9HORyqtPVBDj8/Eplsrx
	/E85OoJzB2wgRisWiSzulC7EUVpu0LawVsos4jrHRJ/Jwd81v7Csbn/5CEy/OiAphgY2LRHt0q8
	imGKwtbKMkR1ma7Tl2WLpa8FMWn5WueMK1jUnx07I1ETfqVzuTGu/Cs=
X-Received: by 2002:ac8:5753:0:b0:530:e335:4ef with SMTP id
 d75a77b69052e-5311a5c4df0mr1673231cf.2.1789410215624; Mon, 14 Sep 2026
 11:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <fc88f299f41c99ddb5851c24d97970dc29584876.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <fc88f299f41c99ddb5851c24d97970dc29584876.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 11:23:21 -0700
X-Gm-Features: AcwNN1UnHluX96bH9TjpBlsi84Tfb92oWbyT3d0BFAVR9QTkBp-QT6Wu1rTqanY
Message-ID: <CALMp9eSv77sBcfYpPJm4Uk+9CePV7YMdYXhvBHKHSvacnnRBUA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
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
>  arch/x86/kvm/emulate.c     | 18 ++++++++++++++++++
>  arch/x86/kvm/kvm_emulate.h |  1 +
>  2 files changed, 19 insertions(+)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index 8071b372d233..1dfece6af81e 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -410,6 +410,9 @@ static int em_salc(struct x86_emulate_ctxt *ctxt)
>         _fault ? X86EMUL_UNHANDLEABLE : X86EMUL_CONTINUE; \
>  })
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept);
> +
Nit: I would move __linearize() rather than add a forward declaration,
but maybe it all unravels if you pull on that thread.

>  static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
>                                     enum x86_intercept intercept,
>                                     enum x86_intercept_stage stage)
> @@ -427,6 +430,7 @@ static int emulator_check_intercept(struct x86_emulat=
e_ctxt *ctxt,
>                 .src_type   =3D ctxt->src.type,
>                 .dst_type   =3D ctxt->dst.type,
>                 .ad_bytes   =3D ctxt->ad_bytes,
> +               .invlpg_linear_addr =3D get_invlpg_linear_addr(ctxt, inte=
rcept),
>                 .rip        =3D ctxt->eip,
>                 .next_rip   =3D ctxt->_eip,
>         };
> @@ -702,6 +706,20 @@ static __always_inline int __linearize(struct x86_em=
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
> +       __linearize(ctxt, ctxt->src.addr.mem, &max_size, 1, ctxt->mode,
> +                   &linear, X86EMUL_F_INVLPG);

What if __linearize() fails?

> +       return linear;
> +}
> +
>  static int linearize(struct x86_emulate_ctxt *ctxt,
>                      struct segmented_address addr,
>                      unsigned size, bool write,
> diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
> index 3e375af15c03..d05558ef28ae 100644
> --- a/arch/x86/kvm/kvm_emulate.h
> +++ b/arch/x86/kvm/kvm_emulate.h
> @@ -51,6 +51,7 @@ struct x86_instruction_info {
>         u8  src_type;           /* type of source operand               *=
/
>         u8  dst_type;           /* type of destination operand          *=
/
>         u8  ad_bytes;           /* size of src/dst address              *=
/
> +       u64 invlpg_linear_addr; /* linear address, if INVLPG */
>         u64 rip;                /* rip of the instruction               *=
/
>         u64 next_rip;           /* rip following the instruction        *=
/
>  };
> --
> 2.43.7
>
