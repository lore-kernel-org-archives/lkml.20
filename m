Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556769;
	b=LwE3zoGrp+kAk5om+TLQ5F8YiWKxdvnInTLsR7HoQkCyNKDVH5/v0sWRVdNTEGqcZ8wU
	 YDOCLNTcpzdhdBsc2cCJMW0yo9U4rMBtFUVc4+8naS+kVWHZmQ2GcCndFhHMtuuFb9zKK
	 0XGIiWSSNXUoJqgtbDhdj5Dl1KFCt+fiH0LhBoe2Iz0bjvVllkvkuD6ajMocNf3d/oVAR
	 ovCOGZ4u3hl42usKY7zXxGcvWJ6PcGdtZe1Yq/Xb4fnIELCGAsazE8m8OeNw5aZtLLj/r
	 0mLsxnyGyo09B+aiMALJ+FTMR1bjh2ZprO08yxuHMmSJcpC5rT1jjhkwKbcDoJXcwCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GjO69g/qQtk0fhS+p3Um2hWP5ehoABiLkMaS6vGdYSk=;
	b=BPSU8x+LEPolJaELfmLCI/qZGqwqxS0vC/TQdse/5soAktOVXRjvggTSo4bQVM5d1a5H
	 7NkkHbhJBxFPY5RIlngqa0vudJ5kkeVeY6T1lNIgZjawXS0pCG6Ag4AIaoIJg8gdIIZks
	 auG+hHywn5WaKKnMGFtnX2F6yZkLwAMPf1qcNfktHYn92Y4+jgyPX5g47dBW/l35Hz8oE
	 F9MB3geZ+CBf8Ur3jw9Nf3GAJSNwg4F6LY/J2joxjFlm3UOsfUGtjLT2R+iG3xFYWVIV3
	 7f3Iur3SFSQ0F6HUf1FH7k26LEgnsqDI4JbClZC+M0AZs7ZQNRJV8hgqTROfaFnfGHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LpkwTUjo;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3AC606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3AC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LpkwTUjo
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so201585a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792556768; x=1793161568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjO69g/qQtk0fhS+p3Um2hWP5ehoABiLkMaS6vGdYSk=;
        b=LpkwTUjojXhv/QKYxnvHgu9CcdOQChvgNEt3TbKxXBBs9a9SnewO1wDzwOTWlq9fHf
         RqnEJJwgeQj9KW5q35dZ6t0BGC8MmVtuExz6zfDAbgbYmIOfS7AR8O1UcTXotBuMF03C
         dD0QrN80hRoM7/KffonT5PAvoOJr0+bvK0i3EEubMJAagn1irbtUsLTX0Tx5MIYBzisD
         Z67AbktIajf2DRG/wgQ82UhP+PBjloEUDVyQucty1UAcIb41jLqNWJDrkDKW2DkKbzac
         Pwb0e2EClsN42tY3zLf7VCKSJL5Q7GFvUBoSBZEIZF11v+f5Az8RSFdpvUnYIqVKRivV
         HJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792556768; x=1793161568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjO69g/qQtk0fhS+p3Um2hWP5ehoABiLkMaS6vGdYSk=;
        b=uzJuFQ/tMnkKrx8ogM95N6q8h1D3M2wS5mtiplFu6JinVnWavfqF7fxXtGT7ewt3QK
         GjbVMCjhIsCAt8LO4Eg5tNJ9H/XbkU9ouW3z40q7Ha9KP6b3ilF6LePetbzU3HdXF08C
         qXzovgkH6PZ0Cp2svmIpRKFGZCZYXRDDyWdJNPDclJUIjeMU7CXlN2H0NciMNEoj4G+g
         vxMbWslZVdXCHN2kD8RSxXqdls6qa7TwLGe8JmBzXnuvX+XRLaMuJQJ1/UQJP59i4pl5
         YO7UncoDwarpfsTpI2sHOfQxhhAqkqQyMZGkEzM7q8Q1pRrLn1yP3KrosydBOZAa+qp/
         cUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX5tWrfbf4JX8sEXmaAzFnCUTjL9kkGaC4n6n5JICESw0N+5md0TfC78KWzQEQu7RakCT1Mk6FG8yuDVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhSNPRk+hZcAg3cwEDpQumql6Q5lQVL0sx++H/SMsjlFnBosu7
	BHbEo6RjyxOnIO3KFlBo/pg/DgQZhqc9H3XtYtJaMstwkK+TpO9A16SI
X-Gm-Gg: AYBFou07Mw/SLndRRL13/CmIXZ0qy96XhzI5gUbr+E4l+m9qzNjgLXvlXZti87EwWt6
	pG4EBfATOdOMzqCOHCgMYg3bTWxKIiA8BazlU9282bzy9bkjOvKAeYVFOf9mS2+Xf0KB8p7vgL5
	GAOQt4dltxF+KJBbeuui1aAoMgr4a/eZuap9w21clYMvV2EL2qZvIs/SuXxaXxWWe6DlnmXpZqO
	x8JEOX2dLxHwDd7Bdt7vPRAAhk6LQWTjUghWEZt3iGAo8qT7N4yeJH8g/3iTTZW+eJcJ2oVVMXN
	I5K3Xdj1CVWlDI4JQemDiYm6W46bjKnwI7+Afjzc5TkXm3tBN/L7aG7b9ucffaKQfA8l42bl1Vs
	Nm3oTyRr+41Jx0wW086olZizuCKZ6SjgZZg6yBCGvu1YQj13oG1uZ/RugKZZTraPKJfBWOlYNaE
	lqgpb0XNqItUBOGjIyVEYdYY18ghhRBgk71aDG7Ecm8cULhBryP7AUhjKh0WYzF6jPf3fQj6PLk
	pxhxMUG5SRLc/m1fR/Btc2HicRlE/NMvo9yf7GzgatDASMDyRTDvzmRR+YxoVLeQ5lREw8yfeWx
	XB+FQ0A0v2VdBCc0wnNeFa6Iob9vl5WAdM2illOqlIBlur7XTbc=
X-Received: by 2002:a17:90b:574d:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3ad86edd525mr820650a91.35.1792556767866;
        Tue, 20 Oct 2026 21:26:07 -0700 (PDT)
Received: from monk.. (border-p14.nat.sfu.ca. [192.75.244.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80219f83sm2355155a91.6.2026.10.20.21.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:26:07 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 0/2] KVM: nVMX: Don't clobber VM-Entry instruction length on soft INTn exits
Date: Tue, 20 Oct 2026 21:26:01 -0700
Message-ID: <20261021042603.608292-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

KVM writes the length of a soft INTn that L2 was vectoring at the time of
a nested VM-Exit into vmcs12's VM-Entry instruction length, an L1-owned
control, instead of the VM-Exit instruction length.  Patch 1 fixes it and
patch 2 adds a selftest.

Found with a fuzzer for VMX isolation. The selftest patch was written with
the help of an LLM coding assistant (Claude Opus 5.5). kvm-x86/next was
run as a nested hypervisor under QEMU. The selftest passes only with
patch 1, and other nested VMX selftests are unaffected.

Mahmoud Abumandour (2):
  KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft
    INTn
  KVM: selftests: Add test for nested VM-Exits while vectoring soft INTs

 arch/x86/kvm/vmx/nested.c                     |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/vmx_soft_int_vectoring_test.c     | 105 ++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/x86/vmx_soft_int_vectoring_test.c


base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
-- 
2.43.0

