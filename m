Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D90C514758
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748113; cv=none; b=UdxH85hSHUiaQsCxA00+KJc4QaWpEp+GWoT8CRiQ9bwxDLz4vSzxDidL4NDvfll9mvpshWiI794VSuIWFVEBYvU9yKgGEW2KyI6yXYUPOsYapmPC71bXtzke/nkSHZkqXxmV4kn9wRg0EYVW/6kYxcYm/S+Kb0XR7+adWtj9kY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748113; c=relaxed/simple;
	bh=8N+dMro6IY5WMzrJLEVXWe787chZDhO/60ie5X0SGSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eARocZg8xRWXrHkfxYohClZrgeQ9kr0fcT1Kzg+N2xaFE3zehNzg7c7vVByvWLIG8zSIF5mheVXyL5PHZgSzdH7luM7RWMHSyNWLjdNo129BR6Hmy0FF+bmJYwbPIfHcomAwOOl1Pk3Uv504Tl3Sdiq5HuwkSWyKOYIFoKQVbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AW4leaLe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AW4leaLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7941F00898;
	Fri, 18 Sep 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748111;
	bh=PHdOX9xdJ/boaqPZ/GwtRSXh8g+Ri88d8K76J4PQiZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AW4leaLe7j4HIbFH2dIJD4sVJv8bNmmtDS2WAAo4HLGUrfMxov+PMkjuIVqHRFL9b
	 3jTIF/zEjLp6fQwqp3r5PMg+RuxqLVDmnkvctgfNzjflj60eejygFy6fiBGIl+ByvM
	 v7VkBY2mCW7HjhCo2TjPOhn8P3JeaTUd8TXi89dNH4KKwlHR0GWPjoOCSsD2naCidU
	 FIUXzPe+EmQGG420NDLeSTXAYovB/SJOeJuYBhWvQzbx0TdD0IvOG2WNGUeBfJM2J/
	 FcBUNsduS9xkFTa3yjwuaYZgQVEFWhm3ZqUqQDXQHbQNDO8ySpEY/0BG/cFzhE/K/9
	 77wWm0LhbKWdA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 16/21] arm64: entry: Implement EL1t exception handlers for overflow stack
Date: Fri, 18 Sep 2026 17:14:00 +0100
Message-ID: <20260918161407.2300-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for using EL1t to handle exceptions taken whilst running
on the overflow stack, implement some simple wrappers around the EL1h
handlers which perform a best-effort stack overflow check before
proceeding.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 43 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59f..9738142780df 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -327,10 +327,45 @@ static void debug_exception_exit(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
-UNHANDLED(el1t, 64, sync)
-UNHANDLED(el1t, 64, irq)
-UNHANDLED(el1t, 64, fiq)
-UNHANDLED(el1t, 64, error)
+static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
+{
+	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
+	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
+
+	/*
+	 * We're in big trouble if we've overflowed the overflow stack
+	 * so perform a best-effort check before we proceed. If our SP
+	 * is outside of the overflow stack for this CPU then presumably
+	 * we're already corrupting memory, so park ourselves here in an
+	 * attempt to contain the damage.
+	 */
+	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
+		cpu_park_loop();
+}
+
+asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_sync_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_irq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_fiq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_error_handler(regs);
+}
 
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog

