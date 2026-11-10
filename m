Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325719;
	b=kI0fQNeLUfFCwVIDf5uElBNeOn3nX5g03MoMzz9U11JkORVEfqxB9itUbJX06XM/25/4
	 WdDJhQc5Q3kBtBC9HRpOzB678j8A/rucm0PXCJcPKbv8bU8a0BAokdM+iIcfvXXxI1mVU
	 /Od9aR3I2i9HcG3nLV5WnkHMf/z32WY1/N5K9uNbfUYKFE4etXk0v5sk6V3dejXae7CmH
	 z0d04pxOrThIemTyhgVwUpK29Xt+yL9jweADv89cIzv8wnrz1TEIKmLRtzkJOSbNscJlR
	 GYbCimsZy07p468JIRylgC5lMQ5AbL4CeeMnXZGYPgOgO3Ffw1n02kIe2Js1gjWhFcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
	b=m/uIRQo+N2EGS/puzVDB8r8NSOSgzDmz8imy1KXZu01U+d2g+pym+zNk3XORnQmxuTE7
	 0LeHiZ/DNc5OUjfXhFnBGHHscuDju6cSo/5+c1R2L9Q0K98hVX5xaxsBWxIBK5as5DKG4
	 +9GpEi3zFEDxhJVgeUwwlcpPNpbFuZgQRiwV24CjPWfFQs3+BA4aFfbP4CQryRkbsjFWu
	 vbR1cnXq/wOaS+PAHs9Pv1A44qAZR9h9Y4H8M2kAhCKKIX9FhOmBH0fknv/s1icbLbXdr
	 zbk7rl4AhC3fqCAlOKzrJI5fifyegyx8dQjuhtc/swr2RUjBhOrtM1CLDUuqZI2arKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VEDWmjx9;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1C60A2616
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C1C60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VEDWmjx9
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so19253395ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794325718; x=1794930518; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
        b=VEDWmjx9ptAoyITql445r9a4r7M3NFRes+rAAKiIqo0108JuRGXtjwrsrFF1aGwJub
         tjOjLHcpweM3cxaKwy+gYTKpimW8Sh3JwaVyg21n1qQQBvzxbeV+G/ZEwsCo8TQBLPTz
         MTFd3LK0X2LpE45of44khmYMQaaJncnHcCP8Y8tHETeL/lsBxUhom6olGpAdjhZX8t7P
         i4dv44F9rrNKjMYWvUvjkWBfrv1P1FY4EF0ZkSxmgiYBXfptCh4ieM1+fPMHWgWi/gSM
         pZK2hJZrQ/6N1x7B7zZ0KdR4+yWlo4sL6UlLigySUFU4DkEBcJW7YiBvPfvPPb0MmsMX
         I8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325718; x=1794930518;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
        b=2BXix1QGVcvCsX1OV6PcRFe2aQ4SMyVg4hys04xplK/OdCDeB1Db4qZB85rMFQgnE4
         B6+4/akg1Ohkhg6yo799+9tubzKWnb6cFdgHS7ZLkCBhjA+pc5V651KFrPlA7pIqzn+O
         4HJ6FjEMXhx7OMx2pgmyeQBZUcEsoMDYaGMICgfvdZeH/l3f+fBe4XOXu/gUx8TNriUO
         bSvIIZDwduk+HJmIgUuyQobF3As/2uPJloqNP2y06V6FuECIpbti92QH53q9DTSPLKv0
         TH/Y22cNaIcGoWlvciUiw8j2GdqOun0CGDSIcTS0iZyeOsmngvQj8o5SZ05bFphDLup9
         o0/g==
X-Forwarded-Encrypted: i=1; AL+hErEBP+SM3rO5o8oFMpJquHQsAYdgT4gtluzJL0NIeh6CI3hoSKLnDM0szsaYJ39G6DlHybm38+TDAUHsD8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9juhzcRsfcdqDN7kqUVc59eL2wvRXiUybHTVNwJZKjkoyNwH2m
	28G2KMLzcJqyPpbS4VX5aQA55kLwW92F7O3wqO0jPRk+5O8cjGblFkFKedXNJ4JLM2DxT29IxPU
	NSr4XFg==
X-Received: from plzu6.prod.google.com ([2002:a17:902:82c6:b0:2eb:809:b8ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d547:b0:2ed:218:6043
 with SMTP id d9443c01a7336-2edb93052e6mr23931165ad.59.1794325718280; Tue, 10
 Nov 2026 07:48:38 -0800 (PST)
Date: Tue, 10 Nov 2026 07:48:37 -0800
In-Reply-To: <20261110110724.3614412-2-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev> <20261110110724.3614412-2-fuad.tabba@linux.dev>
Message-ID: <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 10, 2026, Fuad Tabba wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cf4cb586f1407..da1b76ceb65e3 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4461,6 +4461,12 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  			break;
>  		}
>  
> +		/* Like KVM_RUN: only the iteration crossing the soft limit uses the reserve. */

Please don't include AI comments verbatim.

> +		if (vcpu->kvm->dirty_ring_size && kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {

Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
clobbering vcpu->run->exit_reason.

Side topic, kvm_dirty_ring_check_request() is rather confusing (clears and then
re-sets the requests).  AFAICT, it can be this instead:

	lockdep_assert_held(vcpu->mutex);

	/*
	 * The vCPU isn't runnable when the dirty ring becomes soft full.  Keep
	 * the requests set until the dirty pages are harvested and the dirty
	 * ring is reset by userspace.  Note, checking if the ring is soft-full
	 * can get a false positive, but not a false negative, because only the
	 * vCPU can add entries to the ring, and its mutex is held.
	 */
	if (kvm_test_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu) &&
	    kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
		vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
		trace_kvm_dirty_ring_exit(vcpu);
		return true;
	}

	kvm_clear_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu);
	return false;

> +			r = -ENOSPC;
> +			break;
> +		}
> +
>  		r = kvm_arch_vcpu_pre_fault_memory(vcpu, range);
>  		if (WARN_ON_ONCE(r == 0 || r == -EIO))
>  			break;
> -- 
> 2.47.3
> 
