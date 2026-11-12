Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443346;
	b=HugiLAoftAiVNwHyGT08FfTDC5/UJhTErE2RHMotby8pJgqTdKgoOy2tb7qfDz8ezS+B
	 3RZ+2UY0aiWUQlWJM4Frrz5ppjr5fJzebxVjfW/NvvH8bgyDLrFqq0T7YNlBzQvpFhYGP
	 UJ/2zkAeWo1WL+/BXCFpwcw+Ufh+Y9w9KzlVakLAx4BwN9ot0cNcmXF80N5FiVPwojtlT
	 h+IWamUGs3vbilg8L1urzA16nx2eZeuXwt2+jvBdd/xufbrv8yrVeZd9W8si8GsSHxnoA
	 y7AVB2hDPXgid3MWF7Fd4xRojqORuCzcnSaQyiMDkMc8yGS5dwv5frUVqtyA/z4gcLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
	b=xJbzFeYP7El/zfncKN1yiSUMUSLvFeN4hA+k0r/jpjsUErlM0uyIFZrcwiUDDArB6G0J
	 iJzDZsJrM3zs67onoZUNU49scYJ82zpzUJ67KMmDu/any+RNQKKFKfJJuESxlhgF3gVz3
	 n9gspPoY1tNPxJDzEz1d2tGZ0rPdrd+FcBXJtxqLYDFZEiU+phsiits+pnBFxLok803A6
	 xQlFgpeRiQ4Q9htMO0Mch4pw2hWiPMqfdsHLThDSlrTrOqMZjQqsJ26qm+GQpOxpbLwTy
	 4AX0ZU7wuzK6UJqiMkoVynx21llaeNAlns5Y/5gbHGygHmB5Mc61u88L3yQmmupNrcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C6606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566C6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dWqQT3ss
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2788a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794443345; cv=none;
        d=google.com; s=arc-20260327;
        b=hVmDW0cQHeorvJBLrhkXPDyaFQDHWJY+EXVhmg5dacodpuckdhxaO6FP0QinwOEAqN
         q3kUD3X0+whoGBZ1EKDOL6X7eH1ltZM7ineQOsN4vMHHjDb+hD18/SRMfM+ELMA/K5uk
         UQkDXWY8d9jwD7hy3JHMqenbSWHe02F2lxZSJy7E/1/4VrRBnIyhKOmq77TWQioP9KPS
         HdIz9rdMDCwqsKtDdNjqFSgfSq/w++XvetN3CDcuWztzcqwIGiuCWvNKlKdZUeYAaThL
         YvOn8gcfmGjNC5EcF1FCcdzf1PDH7FFZrBUBFwCEBBOkfk01Fgz/y1C5HG5f8FMG+7Ep
         H/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        fh=rmzlrWI1/AfaiDBPb0HRIx7nRKMM/gAWRq4QlQW9fC4=;
        b=NZcZGlpjA6Z9TmK2p409GE46YFoGVrzXiqKrQUegRSPLv2GnsPqMMgrYqNu9D6XVal
         IEtVDSCF45QSV2R9s3Rj86ocUZfrMKtEcJizJtdZ7LTZ9aTosrK8xN6Ivwsb9RhckJ5O
         heSNCBGeI5jWUTcEHiJsJBbZHRIXRCBQq8jDwpckEkcdY89fP2FDNAuQsjjkj8Swvg9E
         cJFKpEecmU1o2HX7Np/MxAYDWh0e6cb18oUD4Vx0SeNZro1zYtQ9NX4ZY0TuYOwdXbzc
         bIZM72RjzfO+8uFWZOTCzkPRPq1mKzR+ygx1RIgzwa4+zmfLDPhOKaJIJc+h3NDZfKUs
         6P/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794443345; x=1795048145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=dWqQT3ssiqROBYD0HYMwG3O5nPjjOo5IjwINBmN5oc7CzXL85oVF14ngDDeicTy27d
         2Es7j4TbUyeAsRFZ5LMNnbcN6tngmqEe37zn6zQam7R70nrWKaO/Io0i8c3OltCnsjrW
         p6kxiLytSyLd/PDkEK8KyflKBQgFd5eZ+7Vk3JxF7KDwCDXijnylYtGY7rHNOWZiqOcp
         g1mevQ9evlsKf2tijEuVEGuTdiNRZH72IvJodG8cb1HsC1pBtbwAHx8rVIB42/gu/2Ui
         o/UP7aEJoLE4r5bEJX62xrTK6lyiZm7IFZ4+kqgjV9sNylagHLcMQXlzr13PdXPhKm0w
         LkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443345; x=1795048145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO/HzhqW9y47Gumkhuy8EImU/3z+JleZsJUrX3HvkHk=;
        b=SZyNnYSQxRGXoVwdYrTRLy0l+CSuebD51nybqIOWYyte1BmHkBns8AfMgswDkzyF6a
         yA98cz2s13/U5Xyh9YwzfG/+9YccW3r/OQ3miYK05/iAwUeTF2gaeYITm+cawp1/Wj4b
         U2Sj/s9qv09lNyE+AlfGGIuAknPGR5CShQNl4+yc+t0kMworv92/wIBc6MjITHV0Hjnf
         24w10k7kEo4+R5bOEGuTfdpkVylg/oz7WoYfxbCX7/Q+WS8TOVZg24fFGvT9rnIQ1SOL
         kgCDX4vBrH2dtEI/P9/m4nls0IO1ezPuNvu7uerQ4z7YCD1CczhYg0mBsvBX+s04XdFM
         44fQ==
