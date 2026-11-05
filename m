Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793922190;
	b=b10HLY8IkDu4pTMHZi9Bw9Y7lSmyhPbkj4VTf5W2upaXC8xjZfd/Nws+8BNVAlinAJ/O
	 UVC7cigQ+Yi1yE1DjEvEUSBy26+AbblWJEQ+Ojhap3qZx6vxOSQOuvIxOgqtGTmOC0OB5
	 lCO+kEzyiQSbHvZqi4YVGqCNlB5i6nuUsdK6zjXVuDX8Z/rJiClx4+LfdmGaqf1xIlL43
	 evdAiWfnNnupWWSc9LYADPx4hdmFR3HQcO7XabkrYiKITp+0eCp0OO3SeDN7tis1xaFTO
	 /+OSnj/bX1AbkbS7JJ9NpDZceSWtLks5fg8QbzvalaWi7FWC/k60B5cRtoBoTBho6tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dc90RyiGFoLb3JGpztvQfjTlSJkJ9NTlT+pR5m6yETA=;
	b=B+EqTgvpSkEsVJ3QmysKvgDYAI3XbfuVc8uAhyudb3DELbE2J8/ggUcwgxKETqgho3z9
	 HsWKfxm95UpXRhGD2+EZ0y6Nftlg87TRirzrByp1CdSeSUtbFG+AjfmrRPwvZPIGsnPEc
	 r7W48DS2Ko+Dpikv55Ey/oAGvAfAypxFfjVT7Govg9PJCPz5U+my0wPjLJC08njU693Pq
	 Kso9D+V/Bt5m3YgfnnY6WH10cfhGiaQWv4VWgc2HmWeHwjCCJcyZtJK5jaIGKhMf1XZFU
	 oziuJGz3VbKqN0VzVRW+bczhd2WfGAlW6z3+OJIr/8m0SNGLm75ZSjzTHCYwfAveZ/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fr4F7V4N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE24606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fr4F7V4N
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso2a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793922188; cv=none;
        d=google.com; s=arc-20260327;
        b=ItuwVuHwcR8nsuVKXlOWssAyFLniABnUR29XBvqJ5M04J8vSSaczfCaiFYta+aXwyu
         ZFIBjuKA0vtJui9drhrCzjb/q53C3U3+KikplkTZj7mQ8MHhfY1490XxD7WvRQirriL5
         BnU7yoR9UCsK37Xv1dACDRydXSNJiPW8OhDgh57aiDmkIvhtWYpsh4Ff/9ymYUBEAwl9
         lSxAIb5zr5Ntxd65C8q9uydDM/KO1X69d80b4b8C6ACmWHpf/RPrFW4lJtvcxxjdnzSj
         obsK2GWDYfS/4QRzdq4a/goNKbffXImnn1Zu+UN2k5dduMCIWJIi3oG8+wEyOotWmgy0
         o5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dc90RyiGFoLb3JGpztvQfjTlSJkJ9NTlT+pR5m6yETA=;
        fh=XiDOIkp8SSrCpyxvvp+YyW763cfxhcHAr7lGDpWkpLI=;
        b=oMRAeEXSJ7/fRg/9M8GFLBN3LIzGFtrpDbeIR8PFx0g6Udo9QfTWfjJBbnCrOUdQkN
         ws6cmmLfXmUnOKP7TeQkgSpJO0Q9G/mF5CTZXbNmRvdIYo9Qg7wFk6qczFJm8VaYbaZw
         sZnxjCMl6CHnU9MwPlFUQCcb5j81kV/DycUlZZ6bXY9gD03LFd177cSpokLOaYY2cQYg
         2WQFqfnDi/AUjPWiiYpyAa1Y3XTkHzYF0tXh54gEmgzLoWaAKBjc9UNJye2ulCAHABVt
         JbaxkvM0l54gg8IWvrhdE/1vs6TiGB/0jVJ0KM6ejr6OjcZOQjqLFOLlqpcH0KTWOYWQ
         iu5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922188; x=1794526988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dc90RyiGFoLb3JGpztvQfjTlSJkJ9NTlT+pR5m6yETA=;
        b=Fr4F7V4Nzu0gtdS5tvD30yZSxz0N0QpCe6iAKFnAj5sFX3tvTkTGDthDTe0rGrx+z7
         7PdXeJp3Upq1Oy0f1jJQLwsW9UrW6l7ktO/28+uBkb/ABb7afdVfe1T8+x1It61y75pB
         EfGliBmUxA+srFpcSr9hwMgitM6KpFigNvIrSMFqmFXf3ZmURX0ucVgJtq9QBZp8yqgE
         1OCSD3zyMkVPMZH9urKgMaBoUYG1P+gcGo4SxHcasLVQzz0wpSqW5e99aEqxgxNo+/63
         3qI/oKVxfRQvP/pBhZ77QJ7oVsVxwy9NRIFaaTWAUO19tWCqWEdTYvBDtQIAwmu8yjjf
         StGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922188; x=1794526988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dc90RyiGFoLb3JGpztvQfjTlSJkJ9NTlT+pR5m6yETA=;
        b=K+lJKV5mXokg6KiHlXoVeMpgl6q5hI+5jQQQOUpTQanFSZ9RVqDl9OGuUMfFG3upRI
         2hsYuJQzGPwyQyw8I+bne25jxSJi9o2zbihansAHLUSl3aG3o7X6Q1b6yuUUN21X/YSB
         4qyBIdDIE67mawmBcQxbLjN1ZzfrpBdPrftUeKL7G+b4yruTnGFV+r9E8UTo/MDqqfFv
         dNNMAFAuaHS0kb9EMZXK67gj81BaVJy23N99G8cp6aqTlsIomQjNRyNRvr9rGAN5xfpy
         GwzQhUePTgpnPmYi3nsTk5XcKDK953BuvVNHP62/WyxeCmwSJL5awJjkUI4H3U+AUCEu
         MljQ==
