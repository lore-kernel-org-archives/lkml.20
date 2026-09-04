Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7D3C1090
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566348; cv=pass; b=bt5ckXW1ZLj1lsG2VCkJZGhRt7P6XaEkorYMtNWJG0O80HI6QGEzTM1wg52X/tHEka3XAdYKzmoh/dCFpWtOSjB6Qo30KBNxKOBvD4YvA+h7kIiBOCsijDUChq6LNVbtaZ9XFqI5dnp3mDfXsj+Aw2/2csG/+QX3fXo31KOM0aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566348; c=relaxed/simple;
	bh=krBmnFRbIq8gF67j4Y7+7n50O8rGry2k/xf6HDV+HQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE+5CNa+g0OL9n+U7YyBET38UxR6bI+99n75UnOhlEc5MMNbFh8+EGAccHeeDd8ADYht/SikhAL1s3DINfb7TFDv/AVPJ14poxBFIufVHGC0b5uem7ha+j0/6jIbRlIdzWXyUDqsF1A9bVTxLhAcYxYl0BGuWAzGQA2FXAaVh4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPfZhjQh; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPfZhjQh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so2490a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788566345; cv=none;
        d=google.com; s=arc-20260327;
        b=TmQJJ9e4sBDWW7ox5D5e7dRfefI+kOWnnnLytwzl+BqJx/wEFd80sEsfQrzLWZu+Me
         dpQuPUeLjlTWjadkMueY094qUvUMH9sXa+1xgPImRCTnyHm/6XsgSCs7O0WtxetAiHCw
         V99pz/CWeRUVEweXzbExmJL8wE21RTMRGt8D+HAtO+RXHcRq7STCeap3rxszs5bvq+RR
         +WPL73Kq+dBLbnKjXm6jj1iRsu4JOjhjZH1aUPMOFHL4w/WCKZ/ADqjIRGDmVYVPwxvW
         Uyt7ByNlMRRLgSNTl9FUOuRCsO+GVb3gYu3u97KrBZtQj5y+u4iNcj/HguHGTbG0twZl
         DXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        fh=oZqEAE+J0oFBREmU8A+FLIB3U7u+LNzacQ0Zmer2C0E=;
        b=RT4xv5uc9Ye5O6uPqYs8SxOvXECoyP2lpfXZoPcWAIPNZhvmGbrIsFNm6MpN2LX7mq
         eXrA0YnoiIWdYLL9ppq4/HvgBlzs4wczOHjbLG2Unb7l0y/oqNZdAYYDm1DJfxbjIXWB
         K+CM0l6W5gpUN5x54BI5ZFM56ujeonDe8WGVbusLqFXqJnsrxpjXPuoyhB00/ftD94Ka
         +rarWGB6q90itVJrY01XJETDgDg7H/PeYkvWC7z1LVYGQ8dsuJSzrtYwqXPUX/mU9eKP
         lStvBtIAYQMB/OPw4VIu+8+twHoKBAFbd9EcfqJPWZCogwSqdHYi+sV97tZspPBsI5BN
         Adnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788566345; x=1789171145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        b=tPfZhjQhDVwmNy1sVnstD0Be7ummGaDZcrFc8j11i9CKV2eqKlaBGDmMJ901e8Xtjq
         INWzo1vj34VIbPo4v7d0V8PgxdbpnpTYxeB+q7WUqa0LnoxAQRUtdcZzIW629DdFomkA
         fICmank83k1iDHCMF4GUMcZf1yZl//9EmgQHpUlYYhBdzoul1Z7BQYEMFPD9/8qh9+Nr
         w01B7J0z8DHEdg24wiE8ive+B3kxmXhfAQdxYdnXsV488N0wd7tgzq9HGew+L9sIzdJQ
         LXWpyiVUKbUCCZF85YM7JHaXRoguDSWDVu+ntMLpEF3Sp8V/u/H5cDGzkgXmmLPj7A2b
         4qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566345; x=1789171145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15M9YH6S+kcXbz1rCaJgiRw7qh7wUbJsCq2CIKQ2jE=;
        b=p+G2ofxiBcqkHUDTX/1DPBs3h2sKe3c219UUPaUE03AB1V/hEbN/dpRRlxxi8CPxRm
         xy+B+Anv8hJ6SGM4AbHqyOuiDIlIRakER/unpkpXcq2qJGc7j1ADjh8cPDFme12h969b
         0JPXPBtEP201k/JcPRT9Sy1Cq7upI9aowDB0PgpUMirTn7mpOeBM5p4gWXvg4rg6rSzA
         /uvhYcddKvoSyVSB5PZ58u2XrxUH0cQ48Aldarpmtqn5cFrvtr7V4IdrmXNuypuA1n3L
         XdSmZB3qsO0DJW5J7z/lgrgg0XnHLO9dx/eN/6VrE9vwAmK2ZQse99ZBxdRR5nNYJrdd
         nBQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAiipdNUhQSxURH9J6198UBcZH2TgdbDiQqllBBtAwLWByImUZrl8lD1dGPGFwNSOs5KwjofdQhtoMDno=@vger.kernel.org
