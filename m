Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558676;
	b=IA8CYC4TT2vFmP+VtAkqBFRKe2pfAs4hh0zOAXwOnUrg3LqWhBcu9cbpIfJw7i0qi2Hc
	 pcOEHP4MgrqwsOZhMCTN7GnCFM33q06tfzTD0cllYAyE012nk5mwe8H29WPoxXac7UJBE
	 IQvFTvu1xVpVHPPcH71T2PejnA9WTOQ7Yy+dC/UzyUgAe8KncejhePARFIWo/TL6nqJux
	 PbR1CS2+uQ68OKgDHbSgYuIz2HzhHTh/7/V7AC2YWidp83Zd3F40kMGZ3cp3v871lcVj0
	 6CjeI5t8feWNyn4pZeOx+fOLoY74lNELxAtRPM4enq8eKZBDfyw9mbCwfbqdy3ZnE3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=eDGFI2IEadNgqQFug4AHiz1l4wqWmmt7PhVcyHvgfsE=;
	b=ttCXpJkYRoWyogAf4ea6T2xVakLJUencFiLGePy7q8+Yp3wQgbGzHcuqwh9YnBEQCtDW
	 TIhUdA5tY7ODUTcUmgW2u2u9nQCKrcCzSY4ZG1+zgVuMfgCTXi7/yHJiiVHLw8CnGZfXo
	 zgvrpxejxa/dyPTFRNPA1ZhXJZHIEjAPBhDSzr1/M7PRHANlkg/72GPsW6tOQ0WOp5GXZ
	 U6FhIhKJIYFuZl9W1Gv7opv7BJbYm1tq49pahFvyHgWgL/DZKHn7+DdI1D+jJbRN44EMo
	 iBPasqpVgFSsIcEDn77kJwrVjBehSEOKMAXpgZZOr41HeVfKEdwNjXkfw+153hQCodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P4l7RccM;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B73606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P4l7RccM
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e80f7acc67so3378085ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792558675; x=1793163475; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDGFI2IEadNgqQFug4AHiz1l4wqWmmt7PhVcyHvgfsE=;
        b=P4l7RccME4xuw+URxsgqRIM4MwTgtghE0YWzOvhvx0JhVqUvDkoRiNALgws7YdXRnH
         PX3phQLsVxXGOgFDK3EGolcRAFNeDr1KOONBKHxTfCA5qrpVSO/klX+Z2s6z0rVoegWt
         uiz+plC9V4ZM9oKcgpAt2f1nvyZTuOZjAzDKtB1yvF2ELCGzZj4D7kaYbLLN27/fHHQ2
         WlucSHBlNClCwgKfEWoZqiiLUCLvL1vgDFskMl0jhxOic70crZhlEK5bYbGmJWKkMT9n
         vTXvFZOIQ/TSIuhblgMnVHQy7dFOYEpNBpkgkRO5d2+6t1S6756Oidi6+qzGInHka+e3
         mdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558675; x=1793163475;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDGFI2IEadNgqQFug4AHiz1l4wqWmmt7PhVcyHvgfsE=;
        b=Q1ikvsSYZzH9/ReQqe/z0DURsblF3R1FSPvDDqQGlyln93/VpMkX47QedbO4BKoBAc
         jS1UiyTXm25BrxLghMVbABDC9SJ2R+x5E8uWImMSbxpoyaSRgQWgQHNDjgxjoUgJIAsG
         5Np9i9n3wQIJonFvwqsMKes0qM4zo+uTkRTZzLyndBOsUPAwZYFHdSj5GYbyr/EfAxn+
         YYWXRbUarTgVzl3PCsDuvJgmoTneaIatFJcuFoYCYSvuRehVS9tnHYT53nwdlTcG3Z5M
         Qj7Hhd3VWc2Oe8NvvLSPVEm8dq/JslGTZlO0Jk7PJ9VkgdAjSY0hnZhJrjiQj7Jt/HTb
         TQ8w==
X-Gm-Message-State: AFq9FYKkJZ5SHGYggNutKA8+K+Uuu4R+ykTiMXYjhlBeZj2wICEGlMnx
	ZsIG7vxX0KTHk9Jqs7fj1N+1A8xO9CoahexDN7Flihch+rf1GOmItJb16pe6oVkCFNBEn5d+71O
	3HXkttQ==
X-Received: from pjbbd18.prod.google.com ([2002:a17:90b:b92:b0:3aa:ff61:94cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc2:b0:3ac:7378:be04
 with SMTP id 98e67ed59e1d1-3ad86a44fc6mr962610a91.0.1792558674143; Tue, 20
 Oct 2026 21:57:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 21:57:53 -0700
In-Reply-To: <20261020131447.122096-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020131447.122096-1-pbonzini@redhat.com>
Message-ID: <athGUdkDw6rSatUW@google.com>
Subject: Re: [PATCH 0/3] KVM: Kconfig fixes for the VM-wide private memory attribute
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Shivank Garg <shivankg@amd.com>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 20, 2026, Paolo Bonzini wrote:
> A late review of the guest_memfd attributes changes...
> 
> With Linux 7.4 the "private" memory attribute was moved from the VM
> to the individual guest_memfd file descriptor.  The old semantics are
> available for backwards compatibility via CONFIG_KVM_VM_MEMORY_ATTRIBUTES,
> and disabled by default.
> 
> This change has two problems: first, it ties support for VM memory
> attributes entirely to a backwards compatibility symbol for distros.
> Second, it is incompatible with all released versions of QEMU (and
> perhaps most other VMMs?), thus the default is arguably not the
> right one.

I was hoping we could go with a stick approach, but given how painful double-allocating
is, hopefully a carrot will work too. :-)