X-Forwarded-Encrypted: i=1; AKwUvByDpfBiM6R/yWesyZVExwtUZBKgiDDzb1UPHRecwMcIUV/095sWIJCN8mQiRRrecbezAEZRC4N38tLPqJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BM52DgxzdTsSSTZHZEWJcYiwKB6wL2+OS6n+pi1yStFX+2g/v
	JfQpS33x53iA5gYQ7fc3YPx8ZxaZdOjuLiGDD7FYMYBnemz+mUgXSDZVp64jUCfH5zfDgJ/2eoY
	2z6BFyPc90gwZ6lp1S8CHsTeLxfG+eEEwMojIoMEO
X-Gm-Gg: AYBFou374vUm7FURkfr2bf+72oAfmWcR+NLtYH0r6gh4lXEV7gQKxKpHQVhS2YpRmLu
	loLC8vyTPytPvEE6wqriF09LaWeNbCKwErvTrXf18AfDdzTOtyPr/OD/NDNsJvd6Py6/5hFI+AD
	gWyJtMVou6Gl67QZCGQXn9eggpMICPu2cyykpR8MyNWHt65coTg69FhG/K95PCjH5/x7UfkLlmm
	IrPEN16FTc86WY8MC6RBH1TbgWg6cO648YZ8Dg45eIFlXQlRy43djB/KerCAKLI3eLFwpatTf3V
	3MKJFBiRKjKYOSoxcs8POAMrFy1F43ZpU5iiP5/KQ50pXRjxvRZu+EJ9aA96rQV1i8IFTCKFVOq
	JSHLyC5kuZVyBrMR0IHtJ52dpzUssXqmymYHz0OM5ZxAYa66/ImIF6KRfMUM8evDB96CHtaT74U
	3EgFFQfMRAPIzEBaDFJcnmUbbOcQ==
X-Received: by 2002:aa7:d29a:0:b0:6b3:b648:314d with SMTP id
 4fb4d7f45d1cf-6b597a39693mr33716a12.6.1793922187317; Thu, 05 Nov 2026
 15:43:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-2-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-2-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 15:42:53 -0800
X-Gm-Features: AclHuK-q1n7ef8QSRUSWuBCekJOMlqyDXP_oWN6zqFV0sPGgMvXhDoC5_Nz1imA
Message-ID: <CALMp9eTMteQ7WpPv++Ds_LZY_1MydqtwHy=7zsUEgrfRempbeA@mail.gmail.com>
Subject: Re: [PATCH v8 01/20] KVM: x86: Extend VCPU registers for EGPRs
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:35=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Extend the storage to include extended general-purpose registers (EGPRs:
> R16-R31) when CONFIG_KVM_APX=3Dy. This option is for VMX only.
>
> Although EGPR state is XSAVE-managed, and thus could be stored in the
> guest fpstate, VCPU storage provides a more convenient and efficient
> access path for KVM.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/abL8SW5JS1aV5goa@google.com
> ---
>  arch/x86/include/asm/kvm_host.h | 18 ++++++++++++++++++
>  arch/x86/kvm/Kconfig            |  4 ++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_h=
ost.h
> index 3af7395c2430..690de9606d6d 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -163,6 +163,24 @@ enum kvm_reg {
>         VCPU_REGS_R13,
>         VCPU_REGS_R14,
>         VCPU_REGS_R15,
> +#endif
> +#ifdef CONFIG_KVM_APX
> +       VCPU_REGS_R16,
> +       VCPU_REGS_R17,
> +       VCPU_REGS_R18,
> +       VCPU_REGS_R19,
> +       VCPU_REGS_R20,
> +       VCPU_REGS_R21,
> +       VCPU_REGS_R22,
> +       VCPU_REGS_R23,
> +       VCPU_REGS_R24,
> +       VCPU_REGS_R25,
> +       VCPU_REGS_R26,
> +       VCPU_REGS_R27,
> +       VCPU_REGS_R28,
> +       VCPU_REGS_R29,
> +       VCPU_REGS_R30,
> +       VCPU_REGS_R31,
>  #endif
>         NR_VCPU_GENERAL_PURPOSE_REGS,

In kvm_vcpu_reset(), KVM unconditionally zeroes the entire vcpu->arch.regs
array on both RESET and INIT:

    /* All GPRs except RDX (handled below) are zeroed on RESET/INIT. */
    memset(vcpu->arch.regs, 0, sizeof(vcpu->arch.regs));

However, according to the Intel APX Architecture Specification (rev. 9.0),
section 3.1.4.1.1 and Table 3.7, R16-R31 are unchanged on INIT:

  The main difference between EGPRs and legacy GPRs, is that EGPRs are not
  enabled by default (specifically XCR0-enabled) in 64-bit mode, and their
  INIT behavior is XMM-like; in that EGPRs and many other XSAVE-enabled
  register states are un-changed on INIT events as shown in Table 3.7.

By extending NR_VCPU_GENERAL_PURPOSE_REGS to include VCPU_REGS_R16 through
VCPU_REGS_R31 without updating kvm_vcpu_reset(), KVM will erroneously zero
R16-R31 when init_event is true.
