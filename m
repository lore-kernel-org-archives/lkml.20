Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794876536;
	b=e5V4w1+YvHzDCOxVZpdTqn/PM1jDWYjVRFJZm3b2cEGMjqT0/vYVJPWBTBDN3nnbtxvl
	 WqV73XCi9QhpWeBdh/5beo5QryvzgnNUSsKE5UxF/DyCVtNVS4/ZSR0P2iBcIoDwuMk+m
	 qdXhSk8QX7vZWJjesvcNjr8A0yypHmulXGLl2b/dzFDNg1wZ3LghXxZVmUbZ+porPuoBl
	 gNxeHf9gLiKibStqo1eB/DAOihdmGh53CGnTugvNHqBbLXrNUCptqzKfN2T8VZNoo3RFB
	 wsosDX6wlezy3fex8A83xyLOQTxkO6Xy4RWur8bbe2rad2DfBUrT5DsbQCktqWeBJUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rzJlq1cSSvpPNomsaRs/y8mYSY2mPGAAaxTHlWFvxNs=;
	b=1rFgOwV0X6erKAysxfiRPum9KSOzZwAPe6HYogDJUTyyaZNe/vToNWQpJyXnW8grCgsv
	 368Q56BgBKbaG8RqrOsnTT8v0TjNjKh/yrYs/oQM+vtS9yMg6ovB85qcOa3zNZnzWBtV9
	 Moy5FPUo3NakXend/zPJHfwhbMr3yQ98vFfqzUBRRfq8q0iaeX+/mAN+n7WAGyq7wLgd1
	 pPzciL2xkUUbzQjV0BFWR9PYN/e7Bt3AxSe4TGmi/a7xCOxYqZ5hueE9Lxxpx+g6t3wC0
	 APPiRoIkoZSH8Xhzqdczj/TN1eKUhWksF+F7g/Cr8bnRWM1a+VcvymVQ2CI+X/kOKdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpQK+XTk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187AD606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpQK+XTk
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so2150a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794876534; cv=none;
        d=google.com; s=arc-20260327;
        b=BHUbstWXbFAX2QolEs5pK7R+bTOHhWGGGtTJfLtuyBXInHFI7tSVHK9GHYq6+GtD+v
         xcGNStU8jKfghKYz9Oi5ptxUOMb8a6tW2/iOoWc0grtYc1O+NrKhf8HaP0GoRUdlVwgz
         ywPDeKJvP1b3uvXvr13LRqe517TZOjyI7MB8tOOEJIzBHzzzfuBQNzLg98vrudN1wspX
         yDAbqfGrAl1zj3NRQ7o/68hGA3zsGfLn/fHkSfDJC0bp54eqfxZcjpDtSWKw12jtoek0
         FQZp6dsPW6AbRObMrhgjTL6vofQn6EQS2aFsc44e77TvoxFriMwgXY92dcXCjyENbBEE
         Wtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rzJlq1cSSvpPNomsaRs/y8mYSY2mPGAAaxTHlWFvxNs=;
        fh=lfF3omdu5sK4+ijFigsGBnS8gSI4Lam8tg/EDtyzHVI=;
        b=IP1ewSVNjWoYJ3NDljvnhpcyYNI2QdFEZjObwSLGilDlD9X9awpT61tSS5ZHvx4xSI
         OAV/1EVK+tfbX6PQTM94u7cyZJlWRIYAyBr89BW92kNUgNCqWgp8BbxjH0HvxuwPmv02
         CVY96Z6qONduT3Msfk7UX/BucBafja/NAF4EIOKJT1PfYewSZav31ZoPtWUJTwUmtw6n
         Zs+FLG+XLoUFMCU6nwN4K+13f0DccCPrw5wvmKasilcyrXrW4HIhpGmPrsr3xHzyf+6P
         xtWF3f7p5DCPkbP1OvAZjbSWWYWcmaRLXecKQpI0hLboMTlpbjs+ulinbn5vxY7JBbhp
         li6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794876534; x=1795481334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rzJlq1cSSvpPNomsaRs/y8mYSY2mPGAAaxTHlWFvxNs=;
        b=LpQK+XTkznPKynwMpLTifIIBrRSA/MRdl9ZsjlqfqPI49rrh8KnsKwANgEipMPLUvr
         2LLOabuHTRTecPVfrV1mx2iFfT5BvJ0IuQqaYqNxXxusko+4H7shWfhAZcFlvyJXkeHs
         U28A1wz9FTmfvUX7iSdScs6Ce4N2fSs2wHumUSypOevxj/Sz45sPbGmbBJyX3gGYd2NR
         BQ4FDM7KuNZL3oo1NKspKKFSpRRRVAtp5YWaYlXeIRXZvZaQl0XVYfsIIXnfPrVXhMIh
         9o82A5pck6wwM7byI1EVevD+0o08G9HAncbAknCc7XootGlX/HguJ1/cLZWhXOOM1KLw
         qXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876534; x=1795481334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzJlq1cSSvpPNomsaRs/y8mYSY2mPGAAaxTHlWFvxNs=;
        b=wgf7DphZHyLXbNNZAGXACCslNTAwjvLCvhrR9ybnOEPzyOOh6lNQzJ0iki3351DUN6
         DkGaASD6L2nZPmMKK5UG++tSIfo37vTiEkXhiyySIBJInT7wkxdZsZyFMtILviRJPMG5
         IUJ5PYrLAk5K09Tryoa7DohsgSAYoIYLXyHbp8VXCKyUFUW3Efp9J0jWMQ6tIep1WYgP
         rAeF23Xzx7yup6QsA5UA0e/pVJkhj3uN4y3lLjp5/i41HMV8Fsxg5pSYt/puQIbHl7ei
         YVYsXSOKUbpiZzCQJqkHaTJifAtyA3iRBAsbmZ54V4g8xZgIMEcuFEwsts6auz5OEhNZ
         spSQ==
