Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905656;
	b=gJ/mA+EaKfROcYjTXu+XvpJLvas5qJumJ8ck8rzzuUQQEyFObkbgxCN13jc4KIOVSrr5
	 IbsEkRBek4+D/Nz5Aa6sttqx1eiyhTLyq3EFlyppkecSY822Dmjc1oB5B7jWU4LSZc3IC
	 i5C/zWbwMWuZDaw0+pvNNf2nMo4CIps7BVvT+glIx7Nvf3tqoBJL4eMVno+lyjetoTc6d
	 Q4uHgLtFqYYlf3jVQfH0EN01GunH+jPpzFu9cddtakxYXcpKjIERqbQo+ewdN6ajeBilx
	 KMgf8lZjqFfDUW3xlkpQ5qdqweYnd2QZEgogfwQqe/quJaolVLUm/q64QZKZGUfUIvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yTiKwXEnXxeIRLFTsm6pyPXSdQ19stWeCj4ZNZtBtvc=;
	b=tYx86oubrNkvFvNSWqRua5zZKA5/rX7+AD1kCyo/v7pCkJGlOuDKTmBQRtRnUen9Sni2
	 maQPnTRe/AQtxaGdY+LDPta53ypIiH/uAcCIW3Lao7Gsjg8DZ9ZmRwCJbN1w7v5GfmtXP
	 wi763U2vzdIzNLDuGmB6vSUOzNqkivSlpZ3hcXNwaMm7pfDhpDC/hD5dEL07PwCA65W3N
	 slmYa1GNE8Bqib1+9P+6PA2EBeOFEgSpqus5eywo7QMx+0JoEeLGV2+wTZCWveWhRPP8h
	 xMPUG4PggNtDAr47N3jSFpcIL8Vq9UK/5w9Yffbn6n+R6RYJFHUHoV3HQQ6v/Zd1ZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j556zDUZ;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E94606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E94606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j556zDUZ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so3274934a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905655; x=1794510455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTiKwXEnXxeIRLFTsm6pyPXSdQ19stWeCj4ZNZtBtvc=;
        b=j556zDUZZLkeXoLhiuhzLJ/REgnxdyh2p2h9Ll+wk9PrrYpw/mvLgYhAb7XcnW3uFD
         Z5PYxbNSsZXz2Y6xYfS4bl3SJxAIwp5EURlwfxs4i4Q5ku1o5HdVJG/A5SXJ5tb2uU1D
         WHfLVC1ZU34LnuPwkKdEpWGAZfX8EBi5R/oObwEvw8kEcP5YpDAqJ8r6bArrrIElh0Kb
         DYYwFMaG5XrWLerOGr+LAnY/PFbGnmb1SoZk/hPx3lQBFVhodZ9WtZl6dYS0nyS7MjAx
         E6/A80KQuiEjMg7qdb4FTPySIYR9zh7Xuanz8kaDizNwPttCmDVwNCQMvjOaFgNCo5EG
         kNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905655; x=1794510455;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yTiKwXEnXxeIRLFTsm6pyPXSdQ19stWeCj4ZNZtBtvc=;
        b=hGSeUdMr6MnXk1yV8/APzBdZHlX8/jmWGmxMdgu47jAT80yoTHogwBxk/aeLHuQ8AA
         KH9hWI3ZW9jdj7588PkX0q5cMbx2NKV1QVnsgw888x9I5fnO1iT2f+eLBvtWUCDcSpHt
         Gx8UcAnAGtc7rRu8h76U1yEDN5MayyfZc8W4DOZkX0f1OGqpNBfCyj+kw/lMd/BQjnCB
         9RMJ1VkW1IgeiAWeOwc4MUWK1y+7VgeoPFLpjuBqoHIrkMBKt/UDLP7jY8OG7RibmJzH
         E2lSoQUkF4dW4xkNmldguuFB/ga52X1eEhg26RLz/Ipxacegm4EzBs4p/tfmFgaN3J6h
         t1mw==
X-Forwarded-Encrypted: i=1; AKwUvBxZdqgQNUBkzWYbNWcY+n5nk+gjR59rTth5A7f45eim0P3Wex0pzCPphdimEOO5Ij1Gtz2TM6oQ8bEGd8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t/0eOEuDrITuqZT/4L3EXzMedlZyBJZ2zwKnODyshhHOnW14H
	2dMBNv8b8FIz49wNw1qttN4h/UCo6j/SMo6aT2ZHBUSLTIEoTAZBcl94SLUcOYQEQTIhzRtZQCj
	OFWE9qg==
X-Received: from pgbm12-n1.prod.google.com ([2002:a05:6a02:618c:10b0:cd6:a6ae:1ba0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:390c:b0:3ab:e588:c2a8
 with SMTP id 98e67ed59e1d1-3ae8985c4e4mr17141245a91.64.1793905655207; Thu, 05
 Nov 2026 11:07:35 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Nov 2026 11:07:31 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261105190733.3741959-1-seanjc@google.com>
Subject: [PATCH v2 0/2] KVM: nVMX: eVMCS consistency check fixes
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manuel Andreas <manuel.andreas@tum.de>
Content-Type: text/plain; charset="UTF-8"

Fix two benign-for-real-guests bugs where KVM incorrectly performs eVMCS
consistency checks on VMCS fields that are supposed to be ignored.

v2: Properly guard the checks instead of simply deleting the WARN.

v1: https://lore.kernel.org/all/f1f39118-2e1b-476b-9a84-ef7d56412bdc@tum.de

Sean Christopherson (2):
  KVM: nVMX: Do eVMCS consistency check on secondary controls iff
    they're enable
  KVM: nVMX: Do eVMCS consistency check on VMFUNC controls iff they're
    enable

 arch/x86/kvm/vmx/hyperv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)


base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.56.0.567.gdb80ae8cd5-goog

