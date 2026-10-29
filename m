Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317846;
	b=yxIW2NN4x4XTQ68lfkpAzwqkRc5ggILw2ZMl9/mrhYv4SzLPnOpt8gSqIVvKmlCwbiaU
	 aXYWZ9u/uKNrhl5F0ePGbL/wwoFOz4gvfkCIdMdsiucdDxHMMj5SssDRpUVLWrhE24730
	 iKtsfXSndC9HNWvHsd6wYJ8eX9hfbWgQB6WvbXGImVMAsob/bYuJjVtHcb/iFsZtFTksk
	 XRva71k+Q5Py+Ogr0T0RV1awZzy4qAuY7OmRG1jcvjcmpShKAFi623XUJpFZ0C9+oSpXF
	 P0e1Vq9QzG3douk/0kbrEWlPcstcdkkCjSrQ9Io4kzI0qRGlOjx9f+BDDDfR8v6os/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nieVyMQBbnIomw7dtt1FLb8V7O5cp/p1dlZFIxt1aL4=;
	b=ON/Ah2EjpjEJWgCOORrVPFNIUxefuZRVfExvMjbE/FT6fUCHiOXEvsuuL65sd6KvwI69
	 kLJPHO8CFfMynR8bgE4axazIxYOkJNeMWDPtEbMsQ1Dkx4P5qAhnoqC7ODUNPvjNFm+Z4
	 M7wJgv5yUeViOtSyV6Y+ThDAUuczY43CHjOPfGbsp8giYTwLg1Nq64Yy1VYHmE7ev3/TP
	 c/TG58THluQD78rB7dgET+eXJGR1Zu5TrYe1YNMd2s1hDwYp8TrLj7GDb/R2nbyA7AUxE
	 10N6sK/cl80gM6PRHlHNEp/V3g+s9aVuUTlp+kAvGO6Xe6YGw1jkLPKNe43vdWtFNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZBVSVaU;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8AB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZBVSVaU
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e831e86ebfso891995ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793317845; x=1793922645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nieVyMQBbnIomw7dtt1FLb8V7O5cp/p1dlZFIxt1aL4=;
        b=XZBVSVaUz1t5sGtctyI/6VHDRknPdWzzLoI3t0lEwp5JhaHcb35a9Nwmsm65lI12Nl
         hioDT1PQBE5cLmv23JrzOpZpQg0jfYIge2tG7itstG0M+HF6lREyMgtX78VahrxkIPv1
         7+9Io2ZaA6PxOu5nXUjAU2ye5fkgkvpDJ67fRPz1C5y55rbw79vycy9UDGgO1zPAxWo5
         MVM3xvgwvXX/75ShD5UjZey3OS++RKWmVd3AD5QTRiK9/xDRr9fYIgw/2vnHSi2Nc5oY
         F2SIMxuJr3SGWv1p/Fxmbur65iTQ+2Uv8kqz/Qn2lzQZ5ZWdi7rMV1yAQfilSOL7BDYw
         JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317845; x=1793922645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nieVyMQBbnIomw7dtt1FLb8V7O5cp/p1dlZFIxt1aL4=;
        b=gXvur+ZHDkksbvSKnWho03VTBAILb++m32nSAQ9IIHrWFBXTD48NC4gvcq7uyPcfso
         ZSgm0e+R0owgKfth42yHam6MB0f4o7y9fXlPzStcKANVMFEOzYPXE06PWMoBFRTo5YF6
         m0iW/2sc/fU88K8V8wpOKY8XsLVr7/Fdsjou/y6FGMle7gt17MGsO0NTmtFmLFuJxGV9
         nOIs2dRo21NnYqcZbpHRVmf9kOk4UGlf07wVQZYYEAhiW3ZRC5IV577/pVkAZIZfjaA5
         +erk7pFq55AODxTtIZDnLZiwgRUrsCIDtACNfNCpRoKQ4ENKHHEMqxon3Hmx8Snexjhv
         3vog==
X-Forwarded-Encrypted: i=1; AKwUvBxLQAc0QiVSi6dWhU8TO+maIwjefgyOgEeUYqjvItd4s7RW6sv7JHO9QqW+tdVyUVwR1bprdlfKYwogd5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbDUKGDMvX5DetKE62QeiHmsVPKGILJuQlBfiz879vN4u/Goc0
	qneSLvpMS6nmBaTDaWPQB8CRaPATqiRxQpMG8TO05o855YwD7f8KPkb0FVw/Tg==
X-Gm-Gg: AYBFou0OnsC0Xoz4NpqV3GW0pe/gkyilxWFdb9FrNkakR3MjIlXcakPnNu+6AiBf9J+
	Iin7FD96r8+sCRtJeGYn/16tMxzyPZKu2gMM+2nXToP+qmNYg4A9fkwWZ5qxTC4fk46B43Ga1/b
	6b6OWbmIsPwS9QvI8oYXmGhrIvbkB68g99gZ/hGD+ywsO3ClId7ATumriTdbX+0zsTMpiR5XHS+
	MeRVXi4n5opnuuIVIIDb108ScdJaRjGSuvOyr3F0Bf9t71i74RNLUAa8IRs4bWfBCbwFVZS1eWQ
	LywR3yDZJtaOPIrhfpwjGd83oIVKjEmEwFiOf+qnB0KE4H7uvXRvr09wbsb0V1T3JEr/60giwAJ
	eKDxo2Ifyq6HL8fiZ3nfALv5sgGPpgmUBJz6UDxCFH44uK46SI09718MKvuX2YBSG1BdXB4wPYV
	oDg+Bu6/wbsyY/lynfe0gMK5uEFSaUN3tL7WRj7bZRKkPzbxf+EXllkSLNvRPhMbfxTnPAvcS4k
	aFgABh79IFStyTrG3fhonMpFsPa9QtTUUnWZMfYLmA/6qetYt9LWuElT1XsBUOHYFRDft0fEMT4
	3/zRdBTaVwsLDqWZEnhLXHvepq3T8C8gOaNECmVlca4K1ofpA9dQp34D2Z2Qlt7uEobG8ZhuhUm
	B2oyrqj6CBQ==
X-Received: by 2002:a17:902:f545:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2eb3648a050mr7704565ad.13.1793317845197;
        Thu, 29 Oct 2026 16:50:45 -0700 (PDT)
Received: from monk.. ([2604:3d08:8e80:f800:3c86:745c:97f1:5486])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266f42sm384225ad.40.2026.10.29.16.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:50:44 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 0/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned by L1
Date: Thu, 29 Oct 2026 16:50:38 -0700
Message-ID: <20261029235040.12013-1-ma.mandourr@gmail.com>
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

When L2's LMSW exits to L0 but not to L1, KVM emulates it with
kvm_lmsw(), which ignores vmcs12's CR0 guest/host mask, so L2 can change
CR0 bits that L1 owns.

Mahmoud Abumandour (2):
  KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned by L1
  KVM: selftests: Verify that L2's LMSW leaves L1-owned CR0 bits alone

 arch/x86/kvm/vmx/vmx.c                        | 15 ++++++++
 .../kvm/x86/nested_exceptions_test.c          | 36 +++++++++++++++++++
 2 files changed, 51 insertions(+)


base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
-- 
2.25.1

