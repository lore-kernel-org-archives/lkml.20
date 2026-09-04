Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55214A2073;
	Fri,  4 Sep 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529221; cv=none; b=EKXoWPfGIPoC4I4ORae/BRT0n5ALdCDeNzO7mnfjn9PJJH7Y/kdXPM2i9vOylLSzwUTdd3DmABqdeT1m19LDZeaw6xLwVw6iKkgkDU/WAdhbFmeLYzgJUuKdzeu+9njInwiFlGnsni4D1sHDHo9YHnKK9RAsr6502wLVmGBwXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529221; c=relaxed/simple;
	bh=XpIrUdStgcS6pAOrTDhPwgyEZoTZ8Fs2NW8ikuYC65o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uQn/Wd5+HBa8CaIUXx/vXAVj1PYxzbjylEJabj9Oij0NKKs8788/x3Y2XcmKRYB1F93ag0OFpUkiTAhgcgowSZOLwE4AdhF4ZiGEHMV3Ib4DG8zP6OQU3APgkJnrJH8hxxiAkkziS4SzSLmW4d1GWPUCkzXIU2ku2i+ZQnRvA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iGZkGQW0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6XaJ6aIx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iGZkGQW0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6XaJ6aIx"
Date: Fri, 04 Sep 2026 13:40:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529217;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsKvG4/fl49VMWXeqfXKMxlCHERrhYG1LcxTKbfjtUA=;
	b=iGZkGQW0HBsgTtHSLF/kDSrlsAWmR8E0HssWZANMdnXa+2uHbWbNZyzppKLdkd8NkUqbOk
	E/4zL6Z06x6S7OB8mprmwCpfAb2xNq+vhypXyjbaweCRqWLmhJuvDtr7mKGuyDAuU2OTTT
	Th3vrUweSjCJwpCVnFHfogIDoeDSc6/95tEGBSSqRtm9kps6cibM7hj8+OC3FzmLuZAEQE
	NEJgdzcvwS7gxiaJj4KOqrvAOx0ioEj+H03EOceRgO9KaJ6Vazrrn6RhAbEyaRylkE40uU
	bmZ7fZ84UfVeNRmSy+TGbKxgPwkLlz1KDlqqRX54dUyyKvt8YIB4nH+v/hUQfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529217;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsKvG4/fl49VMWXeqfXKMxlCHERrhYG1LcxTKbfjtUA=;
	b=6XaJ6aIxBJ5oBgGG4u+3hjunDHf709m7ANZA2BEs8hBAbra4CcoyBsMPIJR9az1JrwnGgz
	5y4CS5G1pn+WuHDw==
From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] riscv: sbi: Use IPI_MAX for SBI IPI muxing
Cc: "GUO Ren (XuanTie)" <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Anup Patel <anup@brainfault.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816070049.2097442-3-guoren@kernel.org>
References: <20260816070049.2097442-3-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921582.3717435.16198993918337406291.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     2a0d49514f297baee259b19fb5553b538aa67d10
Gitweb:        https://git.kernel.org/tip/2a0d49514f297baee259b19fb5553b538aa=
67d10
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:46=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

riscv: sbi: Use IPI_MAX for SBI IPI muxing

Now that IPI_MAX is visible from <asm/smp.h>, replace the hard-coded
BITS_PER_BYTE with the proper symbolic constant in the SBI IPI
extension driver.

No functional change; IPI_MAX is still 8.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-3-guoren@kernel.org
---
 arch/riscv/kernel/sbi-ipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559..eeec178 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -57,7 +57,7 @@ void __init sbi_ipi_init(void)
 		return;
 	}
=20
-	virq =3D ipi_mux_create(BITS_PER_BYTE, sbi_send_ipi);
+	virq =3D ipi_mux_create(IPI_MAX, sbi_send_ipi);
 	if (virq <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sbi_ipi_virq);
@@ -75,7 +75,7 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
=20
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 	pr_info("providing IPIs using SBI IPI extension\n");
=20
 	/*
