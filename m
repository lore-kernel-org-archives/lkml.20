Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0441244667
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788323078; cv=none; b=KzhOeS73nEQV4ZZOqDDUjCCKFIb6gmExfyx7NeHDgNlTsGiB6l1RrDzfCo27iwrqJ6e6SdyK02NxyDZI0AllaNnt38wyNOTHpYF/ROh29YqPCKXh5ETT4uFzLVMXmz+w8hlqZsM0rqvwfAInG4S1z/umMi9/D+l7Xu5wQDPuJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788323078; c=relaxed/simple;
	bh=eWkb455PoKo6CStk0oVqNOqW0atGdDCo68Hua8Y3eDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAchvrL9hnO/8dIyBNKRwDg5u+tZ8kb6jLhVz6c+OI0Osl8S2f7e9QxfaIXs6TxLNy6GpLKDiZrmNzWKqqvzC3NhAKYe77YqZaAzr3SEWYBaxJ5u/X4PR7B6jTjDpSSFmjSe6S52pXiG0WDNte7TLmMIpUjGf2QgCxe+vwbxidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odoGSNp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odoGSNp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C653B1F000E9;
	Wed,  2 Sep 2026 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788323077;
	bh=5Ry17mQiFCxfToY1zGA6QNTErIMgHFsdYh7nrM2aQsw=;
	h=From:To:Cc:Subject:Date;
	b=odoGSNp1MbqDpEuyeK62ClueJJ0rMyOhPlRTh+dS+S2rvVKPqqwaS8FtxlE85CY4G
	 W9QWeoXn94wXug7Ag/OwK2sEVmtxD5PrdGMCBNa+HcU+wP7yG75zIjs0fCpSqxfnI6
	 Nft3XV57xdoYMCozRMq1MOmw2CU1V9KfDGDmJh/sK4ofUIQoouw9khrv6eAKfMntrE
	 V52poEDnj5f5M3qzE8kQUHyNEIsykRBbJbsk0b6FJfOiNkVWsh9CScht12rFJan6JO
	 fS1MyEtwxymSNMHr/1/A8fFkrftEsTDsFG7ngAoZ4+zrmh2IuXxYBrwMGrwnm/34C6
	 g1rGjDr0HTwxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] clocksource/timer-riscv: use riscv_has_extension_likely
Date: Wed,  2 Sep 2026 12:04:53 +0800
Message-ID: <20260902040453.6258-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of static branch, use riscv_has_extension_likely() to check
whether SSTC is supported or not. For one thing, this is straight
forward, no need to add and enable/disable a static branch during
probe; For another, riscv_has_extension_likely() is based on
alternative mechanism, it avoid some downsides of static branch, for
example static branch's metadata in the __jump_table section, which is
not discarded after ISA extensions are finalized, wastes some space.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index b310e6721fac..151f4f0cfd6c 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -29,12 +29,11 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
-static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
 
 static void riscv_clock_event_stop(void)
 {
-	if (static_branch_likely(&riscv_sstc_available)) {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
 		csr_write(CSR_STIMECMP, ULONG_MAX);
 		if (IS_ENABLED(CONFIG_32BIT))
 			csr_write(CSR_STIMECMPH, ULONG_MAX);
@@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
 {
 	u64 next_tval = get_cycles64() + delta;
 
-	if (static_branch_likely(&riscv_sstc_available)) {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
 #if defined(CONFIG_32BIT)
 		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
@@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 	ce->irq = riscv_clock_event_irq;
 	if (riscv_timer_cannot_wake_cpu)
 		ce->features |= CLOCK_EVT_FEAT_C3STOP;
-	if (static_branch_likely(&riscv_sstc_available))
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
 		ce->rating = 450;
 	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
 
@@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
 		return error;
 	}
 
-	if (riscv_isa_extension_available(NULL, SSTC)) {
+	if (riscv_isa_extension_available(NULL, SSTC))
 		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
-		static_branch_enable(&riscv_sstc_available);
-	}
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
-- 
2.53.0

