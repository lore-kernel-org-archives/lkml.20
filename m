Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060603;
	b=bGditM3OvfS92oNysw3/s8BXsrgrW/Df1K1aGdEIW1wqyhNPLF/aprSSTekN8QnkIX1q
	 4Tali3lyf++wlSx8K/2TE+kvFqjFKMB233cF4obL9ic9kVvdNCiouk67venmwru+P6D14
	 L1zJhtYUbwaSLHtElYpXKHL4nCMVtwxhRA4P38ZKgpTwcY7n3ifTrM0fbCQJ4KlTji7bL
	 /KGFip22FTCW8SSZ5IY8c5lSp4kYfaZ7hv6sK6U2nkOJeGyWZe7a9KeGAlejqWZLTQN6u
	 b3M8NGL2y8S0FrCZQP3Sezn+6x576osVgvO32b9Vgp9wzf2NgVEpxkxxRvj4VoeKsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060603;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ry17mQiFCxfToY1zGA6QNTErIMgHFsdYh7nrM2aQsw=;
	b=ftSI1ZSGVic/HQWWlIDvfKJDdvC7u9BcSTqgLZQew5470Lneed2n1227LQNpVPdDQaJ2
	 f8YB8hgX5sqQZeWUp18W5vPW5/M88UvDhc6cmBw2bYaCRVQL/DupBGTZmKUwW5Zrrc1HW
	 NF1wQzCWTHBoN00jX4QSx/ovQQu9HpU2IrYmgVP9KfXYjO9S0jc5wj79CFKnKmQSST19B
	 /fKBY2JVFX+OORWH1X3uB3Jo4zgyKSoIThfaBjNSNJ8Btu0nFstAAdHg/tL6j59ZDklwL
	 2oautm+fn4Of8sB3jRsw/jiiLFiJf3hCFXvwJJ5aXqJJDWNpwFSb0Csq/PZFAA8jO/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyiJEHB7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD7606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyiJEHB7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48881F008A1;
	Sat,  7 Nov 2026 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060603;
	bh=5Ry17mQiFCxfToY1zGA6QNTErIMgHFsdYh7nrM2aQsw=;
	h=From:To:Cc:Subject:Date;
	b=RyiJEHB7lS0LiNtkVjtDoPXFxdwk6maa2hAlrDqeoL5j8lCY9sPJVX1AEUaRnGTr4
	 Sz4jFreYzYNLAvcL7XNynl+JUWMXHS6rxFpWbaEhv90lqGJCqe1k0yt00JOXsh82gm
	 UkL7epm4Jbd2FnzZulDgIezcaemh12jukhfjloD83xw+TgL3FGJ6gMSc1M8cu2I1rf
	 l7GndeIStOtzmzSTeHlnW/EwHHq7l2ThTsc2nM92Kkak7GXoE6dFMqNNNgo1rUE642
	 LTvVnbTWRuYgug5VA/WOs4+tIEesNuf0MM2pbRxtRp6/Z2jsWST2IdFWNb9meAD/XU
	 sTOUAUIwfu86A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RESEND] clocksource/timer-riscv: use riscv_has_extension_likely
Date: Sat,  7 Nov 2026 21:49:52 +0800
Message-ID: <20261107134952.17873-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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