X-Forwarded-Encrypted: i=1; AL+hErG0HXkwV8aCB2AszHrNn32BHsg/hchK6XKvrEbpKTq8xaoVdoRSjquDOU7eEyX1xXaLHjDR7FEDTrpsUzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gnmSOxgVUcc8Fs75Q7N2fUhDpky8TTco6jlEu8UFcc5l5hf69
	Amx29IHFoLVAWIP6caXec0ZIceRRJw97U9hKjUwrOJKGp8NxjsPr6LO5iDaaZWSWRQcYtuRnoqc
	0b0xs0IsRe8z5lw3b18h/176XwFDemrCWb8gEAdZWGh5wwU19wuU+BqE+qfU=
X-Gm-Gg: AYBFou1ToIqbNzl3ygtMDvtrD5cE7dta89OGeVSswk5qk73ok1AXIeCHxi5xZFpPioM
	C0SyvTKGs7n0EQqQAbcmkQZK9tMzmcjrLRgSQRUJ8LVk28R914Jcjsa/FnPfBEkrfcMXioJedRD
	lSMLVVvy9xqyh5fKS8Zx4TyvtU+CgCsVd8OaBcg0FbBB98HyQ4EtvEy3CODdki0eKhMC5gBAvw0
	5aJHDgmtPrJir9OwjSxAjn85Lcjcc215ST1maSNQX8kZ5poColRv9Fmjf8Hoo+k4/HQaLdAVO/B
	wPFBWZGuCD8Xs4wPGQ4O9z/wJH74XFQuiVcYd9tryTnBvycr2pPHSVLy8RaHFSryvd7EWHq+w+r
	T5k0ovzuiOZmPX0jeIdb2erNhFq9mWVtzAki315IAjIIXt/lvgTfu0GJng5zV+uxBfpqFu0+sk8
	Gawh3xrB4Uk32kM6LpXQ==
X-Received: by 2002:a05:6402:c51b:10b0:6b7:91a7:a637 with SMTP id
 4fb4d7f45d1cf-6b85b54dacbmr32211a12.6.1794876534067; Mon, 16 Nov 2026
 16:48:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116223033.3866283-1-ma.mandourr@gmail.com> <20261116223033.3866283-2-ma.mandourr@gmail.com>
