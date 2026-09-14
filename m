Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4329D3939B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413464; cv=pass; b=FowpxU2w9nnsIt3jqWKcIwypnM5BiidT/SWtyY7F1JNW0Xe+N16mvpTwrgduDLJMvCw6N5fZQWVagiNNbNJuFIvxgaS3EdIjFMLycwB1xSmqJFg4BGkoZmcQIb9yjP3JeQQTUra0gVvJphx7NVtOz1pMnkY3fKJiSQqXpHHBbfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413464; c=relaxed/simple;
	bh=I70R/0YWeF0y09zlTpACQii1qrXFuiFewaTsH+8kBNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8Z87c6DpegdUOJKn1PoTM2xZDtb1OOr1rEsNtu/Ulvj9VLU07TrysURdlZmFCdr16Zt0VUuPBw2wqP4Nm0iDBici3QdLETTTwGPmCYeaGxMIxT3mfh82VSeBVMeK+RiO99nhUxTeUNfP+O4D+/yg6naGlKgl6TCciHBwYLL3AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0axpJWS; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0axpJWS"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so16521a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789413460; cv=none;
        d=google.com; s=arc-20260327;
        b=K4B/3DNET8K5j138Jm7f6ay6XakukME4comUyzm00v9ZxCButv+11L9lQnWTng7lBL
         mb0HmycBZDKgM26OJP7c2yf9z5ah6aYnuyW54LZSCNGUBpSFD6VLaU/ERCOZqOf8eB1/
         AQNGQXbiOIGvai04YXRwbjdYgCdEcbIuvJePBqSHEkyKSFHcM/2AZ7PRHEkFXfGtK7hi
         dEAq70lncq0mYiH5umLQsC9n2mJVGFqN/+QOFO5XQIBUcvincdLpyYd4FBZWOPnQnCM0
         NIx8yLPWeNbBBM12B4fFXZAe4Pn1/VdfV6TCxHKy62P3bQHLbFpweGbXj653b0f9EVTC
         oWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        fh=A8617mOUaHvTd2uI5U6FazLh9qF+FqJ5ONWHdvmPD4Y=;
        b=p0T4ADNyaRDX9LXhVb8YQa9E/1+YumC3qRaClWt/as/MGuxtlmxYfhWLnjrWyRGPpv
         rEMz+AKZLJTmTk8o2TYQYhh0NxTHvJghldX83vD5Xe8ZdZ4ZX0xIi7LuAKHglbZzBmrH
         508kRk6aU3mYV6CumtAXKoN6kF+7rc6FUkTD7b5z+QaBrSMUt7ezWAcYoP+GSGkXb3PA
         R4m4JgjpnAQkL0xOEaQn7vDW2UwVRRJXPNgx13yu+Lal1rbyXhI7nj3ujyrHTFcdU7+K
         lmtNLaXOD33eAvSdXeSFKerAeMoJmivfSV6cM3vbnGktkfjwpHRvnRnJbois37LtI3ik
         8PLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789413460; x=1790018260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        b=T0axpJWSk2XvqBX5ng9MHBtx3WjHmA3UjvcoCp+HbbWqSyB50puhUo2gV2ZVzeAyxJ
         DP0PvhpBPkDSWLKQlTa6sP7Tv2JBpMhvUc+p6TY62u91BI0qtBEsb16n93WXxkD6UzZq
         3ikdC062nh/5V346G2IQc2WBQPyOEhwAmi0fcQlvAS9d+TGVSFLONyzrrHVXiMrTWiQk
         +aXu0QQAEjtFWC8zYmY7PvA0QKnH6bz31c4UVYPv6NZOlitG2fH/5/We22EWehU4uKP/
         d+zmoKnT9aCMeZe58dNdVf+hEX4MSqozpzZs3WptX3a1XBl6ZGqjwjEgvyi/yfWhl8wO
         y1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413460; x=1790018260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myrSaQTa4vHBu2omtc5agr+BkgMWLQGN5WekDwWEnao=;
        b=sXthxbIkxov3u9oDlraPoOVIL5VGNFUTfNWJUpOAa7M1auxbS8EJM8ahBbiqT7cgSE
         ZA4n7nxenay/nK6hWg7pDXq5xtJ7iXct+aHQJ//VaINWzFnhY3+p5v2FyRyumojP0tzo
         tWHgpJg+hBHuV/SuZ5s60hzds3xZpxpDhnyDIuuKS/AodYsK3hjt6RNu/JEfNB7OYE7g
         V+lHO5k6vWUNugjeRaz9AgSh3ka45DgO9MDZu2biTMKzKf0OPIWPekw1cP73a6uPyle1
         j807yZS1igxQkR48LGoltmLdvFT3KWmqwxIDXazA2wb5ksuVGQa+svbikH239olima2V
         /BKQ==
