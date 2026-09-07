Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2DA51E43E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799429; cv=none; b=PH9eyTxAg/ilTvahz9O5XcWXebrWfvzKjAwfXvwX+vQeunV4Uebx+keDkyM6mkyE7Lb7B5B/WlvAX+wKPaZMRu+ODjCooZvfjfOhvKLOsi9FG9nwyled9EKSQBtxy8NjvUlNPCRpeqs253bisDsC0PepHWmj8zUlcKvUmZNfNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799429; c=relaxed/simple;
	bh=Ckombhrq0TS01O4gWB6HzwxlD8NKzPbgClG8LVbA0c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf9JZqgdPfHbmp6MtKi1tnwYqjIWOt6oKydHsgwpbfzk3oBP8KWzlXkV1ekg1obAsNMIsD3grUiUGIHjuaQfE2rbyi9dk5wiM/ySTHTzU9BNI4XDoIJNOvUTARTx7MAaBTvPqNk/2T/1XDDlzQpmmurWrLQWaCXjmuJ5NBtkgtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtrEthrk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtrEthrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3714D1F00A3F;
	Mon,  7 Sep 2026 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799428;
	bh=jH28rU+mnq1lsgGFv5viipgfUPbuK680E/2q+gPKoGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HtrEthrk4YJ570v367OewbhJ0OaY8Q3MQQOiNhFUQ0pKOzv6hqbvsIj2cS20df17d
	 p70KKwJDAsqwem0At8drTuNpFNb57H9hcRnctyqCw8nyApJ72n7kHHobs4LxI4Rdq/
	 mc7W1qg+8b7pPlcDwkfBw3B+IxV7AuFqOUBtmNVOegoDgb7daeOGtSVfvVJUAnWL2Q
	 5jf7LPC5fWvVDHZ7kxQp7FvfVfRfQW3l+EzLe1HR8Hd6Fh3nrZBorujR/EuaNPWzz7
	 9pDf7VAhr1JDh1i+MQ7XVmdy1WmWw+t1I1gMunSyHxQ+lwZIkNHuYiBiGm6cU7lrnj
	 Bpvc/hBGiAN/g==
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
Subject: [PATCH 14/21] arm64: sdei: Support SDEI events from kernel handler and thread modes
Date: Mon,  7 Sep 2026 17:42:39 +0100
Message-ID: <20260907164247.17223-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Section 5.2.2 ("Event resume context") of the SDEI specification states
that, as a result of an SDEI_EVENT_COMPLETE_AND_RESUME call:

 | SPSR_ELc is set to the PSTATE when the event was taken

In preparation for making use of both thread and handler modes in the
kernel, adjust the SDEI event handler so that we return to the correct
kernel vector for the interrupted mode.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/sdei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 778f2a1faac8..6337ce905593 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -208,7 +208,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	int i, err = 0;
 	int clobbered_registers = 4;
 	u64 elr = read_sysreg(elr_el1);
-	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
+	u32 kernel_mode = read_sysreg(CurrentEL);
 	unsigned long vbar = read_sysreg(vbar_el1);
 
 	if (arm64_kernel_unmapped_at_el0())
@@ -233,7 +233,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 		pr_warn("unsafe: exception during handler\n");
 	}
 
-	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
+	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK) & ~PSR_MODE_h_BIT;
 
 	/*
 	 * If we interrupted the kernel with interrupts masked, we always go
@@ -251,7 +251,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * address'.
 	 */
 	if (mode == kernel_mode)
-		return vbar + 0x280;
+		return vbar + (regs->pstate & PSR_MODE_h_BIT ? 0x280 : 0x80);
 	else if (mode & PSR_MODE32_BIT)
 		return vbar + 0x680;
 
-- 
2.55.0.979.g7e5102b832-goog

