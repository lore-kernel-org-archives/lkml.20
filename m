Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775950;
	b=29AUoRKKSxT2bbk5mrlG0tblmTDEkkJyTltX526zP5C+zXAYA1dlh6t2XGHhQqfe4aNF
	 0K/4FaCtc6wU7ejXAnakU3OtSKT3Eh5XvTVxSjQmHN0oSCcBZa+bLMWH+QOPDL5WfqZnk
	 bwGAMgHPm8ThcAFH6j+pe6/QPsHidpiID7fwCXg6K3nMYN6jbTPQhoxoU2+qgRYjxWxW8
	 EB20HAN+9C7Ojnbd/TI0ylIb7dw6UzfKw6W1ZkpA8//FmAj1Bth906VhtByhr8e33E2mv
	 8hSZlb+WDZGKdDduLWGcAVTKMcumZdQXSlgWrK2amxmiOBobYytjLh3ZxepNjNuswPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775950;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BOuJK6WkkKKX8xYxb+ZkMXUR/W9XdLruFvEV7oi8Prk=;
	b=uTrgnaVt22tEB9xKKVNjs69DyvLcAPiM/sbfvSDNppX/DF0yrk4nfGc5dE6NpUb2S89H
	 LvkD3MLMQklHHwJVkkv/rmmd+3cvdIM45XKYRXZM6k7V9LSHfjUxlCn4S9zPUhI0r61Tz
	 DGpeLw+luCvT4ZZZSsxhMqo81oDRm2f5aM9xMLFIje1SpVPdewFLdoedKTLhuqIYBIbIb
	 aAlDKSqEGe7BJLjU2J5sjZW0J4qo7ZVAY0ERLjN7ny0SkNUBAm0K764amu1k9Oj5wPq1Y
	 WeKV9+6PcUCG+fVXEafLKFKxE2eC0zl86TUAlg+VS9h/AKzz9JNhucrq4jElIs5VhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AsX9geCN;
	arc=none smtp.remote-ip=91.218.175.121
Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C80606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C80606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AsX9geCN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rSnU8lJu7f/t4TTjB5ud1DlUs3JtaUJ65UuR/fs2+h8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775947; v=1; x=1794380747;
 b=AsX9geCNDR7EPS7ICq2wQRuHqBdiMM04HJ0Z50ez3gs9n3fsl3AvJBTlbJ2yaPqriMoHqV/+
 gghE309eJsfZjsim1i8kAkvycJkYbjUibM0lYyuq2GeZNF5j3xLDeBbuvwYSewzyH3Rcx9EUBM9
 CvOccltcEoZus396viEG4XSY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5f8c3ce56e6e10fc;
	Wed, 04 Nov 2026 07:05:47 +0000
X-Mizu-Trace-ID: 5f8c3ce56e6e10fc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 04 Nov 2026 07:05:40 +0000
Subject: [PATCH v5] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/63RTWrDMBAF4KsErTtBv1bTVe9RspDGo1pQW0FSR
 Urw3SvaQkxXLnQ1vM33HsyNFcqRCns63FimFktMSw/m4cBwcssrQRx7ZpLLgSshoFngkFFAbjD
 GAnGp4CmkTJCpVJcrGK/ISKe9FifWoSmWmvLHV0cT/bz8iWsCBHjUg9fKCHT4/BaX9+txpMbOn
 W9yS9pdpOwkJ8RHE7y3Ifwm1YZUfBepOmkcN9YGHIUafshycUhzrEdM87et7/aJ75uru62l93r
 gqF2g7dy1myGnGeqUyd2f9Q/2un4CZIiKIiACAAA=
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.dev>, 
 Aurelien Jarno <aurelien@aurel32.net>, Anand Moon <linux.amoon@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3853;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=rSnU8lJu7f/t4TTjB5ud1DlUs3JtaUJ65UuR/fs2+h8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvbrpYVG79FSj093Ts1y/71zva7PD+fC1bkHfj7fc7v
 rRPmaO8uaOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiTPoMv9lK7+8ozDvmccSn
 7KxFt/h7249lWQzXzuxWUxIoaLL31WX4H3bkfpp2+2uFW5LiHxb/fnWrSNT4xsFzPB28xTu/cfX
 tZwAA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Currently, the RISC-V implementation of machine_restart(), machine_halt(),
and machine_power_off() invokes the kernel teardown chains (e.g.,
do_kernel_restart()) with local interrupts enabled and other CPUs still
running.

This implementation fails to provide a deterministic execution environment
for registered handlers in the restart or power-off notifier chains. These
chains are intended to be executed in a strict atomic and single-threaded
context.

Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
the preempt_count. If local interrupts remain enabled, the environment
is not guaranteed to be atomic. This can lead to a context misidentification
within generic kernel teardown code, causing it to incorrectly enter
non-atomic paths (such as attempting to acquire sleeping locks), which
results in fatal "scheduling while atomic" splats or system hangs.

Additionally, stopping other CPUs ensures the primary CPU has exclusive
access to the hardware state during the final teardown phase, preventing
unpredictable interference from other active cores.

Align RISC-V with other major architectures by disabling local interrupts
and stopping other CPUs at the beginning of the shutdown sequences. This
guarantees the architectural expectations of the kernel's restart and
power-off handlers are met.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
Changes in v5:
- Rebase onto v7.4-rc1.
- Add Jisheng's Reviewed-by tag.
- Link to v4: https://patch.msgid.link/20260907-v7-0-rc1-rv-dis-int-before-restart-v4-1-42bb460c4afe@linux.dev

Changes in v4:
- Rebase onto v7.3-rc1.
- Link to v3: https://lore.kernel.org/r/20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com

Changes in v3:
- add Aurelien's tag
- Link to v2: https://lore.kernel.org/all/20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev/

Changes in v2:
- expand the fix to cover machine_halt() and machine_power_off() for
  architectural consistency.
- update commit message
- Link to v1: https://lore.kernel.org/r/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev

To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev
---
 arch/riscv/kernel/reset.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db85..ec84e3c94a3a 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,7 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +19,9 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +34,18 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

