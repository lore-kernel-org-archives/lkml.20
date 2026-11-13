Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577830;
	b=ZFJoy+sFr84nRPHgQ3scxOIPvkg9J8l2Y70wnjuwjwjHA399X+rXN6cdBv6fJNnIpztb
	 2FkDpl++ZREHYEDioK7gEblfJTdUbhtooxluZs+s3hdTc9QPGMUDAGqkO2dw4u2S9/8IG
	 Xt1+IsaQk1+B0q2/SgmRZPj4xT/hLE6osC2PdhcMLuWW8suV4sSu3QhPgUTbjR+yRUh9R
	 2w14amL3owJMj454v+UwLuOchLQLMBJbIRBCKWdjYj4YWWX2x38he2NIpl1pkef8Xen1W
	 zjKcZHzC/1pPkmM20q9DcrXi2+LAicNm9pr6U6t2yotb9y5kepLVq0zaeGNZc1KndbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2kWLdQ8WhuFeA8Ma+7E3DsD5x9VuqgJji8AqVGlcvTQ=;
	b=OXt4jH2bnBL5QtMxmLQL1Dk+QHbAHunS8O3tCrLmVRIXPY5URVW/BUcRKJiLDp+RAGRY
	 Uz99F3M8hi+srB7Kibm0Z7eNENrobjUxxSm6xVKDytNAZuep6xIjNDGsFzKXoc8ydBusm
	 b07LdSnziGEXaOHT2RmOszOqZ4T685lSivkmW7BBI6PnRnmIo+hLjBD3gf9au5B9bW0nD
	 YavQGNlf+j9QeR3fPeE5GpP17hMjboeL75AOQUEZYnGOb8WeaCQ46KaIxVnpXTtkKaSgH
	 y2x0lfh/NMhW+xy2HeeNT3wN9DuOE+95PAIRl/uK0XmPonKJBnOIPsklV879lcUF0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mrqfOkvO;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAF60A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EAF60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mrqfOkvO
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso765698a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577829; x=1795182629; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kWLdQ8WhuFeA8Ma+7E3DsD5x9VuqgJji8AqVGlcvTQ=;
        b=mrqfOkvOWKoh2MMsWkAZdkHqQb2QLn7JmSDUaYjn9sgc1FfEXWqq9J36rTEgChgFyG
         hPljzlqrSMNYA1rYeneH623YSZwwGUfLNWAux6lOVWYxXWstu7NLpimGZrotM7lLr4jk
         aImEju6AuyOqM1tw29hw2iQ9ikEn//L7ZDNz7Rbm53c8rj/tsPledIW/4elpkWRhgONE
         uqOERufrZfaO5hZa7RTuWyFWUjmCUmnB+CodqH7aN7pF/Gt9JYy+JF6GK0ayrWuYuMG0
         RGn7iJAwgofJc+GYfOfFG9XcKimtFlxt4Yu5NbHcVy2qBdlFV7/61zzQLbb4FHlhBpT4
         NTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577829; x=1795182629;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kWLdQ8WhuFeA8Ma+7E3DsD5x9VuqgJji8AqVGlcvTQ=;
        b=HEE7eoTkCy08qEIncymxXC2po3oJgnFmmjcfcHVEu9M4IahHn/HYkCmfd8AGo5Qkd5
         4JZrkyvcXrsCIgY0vPK00lH3wJII9WhsFfLVbdg1J64IdpbST/wJlIWcCVBwzrwvlyt5
         QeD4kdQ5h9Csu8iZDjPFtKupvsdof1zO4NLoGm9wwREliGnxYaygX3I1V2zCLBw8pnM+
         SEiKYePw1DhQDPNEubAKOscF3iYe/ASRUzQkd3DJD9Qh7hAGmtgzF++14miaiE75SyDI
         b4n7ayqg+24p/O+BCAd0xrSX1SqeX67UZOpCIiXU6CmHAt8GX8IHZGTpwijXi1ffE6FP
         Nf+w==
X-Forwarded-Encrypted: i=1; AL+hErFLVGLhd0Pe1/wKfdc1zHk408LKuconqY+vwBTac9sxome4sghq1tYrTzjLujbQ1lwxmCq4KhH5pvMFHhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WmG9xBpbuMXtnSL9bpkNvmYKpdX+a2Rc4NfQ06OSda7P1u6u+
	9pVccfbtlifKYUEDCabFD25jdQvejCFyBW9/ZuR98D4mYr5BBm8dSpBGT8mdXMV6GFBHOmXFbIZ
	3U12lXw==
X-Received: from pjbiq5.prod.google.com ([2002:a17:90a:fb45:b0:3a9:ccc3:cbae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b0e:b0:3aa:f4af:1e16
 with SMTP id 98e67ed59e1d1-3b1b08183c4mr2391477a91.7.1794577828910; Fri, 13
 Nov 2026 05:50:28 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:56 -0800
In-Reply-To: <20261028184136.1803336-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028184136.1803336-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441796850.78088.18130497766298569234.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: x86: Convert all runtime WARNs to ONCE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 28 Oct 2026 11:41:34 -0700, Sean Christopherson wrote:
> Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that aren't
> strictly scoped to module init/exit, or similar, to ONCE() variants for what
> should be fairly obvious reasons at this point.
> 
> v2: Convert the WARN_ON() in kvm_mmu_uninit_tdp_mmu(). [Sashiko]
> 
> v1: https://lore.kernel.org/all/20261022215541.631694-1-seanjc@google.com
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
      https://github.com/kvm-x86/linux/commit/bcb00f11d70a
[2/2] KVM: x86: Convert all runtime WARNs to ONCE variants
      https://github.com/kvm-x86/linux/commit/e7e4f00974c1

--
https://github.com/kvm-x86/linux/tree/next
