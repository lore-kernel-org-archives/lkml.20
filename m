Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577817;
	b=znaLcw6To1bRlLmY0d/Rde1/L4pMAazXA5OO+/YitHb18ahRqgtAQ5czHzkesOhMS1L+
	 PZ47QD8Y7AC94VS8NrX5cf+yOt7aH+1cr2O7LaD+YGQG+3XoFeovVLCynQUcSQUZkicML
	 /ZYZWOxxCByWytW0ZHtbfnIZwSIdNgNjIHH8iF0cjqwjUdUu6GiwxLF9dtTlKt0FM8Fa0
	 DEEcCDEwGMSeqRLm7UR1yJyfXQ7aI8nJUnGpA0indHXYIpwWUuQiQVc4jeZPeTOAKbBVG
	 8tByVSw0uPelrCYvtM1C/Ft84zajK6zOFHjdPNT4mNmFuziq4OdFPPekyllE7IEbl3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jb7nyjamFgcgVR3nOIWVWhlGLSSmfYZaeBbucH4zfgQ=;
	b=PXBWBgOAzndX9VegRNCaV/0r0z/u7bqYhEvVwGs5yjfvALjWUmxvgRiXEnu6di3afeJA
	 O1EMzDlRbyxv3AJnYd4Zj0rH6yPzqL9cPFCzmbSh2DaPBQv89bB5q5R/lNkGgWFygJOqC
	 FP9ZfdO7Py7XGIa1pcIqNeuTdwtsAk1kwsU3ff+0KSiZG+nqQHu4oGrgatjNcGhAd4URO
	 7CK4ZUQCoKTAgLyhCbmd2fDP4omWa58S6+K4bCQPB/V8gV3LO4HmyYeMxmNeNpC5b4cvm
	 Ct7g5m9tzBsIckr6c1J0DgBGvnCjga5jsj/01WIcSKel6s0tfrMkdnxNtIt0rx1PgKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQcimdpd;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744B606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E744B606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JQcimdpd
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so17435065ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577816; x=1795182616; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb7nyjamFgcgVR3nOIWVWhlGLSSmfYZaeBbucH4zfgQ=;
        b=JQcimdpd5VGkIluNchEtbtDbMjOM0kaWOiF9OJuCXa1gzUYQbxhfNWYZSf8UG6BoUE
         KWfsDT3+Xb61Hj/Ai8x+SlmIPU13fa8jZChlmYlcgPcNoC5SYprvuAprp7m2kDl+bWo9
         vH4uRPmu0yHl/VfZAOjwtu6yXv45abZRnTVq4gxrUaaKGnKR+g6l4YHkK9MJ85a+rn62
         Ouukbw0P6DGIXQDUrjneLcBnPBiP3T4P/Hgdv5QKlnIKAJ3EqdpsjTm7xpwcyUOK894G
         i5eZP+RqvdlSV22PezaQJOMqueiv8csxBJufcNMo5uXwOFosPtd1/hGXV/U43BpPKiHC
         zXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577816; x=1795182616;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jb7nyjamFgcgVR3nOIWVWhlGLSSmfYZaeBbucH4zfgQ=;
        b=PvYOOQ3c60bAtouCkbO4Tvo6kUDEx29XgGvJ2QFQXIENIn8yUr9/b+Ap/5aA4Xdc/z
         mhO0CxSGB0wy1qO80CO+6VfDk60IdNx1+UlfVOU29TrK6h9JRgZYDPpdkbvcEgUjEQar
         BIlM/c6poUqss8R6LaDzfINWwQw6PawvryFVBesanqrjeGQ+Thkwh0BXVyciAyx33ThF
         aBdXWkqEEAETzlIgA3wtW85gP3os0A58PPh1kTeIGRaPfP4E2+b28LH/atLG1TraL8bS
         xdaIfvnXudiVtRDvWZy07X9wcjrmFhM7e081NZCL6btHilO9qOsFp+xw/EwviN5l8lM5
         pVYw==
X-Forwarded-Encrypted: i=1; AL+hErFlfIbQBJWurHYTWYtudV0RuleM5b0D9ApT87m5Q+zBmK1ypkF4cRtO5DObAjeXaBekg9U9trPlXt2Q/s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8WP+M+sw0qQy6eNBaj0XvlLKoH/XeORdG1km2OnbqimpRwHvQ
	2qxzsoM9p7VY7CNp7QXuQZhtZzG57qKccc5XqCp0PYZXQZ1aI/LjNT46RQ84WmUfog+cdeW2QQU
	22b3WzA==
X-Received: from plnm14.prod.google.com ([2002:a17:902:fdae:b0:2e8:ea16:c701])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c6:b0:2ed:205e:eabc
 with SMTP id d9443c01a7336-2ee0dad02dfmr27151415ad.32.1794577816132; Fri, 13
 Nov 2026 05:50:16 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:52 -0800
In-Reply-To: <20261024174525.1218244-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261024174525.1218244-1-sashal@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441787535.77103.9188676623707194015.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: Compute the max guest TSC frequency from the
 current tsc_khz
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sasha Levin <sashal@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, 24 Oct 2026 13:45:25 -0400, Sasha Levin wrote:
> KVM computes the highest frequency that KVM_SET_TSC_KHZ accepts once,
> during vendor init, from the tsc_khz of the time. When KVM is built in,
> that runs before tsc_refine_calibration_work() refines tsc_khz, about a
> second later. If refinement raises tsc_khz, the cap stays below what the
> maximum scaling ratio gives for the refined frequency, and
> KVM_SET_TSC_KHZ rejects frequencies that set_tsc_khz() would accept, as
> set_tsc_khz() computes the ratio from the current tsc_khz.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: Compute the max guest TSC frequency from the current tsc_khz
      https://github.com/kvm-x86/linux/commit/87ea335ed2bc

--
https://github.com/kvm-x86/linux/tree/next
