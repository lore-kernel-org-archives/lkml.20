Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225639;
	b=RguXYmk8QGcj7G09BYZxEZ/zK34Gef0zIBBfVJNpX7PIdWML6zRv6kK48RXNbEin0D/7
	 wNODVejUemplQNj7/jpYjqHuBabXLW4HgjZweLh3HnlaGMNizGwYeinn5xRI0633JEG53
	 S7U/f5zlIA00tpcwzfsacNH41yux5gJ0I7xK74dKeo7BhKuVE5bH+ckGEUFeYEPNl55h3
	 z9MOSnJBULZiIzQiBpNo+PeW4LsjNvwYWFlFa0n7pxMv4+UXmf4oVehDkEKASlRoLvESE
	 bRfGwL2jUsm65SWXk/TxwjSGY4EoznpygeHW0tM+ehmGH3YkiIInB3p6O4jKbRwFQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225639;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w6KU+2nxKMRbJR0uTDw4kUaYedkzj4mNAS4FtcU724c=;
	b=s5977gwkGAYg43GwJsiV1EjPu+6ezwk+GZixIjoAXIMbKMRijFvdmqomfPveDbdzFsFM
	 /ULhI6rKYdGwwq44jRfjO5U/NLJNNCls5uuXvfmOuEnq7FS35G9KFSS6XCOhTlayro2tW
	 xc9IX0EBudktI/4QTP4K6k32qnBSm8nI5jiF5rxydH6frsoAmoZIVuEf6StcJWMbrBJiS
	 vduiqeR+cxkB5vu+pugJ5dFHUwXpEK8xEIgqa1SuZB/y9IB26rzwQoQNapwSRpdVRTd9k
	 yIpx1IoJCMZIayns/sLZOtEPcVQQVTAoq4GGrS2WkdG4WNdenyGGNj0IUnRjCwhuHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5joyA3z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d5joyA3z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720F41F008A2;
	Mon,  9 Nov 2026 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225638;
	bh=w6KU+2nxKMRbJR0uTDw4kUaYedkzj4mNAS4FtcU724c=;
	h=From:To:Cc:Subject:Date;
	b=d5joyA3zJ7YTrS8RpNR9nj3mGeWioDJiuhrvbmLVKeX4o/O8McL78UthECH+WbY9F
	 EMST5hPFE85ULoVZXUuV4agigLph3puPuVRnebs5hzqP2TwdWdUnMPhQqo+m7OPBxE
	 VUfZUWYp/fCCUrCimrviSDdxdnN9f2GcOP5aqkWRTMw43KxvbAx/BuwsIkSdyTAzI/
	 0sm9tkKI+Yb/xBqz+7HmkdQM15ZvQWtFmUqaqO1x3Muk63mGszjss9j55GKFkcqEs6
	 Q5kZjCPT9AkgWUphzz5tYHnEsrGCStD06EBwCptuF0BYwG64IYZmRhPp7Dm/OUGCu5
	 pCwoLxIL0vJ5A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Establish entry state for kernel software-check exceptions
Date: Mon,  9 Nov 2026 19:40:28 +0800
Message-ID: <20261109114028.20225-1-jszhang@kernel.org>
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

The kernel-mode software-check exception path calls die() without
performing the entry bookkeeping used by other kernel trap handlers.
die() invokes diagnostics and notifiers which need the corresponding
RCU and tracing state established.

Wrap the kernel fault handling with irqentry_nmi_enter() and
irqentry_nmi_exit(), following the existing kernel trap paths.

Fixes: 9d42fc28fc17 ("riscv/traps: Introduce software check exception and uprobe handling")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
since v1:
 - add Fixes tag

 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..f28e03f98af0 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -402,8 +402,11 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
 
 		irqentry_exit_to_user_mode(regs);
 	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
 		/* sw check exception coming from kernel is a bug in kernel */
 		die(regs, "Kernel BUG");
+		irqentry_nmi_exit(regs, state);
 	}
 }
 
-- 
2.55.0

