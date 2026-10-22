Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635503;
	b=T4jD7J6JqJj+dCGOaqtih735jB/xQdDD4wND0sepvjhHAp6/xR3H3+9uN98Vx4sHav8D
	 wftGHY9Clpclt9LCdS+NV2pSFaxY/ost406VABlo0DUc1rO1wpIE1jl/0Cp3q72YmJgxx
	 g+xE51TBW7SgzsHW5o1x5Id2+++/d1rlpNUemeaxNbcRG8BTDROownfpigaAnCiszVm6o
	 +u/3S+HZoGoEXAZvxHYVEEkN5alioYPSBg6KUDQcx2Di0i3Ujpf20ScnVh71/sJSkpuF5
	 OE4wWUaVR2A+vrQLTxJe8r3v1aPDSWuBk3AWZwxa2hoERlGMkBZVOsqNMG4Yw15FQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7c0m7qaS9HqUzHfqjVCvNrAuzThap6chMmtplqP6W0U=;
	b=LGrd0WweVRa1Q05uh0qGULszTKCA4bFEzmqYP2ncudL5pbLHug7H06Oqz2cRgu2e969q
	 Hl65r3xWVR/dxe37XFqw4p1DInP7zdSyPaEva5djWw4EeTT3J6TEVrqbpCEeQcoU/Vxfi
	 6ynqUbu1P6RnKr/1cIfdLOOT1DYq3dPZ++WsZZBP2+t61DHouMxRAnDHSYJld973gD2Ka
	 sJhX5JJ2DmO2VUPvgJsIyjOrcR2Ewj5YSr/HpTUtx9Apnl9DsYtcZjnUz/oQuh6WrMVkJ
	 JooQJty+BGFWUhezYXmeHVVBwSSLhYj9N5+O47Tn5v+ezIIuS3Tg5NZuQuzwoC3XCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=n5bSloBD;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D8606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=n5bSloBD
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1452348a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792635502; x=1793240302; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7c0m7qaS9HqUzHfqjVCvNrAuzThap6chMmtplqP6W0U=;
        b=n5bSloBDYiFamzpE7rWfD1B8XYjfsxrZVUMhnzZOqbBCvWpPXBiyYJLYiL1hHLULAF
         bRo1PmjRJdB07UX8aIj1AztpMg/tyfFDC2UtqBo82pdiRNlYiI9GX+dofwhp5wdUCLs7
         WnVBphB/pi5LmtJgqYt9BBlnkWDh3u71bVA6YqHDNlCOlxENdKcj/R2LndzI/4ms6iNO
         1NGs+nTZixZI73F+kbhHWHSH5RE4A8qztzrQVZdOlo6J580KR1xe4qveirG2E7c2/u6W
         0oWsmCB4etvAN0pbbOo14VTq7kdMxwYhkDU3UA68F/tvRyIxRyFwi+JHCwKk64+b/vYy
         vpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635502; x=1793240302;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7c0m7qaS9HqUzHfqjVCvNrAuzThap6chMmtplqP6W0U=;
        b=kx3LwFKtdnNPA61fRMZp/x4VgRSuvfsTTZB5edxp+UjLFlw+XS/bk7tnCDoPyWK9Po
         6sZ+Oigq5NB45J911iZEY7S/JwCXMY7QgByEP200icXiMn/N79icvb7pj/UnGwSH5HCw
         nap9rF109o4DdhgClBt6jjT6B8l46d9C9gP7ZW2sMVgTgO9HmVX/QGZ5n5veBjtlsnfN
         DyvdR4zuyz7BJQGXp/zbXupKrxZHJq4F1trb5B0mVrfF4lssgIZmu8CPu1C1N/vktPj1
         JhYC24OsSkPHghBAcCGhT4S0FJXIh5Ti6f1UDn65rofXjAVHgmMJFEMAu6hSvh6QlDua
         7bcA==
X-Forwarded-Encrypted: i=1; AKwUvBwKyL8vT+WCTtKmEzxUnDfuxeCZvEa5V7aXIPUcE4gYRZbvvNuyxzMjOebXCatoBLt0aqhchw3uqSjtJSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdkykPyWL7M3OBynt9fIXT8WRJfr3ZtVKkU8gR+itswuH8IA36
	/oxGjxfeB6JMtm7Ghe7FXOu6w8mThW7E2JADJyOBWJMdYhqnOtJsEJE1IBlY9s37o0II2hTeL5R
	xykUWMg==
X-Received: from pgn27.prod.google.com ([2002:a63:d5b:0:b0:ccf:ac26:a979])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5243:b0:3ac:a7ee:6760
 with SMTP id 98e67ed59e1d1-3ad86ccdc8fmr3153086a91.23.1792635502327; Wed, 21
 Oct 2026 19:18:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:18:18 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022021820.298886-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: nVMX: Fix a (benign) overwrite to a userspace buffer
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Fix a bug where KVM writes more bytes for KVM_GET_NESTED_STATE than it reports
in the output size if L1 is active and has a valid shadow VMCS pointer.  The
bug is all but guaranteed to be benign in practice, as all VMMs I could find
that support nested virtualization just preallocate the max buffer size.

Sean Christopherson (2):
  KVM: nVMX: Save shadow VMCS when getting nested state iff L2 is active
  KVM: selftests: Add regression test for KVM writing but not reporting
    vmcs12

 arch/x86/kvm/vmx/nested.c                     |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  6 +++++
 tools/testing/selftests/kvm/x86/state_test.c  | 24 ++++++++++---------
 3 files changed, 20 insertions(+), 12 deletions(-)


base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.218.g1ec904b173-goog

