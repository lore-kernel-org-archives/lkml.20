Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56233D3D19;
	Fri,  4 Sep 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529216; cv=none; b=l2wRU/JW/DarXT+Vx/Fu5MAaY3I45jXfwocwchM4m5dcfYb+e+hFFOHHoz7ZfjKVj5vTgwsZ5sJTDfs96KkfX/lRgh//TLnIOeNh3zlO3U6oTrp7rW0XBRxkdE5d8zY/GtoQejyizWnUqfXANb2p9wOR2ZmZz4+zz9EVsAXmbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529216; c=relaxed/simple;
	bh=Jza8resiTgbnDTZoKHopARy8UEzN3CpUZi6JzMsaKvM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MZZLRQjf1EP4JmtNOiHhQvxARQVsC49M09Q40Uetg2ti9b0rTCC4aVqAeDZ7f3qvRK07Tr0lj+1wJPjBTdkSl8QJqbtkjKFwTTa0nuA+/cvEldrx0tFhh7He6c3Uja5Z5cwaEWkSBiLXR/DHtDZR23VEpMuiZmW3lmIVkMumlHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hMnIn7n7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/QAU3TU5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hMnIn7n7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/QAU3TU5"
Date: Fri, 04 Sep 2026 13:40:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529213;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkymDc6m8XxBpFMYCvLbHS0VVkcbrI6VoVCY1TnGdpM=;
	b=hMnIn7n7PzunQWsmxuC5OQAQBA8Rv54uPNASA2acyJ2W5BcxJUUl4TPf/AggGWMI7ntczD
	9Xn60fPssaPhNx/nBow2Eg5SHSws1AvKvzF6rrQH1wTE+HQ5DVW6ysAil8+YP/S3G/jR+J
	chkDTCFLKiM/5CmVMOFXkjVJXWenAdIzOUiISDNriFyJT9tG0X6uJJpwtHXPkisctrKYWW
	5m7JTOa92XPR/fUz6y0Z7UYYYfAeEImFsE3v0TBCGtrpFuUQCMfQytrLdRkqtbluEpm8p+
	Rc8WlmBwUfbPKCW/3Z3+aJL6nN3X/6DCShwu0/o9uCvu6I+K1uKElo9HOp8l3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529213;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkymDc6m8XxBpFMYCvLbHS0VVkcbrI6VoVCY1TnGdpM=;
	b=/QAU3TU5/dthGGXOpyNlY4yGNllHn9lePg0mJmZjNdq+hsZpIpoXn6CjJ26Ri8wdzw8I0y
	cqKp3QEONDPnyPCw==
From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
Cc: "GUO Ren (XuanTie)" <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Anup Patel <anup@brainfault.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816070049.2097442-6-guoren@kernel.org>
References: <20260816070049.2097442-6-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921125.3717435.6170949779182194240.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     5b104000160dec7f01c292da1082fbe4bdd5f715
Gitweb:        https://git.kernel.org/tip/5b104000160dec7f01c292da1082fbe4bdd=
5f715
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:49=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI

IMSIC was defining its own IMSIC_NR_IPI (=3D 8) which happened to match
the architecture's IPI_MAX. Now that IPI_MAX is exported from riscv
asm/smp.h, use the architecture constant and drop the private define.

This keeps the number of multiplexed IPIs in sync with the rest of the
RISC-V IPI infrastructure.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-6-guoren@kernel.org
---
 drivers/irqchip/irq-riscv-imsic-early.c | 4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-ri=
scv-imsic-early.c
index 12efd24..823f5f2 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -67,12 +67,12 @@ static int __init imsic_ipi_domain_init(void)
 		return 0;
=20
 	/* Create IMSIC IPI multiplexing */
-	virq =3D ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
+	virq =3D ipi_mux_create(IPI_MAX, imsic_ipi_send);
 	if (virq <=3D 0)
 		return virq < 0 ? virq : -ENOMEM;
=20
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
=20
 	/* Announce that IMSIC is providing IPIs */
 	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_=
IPI_ID);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-ri=
scv-imsic-state.h
index c42ee18..878cc19 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -13,7 +13,6 @@
 #include <linux/timer.h>
=20
 #define IMSIC_IPI_ID				1
-#define IMSIC_NR_IPI				8
=20
 struct imsic_vector {
 	/* Fixed details of the vector */
