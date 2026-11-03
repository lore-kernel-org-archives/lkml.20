Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729308;
	b=smA5uxcc7WlJToLc1HrHHZyllBlFH2odO7cOOQb6l0f6jha5mYGM9oubKOLKjD90SAKp
	 ZDRoilaEXWMBzTusYJM3cmpcGC5Xem7bHBYC2QJnlPmjX37xGGU6coEZxdmibIHmDhqgi
	 RsJiW82OVtIzhS72DS1GLz1Ta9V1Wfp5DZS985jNRK3HO5sk+rt1OEzctOtW/EJ2RRl6M
	 eE6iOBchzWss5Pi6XheOZdsqaoHQ/G63iBE06jCw8rREgCK6QHZ5H5MxHus5AhtQqxk+N
	 4lg/NWxAZvSH87koOV1w8ZL+o20AYurpj4EOgEZXBz78e71wn1SIBYDyXADnk9WIqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=aIKiDgYd/jXgONymQ12SSZ5b8e5yxBJKR0/jjx24Mc0=;
	b=1swk8i3DfkyhWSm07+bNeXzWRe40na+zX5WZ4gvp7RfcQk3daVmlFPsoDoM8CEMuKxx2
	 0HG0WKe8tzMI3Z3NyY7TjOqi4+28VMJITW8Bqzqh6PcW0T7fo3QvF5mWyGm4LM/agvnNZ
	 cSU0ZPVOuhFMNM36mkkjWdJAHPVc9Wpe0Ug17cK4vW8ZAOLkF4eZ+s5FMH05BxpGxEqrg
	 8vHbwzmw6A0UNtvCSLrwzx/G3hjdK0EIHazYAwMIT4T80/o/Aw+jH2GwGOe6nF/l2xrGY
	 qJznAN0kNj9BS89dIBY8tB1qShmX6BwfIEieue+cQLdVbEW3K/5coIdnxppwD15QgyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjM0am6+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623E606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B623E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjM0am6+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a17a332ecso6751620eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729307; x=1794334107; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIKiDgYd/jXgONymQ12SSZ5b8e5yxBJKR0/jjx24Mc0=;
        b=pjM0am6+Rgo2yftlp1GqexQpoRm3ayyV/7AWG7PKMkJQsjd0PErZQhxXQs8yZ3P2d2
         F1LWKPTElCoMg80tzCyajDHBoIWj2AQkTCcyJYnUlH86v+UcMcNf16aie6lFnMqLck4r
         ISoVW7lI99boYuR9+B2t2FVY3vFtWHb4tBMi5+HvUznELrAetM/zlvxol9iIGYuuypw+
         ks1JGzr/mVGXvfIouELVug9utfJaibpL6i+BkTYBTVi92Ps58z6e3ujbzFZslHVUyKTD
         +z6bxcR6JbaDl3e6mipTVr080MF4zDSGdLS6yvZY+n5wX3ELSPeu5Np4nSvBDiOVHtZ6
         jYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729307; x=1794334107;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIKiDgYd/jXgONymQ12SSZ5b8e5yxBJKR0/jjx24Mc0=;
        b=UMfisbs5NQNm8dwxnlV/gmGwKaVvoGEal2h8T9abMSo6/AlOEcHvbj/mD/pJfMPm2B
         fvVWkgOtXQvjm55csZYhRYhAQOFUugRdrHUUzUcmeuqRqq68rzy1mu2g6otM8C+VkZfW
         y9v+bhgL5OcNqkMHhD9OHX99Rj1YRB+Yltl9XxkUYx7tW3LgGQQkMpdEytquoI5NWpFy
         NdJNaqBR31gl7p/flA/nxjvgxVbVbPJXtWOH241HCBEbzwgBfFnijxUTTKAgf+vhFKqm
         /9LTeIPusY178qSr2dpPracWVRZRqlnWs/BxyLfPi3VMDaJAaeZZKnQzdqPzH8En46Lk
         RMUg==
