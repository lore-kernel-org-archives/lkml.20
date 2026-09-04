Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3989D4A0137;
	Fri,  4 Sep 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529219; cv=none; b=ghup9+dI6zPI7aR4jn90upG68cgoqfUKUggtL014y5jsEZijqEgH2wDdY41vmz+9c1tJv1vAgDh6zqAnOgO+CVvBE4BWA8fkSzBF3ZSMMy7cgRNdizX6KnMEXvdB9n1sDxAWugx4HqsTPUvZnD7hHpi9m/tS1fEyh1XhOsklRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529219; c=relaxed/simple;
	bh=Mlp0IrMhiB5y9jmqF6+hlpu9PVtASA7RQTc+uAeG8Qo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WzjVorerD3uPqQq/sMqxhP4vE0MQm2rpLzKKmMynKj6h6YptMcJfWGlOlluXYUUFIkxb3GLEZVBmnXJZP5uQiNlX3zChiI73LH3w61mlf3aERbGFIs0p01bgs8UQLtb/zDGCTaUIU5YlGHebwqjM1de+xL0gAwYlqvzP/taEV5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b/oGUMb9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wyCLg4eW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b/oGUMb9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wyCLg4eW"
Date: Fri, 04 Sep 2026 13:40:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529216;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fEuFQB1aNfXkD5C5dB0ThEjv12StVyI439fEtPDF3go=;
	b=b/oGUMb92Sbl8AZKbrZfU04nK+aaSrutcldrpuNM5PYmPel+vOQ0A9Y170NV3XzFxpsmLs
	WDTor4VH3V0WVWbku6c9lpEFKpfn9pOMrHiSATbcdsSo8CCgdrdSTtLI5j4rRv89tVTaDj
	i/nuO0rBrIb4Vd+YoBoigS46oepY/dzOjmL18NzmJcsQQzaQwKTLZB4dHwlpvuPbyb9huT
	CsfIGK5lZEOysFtKBp/AZGcHO7QUFLEuvbo3I/r9bX1wF+R4u3oceV0xtOMANB/co0YBrS
	7k8SKVEuMUHBARqcL5eiAkaypsx03sbobBujEHGxY8qnHBrraf4/t4OJp0671Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529216;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fEuFQB1aNfXkD5C5dB0ThEjv12StVyI439fEtPDF3go=;
	b=wyCLg4eWRWQak20sOKIsXOB1FFUi4sRW7NVdIuH9fFGrAuBY99TvJi3eVM44TKPTBRKbGo
	2Gp/00Klaw6VlECg==
From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] clocksource: clint: Use IPI_MAX for IPI muxing
Cc: "GUO Ren (XuanTie)" <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel <anup@brainfault.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816070049.2097442-4-guoren@kernel.org>
References: <20260816070049.2097442-4-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921435.3717435.8260807940254973237.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     f6326e26f60259f62ed2b172f7254d673e869cc1
Gitweb:        https://git.kernel.org/tip/f6326e26f60259f62ed2b172f7254d673e8=
69cc1
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:47=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

clocksource: clint: Use IPI_MAX for IPI muxing

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
constant is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-4-guoren@kernel.org
---
 drivers/clocksource/timer-clint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-cl=
int.c
index 0bdd9d7..e56eee7 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -243,7 +243,7 @@ static int __init clint_timer_init_dt(struct device_node =
*np)
 	}
=20
 #ifdef CONFIG_SMP
-	rc =3D ipi_mux_create(BITS_PER_BYTE, clint_send_ipi);
+	rc =3D ipi_mux_create(IPI_MAX, clint_send_ipi);
 	if (rc <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		rc =3D (rc < 0) ? rc : -ENODEV;
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node =
*np)
 	}
=20
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, IPI_MAX);
 	clint_clear_ipi();
 #endif
=20
