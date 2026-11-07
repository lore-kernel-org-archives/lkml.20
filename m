Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065849;
	b=1zKVbsWBopKN0TrhnEP3V5eGuUcVbbcPLYxa8mUjDIJLOCCrqKMiMfVoABKBaH9BCiLS
	 6jevN789xfEYabgWx/goIlUQoJQCPRTMw5YDs5EaCVYFrRdeF+NT8BrUeXr31l4tlqjtu
	 EoP0YNgrAz+88t5wNfT6LBRZ0WhK1THzMt7ch3KYveOUN8KsdFutDf/ecp/bt+c4ibkj4
	 chHsSbnVjZ36M9oFzIaCr7IgJXPD+A7sgArGQD9aeXz/eMtgGf1dRMBJijk+iotmXWnrm
	 G1+5niVDQDZrL/5k945voJ1fFZaNfNlMCdvr8342bzfrBjRmtPI2x3CupKQ1CK9aCyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=;
	b=WS9GYqBU9Y3vWvexMaOLMiAdXGzvB5Q8q5nal1cyPoMRK+JS4lr55Ac28PlkA+aGnh/W
	 4G+6VzZ7MxPVYfKva7SQUhJheF4I2e4xHH7Ibrc1l1b2a1rgWrkXtwjbk1gQHaWXi1E/h
	 6lqJN4sCotCPo8+mMhpfde3HCMhq0dXU+nd7hPt9KMOZL75zVu+jyJ1SqlxosRIU24bsl
	 b1Ljs5wuZza9XDp+3pK5ygZd7IPTYnYrw2sd2LTZuZJj4K0bvnCIlH5HaUSEgexntpA+t
	 7XOmEYwnSSh1HGOWsjr2MvdKMUWx77EVvF2XX6ALLgSiaRWvQ09RrpSKlxX72sFT/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EsOMbtJB;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDA1606D836
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDA1606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EsOMbtJB
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c4322d31021so189042866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065848; x=1794670648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=;
        b=EsOMbtJBZbtV2W7PJuW7pvXxzQcpuLE3KzvunkKqSp6bGReLLT+JvSEnPdVttke0tP
         lkN2KOoMT5sZsB5F0SLmfwcUSQ5IVUxPl57gByJ3lKUvyTAtg2uA03uHxWJErNnAual6
         VwBZLV22Z/7ICNw+RbyvRVoL3yLKgE16MIhFWYAzLmskPmkCEoS0/z6A/I3+ZZeq7JDf
         2Evw3bNaIakUxzFevxWv3YdT6uPM15sjmd8JmvZGSOgsL6LJTP4pwmZgGXKEfTpb8eMK
         LOVlxSo3CGANCzYmPkHUKSf/z1JVie7QyNRgDvrtNxB9fkZYXaVDSfd77VzY6GtH0fLS
         8HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065848; x=1794670648;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=;
        b=JPHPRDgCiZdQAFzuchY+45OWXawWBbO3IthM5Qp7YpPpuTUx1QKl/+dVwY5JALTSmx
         4+88GnHjrmY7F6YPjWHTdQdkxWC5PgKz0WtZjsUBh9vyTOW33G5xoIj7ff+d2FkyEHiO
         4TrcKvzT2nQk91gnqhN7vVVW5HOuXHzfbSGDc1n+UsS1TwWB/GnBPWSFj/J1i8DljV24
         /5OhZMHHYoZ1STJXF7lp8CcaSGVsfoNLVUTlgTBa0uo15CZnPFjebRIB0+CST5qpjhkw
         EXNNxcJvBi8L/H7B1w4p2e+dT/9ZoybBDNAhf6lfjEb+7cneNGET4NoPFwfTcWxUAbNH
         POwA==
