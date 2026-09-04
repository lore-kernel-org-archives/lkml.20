Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D873947B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563242; cv=pass; b=e+HY7llkJuEUU0d7fbnQQhKrTtbuSs+GiYtf/Sq4sNVvlEN5X3HHgk7p9Fd3jkWr10oOJV54BD+9NTiHUOCFO8OGnmmZR3qa+xCpyNIX5LMy96f3QZg8izgeSvP74x2Lt3BNb53YEO7NIl1q6ZdJ/jtiJU4yqGIr2vNzumPah5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563242; c=relaxed/simple;
	bh=gb4dOZ2ww7j3/A+6+TU83/q7vS18PQ0rzYZIjQp5d48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cypSVVGJVr18oN3ZcBTMtpHjKcpOLkQS8va4EBFBqRscyHQXCOWBVPDG+yHj7UiMbdKe5HLwOkQsFGHD81iX+lJ26LGAMzWKCTWQBQyUdJkcdWSQR74ELyK8SlGfgk+lB5qSCLNBFbDLBYfldUaib8d0Sq/fdvkF7y9HnfyLg08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c+Mm4LUy; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c+Mm4LUy"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso1373a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788563239; cv=none;
        d=google.com; s=arc-20260327;
        b=IZqTGmkRcGz+YCh2mwx2GhZU+ei/cekSISTzH0RBIGJbpNNM9MhS4dnf1rgCttY0Pt
         bvCsD8EefkEfgtL9aokR7FE7yHtzOFUVBrPed+rx7POJp0U4taLUuN9BWmIOfCxYrit4
         bD83ylJeRcsVQbnZBV0Ily7Kogo3RnZvfdH868ewerSdvKA5Sb+Lau1bJdeu4fIlEIPT
         hFE5KZn6r4u6g2WvYZrPeRD8VQIbxpgTeqCpkY4xuUT52XcsNWf8rIHyj4mMyzmtAilT
         ZK6RwCpHyhZMu1zdszR9ocohufH/HEyI7EGSCgaYuam3mcEYSuzie7+i75doWRSc4Ryr
         uFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        fh=FG2ATtDklbRgbSQPUkj/t5xeo5DZOaP2j5jZMwNsCB8=;
        b=pYqSxfEB1cBp00cttQMyOLocKRQOO77HOT5QgNB1XL7lRjwBKDqPKlE1c3civAnrM2
         ZA8MNwQSZa6gPjyp/rqqm2p+BotLjJ/K+5QoBpYDaIc8hGj3V/Jj+orWntLEguqRv9L3
         4f8qL6H4lXwQPG03fwSqbGXsK/ZsoB7STX/xCw55uyWpl2ZLbKQh4UMxkyD+FaIPdBoY
         9de4goRAmV1DrbGadG6ADITcp/pjJYofuaRmOkULJgq/ilp17fhelYjmkeYlWxqw4owq
         hnuWZVS1cIoQkjLS1I/XleXbL/k9pOX8f9dLm5VqZzznuJqJaiQo0dyQFP8fMQlA+sJT
         hTyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788563239; x=1789168039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        b=c+Mm4LUy6CQfMa6+qhM4yfbVh1vMpIvUyh2B2j+e69FRqYw3Ov5mzgNtu1GXPZEntP
         kMTxC3cWeGGQqL/i3eplHjKRxsXvAW8izmZl1o5JclnxB5Utk01bOVDW2Mg7ofN+vhhl
         wI/Ge93armEP8pAWxKTBcSbmcr1FTAxLMHoxjcK4Jx2v4yOFGqePGjRBMIZYHXex9bfo
         erXeJPKyV5fMhSg/NnKGWj6AFBWy8Z7NTa75p6owNJBAsJL9TFDGXIgVNHjjq0k7k0h5
         t7rrZLOkSvlRmISH3qR37L5xBb4RgwWkQNV20z4i+dg79OWa3T/qsqxrXsZlYMDsav8Z
         R8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563239; x=1789168039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6zIiOUhrTcb0uUWQ8IotYmhxf+N+MfQ3oz9P1c3HMU=;
        b=gue5KsVy175jPJkEQL5afiLm8u4Id3WrwEFAocjtQMfrz1deXgzY8Oc4T2K7AlH9kw
         MdZZ42Ng5aU5xxujxrf/7HoDwSP/XmHZWbnzdSXjvGhRARHU5LkiyTGQR44EBnnRTIX1
         330kik/OdjYM/b6XTyQIg2dPdtD+kzU9bd9rw5RXdN3QAnoiS0IKtsZRmV/1CpSa7Te4
         nSyXqujky5VXUJiFOOCNzgs/35ePLFe4JbipacvnyVxmPgTcDbrIa7JOxLiCPtQfPdtc
         Wem8XJFdPx9QZDjfZcINQF4z9HVgFWAvLOJc2ponR2jWIJj/DgcaNzCLlglPfey+7Hvk
         mAbw==
