Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B823D75AA;
	Tue,  8 Sep 2026 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900720; cv=none; b=TNMOFFwfaeHfB504NlwQLkK52rhkzolPatBlibnC0zOkmSggJKMm0BmdBAolscoLA0l3/OQt5AuKXLnbwbNXJODx/9SpJGgX5wHJTj0FWCipDWveSYFP7hSTn0AOcfSPPQ6dyk51m34toYfnux0biZZyCma+ArBQBsapq/1kBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900720; c=relaxed/simple;
	bh=awznwoBgsxR7yZSiegpH8zXwi/n3vJ4PFmor4pIHfEA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OwnJNj3/BzJgnTPeaqSdmENT5y+3SiS0mbsOQDHyw0yKdqL3Bz7+PHku/CehwyHiVVMpVk/C/0jkNC5DYfWqiv93g2VLhJCv7CbOjh89ZqcaQhv/tfLER2qiXJf7eyhw/WTak9PzLKwrbHp3wvxmG1eF1kBlXb9JDTyAeRp8s9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mIsr5zvv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kFmfJuuc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mIsr5zvv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kFmfJuuc"
Date: Tue, 08 Sep 2026 20:51:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900716;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Jla1iB9GEaNomnWQIbn74De1UXZykq/Aj9jsF0u6sQ=;
	b=mIsr5zvviURC7a0wSgB8zxe/U3LJxBni03OBMcjktzDA3xSqhp/8e9s6AFkK22UuT62uh1
	CmgRH8qMJFWG+WBHXS6KoMhIUX2xCFNM0jlzCennRiW1xKHaYwqnJJmhQyIggrbjP+QDD+
	kmJUoKqpMa4IV2c3Nopc5yBE73Y1uhNp4ZWlyyg3rupKdwqQecIjATJlSwSt3zrNvJ2Aza
	2pGianDvXKVrj1ifb3PRPLF9HLB2pNhMG/BgeYB0/PFOI29hEngFDm8jpktAL2gicgZztX
	FCRgpgDT5fqhyc3lH3F4tx8SCP1h/egL8ThOhO77HUyU4Gu7WwPvWFMu7j3yig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900716;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Jla1iB9GEaNomnWQIbn74De1UXZykq/Aj9jsF0u6sQ=;
	b=kFmfJuucu5zfIcYYV/zO3z3Gx6H54tOPuyoZkQjkWuOr0xwLs8dhSv4jeWyxLfzacRkqMG
	0KLT7WJWfuxp3OBQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf: Eliminate duplicate arch-specific function definitions
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-5-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-5-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071532.623050.2445991162971344044.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     cb388bd530cc518b0e245fb4eabc40f3de538e4f
Gitweb:        https://git.kernel.org/tip/cb388bd530cc518b0e245fb4eabc40f3de5=
38e4f
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:12 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:40 +02:00

perf: Eliminate duplicate arch-specific function definitions

Define default common __weak functions for perf_reg_value(),
perf_reg_validate(), perf_reg_abi() and perf_get_regs_user(). This helps
to eliminate the duplicated arch-specific definitions.

No function changes intended.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-5-dapeng1.mi@linux.inte=
l.com
---
 arch/arm/kernel/perf_regs.c       |  6 +------
 arch/arm64/kernel/perf_regs.c     |  6 +------
 arch/csky/kernel/perf_regs.c      |  6 +------
 arch/loongarch/kernel/perf_regs.c |  6 +------
 arch/mips/kernel/perf_regs.c      |  6 +------
 arch/parisc/kernel/perf_regs.c    |  6 +------
 arch/riscv/kernel/perf_regs.c     |  6 +------
 arch/x86/kernel/perf_regs.c       |  6 +------
 include/linux/perf_regs.h         | 32 +++++-------------------------
 kernel/events/core.c              | 22 +++++++++++++++++++++-
 10 files changed, 28 insertions(+), 74 deletions(-)

