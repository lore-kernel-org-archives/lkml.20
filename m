Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE92F12AC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102623; cv=none; b=jH5S5rrnH+Up4TesMmf4uSxuWqorZQW4ArVYGO6Cs5RhMiUp7ek9wU7joPJG9/ArqWD6e6jwxdby9rUD83FdBL+2Z8C64ZroOQEc/mJvW0+jwW5Nfm9VDruG0nbHX/vr3JN5bWIsv61Z/GX8cJzbg/LyZtTGXOo95z5cSXgJw8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102623; c=relaxed/simple;
	bh=KEpBOaijdHjRczOFG95mGYtz+2slQUVveTGFA7ZfiKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lfo+2lHeGQm+3jVQMudiJ5FmXIHaTrwcoTTWvbjzipSEYEm8j7IWjPRlpeTmUUr9nTMfNf1xw8vL/HwyS1tKbZe+5gm/YzX2E5nf2GvPz3O+oF6uokfxfMy/NUaPc/xgoCiPHyX4/yT/ojFOVwV5fhR8BtF5dZZveoyrRfz2K7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdKHO6YB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdKHO6YB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso621010a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102622; x=1789707422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS+NnjQVu7GC8limcyn1Ri+jiI6RVFD9z3vzk1/dCDI=;
        b=pdKHO6YBbs7hTAYzH74yd1R7XZxxth62037NVQhTlfrn0xm/A4M9VxbUxP/SN7jogl
         JACetZsRbEBwSW8sXB3dXOd3Ofp+4ANndSk7CyAlMbq1wt1w1nuiDuUfCgv1XBcLNI6T
         KIKzeQYmV2Ti6f1I0hWSW34hLy+4zzL9fRT/HLXlDNxWZgPFj72IH6cy/bYNYz9K+XjL
         zo61/IhKLbEfCfLO4tpXfBYHg12Hmcfb0ddb9Cd6/mK6eTzBpO7ZOKccRZSjwM8SRBh6
         xyHsghs2yH4ymDNcD2Y94ftDgSoSR4GhK8mIxV21FhCPvTzokDhMnVSBMyDfHZzW37Kg
         0Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102622; x=1789707422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS+NnjQVu7GC8limcyn1Ri+jiI6RVFD9z3vzk1/dCDI=;
        b=kvNtHLKGpmN5uYGe+KYv0igCnEl15RccfmOo4Bow1dqt2F6Vp6T1hQl2Oi7U4Yg5Bs
         QbieSyx9TwvPAEVENE3gUiu9vQ4Tzz5d+8qL1e2R6/KLaTCw+1ucJETwvXBp6Kq0wgPr
         degKi91UXFIJ27/ZcreC+Gz3+bRGIW9J/JDqA8e1AggetXFaKGEigcybXdEeNzyiyVL/
         0Pqbw94tR6wmpmra/mOy2UFWOD0N4AeaKBY6EV679b6sP5g5FpQsjvXFrESYsCMKvd9F
         OQPqpnArjECP2OSEdrY4KY1tsOZzDrwzp5e2/NlXF1dJK106YA+4kwcGEMJey3/q8wmR
         4t2g==
X-Forwarded-Encrypted: i=1; AKwUvBwUpcyF54lT+3ixbvSnyPNl7Xb8JssPeVkW6KjJv6OB4aeD1MYr4dnNEY1i3GpzPg9A0gdI2tz3SggiKNk=@vger.kernel.org
X-Gm-Message-State: AFuF++kPPJf1A0pT6lkDKyWjSaaaQuZKt/TViuRt7x+l5Wo1+2R76PhD
	wYVXa9yE/oB6EmQxQvVaHNMAX6Sf00ZCcZxENHEq6dZEVGm2OhyNyoht
X-Gm-Gg: AYBFou3ewz5IHar/ojc00o8ZfReSIyk5+5z47NLx5OaG/hIarY+h4aIacVlbMZo1cEW
	oi/sQhCdpo1udXL/F1BLPeEjN60OvmUH002mTZGqXQk40Q5hx3bp8dXHYN/RgUKmOT6jlQmTmXp
	BCk6hQR3JZWtQVEdck+Y3bmdFd2B3ZWe4DcUdFVa/BxYR3VZZS23wAKXbETj55Bf3sa2ipQcJNc
	CE3KoOYiwKHEdhoWFiNgNANNGLaarSXFVMn1Ugl0sqgUfMErCI9kpAQLYZwwIL2kMy1Ir5UjPL/
	NyevJyYAr6YZYEM/6zx29D5Rvmnf1uRLjPCtnSy5vjXvUkP0MFMtzaevi6Qa3wrSLi9eYTSyLjg
	pwrgwq6bVhY9oNYOQquRAzO2QKPEvut8TbtzotLTJN91QUpZZYM6bWaR4r1lpTyG/27BaJGjU48
	cZ/VDfnA4098WEAjl5G/mchh/XJNhjTQavhuqOaDwT1WYM3T3TuNaKzS5wi99tRJTG4+/9T0ttl
	gy90FNiaXVTncvmUNV/P1oee/FuFXUSyVZe1aZeFQSu3N620EiAAOB7S/3lCt9flbWlvhaR
X-Received: by 2002:a05:6a21:6f88:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3daed20aeabmr4999468637.11.1789102621767;
        Thu, 10 Sep 2026 21:57:01 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm2837953eec.12.2026.09.10.21.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:57:01 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 0/3] KVM: PPC: BE guest-exit fixes and nestedv2 vCPU limit
Date: Fri, 11 Sep 2026 10:26:44 +0530
Message-Id: <cover.1789099725.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These issues were identified while adding kvm powerpc selftests infrastructure
support [1]. Patch-1 and Patch-2 were identified while running the selftests on
Qemu+TCG+powernv+BE, while Patch-3 can also be reproduced on a real pseries LPAR
with nestedv2 capabilities.

[1]: https://lore.kernel.org/linuxppc-dev/cover.1789097569.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (3):
  KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
  KVM: PPC: Don't call __ffs() on an empty pending_exceptions bitmap
  KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit

 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s.c             | 22 ++++++++++++----------
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++++++++++--
 arch/powerpc/kvm/powerpc.c            |  6 ++++++
 4 files changed, 30 insertions(+), 12 deletions(-)

--
2.39.5