X-Forwarded-Encrypted: i=1; AL+hErFrnjkNoLrhmrBfHRZwl3tp6f5rcpUrv2x0wQN8ubEQC/JMDnNzQXkGI7SD/K2U3Z334BGa4XWG4gIf3qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hFsNMBPHIgxLuvHx80GVbmGRKOVYp+5TlZ+IWvT/r9iPq3n3m
	28JN8uTbg7RAjnKfQwDl7FjmBLZQ3O7ch/xvjc5sDisyfXKgiDnMWhr/wscJBNlEGFx76J4cSJY
	dnw==
X-Received: from ejka11.prod.google.com ([2002:a17:906:40cb:b0:c31:b9d1:9418])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d08:b0:c4d:31cd:9dec
 with SMTP id a640c23a62f3a-c4d34cf871amr442259766b.30.1794065847469; Sat, 07
 Nov 2026 07:37:27 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:20 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-14-d84ea5f30f94@google.com>
Subject: [PATCH 14/24] arm64: Add mte_{enter,exit}_*_{kernel,user}_mode()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Abstract away and consolidate MTE switching code by aligning with the
concepts and naming from entry-common.c, similarly to the SME routines.

Define the helpers in entry-common.c, conveniently grouped for more
straightforward enter-exit logic pair evaluation.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kernel/entry-common.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index 11d3f888fcd8..fbf9bafc6962 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -25,6 +25,7 @@
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
+#include <asm/mte.h>
 #include <asm/percpu.h>
 #include <asm/processor.h>
 #include <asm/sdei.h>
@@ -68,6 +69,27 @@ static __always_inline void irqentry_exit_pcpu_adjust(st=
ruct pt_regs *regs)
 	pt_regs_write_reg(regs, reg_addr, addr);
 }
=20
+static __always_inline void mte_enter_from_kernel_mode(void)
+{
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
+}
+
+static __always_inline void mte_exit_to_kernel_mode(void)
+{
+	mte_check_tfsr_exit();
+}
+
+static __always_inline void mte_enter_from_user_mode(void)
+{
+	mte_disable_tco_entry(current);
+}
+
+static __always_inline void mte_exit_to_user_mode(void)
+{
+	mte_check_tfsr_exit();
+}
+
 /*
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel co=
de,
@@ -78,8 +100,7 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_=
mode(struct pt_regs *reg
 	irqentry_state_t state;
=20
 	state =3D irqentry_enter_from_kernel_mode(regs);
-	mte_check_tfsr_entry();
-	mte_disable_tco_entry(current);
+	mte_enter_from_kernel_mode();
=20
 	return state;
 }
@@ -94,7 +115,7 @@ static void noinstr __arm64_exit_to_kernel_mode(struct p=
t_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
-	mte_check_tfsr_exit();
+	mte_exit_to_kernel_mode();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
=20
@@ -123,7 +144,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt=
_regs *regs,
 static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_r=
egs *regs)
 {
 	enter_from_user_mode(regs);
-	mte_disable_tco_entry(current);
+	mte_enter_from_user_mode();
 	sme_enter_from_user_mode();
 }
=20
@@ -136,7 +157,7 @@ static __always_inline void arm64_enter_from_user_mode(=
struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	rseq_note_user_irq_entry();
-	mte_disable_tco_entry(current);
+	mte_enter_from_user_mode();
 	sme_enter_from_user_mode();
 }
=20
@@ -146,7 +167,7 @@ static __always_inline void arm64_syscall_exit_to_user_=
mode(struct pt_regs *regs
 	syscall_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	sme_exit_to_user_mode();
-	mte_check_tfsr_exit();
+	mte_exit_to_user_mode();
 	exit_to_user_mode();
 }
=20
@@ -161,7 +182,7 @@ static __always_inline void arm64_exit_to_user_mode(str=
uct pt_regs *regs)
 	irqentry_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	sme_exit_to_user_mode();
-	mte_check_tfsr_exit();
+	mte_exit_to_user_mode();
 	exit_to_user_mode();
 }
=20

--=20
2.56.0.455.g6c5a503b38-goog

