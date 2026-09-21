Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0F4E01FB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009281; cv=none; b=ot1j2mkUTNnubv2lQTjKpUroeZyWhtzUZxkDkOvx29QxohA7S9UYcU0PndPj9tvuisXxzsQ/ieHazjIA9VkSCf7wve2DCKVZ6oVnNCGQ2BMOHtehSG+VrCkFiC1QWozirnI/gXWHC9BmC9LIyqXjdCwiGq2ONAeI3boMigDsePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009281; c=relaxed/simple;
	bh=/pOEvHUq5bjsocoido3qq4LRiw3/HY/pteCfDkJrc4o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=d6KU/oQmb/zcil+VwAAkoWlfxovCWazzmARFAOsiLLsVpjr4YWhWVCsbP8sdnmhRduvvDpceAMo2t1WYeY0aKF2WkKqjwoWKRplWqrLihc+iYp14RnemG0qq/RUafGZVSJS6Ugw7V5o1GWZ9Fb67C9w41aTV+yezUT+5TllvPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HON9uAoB; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HON9uAoB"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c252b87e9a2so270424566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009278; x=1790614078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=;
        b=HON9uAoBJWgaLG5fuBh5hwfcTQxSmBdbW8U6k4uSf8xjXO3swti2YeX1ijtEjJG5Rf
         g/+KrYJXOgjBXnqeg1aREMl8kh1f126wpLgX0xL7QZvhjzjND6mTDkg7sO1ffIQ6JoDf
         FyknA3Wyfilv+yeSf6FgSEWKaNBe2ZqZ035y/OYhxDmVRV4Urf566AIv56XtpGiOSbNA
         DXyz8U512YguAyAey6tsM1mJKTnwdulLL3Dj4c6YsgB6ZjRYgIw3nTuWWsokShkWG+b6
         jEg8Z1fi8q+i6CX7I2cJJmN2z2UnBcUpsfS6CZSjaig9c+ff4UMU4B4I1AAc7zK0EwHV
         vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009278; x=1790614078;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=;
        b=f4Uzeng6+9TJlqt9VmRvW8vDI3g1Yl2Gx12mU8bpW/j5TTc5DzAI8uvKUyKpOYXVZD
         In/A0lHqSggE7NVB2AUD7qiaySLc4MlzpUBV8YXMMNpbkEWxyD7px2mwAI3BpJaaJ5bP
         m1aVBhXcZwpEud9Z900waEC5IIrfucFcI31wDO5BCoTvjkMATRXd6QhYwu9MD3MmT0/b
         HhbjoWnRvphmnWePA9CmRE5IXwci6lljkayJIU7VaaTIolJ2TRE8W4+AaMp3LNtxIvOr
         B/oFdXhaPSWfV5Ss3ds/Tu0ez9I35/k7VgTYip1VSZmJMdiWDlU83neORBMB69IBnyJE
         u8Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxexWXiuXIQca8e1gbSDE9GRi11YxXa0VsH+7a09RlsEBnRyFVFZCyIWE5WIGQ3UDO85CGyj++DgQBaNbE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpLUixUTDaIF6w40P0ZN2rq/IWnziZD6rPi5SclH9r3W3R8ggp
	EPj/l8d/3s2m/6vRc3Q1X2XaCRg6GT0uSgi6HpPseLUVL92OnpJ6HVzDRBxd4fzGa9DUdy46+Fg
	HRXdTVcpiEcpG7OLvenIbsqJPBg==
X-Received: from ejrs22.prod.google.com ([2002:a17:906:6c96:b0:c25:19d1:3b10])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c2a156a963cmr1038418866b.17.1790009277272;
 Mon, 21 Sep 2026 09:47:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:47:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921164748.2958578-1-snehalreddy@google.com>
Subject: [PATCH 0/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 ALP5
specification (DEN0140 rev J) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

This series adds the FFA_FN64_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

This series is based on kvmarm/next, as Patch 2 uses
ffa_check_unused_args_sbz() introduced in commit 3e9df0b0ebd5
("KVM: arm64: Enforce strict SBZ checks in the FF-A proxy").

[1] https://support.arm.com/documentation/den0140/j

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 117 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 118 insertions(+)


base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
-- 
2.55.0.1082.g2b9226bbc0-goog

