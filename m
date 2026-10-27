Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115639;
	b=GfK9FXgGZ0C6yyNMxn/iuoq/Wf2CvdYka/kqRRjxGYME8NRYvFdepb5UHxhLXlb8dL/z
	 6wl2WubRVNOv5jXy0vTQbSntlQgW3Gu16B32ZWOVlLTpQMfzvkcVbTsIatNhZRE2VAy6Q
	 DIus39Rg1VlwsTWqKRvjE6tkp6xeWVRl7UgeQG+TpJocO3OZP9tMrY80ofVPm9bY+SK+9
	 MaSROts7LWV25YLgQR/KiuYbfHwjNyz9BifwU4ErfTzAvU5b2ULE8/FaxLr3eziwLUhR9
	 uPXSBZv5xNy/nAWxiVCx6t6b3buuWsn5TXU1HzzD3/XMLmUcOv9TvXGXOgBMxOhvd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Rzv8cGeE/wM7v8LuoWUkxvrQoAjGH2UpdmDR/eYfsXM=;
	b=fgsJm5Dc+LXs5myVuneWAqg5flD3aoWfKkVfBJfhy0C9tdYTYeNutoj3xzgp8DTHEryq
	 XDQAomK2dEElKmbCKMNbomMNoZWKe7Q/TVCTdicu5vX0OpVFvZNKh7PfuNsLoDwmzFsoj
	 gfMIeTCl0OTj5KeVPtrtAn9kTPDcxP0Iyi2zykS21FH6Kkz3jVfYxK5SzvUWWCMzPj8pc
	 HxPhmyuANE5ifMpZDiUW9SiHvuTiSaNUhXSvHJlDhl7DP+qcyjZHexi15mvpK4U0rCXz1
	 SK1CsfO1e9pohk+/mU7xucQOWoOp3hxKS7VaUmU9pDB2WVULATwZqKjpTdHoe3tR0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cKwLhlDN;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB34A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cKwLhlDN
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so37207b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793115638; x=1793720438; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rzv8cGeE/wM7v8LuoWUkxvrQoAjGH2UpdmDR/eYfsXM=;
        b=cKwLhlDNkeAY7Ej+b9XEKC6rPt438lefguh10XMYqUy9FSvAmz4TM1o3XOSvkPMMMy
         f4sCyjL2epEc+cfxE+IwWhzK54n+iUHCn4lCQgf3rZB+qh2kXU/66VeeyRlmA+DMArpD
         jjaxkuPwXdVuKmVxal4nedARC68jCzR2YFaWSKUoyuBpNyGb3WQiJ1TLeh4J12T2JVgf
         IbCpLalnf8pZg2VH4vdAd295Ct3P5q2LmMIHatX77dAzLXu5c85M/LSF1IWfKTY2LstL
         rxU0tAN0xRGuFPuISo9vZCg/rgwIoBe05oxA4mngf11l8EGrX9c7EOzjh6gZCflR1pp4
         IfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115638; x=1793720438;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rzv8cGeE/wM7v8LuoWUkxvrQoAjGH2UpdmDR/eYfsXM=;
        b=vOtzNbp2C90RMFkE0stYwfaD7veZyUq8ENs/l1zgrL+Qk7Q52GngzIfLvNOGsi/vDn
         at4bMWaX/1WpsVSaeigzpN/BKVGUvMH8ilwUv8ctzxKqSOlaBLDxFiqhOURgRmIuTvqb
         4jWS3MwvJyDSXXj1kzXqgqCUNjLB7L/VjVBNTNy/oUM1bNLe4G1kNIgPaiG7qfRkXnSr
         yI+q0hJalC4ab+jSXT+GuZ/xX/hnBxpZamtwWJnLXAwA38mHf0qv0KGeQbeCr6bi/LWm
         1ac9O96BuVvEf43yH+aX7xL41Rpto4bsJHJA4w+jpFxSPZxwHU77jbA5NvrO8tglkZRb
         s1Hw==
X-Forwarded-Encrypted: i=1; AKwUvBydd5eN0jfM711KWg4qUYNeuPSd+usGWsyi1CDMkxzJ4Jn3mwqP2qNswnJHt+igSZWoH6yS49OKjVg1ibU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO1kPdaYAq6KNn8kr334ytJkRN+H4EvUfHE0ELCHZs4FRF4U53
	BathLFUuYRQfVadbb4LUVBoN4ko39Q8VqRC+29byZxfJAm+DGvKuGVGCYZJrsC+lG9HanlU5eTx
	hRO3qYA==