X-Forwarded-Encrypted: i=1; AKwUvBztJiqUrqMkGBRK+WjULT9Sddy9yyS1gXazuGqE0FzDvBuLK9msFcnfp4N8FhrmFbj20v5gM9eGivGC79g=@vger.kernel.org
X-Gm-Message-State: AFuF++lpEBWVVAh6pBPu7tL1f4ClDVg0uYqhVn6nKKKqz2buTbac9I2k
	FRYlZ6qGjMmi1JwyXgO5pvy1ADs4D/n/JFQDTqreDg95IznYcy75/JFfH0HgnDo02KMk6Y8Bsbg
	F/Xhb/vIsgga1VHb/QqlZ4qVYvUv3mpmkzvXt7PRJ
X-Gm-Gg: AYBFou3Wnfq3N4BQ0BI+b7He3aQHSZCxig6IjQME1udJcvcwT7BR9/OtFEqjiF5fh/i
	YpSDo1TyPhObq9GeWOkchEp73Nezh6weWo6B9gHPhUPeSHW7ydz3+ndzJLlH5GAPAsI8aUv07U9
	dFLneNFm7hJ14MY756XRVYQfhGmQAfyEyDsS9lf9SaxUJ8vkTUAmYe2U51s0iOnM7ATnSPV4UmD
	6tMewijMKFBf26IK8mzyREibIJoqkNh7bZrIYnny/U5v07meCd29Tve1v3bS2cROa6QZOoC0mH9
	4ouFBcPea47++IUC5o3bi97HDiWZQherqEnlWZxk0xAkTjn6LfWYp1W1XoDKm3leAA==
X-Received: by 2002:aa7:cd18:0:b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6aa043d1f1fmr13883a12.12.1789413459616; Mon, 14 Sep 2026
 12:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <37a1f336c303c78bbf942b1babcde828899968f6.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <37a1f336c303c78bbf942b1babcde828899968f6.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 12:17:27 -0700
