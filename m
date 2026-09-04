Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC2442397;
	Fri,  4 Sep 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529217; cv=none; b=ntrewb+4j8ePglpGcAN7gvxNqvjU65ydhifYGunrbw0zQ0JPQUqm+3k1bobXf49uLCIdhdQIazY8Fvo25B6c8kyC3WcEngCjONgOiI5GOt90gNYu968dmNfncTP1uJthn/z+nvksv7NznbvCp4B3KCVhTlSfjd4TDBirw3FsuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529217; c=relaxed/simple;
	bh=WaItjDJ9gSXTrsKS9Vw58uRM3fRMLiAYYglsoYFmiog=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=t38lfR3rl8VoUM9MjRJxB5K6raYtsOs8crxDwfA+9M1hWZNZCexnBRAozNX+IKgfhEI+KedM0fKSo4FU80urzArXlFLtDdQXCrf8OunofMOlGtWVnLVrrrZz3ybvctJp0TYqxIoJl84Gs+OumX9eKCjNyUdp6mQuZ2j5QdQcdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3j8uzj0Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jT7Qq4II; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3j8uzj0Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jT7Qq4II"
Date: Fri, 04 Sep 2026 13:40:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529214;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nob/r7AIKVTdcvGfLO++9tB66ZP3csOq0TV1CeF8atA=;
	b=3j8uzj0Q62TQ6xq+h01INRThaZ2uq9hMa9pwTj0GL78gD83VervVsYc9zweXFNnLMzpHbn
	DbQTbV4jNJ6V557YmkipX718pjZJmPJMPeQdI6eoZPKoJbTwFRn49sfr++4qUvzoqo1IGc
	QVuYfW6Yeli61urXjns3n+mAf3NycKaJvFK8M6tGj/8oxtLjyQeitUQl15Wrdnynmlx7px
	ak0pEGykznXqE4Lc3qN6OtwndEw/kCwO8SAOV4qUkxIG8R4Ht3h6xEDOTd9it9mYVz+lBh
	iP1dDmZJ1fT7ttaSKwlFWQTGSvPgm0zm1PkxofklZ1PKnoqHD5ckmRILa1wGjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529214;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nob/r7AIKVTdcvGfLO++9tB66ZP3csOq0TV1CeF8atA=;
	b=jT7Qq4IIdba0mdRyvB98FglJl2XXB79mbrUMErxXMhnxbhf1dGvU4E4umRxCf2wVne2kN8
	bLPp08RXm50wa5DQ==
From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
Cc: "GUO Ren (XuanTie)" <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Anup Patel <anup@brainfault.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816070049.2097442-5-guoren@kernel.org>
References: <20260816070049.2097442-5-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852921280.3717435.10779685478403190238.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     a89546503a0ee87c20ba742a58000bbe4f87fd34
Gitweb:        https://git.kernel.org/tip/a89546503a0ee87c20ba742a58000bbe4f8=
7fd34
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:48=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

irqchip/aclint-sswi: Use IPI_MAX for IPI muxing

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the constant
is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-5-guoren@kernel.org
---
 drivers/irqchip/irq-aclint-sswi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-s=
swi.c
index ca06efd..5e010fc 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -138,7 +138,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle =
*fwnode)
 	}
=20
 	/* Register SSWI irq and handler */
-	virq =3D ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
+	virq =3D ipi_mux_create(IPI_MAX, aclint_sswi_ipi_send);
 	if (virq <=3D 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
@@ -152,7 +152,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle =
*fwnode)
 			  aclint_sswi_starting_cpu,
 			  aclint_sswi_dying_cpu);
=20
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
=20
 	return 0;
 }
