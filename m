Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577919;
	b=RXh3aEHqcFQlml8QR5RM+0h8tBXnoDEZxWnZVOX9tyPzHjOQDH1+n2mFegm7xMs8BPje
	 Lnh0m+U+j2pF3q6meCO1fuZuGv+dPndXzKCh/1Y3NaQ7lcG2CW99cbVhZotE5nn/qSbzh
	 VYug3wSRa/la2HKahSYHHAECVsMb7MSe4V//Q7AyI9oEdqBVfLE6nbIA3J+LNzMKc+8QT
	 nBrhTvaJGOyWdUV/qbMsSc23Q/Wp8gSKY12PomnCUXsNutc2oaEG9lWVcXPn8Y9/9W4u8
	 dmkjzsxFAQu/95r2VKlHpds4I62nttpzSTAYLNtxZDWWm4yRJFwxarX7wxwrOzjHfYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7iOQh6oJAMU34U5WNO1f4JDUIZhUKKNoQ3y6TH5HxY4=;
	b=gy7sTZHxmsHVU3LCe4FETpYp7+leFS4SDLDxcrsxa0lIsLMPB2QzjiTZN++LvlcHJF4L
	 WWlJUmM3p31wALEP7q5eNZRyopzHCGg2kxcEQw5r3SoczRRjyvjBZO7lo4kpARqK4NeDj
	 Plj8xOAQ8kwYzMKcLo8STn7SWnvyXyWzdR6mwI4rkg/Kzvs3IHsKvj/TNXop/hUQLBWXn
	 goFv3Qd3IloK1skXWLEyWPkNxvpyP0135igI/GlsHAUPYdOpKm7AA2nQiFZmN010MishK
	 2+nyfR8FK8XlwhE9Yuihg1keCfdNlc6istTB9AVHz0BbpaVxQL8d8X3lvPq9RqLdKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPyf8Ilf;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAB606D690
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BAB606D690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPyf8Ilf
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so1223493b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577919; x=1795182719; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iOQh6oJAMU34U5WNO1f4JDUIZhUKKNoQ3y6TH5HxY4=;
        b=FPyf8Ilfs7u7AaJsMMV6r3d94pfGyY7/LDBBwvNUPsxfj3LmrDI9hgMHq3yFbap+GZ
         m5zoscaDeq9rtkD46WPQ9tzJKth1ynDDzJVK9JdrgxAuW0/BRfqQ2ki0w9E6n2aUxJgv
         cvGAsoaskmKWLJ2asxsrAJA85uBCnOS6CdgpJLD8noCRc9ptW5xZmIFmsFviaBQJ5/MZ
         NmUDBBSNecKjaIVrwro8T2UTLLwvaYvBKyBDDn3mMLZgxG6eWDBkKIMdWW1Om/2gQucM
         FdOTnhaRd7wt/a4nlVGFyVpKzd2nLTdHsl9RBj0EddthkA4Zx7H4/UQ5CCp54MbruaIt
         pExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577919; x=1795182719;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iOQh6oJAMU34U5WNO1f4JDUIZhUKKNoQ3y6TH5HxY4=;
        b=KsfxrULUHNhLCXjeK4iau5YIkoALzRCJ2gpi0fIxEbFAupO7PUc0RXtf8OKmzJPlmG
         mN+fnMLplASkJKgmo1UiIb/NQVNPCmOb5EAmjMa8vqxveJ/0XpXKUgjlA9wBumDZkhx5
         D3Qx1VDqBIKfLJdd9I9AwjXsnK4GhbafFVTLBy3PLtPYDmmideR8KKNjB9ndb7T8Hh/3
         ROxpYt5aUFIviqfHYLDj8IB0Urg0VHzt3i3/FnSLjLh+AiLnvlc4JrHj/AmfQ2rAkFN+
         Oa2Zbbgt385VQNi8e7m4/EeB3d1mJi/lv+TY5x4RaVTc8LDKqnln6tIFVA7cIjsFbSXY
         NnSA==
X-Forwarded-Encrypted: i=1; AL+hErFKXazryLtolOtgAvg4WolcqnKqtxHXRecJmrGJyuRHArdVxgldr5TMUeN6OhIDwJ1NriM4E5R94lLLh08=@vger.kernel.org
X-Gm-Message-State: APuU4Z97PjV48ozW3zItMRDgcS1hua+JIaD7qQD1eRM0wal24P6qLmQ6
	WM8LxWmGvYuZRIGkCQ5WXhbxvX2rZJhoWn/KtuV80QFQ9LT8QEJhryH1+1uBE873S5wBGpIey3z
	BpvPSQQ==
X-Received: from pffi11-n1.prod.google.com ([2002:a05:6a00:c28b:10b0:8a0:3171:5410])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b53:b0:886:a737:e0fe
 with SMTP id d2e1a72fcca58-8beb6197585mr2672431b3a.23.1794577918466; Fri, 13
 Nov 2026 05:51:58 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:22 -0800
In-Reply-To: <20260821093957.1722167-1-binbin.wu@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260821093957.1722167-1-binbin.wu@linux.intel.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441845917.83089.279363969551127970.b4-ty@b4>
Subject: Re: [PATCH] KVM: TDX: Charge misc cgroup before allocating HKID
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Binbin Wu <binbin.wu@linux.intel.com>
Cc: pbonzini@redhat.com, kas@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="utf-8"

On Fri, 21 Aug 2026 17:39:57 +0800, Binbin Wu wrote:
> Add a tdx_hkid_alloc() helper that charges the misc cgroup before
> allocating an HKID, and unwind the charge if HKID allocation fails.
> 
> __tdx_td_init() currently allocates an HKID before charging the misc
> cgroup. If the charge fails, the error path calls tdx_hkid_free(), which
> uncharges a resource that was never successfully charged. This can make
> the misc-cgroup usage negative.
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: TDX: Charge misc cgroup before allocating HKID
      https://github.com/kvm-x86/linux/commit/93f1e8445a2f

--
https://github.com/kvm-x86/linux/tree/next
