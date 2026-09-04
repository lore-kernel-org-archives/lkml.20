Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325B731AABF;
	Fri,  4 Sep 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529215; cv=none; b=RIno8eQq172G9ngAC3JtCrTTBTSbGsHl+TLeeK7qrtPYkpmHObtRKsFBSN0j7GNfiek6e3r7I4h/a7a7qPBtODE2fR0D674dyF8w0TgvupRuWfi/A/oJBX58OxM61v0ehuZf117y1kRBEEngoeTubxuqcgtYFZpawk4feuyEo1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529215; c=relaxed/simple;
	bh=FTPKXSUOM2zOi2aT86wRCgLjWwm7B4XWHPeTLiXfeFs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=JkiPS1WwgmnloXdygojsAE2joeRkEMwbxLiy2cfoJsnCaomzz+nsa5SgnF8urwVQ9xQdrXlTm2dJ5oKLl1F2QZCrtVqPX93taEqQiV5k1OKeFH4sf6J8wf/fIABhKYO2NhY3b3K5mdZvl2+7WD0GOnxOHtBWfPHWfrJZXLs6cec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ruNX14L8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vJ3xDjuK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ruNX14L8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vJ3xDjuK"
Date: Fri, 04 Sep 2026 13:40:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529211;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDTAmwV65ZBOXuRE+ui+lLPYqg+p1ChG4P/9MCXP7GI=;
	b=ruNX14L8U9oFXrNtwHDb/9bEro8xmXeR9rxbka2BGxYrUd1M9Kxf3+1K5zkcOE28x9MUwH
	WtoMJF0A3hU1XMR8oXgb0Wknk/R8iEM05vD5qV7u89lY+TRXniOj4NXeV7/v+474OEaicE
	z3gH5KCxKTipocq4VXSD/3hBKgDs+4N1k1VESXjy7mj4MRWUujyj7vFosR0zGtumCvi3jh
	XKIxqls9hi/tYC4FN+mkxk4wZqgbjqc/Cqpg4+Yoyy+d0SsP3+mpfu6qylDtv6B1cwPgp6
	7YfPhjK1a8+39ca3u6/VVY/k3AQyUTyyVj00vgSQ6Kt69jH5c/nwQdu80WIstA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529211;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDTAmwV65ZBOXuRE+ui+lLPYqg+p1ChG4P/9MCXP7GI=;
	b=vJ3xDjuKKFECPh4zBBUjf1KYO1sO/NU2g89Mf4OHTXKEDmE8nFAgg4U1VJl8SVWx2lXioK
	Ow7fmsfLXYp6wHCA==
From: "tip-bot2 for Jiangshan Yi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v5: Install root IRQ handler last in
 gicv5_init_common()
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>, Thomas Gleixner <tglx@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903104014.587068-1-yijiangshan@kylinos.cn>
References: <20260903104014.587068-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852920978.3717435.10105353589398176880.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     94713d60707bfe26c7cbc941abe26d1855448435
Gitweb:        https://git.kernel.org/tip/94713d60707bfe26c7cbc941abe26d18554=
48435
Author:        Jiangshan Yi <yijiangshan@kylinos.cn>
AuthorDate:    Thu, 03 Sep 2026 18:40:14 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:35:57 +02:00

irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()

set_handle_irq() cannot be undone: once a handler is installed, any
further call returns -EBUSY, so the set_handle_irq(NULL) in the error
path has never worked.  Drop it, and install the root handler only
after gicv5_irs_enable() has succeeded.

set_handle_irq() only fails if another root handler is already
installed, which cannot happen on a GICv5 system.  Should it ever
fail, the system is unusable: panic instead of unwinding.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/87fqzrmywu.wl-maz@kernel.org
Link: https://patch.msgid.link/20260903104014.587068-1-yijiangshan@kylinos.cn
---
 drivers/irqchip/irq-gic-v5.c |  9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423..c365f81 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_han=
dle *parent_domain)
 	if (ret)
 		goto out_int;
=20
-	ret =3D set_handle_irq(gicv5_handle_irq);
+	ret =3D gicv5_irs_enable();
 	if (ret)
 		goto out_int;
=20
-	ret =3D gicv5_irs_enable();
-	if (ret)
-		goto out_handle;
+	if (set_handle_irq(gicv5_handle_irq))
+		panic("GICv5: unable to install root IRQ handler\n");
=20
 	gicv5_smp_init();
=20
 	gicv5_irs_its_probe();
 	return 0;
=20
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