X-Gm-Features: AcwNN1VzS9Vin9kOzYrPdaEV4UDdLP1p-qtdqTYgtpYlaZGFsre3kVUF8nVDPxU
Message-ID: <CALMp9eQbk4i3jMz4U7cTy_CNKCs6FfU+2fMLW4WDj612YdDfCA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] KVM: nSVM: Track valid hardware DecodeAssist bytes
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> VMCB02 instruction bytes are valid only for the hardware VM-Exit that
> populated them.  Track whether VMCB02 contains instruction bytes for the
> data #PF or #NPF currently being reflected to L1 so that stale bytes are
> not copied to VMCB12.
>
> Invalidate VMCB02's instruction-byte state when preparing VMCB02,
> normally in response to an emulated VMRUN.  Mark the bytes as valid only
> when the current VMCB02 exit is a data #PF or #NPF.  Opcode exits and
> instruction-fetch faults are excluded by inspecting the exit state.
>
> A subsequent change will use this state when propagating hardware
> DecodeAssist instruction bytes to VMCB12.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 38 +++++++++++++++++++++++++++++++++++++-
>  arch/x86/kvm/svm/svm.h    |  3 +++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 73f37b050d0a..1cc3af8247f2 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -35,6 +35,35 @@
>
>  #define CC KVM_NESTED_VMENTER_CONSISTENCY_CHECK
>
> +static void nested_svm_invalidate_insn_bytes(struct vmcb *vmcb)
> +{
> +       vmcb->control.insn_len =3D 0;
> +}
> +
> +static bool nested_svm_vmexit_supports_insn_bytes(const struct vmcb *vmc=
b)
> +{
> +       u64 exit_code =3D vmcb->control.exit_code;
> +
> +       if (exit_code !=3D SVM_EXIT_NPF &&
> +           exit_code !=3D SVM_EXIT_EXCP_BASE + PF_VECTOR)
> +               return false;
> +
> +       return !(vmcb->control.exit_info_1 & PFERR_FETCH_MASK);
> +}
> +
> +static void nested_svm_set_vmcb02_insn_bytes_valid(struct vcpu_svm *svm)
> +{
> +       svm->nested.vmcb02_insn_bytes_valid =3D
> +               static_cpu_has(X86_FEATURE_DECODEASSISTS) &&
> +               nested_svm_vmexit_supports_insn_bytes(svm->nested.vmcb02.=
ptr);
> +}
> +
> +static void nested_svm_invalidate_vmcb02_insn_bytes(struct vcpu_svm *svm=
)
> +{
> +       nested_svm_invalidate_insn_bytes(svm->nested.vmcb02.ptr);
> +       svm->nested.vmcb02_insn_bytes_valid =3D false;
> +}
> +
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
>                                        struct x86_exception *fault,
>                                        bool from_hardware)
> @@ -68,6 +97,10 @@ static void nested_svm_inject_npf_exit(struct kvm_vcpu=
 *vcpu,
>                                     (fault->error_code & ~PFERR_GUEST_FAU=
LT_STAGE_MASK);
>         vmcb->control.exit_info_2 =3D fault->address;
>
> +       if (from_hardware)
> +               nested_svm_set_vmcb02_insn_bytes_valid(svm);
> +       else
> +               svm->nested.vmcb02_insn_bytes_valid =3D false;

For consistency, should the line above be:

nested_svm_invalidate_vmcb02_insn_bytes(svm);

>         nested_svm_vmexit(svm);
>  }
>
> @@ -869,6 +902,7 @@ static void nested_vmcb02_prepare_control(struct vcpu=
_svm *svm)
>          * Filled at exit: exit_code, exit_info_1, exit_info_2, exit_int_=
info,
>          * exit_int_info_err, next_rip, insn_len, insn_bytes.
>          */
> +       nested_svm_invalidate_vmcb02_insn_bytes(svm);
>
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_VGIF) &&
>             (vmcb12_ctrl->int_ctl & V_GIF_ENABLE_MASK))
> @@ -1649,8 +1683,10 @@ int nested_svm_exit_handled(struct vcpu_svm *svm)
>
>         vmexit =3D nested_svm_intercept(svm);
>
> -       if (vmexit =3D=3D NESTED_EXIT_DONE)
> +       if (vmexit =3D=3D NESTED_EXIT_DONE) {
> +               nested_svm_set_vmcb02_insn_bytes_valid(svm);
>                 nested_svm_vmexit(svm);
> +       }
>
>         return vmexit;
>  }
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index e958943b8162..1e12ef1105c0 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -243,6 +243,9 @@ struct svm_nested_state {
>          * on its side.
>          */
>         bool force_msr_bitmap_recalc;
> +
> +       /* True if VMCB02 has instruction bytes for the current nested ex=
it. */
> +       bool vmcb02_insn_bytes_valid;
>  };
>
>  struct vcpu_sev_es_state {
> --
> 2.43.7
>
