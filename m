Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653553;
	b=Xb5rz7nBtRRUY3mp1sBWHnoEQPjW/Gni4VQQBDwMz0ZTj6T2gugxkK36dN00PeGrbzMW
	 deCS2g7rT7ffmdnvAfmbIko1mHJDOtlGaAOYjHCcaPH5JilPYhjwSdVwJ+8BNLyBPhjf5
	 ad6BuqTw+vqEc0OAehueZmOVC3Fk3707XyYLV068uRWZ+IpMIqxHhpNbfyUW883MHwb/v
	 LwGNtPLJWQLOdpOiHxXk1U38vmb4wDSc0a6T+1hBiHMLMVO8H3gJVQWI5RfqTrtW9i/S3
	 C1wnZjQJ+07EE1A1MvCkCcFY/uGvU8yNm+bFYcjNvLJ1p4HIlfTY1lz39ytgEoXXREA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653553;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=pCGbRXaaCKhpFnqdJpERzrBbBhy2ekz2jJLuNljluiE=;
	b=EhZfEd9dbqgIR/NnYnfkg2do6BrstRmMlfpW8+lRC2nDbxILIankc89/WpGycWJEzonM
	 mjkgwIx7+YdmLRdTjiKS8WQb0Ocr4TxAod0ikbLCpMW+C5ojlzf1Klr9XUf+WwaaoVyXt
	 KDG/Pd/Ia/0a1PtVJFpF2uGQpUHWjnPk+NmxGZ5txEzrk5/b7QrwvFyVzftDxVZkpYU1k
	 c8EiYDhXEABi8lgLHo3pehLZ9/0GHfl2ls90g8oGASHIvCNDZt8fZ5idTO4ovrUO9vGpQ
	 ravp/ig4l+ZQ8Lw9wysdCxruLNnF+jhbvuBWpgnmr5bBTckILN2Tg4pMDFV1RwILqfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVWj9cFr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uFS4iDHj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00952606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00952606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVWj9cFr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uFS4iDHj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792653552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCGbRXaaCKhpFnqdJpERzrBbBhy2ekz2jJLuNljluiE=;
	b=IVWj9cFrg5LuPxhNgK7dSxj5+8jxNhsldxlljQCciWlyrxxEaFDsZSQU5/Yhx3eNngRLXd
	+7rO2RB9z43dec46uAH56BfEUWlnrhhUXfBqdQI0JlRsMJBX/PxqiRrv+RZQNw/YPSTWZi
	DLsmXgSGPoHYNEKxjRAhLuVC/vkPOQI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-64eQ5_KsP9y7ZxczsC4RPQ-1; Thu, 22 Oct 2026 07:19:04 +0000
X-MC-Unique: 64eQ5_KsP9y7ZxczsC4RPQ-1
X-Mimecast-MFC-AGG-ID: 64eQ5_KsP9y7ZxczsC4RPQ_1792653543
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e17d30a79so946734f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792653543; x=1793258343; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGbRXaaCKhpFnqdJpERzrBbBhy2ekz2jJLuNljluiE=;
        b=uFS4iDHjq1WCIYSq9HdPgVFdyoBQ7ZZkODpIaf95JSuJ8Jj/R8QIXO6/nwA3cu6mp9
         A8kG1aWAo4q5T70EXc/bEnYmMz5QMQ2vgYjdWH3pRsFjypddPg4bMnFI2NYHMRA3m3SV
         DXRxo9qrWwV3LQhlA5tHuvSMTfDjFOYisrYv+/Ws1V1EeUWmnOVPMIBBP3CG0N65mv+a
         1zhjsNT/+NO57NNjZCbWfaq2ISpILRacs8DnwSOPZw0Q2zjYe3ti9PfG+CdGDC1rSuY4
         EFipAZFCauDJIVQvxoEh4VCyiF+VNjGxplAUeu0H3WQQXx6UFQtWnkWIjhloR9zPyt0M
         j9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653543; x=1793258343;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pCGbRXaaCKhpFnqdJpERzrBbBhy2ekz2jJLuNljluiE=;
        b=hSk7Poq7c1EzENJ9CcOEpSJ7jqhMbW5aWVKq4wedQ/O3lok3Itn01MpCPLY5W3henL
         bdZVEj4JFa4az98W/fKNOeuyuIFINklOsYIVRJ9niYsz6gKYXEpxHCJeEucasLubaXPV
         yyvtYZtuDmuxAnDQ/i2z7HwPiA25+40/UnbAnjfYaKk7ATQC2EnILwMW3pTi3CyF4xIX
         X8ZkER3S4jZW+4juV1Jx1CROEbqAbhVwm12Ryyy49xq19dXjnfw0rzm5UCw7EvmqO/wQ
         2fFUpDOEcFKc0Beli5dq7+J8DC1J47NiFnmJmaylTRStuSORocmL2+VzdSsQ+FwWQiOL
         s+jw==