X-Forwarded-Encrypted: i=1; AKwUvBxTHY0JEFEss9vtvYdR7yJYaMK/2NkRQeGkoFzMl+ySkbYWTezMuaS+DAThZ9AjBsIckayO3O7OmVJOEQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++k+RiQ37WaawMUJqK1nCjARpoRDIzxcc9BRrU9UT+g2eZOBdB2Y
	1i/0s259NcB1FQi0Cn6oB5jl6T5596yrFItSv5nuPNPQl5N98+mUYQpr4dHh3mRhzAdJEffncJJ
	P9cbVXL3t2ln8bPnN6VGcqw67wdxE7r2eCs/59vaI
X-Gm-Gg: AYBFou2FdBXUu7L1X+nEX8WKAzJ5MbVPYrYL60SR6vmhXCDLQZn1J/8T6gi7ejrBXBM
	18Wd0VQcVWXrxR7aSj7U2n1x254/VQYBmuoL4Gu3EHZs//JSREtUFuT9vWGTF1LxxSPNp7L1rzB
	i1bf5nqMoAKncGL9TVuVQoPGsedTGxXqkCbLxrUNvVP2gtA7QEEdhYO2UXKoqS7R2dRUWZ9d0IP
	7XoxuU0GZoM20dxaDCl6qWXLXChXHjC/OhxMMGy697reMrWNAG46ayiOwr++mLvOgmkHxXE8EJY
	Y+8/zILRQSOL7QwIVbrHrC1i4hCP0vMhKuHCXblBLt+P
X-Received: by 2002:a05:6402:311c:b0:69e:98c8:e958 with SMTP id
 4fb4d7f45d1cf-6a7f687b853mr12119a12.7.1788563238383; Fri, 04 Sep 2026
 16:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-3-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-3-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 16:07:06 -0700
X-Gm-Features: AcwNN1W1tvX6VzRjnC7l8gz4hxgqZGETgcAZJsyQxtEsA1mVWr9eN5JoJOp6QQk
Message-ID: <CALMp9eSmrHdLpOi9-xQvcRUxyVN-8CG2MKWnxKfXFaBBDztzNg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO fields when
> DecodeAssists is exposed to L1.
>
> Generate EXITINFO1 with the GPR number for MOV CR/DR, the interrupt vecto=
r
> for INTn, and the linear address for INVLPG.  Set EXITINFO1 to zero for
> CLTS, LMSW, SMSW, and INVLPGA; the INVLPGA address remains in guest rAX.
> Clear EXITINFO2 for all covered intercepts and leave unrelated intercepts
> unchanged.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/svm.c | 48 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 9d607b98bd06..c7c1f1527c3c 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4810,6 +4810,52 @@ static const struct __x86_intercept {
>  #undef POST_EX
>  #undef POST_MEM
>
> +static void svm_prepare_decode_assist_exit_info(struct kvm_vcpu *vcpu,
> +                                               const struct x86_instruct=
ion_info *info)
> +{
> +       struct vmcb *vmcb =3D to_svm(vcpu)->vmcb;
> +       u64 exit_info_1;
> +
> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS))
> +               return;
> +
> +       switch (info->intercept) {
> +       case x86_intercept_cr_read:
> +       case x86_intercept_cr_write:
> +               /* MOV CRx: bit 63 set, GPR number in bits 3:0. */
> +               exit_info_1 =3D BIT_ULL(63) | (info->modrm_rm & 0xf);
> +               break;
> +       case x86_intercept_clts:
> +       case x86_intercept_lmsw:
> +       case x86_intercept_smsw:
> +               /* CLTS/LMSW/SMSW: no decode information, bit 63 clear. *=
/
> +               exit_info_1 =3D 0;
> +               break;
> +       case x86_intercept_dr_read:
> +       case x86_intercept_dr_write:
> +               /* MOV DRx: GPR number in bits 3:0. */
> +               exit_info_1 =3D info->modrm_rm & 0xf;
> +               break;
> +       case x86_intercept_intn:
> +               /* INTn: software interrupt number in bits 7:0. */
> +               exit_info_1 =3D info->src_val & 0xff;
> +               break;
> +       case x86_intercept_invlpg:
> +               /* INVLPG: linear address of the target page. */
> +               exit_info_1 =3D info->intercept_linear_addr;
> +               break;
> +       case x86_intercept_invlpga:
> +               /* INVLPGA: the address remains available in guest rAX. *=
/
> +               exit_info_1 =3D 0;
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       vmcb->control.exit_info_1 =3D exit_info_1;
> +       vmcb->control.exit_info_2 =3D 0;
> +}

Can this entire function be integrated into the existing switch
statement in svm_check_intercept()?

And, if !guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS), should
exit_info_1 be cleared for these intercepts?

>  static int svm_check_intercept(struct kvm_vcpu *vcpu,
>                                struct x86_instruction_info *info,
>                                enum x86_intercept_stage stage,
> @@ -4931,6 +4977,8 @@ static int svm_check_intercept(struct kvm_vcpu *vcp=
u,
>                 break;
>         }
>
> +       svm_prepare_decode_assist_exit_info(vcpu, info);
> +
>         /* TODO: Advertise NRIPS to guest hypervisor unconditionally */
>         if (static_cpu_has(X86_FEATURE_NRIPS))
>                 vmcb->control.next_rip  =3D info->next_rip;
> --
> 2.43.7
>
