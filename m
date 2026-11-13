Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577811;
	b=UeEI6uaL4I1Rcu3jj8ga1lsMpFm7613kT4pting2M3f0fRIJbtC0NQDuaPq1ltU527tT
	 pt1EHDyg/tfiABzWbOn8DkhUmMRPGB3C2U7bCcVZbusJ8560vS2FVVwk+mc62IwhgmVWA
	 7tHZTM4xHi4XW3ih6Jn2rMwMMV+KhiId99Gij1RsrR1AC4zOwtCWUNggjyBIr1siFTjf7
	 dFaUbqUFntM7dl12mX/Qv4HEYJ00fb4dVv7oYF0Ar72gGq1xy1BchqfcQUHir2EyPV7st
	 1/9L3egi9qs3a/9OvjWnUR2rfqGotYK95jd1iNHYMnUiy/udtuaVoxzjpMJHmm5V5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=1Ifrh9LQcFbOFvyLblUunEr5sv49cIT2DX1exlzTL4k=;
	b=syTsVD/xiI+tO6FozZzKsdUbNv+GxyPjNFpKC3lyWYdcB+tJ76+OKtIdgL4RDip2TstS
	 baSnFgwtUK9LA9Y+woNjKLE5Op5SqF5Wllb5xtlYxMSskBxwOnaqZrvcwrfjkxgxOW0t8
	 JsK+/qcKxUP2wRrWrCDF5U1p+xTkhsTlFMPncC2Gyph3Xub3Pl2hfXJzEFEIFFP87hdCd
	 R2X1j4T+lk06aUQDOdxoLxz7zwB8Og78M+u1Bz8QjHgaLPLUKnYi1xn2cUTmPSxh5Kg4/
	 os59yrVF2l0wRXTK4ixHsISAoXfLHiuNVZRSAzBqySDmYVzoAefqGtaSZLsFFS5/XGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="IPGFm/77";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941AC606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941AC606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IPGFm/77
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so630793a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577811; x=1795182611; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ifrh9LQcFbOFvyLblUunEr5sv49cIT2DX1exlzTL4k=;
        b=IPGFm/77r0uEK4qxXqvVYYz6Og1lMtmTjLcZtDomjktK/YmjMYljTo9TDwRlRTlyom
         TY+5rj/fAbW0EAfdur1RaFxZkUCdqcSlf+qBCC1oLgdJSWQb5ciENeAW7Kd9gjSBNLA3
         bItDO5dsKlIaYEUzfbaLqIemRTSziyDJm75vZUmcHD2Woa+I0Un/Uk5zmTFrpoyyJqL9
         unu9x3cIXG3+NyFEA0EbGRNSqjYdSEZALqQZ6deaTdjmIzb/0C5h28jDwXRLXxcbU/mx
         USovj54f2ryGR3fCct9sKR7lzlNDmKYN4sKOHO+j4UmCPIfiUl1awgjU6cdfJULWq7mK
         e47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577811; x=1795182611;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ifrh9LQcFbOFvyLblUunEr5sv49cIT2DX1exlzTL4k=;
        b=EQfSw13zh15HbiZo302F2L4ieWvdeZ6ZNR0ut4Fhl1gciegX5nPMZRHFtceuMEV51c
         phxN6Zgg6y3o3magHdvXs5Wz4Uma3n4wkj/ww9tl/pZD+bxvJYyaMO3Mehgrm5yc0SnJ
         IOstkiGLeKcYBSHKlNycHe94mop4t2N1qsQcSfT5fTa+YgMNe8CCWbmvyfMFAuA+ZyLf
         k7/IwG3omcoSAk2nfrIkjDbNrbIjOzr1CyA16ucjIAfVGy0g/P125WH3q+q03BC15JB7
         A8Goe2czhw5HvsIEzW8urZYX0kpima8w5iTfmmVt0RF8b1+lRJqpYIgBgR7l99Ku2HvZ
         dgPg==
X-Forwarded-Encrypted: i=1; AL+hErFbbjhtz4jLUWo6mvV1ii8dEV3wKpeGaQKdN1O0rjKn83lk2pakFpf0AWTBMlpJssVDa5g/iHMx9laib+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OOpwEjvmfxWy98xfTy6SDlA4xV8tXUMO+oyfF3O2eFIX1oXMy
	EnIPNrPHvY9WFxK4PFhfeYmvcFYu3ISi+Frx6L/gJ/s6/CTscrAhTv9VUxZ/kFJaYaglz/vspmD
	PbDa+7Q==
X-Received: from pffj8-n1.prod.google.com ([2002:a05:6a00:c2c8:10b0:8b6:c93c:12fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3e02:b0:3eb:abb7:f92b
 with SMTP id adf61e73a8af0-3f7a84cefb2mr2101207637.21.1794577810682; Fri, 13
 Nov 2026 05:50:10 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:50 -0800
In-Reply-To: <20261015083123.790030-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261015083123.790030-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441822886.80755.5926985359947191603.b4-ty@b4>
Subject: Re: [PATCH 0/2] KVM: x86: Reset MMU back to the root MMU when leaving
 guest mode
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 15 Oct 2026 10:31:21 +0200, Paolo Bonzini wrote:
> Fix a bug where KVM fails to unwind vcpu->arch.mmu back to the root MMU after
> leaving guest mode on a failed entry to L2 via RSM or KVM_SET_NETSED_STATE.
> If KVM also frees nested state before the next entry to L1 (or maybe even
> after?), trying to construct the shadow root will hit a NULL pointer deref
> when trying to get vmcs12->eptp.
> 
> The only known instance of the bug is in patch 1; Sean's patch 2 avoids
> the moving the reset to the place where the vCPU goes back to L1 for both
> nSVM and nVMX.  However, it conflicts with pre-7.3 code due to the separation
> of kvm_mmu and kvm_pagewalk; and it will also conflict with the stable-worthy
> v3 of https://lore.kernel.org/kvm/20261011001303.723721-1-mlevitsk@redhat.com/,
> so it will only be applied to kvm/next.
> 
> [...]

Applied patch 2 to kvm-x86 misc, thanks!

[1/2] KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry
      [already upstream]
[2/2] KVM: x86: Reset MMU back to the root MMU when leaving guest mode
      https://github.com/kvm-x86/linux/commit/c0e3a3724c53

--
https://github.com/kvm-x86/linux/tree/next