X-Gm-Message-State: AFuF++kI/CN8JQrmHIHWDx5z66UdWHUOPuv5N2AaBiLjAZlq6esy7OXL
	6IPNmrBYm99ZfDIckwUu2g15Kg6D3nRyhGSSle9ekWZlk5gtxw6qy9xR6ZUNubRSkRlcd8w+H2a
	etatPYJZWDLdc6CiclkuX/BRiOeAKq4exls2187+y
X-Gm-Gg: AYBFou3tMOz8EINrONiNCbSwNvEgefcVLUt9sENsgQY6Z27eukU7giAfRt7XxGYJYnC
	njQzZmGFA60j/+SuS5T5/tJDNtlDyOAxsIKZrXjeEiS4qqWyHz4RB9/p2bneORG9pR947IoRPiM
	pAsNJSFEaqQC/zOuNYqEyzi8/S4eIFN92gkQCyPKlZxh4FSclVNl6irqSLli4z6S9Q4pTNNvat4
	6c62yjJ3Ih4sGDyHWmhzyPqLJGZ+4fs85zNrorYzalJjYXaOV+jtRw70YCD8YExuW0xYVvHxOV8
	x6McNL3eWa+fn2gtWGKnFyacFTynUo97KYdPJz4P5RAS
X-Received: by 2002:aa7:c0c3:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6a7f67ae76amr12701a12.2.1788566344746; Fri, 04 Sep 2026
 16:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-5-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-5-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 16:58:51 -0700
X-Gm-Features: AcwNN1VzwHjjOpDM8aPo2_uyIHXlBmHXB-Cus8IcnrfXF5YVspG-M2LzaQS3L0E
Message-ID: <CALMp9eR=TNUqfbNCFkxmg=O_Obcj11Tu9jAmX6Pe60qvvNx-2g@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] KVM: nSVM: Propagate hardware DecodeAssist bytes
 to VMCB12
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> DecodeAssists provides instruction bytes for nested page faults and
> intercepted page faults caused by data accesses.  When the feature is
> exposed to L1, copy fresh hardware-provided instruction bytes from VMCB02
> to VMCB12 for these exits.
>
> Clear the VMCB12 instruction-byte state before rebuilding it, and leave t=
he
> length zero for instruction-fetch page faults, unrelated exits, and exits
> without fresh hardware bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 6770721d4e4c..2db0ec66e8dc 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -42,6 +42,20 @@ static void nested_svm_clear_insn_bytes(struct vmcb *v=
mcb)
>                sizeof(vmcb->control.insn_bytes));
>  }
>
> +static void nested_svm_copy_insn_bytes(struct vmcb *to,
> +                                      const struct vmcb *from)
> +{
> +       u8 insn_len =3D from->control.insn_len;
> +
> +       nested_svm_clear_insn_bytes(to);

It's not obvious to me that this clearing is necessary (except in the
case of the early return below). The APM does not say what happens to
the remaining bytes if there is a short read.

> +       if (WARN_ON_ONCE(insn_len > sizeof(from->control.insn_bytes)))
> +               return;
> +
> +       to->control.insn_len =3D insn_len;
> +       memcpy(to->control.insn_bytes, from->control.insn_bytes, insn_len=
);
> +}
>  static bool nested_svm_vmexit_has_insn_bytes(const struct vmcb *vmcb)
>  {
>         u64 exit_code =3D vmcb->control.exit_code;
> @@ -67,6 +81,25 @@ static void nested_svm_clear_vmcb02_insn_bytes(struct =
vcpu_svm *svm)
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
>  }
>
> +static void nested_svm_update_vmcb12_insn_bytes(struct kvm_vcpu *vcpu,
> +                                               struct vmcb *vmcb12,
> +                                               const struct vmcb *vmcb02=
)
> +{
> +       struct vcpu_svm *svm =3D to_svm(vcpu);
> +
> +       nested_svm_clear_insn_bytes(vmcb12);

Clearing here is premature. If L1 does not have
X86_FEATURE_DECODEASSISTS, the "Guest Instruction Bytes" fields of
vmcs12 should not be touched.

Moreover, as I pointed out earlier, if L1 has
X86_FEATURE_DECODEASSISTS, and the VM-exit doesn't have instruction
bytes, you onlyhave to clear bits 7:0.

> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS) ||
> +           !nested_svm_vmexit_has_insn_bytes(vmcb02))
> +               goto out;
> +
> +       if (svm->nested.vmcb02_insn_bytes_fresh)
> +               nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +
> +out:
> +       svm->nested.vmcb02_insn_bytes_fresh =3D false;
> +}
> +
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
>                                        struct x86_exception *fault,
>                                        bool from_hardware)
> @@ -1332,6 +1365,8 @@ static int nested_svm_vmexit_update_vmcb12(struct k=
vm_vcpu *vcpu)
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_NRIPS))
>                 vmcb12->control.next_rip  =3D vmcb02->control.next_rip;
>
> +       nested_svm_update_vmcb12_insn_bytes(vcpu, vmcb12, vmcb02);
> +
>         if (nested_vmcb12_has_lbrv(vcpu))
>                 svm_copy_lbrs(&vmcb12->save, &vmcb02->save);
>
> --
> 2.43.7
>
