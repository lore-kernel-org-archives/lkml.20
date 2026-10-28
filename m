Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207487;
	b=dtdDjqgTeeOCq4H3+IqvHR7w8oyVlnc1NeerrwuNnwMIAZCUzDHyeHZT5BAK0RjJiHVN
	 nst5aYDzuAR6Yt3XiwqB8xrmZ1279mwESg935q3U2zHXu5DhZIpywcCvZyJQGx5pPIDij
	 ho45SXE2i9dElOroRQiSSshMP0MK+yQAsuStnzig8gOhwg6dJIIUYtWijobd73PK9GEEF
	 e8MIVeBlJ9J0VILnTGkcfBbgOMLCbqMWUONA/p6LAtoUA9K70kwSUMM3y3l+LmzYhEJ7j
	 DTlPBp+ZAM2On/jxSlqlqsp3bdajptMx+1jmZcIn6TxpDLzDf2fgu4Adg0/rm3QPqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XhK75528MoHByOVxCJxhQ0foCg6UVn23+RKhIXHX2s4=;
	b=z7VvDGauYs04If3WI0iSMEGRkvmS7S3iLFYoq2Y8fLYkf/wvLe+aIJhKtt0rBCrf+AAB
	 RiG0AQ0niYHsfQFxxLDAZblzGs6uf/3HM6paizdAyvDeu3gae8IeEY0FzZ7le/R/0fv+3
	 nqSwIZWd4RcxtO3u/x/jiEUfQelhk5meSMsnSVrgrenzTjfp8vNzZ91D4TdniEnsSVDa2
	 jFpad65iOf1T9NlZ6awuenX8cQVx6GxCHxulMxgDlwhd4LV2Lc8ts/P2TLkrE7btqYS9c
	 gwcrJf4ot268cDfsB+COZg/BOtC+Pdv+0Q+7jlow2Ota9gb0bhnf2zIi1KneZUqWmew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NpUGmY1M;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NpUGmY1M
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9d52f684fso11040265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793207486; x=1793812286; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhK75528MoHByOVxCJxhQ0foCg6UVn23+RKhIXHX2s4=;
        b=NpUGmY1Mj16wVzNUXjjzxGVWnE7CVwg/f0IurxCXdvy3WLeJC87FBTDoJIIfVZLWla
         ND4hInzRx7k5ngq5qRJch9j0/smCslskhv9KSdpfaZVo0yBhiY6eBV2ejmt0D91fDBG9
         7uSUoTKxqUxNYXf/uwE8XiCRQi4kOJ1XrMzuvYaqU7fjJA+MxSPH+7wXYse3f7wf92tF
         OBN2bp5JQsNTvTDC47xyjvoDi9gCangQ1J5vgaa88IxInhn8kOKNRlmxLh0XLDvl4xFR
         ImUxYNRwzzTK108jU16R5KmwDReAjaU01hZQQwIPxamPbbyuyTMyDSQEwOygMmNbK+Jk
         pFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207486; x=1793812286;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhK75528MoHByOVxCJxhQ0foCg6UVn23+RKhIXHX2s4=;
        b=vgp/GzgWElXMsCoZcH4VLLWL/vJ0MiYy8fpK6PxtWPXjrDlT0eAgT/JwpWhxnRHDoM
         DKdmGLus5wXecO0H1XZc2DoRdX0kC7ZJ4PaZQTsVqvFqlH/XU1OVzTNkqQK+IwJLrG1A
         xf9n9BFeDRmocwOeG5IWfqEmSGn6++7kR40iaRZFUvm0E4gWM3ZmrzQzB3TMF2hsJ689
         bp0dPwib3raqp3awE/JuQHWrQ4dVGEAq5agsD87LkV2tgtTolIFThtFPX9u7qALoaDC/
         lX/rnn3VDnhy5JeShchKjP6yHT2+cOp5Xedx0gQ4HbVV1l/QMjOMB2VhD2EN256IzLAg
         2wxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMo+IBRTnlhpbKXUSTYMiOrJH7JZZHgjayPxIQYjIrL4oHHmxU1ibmAEsiWo6Akp+J7fBwpS0w1/XgJ+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzcankKcb5ToZb/+EnzLXK2A9fUzPRY0yeRiH+7rTOM66CfV6W
	EnLHCVE8lG1DWbpk0Aijb2o5+Tg+4b/S1rfYN0xbjk/wa/yioV1UFW5CpHp/rymLK1RDSSTfqHz
	7ETYaDg==
X-Received: from plld11.prod.google.com ([2002:a17:902:728b:b0:2e9:5b68:4b7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c4:b0:2e5:dce7:5c43
 with SMTP id d9443c01a7336-2eb002427f7mr28403405ad.6.1793207485987; Wed, 28
 Oct 2026 10:11:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:11:25 -0700
In-Reply-To: <20261028132657.1416783-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028132657.1416783-1-jmattson@google.com>
Message-ID: <auIsvY_Z5Fbej9U8@google.com>
Subject: Re: [PATCH 1/2] KVM: nSVM: Set NMI_VECTOR in synthesized NMI exit_int_info
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

I'm mildly disappointed you didn't go with:

  KVM: nSVM: Really synthesize correct EXITINTINFO on vmexit

:-D

On Wed, Oct 28, 2026, Jim Mattson wrote:
> Include NMI_VECTOR (2) in the vector field when synthesizing exit_int_info
> for a pending injected NMI in nested_save_pending_event_to_vmcb12(),
> matching nested VMX's idt_vectoring_info_field synthesis and the APM.
> 
> Per AMD's APM (Vol. 2, "Intercepts During IDT Interrupt Delivery", Figure
> "EXITINTINFO" and Table "Guest Exception or Interrupt Types", and "Event
> Injection"), bits 7:0 of EXITINTINFO hold the 8-bit IDT vector of the
> interrupt or exception, and injected events are recorded in EXITINTINFO as
> though they had occurred normally in the guest.  Although hardware ignores
> EVENTINJ.VECTOR on VMRUN when TYPE is NMI, EXITINTINFO records vector 2
> (#NMI) if a #VMEXIT occurs during NMI delivery.
> 
> Commit 36e2e98363e6 ("KVM: nSVM: synthesize correct EXITINTINFO on vmexit")
> replaced the raw copy of vmcb02->control.exit_int_info (where hardware
> populates vector 2) with nested_vmcb_save_pending_event(), now
> nested_save_pending_event_to_vmcb12(), which sets only SVM_EVTINJ_VALID |
> SVM_EVTINJ_TYPE_NMI and leaves the vector field as 0.  As a result, L1
> hypervisors that check EXITINTINFO.VECTOR == 2 for NMIs (e.g. FreeBSD's
> bhyve) or inspect the vector field of exit_int_info observe an invalid
> vector 0 on nested #VMEXIT.
> 
> Fixes: 36e2e98363e6 ("KVM: nSVM: synthesize correct EXITINTINFO on vmexit")
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index af0ef678433d..9b62113f0cf6 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -673,7 +673,7 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
>  		}
>  
>  	} else if (vcpu->arch.nmi_injected) {
> -		exit_int_info = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI;
> +		exit_int_info = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI | NMI_VECTOR;
>  
>  	} else if (vcpu->arch.interrupt.injected) {
>  		nr = vcpu->arch.interrupt.nr;
> 
> base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
> -- 
> 2.56.0.307.g5fe7bd680c-goog
> 