diff --git a/arch/arm/kernel/perf_regs.c b/arch/arm/kernel/perf_regs.c
index 0529f90..d575a4c 100644
--- a/arch/arm/kernel/perf_regs.c
+++ b/arch/arm/kernel/perf_regs.c
@@ -31,9 +31,3 @@ u64 perf_reg_abi(struct task_struct *task)
 	return PERF_SAMPLE_REGS_ABI_32;
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/arm64/kernel/perf_regs.c b/arch/arm64/kernel/perf_regs.c
index b4eece3..70e2f13 100644
--- a/arch/arm64/kernel/perf_regs.c
+++ b/arch/arm64/kernel/perf_regs.c
@@ -98,9 +98,3 @@ u64 perf_reg_abi(struct task_struct *task)
 		return PERF_SAMPLE_REGS_ABI_64;
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/csky/kernel/perf_regs.c b/arch/csky/kernel/perf_regs.c
index 09b7f88..94601f3 100644
--- a/arch/csky/kernel/perf_regs.c
+++ b/arch/csky/kernel/perf_regs.c
@@ -31,9 +31,3 @@ u64 perf_reg_abi(struct task_struct *task)
 	return PERF_SAMPLE_REGS_ABI_32;
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/loongarch/kernel/perf_regs.c b/arch/loongarch/kernel/perf_r=
egs.c
index 263ac4a..8dd604f 100644
--- a/arch/loongarch/kernel/perf_regs.c
+++ b/arch/loongarch/kernel/perf_regs.c
@@ -45,9 +45,3 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return regs->regs[idx];
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/mips/kernel/perf_regs.c b/arch/mips/kernel/perf_regs.c
index e686780..7736d3c 100644
--- a/arch/mips/kernel/perf_regs.c
+++ b/arch/mips/kernel/perf_regs.c
@@ -60,9 +60,3 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return (s64)v; /* Sign extend if 32-bit. */
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/parisc/kernel/perf_regs.c b/arch/parisc/kernel/perf_regs.c
index 10a1a5f..b9fe1f2 100644
--- a/arch/parisc/kernel/perf_regs.c
+++ b/arch/parisc/kernel/perf_regs.c
@@ -53,9 +53,3 @@ u64 perf_reg_abi(struct task_struct *task)
 	return PERF_SAMPLE_REGS_ABI_64;
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/riscv/kernel/perf_regs.c b/arch/riscv/kernel/perf_regs.c
index fd304a2..3bba8de 100644
--- a/arch/riscv/kernel/perf_regs.c
+++ b/arch/riscv/kernel/perf_regs.c
@@ -35,9 +35,3 @@ u64 perf_reg_abi(struct task_struct *task)
 #endif
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 624703a..81204cb 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -100,12 +100,6 @@ u64 perf_reg_abi(struct task_struct *task)
 	return PERF_SAMPLE_REGS_ABI_32;
 }
=20
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
 #else /* CONFIG_X86_64 */
 #define REG_NOSUPPORT ((1ULL << PERF_REG_X86_DS) | \
 		       (1ULL << PERF_REG_X86_ES) | \
diff --git a/include/linux/perf_regs.h b/include/linux/perf_regs.h
index f632c57..144bcc3 100644
--- a/include/linux/perf_regs.h
+++ b/include/linux/perf_regs.h
@@ -9,6 +9,12 @@ struct perf_regs {
 	struct pt_regs	*regs;
 };
=20
+u64 perf_reg_value(struct pt_regs *regs, int idx);
+int perf_reg_validate(u64 mask);
+u64 perf_reg_abi(struct task_struct *task);
+void perf_get_regs_user(struct perf_regs *regs_user,
+			struct pt_regs *regs);
+
 #ifdef CONFIG_HAVE_PERF_REGS
 #include <asm/perf_regs.h>
=20
@@ -16,35 +22,9 @@ struct perf_regs {
 #define PERF_REG_EXTENDED_MASK	0
 #endif
=20
-u64 perf_reg_value(struct pt_regs *regs, int idx);
-int perf_reg_validate(u64 mask);
-u64 perf_reg_abi(struct task_struct *task);
-void perf_get_regs_user(struct perf_regs *regs_user,
-			struct pt_regs *regs);
 #else
=20
 #define PERF_REG_EXTENDED_MASK	0
=20
-static inline u64 perf_reg_value(struct pt_regs *regs, int idx)
-{
-	return 0;
-}
-
-static inline int perf_reg_validate(u64 mask)
-{
-	return mask ? -ENOSYS : 0;
-}
-
-static inline u64 perf_reg_abi(struct task_struct *task)
-{
-	return PERF_SAMPLE_REGS_ABI_NONE;
-}
-
-static inline void perf_get_regs_user(struct perf_regs *regs_user,
-				      struct pt_regs *regs)
-{
-	regs_user->regs =3D task_pt_regs(current);
-	regs_user->abi =3D perf_reg_abi(current);
-}
 #endif /* CONFIG_HAVE_PERF_REGS */
 #endif /* _LINUX_PERF_REGS_H */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index a6c8e38..c84340e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7818,6 +7818,28 @@ unsigned long perf_instruction_pointer(struct perf_eve=
nt *event,
 		0 : perf_arch_instruction_pointer(regs);
 }
=20
+u64 __weak perf_reg_value(struct pt_regs *regs, int idx)
+{
+	return 0;
+}
+
+int __weak perf_reg_validate(u64 mask)
+{
+	return mask ? -ENOSYS : 0;
+}
+
+u64 __weak perf_reg_abi(struct task_struct *task)
+{
+	return PERF_SAMPLE_REGS_ABI_NONE;
+}
+
+void __weak perf_get_regs_user(struct perf_regs *regs_user,
+			       struct pt_regs *regs)
+{
+	regs_user->regs =3D task_pt_regs(current);
+	regs_user->abi =3D perf_reg_abi(current);
+}
+
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
 			struct pt_regs *regs, u64 mask)
