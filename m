Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F03BE646;
	Tue,  8 Sep 2026 20:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900701; cv=none; b=VmjJOfXahCeDCvg0USZ+iR5WZDsj2UJpT0qZhn5dFKg1S15ozLPjvgdpVwstAHZg+UC8LgOGkDtHXWbJ/LYMm94EatvDTZPTwr1ngXRr6IpMfYPrgiZoh/QKC7KOILhK/KLQhqhTTFb9HqbUUCxQ/qcBc4Z+mgmranAOZvDyYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900701; c=relaxed/simple;
	bh=7pS0Ib0y8amdcnIBOGqHRP6yzIZUH8BCX09Qir8Q3Ac=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=lytPkxcM7blt1wzFWgLMSomQM+9tWMbc1iK2rttixSdEnrICxrNozz05+bYsBqD6Evik0HGJafD2p7Pjyh/4tIZvSxJNW0YwiITHaARinhJHgPc7uTZ9CboMVcUJXbG/SmZyVIeagSwBETaeM35ADfM8VpNsMp6MmiO1iSCllOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=krdk+bd1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BpKhRUls; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="krdk+bd1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BpKhRUls"
Date: Tue, 08 Sep 2026 20:51:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900697;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKd54/CrYZCr7bCmtJqap+BL3n/H/Z06EVB4jzo4pP0=;
	b=krdk+bd1XdgZhPMCjYRT66q8KWQwg6zqw3xZ6JI+YQnGTciehVeGqYYZLbnZKJioWDfRvC
	C/iH/d+dF5u4rg/wCg8BSN3Xb4D7KrhQ1GUoVrrx/l3yssgpPVm/fU12cdjzJo9Ipg+4OC
	8MwnP3rNYFu6UopTg5y5/k11vncWck9dwFN5apgO5UWUuemtjfZlObp1XaKHqlXZbH6p2H
	YTesnsTYoNW8P1LyLimZlAXGXSF1RRc7BCmdaX4sxtmdGGBoKTy+c7C9jKeU0IOdC5CkkL
	F40/s/7vbtUzyiNXVHAEywaUIlwtgXumigGr5NDssyM6pYyhSaaOuhF9pXZt2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900697;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKd54/CrYZCr7bCmtJqap+BL3n/H/Z06EVB4jzo4pP0=;
	b=BpKhRUlsX7bOBHOXVxgmHBnrlxXq/WJVxLR4BbdZSZwe0Pg5Mba8Tb7D/Hc4F3uTDpmZIY
	weYeq5XR5hYx/LCA==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf: Enhance perf_reg_validate() with simd_enabled argument
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-18-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-18-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069594.623050.15707792824078462558.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     a2c64c74c02957ca11975b5355e70210f7b934ad
Gitweb:        https://git.kernel.org/tip/a2c64c74c02957ca11975b5355e70210f7b=
934ad
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:25 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:45 +02:00

perf: Enhance perf_reg_validate() with simd_enabled argument

The upcoming patch will support x86 APX eGPRs sampling by using the
reclaimed XMM register space to represent eGPRs in sample_regs_* fields.

To differentiate between XMM and eGPRs in sample_regs_* fields, an
additional argument, simd_enabled, is introduced to the
perf_reg_validate() helper. If simd_enabled is set to 1, it indicates
that eGPRs are represented in sample_regs_* fields for the x86 platform;
otherwise, XMM registers are represented.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-18-dapeng1.mi@linux.int=
el.com
---
 arch/arm/kernel/perf_regs.c       | 2 +-
 arch/arm64/kernel/perf_regs.c     | 2 +-
 arch/csky/kernel/perf_regs.c      | 2 +-
 arch/loongarch/kernel/perf_regs.c | 2 +-
 arch/mips/kernel/perf_regs.c      | 2 +-
 arch/parisc/kernel/perf_regs.c    | 2 +-
 arch/powerpc/perf/perf_regs.c     | 2 +-
 arch/riscv/kernel/perf_regs.c     | 2 +-
 arch/s390/kernel/perf_regs.c      | 2 +-
 arch/x86/kernel/perf_regs.c       | 4 ++--
 include/linux/perf_regs.h         | 2 +-
 kernel/events/core.c              | 8 +++++---
 12 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/arm/kernel/perf_regs.c b/arch/arm/kernel/perf_regs.c
