Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577725;
	b=Yun7qCSWN1P/pEEcuqPANxFSPumqgJHhy3OCl3EiAkTei+RpcYzPXV/ECMwM8Ss0/6vh
	 xiQlMmmJNofDV6ugLdOrsAS+QaX0mWPCxZ5wUmV+WiIrxsISJo0MxRP9GlTwVTHOLnACq
	 1nFj0CjaZKvW4wekqVc3E/QhcrDr2KUkmFF0MHjn0E8xsvR7zII0gD+vzW9udVsja2HxH
	 jch8hR0b51zjKPvHl1uJa40Bmhifll7zeknjm9S1p4GK5IGBLFs4PN0EjGQNZy5+hfjVr
	 q9ZHDDZQeip2hZP70gUtV3Davez2VOrFtF0m0+jJctIvm3ElVMHdr5MRQLUByrj53aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AP0XwMHx6rTXkwguG+yt2WQaymwZ4K34wFaqNUKI46o=;
	b=tx9OeWqwnUl3gFDmwX17j7GatHKDYB6mHB4cOrwZnGJrWhPuLbBsR+BdxpDpKYCPjdj0
	 CPmQAl3LLfBG9DffZ4anom2WiNBJnuVhbf709QERYI6cj3JGgjQupNxN5H1i/YRp9fwy/
	 yqv2iFZJrwZ+MGiPIKYm9CPydvNsVtp3Bo3alzJYnCHDhGr/XzzArEqUBGmoWqnIKODou
	 RhxaTKNSznsAEU3f0R6R0XuXUe6AkLvfPsB363XxCYD7Sd8izWzluXJqqlakPEEjdYAjb
	 WGaBNvc1Ibj09xa0iuhiD5F3LuwF0sHEfV/nFl8h4IJGq7iF0A9z1laaDwlwpPDw1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TbePuknP;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17242606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17242606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TbePuknP
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed283cb5b9so11370675ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577724; x=1795182524; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP0XwMHx6rTXkwguG+yt2WQaymwZ4K34wFaqNUKI46o=;
        b=TbePuknPBXYHo+RZyb/1rCrfdAXXS6fpsm+ap+/pFdXQrYWrKDjOsBssrYbBLufTmg
         lY+BCIW//rftv7ucWnLXH+MfskNv7DTsgpCfyc78TiJHdaWwKJujZI8zt1SxpPhR10zx
         sKfIZK+8W1eQadSE6tD2pXNkfNomuxkniO+86Qd/pHeD9WQUWih387qiqZzRmsdj3rH0
         wIrfejzUlGyBGpACqoxDJ7lcYqUk2Nveiqg39x/xGE1X9Uuo1wR3Gw4U6u4A2IPNasre
         n5NO6A7AT3pcaXVNjYPaXc64OZUI9N2x821Raep6f8ZJ/hXt+/VDq2KLJgfMaiYO7zOu
         e5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577724; x=1795182524;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP0XwMHx6rTXkwguG+yt2WQaymwZ4K34wFaqNUKI46o=;
        b=eQf8Q/JmRY/VLGoZ/afjTIOo3Ae0BjeDf9295MttQEHcntfmjU5gHx3fIKzZI9pOnL
         GvgWYfr6qGACzjad+mKYUnY4xFg5oyRaeCaWBhU93FEjx55obo7e11sqkyhxi/lbI6s2
         +IKrvy3ejf3F+JDySyNIV/8C7KmpHG28df1qYSNNDkEf76krGVhwYM0Z5ZbadX4OXUuY
         w5CB0nR25LSftkIhvoC6G4dPkCD4Zs0Ug0fOhEPrDRSXOu/roqdpoUuLT1cTsDLeWE1V
         +hBcQDwApZuYMvPHhtFiJJxKg/eW7IYNyHbWMT2AyJjhssR1OrO8LJV1wihsr7aMkQcH
         FMxQ==
X-Forwarded-Encrypted: i=1; AL+hErG+Rr+9/jGLJdDZalqg9FJT7UUeVijpRa7Arj2te+nfBzdNU9NYnoALcx3PHZVx9yTPH5O+1HMT3tMQNww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ngwQa2dI/BzRpoZrB8ELWfHtnUOdT04dtIwRJT6PUHCjNANUS
	KgcsojHilRhWdM4NDDmdRxP6av4g7m5076oagBr0e58gSUoXfc3fZfKJhhW0UwKPSaHC8R1mn8d
	qX1Vj0g==
X-Received: from pjbcp15.prod.google.com ([2002:a17:90a:fb8f:b0:3b0:a4e8:cfb8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3912:b0:3b0:a7b5:c044
 with SMTP id 98e67ed59e1d1-3b1b087b35bmr1488456a91.1.1794577724117; Fri, 13
 Nov 2026 05:48:44 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:28 -0800
In-Reply-To: <tencent_6EE8901CBE1ED363CBBA2E8CEC6D88D19F09@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <tencent_6EE8901CBE1ED363CBBA2E8CEC6D88D19F09@qq.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441794610.77862.7904519184101802738.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: coalesced_mmio: reject zone sizes that don't fit
 in an int
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Hang Nan <2122295973@qq.com>
Cc: Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 28 Oct 2026 09:59:56 +0800, Hang Nan wrote:
> kvm_vm_ioctl_register_coalesced_mmio() validates @zone->pio but not
> @zone->size.  The u32 size is handed to kvm_io_bus_register_dev() as an
> "int len", so any size >= 0x80000000 silently becomes negative.
> 
> coalesced_mmio_in_range() bails out immediately for len < 0, so such a
> zone never matches its own range:
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: coalesced_mmio: reject zone sizes that don't fit in an int
      https://github.com/kvm-x86/linux/commit/9afe49408a4e

--
https://github.com/kvm-x86/linux/tree/next
