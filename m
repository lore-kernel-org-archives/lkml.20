Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577677;
	b=NIDw/YMCWDtH4pyWwtg5FmjZYQTT4XSgybheSI07pKZvFhiabIh1QY56ELryxbk46eXV
	 7azEtsffIQ4Vx4Rrf8vB/umUklcJdicyl3glmQb79z8guErkKGmrl30d5rSeBeCQMPOOU
	 kFPxFoznLwljLo/FbZk3T8P6lKoLTd8OKwTWTuYPWCLZnA2IyCQBq2piK48pM7x5ZeswS
	 +lxOCa0i4FeQMwLbHAVBVc1v1mwr7sDeI62W0qiQ1cf0FFgMO5GomJAN4u1d1BY8wCKBW
	 lZwCkrhsh5WPgVVR9/jsylOfwdJ/PwXvaO5S9DKe39Na5IYzjcpFYHBZoQSYCfBQrQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1Ihy3Y1Ag1S58REu5bFFliNMMA5gpdpH88jS//LlU0Y=;
	b=l387s/7792M1niJSQcsQfowq52iR1N3/QqhIrJ2eKLjAS6ldhx+46j/PVcHezgeWoD49
	 ne0UrN1GEz9jjzpG0wFfq3Pxv4OFLEIE+Hih/QNlkhDDAPRZRrqxc2Q5dbpZ8+OHGWeOV
	 AnZsPSFDhJ7Xg8hsvlNoYw1iCPhUZ+/rUk0/4c0fNMFiQxwLMP5tnX+speP7SS0+8gVa9
	 gqDZUFCf9pzCsN2A5wyKxu8v1UXHm/q+cMuqAgwIPrAUL1VMUraO+XDx3d+WgV9vVaur2
	 ReTXqLwQuwkudXFmlJRHYB/ttu9hAHhGdkXbueyZLhWlh9SNMpUJ5zoc29SHuo9kJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nlH4frd3;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274A606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2274A606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nlH4frd3
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so777344b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577676; x=1795182476; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ihy3Y1Ag1S58REu5bFFliNMMA5gpdpH88jS//LlU0Y=;
        b=nlH4frd3TTtnkbdVSpsJYoYh4xiO2G6UQUf28gVd2ucy/fohX0hMVc9fcEW5vMtdQG
         qebkDBZPgwmYpjRrFbarrcs+OOplG8JCnk7IedpTsnflY4oXt1DuUg94FR8eaxXSgtNL
         bLfAZODSPEDJtUJq/lC1m0v4b+eW7ccFEixMT9/4gLztJaSfM5++RbksfGK34lq2/rxj
         RpIdNivi77bePNbNPr8YIs+6O/UngEgIRwqyKuH+aXtlgkHQm4JQ8yuuPIAsavZf5LxQ
         ygmR0zZ5XPr6etnbjnbz8n0va2SX8ew+4eKqe/ypVz+U7IQ0qX8CnMbNf80uvwCRksqR
         Xvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577676; x=1795182476;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ihy3Y1Ag1S58REu5bFFliNMMA5gpdpH88jS//LlU0Y=;
        b=ggGF/p5s7hjp9GNNGeo/2PwQoquL+YcQOoXVszQnFAn8zD+uAByq6TDX/A6XguNKzY
         X/ThS9BdKeWLaoLfpSoAKvbUr+w65UNFmfZyzmtgEkLWkkVElUEptpZZFehABhnNiVpS
         CnZ2MGXmMcs3sQPjLxKSOYlcloujbyIWXJ+sYSWhFJfJ9LO65xb5EHEEqd0oFLxYq127
         wYFeJDXrs9u9XCf7ytOBsBH57rs8c5HRLq7DVA3iUZxHN2zT5F+wqqyCKokvz4Zk66XX
         FU9JEEySsITjuiO+JhyYetRmLVJmqeKHpH58O4Er7ti9mW4ccfa0Mr9BehsRoWqpe1ix
         JEZQ==
X-Forwarded-Encrypted: i=1; AL+hErEy20Op1KbLMuvQrC6KxskQ8j7uRW6tJqDEnHCWKpLMqlSCtquTqsAdJjLbuW40/TU03P5uKuMxVde36yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XQCKbFQLFeJrFNcPOXj+Jl7VZD8xtukHgB0AO/zkOjkJPbcdc
	qIkcUVWrMf9Rt2whNgTBqpVY3W/9iz4PaPyujWzc9alX77byOTifc2OskIvqA228OYSCRcbXY2v
	qtF5AQw==
X-Received: from pgbda11.prod.google.com ([2002:a05:6a02:238b:b0:cd6:1a09:f41d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e212:b0:3e1:c6e6:d101
 with SMTP id adf61e73a8af0-3f7a76c2160mr2595125637.29.1794577676197; Fri, 13
 Nov 2026 05:47:56 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:18 -0800
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441821375.80587.11807540842100479305.b4-ty@b4>
Subject: Re: [PATCH 0/7] KVM: Ensure WAIT requests actually wait
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 28 Oct 2026 12:02:52 -0700, Sean Christopherson wrote:
> Fix a bug in where kvm_make_request_and_kick() won't actually wait if the
> kick races without another non-waiting kick.  The issue is that all of the
> conditional kvm_arch_vcpu_should_kick() implementations are missing this code:
> 
> 	if (req & KVM_REQUEST_WAIT)
> 		return mode != OUTSIDE_GUEST_MODE;
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
      https://github.com/kvm-x86/linux/commit/20cf5e54a1bc
[2/7] KVM: Add a @force param to __kvm_vcpu_kick() for PPC backwards compatibility
      https://github.com/kvm-x86/linux/commit/0ee75a9dee9c
[3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
      https://github.com/kvm-x86/linux/commit/2530231b023e
[4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use standard implementation
      https://github.com/kvm-x86/linux/commit/a8dabc687ddb
[5/7] KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_should_kick()
      https://github.com/kvm-x86/linux/commit/7e52636d9c37
[6/7] KVM: Plumb the full request into __kvm_vcpu_kick()
      https://github.com/kvm-x86/linux/commit/5c430e211f4d
[7/7] KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
      https://github.com/kvm-x86/linux/commit/fd3dd4d9c186

--
https://github.com/kvm-x86/linux/tree/next