index d575a4c..838d701 100644
--- a/arch/arm/kernel/perf_regs.c
+++ b/arch/arm/kernel/perf_regs.c
@@ -18,7 +18,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1ULL << PERF_REG_ARM_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/arm64/kernel/perf_regs.c b/arch/arm64/kernel/perf_regs.c
index 70e2f13..71a3e02 100644
--- a/arch/arm64/kernel/perf_regs.c
+++ b/arch/arm64/kernel/perf_regs.c
@@ -77,7 +77,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1ULL << PERF_REG_ARM64_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	u64 reserved_mask =3D REG_RESERVED;
=20
diff --git a/arch/csky/kernel/perf_regs.c b/arch/csky/kernel/perf_regs.c
index 94601f3..c932a96 100644
--- a/arch/csky/kernel/perf_regs.c
+++ b/arch/csky/kernel/perf_regs.c
@@ -18,7 +18,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1ULL << PERF_REG_CSKY_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/loongarch/kernel/perf_regs.c b/arch/loongarch/kernel/perf_r=
egs.c
index 8dd604f..164514f 100644
--- a/arch/loongarch/kernel/perf_regs.c
+++ b/arch/loongarch/kernel/perf_regs.c
@@ -25,7 +25,7 @@ u64 perf_reg_abi(struct task_struct *tsk)
 }
 #endif /* CONFIG_32BIT */
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask)
 		return -EINVAL;
diff --git a/arch/mips/kernel/perf_regs.c b/arch/mips/kernel/perf_regs.c
index 7736d3c..00a5201 100644
--- a/arch/mips/kernel/perf_regs.c
+++ b/arch/mips/kernel/perf_regs.c
@@ -28,7 +28,7 @@ u64 perf_reg_abi(struct task_struct *tsk)
 }
 #endif /* CONFIG_32BIT */
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask)
 		return -EINVAL;
diff --git a/arch/parisc/kernel/perf_regs.c b/arch/parisc/kernel/perf_regs.c
index b9fe1f2..4f21aab 100644
--- a/arch/parisc/kernel/perf_regs.c
+++ b/arch/parisc/kernel/perf_regs.c
@@ -34,7 +34,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1ULL << PERF_REG_PARISC_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index 350dccb..a01d8a9 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -125,7 +125,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return regs_get_register(regs, pt_regs_offset[idx]);
 }
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/riscv/kernel/perf_regs.c b/arch/riscv/kernel/perf_regs.c
index 3bba8de..1ecc876 100644
--- a/arch/riscv/kernel/perf_regs.c
+++ b/arch/riscv/kernel/perf_regs.c
@@ -18,7 +18,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1ULL << PERF_REG_RISCV_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/s390/kernel/perf_regs.c b/arch/s390/kernel/perf_regs.c
index 7b305f1..6496fd2 100644
--- a/arch/s390/kernel/perf_regs.c
+++ b/arch/s390/kernel/perf_regs.c
@@ -34,7 +34,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 #define REG_RESERVED (~((1UL << PERF_REG_S390_MAX) - 1))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 87297da..494e065 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -198,7 +198,7 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 		       (1ULL << PERF_REG_X86_R14) | \
 		       (1ULL << PERF_REG_X86_R15))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	/* The mask could be 0 if only the SIMD registers are interested */
 	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
@@ -218,7 +218,7 @@ u64 perf_reg_abi(struct task_struct *task)
 		       (1ULL << PERF_REG_X86_FS) | \
 		       (1ULL << PERF_REG_X86_GS))
=20
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	/* The mask could be 0 if only the SIMD registers are interested */
 	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
diff --git a/include/linux/perf_regs.h b/include/linux/perf_regs.h
index 518f28c..09dbc2f 100644
--- a/include/linux/perf_regs.h
+++ b/include/linux/perf_regs.h
@@ -10,7 +10,7 @@ struct perf_regs {
 };
=20
 u64 perf_reg_value(struct pt_regs *regs, int idx);
-int perf_reg_validate(u64 mask);
+int perf_reg_validate(u64 mask, bool simd_enabled);
 u64 perf_reg_abi(struct task_struct *task);
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2f84f50..e053d8c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7823,7 +7823,7 @@ u64 __weak perf_reg_value(struct pt_regs *regs, int idx)
 	return 0;
 }
=20
-int __weak perf_reg_validate(u64 mask)
+int __weak perf_reg_validate(u64 mask, bool simd_enabled)
 {
 	return mask ? -ENOSYS : 0;
 }
@@ -13804,7 +13804,8 @@ static int perf_copy_attr(struct perf_event_attr __us=
er *uattr,
 	}
=20
 	if (attr->sample_type & PERF_SAMPLE_REGS_USER) {
-		ret =3D perf_reg_validate(attr->sample_regs_user);
+		ret =3D perf_reg_validate(attr->sample_regs_user,
+					attr->sample_simd_regs_enabled);
 		if (ret)
 			return ret;
 		if (attr->sample_simd_regs_enabled) {
@@ -13836,7 +13837,8 @@ static int perf_copy_attr(struct perf_event_attr __us=
er *uattr,
 		attr->sample_max_stack =3D sysctl_perf_event_max_stack;
=20
 	if (attr->sample_type & PERF_SAMPLE_REGS_INTR) {
-		ret =3D perf_reg_validate(attr->sample_regs_intr);
+		ret =3D perf_reg_validate(attr->sample_regs_intr,
+					attr->sample_simd_regs_enabled);
 		if (ret)
 			return ret;
 		if (attr->sample_simd_regs_enabled) {