X-Forwarded-Encrypted: i=1; AKwUvBwmyEJ7ce0JLAgYqXn4qis92LKgb7fOhhiWAW+/nzcw0kuX6NJl7svVH0Wi1MFT0jk4A0NndWuRSeZI0Kk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/202a/mTCeNe2iBxd9ZfA4K1tbM+XTTOoC8Cg1wYv8X/xnEGNK
	16BGjIxSVPrb6uxX/Efxn3tcuBoVFHRMuzj5q1UkLxF7TvOvJikYAwIO
X-Gm-Gg: AYBFou0AVUr4v4+FkQhnhn0gNbPaAuf5x0JMkjDmOXDHf+hSnow8Hq85gwXHsYPR/lT
	lUeV2OPNIZ7s1fFjNCfreyg+FRYTKeuJX2kE7cnGuf99vroEVlAPjf5Gv4CE4MtdX7tcWzuZwo/
	PyfofRWsr/oxNOd9BQR0vTo6dqYEboSStI0ATlomgZI8mbuMRLUt1tSKx+INOleVYsTnoqgZgH4
	dmSMjkVwErT8gTzdZkEkvyhSO9HtWbYqqx56bhWij8/4nGM8T8k75sGTKevdhUmwPcne2sJm/xY
	8yHZEov44fY2v2rCjBsc0eAvkpDD6bZ/FYIm73wTg+l+Zql5Ejz519hEwGbHZZwrvv56kjr3w1I
	6jgSMFv7/Xo4RwPxFwI8/VzF2XP/PQydNPD+KiTc+5ZtNyAdR1R+QMTPgCzpi2eJFb+ezOAPyOk
	fwwMX/pbe08hUi7BlROHPSSeMTmNmDwmJjTVZ7ACQh+hshWPFqx3rM61ObBbXRYHCvp6m5D5vti
	jfeQtQLH7JN8Gfy7X/SalqljMyOq9SkjKNDWlT19PPLkVWbfvA2P9xEQTUuVjCQE6e2pzD7Gm5O
	EOlVinGkcDXU0080JBIEjdDh22lsYTv7sFJUOxxe2BCK0zy9
X-Received: by 2002:a05:693c:87c6:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-36a42404ab3mr21838555eec.20.1793729306698;
        Tue, 03 Nov 2026 10:08:26 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a96172sm44904557eec.27.2026.11.03.10.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:08:25 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH v4 03/23] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
In-Reply-To: <20261030212112.2598640-4-seanjc@google.com>
Date: Tue, 03 Nov 2026 22:51:44 +0530
Message-ID: <tslx6dav.ritesh.list@gmail.com>
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-4-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Sean Christopherson <seanjc@google.com> writes:

> Flush/zap every memslot in kvm_arch_flush_shadow_all(), i.e. when the
> owning userspace process is exiting, as KVM must ensure all associated
> memory is unmapped from the guest.
>

That's true and yes, this looks like a miss. I guess it must have gone
unnoticed because after the owning process exits, and when the vmfd is
closed it will issue a teardown. So the escape is only until the vmfd is
closed...
  kvm_arch_destroy_vm() -> kvmppc_free_radix()

The change looks good to me. I have only tested this on my qemu+dev
setup for now. But will give it a try on real hardware as well.

Thanks for taking care of this. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          | 11 +++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 708a32f89776..50a42f80e5f1 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -910,7 +910,6 @@ struct kvm_vcpu_arch {
>  #define __KVM_HAVE_CREATE_DEVICE
>  
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> -static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9194cf492d1c..9e9d0865c2f6 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -764,6 +764,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  	kvmppc_core_commit_memory_region(kvm, old, new, change);
>  }
>  
> +void kvm_arch_flush_shadow_all(struct kvm *kvm)
> +{
> +	struct kvm_memory_slot *slot;
> +	struct kvm_memslots *slots;
> +	int bkt;
> +
> +	slots = kvm_memslots(kvm);
> +	kvm_for_each_memslot(slot, bkt, slots)
> +		kvmppc_core_flush_memslot(kvm, slot);
> +}
> +
>  void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>  				   struct kvm_memory_slot *slot)
>  {
> -- 
> 2.56.0.385.gac671c819a-goog
