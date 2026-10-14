Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD64D09E6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017780; cv=none; b=Qo9Jmj1dtQc4+ARaSlaU97kBBnmRDkNOorgN8Jyv4/q1LsGx/FV+c6Edh2CzWILhY9CSeO7+1inxnlI7iRe2Ah92n8ZmXVhwq2PUFuWKeVbYl3pL+jNSNSeHfY7ZXQIRoNq9w0ZxjL9PaC+pIFu3fY6bVN1u1T4igbgbgIY3hOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017780; c=relaxed/simple;
	bh=wT1o/FxZXPCVJocG+G7v9/SvXhoQPw/SLYSAZuA+Cwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTvpt4QNbpX3QbJUl+o+4sNXGuOaOxbBcvwL0shHB4cHvDEhm+5r567lCwy6xYrh+PNRqfHEMhZRz353kzpHDiRtX22bm7kzPaAGGxDWtJbdOkRGZIymrz53fiRUMg1gbyRq8EkA3abgG6DrJ1hSFAJHt8u26xsHvJzBgIdQeTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=niqo6s7J; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="niqo6s7J"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 568EB3F98D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017773;
	bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=niqo6s7JV3DzifgjIMIUc6721jR22ik9S7gOFQzGVKeohuQQDCx+v3qimP0V59JCa
	 7wfIUwxDPfCPBVZ6XpR7GRs8Cn1vl11lQSeGLIdyO7P4uHaxKlvlpeoG/EPko6tjnX
	 cCVXJf8Zic5ctK55l1aYFieBvyiDuUhWzMr/HUbgtiw732IYssCLhgX6MDdLRB+U1D
	 sOqQV2ztmw/7ygsFpaZWkqyeKIxMFkFQow9Hdbrlxt7oCyXMRGA8A8XqDRCciDSa2k
	 mbmegdFk0lMDUXm9wypk3SGNrTfaq0S2GfFmlB5mEKB/Iuh2/F7FDXr2g0RGj422hJ
	 57yGssrnUIRz0nmH+hxeEg6rtMP37OHO7JdL1NPLQXiJGJTnnOWhG808GOUK8ECEYy
	 /V6dRSwKZZMJUv9UCprnOfwApg4LeZ/nO1PgG09RvDfNi9cW8e6rrr5D8D8F88iSpd
	 jz9ZMKOZZLpMzp4osSUqwr2WXSvML1UO4visd6xCcSKLRavafOD3D6CIrySSS8fwl5
	 Bgf3hoiE863T9qrECnOqEyyDbtIHRXNioVNheLYFx5BAVm4KvlzGFAr8q3311JgGDX
	 cDVHFT0w3cVFRfShRTZB3vHl5cv98Uqo5E9hD0anHbbUE8+t17ersJEFcEN5cQ+moH
	 LROZymBPE40opYBHRldgE4OA=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1ac6663e1so21103525e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017772; x=1792622572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
        b=IA1IK9LhVcU2cw4CwIrznvnjHNdMp39t3KV3tJvo3HQzUXO6L87EpTPIorHZuBtDo7
         51pcHv/NLo8hSKs9LyrABx8pLegtrkPLVA/owoKlr3xwvaElXfDNLIf7tjIfcZi8UBu2
         NLPyJE3NiuQmqOpirb+ooxCqFoYF/gs1uqxyGXSBiz9vQUJEinL2tE9FM/9W8QG47RjO
         9W7XXlA3+p8F/3O2Id3ZqdN4RgqSGYNTjuBlGLZu84EMsCR19d1zUBgVH+nI8yQ0woYY
         Cg7YN5bHPjVPQIfO2s/RIpaqAeynD6UTR568INDz/OZ79RDqBwV+yZkcid3ZSKZoPPy2
         a7Eg==
X-Forwarded-Encrypted: i=1; AKwUvBy45j0Y2ExtlIbMWEOnyoyI20gXtCZvbh0XlstYduWE61WKCSl2zKqvNM8t+KG05QfprrTJbtc9AbMdCpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPlWlZ8GNjZHpilFJJkOOM888a55kG01Sp3KF0cTGB4E6LTZCy
	fVE+DgQFhK+/6d/jaWmHQTiZDGmD7a3YVUSEpLJzxPpEdZ8+1tgfjvsRE7WfL41GlSeFDn+7i1P
	rVWjlhJTv/8DkWFTslytWdRNAApp6g/uipNATFtPmpZ7LAesdUTZ3hRT2AezSaYrMz7l92qtTq5
	+rRZtOgg==
X-Gm-Gg: AYBFou0rf0RAbx56VFql2HZqj4CP5E1HjttqfQTV9I94FLhxL5R7biPphqwgsiEpU7D
	UvPn+pOSuL2GDPvuKgieclOqdH5UbuB6ixciuIfzxKNrXnb/17l4VBaagrMuhXNQ6CU53lccuNf
	MF7k353YHyf9uvBkYYonB7T5p2dv8CctHM4oret3cdcyFMOeSRXOrXccTBwBHVggQGuoEYxvYKB
	zlM2DhJCuqqfVtWQTxj+ZWyp6/1KQUvahGCWxFqBQHDPNed+LSSHISoVPI3qNpdESucL1BZ4Nk2
	yfNvVqpwZFFeigkJz5uNSPotxZRHmV2YRFEB1xtuTiOseqrIjhZNS04XXcNaycYlzBos0Rp5u67
	mqD5Dwt6GtyTZM8YcsIq73jm0lWlhNro8SlKRenTciitrQc/GQuFqGg9Q
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079925e9.6.1792017771979;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079785e9.6.1792017771721;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:37 +0200
Message-ID: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Add the extensions to the get-reg-list test.

Heinrich Schuchardt (2):
  RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
  KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

 arch/riscv/include/uapi/asm/kvm.h                |  4 ++++
 arch/riscv/kvm/isa.c                             |  8 ++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

-- 
2.55.0