X-Forwarded-Encrypted: i=1; AL+hErFkSgHFtXUnpGVKBnvK/Q4p9AC7qqLBQRRl99HqBCv7622qbEz2ZHWILSK09/HROBUhpzL94Fpjt5M7f90=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cQjEPBipQ9cB2+Opc2vfIlvygMFeAEUchMmX5euHIoTS9yAvk
	oyMawi/w6NDUswuF48Y3XE5oWwt3XXP1Iuyi5RQLqXmE21XuRYiXqKF5dd0I343+Jvz5dn8d/fd
	iKLLDaq+vCgEsH+baivILtjZLQYlr3oJbX0m9g0fr
X-Gm-Gg: AYBFou3cYhLFKtoKH4rmSNahHt8rVBEhvRCq7TswM2zEWK4oWXGXVaOhTWA3nDF03qy
	z+HANnFWqlpKwfiUEtuWRWmclKvfdYtkUigm3tNxyUI37GM/K/p56X0i/Wpzh2wKgg/T49Tae+r
	jWLvnxx6QQ0NV/KIH4jTObQqANil0w95Zyf4tbNg0T53u9bYxXzdMteCLakp6mDA+hqamyeKAl2
	PNcjNxTpxLVBs4KE5VbEETqsnYGEZX9cpGPsZNMOiHw9S5OuXPC1jKTR1JhqNlTYiMoVnOjdtRz
	Svo6hYFz9gwJFrdyDE6TpRT8yLiTzMageKTEFmMXJ4t9gxBPon06+WC776SzQuDDTt+zgjU8/Um
	at+hmrgbSeig+vhoC0V71sA6pAnIWol98D8FfAC+WeGdvANiaiJbldiymmkfWMJDGfPghDDeY
X-Received: by 2002:a05:6402:4022:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b7a2a2458amr26083a12.14.1794443344422; Wed, 11 Nov 2026
 16:29:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <90467782be23b83fd3e9a6afe2f1d2149eaf9db9.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:28:52 -0800
X-Gm-Features: AclHuK9Fp7q_BxQtLzb7tD29UbrmuAxqzi1HMzLWvRd49RzuQMFPjipCoyh1bWA
Message-ID: <CALMp9eR2tm=RkNk_cYsYj0SZmcUBTfxpYiqtLbtCE4TJ4H6jzg@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] KVM: x86: Forward VMware hypercalls to userspace
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:05=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add KVM_VMWARE_ENABLE_HYPERCALL.  When it is enabled, exit to userspace
> with KVM_EXIT_VMWARE when an L1 vCPU executes VMCALL or VMMCALL with
> VMware's magic value in EAX, and let userspace complete the call by
> updating the guest's registers or by having KVM inject #UD, #GP or #PF.
>
> VMware guests reach the hypervisor through the "backdoor": either the
> I/O-port interface that KVM already emulates or, on newer guests,
> VMCALL or VMMCALL, with the same commands and register conventions.
> VMware's userspace implements the roughly one hundred commands, and
> reviewing the command list on the mailing list found none that needs
> to be handled in KVM (see the Links), so leave them in userspace.
>
> Only claim calls that carry the magic value, so that the same VM can
> still use Xen, Hyper-V or KVM hypercalls.  Never claim a call from L2:
> the only L2 hypercall that L0 handles itself is Hyper-V's L2 TLB flush,
> which doesn't use RAX as an input.
>
> Pass operands and results through KVM_SYNC_X86_REGS instead of defining
> a second register ABI; KVM_EXIT_HYPERCALL returns a single value in
> RAX, while backdoor commands use RAX through RBP.  Report the CPL and
> leave the privilege policy to userspace, as VMware Tools call the
> backdoor from user mode.  Instead of completing the call, userspace can
> have KVM inject a validated #UD, #GP or #PF at the hypercall, and may
> update the registers as well to keep the partial progress of a
> high-bandwidth transfer.
>
> Don't forward hypercalls of vCPUs whose state is protected, as KVM
> can't access their registers: reject the flag for VMs with protected
> state, omit it from their VM-scoped KVM_CHECK_EXTENSION result, and
> ignore it once a vCPU of a VM set up with the legacy KVM_SEV_ES_INIT
> becomes protected.
>
> Link: https://lore.kernel.org/r/c60b32a3-e699-4a8c-8d52-09b34c4d5269@redh=
at.com
> Link: https://lore.kernel.org/r/CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=3D0YZ3j2=
gGhgmaFRdCFg@mail.gmail.com
> Link: https://lore.kernel.org/r/CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8cc=
xYzk3aFzCA@mail.gmail.com
> Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static int complete_vmware_hypercall_exit(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vmware_exit *vmware =3D &vcpu->run->vmware;
> +       u32 pad1 =3D READ_ONCE(vmware->pad1);
> +       u32 inject =3D READ_ONCE(vmware->hcall.exception.inject);
> +       u32 pad2 =3D READ_ONCE(vmware->hcall.exception.pad2);
> +       u32 vector =3D READ_ONCE(vmware->hcall.exception.vector);
> +       u32 error_code =3D READ_ONCE(vmware->hcall.exception.error_code);
> +       u64 address =3D READ_ONCE(vmware->hcall.exception.address);
> +
> +       if (pad1 || pad2 || inject > 1)
> +               return -EINVAL;
> +

Should this check kvm_is_linear_rip(vcpu, vcpu->arch.cui_linear_rip),
like the fast PIO completions do?
