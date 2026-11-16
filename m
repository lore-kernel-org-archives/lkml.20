Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845370;
	b=dBiqe1deS00+f4Cfo9enUH81LS+lsRJCXvPGmoH4ZVi0cYOrKiZIWDHqjLIIc11OZm4Y
	 qnQNEUUpmB/2akmZE5UVVV+XQzpj5e7p6snHh+HwXdpW5Jgv74SvQtK4xb97LbDNaRY9a
	 J8+s6YueZEoVO8eR9vXZuc+JfmHk79reRoTU+uraAlwWfq8mcxpAVVjAP06EVGU00VMu8
	 ljpL9kYYXKsPgZyVHj7X2zoVmh/4bKlKwa6bQWzXT1cjkY5jo+KyPfzb6bJH6kJeo3xpP
	 LTS0RaFtw6jEA0vi/2ELnchpURqJWuhINZqpYK91NZlyIMtTQPyjoGkkqFGe/yHeheA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845370;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
	b=roYlYdZo6UYUG0paJelUznGwH6U/QwbndHzTrMR32x/rw/30R7XbMXNrj2sDMVgKmIBa
	 7wNgFCkwd4aZRDZyhRx4rm93MH2qlJ0gjaOFgy13g4ko6xwzJrFzRUbLvvFekvQvGcqm8
	 rR5eKBCjJfV/wc1M9+Y7gctiOkx3dLiJkaYoSkHe/iOhXqEgluL4E2nvzf/qrNhJHQz+d
	 dO7M4SRVfBOnO4QlfoyBzmkOkcQW7Z1BP/nGCQbME5icn46sODIFoax5wstfkBnXU6TVy
	 LChk3UM7MHDItESbJspWj0kBbjVEMWjXWFBoULM+8UMts62BYMI5E+xPwvavReESyKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ae+HIPyq;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D817606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D817606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ae+HIPyq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xuWJrrizIQaSrZTQFgUO3V0HL4ic1BmuoACdN3FzMhU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794845367; v=1; x=1795450167;
 b=Ae+HIPyqzAROEOoyRp+sqJdgNtzJS/JyJXyiCthVGcmoaviWkiBjm/j+yjeD8sN62KmgrQmq
 AzURHi9JBd9x0c5DA8pR1o/vWCVDBXJe5RNLzO9SQOBeBQEnW7LdaySQbjCv9jmRoVl9ZgnNOK9
 hUDgDKvocjlOeF3zwTIgHx88=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15379bfaf602689c;
	Mon, 16 Nov 2026 16:09:27 +0000
X-Mizu-Trace-ID: 15379bfaf602689c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12531e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHMafhwdEpfoEV1BAgH1Hnqw7R5IYRNXvtsJCCI4oWipw3OYb6OxAfKiiZwsUGXVLcgeqO1b8WGQoy8RH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nphFnr+meQA1QpiWLcEww5gkLLtNP0LXdpdcsfmA1+x7n7rep
	h+vf9nrcaIoDhgBUIuTIRyF/ybztg/BDTO3r2GqgkJ4sM3GLaP7ft10dVF4bmKzFQoNr1aFU9To
	oAxJHK6KT8wWlHgipbjoJaleNqTWYrl2fiIAXUPeK
X-Received: by 2002:a05:6512:1304:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c17e4b9f86mr221482e87.8.1794845363481; Mon, 16 Nov 2026
 08:09:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
 <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
In-Reply-To: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:08:47 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
X-Gm-Features: Aa3M54pa7DZ_uBY7ynCUhZPG35ZaG2vJ1bC6E24f7r2YagR26_2vzli-PPKoWqQ
Message-ID: <CA+EHjTyqJfGS+5UajX=RYTAG-qfhZ-vmGi=1SixXydWhwGHLUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Tue, 10 Nov 2026 17:18:22 +0000, Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> > Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
> > clobbering vcpu->run->exit_reason.
>
> Will do.

After taking a closer look, the clobber is problematic on arm64, where
KVM_RUN completes a pending MMIO exit only if run->exit_reason is
still KVM_EXIT_MMIO. If a pre-fault stops on a full ring after an MMIO
exit, the helper overwrites exit_reason, so the next KVM_RUN doesn't
complete the exit and the guest repeats the MMIO access. The ring can
be full at that point if the pre-fault dirties pages, or with NV, if
the stage-2 walk for the MMIO access does.

I don't think changing how arm64 completes an MMIO exit should be in a
fix for stable, so should I keep testing kvm_dirty_ring_soft_full()
directly in v2, or do you have another suggestion?

Cheers,
/fuad
