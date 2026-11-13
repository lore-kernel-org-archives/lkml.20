Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577899;
	b=zIp53SRPo+D8zxe2HYK4ZmrPmKZUigtg619UOp1YcelHUnNm5o7InZUlsXIFelAdkna9
	 oW83cfERp/fPvQSe3pdIc/WpJUf9h4gm3XVcX9itN/44pKkLTCkqC5oHX4etD7g59KKMc
	 F+ArozQ+813AhASpaVUboXSmiJpEzaa3BsEfkrahkM8HPa4wjphzHI7VatDdiEBko2Mwf
	 F8xNIW+Kku2jmq7Gthix6oi9efJONRY1fOjUVUFpZfC/VDxs9hW8NT/narvy7vABPUvdp
	 wN2r5a8PTz7HukAoPgNp85blFMxoO3LoTt8ogY1btQfSYaMSw1ImHjS/C7HW5ZLjiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gRtvoiZhikzBDuUhHQrMkpxqO12wC7yZwkmH45ecaaQ=;
	b=I/XPone7d0zjP5JtXEbp/+Zffvymx1GfhLf17JJIHoSQOXJvRdCp+AApiwDMrTFfyYQA
	 OWqBkvAMDgB/08Qe1ateTmoiv6S5kIjh83iV96P0LpZhbUyw6kFRVAjzv22VIpsbe6Ws7
	 f6A3clzIELIEBIeq3Z7QtA6mSQBYC8MVGg+qVVTKdKFXZqPG0fYf6aW9Le+pcM924xxbO
	 ozgI4IavG9sWkyCyweBAku+KDqwFnVm8DlKVlOMjeuGXv6tkENK/LAGrpXQ9+Y9PpNHLE
	 5jrDn3VbAVJjs/xnCpzsk8xoA1ILnUuP+IRJ4s8NayCJIZU9cqWtEP+jpUYVrih63Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Xb/vAiJZ";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310A606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0310A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xb/vAiJZ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso14691625ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577898; x=1795182698; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRtvoiZhikzBDuUhHQrMkpxqO12wC7yZwkmH45ecaaQ=;
        b=Xb/vAiJZ9heFsnBM+FAN0sYPd4RAib8v7zbAg8hy6WkZ9ncobwidiJH+lsBWORz9iu
         qvLXVEmuWOHBU2SrMPrkWPgoINRwEDxN21BWiE75CUFAtlsijLOro6OfXlw2iSzF6LZm
         81STDraBJ/nAmWGOPN7kJUgJWHj+ilcxCAr0sMrpijYaW1bfmO1ft8cAxLehe2JVQDfu
         ZnAQGvJlGAXHiWMKr0C8cJ3mCdLxsGl+/rwbsAR6e4Ep0trW0y4eeB78vqC+2kO26HB7
         qZu66FNk9rXH/kENvWXlYS/Si1hc/JOB4QHxEMUe5TUsFuoMSWQ4RhSdYIez7srR4JRe
         v+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577898; x=1795182698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRtvoiZhikzBDuUhHQrMkpxqO12wC7yZwkmH45ecaaQ=;
        b=H6gCrVEiZQ/Zoe9vQ0JldlNm39ktscWEPgd4m0pbTVFmS2JTbFYL9L3ES2/SrbZJgB
         Ci5SK3cENT1hWwYDeEfUWTsqs3PdB1mbhNF3cIr8hPgn4v/1CAapft4AIllo/6FU/+d0
         wgLWlJjNRU+pp5OHPnYZne1vBqNvG3arlewdhSpJ1QBFQtn+5YyU0kzkvFz8sJh4OTda
         3f5dKamF17BTvemR3JQ13tFCSvNA0QtYllfs9zp8Zdk6yXPn8toNcbcZIs4Aj8KuyAJb
         +lYOwVK+LEwyLeOZE1gdjq/eZ873MN22jOnAipM0oFKCdZTKj/HGBmcCDcet0mk1BfAI
         2bDQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ35vFfA5FsfflqogK9u+4Xjcsy8YM9G/fKHMNw4rwCe2oGP1VCHUaz4K/yHkq9EaZpGqr7889Cg+Mqhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5mzhFYRsPG+FR5lmL0rts/1fxm4tiJoMvQJg2Zl4EUQ55xcmM
	dghzPLFSVCzJ90KOo1I9CQ99RdrSZdwjURoQRMbe32VTbmJR3z7fIHizwtVKWAYLCZWhVEmLBgK
	5stYm/A==
X-Received: from plpi12.prod.google.com ([2002:a17:903:3c6c:b0:2e4:9044:4638])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b87:b0:2e6:1c24:d5f2
 with SMTP id d9443c01a7336-2edf21c1da4mr41606505ad.36.1794577898080; Fri, 13
 Nov 2026 05:51:38 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:14 -0800
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
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441795195.77952.4217273325210388293.b4-ty@b4>
Subject: Re: [PATCH 1/2] KVM: nSVM: Set NMI_VECTOR in synthesized NMI exit_int_info
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 28 Oct 2026 06:26:52 -0700, Jim Mattson wrote:
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
> [...]

Applied to kvm-x86 svm, thanks!

[1/2] KVM: nSVM: Set NMI_VECTOR in synthesized NMI exit_int_info
      https://github.com/kvm-x86/linux/commit/894f03b50b7d
[2/2] KVM: SVM: Set NMI_VECTOR in event_inj in svm_inject_nmi()
      https://github.com/kvm-x86/linux/commit/f04911c243b4

--
https://github.com/kvm-x86/linux/tree/next
