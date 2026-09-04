Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111E4A1DE9;
	Fri,  4 Sep 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529229; cv=none; b=KP2kFJUw8w2hlQy1WQNz3GrC57DbbirDxEL4BFDtH3D9k3RjdWA18lA0hrZve5KjUpeYU0SRNfDcLd6kKkwOPlHvlee+4DYZ1DfMgEQwilwKt/Rbu9BUKQWanJVCVsnKmysZ6CfyiIL8xdA1+8jFXOmH4yy9pkBol9b9d9kRPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529229; c=relaxed/simple;
	bh=m5GsUIf2f0E5bkeB6ZESyxJLn5fMBZTjmn1hdee89u4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=N3rL8jwTT6iYc3GMUCBS/jyGjKe3DIB6NFh8BX4da7RIebjaZT6Mwt/i6NVXMzVVBos/HCFui8tvqyzoWh+a/wEFgFhVVrQ3fNkB8r6YxDFqZzEFGiTIqqVfvsYgX8nxNcWPgxO0hQJvsNSvGf37TuE27ouq1Vh9NgA0FQkr4Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ODJVVBkQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yzs+wp8r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ODJVVBkQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yzs+wp8r"
Date: Fri, 04 Sep 2026 13:40:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529225;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqlpHgVYqMpga+RqrZV0D7dF4LjC3Y62S/mRazchSVo=;
	b=ODJVVBkQ+GPPYuc+GFcAOebmuM7oyZ4O5mm8j354gCq313JDsih/eN8wGQPwlcDQtIbyfO
	Z38xCB2NMCeXNGM7sezw+EgwJKfOzvVht0a54PyV7N+mXZC6DB1CsLqdd9NL28ZFm5zDup
	F0mZ3ymyYNNLTvB/ZzxTDYdN0lKs9bKmt7vMMtaKUlPooR9gfRkVI6Cem9Fu4Kx9v0PFhs
	tJIYe9OYCyxdtg1EZrABgJEdYLhqx434Xazv6zcKEe/HYYJcT6Qn26NedHzXvg8sNui8it
	Zkjdn3r41HqGJb7hPcNKfcjir+KCgOSOH4mn87sOyZNoG61kfaMV1CPfcoTTuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529225;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqlpHgVYqMpga+RqrZV0D7dF4LjC3Y62S/mRazchSVo=;
	b=yzs+wp8r3YvTzQ1sSfzS34Jld2DwTM1HLjquzOjIwmFtEUV6zPhgIHKHvjlj0hoE5iS1g9
	RQ3EyKk6aBKXi4BA==
From: "tip-bot2 for Pengpeng Hou" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/riscv-imsic: Use GENMASK for base address masks
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel <anup@brainfault.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
References: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852922436.3717435.12511836074895161637.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     bd7d57a03c4b0fa3b0291ec64d688ebfed5edffc
Gitweb:        https://git.kernel.org/tip/bd7d57a03c4b0fa3b0291ec64d688ebfed5=
edffc
Author:        Pengpeng Hou <pengpeng@iscas.ac.cn>
AuthorDate:    Sat, 18 Jul 2026 12:34:36 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:33 +02:00

irqchip/riscv-imsic: Use GENMASK for base address masks

The IMSIC DT binding allows riscv,guest-index-bits up to 7 and
riscv,hart-index-bits up to 15. On RV32, guest-index-bits=3D7 and
hart-index-bits=3D13, together with the 12-bit IMSIC page offset, is a
binding-valid layout that consumes a 32-bit low-address mask.

The parser accepts this equality case because it rejects only values
larger than the remaining bit budget. The base address canonicalization
then builds the low-address mask with BIT(sum) - 1. When sum is 32 on
RV32, that expression shifts an unsigned long by its full width.

Keep the legal equality layout and express the mask with GENMASK(sum - 1,
0) instead. The existing parser bounds guarantee that sum - 1 is below
BITS_PER_LONG at both mask sites.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early drive=
r")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260718040000.004.929c1ef2-caplitmus-rv@iscas=
.ac.cn
---
 drivers/irqchip/irq-riscv-imsic-state.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-ri=
scv-imsic-state.c
index b8d1bbb..9505ddb 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/bits.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -769,9 +770,9 @@ static int __init imsic_parse_fwnode(struct fwnode_handle=
 *fwnode,
 		return -EINVAL;
 	}
 	global->base_addr =3D res.start;
-	global->base_addr &=3D ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+	global->base_addr &=3D ~GENMASK(global->guest_index_bits +
+				       global->hart_index_bits +
+				       IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 	global->base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
=20
@@ -850,9 +851,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode=
, void *opaque)
 		}
=20
 		base_addr =3D mmios[i].start;
-		base_addr &=3D ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+		base_addr &=3D ~GENMASK(global->guest_index_bits +
+				      global->hart_index_bits +
+				      IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 		base_addr &=3D ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
 		if (base_addr !=3D global->base_addr) {
