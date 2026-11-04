Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833440;
	b=md6eOQpIpyVhYTR2DmHaUnIqvE/zd35GuqOHJ/GpegKibIjjeccrPYdaWZZ2N7F8Ewgk
	 rmivz2LZJqV1ij3YI6G6eApQDkRoBtNwtDzAsWF0lNzOV9BWLZAJbZ0KbmJsyUN5sWQOJ
	 O7RYn59E7cUFdq4fjmvqVXJnIux5BxrzGQxJ9259CUUbZM2T7DABOoaT/PNxagofrCD/k
	 b9rfKlxuvySSzBnkrwqptvh8SWI3DS/nmv7gZxYGdDQWVeCxNyB6nWoa5w24eD1Zw0W86
	 jJoOuK49mUertmodoxKiS5gOGRCF7J3fMdtnAZqUGJ+/d5o6uRERUI1b1PNq+ApxCsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
	b=iaPIf+qsmmd0LKCYuukcm/Ri35UaDwfao/bYbiPDVhE8q1bQbp1EBuDwdCCVqFrI1GxO
	 VRE7dIRrCSyIpEmXo3tWVFw983ZPA31EELWNjLAEErVZuNDjKxfS2Q95Xjy7XZnL0uSAZ
	 s+fZKrB1BRaMzVf97ckGKUqKRT9P9asWIG+83CpN1i6yhMhFZ4yxMnSS/mR3iXV8TtdeH
	 J4/D+kDPKSAfoYudG1NeMLMCcP7cOgh4oxkSalJLhD2YrRB9ASqKbCv7tA6CcexnHt6Kz
	 ToWrKvK/aQzXm8xWPNwlQYHj5irCVZAKo1cGHnkiwEmMvB/ZnTcyaVm8c5f5QoC+eUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfcSO+zW;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C14606D80B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C14606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfcSO+zW
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb4c49e52fso1052244a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793833439; x=1794438239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
        b=cfcSO+zWhNbJhxmkGimeY3PEwRA9X69/Tgx0y7TqHxcHiVraVBh2fd265reUdqWrdv
         gHt1i1xZ7JdHt0OM8GlDeMdrTf9U3qCEy6OJ8WVX0N2nxVIzMttSryWt3QW1Q3K/32AQ
         HU/w5lNCWTBN2QHWVKnYglIMlxD77Xw8vQ65DCdlsVh2h1NclOWFNlco15jgnuKFgWc9
         EMILZ2xQVI+CIhBdy7DRuDx4XfTPz2XXqsLUXrkHPXPsSCgqEq4iOfkdq6DKjq22dt5H
         CKpDArEDLejZ/7xG/VAdmjtRKfIZb4aPuREyhvDecCNIAB7Ub+BDW2jj9aL9jQHdO/id
         CTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833439; x=1794438239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
        b=azp+Q2RTxv+jCBNAyDYmsJOmCWwOk0S6qtw+Jy3hftCFu2tEgQD1WEZiwxUhCwAyt4
         o8m1gn1KSwJP8lzpqEMUxBnrrIjSX0hnDPNVvb1DygLas7o6GEfi0F86DamRkYEZEbyX
         +9G7q9yFQs23HAFYnTm7o5FJgkxYjOvdL3Sz+feTJgomI7Af9UNG5URqZpWSD0KDG876
         im4PmcNI2Mg52mZO9PlSlwiAw0k4i78kZWIsYQzGFsQ9SkMKbBVKwUZOkJWDwQXTwTvX
         iW30awHmBy35za1tG7lvNiQK4XesHVmChhj53qiOrmJGop4nW841oxIqiQLd2J0Ldwa8
         QKug==
X-Forwarded-Encrypted: i=1; AKwUvBwCKJKfRuF5sznpUj54tUpc4v13Hf+N/JN02ES0ntmB9sHBzOzkKQfMf3T1RWsbFNGNd7syAGyn6ML7gtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iOSAD5ta2qCMbgbKKhKOypqrsrGDOBHIbSXUfgzyZfdev9ZnJ
	Uqi7z1G/2HA1i6RCL+/pVeoiDwhWiQqH5SlMo9Jjcbq9ja/raQcn1Y7zVwMBieulYqkdcvo5Oy4
	HpzkX/A==
X-Received: from plgu4.prod.google.com ([2002:a17:902:e804:b0:2eb:3675:626c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d986:b0:2e4:b112:14d
 with SMTP id d9443c01a7336-2eb3651ef90mr147849885ad.54.1793833438788; Wed, 04
 Nov 2026 15:03:58 -0800 (PST)
Date: Wed, 4 Nov 2026 15:03:58 -0800
In-Reply-To: <20261103130131.4069212-4-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014200152.1365147-1-sashal@kernel.org> <20261103130131.4069212-4-sashal@kernel.org>
Message-ID: <auu53k3ODfuMD_nz@google.com>
Subject: Re: [PATCH] KVM: selftests: Provide empty installation rules on
 unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, Sasha Levin wrote:
> Ping, this still applies on 7.4-rc1. On architectures the KVM
> selftests don't support, like 32-bit arm in KernelCI, installing the
> selftests still stops at the kvm suite with "No rule to make target
> 'install'".

This is on my to-grab list, I'll make sure it gets into 7.4.