In-Reply-To: <20261116223033.3866283-2-ma.mandourr@gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 16 Nov 2026 16:48:42 -0800
X-Gm-Features: AclHuK8u4qyvtWd_l0Y2lGLA_aG_TmvQh08Mtzu-tbiyDdt1Gk86PTeZCcQDyUo
Message-ID: <CALMp9eTsfGjGX6rmYYv2F8sth-WS7LPTe7UQ7aMZfFi87e=eLg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] KVM: nVMX: Fill VM-Exit instruction length before
 saving pending event
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:30=E2=80=AFPM Mahmoud Abumandour
<ma.mandourr@gmail.com> wrote:
>
> Fill vmcs12's VM-Exit instruction length before calling
> vmcs12_save_pending_event(), so that the length it saves for a software
> exception isn't overwritten.  Commit c3634d25fbee ("KVM: nVMX: Leave most
> VM-Exit info fields unmodified on failed VM-Entry") moved the assignment
> after the call.
>
> L1 sees no difference since both lengths are read from vmcs02's VM-Exit
> instruction length.
>
> Link: https://lore.kernel.org/all/sashiko-outbox-179791@kernel.org

Sashiko is wrong. Neither of the scenarios it cited in v1 holds:

  1. After vmx_cancel_injection(): if nested_run_pending is set,
     vmx_check_nested_events() blocks all nested VM-Exits (and
     __nested_vmx_vmexit() warns if called with nested_run_pending set).
     Once vmcs02 actually runs and exits, hardware copies
     VM_ENTRY_INSTRUCTION_LEN into VM_EXIT_INSTRUCTION_LEN if a VM-Exit
     occurs during delivery of an injected soft event (SDM vol. 3,
     section 30.2.5). If nested_run_pending is clear,
     VM_ENTRY_INSTRUCTION_LEN came from event_exit_inst_len, which
     already came from vmcs02's VM_EXIT_INSTRUCTION_LEN.

  2. After KVM_SET_NESTED_STATE + KVM_SET_VCPU_EVENTS:
     kvm_vcpu_ioctl_x86_set_vcpu_events() never updates
     vcpu->arch.event_exit_inst_len (struct kvm_vcpu_events has no
     instruction length field), so on a reused vCPU event_exit_inst_len
     is just stale junk.

Moreover, L1 *can* see a difference, and this patch introduces a subtle
regression for SGX enclave-mode #BP. Per the SDM, volume 3, sections
30.2.1, 30.2.4, and 30.2.5:

  - A #BP that occurs in enclave mode is reported as a hardware
    exception (INTR_TYPE_HARD_EXCEPTION).
  - A VM-Exit due to an exception encountered during delivery of an
    enclave-mode exception still sets bit 27 (enclave mode) of the exit
    reason.
  - "If the VM exit occurred in enclave mode, this field [VM-exit
    instruction length] is cleared (none of the previous items apply)."

In __vmx_complete_interrupts(), INTR_TYPE_HARD_EXCEPTION does not update
vcpu->arch.event_exit_inst_len, so it retains whatever stale length was
saved on an earlier soft event. Because vmcs12_save_pending_event()
checks kvm_exception_is_soft(nr) unconditionally, it misclassifies an
enclave-mode #BP as a software exception (a pre-existing bug, outside
the scope of this series). Before this patch, prepare_vmcs12() at least
overwrote vmcs12->vm_exit_instruction_len with exit_insn_len (0). With
this patch, vmcs12_save_pending_event() clobbers 0 with stale
vcpu->arch.event_exit_inst_len.

AFAICT, there is no valid path to prepare_vmcs12() where
vcpu->arch.event_exit_inst_len is better than exit_insn_len. Can't we
just drop this patch and delete both vcpu->arch.event_exit_inst_len
assignments in vmcs12_save_pending_event() in patch 2, letting
prepare_vmcs12() be the sole writer of vmcs12->vm_exit_instruction_len?