X-Received: from pfeu8-n1.prod.google.com ([2002:a05:6a00:c0c8:10b0:89d:eb22:7d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12cb:b0:882:8aea:fbc
 with SMTP id d2e1a72fcca58-8a367a385edmr8499488b3a.16.1793115637828; Tue, 27
 Oct 2026 08:40:37 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:37 -0700
In-Reply-To: <20261027051808.243000-1-partha.satapathy@oracle.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027051808.243000-1-partha.satapathy@oracle.com>
Message-ID: <auDF9WpqW8OCu_8w@google.com>
Subject: Re: [PATCH 1/2] KVM: x86: Select lowest vCPU ID for aliased xAPIC IDs
From: Sean Christopherson <seanjc@google.com>
To: Partha Sarathi Satapathy <partha.satapathy@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, Partha Sarathi Satapathy wrote:
> From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> 
> When KVM_X2APIC_API_USE_32BIT_IDS is enabled, KVM's x2APIC hotplug
> quirk allows events to target a vCPU by its x2APIC ID while the vCPU
> is still in xAPIC mode.
> 
> In xAPIC mode, APIC IDs are truncated to eight bits. Consequently,
> vCPUs with distinct x2APIC IDs can share an effective physical APIC ID.
> KVM's x2APIC erratum specifies that an event targeting an aliased
> physical APIC ID is delivered only to the vCPU with the lowest vCPU ID.
> 
> However, the optimized physical APIC map does not guarantee lowest-ID
> selection. When rebuilding the map, KVM retains the first xAPIC-mode
> vCPU encountered for an aliased 8-bit xAPIC ID. Since vCPUs can be
> added in any order, that vCPU need not have the lowest vCPU ID.
> 
> For example, vCPU 19 has x2APIC ID 0x013 and vCPU 275 has x2APIC ID
> 0x113. Both expose xAPIC ID 0x13 while in xAPIC mode. If vCPU 275 is
> created before vCPU 19, the map retains:
> 
>   phys_map[0x13] = vCPU 275
> 
> An INIT/SIPI targeting physical destination 0x13 then starts vCPU 275
> instead of vCPU 19. vCPU 275 executes the secondary startup path for
> the firmware CPU entry with APIC ID 0x013. After vCPU 275 enables
> x2APIC, Linux observes APIC ID 0x113 and reports:
> 
>   Firmware: 13 APIC: 113
> 
> KVM hardcodes a vCPU's x2APIC ID to its vCPU ID. When populating an
> aliased legacy xAPIC entry, retain the vCPU with the lowest vCPU ID.
> This makes optimized-map selection independent of vCPU-add order.

I'm genuinely curious.  What VMM adds vCPUs in a "random" order?  I agree a fix
is needed, as KVM should be internally consistent (kvm_apic_match_physical_addr()
will always try to match the truncated ID).  But this also makes me wonder exactly
what userspace is doing, and why.

> The separate full-ID entry remains unaffected, and destination 0x113
> continues to select vCPU 275.
> 
> Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Signed-off-by: Partha Sarathi Satapathy <partha.satapathy@oracle.com>
> ---
>  arch/x86/kvm/lapic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 1597dd0b0cc6..5dedffddebec 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -245,7 +245,9 @@ static int kvm_recalculate_phys_map(struct kvm_apic_map *new,
>  		if (apic_x2apic_mode(apic) || x2apic_id > 0xff)
>  			new->phys_map[x2apic_id] = apic;
>  
> -		if (!apic_x2apic_mode(apic) && !new->phys_map[xapic_id])
> +		if (!apic_x2apic_mode(apic) &&
> +		    (!new->phys_map[xapic_id] ||
> +		     x2apic_id < new->phys_map[xapic_id]->vcpu->vcpu_id))

Hmm, I don't think KVM should always override a smaller ID.  It should be a moot
point, since xapic_id_mismatch will be set if "xapic_id != (u8)vcpu->vcpu_id",
i.e. if the incoming vCPU has a smaller vCPU ID and a true xAPIC ID collision
(not due to truncation).  But to match kvm_apic_match_physical_addr(), I think
it would be this?

		if (!apic_x2apic_mode(apic) &&
		    (!new->phys_map[xapic_id] ||
		     (u8)new->phys_map[xapic_id]->vcpu->vcpu_id == vcpu->vcpu_id))

>  			new->phys_map[xapic_id] = apic;
>  	} else {
>  		/*
> -- 
> 2.43.7
> 
> 