X-Forwarded-Encrypted: i=1; AKwUvByS8eFOjFZsZmdcurZUeVfbxnkYvB49QIlIxMMNKV8cm4k4iAqMzlZ9PBuiQHWNBC3/POOGA6qTz20iSY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOatVscBVwPjTAk7VAFL/R+cRU441Uu1yatmR5WtUqG2BKk1oB
	tLTEAANsliTNJKorZYx1bhPPtX7hy5VeAfVAqA5G9T8u/IuPZrOUdxh7S7sX1t3uG1a7HzEbco7
	Kp1I3BEjyApiL5R0qDjCcBn2GtRRDYHmoZlcxkYycbFfRMHPiYQfSWytUhHmmwrhgM4qP2lbTMg
	==
X-Gm-Gg: AYBFou1/1nk+ZQuq2NwsQ+38mWVru1O6wg4bUwhOkv3iknkEnKjP9GdTIgKoLoVn+/p
	daWqFq2ath+0MyYJVIfYNNgzoL3RbiKHEVSR0KCVvrj3+2Z7pabZg+n6Uc/t/L/lvOxmPpQYD35
	xHFumKEn+08TEU4RzkpHaz9495LQWZ9q0GM9b1qLH5stzi+TtduZXscQbiXXq0tIwqTdiQgAlDX
	zm5ARQlUXfJOKxGAkwBNEg9H3t1Hwx/Csu1+1RIddJ+9I3HGOyLj1HKMDyHM18NF2lta5ZAD1uo
	a9Kbge7/iSA/2jYn6wCDtt7ONq74CmYSbf7qJilHAlELuvIj+7uLmw0bBPFwz4+pN2wBYUMPRsu
	YrkVkDjFSuCQqfBnvk1vMlxEvH93fVs14AqhStK8SJw==
X-Received: by 2002:a05:6000:1843:b0:487:2777:6354 with SMTP id ffacd0b85a97d-48e2650d1b0mr9235340f8f.48.1792653542970;
        Thu, 22 Oct 2026 00:19:02 -0700 (PDT)
X-Received: by 2002:a05:6000:1843:b0:487:2777:6354 with SMTP id ffacd0b85a97d-48e2650d1b0mr9235300f8f.48.1792653542565;
        Thu, 22 Oct 2026 00:19:02 -0700 (PDT)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258420fasm11055933f8f.50.2026.10.22.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:19:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Amirmohammad Eftekhar
 <amirmohammad.eftekhar@cispa.de>
Subject: Re: [PATCH] KVM: x86/hyperv: Explicitly reject VP Assist Page reads
 if cache was clobbered
In-Reply-To: <20261022021227.295495-1-seanjc@google.com>
References: <20261022021227.295495-1-seanjc@google.com>
Date: Thu, 22 Oct 2026 09:19:01 +0200
Message-ID: <kuptsmerymy.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> Don't try to read the VP Assist Page if the shared PV EOI cache has been
> reconfigured via KVM's actual PV EOI MSR, as trying to read 624 bytes of
> info when the cache is setup for only 1 byte will trip the sanity check
> WARN in kvm_read_guest_offset_cached().  Ideally, KVM wouldn't use shared
> state to track the VP Assist Page, but in practice no sane guest enables
> both KVM's PV EOI and Hyper-V's Assist Page at different addresses, i.e.
> not allowing both to co-exist independently is "fine".
>
> Fixes: b63cf42fd1d8 ("kvm/x86: implement hv EOI assist")
> Cc: stable@vger.kernel.org
> Reported-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> Closes: https://lore.kernel.org/all/20261017093016.32348-7-amirmohammad.eftekhar@cispa.de
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

(I am, however, thinking it would be better in the long term to either
separate KVM PV / Hyper-V PV state here or even consider a 'big
hammer' and make these two (+Xen?) mutually exclusive for all PV
features.)

> ---
>  arch/x86/kvm/hyperv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 5d2e3617c952..c08eeaac8bb7 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -949,6 +949,15 @@ int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
>  	if (!hv_vcpu || !kvm_hv_assist_page_enabled(vcpu))
>  		return -EFAULT;
>  
> +	/*
> +	 * KVM reuses its own PV EOI feature to emulate Hyper-V's EOI Assist,
> +	 * and rather stupidly reuses the same MSR and cache storage.  Treat
> +	 * the assist page as inaccessible if the shared state is configured
> +	 * only for PV EOI's single byte of data.
> +	 */
> +	if (vcpu->arch.pv_eoi.data.len < sizeof(struct hv_vp_assist_page))
> +		return -EFAULT;
> +
>  	return kvm_read_guest_cached(vcpu->kvm, &vcpu->arch.pv_eoi.data,
>  				     &hv_vcpu->vp_assist_page, sizeof(struct hv_vp_assist_page));
>  }
>
> base-commit: 814607cd40df80d5727957adaa857e0feca43497

-- 
Vitaly

